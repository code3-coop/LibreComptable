exports.index = (req, res) ->
  res.send "not implemented"

exports.show = (req,res) ->
  res.send "not implemented"

exports.edit = (req,res) ->
  res.send "not implemented"

exports.destroy = (req,res) ->
  res.send "not implemented"

exports.create = (req,res) ->
  console.log "In create transaction"
  console.log "Received params #{req.params}"
  if(req.params.sequence)
    sequence = req.params.sequence
  else
    sequence = 0
  dateEffective = req.params.dateEffective
  tags = req.params.tags
# BEGIN TRANSACTION 

# Create Transaction
# get transaction ID
  compteCrediteur = req.params.compteCrediteur
  compteDebiteur = req.params.compteDebiteur
  montant = req.params.montant

# Create Imputation 1: type:credit, compte compteCrediteur, montant
# Create Imputation 2: type:debit, compte compteDebiteur, montant

# END TRANSACTION 
  res.send "not implemented"
