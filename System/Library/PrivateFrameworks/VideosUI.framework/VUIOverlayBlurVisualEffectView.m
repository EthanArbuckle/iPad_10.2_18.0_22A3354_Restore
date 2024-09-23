@implementation VUIOverlayBlurVisualEffectView

+ (id)overlayVisualEffect
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3F58]);
  +[_VUIBlurEffect effectWithStyle:](_VUIBlurEffect, "effectWithStyle:", 4007);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEffect:", v3);

  return v4;
}

+ (id)blurViewWithEffect:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0DC3F58]);
  +[_VUIBlurEffect effectWithStyle:](_VUIBlurEffect, "effectWithStyle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);

  return v6;
}

@end
