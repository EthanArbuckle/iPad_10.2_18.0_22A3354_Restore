@implementation MTMPButton

- (MTMPButton)initWithFrame:(CGRect)a3
{
  MTMPButton *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMPButton;
  result = -[MTMPButton initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_holdDelayInterval = 0.75;
  return result;
}

+ (UIEdgeInsets)easyTouchDefaultHitRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -20.0;
  v3 = -20.0;
  v4 = -20.0;
  v5 = -20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)easyTouchDefaultCharge
{
  return -0.300000012;
}

+ (id)easyTouchButtonWithType:(int64_t)a3
{
  void *v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "buttonWithType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "easyTouchDefaultHitRectInsets");
  objc_msgSend(v3, "setHitRectInsets:");
  objc_msgSend((id)objc_opt_class(), "easyTouchDefaultCharge");
  *(float *)&v4 = v4;
  objc_msgSend(v3, "setCharge:", v4);
  return v3;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[MTMPButton _handleTouchDown](self, "_handleTouchDown");
  v9.receiver = self;
  v9.super_class = (Class)MTMPButton;
  LOBYTE(self) = -[MTMPButton beginTrackingWithTouch:withEvent:](&v9, sel_beginTrackingWithTouch_withEvent_, v7, v6);

  return (char)self;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMPButton;
  -[MTMPButton cancelTrackingWithEvent:](&v4, sel_cancelTrackingWithEvent_, a3);
  -[MTMPButton _handleTouchCancel](self, "_handleTouchCancel");
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMPButton;
  -[MTMPButton endTrackingWithTouch:withEvent:](&v5, sel_endTrackingWithTouch_withEvent_, a3, a4);
  -[MTMPButton _handleTouchUp](self, "_handleTouchUp");
}

- (CGRect)hitRect
{
  double left;
  double top;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)MTMPButton;
  -[MTMPButton hitRect](&v13, sel_hitRect);
  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  v6 = v5 + left;
  v8 = v7 - (left + self->_hitRectInsets.right);
  v10 = v9 + top;
  v12 = v11 - (top + self->_hitRectInsets.bottom);
  result.size.height = v12;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MTMPButton hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)dealloc
{
  double v2;
  objc_super v4;

  LODWORD(v2) = 0;
  -[MTMPButton setCharge:](self, "setCharge:", v2);
  v4.receiver = self;
  v4.super_class = (Class)MTMPButton;
  -[MTMPButton dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  UIView *hitTestDebugView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMPButton;
  -[MTMPButton layoutSubviews](&v4, sel_layoutSubviews);
  hitTestDebugView = self->_hitTestDebugView;
  -[MTMPButton hitRect](self, "hitRect");
  -[UIView setFrame:](hitTestDebugView, "setFrame:");
}

- (BOOL)isHolding
{
  return *((_BYTE *)self + 752) & 1;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  id v6;

  if (self->_alignmentRectInsets.left != a3.left
    || self->_alignmentRectInsets.top != a3.top
    || self->_alignmentRectInsets.right != a3.right
    || self->_alignmentRectInsets.bottom != a3.bottom)
  {
    self->_alignmentRectInsets = a3;
    -[MTMPButton superview](self, "superview");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

- (void)setHitTestDebugEnabled:(BOOL)a3
{
  UIView *hitTestDebugView;
  UIView *v5;
  UIView *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;

  if (self->_hitTestDebugEnabled != a3)
  {
    self->_hitTestDebugEnabled = a3;
    hitTestDebugView = self->_hitTestDebugView;
    if (a3)
    {
      if (!hitTestDebugView)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v6 = self->_hitTestDebugView;
        self->_hitTestDebugView = v5;

        -[UIView setUserInteractionEnabled:](self->_hitTestDebugView, "setUserInteractionEnabled:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v8 = objc_msgSend(v7, "CGColor");
        -[UIView layer](self->_hitTestDebugView, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBorderColor:", v8);

        -[UIView layer](self->_hitTestDebugView, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBorderWidth:", 1.0);

        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "colorWithAlphaComponent:", 0.1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_hitTestDebugView, "setBackgroundColor:", v12);

        hitTestDebugView = self->_hitTestDebugView;
      }
      -[MTMPButton addSubview:](self, "addSubview:", hitTestDebugView);
      -[MTMPButton setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIView removeFromSuperview](self->_hitTestDebugView, "removeFromSuperview");
      v13 = self->_hitTestDebugView;
      self->_hitTestDebugView = 0;

    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMPButton;
  -[MTMPButton touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  *((_BYTE *)self + 752) &= ~1u;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMPButton;
  -[MTMPButton touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  *((_BYTE *)self + 752) &= ~1u;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (void)_delayedTriggerHold
{
  *((_BYTE *)self + 752) |= 1u;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[MTMPButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
}

- (void)_handleTouchCancel
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedTriggerHold, 0);
  -[MTMPButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000000);
}

- (void)_handleTouchDown
{
  -[MTMPButton holdDelayInterval](self, "holdDelayInterval");
  -[MTMPButton performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedTriggerHold, 0);
}

- (void)_handleTouchUp
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedTriggerHold, 0);
  -[MTMPButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000000);
}

- (UIEdgeInsets)hitRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  bottom = self->_hitRectInsets.bottom;
  right = self->_hitRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (double)holdDelayInterval
{
  return self->_holdDelayInterval;
}

- (void)setHoldDelayInterval:(double)a3
{
  self->_holdDelayInterval = a3;
}

- (BOOL)hitTestDebugEnabled
{
  return self->_hitTestDebugEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestDebugView, 0);
}

@end
