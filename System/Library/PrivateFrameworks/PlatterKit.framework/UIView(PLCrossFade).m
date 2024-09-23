@implementation UIView(PLCrossFade)

- (void)pl_performCrossFadeIfNecessary
{
  unint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationCurve");
    PLCAMediaTimingFunctionForViewAnimationCurve(v2, v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimingFunction:", v7);

    objc_msgSend(v9, "setType:", *MEMORY[0x1E0CD3170]);
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
    objc_msgSend(v9, "setDuration:");
    objc_msgSend(a1, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("crossFade"));

  }
}

@end
