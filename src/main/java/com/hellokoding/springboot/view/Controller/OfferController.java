package com.hellokoding.springboot.view.Controller;

import com.hellokoding.springboot.view.Model.Offer;
import com.hellokoding.springboot.view.Repository.OfferRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class OfferController {

    @Autowired
    private OfferRepository offerRepository;

    @GetMapping({"/", "/offer"})
    public ModelAndView showOfferForm() {
        return new ModelAndView("addOffer", "offer", new Offer());
    }

    @GetMapping("/offers")
    public ModelAndView showAllOfers() {
        List<Offer> offers = offerRepository.findAll();
        return new ModelAndView("offers", "offers", offers);
    }

    @RequestMapping(value = "/addOffer", method = RequestMethod.POST)
    public ModelAndView submit(@Valid @ModelAttribute("offer") Offer offer,
                         BindingResult result, ModelMap model) {
        if (!result.hasErrors()) {
            offerRepository.save(offer);
        }
        return new ModelAndView("addOffer", "offer", new Offer());
    }

    @ResponseBody
    @RequestMapping(value = "/changeOfferState", method = RequestMethod.POST, consumes="application/json")
    public ResponseEntity<?> saveHosting(@RequestParam(value="mode") int mode, @RequestBody Offer offerRequest) {
       Optional<Offer> optionalOffer = offerRepository.findById(offerRequest.getId());
       if (optionalOffer.isPresent()) {
           Offer offer = optionalOffer.get();
           offer.setVerified(true);
           boolean offerApproval = mode == 1;
           offer.setApproved(offerApproval);
           offerRepository.save(offer);
           return new ResponseEntity(HttpStatus.OK);
       }
       return new ResponseEntity(HttpStatus.NOT_FOUND);
    }
}
