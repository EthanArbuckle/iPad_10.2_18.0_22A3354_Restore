@implementation AXSProcessLoadsInvertBundlesForPerAppSmartInvert

void ___AXSProcessLoadsInvertBundlesForPerAppSmartInvert_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.springboard");
  v2[1] = CFSTR("com.apple.iMessageAppsViewService");
  v2[2] = CFSTR("com.apple.Animoji.StickersApp.MessagesExtension");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_appIDs;
  _AXSProcessLoadsInvertBundlesForPerAppSmartInvert_appIDs = v0;

}

@end
