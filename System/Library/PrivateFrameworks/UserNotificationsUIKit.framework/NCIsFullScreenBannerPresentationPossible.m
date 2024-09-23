@implementation NCIsFullScreenBannerPresentationPossible

void ___NCIsFullScreenBannerPresentationPossible_block_invoke()
{
  char v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "userInterfaceIdiom") == 1)
    v0 = 0;
  else
    v0 = _os_feature_enabled_impl();
  _NCIsFullScreenBannerPresentationPossible___isFullScreenBannerPresentationPossible = v0;

}

@end
