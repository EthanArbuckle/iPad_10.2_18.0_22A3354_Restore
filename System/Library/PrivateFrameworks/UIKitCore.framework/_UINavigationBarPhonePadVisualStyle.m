@implementation _UINavigationBarPhonePadVisualStyle

- (double)buttonHeight
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 24.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle buttonHeight](&v4, sel_buttonHeight, 24.0);
  }
  return result;
}

- (double)barHeight
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 32.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle barHeight](&v4, sel_barHeight, 32.0);
  }
  return result;
}

- (double)barPromptHeight
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 54.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle barPromptHeight](&v4, sel_barPromptHeight, 54.0);
  }
  return result;
}

- (double)topMargin
{
  double result;
  int64_t metrics;
  objc_super v4;

  result = 9.0;
  if (!self->super._inPopover)
  {
    metrics = self->super._metrics;
    result = 4.0;
    if (metrics != 1 && metrics != 102)
    {
      v4.receiver = self;
      v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
      -[_UINavigationBarVisualStyle topMargin](&v4, sel_topMargin, 4.0);
    }
  }
  return result;
}

- (double)topTitleMargin
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 1.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle topTitleMargin](&v4, sel_topTitleMargin, 1.0);
  }
  return result;
}

- (double)topBackMargin
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 5.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle topBackMargin](&v4, sel_topBackMargin, 5.0);
  }
  return result;
}

- (double)navigationItemBaselineOffset
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 11.0;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle navigationItemBaselineOffset](&v4, sel_navigationItemBaselineOffset, 11.0);
  }
  return result;
}

- (double)backIndicatorBottomMargin
{
  int64_t metrics;
  double result;
  objc_super v4;

  metrics = self->super._metrics;
  result = 7.5;
  if (metrics != 1 && metrics != 102)
  {
    v4.receiver = self;
    v4.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
    -[_UINavigationBarVisualStyle backIndicatorBottomMargin](&v4, sel_backIndicatorBottomMargin, 7.5);
  }
  return result;
}

- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5
{
  _BOOL8 v5;
  unsigned int v8;
  id v9;
  int64_t v10;
  id v11;
  objc_super v13;

  v5 = a5;
  v8 = (unint64_t)(a4 - 3) < 2;
  v9 = a3;
  if (_UIUseMiniHeightInLandscape(v8))
    v10 = a4;
  else
    v10 = 1;
  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarPhonePadVisualStyle;
  v11 = -[_UINavigationBarVisualStyle navigationBar:metricsForOrientation:hasPrompt:](&v13, sel_navigationBar_metricsForOrientation_hasPrompt_, v9, v10, v5);

  return (int64_t)v11;
}

- (double)_legacyLeftTitleMargin
{
  return 12.0;
}

- (double)_legacyRightTitleMargin
{
  return 8.0;
}

- (double)_legacyButtonFontSize
{
  return 12.0;
}

- (id)_legacyButtonFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", a3, 12.0);
}

- (double)_legacyButtonImagePadding
{
  return 20.0;
}

@end
