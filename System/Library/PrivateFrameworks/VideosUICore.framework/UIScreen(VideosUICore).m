@implementation UIScreen(VideosUICore)

+ (uint64_t)vui_main
{
  return objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
}

- (BOOL)vui_canRepresentDisplayGamutP3
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "displayGamut") == 1;

  return v2;
}

@end
