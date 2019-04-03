# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
module GoogleInSpec
  module Container
    module Property
      class RegionalNodePoolAutoscaling
        attr_reader :enabled

        attr_reader :min_node_count

        attr_reader :max_node_count

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enabled = args['enabled']
          @min_node_count = args['minNodeCount']
          @max_node_count = args['maxNodeCount']
        end

        def to_s
          "#{@parent_identifier} RegionalNodePoolAutoscaling"
        end
      end
    end
  end
end
