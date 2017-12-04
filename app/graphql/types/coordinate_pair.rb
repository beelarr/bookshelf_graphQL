Types::CoordinatePair = GraphQL::ObjectType.define do
  name 'PairType'
  description 'Pair of cordinates for Authors'

  field :latitiude, types.Float do
    resolve -> (o, _, _) { o.first }
  end
  field :longitude, types.Float do
    resolve -> (o, _, _) { o.last }
  end
end