Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createAuthor, function: Mutations::CreateAuthor.new
  field :updateAuthor, function: Mutations::UpdateAuthor.new
  field :deleteAuthor, function: Mutations::DeleteAuthor.new

  field :logout, types.Boolean do
    resolve -> (_, _, ctx) { Session.where(key: ctx.session_key).destroy_all}
  end
end
