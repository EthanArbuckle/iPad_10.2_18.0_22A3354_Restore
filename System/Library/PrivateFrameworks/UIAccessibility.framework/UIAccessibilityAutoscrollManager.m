@implementation UIAccessibilityAutoscrollManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  return (id)sharedInstance__shared;
}

void __50__UIAccessibilityAutoscrollManager_sharedInstance__block_invoke()
{
  UIAccessibilityAutoscrollManager *v0;
  void *v1;

  v0 = objc_alloc_init(UIAccessibilityAutoscrollManager);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

}

- (UIAccessibilityAutoscrollManager)init
{
  UIAccessibilityAutoscrollManager *v2;
  UIAccessibilityAutoscrollManager *v3;
  UIAccessibilityAutoscrollManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityAutoscrollManager;
  v2 = -[UIAccessibilityAutoscrollManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIAccessibilityAutoscrollManager setAutoscrollSpeed:](v2, "setAutoscrollSpeed:", 20.0);
    -[UIAccessibilityAutoscrollManager setScrollDirection:](v3, "setScrollDirection:", 4);
    v4 = v3;
  }

  return v3;
}

- (BOOL)autoscrollInDirection:(unint64_t)a3
{
  -[UIAccessibilityAutoscrollManager setScrollDirection:](self, "setScrollDirection:", a3);
  if (self->_autoscrolling)
    -[UIAccessibilityAutoscrollManager pause](self, "pause");
  self->_autoscrolling = 1;
  return -[UIAccessibilityAutoscrollManager _autoscroll](self, "_autoscroll");
}

- (unint64_t)availableAutoscrollDirections
{
  return 30;
}

- (void)pause
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  self->_autoscrolling = 0;
  if (-[UIAccessibilityAutoscrollManager scrollDirection](self, "scrollDirection") == 4)
    v3 = -0.01;
  else
    v3 = dbl_19D142F70[-[UIAccessibilityAutoscrollManager scrollDirection](self, "scrollDirection") == 16];
  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v6 = v3 + v5;
  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentOffset");
  v9 = v3 + v8;

  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityApplyScrollContentOverride:sendScrollStatus:animateWithDuration:animationCurve:", 0, 3, v6, v9, 0.1);

}

- (void)incrementAutoscrollSpeed
{
  double v3;
  double v4;

  -[UIAccessibilityAutoscrollManager autoscrollSpeed](self, "autoscrollSpeed");
  v4 = v3 + 10.0;
  if (v4 > 100.0)
    v4 = 100.0;
  -[UIAccessibilityAutoscrollManager setAutoscrollSpeed:](self, "setAutoscrollSpeed:", v4);
}

- (void)decrementAutoscrollSpeed
{
  double v3;
  double v4;

  -[UIAccessibilityAutoscrollManager autoscrollSpeed](self, "autoscrollSpeed");
  v4 = v3 + -10.0;
  if (v4 < 10.0)
    v4 = 10.0;
  -[UIAccessibilityAutoscrollManager setAutoscrollSpeed:](self, "setAutoscrollSpeed:", v4);
}

- (void)setAutoscrollSpeed:(double)a3
{
  self->_autoscrollSpeed = a3;
  if (self->_autoscrolling)
  {
    if (-[UIAccessibilityAutoscrollManager _scrollViewIsOnScreen](self, "_scrollViewIsOnScreen"))
      -[UIAccessibilityAutoscrollManager autoscrollInDirection:](self, "autoscrollInDirection:", -[UIAccessibilityAutoscrollManager scrollDirection](self, "scrollDirection"));
  }
}

- (void)scrollToTop
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityVisibleContentInset");
  v5 = v4;
  v7 = v6;

  v8 = *MEMORY[0x1E0C9D538] - v7;
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8) - v5;
  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentOffset:animated:", !self->_autoscrolling, v8, v9);

}

- (void)scrollToBottom
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_accessibilityVisibleContentInset");
  v4 = v3;
  v6 = *MEMORY[0x1E0C9D538] - v5;
  objc_msgSend(v12, "contentSize");
  v8 = v7;
  objc_msgSend(v12, "bounds");
  v10 = v4 + v8 - v9;
  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentOffset:animated:", 1, v6, v10);

}

- (BOOL)_scrollViewIsOnScreen
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  double v8;

  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isHidden") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alpha");
      v6 = v8 > 0.0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_autoscroll
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UIAccessibilityAutoscrollManager scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIAccessibilityAutoscrollManager _scrollViewIsOnScreen](self, "_scrollViewIsOnScreen"))
  {
    if (self->_autoscrolling)
    {
      v4 = -[UIAccessibilityAutoscrollManager scrollDirection](self, "scrollDirection");
      objc_msgSend(v3, "contentOffset");
      v6 = v5;
      v8 = v7;
      objc_msgSend(v3, "contentSize");
      v10 = v9;
      v12 = v11;
      objc_msgSend(v3, "bounds");
      *((_QWORD *)&v15 + 1) = v4;
      *(_QWORD *)&v15 = v4 - 2;
      v16 = 0.0;
      switch((unint64_t)(v15 >> 1))
      {
        case 0uLL:
          if (v8 <= 0.0)
            goto LABEL_17;
          v16 = fabs(v8);
          v8 = 0.0;
          goto LABEL_19;
        case 1uLL:
          if (v8 + v14 > v12)
            goto LABEL_17;
          v16 = vabdd_f64(v8, v12 - v14);
          v8 = v12 - v14;
          goto LABEL_19;
        case 3uLL:
          if (v6 <= 0.0)
            goto LABEL_17;
          v16 = fabs(v6);
          v6 = 0.0;
          goto LABEL_19;
        case 7uLL:
          if (v6 + v13 <= v10)
          {
            v16 = vabdd_f64(v6, v10 - v13);
            v6 = v10 - v13;
LABEL_19:
            objc_msgSend(v3, "accessibilityApplyScrollContentOverride:sendScrollStatus:animateWithDuration:animationCurve:", 0, 3, v6, v8, v16 / (self->_autoscrollSpeed + self->_autoscrollSpeed));
            v19 = 1;
          }
          else
          {
LABEL_17:
            v19 = 0;
            self->_autoscrolling = 0;
          }
          break;
        default:
          goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  else
  {
    AXLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v3;
      _os_log_impl(&dword_19D0DD000, v17, OS_LOG_TYPE_INFO, "scroll view is not onscreen any longer. Stopping autoscroll: %@", (uint8_t *)&v21, 0xCu);
    }

    self->_autoscrolling = 0;
  }
  AXLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v21 = 138412290;
    v22 = v3;
    _os_log_impl(&dword_19D0DD000, v18, OS_LOG_TYPE_INFO, "stopping autoscroll now: %@", (uint8_t *)&v21, 0xCu);
  }

  v19 = 0;
LABEL_20:

  return v19;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (BOOL)isAutoscrolling
{
  return self->_autoscrolling;
}

- (void)setAutoscrolling:(BOOL)a3
{
  self->_autoscrolling = a3;
}

- (unint64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setScrollDirection:(unint64_t)a3
{
  self->_scrollDirection = a3;
}

- (double)autoscrollSpeed
{
  return self->_autoscrollSpeed;
}

- (id)targetToScroll
{
  return self->_targetToScroll;
}

- (void)setTargetToScroll:(id)a3
{
  objc_storeStrong(&self->_targetToScroll, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetToScroll, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
