@implementation RelatedSearchSuggestionView

- (void)setAlpha:(double)a3
{
  -[RelatedSearchSuggestionView setAlpha:animated:](self, "setAlpha:animated:", 0, a3);
}

- (void)setAlpha:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[6];

  v4 = a4;
  -[RelatedSearchSuggestionView alpha](self, "alpha");
  if (v7 != a3)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A25928;
    v12[3] = &unk_1011AD518;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    v8 = objc_retainBlock(v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100A259E0;
    v11[3] = &unk_1011AE8F8;
    v11[4] = self;
    v9 = objc_retainBlock(v11);
    -[RelatedSearchSuggestionView endEditing:](self, "endEditing:", 1);
    -[RelatedSearchSuggestionView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    if (v4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100A259EC;
      v10[3] = &unk_1011AC860;
      v10[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v9, 0.25);
    }
    else
    {
      ((void (*)(_QWORD *))v8[2])(v8);
      ((void (*)(_QWORD *, uint64_t))v9[2])(v9, 1);
    }

  }
}

- (void)setShowCloseButton:(BOOL)a3
{
  if (self->_showCloseButton != a3)
  {
    self->_showCloseButton = a3;
    -[RelatedSearchSuggestionView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[RelatedSearchSuggestionView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[RelatedSearchSuggestionView safeAreaInsets](self, "safeAreaInsets");
  v3 = v2 + 49.0;
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RelatedSearchSuggestionView;
  -[RelatedSearchSuggestionView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[RelatedSearchSuggestionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[RelatedSearchSuggestionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  double x;
  double y;
  double width;
  double height;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  objc_super v28;
  CGRect v29;

  v28.receiver = self;
  v28.super_class = (Class)RelatedSearchSuggestionView;
  -[RelatedSearchSuggestionView layoutSubviews](&v28, "layoutSubviews");
  -[RelatedSearchSuggestionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_blurView);
  objc_msgSend(WeakRetained, "setFrame:", v4, v6, v8, v10);

  -[RelatedSearchSuggestionView bounds](self, "bounds");
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  if (CGRectGetHeight(v29) > 49.0)
  {
    -[RelatedSearchSuggestionView safeAreaInsets](self, "safeAreaInsets");
    height = height - v16;
  }
  if (self->_showCloseButton)
  {
    v17 = objc_loadWeakRetained((id *)&self->_closeButton);
    objc_msgSend(v17, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    width = width - (v23 + 30.0);
    v26 = objc_loadWeakRetained((id *)&self->_closeButton);
    objc_msgSend(v26, "setFrame:", v19 + width + 15.0, v21 + round((height - v25) * 0.5), v23, v25);

  }
  v27 = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(v27, "setFrame:", x, y, width, height);

}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

- (UIVisualEffectView)blurView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_blurView);
}

- (void)setBlurView:(id)a3
{
  objc_storeWeak((id *)&self->_blurView, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (MapsThemeButton)closeButton
{
  return (MapsThemeButton *)objc_loadWeakRetained((id *)&self->_closeButton);
}

- (void)setCloseButton:(id)a3
{
  objc_storeWeak((id *)&self->_closeButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_closeButton);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_blurView);
}

@end
