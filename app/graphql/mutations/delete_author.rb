class Mutations::DeleteAuthor < GraphQL::Function
  argument :id, types.ID

  #return for class
  type types.Boolean

  def call(obj, args, ctx)
    author = Author.find(args.id)
    !!author.destroy  #!! converts nill to false value, but doesn't affect a true value
  end
end