@implementation TVRCPointSizeOfSiriRemoteOnMainScreen

void ___TVRCPointSizeOfSiriRemoteOnMainScreen_block_invoke()
{
  double v0;
  double v1;
  int v2;
  _BOOL4 v3;
  double v4;
  id v5;
  CGRect v6;
  CGRect v7;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v1 = v0;
  v2 = MGGetSInt32Answer();
  objc_msgSend(v5, "nativeBounds");
  v7.size.width = 1080.0;
  v7.size.height = 1920.0;
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v3 = CGRectEqualToRect(v6, v7);
  v4 = (double)v2;
  if (v3)
    v4 = 401.0;
  _TVRCPointSizeOfSiriRemoteOnMainScreen_size_0 = round(v4 * 1.4723 / v1);
  _TVRCPointSizeOfSiriRemoteOnMainScreen_size_1 = round(v4 * 1.6 / v1);

}

@end
