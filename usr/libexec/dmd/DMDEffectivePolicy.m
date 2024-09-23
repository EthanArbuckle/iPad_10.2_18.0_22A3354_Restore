@implementation DMDEffectivePolicy

- (NSSet)excludedIdentifiers
{
  return 0;
}

- (void)setExcludedIdentifiers:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = DMFPolicyLog(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_100075D2C(v4);

}

@end
