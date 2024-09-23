@implementation LSPropertyList(PFAdditions)

- (id)pf_supportedRoles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pf_roleManifest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pf_supportedRoles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pf_defaultRole
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pf_roleManifest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pf_defaultRole");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
