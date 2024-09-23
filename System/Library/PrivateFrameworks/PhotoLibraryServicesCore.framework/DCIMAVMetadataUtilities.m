@implementation DCIMAVMetadataUtilities

+ (id)metadataItemForTimelapse
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
  objc_msgSend(v2, "setKey:", CFSTR("com.apple.photos.captureMode"));
  objc_msgSend(v2, "setValue:", CFSTR("Time-lapse"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

@end
