@implementation PUWallpaperPosterMotionEffect

- (PUWallpaperPosterMotionEffect)init
{
  PUWallpaperPosterMotionEffect *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperPosterMotionEffect;
  v2 = -[UIMotionEffect init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38D0]), "initWithKeyPath:type:", CFSTR("focusDirectionX"), 0);
    objc_msgSend(v3, "setMinimumRelativeValue:", &unk_1E59BC650);
    objc_msgSend(v3, "setMaximumRelativeValue:", &unk_1E59BC660);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC38D0]), "initWithKeyPath:type:", CFSTR("focusDirectionY"), 1);
    objc_msgSend(v4, "setMinimumRelativeValue:", &unk_1E59BC650);
    objc_msgSend(v4, "setMaximumRelativeValue:", &unk_1E59BC660);
    v8[0] = v3;
    v8[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMotionEffectGroup setMotionEffects:](v2, "setMotionEffects:", v5);

  }
  return v2;
}

- (CGPoint)parallaxVectorFromKeyPathsAndRelativeValues:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("focusDirectionX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("focusDirectionY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = v6;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

@end
