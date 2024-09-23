@implementation PRNeedsWallpaperCaptureView

void ___PRNeedsWallpaperCaptureView_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "productType");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone10,2")) & 1) != 0)
    v1 = 1;
  else
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone10,5"));
  _PRNeedsWallpaperCaptureView_needsWallpaperCaptureView = v1;

}

@end
