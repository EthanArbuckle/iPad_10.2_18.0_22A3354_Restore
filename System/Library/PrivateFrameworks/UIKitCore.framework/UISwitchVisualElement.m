@implementation UISwitchVisualElement

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  v3 = a3;
  v5 = 0.5;
  if (a3)
    v5 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", v5);
  self->_enabled = v3;
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
}

+ (BOOL)isFixedSize
{
  return 1;
}

- (void)setSwitchControl:(id)a3
{
  objc_storeWeak((id *)&self->_switchControl, a3);
}

- (UISwitchControl)switchControl
{
  return (UISwitchControl *)objc_loadWeakRetained((id *)&self->_switchControl);
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (UISwitchVisualElement)initWithFrame:(CGRect)a3
{
  UISwitchVisualElement *v3;
  UISwitchVisualElement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISwitchVisualElement;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UISwitchVisualElement setEnabledAlpha:](v3, "setEnabledAlpha:", 1.0);
    -[UISwitchVisualElement setEnabled:](v4, "setEnabled:", 1);
  }
  return v4;
}

- (void)setEnabledAlpha:(double)a3
{
  self->_enabledAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_switchControl);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)preferredAlignmentRectInsets
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

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if ((objc_msgSend((id)objc_opt_class(), "isFixedSize") & 1) == 0)
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 424);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (double)enabledAlpha
{
  return self->_enabledAlpha;
}

@end
