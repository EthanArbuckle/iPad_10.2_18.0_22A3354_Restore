@implementation UIStatusBarActivityItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  int slowActivity;
  unsigned int v7;
  int v8;
  BOOL result;
  _BOOL4 v10;

  v5 = objc_msgSend(a3, "rawData");
  slowActivity = self->_slowActivity;
  v7 = *(unsigned __int8 *)(v5 + 2272);
  v8 = (v7 >> 1) & 1;
  result = slowActivity != v8;
  if (slowActivity != v8)
  {
    self->_slowActivity = (v7 & 2) != 0;
    v7 = *(unsigned __int8 *)(v5 + 2272);
  }
  v10 = (v7 >> 2) & 1;
  if (self->_syncActivity != v10)
  {
    self->_syncActivity = v10;
    return 1;
  }
  return result;
}

- (int64_t)_activityIndicatorStyle
{
  void *v3;
  int64_t v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityIndicatorStyleWithSyncActivity:", self->_syncActivity);

  return v4;
}

- (void)_startAnimating
{
  if (-[UIStatusBarItemView isVisible](self, "isVisible"))
  {
    if (!-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating"))
    {
      -[UIStatusBarItemView beginDisablingRasterization](self, "beginDisablingRasterization");
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    }
  }
}

- (void)_stopAnimating
{
  if (!-[UIStatusBarItemView isVisible](self, "isVisible"))
  {
    if (-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating"))
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
      -[UIActivityIndicatorView stopAnimating](self->_accessibilityHUDIndicator, "stopAnimating");
      -[UIStatusBarItemView endDisablingRasterization](self, "endDisablingRasterization");
    }
  }
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarActivityItemView;
  -[UIStatusBarItemView setVisible:](&v5, sel_setVisible_);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopAnimating, 0);
  if (v3)
  {
    -[UIStatusBarActivityItemView _startAnimating](self, "_startAnimating");
  }
  else
  {
    +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
    -[UIStatusBarActivityItemView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__stopAnimating, 0);
  }
}

- (double)updateContentsAndWidth
{
  int64_t v3;
  UIActivityIndicatorView *activityIndicator;
  double v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double *v17;

  v3 = -[UIStatusBarActivityItemView _activityIndicatorStyle](self, "_activityIndicatorStyle");
  activityIndicator = self->_activityIndicator;
  if (activityIndicator)
  {
    v5 = 0.0;
    if (-[UIActivityIndicatorView activityIndicatorViewStyle](activityIndicator, "activityIndicatorViewStyle") == v3)
      goto LABEL_7;
    activityIndicator = self->_activityIndicator;
  }
  -[UIView removeFromSuperview](activityIndicator, "removeFromSuperview");
  v6 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", v3);
  v7 = self->_activityIndicator;
  self->_activityIndicator = v6;

  -[UIView frame](self->_activityIndicator, "frame");
  v9 = v8;
  v11 = v10;
  -[UIView bounds](self, "bounds");
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", 0.0, floor((v12 - v11) * 0.5), v9, v11);
  -[UIView addSubview:](self, "addSubview:", self->_activityIndicator);
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "usesVerticalLayout"))
    v9 = v11;

  -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:", v9);
  v5 = v14;
LABEL_7:
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityIndicatorView setColor:](self->_activityIndicator, "setColor:", v16);
  v17 = (double *)((char *)&unk_186682E90 + 8 * !self->_slowActivity);
  if (self->_syncActivity)
    v17 = (double *)((char *)&unk_186682E80 + 8 * !self->_slowActivity);
  -[UIActivityIndicatorView setAnimationDuration:](self->_activityIndicator, "setAnimationDuration:", *v17);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__stopAnimating, 0);
  -[UIStatusBarActivityItemView _startAnimating](self, "_startAnimating");

  return v5;
}

- (double)shadowPadding
{
  double result;
  objc_super v3;

  result = 0.0;
  if (!self->_syncActivity)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIStatusBarActivityItemView;
    -[UIStatusBarItemView shadowPadding](&v3, sel_shadowPadding, 0.0);
  }
  return result;
}

- (id)accessibilityHUDRepresentation
{
  UIActivityIndicatorView *accessibilityHUDIndicator;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *v6;
  void *v7;
  UIAccessibilityHUDItem *v8;

  if (-[UIStatusBarActivityItemView _activityIndicatorStyle](self, "_activityIndicatorStyle") == 6)
  {
    accessibilityHUDIndicator = self->_accessibilityHUDIndicator;
    if (!accessibilityHUDIndicator)
    {
      v4 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", 101);
      v5 = self->_accessibilityHUDIndicator;
      self->_accessibilityHUDIndicator = v4;

      v6 = self->_accessibilityHUDIndicator;
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.25, 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setColor:](v6, "setColor:", v7);

      accessibilityHUDIndicator = self->_accessibilityHUDIndicator;
    }
    -[UIActivityIndicatorView setAnimationDuration:](accessibilityHUDIndicator, "setAnimationDuration:", dbl_186682E90[!self->_slowActivity]);
    if (-[UIActivityIndicatorView isAnimating](self->_activityIndicator, "isAnimating")
      && !-[UIActivityIndicatorView isAnimating](self->_accessibilityHUDIndicator, "isAnimating"))
    {
      -[UIActivityIndicatorView startAnimating](self->_accessibilityHUDIndicator, "startAnimating");
    }
    v8 = -[UIAccessibilityHUDItem initWithCustomView:]([UIAccessibilityHUDItem alloc], "initWithCustomView:", self->_accessibilityHUDIndicator);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityHUDIndicator, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
