@implementation WFDrawerPaneCloseButton

- (WFDrawerPaneCloseButton)initWithFrame:(CGRect)a3
{
  WFDrawerPaneCloseButton *v3;
  WFDrawerPaneCloseButton *v4;
  void *v5;
  WFDrawerPaneCloseButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFDrawerPaneCloseButton;
  v3 = -[WFDrawerPaneCloseButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_touchAreaAdjustment = -20.0;
    WFLocalizedString(CFSTR("Close"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCloseButton setAccessibilityLabel:](v4, "setAccessibilityLabel:", v5);

    v6 = v4;
  }

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  WFDrawerPaneCloseButton *v20;
  CGPoint v22;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  if ((-[WFDrawerPaneCloseButton isHidden](self, "isHidden", a4) & 1) != 0)
    goto LABEL_6;
  if (!-[WFDrawerPaneCloseButton isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    goto LABEL_6;
  -[WFDrawerPaneCloseButton alpha](self, "alpha");
  if (v7 <= 0.01)
    goto LABEL_6;
  -[WFDrawerPaneCloseButton bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[WFDrawerPaneCloseButton touchAreaAdjustment](self, "touchAreaAdjustment");
  v17 = v16;
  -[WFDrawerPaneCloseButton touchAreaAdjustment](self, "touchAreaAdjustment");
  v19 = v18;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v24 = CGRectInset(v23, v17, v19);
  v22.x = x;
  v22.y = y;
  if (CGRectContainsPoint(v24, v22))
    v20 = self;
  else
LABEL_6:
    v20 = 0;
  return v20;
}

- (double)touchAreaAdjustment
{
  return self->_touchAreaAdjustment;
}

- (void)setTouchAreaAdjustment:(double)a3
{
  self->_touchAreaAdjustment = a3;
}

@end
