@implementation IPAAdjustmentsComeFromSupportedApp

void __IPAAdjustmentsComeFromSupportedApp_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("com.apple.photos"), "lowercaseString", CFSTR("com.apple.osx.photos"), CFSTR("com.apple.photos.osx"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v1;
  objc_msgSend(CFSTR("com.apple.mobileslideshow"), "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  objc_msgSend(CFSTR("com.apple.camera"), "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)IPAAdjustmentsComeFromSupportedApp_s_supportedOriginators;
  IPAAdjustmentsComeFromSupportedApp_s_supportedOriginators = v5;

}

@end
