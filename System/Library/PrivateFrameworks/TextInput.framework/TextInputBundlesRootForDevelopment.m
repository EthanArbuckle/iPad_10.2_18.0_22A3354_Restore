@implementation TextInputBundlesRootForDevelopment

void ___TextInputBundlesRootForDevelopment_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  TIGetTextInputFrameworkPath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingLastPathComponent");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/System/Library/PrivateFrameworks");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0 && (objc_msgSend(v0, "isEqualToString:", v1) & 1) == 0)
    objc_storeStrong((id *)&_TextInputBundlesRootForDevelopment_bundlesRoot, v0);

}

@end
