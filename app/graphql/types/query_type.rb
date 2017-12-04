Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    argument :name, types.String, "Enter your name"
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      Rails.logger.info args.inspect
      "Hello #{args[:name]}!"
    }
  end

end
