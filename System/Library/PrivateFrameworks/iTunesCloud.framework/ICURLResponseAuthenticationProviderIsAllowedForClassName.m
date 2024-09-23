@implementation ICURLResponseAuthenticationProviderIsAllowedForClassName

void ___ICURLResponseAuthenticationProviderIsAllowedForClassName_block_invoke()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNames;
  _ICURLResponseAuthenticationProviderIsAllowedForClassName_sAllowableAuthenticationProviderClassNames = v4;

}

@end
