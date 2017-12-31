Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    argument :name, types.String, "Enter your name"
    description "A greeting dynamically populated by the name entered"
    resolve ->(obj, args, ctx) {
      Rails.logger.info args.inspect
      "Hello #{args.name}!"
    }
  end


  field :login, types.String do
    argument :email, types.String
    argument :password, types.String
    description "One email and password as strings"
    resolve -> (_, args, _) {
      user = User.where(email: args[:email]).first
      # if the user is authenticated via password then a session is created and key via session model
      user.sessions.create.key if user.try(:authenticate, args[:password])
    }
  end


# Exposes to frontend
  field :author, Types::AuthorType do
    argument :id, types.ID
    description "One Author"
    resolve -> (obj, args, ctx) {
      Author.where(id: args[:id]).first
    }
  end

  field :all_authors, types[Types::AuthorType] do
    description 'All of the authors in the database'
    resolve -> (_, _, _) {
      Author.all
    }
  end
end
