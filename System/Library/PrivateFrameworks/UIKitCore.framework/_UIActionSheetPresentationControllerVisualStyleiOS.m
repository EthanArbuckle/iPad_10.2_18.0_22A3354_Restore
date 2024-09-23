@implementation _UIActionSheetPresentationControllerVisualStyleiOS

- (_UIActionSheetPresentationControllerVisualStyleiOS)init
{
  _UIActionSheetPresentationControllerVisualStyleiOS *v2;
  UIActionSheetiOSDismissActionView *v3;
  uint64_t v4;
  UIActionSheetiOSDismissActionView *dismissActionView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIActionSheetPresentationControllerVisualStyleiOS;
  v2 = -[_UIActionSheetPresentationControllerVisualStyleiOS init](&v7, sel_init);
  if (v2)
  {
    v3 = [UIActionSheetiOSDismissActionView alloc];
    -[_UIActionSheetPresentationControllerVisualStyleiOS cornerRadius](v2, "cornerRadius");
    v4 = -[UIActionSheetiOSDismissActionView initWithContinuousCornerRadius:](v3, "initWithContinuousCornerRadius:");
    dismissActionView = v2->_dismissActionView;
    v2->_dismissActionView = (UIActionSheetiOSDismissActionView *)v4;

  }
  return v2;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 8.0, 8.0, 8.0, 8.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)dismissToContentSpacing
{
  return 8.0;
}

- (UIColor)dimmingViewColor
{
  return (UIColor *)+[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
}

- (double)cornerRadius
{
  return 13.0;
}

- (UIActionSheetiOSDismissActionView)dismissActionView
{
  return self->_dismissActionView;
}

- (void)setDismissActionView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissActionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissActionView, 0);
}

@end
