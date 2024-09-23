@implementation _UINavigationBarVisualStyle

+ (id)visualStyleForIdiom:(int64_t)a3
{
  int64_t v3;
  void *v4;
  __objc2_class **v5;

  v3 = a3;
  if (a3 == -1)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom");

  }
  if ((unint64_t)(v3 - 2) > 6)
    v5 = off_1E167C970;
  else
    v5 = off_1E16B60F0[v3 - 2];
  return (id)objc_msgSend(objc_alloc(*v5), "initWithIdiom:", v3);
}

- (_UINavigationBarVisualStyle)initWithIdiom:(int64_t)a3
{
  _UINavigationBarVisualStyle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualStyle;
  result = -[_UINavigationBarVisualStyle init](&v5, sel_init);
  if (result)
    result->_idiom = a3;
  return result;
}

- (id)timingFunctionForAnimationInView:(id)a3 withKeyPath:(id)a4 isInteractive:(BOOL)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("opacity")))
  {
    objc_msgSend(v7, "alpha");
    HIDWORD(v11) = 1068079513;
    if (v8 < 0.05
      || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "_isFadingInFromCustomAlpha"))
    {
      v12 = (void *)MEMORY[0x1E0CD27D0];
      LODWORD(v11) = 1036831949;
      LODWORD(v8) = 0.75;
      LODWORD(v9) = 0.75;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CD27D0];
      LODWORD(v11) = 1063675494;
      LODWORD(v8) = 0.25;
      LODWORD(v9) = 0.25;
    }
    LODWORD(v10) = LODWORD(v11);
    objc_msgSend(v12, "functionWithControlPoints::::", v8, v11, v9, v10);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
      v13 = (_QWORD *)MEMORY[0x1E0CD3058];
    else
      v13 = (_QWORD *)MEMORY[0x1E0CD3038];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (BOOL)metricsIsMini
{
  int64_t metrics;

  metrics = self->_metrics;
  return metrics == 1 || metrics == 102;
}

- (BOOL)metricsHasPrompt
{
  return (unint64_t)(self->_metrics - 101) < 2;
}

- (double)backButtonIndicatorSpacing
{
  int v2;
  double result;

  v2 = dyld_program_sdk_at_least();
  result = 7.5;
  if (v2)
    return 8.0;
  return result;
}

- (double)backButtonAnimationClippingPadding
{
  return 0.0;
}

- (double)buttonHeight
{
  return 30.0;
}

- (double)barHeight
{
  return 44.0;
}

- (double)barPromptHeight
{
  return 74.0;
}

- (double)barHeightForMetrics:(int64_t)a3
{
  int64_t metrics;
  double result;

  metrics = self->_metrics;
  self->_metrics = a3;
  if ((unint64_t)(a3 - 101) >= 2)
    -[_UINavigationBarVisualStyle barHeight](self, "barHeight");
  else
    -[_UINavigationBarVisualStyle barPromptHeight](self, "barPromptHeight");
  self->_metrics = metrics;
  return result;
}

- (double)topMargin
{
  return 7.0;
}

- (double)horizontalMarginAdjustment
{
  return 8.0;
}

- (double)topTitleMargin
{
  return 3.0;
}

- (double)topBackMargin
{
  return 8.0;
}

- (double)headingFontSize
{
  double result;

  objc_msgSend(off_1E167A828, "defaultFontSize");
  return result;
}

- (double)leftTitleMargin
{
  return 0.0;
}

- (double)leftBackTitleMargin
{
  return 19.0;
}

- (double)leftTextMargin
{
  return 8.0;
}

- (double)topImageMargin
{
  return 2.0;
}

- (double)bottomImageMargin
{
  double v2;

  -[_UINavigationBarVisualStyle topImageMargin](self, "topImageMargin");
  return v2 + 1.0;
}

- (double)bottomButtonMargin
{
  return 7.0;
}

- (double)promptInset
{
  return 10.0;
}

- (double)interItemSpace
{
  return 8.0;
}

- (double)interBlockSpace
{
  return 6.0;
}

- (double)maxBackButtonProportion
{
  return 0.5;
}

- (double)minBackTextWidth
{
  return 28.0;
}

- (double)minBackImageWidth
{
  return 28.0;
}

- (double)minButtonWidth
{
  return 56.0;
}

- (double)minTitleWidth
{
  return 75.0;
}

- (double)buttonImagePadding
{
  return 22.0;
}

- (double)promptFontSize
{
  return 13.0;
}

- (UIFont)promptFont
{
  return (UIFont *)objc_msgSend(off_1E167A828, "systemFontOfSize:", 13.0);
}

- (double)promptTextOffset
{
  return 10.0;
}

- (double)navigationItemBaselineOffset
{
  return 16.0;
}

- (double)backIndicatorBottomMargin
{
  return 11.5;
}

- (UIEdgeInsets)buttonContentEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)buttonFontForStyle:(int64_t)a3
{
  -[_UINavigationBarVisualStyle buttonFontSize](self, "buttonFontSize");
  if (a3 == 2)
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
  else
    objc_msgSend(off_1E167A828, "systemFontOfSize:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldForceLegacyLeftBackTitleMarginForCustomBackButtonBackground:(id)a3
{
  return a3 != 0;
}

- (double)leftBackTitleMarginForCustomBackButtonBackground:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  if (-[_UINavigationBarVisualStyle shouldForceLegacyLeftBackTitleMarginForCustomBackButtonBackground:](self, "shouldForceLegacyLeftBackTitleMarginForCustomBackButtonBackground:", v4))
  {
    -[_UINavigationBarVisualStyle _legacyLeftTitleMargin](self, "_legacyLeftTitleMargin");
  }
  else
  {
    -[_UINavigationBarVisualStyle leftBackTitleMargin](self, "leftBackTitleMargin");
  }
  v6 = v5;
  objc_msgSend(v4, "capInsets");
  v8 = v7;

  return fmax(v6, v8);
}

- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5
{
  int64_t v5;

  v5 = 101;
  if ((unint64_t)(a4 - 1) >= 2)
    v5 = 102;
  if (a5)
    return v5;
  else
    return (unint64_t)(a4 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (double)textButtonMarginInNavigationBar:(id)a3
{
  double result;

  objc_msgSend(a3, "_textButtonMargin");
  return result;
}

- (double)imageButtonMarginInNavigationBar:(id)a3
{
  double result;

  objc_msgSend(a3, "_imageButtonMargin");
  return result;
}

- (id)defaultTitleColorForUserInterfaceStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  if ((unint64_t)(a4 - 3) > 0xFFFFFFFFFFFFFFFDLL)
    +[UIColor whiteColor](UIColor, "whiteColor", a3);
  else
    +[UIColor blackColor](UIColor, "blackColor", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_legacyLeftTitleMargin
{
  return 0.0;
}

- (double)_legacyButtonFontSize
{
  return 0.0;
}

- (id)_legacyButtonFontForStyle:(int64_t)a3
{
  return 0;
}

- (double)_legacyButtonImagePadding
{
  return 0.0;
}

- (int64_t)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(int64_t)a3
{
  self->_metrics = a3;
}

- (BOOL)inPopover
{
  return self->_inPopover;
}

- (void)setInPopover:(BOOL)a3
{
  self->_inPopover = a3;
}

- (int64_t)idiom
{
  return self->_idiom;
}

@end
