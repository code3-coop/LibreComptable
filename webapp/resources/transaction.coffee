exports.index = (req, res) ->
  switch req.format
    when 'json' then res.send ['transaction1', 'transaction2', 'transaction3']
    else
      res.contentType 'txt'
      res.send "transaction1,transaction2,transaction3"

exports.show = (req,res) ->
  res.send "Showing transaction"

exports.edit = (req,res) ->
  res.send "Editing transaction"

exports.destroy = (req,res) ->
  res.send "Destroying transaction"
