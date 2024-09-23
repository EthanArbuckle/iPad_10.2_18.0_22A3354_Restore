@implementation SBAnimationUtilities

+ (id)animationSettingsForRotationFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4 withContext:(id)a5
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  int IsLandscape;
  int IsPortrait;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(a5, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "duration");
  v9 = v8;
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "medusa1oSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rotationSlowdownFactor");
  v13 = v9 * v12;

  if (a3 != a4)
  {
    if (BSInterfaceOrientationIsLandscape())
      IsLandscape = BSInterfaceOrientationIsLandscape();
    else
      IsLandscape = 0;
    IsPortrait = BSInterfaceOrientationIsPortrait();
    if (IsPortrait)
      IsPortrait = BSInterfaceOrientationIsPortrait();
    v16 = 1.0;
    if (IsLandscape | IsPortrait)
      v16 = 2.0;
    v13 = v13 * v16;
  }
  v17 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(v7, "timingFunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "settingsWithDuration:timingFunction:", v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)animationSettingsForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  objc_msgSend(v6, "medusa1oSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rotationSlowdownFactor");
  v11 = v10;

  v12 = (unint64_t)(a3 - 1) <= 1 && (unint64_t)(a4 - 1) < 2;
  if ((unint64_t)(a3 - 3) <= 1)
    v13 = (unint64_t)(a4 - 3) < 2;
  else
    v13 = v12;
  if (a3 != a4 && v13)
  {
    v14 = dbl_1D0E89410[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1] * v11;
    v15 = v14 + v14;
  }
  else
  {
    v15 = dbl_1D0E89410[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1] * v11;
  }
  v16 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "settingsWithDuration:delay:timingFunction:", v17, v15, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (double)adjustedRotationAnimationDurationForDuration:(double)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  uint64_t v6;
  unint64_t v7;
  double v8;

  v6 = XBRotationDegreesForInterfaceOrientationRotation();
  if (v6 >= 0)
    v7 = v6;
  else
    v7 = -v6;
  if (v7 >= 0x5B)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "windowRotationDuration");
    if (v8 < a3)
      return a3 * 0.5;
  }
  return a3;
}

@end
