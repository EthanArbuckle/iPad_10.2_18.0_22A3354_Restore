@implementation RCTextField

- (RCTextField)initWithFrame:(CGRect)a3
{
  RCTextField *v3;
  PKScribbleInteraction *v4;
  PKScribbleInteraction *scribbleInteraction;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCTextField;
  v3 = -[RCTextField initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (PKScribbleInteraction *)objc_alloc_init((Class)PKScribbleInteraction);
    scribbleInteraction = v3->_scribbleInteraction;
    v3->_scribbleInteraction = v4;

    -[PKScribbleInteraction setDelegate:](v3->_scribbleInteraction, "setDelegate:", v3);
    -[RCTextField addInteraction:](v3, "addInteraction:", v3->_scribbleInteraction);
  }
  return v3;
}

- (void)setFocusDisabled:(BOOL)a3
{
  self->_focusDisabled = a3;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;

  if (self->_focusDisabled)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)RCTextField;
  return -[RCTextField canBecomeFocused](&v3, "canBecomeFocused");
}

- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)result
{
  double v5;
  double v6;

  v5 = -200.0;
  v6 = -200.0;
  result.right = v6;
  result.left = v5;
  return result;
}

- (BOOL)focusDisabled
{
  return self->_focusDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
}

@end
