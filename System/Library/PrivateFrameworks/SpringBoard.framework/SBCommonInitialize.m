@implementation SBCommonInitialize

void __SBCommonInitialize_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SBApp;
  SBApp = v0;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  __screenScale = v2;
  *(double *)&__screenMaximumFramesPerSecond = (double)objc_msgSend(v5, "maximumFramesPerSecond");
  objc_msgSend(v5, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayCornerRadius");
  __screenDisplayCornerRadius = v4;

}

@end
