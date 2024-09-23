@implementation PKGetConstantStringNFSignedPlatformData

void __PKGetConstantStringNFSignedPlatformData_block_invoke()
{
  id *v0;

  if (PKLoadNearField_loadPredicate != -1)
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_210);
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = (id *)dlsym((void *)PKLoadNearField_frameworkLibrary, "NFSignedPlatformData");
    objc_storeStrong((id *)&PKGetConstantStringNFSignedPlatformData_constant, *v0);
  }
}

@end
