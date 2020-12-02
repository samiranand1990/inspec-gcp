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
require 'gcp_backend'
require 'google/sql/property/databaseinstance_disk_encryption_configuration'
require 'google/sql/property/databaseinstance_disk_encryption_status'
require 'google/sql/property/databaseinstance_failover_replica'
require 'google/sql/property/databaseinstance_ip_addresses'
require 'google/sql/property/databaseinstance_replica_configuration'
require 'google/sql/property/databaseinstance_replica_configuration_mysql_replica_configuration'
require 'google/sql/property/databaseinstance_server_ca_cert'
require 'google/sql/property/databaseinstance_settings'
require 'google/sql/property/databaseinstance_settings_backup_configuration'
require 'google/sql/property/databaseinstance_settings_database_flags'
require 'google/sql/property/databaseinstance_settings_ip_configuration'
require 'google/sql/property/databaseinstance_settings_ip_configuration_authorized_networks'

# A provider to manage Cloud SQL resources.
class PostgreSQLDatabaseLogCheckPointInstance < GcpResourceBase
  name 'google_postgre_sql_database_log_checkpoints_instance'
  desc 'DatabaseInstance'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :backend_type
  attr_reader :connection_name
  attr_reader :database_version
  attr_reader :failover_replica
  attr_reader :instance_type
  attr_reader :ip_addresses
  attr_reader :ipv6_address
  attr_reader :master_instance_name
  attr_reader :max_disk_size
  attr_reader :name
  attr_reader :region
  attr_reader :replica_configuration
  attr_reader :settings
  attr_reader :gce_zone
  attr_reader :state
  attr_reader :disk_encryption_configuration
  attr_reader :disk_encryption_status
  attr_reader :server_ca_cert

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @backend_type = @fetched['backendType']
    @connection_name = @fetched['connectionName']
    @database_version = @fetched['databaseVersion']
    @failover_replica = GoogleInSpec::SQL::Property::DatabaseInstanceFailoverReplica.new(@fetched['failoverReplica'], to_s)
    @instance_type = @fetched['instanceType']
    @ip_addresses = GoogleInSpec::SQL::Property::DatabaseInstanceIpAddressesArray.parse(@fetched['ipAddresses'], to_s)
    @ipv6_address = @fetched['ipv6Address']
    @master_instance_name = @fetched['masterInstanceName']
    @max_disk_size = @fetched['maxDiskSize']
    @name = @fetched['name']
    @region = @fetched['region']
    @replica_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceReplicaConfiguration.new(@fetched['replicaConfiguration'], to_s)
    @settings = GoogleInSpec::SQL::Property::DatabaseInstanceSettings.new(@fetched['settings'], to_s)
    @gce_zone = @fetched['gceZone']
    @state = @fetched['state']
    @disk_encryption_configuration = GoogleInSpec::SQL::Property::DatabaseInstanceDiskEncryptionConfiguration.new(@fetched['diskEncryptionConfiguration'], to_s)
    @disk_encryption_status = GoogleInSpec::SQL::Property::DatabaseInstanceDiskEncryptionStatus.new(@fetched['diskEncryptionStatus'], to_s)
    @server_ca_cert = GoogleInSpec::SQL::Property::DatabaseInstanceServerCaCert.new(@fetched['serverCaCert'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "DatabaseInstance #{@params[:database]}"
  end

  def log_checkpoints?
    puts(@settings)
    puts(@settings&.database_flags)
    return false if !@settings&.database_flags.size.zero?
    @settings&.database_flags.each do |database_flag|
      puts(database_flag)
      # require 'pry';binding.pry
      next unless database_flag.name.to_s.casecmp('log_checkpoints')
      return true if database_flag.value.to_s.casecmp('off')
    end
    false
  end

  private

  def product_url(_ = nil)
    'https://www.googleapis.com/sql/v1beta4/'
  end

  def resource_base_url
    'projects/{{project}}/instances/{{database}}'
  end
end
