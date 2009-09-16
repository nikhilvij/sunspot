module Sunspot
  module Query
    #
    # A dynamic query is a proxy object that implements the API of the FieldQuery
    # class, but wraps a dynamic field factory and thus applies the query
    # components using dynamic field instances.
    #--
    # Dynamic queries do not hold their own state, but rather proxy to the query
    # that generated them, adding components directly to the owning query's
    # internal state.
    #++
    # DynamicQuery instances are publicly generated by the Query#dynamic_query
    # factory method.
    # 
    class DynamicQuery < FieldQuery #:nodoc:
      def initialize(dynamic_field_factory, query) #:nodoc:
        super(dynamic_field_factory)
        @query = query
      end
      
      # 
      # This has the same effect as calling Query#exclude_instance; it is
      # included for interface completeness.
      #
      def exclude_instance(instance)
        @query.exclude_instance(instance)
      end

      # 
      # This has the same effect as calling Query#exclude_instance; it is
      # included for interface completeness.
      #
      def dynamic_query(field_name)
        @query.dynamic_query(field_name)
      end

      # 
      # Add a Sort to the query
      #
      def add_sort(sort) #:nodoc:
        @query.add_sort(sort)
      end

      # 
      # Add a component to the query
      #
      def add_component(component) #:nodoc:
        @query.add_component(component)
      end

      private
      
      # 
      # So query facets can be added to the query from within dynamic queries
      #
      def query_facets
        @query.query_facets
      end
    end
  end
end
