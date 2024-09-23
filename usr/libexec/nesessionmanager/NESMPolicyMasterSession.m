@implementation NESMPolicyMasterSession

- (NESMPolicyMasterSession)init
{
  __assert_rtn("-[NESMPolicyMasterSession init]", "NESMPolicySession.m", 84, "0");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionsWithLoopbackPolicies, 0);
  objc_storeStrong((id *)&self->_skipPrivacyProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleFilterPolicyIDs, 0);
  objc_storeStrong((id *)&self->_policySessionLow, 0);
  objc_storeStrong((id *)&self->_policySession, 0);
}

@end
