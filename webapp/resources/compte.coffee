pg = require "pg"
connection = "tcp://librecomptable:librecomptable@localhost/librecomptable"

exports.index = (req, res) ->
  res.send "Not implemented"

exports.show = (req,res) ->
  console.log "Requesting account : " + req.params.compte
  pg.connect(connection, (err, client)->
    client.query("select * from compte where compte_id = $1 ", [req.params.compte], (err, result)->
      res.send result.rows
    )
  )

exports.solde = (req,res) ->
  console.log "Requesting solde of account : " + req.params.compte
  tagsQuery = ""

  if(req.query.tags)
    tags = req.query.tags.split ","
    for tag in tags
      tagsQuery += " AND '#{tag}' = ANY (tags)" 
#TODO ne pas ouvlier de filtrer sur les dates effectives!
  query = """
    SELECT sum (
      CASE WHEN type='debit' THEN -montant
      WHEN type='credit' THEN montant
      END
    ) / 100 as solde
    FROM imputation 
      JOIN transaction ON imputation.transaction_id = transaction.transaction_id 
    WHERE 
     compte_id = $1
     #{tagsQuery}
  """

  pg.connect(connection, (err, client)->
    client.query(query, [req.params.compte], (err, result)->
      res.send result.rows[0]
    )
  )

exports.edit = (req,res) ->
  res.send "Not implemented"

exports.destroy = (req,res) ->
  res.send "Not implemented"
