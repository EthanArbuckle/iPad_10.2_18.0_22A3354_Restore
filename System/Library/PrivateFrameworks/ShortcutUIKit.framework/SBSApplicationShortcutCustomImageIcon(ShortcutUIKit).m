@implementation SBSApplicationShortcutCustomImageIcon(ShortcutUIKit)

- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_5;
  v3 = objc_msgSend(a1, "dataType");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  if (v3 == 1)
  {
    objc_msgSend(a1, "_scui_iconImageForCachedBitmapData:scale:", v2, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:scale:", v2, v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;
LABEL_8:
  if (objc_msgSend(a1, "isTemplate"))
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v8, "imageWithRenderingMode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_scui_iconImageForCachedBitmapData:()ShortcutUIKit scale:
{
  uint64_t v2;
  CGImage *v3;
  void *v4;

  v2 = LICreateIconFromCachedBitmap();
  if (v2)
  {
    v3 = (CGImage *)v2;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v2, 0, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
