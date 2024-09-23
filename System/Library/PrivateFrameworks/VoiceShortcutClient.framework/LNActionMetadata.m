@implementation LNActionMetadata

uint64_t __80__LNActionMetadata_ShouldPrewarmAppLaunch__wf_shouldPrewarmAppLaunchWithAction___block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

BOOL __80__LNActionMetadata_ShouldPrewarmAppLaunch__wf_shouldPrewarmAppLaunchWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  v2 = a2;
  if ((objc_msgSend(v2, "isOptional") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "typeSpecificMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D43AD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5 == 0;

  }
  return v3;
}

@end
