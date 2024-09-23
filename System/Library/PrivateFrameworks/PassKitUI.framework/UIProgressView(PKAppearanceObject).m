@implementation UIProgressView(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v5);

  objc_msgSend(a1, "tintColorDidChange");
  objc_msgSend(v4, "progressBarTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setProgressTintColor:", v6);

  objc_msgSend(v4, "progressBarTrackTintColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTrackTintColor:", v7);
}

@end
