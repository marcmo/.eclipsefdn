local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-openbsw') {
  settings+: {
    description: "",
    name: "Eclipse OpenBSW",
    web_commit_signoff_required: false,
    members_can_fork_private_repositories: true,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      has_discussions: true,
    },
    orgs.newRepo('openbsw') {
      private: true,
      has_discussions: true,
      description: "OpenBSW: A Code-first Software Platform for Automotive Microcontrollers",
      delete_branch_on_merge: true,
      has_issues: true,
      allow_merge_commit: false,
      default_branch: "main",
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      gh_pages_build_type: "workflow",
    },
  ],
}
