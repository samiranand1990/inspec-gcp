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

title 'Test GCP google_project resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
control 'google_project-1.0' do
  impact 1.0
  title 'google_project resource test'

  describe google_project(project: gcp_project_id) do
    it { should exist }
    its('project_id') { should cmp gcp_project_id }
    its('lifecycle_state') { should cmp 'ACTIVE' }
  end
end
