@implementation UIView(Utilities)

- (double)ic_hairlineWidth
{
  double v1;

  objc_msgSend(a1, "ic_backingScaleFactor");
  return 1.0 / v1;
}

- (double)ic_backingScaleFactor
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(v5, "scale");
  if (v6 >= 1.0)
    v7 = v6;
  else
    v7 = 1.0;

  return v7;
}

+ (uint64_t)ic_performWithoutAnimation:()Utilities
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:");
}

+ (void)ic_performWithoutAnimationOnMainThread:()Utilities
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  performBlockOnMainThread();

}

+ (uint64_t)ic_animateWithDuration:()Utilities animations:
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", a3, 0);
}

+ (void)ic_animateWithDuration:()Utilities animations:completion:
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__UIView_Utilities__ic_animateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E5C1E830;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "animateWithDuration:animations:completion:", a4, v10, a1);

}

@end
