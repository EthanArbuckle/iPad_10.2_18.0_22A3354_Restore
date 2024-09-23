@implementation _UIScrollViewRefreshControlHost

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (BOOL)refreshControlInsetsAffectScrollViewRubberBanding
{
  return 1;
}

- (void)refreshControl:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5
{
  id v8;
  id WeakRetained;
  int v10;
  id v11;
  id v12;
  void *v13;
  _BOOL8 refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle;
  id v15;

  v8 = a3;
  if (!a5)
  {
    v15 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    v10 = objc_msgSend(WeakRetained, "isTracking");

    v8 = v15;
    if (v10)
    {
      self->_refreshControlAutomaticContentOffsetAdjustmentEnabledNeedsReset = 1;
      v11 = objc_loadWeakRetained((id *)&self->_scrollView);
      self->_refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle = objc_msgSend(v11, "_isAutomaticContentOffsetAdjustmentEnabled");

      v12 = objc_loadWeakRetained((id *)&self->_scrollView);
      v13 = v12;
      refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle = 0;
LABEL_7:
      objc_msgSend(v12, "_setAutomaticContentOffsetAdjustmentEnabled:", refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle);

      v8 = v15;
      goto LABEL_8;
    }
  }
  if (!a4 && self->_refreshControlAutomaticContentOffsetAdjustmentEnabledNeedsReset)
  {
    v15 = v8;
    self->_refreshControlAutomaticContentOffsetAdjustmentEnabledNeedsReset = 0;
    v12 = objc_loadWeakRetained((id *)&self->_scrollView);
    v13 = v12;
    refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle = self->_refreshControlAutomaticContentOffsetAdjustmentEnabledWhenLastIdle;
    goto LABEL_7;
  }
LABEL_8:

}

- (_UIScrollViewRefreshControlHost)initWithScrollView:(id)a3
{
  id v4;
  _UIScrollViewRefreshControlHost *v5;
  _UIScrollViewRefreshControlHost *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIScrollViewRefreshControlHost;
  v5 = -[_UIScrollViewRefreshControlHost init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scrollView, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)decrementInsetHeight:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_removeRefreshInset:", a3);

}

- (void)incrementInsetHeight:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "_addRefreshInset:", a3);

}

@end
