Types::UserType = GraphQL::ObjectType.define do
  "UserType"

  field :email, !types.String
  field :is_superadmin, types.Booleang
  field :id, types.ID
end