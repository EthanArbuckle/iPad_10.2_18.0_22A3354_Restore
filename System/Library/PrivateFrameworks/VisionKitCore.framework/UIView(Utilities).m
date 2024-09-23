@implementation UIView(Utilities)

- (void)setVk_backgroundColor:()Utilities
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "setBackgroundColor:", v4);

}

- (uint64_t)setVk_userInteractionEnabled:()Utilities
{
  return objc_msgSend(a1, "setUserInteractionEnabled:", 1);
}

- (uint64_t)vk_isFlipped
{
  return 1;
}

- (double)vk_backingScaleFactor
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (double)vk_safeAreaBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v25;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v25 = v6;
  v8 = v7;
  objc_msgSend(a1, "safeAreaInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (!vk_isiOS() || (objc_msgSend(a1, "vk_viewPointRatioFromWindow"), v17 == 1.0))
  {
    v18 = v5;
  }
  else
  {
    v18 = v5;
    if (fabs(v17 + -1.0) >= 0.000000999999997)
    {
      v10 = 0.0;
      v12 = 0.0;
      v14 = 0.0;
      v16 = 0.0;
    }
  }
  v19 = v3 + v12;
  v20 = v18 + v10;
  v21 = v25 - (v12 + v16);
  v22 = v8 - (v10 + v14);
  v23 = v18;
  if ((objc_msgSend(a1, "vk_isFlipped") & 1) == 0)
    return VKMFlipRect(v19, v20, v21, v22, v3, v23, v25, v8);
  return v19;
}

- (uint64_t)vk_viewPointRatioFromWindow
{
  return objc_msgSend(a1, "vk_viewLengthFromWindowLength:", 1.0);
}

- (uint64_t)vk_windowPointRatioFromView
{
  return objc_msgSend(a1, "vk_windowLengthFromViewLength:", 1.0);
}

- (uint64_t)vk_setHidden:()Utilities animated:
{
  uint64_t result;
  int v8;
  double v9;
  void *v10;
  _QWORD v11[5];
  char v12;
  _QWORD v13[5];
  char v14;

  result = objc_msgSend(a1, "isHidden");
  if ((_DWORD)result != (_DWORD)a3)
  {
    if (a4)
    {
      v8 = objc_msgSend(a1, "isHidden");
      v9 = 1.0;
      if (v8)
        v9 = 0.0;
      objc_msgSend(a1, "setVk_alpha:", v9);
      if ((a3 & 1) == 0)
        objc_msgSend(a1, "setHidden:", 0);
      v10 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(MEMORY[0x1E0CEABB0], "inheritedAnimationDuration");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __43__UIView_Utilities__vk_setHidden_animated___block_invoke;
      v13[3] = &unk_1E9462568;
      v13[4] = a1;
      v14 = a3;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __43__UIView_Utilities__vk_setHidden_animated___block_invoke_2;
      v11[3] = &unk_1E9463268;
      v11[4] = a1;
      v12 = a3;
      return objc_msgSend(v10, "animateWithDuration:animations:completion:", v13, v11);
    }
    else
    {
      return objc_msgSend(a1, "setHidden:", a3);
    }
  }
  return result;
}

- (double)vk_viewLengthFromWindowLength:()Utilities
{
  double v1;

  objc_msgSend(a1, "convertRect:fromView:", 0, VKMRectWithSize());
  return v1;
}

- (double)vk_windowLengthFromViewLength:()Utilities
{
  double v1;

  objc_msgSend(a1, "convertRect:toView:", 0, VKMRectWithSize());
  return v1;
}

- (id)vk_autoFadeOutShapeRectLayer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vk_autoFadeOutShapeRectLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)vk_autoFadeOutShapePointLayer
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vk_autoFadeOutShapePointLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)vk_autoFadeOutLayerWithPath:()Utilities
{
  return objc_msgSend(a1, "vk_autoFadeOutLayerWithPath:fadeOutDelay:", 1.0);
}

- (uint64_t)vk_autoFadeOutLayerWithQuad:()Utilities
{
  return objc_msgSend(a1, "vk_autoFadeOutLayerWithQuad:fadeOutDelay:", 1.0);
}

- (id)vk_autoFadeOutLayerWithQuad:()Utilities fadeOutDelay:
{
  void *v6;
  void *v7;

  objc_msgSend(a4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vk_autoFadeOutLayerWithPath:fadeOutDelay:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vk_autoFadeOutLayerWithPath:()Utilities fadeOutDelay:
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v6 = (objc_class *)MEMORY[0x1E0CD2840];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "bounds");
  objc_msgSend(v8, "setFrame:");
  v9 = objc_msgSend(v7, "vk_CGPath");

  objc_msgSend(v8, "setPath:", v9);
  objc_msgSend(MEMORY[0x1E0CEA478], "vk_randomColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

  objc_msgSend(v8, "setFillColor:", 0);
  objc_msgSend(v8, "setLineWidth:", 2.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  objc_msgSend(a1, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSublayer:", v8);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke;
  v15[3] = &unk_1E94625B8;
  v13 = v8;
  v16 = v13;
  vk_dispatchMainAfterDelay(v15, a2);

  return v13;
}

- (id)vk_constraintsToFillView:()Utilities
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = a1;
  v7 = v4;
  if (v7)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v6, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(v6, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    objc_msgSend(v6, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((v2) != nil)", "-[UIView(Utilities) vk_constraintsToFillView:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "v2");
  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

- (id)vk_renderImageFromViewBackingStoreWithSubrect:()Utilities
{
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  objc_msgSend(MEMORY[0x1E0CEA618], "defaultFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v10, a4, a5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__UIView_Utilities__vk_renderImageFromViewBackingStoreWithSubrect___block_invoke;
  v14[3] = &unk_1E9463290;
  v14[4] = a1;
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  *(double *)&v14[8] = a5;
  objc_msgSend(v11, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)vk_renderImageFromViewBackingStore
{
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "vk_renderImageFromViewBackingStoreWithSubrect:");
}

- (id)vk_constraintsToFillLayoutGuide:()Utilities
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = a1;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v7, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    objc_msgSend(v7, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    objc_msgSend(v7, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((layoutGuide) != nil)", "-[UIView(Utilities) vk_constraintsToFillLayoutGuide:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "layoutGuide");
  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

- (double)vk_convertFrameToViewScale:()Utilities shouldRound:
{
  void *v12;
  double v13;
  double v14;

  objc_msgSend(a1, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = VKMRectForScale(a7, a2, a3, a4, a5, v13);

  return v14;
}

- (uint64_t)summaryDescription
{
  double v1;
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "frame");
  return VKMUIStringForRect(v1, v2, v3, v4);
}

@end
