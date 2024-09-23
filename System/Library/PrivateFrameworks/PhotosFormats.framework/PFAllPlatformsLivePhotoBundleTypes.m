@implementation PFAllPlatformsLivePhotoBundleTypes

void __PFAllPlatformsLivePhotoBundleTypes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  +[PFUniformTypeUtilities livePhotoBundleType](PFUniformTypeUtilities, "livePhotoBundleType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  +[PFUniformTypeUtilities livePhotoBundlePrivateType](PFUniformTypeUtilities, "livePhotoBundlePrivateType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PFAllPlatformsLivePhotoBundleTypes_typeIdentifiers;
  PFAllPlatformsLivePhotoBundleTypes_typeIdentifiers = v2;

}

@end
