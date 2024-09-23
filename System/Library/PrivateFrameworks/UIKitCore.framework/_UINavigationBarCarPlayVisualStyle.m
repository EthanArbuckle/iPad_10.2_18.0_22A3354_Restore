@implementation _UINavigationBarCarPlayVisualStyle

- (double)buttonHeight
{
  return 36.0;
}

- (double)leftTitleMargin
{
  return 16.0;
}

- (double)leftBackTitleMargin
{
  return 22.0;
}

- (double)backIndicatorBottomMargin
{
  return 14.5;
}

- (double)topMargin
{
  return 3.5;
}

- (double)horizontalMarginAdjustment
{
  return 12.0;
}

- (double)topTitleMargin
{
  return 1.5;
}

- (int64_t)navigationBar:(id)a3 metricsForOrientation:(int64_t)a4 hasPrompt:(BOOL)a5
{
  return 0;
}

- (double)textButtonMarginInNavigationBar:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarCarPlayVisualStyle;
  -[_UINavigationBarVisualStyle textButtonMarginInNavigationBar:](&v5, sel_textButtonMarginInNavigationBar_, a3);
  return v3 * 0.5;
}

- (double)imageButtonMarginInNavigationBar:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarCarPlayVisualStyle;
  -[_UINavigationBarVisualStyle imageButtonMarginInNavigationBar:](&v5, sel_imageButtonMarginInNavigationBar_, a3);
  return v3 * 0.5;
}

@end
