@implementation SBSUIWallpaperGetOverlay

void __SBSUIWallpaperGetOverlay_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CEA478];
  v3 = a2;
  objc_msgSend(v2, "colorWithRed:green:blue:alpha:", 0.3, 0.3, 0.3, 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  objc_msgSend(v3, "format");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "fillRect:");

}

@end
