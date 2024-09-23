@implementation IPAAdjustmentsComeFromOSXPhotos

void __IPAAdjustmentsComeFromOSXPhotos_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("com.apple.photos"), "lowercaseString", CFSTR("com.apple.osx.photos"), CFSTR("com.apple.photos.osx"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)IPAAdjustmentsComeFromOSXPhotos_s_supportedOriginators;
  IPAAdjustmentsComeFromOSXPhotos_s_supportedOriginators = v3;

}

@end
