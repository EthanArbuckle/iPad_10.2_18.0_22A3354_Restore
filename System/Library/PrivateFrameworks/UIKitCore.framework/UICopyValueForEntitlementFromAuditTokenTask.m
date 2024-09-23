@implementation UICopyValueForEntitlementFromAuditTokenTask

SecTaskRef __UICopyValueForEntitlementFromAuditTokenTask_block_invoke(uint64_t a1)
{
  _OWORD *v1;
  __int128 v2;
  audit_token_t v4;

  v1 = *(_OWORD **)(a1 + 32);
  v2 = v1[1];
  *(_OWORD *)v4.val = *v1;
  *(_OWORD *)&v4.val[4] = v2;
  return SecTaskCreateWithAuditToken(0, &v4);
}

@end
