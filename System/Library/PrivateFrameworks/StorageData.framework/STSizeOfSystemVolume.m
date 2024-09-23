@implementation STSizeOfSystemVolume

void __STSizeOfSystemVolume_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v0 = STVolumeSize("/");
  v1 = STVolumeSize("/private/preboot") + v0;
  STSizeOfPathWithOptions(CFSTR("/private/var/.overprovisioning_file"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  STSizeOfSystemVolume__gSystemSize = v1 + objc_msgSend(v2, "unsignedLongLongValue");

}

@end
