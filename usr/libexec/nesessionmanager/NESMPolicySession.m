@implementation NESMPolicySession

- (NESMPolicySession)init
{
  __assert_rtn("-[NESMPolicySession init]", "NESMPolicySession.m", 389, "0");
}

- (void)dealloc
{
  const char *v3;
  const char *v4;
  const char *v5;
  id Property;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  sub_10002C3A4((uint64_t)self);
  sub_10002C404((uint64_t)self);
  sub_10002C464((uint64_t)self);
  sub_10002C4C4((uint64_t)self);
  sub_10002C524(self, v3);
  sub_10002C5A0((uint64_t)self);
  sub_10002C600(self, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (self)
    Property = objc_getProperty(self, v5, 184, 1);
  else
    Property = 0;
  v7 = Property;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        sub_10002C70C(self, v12);
        sub_10002C7C4(self, v12);
        sub_10002C87C(self, v12);
        sub_10002C934((uint64_t)self, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v13.receiver = self;
  v13.super_class = (Class)NESMPolicySession;
  -[NESMPolicySession dealloc](&v13, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationExceptionPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleMulticastAppUUIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleAllowMulticastPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleSilentDenyMulticastPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleDenyMulticastPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfaceTunnelPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfaceControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfaceDropControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_defaultDropPolicyIDsLow, 0);
  objc_storeStrong((id *)&self->_defaultDropExcludsionPolicyIDsLow, 0);
  objc_storeStrong((id *)&self->_dnsPolicyIDs, 0);
  objc_storeStrong((id *)&self->_NexusPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowSkipPolicyIDs, 0);
  objc_storeStrong((id *)&self->_skipPolicyIDs, 0);
  objc_storeStrong((id *)&self->_dropControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowOnDemandPolicyIDs, 0);
  objc_storeStrong((id *)&self->_onDemandPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowTunnelPolicyIDs, 0);
  objc_storeStrong((id *)&self->_tunnelPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_controlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_policyIDsLow, 0);
  objc_storeStrong((id *)&self->_policyIDs, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
}

@end
