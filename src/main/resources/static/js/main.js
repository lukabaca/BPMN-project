$(document).ready(function () {
    $('.accept-btn').on('click', function () {
        let offerId = $(this).closest('tr').attr('row-id');
        let data = {
            id: offerId
        };
        data = JSON.stringify(data);
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/changeOfferState?mode=" + 1,
            data: data,
            dataType: 'json',
            timeout: 600000,
            success: function (data) {
                location.reload();
            },
            error: function (e) {
                location.reload();
            }
        });
    });

    $('.refuse-btn').on('click', function () {
        let offerId = $(this).closest('tr').attr('row-id');
        let data = {
            id: offerId
        };
        data = JSON.stringify(data);
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/changeOfferState?mode=" + 0,
            data: data,
            dataType: 'json',
            timeout: 600000,
            success: function (data) {
                location.reload();
            },
            error: function (e) {
                location.reload();
            }
        });
    });
});