require 'chef/provider/lwrp_base'
require_relative 'provider_source'

class Chef
  class Provider
    class SumoSourceDocker < Chef::Provider::SumoSource
      Chef::Resource.provides :sumo_source_docker

      def config_hash
        hash = super
        hash['source']['uri'] = new_resource.uri
        hash['source']['specifiedContainers'] = new_resource.specified_containers unless new_resource.specified_containers.nil?
        hash['source']['allContainers'] = new_resource.all_containers
        hash['source']['certPath'] = new_resource.cert_path unless new_resource.cert_path.nil?
        hash['source']['sourceType'] = source_type_map[new_resource.source_type]
        hash['source']['collectEvents'] = new_resource.collect_events unless new_resource.collect_events.nil?
        hash
      end
    end
  end
end
