@implementation UIStatusBarCarPlayRecordingTimeItemView

- (UIStatusBarCarPlayRecordingTimeItemView)initWithFrame:(CGRect)a3
{
  UIStatusBarCarPlayRecordingTimeItemView *v3;
  _UIStatusBarRoundedCornerView *v4;
  uint64_t v5;
  _UIStatusBarRoundedCornerView *pillView;
  _UIStatusBarRoundedCornerView *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_UIStatusBarRoundedCornerView alloc];
    v5 = -[_UIStatusBarRoundedCornerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    pillView = v3->_pillView;
    v3->_pillView = (_UIStatusBarRoundedCornerView *)v5;

    v7 = v3->_pillView;
    +[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIStatusBarCarPlayRecordingTimeItemView _updatePillFrame](self, "_updatePillFrame");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  -[UIStatusBarButtonActionItemView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIStatusBarCarPlayRecordingTimeItemView _updatePillFrame](self, "_updatePillFrame");
}

- (void)movedToSuperview:(id)a3
{
  _UIStatusBarRoundedCornerView *pillView;

  objc_msgSend(a3, "insertSubview:below:", self->_pillView, self);
  pillView = self->_pillView;
  -[UIStatusBarCarPlayRecordingTimeItemView _pillFrame](self, "_pillFrame");
  -[UIView setFrame:](pillView, "setFrame:");
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_pillView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  -[UIView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (BOOL)showsTouchWhenHighlighted
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)allowsUserInteraction
{
  return 1;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  UIStatusBarCarPlayRecordingTimeItemView *v7;
  _UIStatusBarRoundedCornerView *pillView;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarCarPlayRecordingTimeItemView;
  v6 = a3;
  -[UIStatusBarButtonActionItemView didUpdateFocusInContext:withAnimationCoordinator:](&v11, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem", v11.receiver, v11.super_class);
  v7 = (UIStatusBarCarPlayRecordingTimeItemView *)objc_claimAutoreleasedReturnValue();

  pillView = self->_pillView;
  if (v7 == self)
  {
    +[UIColor externalSystemTealColor](UIColor, "externalSystemTealColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!pillView)
      return;
    +[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  -[UIView setBackgroundColor:](pillView, "setBackgroundColor:", v9);

}

- (int64_t)buttonType
{
  return 5;
}

- (int64_t)textStyle
{
  return 5;
}

- (double)extraRightPadding
{
  return -2.0;
}

- (CGRect)_pillFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[UIView frame](self, "frame");
  v4 = v3 + -4.0;
  -[UIView frame](self, "frame");
  v9 = round(v8 + v7 * 0.5 + -8.0);
  v10 = round(v6 + v5 * 0.5 - v4 * 0.5);
  v11 = 16.0;
  v12 = v4;
  result.size.height = v11;
  result.size.width = v12;
  result.origin.y = v9;
  result.origin.x = v10;
  return result;
}

- (void)_updatePillFrame
{
  _UIStatusBarRoundedCornerView *pillView;

  pillView = self->_pillView;
  -[UIStatusBarCarPlayRecordingTimeItemView _pillFrame](self, "_pillFrame");
  -[UIView setFrame:](pillView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
