@implementation _UIClickHighlightInteractionEffectAnchorView

- (_UIClickHighlightInteractionEffectAnchorView)init
{
  _UIClickHighlightInteractionEffectAnchorView *v2;
  _UIClickHighlightInteractionEffectAnchorView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIClickHighlightInteractionEffectAnchorView;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIClickHighlightInteractionEffectAnchorView;
  -[UIView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, 5.0, 5.0);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIClickHighlightInteractionEffectAnchorView;
  -[UIView setBounds:](&v3, sel_setBounds_, 0.0, 0.0, 5.0, 5.0);
}

@end
