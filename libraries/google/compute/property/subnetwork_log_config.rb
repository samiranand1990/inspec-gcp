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
  module Compute
    module Property
      class SubnetworkLogConfig
        attr_reader :enable

        attr_reader :aggregation_interval

        attr_reader :flow_sampling

        attr_reader :metadata

        attr_reader :metadata_fields

        attr_reader :filter_expr

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enable = args['enable']
          @aggregation_interval = args['aggregationInterval']
          @flow_sampling = args['flowSampling']
          @metadata = args['metadata']
          @metadata_fields = args['metadataFields']
          @filter_expr = args['filterExpr']
        end

        def to_s
          "#{@parent_identifier} SubnetworkLogConfig"
        end
      end
    end
  end
end
