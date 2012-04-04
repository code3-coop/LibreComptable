(function() {

  exports.index = function(req, res) {
    switch (req.format) {
      case 'json':
        return res.send(['transaction1', 'transaction2', 'transaction3']);
      default:
        res.contentType('txt');
        return res.send("transaction1,transaction2,transaction3");
    }
  };

  exports.show = function(req, res) {
    return res.send("Showing transaction");
  };

  exports.edit = function(req, res) {
    return res.send("Editing transaction");
  };

  exports.destroy = function(req, res) {
    return res.send("Destroying transaction");
  };

}).call(this);
