@implementation PFRoleManifest

id __36___PFRoleManifest_rawSupportedRoles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (PFPosterRoleIsValid(v2))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void __38___PFRoleManifest_knownSupportedRoles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  PFProvidersForRole(v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

@end
