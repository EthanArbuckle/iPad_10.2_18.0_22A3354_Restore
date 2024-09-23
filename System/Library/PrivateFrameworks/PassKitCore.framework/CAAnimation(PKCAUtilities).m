@implementation CAAnimation(PKCAUtilities)

- (void)pkui_setDidStartHandler:()PKCAUtilities
{
  PKUIAnimationDelegate *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "delegate");
  v4 = (PKUIAnimationDelegate *)objc_claimAutoreleasedReturnValue();
  if (v5 && !v4)
  {
    v4 = objc_alloc_init(PKUIAnimationDelegate);
    objc_msgSend(a1, "setDelegate:", v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PKUIAnimationDelegate setDidStartHandler:](v4, "setDidStartHandler:", v5);

}

+ (uint64_t)pkui_shakeAnimation
{
  return objc_msgSend(a1, "pkui_shakeAnimationWithInitalOffest:springStiffness:springDamping:", 75.0, 1200.0, 12.0);
}

+ (uint64_t)pkui_smallShakeAnimation
{
  return objc_msgSend(a1, "pkui_shakeAnimationWithInitalOffest:springStiffness:springDamping:", 40.0, 800.0, 10.0);
}

+ (id)pkui_shakeAnimationWithInitalOffest:()PKCAUtilities springStiffness:springDamping:
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditive:", 1);
  objc_msgSend(v6, "setMass:", 1.20000005);
  objc_msgSend(v6, "setStiffness:", a2);
  objc_msgSend(v6, "setDamping:", a3);
  LODWORD(v7) = 1028389654;
  LODWORD(v8) = 990057071;
  LODWORD(v9) = 1059712716;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v11);

  objc_msgSend(v6, "setInitialVelocity:", 0.0);
  v12 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v6, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v6, "durationForEpsilon:", 0.001);
  objc_msgSend(v6, "setDuration:");
  v13 = *MEMORY[0x1E0C9D538];
  v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v6, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", a1, 0.0, *MEMORY[0x1E0C9D538], v14, a1, 0.0);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAdditive:", 1);
  LODWORD(v16) = 1054276898;
  LODWORD(v17) = 1058305108;
  LODWORD(v18) = 0;
  LODWORD(v19) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v16, v18, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v20);

  objc_msgSend(v15, "setDuration:", 0.100000001);
  objc_msgSend(v15, "setFillMode:", v12);
  objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v13, v14, a1, 0.0, v13, v14);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  v28[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAnimations:", v22);

  objc_msgSend(v6, "duration");
  v24 = v23;
  objc_msgSend(v15, "duration");
  if (v24 <= v25)
    v26 = v15;
  else
    v26 = v6;
  objc_msgSend(v26, "duration");
  objc_msgSend(v21, "setDuration:");

  return v21;
}

- (id)pkui_didStartHandler
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "didStartHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = _Block_copy(v2);

  return v3;
}

- (id)pkui_completionHandler
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "completionHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = _Block_copy(v2);

  return v3;
}

- (void)pkui_setCompletionHandler:()PKCAUtilities
{
  PKUIAnimationDelegate *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "delegate");
  v4 = (PKUIAnimationDelegate *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = v6;
    if (!v6)
    {
LABEL_6:

      return;
    }
    v4 = objc_alloc_init(PKUIAnimationDelegate);
    objc_msgSend(a1, "setDelegate:", v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKUIAnimationDelegate setCompletionHandler:](v4, "setCompletionHandler:", v6);

    v5 = v6;
    goto LABEL_6;
  }
  __break(1u);
}

@end
