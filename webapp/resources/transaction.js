(function() {
  var transactions;

  transactions = [
    {
      numero: "12345",
      type: "Nouveau Patron",
      montant: "250.00"
    }, {
      numero: "123",
      type: "Renouvellement",
      montant: "250000.00"
    }, {
      numero: "9999",
      type: "Renouvellement",
      montant: "30000.00"
    }
  ];

  exports.index = function(req, res) {
    switch (req.format) {
      case 'json':
        return res.send(transactions);
      default:
        res.contentType('txt');
        return res.send(transactions);
    }
  };

  exports.show = function(req, res) {
    console.log("params:" + req);
    return res.send(transactions[req.params.transaction]);
  };

  exports.edit = function(req, res) {
    return res.send("Editing transaction");
  };

  exports.destroy = function(req, res) {
    return res.send("Destroying transaction");
  };

}).call(this);
