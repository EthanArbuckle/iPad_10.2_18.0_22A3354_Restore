@implementation NSURL

uint64_t __61__NSURL_QueryParameters__URLByDeletingQueryParameterWithKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void __53__NSURL_TUSanitizedCopying__tu_defaultAllowedSchemes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("https"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tu_defaultAllowedSchemes_defaultAllowedSchemes;
  tu_defaultAllowedSchemes_defaultAllowedSchemes = v0;

}

@end
