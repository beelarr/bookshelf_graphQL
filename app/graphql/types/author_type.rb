Types::AuthorInputType = GraphQL::InputObjectType.define do
  name 'AuthorInputType'
  description 'Properties for createing or updating an Author'

  argument :first_name, types.String
  argument :last_name, types.String
  argument :birth_year, types.Int
  argument :is_alive, types.Boolean

end




Types::AuthorType = GraphQL::ObjectType.define do
  name "AuthorType"

  field :first_name, !types.String #bang means non-nullable field
  field :last_name, types.String
  field :birth_year, types.Int
  field :is_alive, types.Boolean
  field :id, types.ID

  field :full_name, types.String do
    description 'The authors full name'
    # _ can be used for unused arguments - saves memeory
    resolve ->(o,_,_) { [o.first_name, o.last_name].compact.join(' ')}
  end

  field :coordinates, Types::CoordinatePair do
    description 'The coordinates for the author'
  end

  field :publication_years, types[types.Int]  # Type of Array of Integer Values



end