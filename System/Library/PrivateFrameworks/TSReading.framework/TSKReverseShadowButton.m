@implementation TSKReverseShadowButton

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)-[TSKReverseShadowButton titleLabel](self, "titleLabel");
  v6 = -1.0;
  if (!v3)
    v6 = 1.0;
  objc_msgSend(v5, "setShadowOffset:", 0.0, v6);
  -[TSKReverseShadowButton setNeedsDisplay](self, "setNeedsDisplay");
  v7.receiver = self;
  v7.super_class = (Class)TSKReverseShadowButton;
  -[TSKReverseShadowButton setSelected:](&v7, sel_setSelected_, v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (a3)
    objc_msgSend((id)-[TSKReverseShadowButton titleLabel](self, "titleLabel"), "setShadowOffset:", 0.0, 1.0);
  -[TSKReverseShadowButton setNeedsDisplay](self, "setNeedsDisplay");
  v5.receiver = self;
  v5.super_class = (Class)TSKReverseShadowButton;
  -[TSKReverseShadowButton setHighlighted:](&v5, sel_setHighlighted_, v3);
}

@end
