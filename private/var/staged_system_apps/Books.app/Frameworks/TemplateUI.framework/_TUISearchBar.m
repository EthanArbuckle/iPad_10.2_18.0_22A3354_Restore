@implementation _TUISearchBar

- (_TUISearchBar)initWithFrame:(CGRect)a3
{
  _TUISearchBar *v3;
  _TUISearchScopeBarContainerView *v4;
  _TUISearchScopeBarContainerView *scopeBarContentView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TUISearchBar;
  v3 = -[_TUISearchBar initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[_TUISearchScopeBarContainerView initWithFrame:]([_TUISearchScopeBarContainerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    scopeBarContentView = v3->_scopeBarContentView;
    v3->_scopeBarContentView = v4;

    -[_TUISearchScopeBarContainerView setAlpha:](v3->_scopeBarContentView, "setAlpha:", 0.0);
    -[_TUISearchScopeBarContainerView setHidden:](v3->_scopeBarContentView, "setHidden:", 1);
    -[_TUISearchBar addSubview:](v3, "addSubview:", v3->_scopeBarContentView);
  }
  return v3;
}

- (CGSize)scopeBarContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_TUISearchScopeBarContainerView intrinsicContentSize](self->_scopeBarContentView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setScopeBarContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  -[_TUISearchScopeBarContainerView intrinsicContentSize](self->_scopeBarContentView, "intrinsicContentSize");
  if (width != v7 || height != v6)
  {
    -[_TUISearchScopeBarContainerView setIntrinsicContentSize:](self->_scopeBarContentView, "setIntrinsicContentSize:", width, height);
    if (self->_showsScopeBar)
      self->_needsUpdateScopeBarSize = 1;
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _TUISearchScopeBarContainerView *scopeBarContentView;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)_TUISearchBar;
  -[_TUISearchBar layoutSubviews](&v11, "layoutSubviews");
  -[_TUISearchBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  scopeBarContentView = self->_scopeBarContentView;
  -[_TUISearchBar bounds](self, "bounds");
  -[_TUISearchScopeBarContainerView sizeThatFits:](scopeBarContentView, "sizeThatFits:", v8, 0.0);
  v10 = v9;
  -[_TUISearchBar bounds](self, "bounds");
  -[_TUISearchScopeBarContainerView setFrame:](self->_scopeBarContentView, "setFrame:", v4, CGRectGetMaxY(v12) - v10, v6, v10);
  self->_needsUpdateScopeBarSize = 0;
}

- (void)setShowsScopeBar:(BOOL)a3
{
  -[_TUISearchBar setShowsScopeBar:animated:](self, "setShowsScopeBar:animated:", a3, 0);
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v7;
  _QWORD *v8;
  double v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  _QWORD *v13;
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;

  v4 = a4;
  v5 = a3;
  v7 = a3 && self->_needsUpdateScopeBarSize;
  self->_needsUpdateScopeBarSize = 0;
  if (v7 || self->_showsScopeBar != a3)
  {
    self->_showsScopeBar = a3;
    -[_TUISearchBar setNeedsLayout](self, "setNeedsLayout");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1523A0;
    v15[3] = &unk_23EA68;
    v16 = v5;
    v15[4] = self;
    v8 = objc_retainBlock(v15);
    if (v4)
    {
      -[_TUISearchScopeBarContainerView setHidden:](self->_scopeBarContentView, "setHidden:", 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_15246C;
      v12[3] = &unk_242AE8;
      v14 = v5;
      v12[4] = self;
      v13 = v8;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_15252C;
      v10[3] = &unk_2418D8;
      v11 = v5;
      v10[4] = self;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v12, v10, 0.35, 0.0);

    }
    else
    {
      v9 = 0.0;
      if (v5)
        v9 = 1.0;
      -[_TUISearchScopeBarContainerView setAlpha:](self->_scopeBarContentView, "setAlpha:", v9);
      ((void (*)(_QWORD *))v8[2])(v8);
      -[_TUISearchScopeBarContainerView setHidden:](self->_scopeBarContentView, "setHidden:", !v5);
    }

  }
}

- (BOOL)showsScopeBar
{
  return self->_showsScopeBar;
}

- (_TUISearchScopeBarContainerView)scopeBarContentView
{
  return self->_scopeBarContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeBarContentView, 0);
}

@end
