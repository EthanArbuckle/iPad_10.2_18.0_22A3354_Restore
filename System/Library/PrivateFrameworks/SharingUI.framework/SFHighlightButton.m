@implementation SFHighlightButton

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFHighlightButton;
  -[SFHighlightButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = 1.0;
  if (v3)
    v5 = 0.5;
  -[SFHighlightButton setAlpha:](self, "setAlpha:", v5);
}

@end
