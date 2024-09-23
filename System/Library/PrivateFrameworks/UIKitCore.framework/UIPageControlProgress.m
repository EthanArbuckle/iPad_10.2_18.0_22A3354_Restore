@implementation UIPageControlProgress

- (void)setPageControl:(id)a3
{
  UIPageControl **p_pageControl;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_pageControl = &self->_pageControl;
  WeakRetained = objc_loadWeakRetained((id *)p_pageControl);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_pageControl, obj);
    v6 = obj;
  }

}

- (void)setDelegate:(id)delegate
{
  UIPageControlProgressDelegate **p_delegate;
  id v5;
  char v6;

  p_delegate = &self->_delegate;
  v5 = delegate;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  if ((p_delegate & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFD | v6;
}

- (void)setCurrentProgress:(float)currentProgress
{
  float v3;
  id v4;

  v3 = fmax(fmin(currentProgress, 1.0), 0.0);
  if (self->_currentProgress != v3)
  {
    self->_currentProgress = v3;
    -[UIPageControlProgress pageControl](self, "pageControl");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateCurrentPageProgress");

  }
}

- (UIPageControl)pageControl
{
  return (UIPageControl *)objc_loadWeakRetained((id *)&self->_pageControl);
}

- (BOOL)isProgressVisible
{
  return self->_progressVisible;
}

- (UIPageControlProgress)init
{
  UIPageControlProgress *v2;
  UIPageControlProgress *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPageControlProgress;
  v2 = -[UIPageControlProgress init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIPageControlProgress _didChangeCurrentPage](v2, "_didChangeCurrentPage");
  return v3;
}

- (float)currentProgress
{
  return self->_currentProgress;
}

- (void)_progressVisibilityChanged:(BOOL)a3
{
  id v4;

  self->_progressVisible = a3;
  if ((*(_BYTE *)&self->_delegateImplements & 2) != 0)
  {
    -[UIPageControlProgress delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageControlProgressVisibilityDidChange:", self);

  }
}

- (float)_initialProgressForPage:(int64_t)a3
{
  void *v6;
  float v7;
  float v8;

  if ((*(_BYTE *)&self->_delegateImplements & 1) == 0)
    return 0.0;
  -[UIPageControlProgress delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageControlProgress:initialProgressForPage:", self, a3);
  v8 = v7;

  return v8;
}

- (void)_didChangeCurrentPage
{
  void *v3;
  id v4;

  -[UIPageControlProgress pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControlProgress _initialProgressForPage:](self, "_initialProgressForPage:", objc_msgSend(v3, "currentPage"));
  -[UIPageControlProgress setCurrentProgress:](self, "setCurrentProgress:");

  -[UIPageControlProgress pageControl](self, "pageControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateCurrentPageProgress");

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageControl);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
