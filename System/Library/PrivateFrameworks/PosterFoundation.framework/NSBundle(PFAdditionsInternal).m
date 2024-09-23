@implementation NSBundle(PFAdditionsInternal)

- (_PFRoleManifest)pf_roleManifest
{
  _PFRoleManifest *v2;
  _PFRoleManifest *v3;
  void *v4;

  objc_getAssociatedObject(a1, "roleManifest");
  v2 = (_PFRoleManifest *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [_PFRoleManifest alloc];
    objc_msgSend(a1, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[_PFRoleManifest initWithInfoDictionary:](v3, "initWithInfoDictionary:", v4);

    objc_setAssociatedObject(a1, "roleManifest", v2, (void *)1);
  }
  return v2;
}

@end
