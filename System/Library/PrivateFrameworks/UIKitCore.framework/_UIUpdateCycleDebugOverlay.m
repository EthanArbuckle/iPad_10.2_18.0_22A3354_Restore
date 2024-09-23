@implementation _UIUpdateCycleDebugOverlay

+ (id)instance
{
  if (_MergedGlobals_948 != -1)
    dispatch_once(&_MergedGlobals_948, &__block_literal_global_36);
  return (id)qword_1ECD7CBF8;
}

- (void)_updateCompleted
{
  char *v3;
  uint64_t v4;
  id v5;

  _UIUpdateCompletionObservationAddObserver(mainCompletionObservation, (unint64_t)self, 0);
  v3 = (char *)off_1ECD75C00 + 648;
  if (*((_DWORD *)off_1ECD75C00 + 160) != 1)
    v3 = 0;
  v4 = *((_QWORD *)v3 + 2);
  if (v4 >= mach_absolute_time())
  {
    if (self->_windowWithBorder)
      -[_UIUpdateCycleDebugOverlay removeBorderFromWindow:](self, "removeBorderFromWindow:");
  }
  else
  {
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIUpdateCycleDebugOverlay addBorderToWindow:](self, "addBorderToWindow:", v5);

  }
}

- (void)addBorderToWindow:(id)a3
{
  UIWindow *v4;
  UIWindow *v5;
  UIWindow *windowWithBorder;
  BOOL v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  UIWindow *v12;

  v4 = (UIWindow *)a3;
  v5 = v4;
  windowWithBorder = self->_windowWithBorder;
  if (windowWithBorder)
    v7 = windowWithBorder == v4;
  else
    v7 = 1;
  if (!v7)
    -[_UIUpdateCycleDebugOverlay removeBorderFromWindow:](self, "removeBorderFromWindow:");
  -[UIView layer](v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 12.0);

  +[UIColor redColor](UIColor, "redColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGColor");
  -[UIView layer](v5, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v10);

  v12 = self->_windowWithBorder;
  self->_windowWithBorder = v5;

}

- (void)removeBorderFromWindow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  UIWindow *windowWithBorder;

  v4 = a3;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 0.0);

  +[UIColor clearColor](UIColor, "clearColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  objc_msgSend(v4, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBorderColor:", v7);
  windowWithBorder = self->_windowWithBorder;
  self->_windowWithBorder = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowWithBorder, 0);
}

@end
