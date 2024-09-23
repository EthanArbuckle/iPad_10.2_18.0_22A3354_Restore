@implementation _UIScrollsToTopInitiatorView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIScrollsToTopInitiatorView;
  -[UIView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)UIApp;
  -[UIView _screen](self, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_keyWindowForScreen:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && -[_UIScrollsToTopInitiatorView _shouldSeekHigherPriorityTouchTarget](self, "_shouldSeekHigherPriorityTouchTarget")&& v9 != v12)
  {
    objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
    objc_msgSend(v12, "_targetForStolenStatusBarTouchesAtPoint:withEvent:excludingWindow:", v7, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;

      v8 = v15;
    }

  }
  return v8;
}

- (BOOL)_shouldSeekHigherPriorityTouchTarget
{
  return 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  objc_msgSend(v6, "allTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v24, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v11 = v10;
    objc_msgSend(v9, "initialTouchTimestamp");
    if (v11 - v12 <= 0.75)
    {
      -[UIView window](self, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationInView:", 0);
      objc_msgSend(v13, "convertPoint:toWindow:", 0);
      v16 = v15;
      -[UIView window](self, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = _UIAdjustedLocationForScreenTouchLocation(v17, v16);
      v20 = v19;

      v21 = (void *)UIApp;
      -[UIView _screen](self, "_screen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_keyWindowForScreen:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", 0, v18, v20);

      objc_msgSend((id)UIApp, "_scrollsToTopInitiatorView:touchesEnded:withEvent:", self, v24, v6);
    }

  }
}

@end
