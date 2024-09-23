@implementation UISegmentAccessibilityButton

+ (id)buttonWithSegment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___UISegmentAccessibilityButton;
  v3 = a3;
  objc_msgSendSuper2(&v8, sel_buttonWithType_, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor clearColor](UIColor, "clearColor", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v3, "setFrameOrigin:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v4, "addSubview:", v3);
  objc_msgSend(v4, "setSegment:", v3);
  objc_msgSend(v4, "setUserInteractionEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_msgSend(v3, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityLabel:", v6);
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISegmentAccessibilityButton;
  -[UIButton layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView size](self, "size");
  v4 = v3;
  v6 = v5;
  -[UISegmentAccessibilityButton segment](self, "segment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSize:", v4, v6);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISegmentAccessibilityButton;
  -[UIControl hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return self;
  else
    return 0;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISegmentAccessibilityButton;
  -[UIControl hitTest:forEvent:](&v7, sel_hitTest_forEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return self;
  else
    return 0;
}

- (UISegment)segment
{
  return self->_segment;
}

- (void)setSegment:(id)a3
{
  objc_storeStrong((id *)&self->_segment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
}

@end
