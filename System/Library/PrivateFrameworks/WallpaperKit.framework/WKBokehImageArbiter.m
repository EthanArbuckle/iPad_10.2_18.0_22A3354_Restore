@implementation WKBokehImageArbiter

+ (id)imageForZ:(double)a1
{
  double v2;
  double v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  objc_opt_self();
  v2 = (a1 + 1.5) / 1.2;
  if (v2 < 0.0)
    v2 = 0.0;
  if (v2 >= 1.0)
    v3 = 0.0;
  else
    v3 = (1.0 - v2) * 9.0;
  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = imageTable[blurTable[vcvtad_u64_f64(v3)]];
  WKBundleForWallpaperKitFramework();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
