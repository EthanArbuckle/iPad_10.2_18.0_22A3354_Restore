@implementation PBUIBokehImageArbiter

+ (uint64_t)bokehImageForDiameter:(double)a1
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = a1 / 1.5;
  if (v3 != 1)
    v4 = a1;
  v5 = (v4 + -40.0) / -130.0 + 1.0;
  if (v5 < 0.0)
    v5 = 0.0;
  if (v5 >= 1.0)
    v6 = 11.0;
  else
    v6 = v5 * 11.0;
  return blurTable[vcvtad_u64_f64(v6)];
}

+ (id)imageForBokehImage:(uint64_t)a1
{
  void *v3;
  __CFString *v4;
  void *v5;
  _QWORD v7[5];

  objc_opt_self();
  +[PBUIWallpaperCache wallpaperCache](PBUIWallpaperCache, "wallpaperCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = imageTable[a2];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PBUIBokehImageArbiter_imageForBokehImage___block_invoke;
  v7[3] = &__block_descriptor_40_e18___UIImage_16__0_Q8l;
  v7[4] = a2;
  objc_msgSend(v3, "imageForKey:generatingIfNecessaryWithBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __44__PBUIBokehImageArbiter_imageForBokehImage___block_invoke(uint64_t a1)
{
  void *v1;
  __CFString *v2;

  v1 = (void *)MEMORY[0x1E0CEA638];
  v2 = imageTable[*(_QWORD *)(a1 + 32)];
  if (_PBUIBundle___onceToken != -1)
    dispatch_once(&_PBUIBundle___onceToken, &__block_literal_global_20);
  return objc_msgSend(v1, "imageNamed:inBundle:compatibleWithTraitCollection:", v2, _PBUIBundle___paperBoardUIBundle, 0);
}

@end
