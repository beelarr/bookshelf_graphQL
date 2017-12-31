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
