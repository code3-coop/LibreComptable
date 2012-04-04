transactions = [{numero:"12345", type:"Nouveau Patron", montant:"250.00"}
  ,{numero:"123", type:"Renouvellement", montant:"250000.00"}
  ,{numero:"9999", type:"Renouvellement", montant:"30000.00"}]

exports.index = (req, res) ->
  switch req.format
    when 'json' then res.send transactions
    else
      res.contentType 'txt'
      res.send transactions

exports.show = (req,res) ->
  console.log "params:"+req
  res.send transactions[req.params.transaction]

exports.edit = (req,res) ->
  res.send "Editing transaction"

exports.destroy = (req,res) ->
  res.send "Destroying transaction"
