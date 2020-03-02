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

title 'Test GCP google_iam_organization_custom_role resource.'

gcp_organization_id = attribute(:gcp_organization_id, default: gcp_organization_id, description: 'The identifier of the organization that is the parent of the folder')
gcp_organization_iam_custom_role_id = attribute(:gcp_organization_iam_custom_role_id, default: 'gcp_organization_iam_custom_role_id', description: 'The IAM custom role identifier.')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default:0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
control 'google_iam_organization_custom_role-1.0' do
  impact 1.0
  title 'google_iam_organization_custom_role resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  describe google_iam_organization_custom_role(org_id: gcp_organization_id, name: gcp_organization_iam_custom_role_id) do
    it { should exist }
    its('stage') { should eq 'GA' }
    its('included_permissions') { should eq ["iam.roles.list"] }
  end

  describe google_iam_organization_custom_role(org_id: gcp_organization_id, name: gcp_organization_iam_custom_role_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
