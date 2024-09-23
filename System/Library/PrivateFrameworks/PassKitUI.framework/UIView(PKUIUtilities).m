@implementation UIView(PKUIUtilities)

+ (void)pkui_animateUsingOptions:()PKUIUtilities delay:velocity:animations:completion:
{
  void *v12;
  id v13;
  id v14;
  id v15;

  v12 = (void *)MEMORY[0x1E0D6C038];
  v13 = a7;
  v14 = a6;
  v15 = (id)objc_msgSend(v12, "createDefaultFactory");
  objc_msgSend(v15, "setVelocity:", a3);
  objc_msgSend(a1, "pkui_animateUsingFactory:withDelay:options:animations:completion:", v15, a5, v14, v13, a2);

}

+ (uint64_t)pkui_animateUsingOptions:()PKUIUtilities delay:animations:completion:
{
  return objc_msgSend(a1, "pkui_animateUsingOptions:delay:velocity:animations:completion:", a3, 0.0);
}

+ (uint64_t)pkui_animateUsingOptions:()PKUIUtilities animations:completion:
{
  return objc_msgSend(a1, "pkui_animateUsingOptions:delay:animations:completion:", 0.0);
}

+ (void)pkui_animateUsingFactory:()PKUIUtilities withDelay:options:animations:completion:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v13 = a3;
  v9 = a5;
  v10 = a6;
  v11 = v13;
  if (!v13)
    v11 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v14 = v11;
  objc_msgSend(v11, "duration");
  objc_msgSend(v12, "_animateWithDuration:delay:options:factory:animations:completion:", a4, v14, v9, v10);

}

- (void)pkui_shakeWithCompletion:()PKUIUtilities
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_shakeAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "pkui_setCompletionHandler:", v7);
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v4);

}

- (void)pkui_smallShakeWithCompletion:()PKUIUtilities
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CD26F8], "pkui_smallShakeAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "pkui_setCompletionHandler:", v7);
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v4);

}

- (void)addDefaultTranslationSpringWithVelocity:()PKUIUtilities startTime:
{
  id v6;

  PKMagicCurve();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addTranslationSpringWithMass:stiffness:damping:startTime:velocity:timing:", v6, 2.0, 300.0, 400.0, a3, a2);

}

- (uint64_t)addTranslationSpringWithMass:()PKUIUtilities stiffness:damping:startTime:timing:
{
  return objc_msgSend(a1, "addTranslationSpringWithMass:stiffness:damping:startTime:velocity:timing:", a3, a4, a5, a6, 0.0);
}

- (void)addTranslationSpringWithMass:()PKUIUtilities stiffness:damping:startTime:velocity:timing:
{
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v14 = (void *)MEMORY[0x1E0CD2848];
  v15 = a8;
  objc_msgSend(v14, "animationWithKeyPath:", CFSTR("position"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setVelocity:", a6);
  objc_msgSend(v19, "setRemovedOnCompletion:", 1);
  objc_msgSend(v19, "setMass:", a2);
  objc_msgSend(v19, "setStiffness:", a3);
  objc_msgSend(v19, "setDamping:", a4);
  objc_msgSend(a1, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", CFSTR("position"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", v17);

  objc_msgSend(v19, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v19, "setTimingFunction:", v15);

  objc_msgSend(v19, "setBeginTime:", a5);
  objc_msgSend(v19, "durationForEpsilon:", 0.00100000005);
  objc_msgSend(v19, "setDuration:");
  objc_msgSend(a1, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v19, CFSTR("position"));

}

- (void)addDefaultTransformSpringWithStartTime:()PKUIUtilities
{
  id v4;

  PKMagicCurve();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addTransformSpringWithMass:stiffness:damping:startTime:timing:", v4, 2.0, 300.0, 400.0, a2);

}

- (void)addTransformSpringWithMass:()PKUIUtilities stiffness:damping:startTime:timing:
{
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v12 = (void *)MEMORY[0x1E0CD2848];
  v13 = a7;
  objc_msgSend(v12, "animationWithKeyPath:", CFSTR("transform"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRemovedOnCompletion:", 1);
  objc_msgSend(v17, "setMass:", a2);
  objc_msgSend(v17, "setStiffness:", a3);
  objc_msgSend(v17, "setDamping:", a4);
  objc_msgSend(a1, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("transform"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v15);

  objc_msgSend(v17, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v17, "setTimingFunction:", v13);

  objc_msgSend(v17, "setBeginTime:", a5);
  objc_msgSend(v17, "durationForEpsilon:", 0.00100000005);
  objc_msgSend(v17, "setDuration:");
  objc_msgSend(a1, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("transform"));

}

- (id)pkui_translationAnimation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "animationForKey:", CFSTR("position"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pkui_viewControllerFromResponderChain
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1A1AE621C]();
  v3 = a1;
  while (1)
  {
    v4 = v3;
    objc_msgSend(v3, "nextResponder");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      break;
    }
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

- (BOOL)pkui_readableContentBoundsWithMargins:()PKUIUtilities
{
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(a1, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = a3 + v12;
  v14 = v8 + 0.0;
  v16 = v15 - (a3 + a5);
  objc_msgSend(a1, "readableContentGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutFrame");
  v19 = v18;
  v21 = v20;

  v23.origin.x = v13;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v11;
  v25.origin.x = v19;
  v25.origin.y = v9;
  v25.size.width = v21;
  v25.size.height = v11;
  v24 = CGRectIntersection(v23, v25);
  return CGRectIsNull(v24);
}

- (void)pkui_setExcludedFromScreenCapture:()PKUIUtilities andBroadcasting:
{
  int v6;
  int v7;
  int v8;
  int v9;
  id v10;

  objc_msgSend(a1, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "disableUpdateMask");
  v7 = PKSensitiveFieldBroadcastingEnabled() ^ 1;
  if ((v7 & a4) != 0)
    v8 = 16;
  else
    v8 = 0;
  if ((v7 & a3) != 0)
    v9 = 2;
  else
    v9 = 0;
  objc_msgSend(v10, "setDisableUpdateMask:", v8 | v6 & 0xFFFFFFED | v9);

}

- (uint64_t)pkui_setBoundsAndPositionFromFrame:()PKUIUtilities
{
  double MidX;
  CGRect v12;
  CGRect v13;

  objc_msgSend(a1, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  return objc_msgSend(a1, "setCenter:", MidX, CGRectGetMidY(v13));
}

- (uint64_t)pkui_userInterfaceIdiomSupportsLargeLayouts
{
  void *v1;
  unint64_t v2;
  uint64_t v3;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");
  v3 = (v2 < 7) & (0x62u >> v2);

  return v3;
}

@end
