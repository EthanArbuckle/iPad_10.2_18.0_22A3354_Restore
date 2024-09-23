@implementation UIScrollViewMonitor

- (UIScrollViewMonitor)initWithScrollView:(id)a3
{
  id v5;
  UIScrollViewMonitor *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIScrollViewMonitor;
  v6 = -[UIScrollViewMonitor init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_storeStrong((id *)&v6->_scrollView, a3);
      objc_msgSend(v5, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_window, v8);

      -[UIScrollView _addScrollViewScrollObserver:](v6->_scrollView, "_addScrollViewScrollObserver:", v6);
      WeakRetained = objc_loadWeakRetained((id *)&v6->_window);
      objc_msgSend(WeakRetained, "_registerSubtreeMonitor:", v6);
    }
    else
    {
      WeakRetained = v6;
      v6 = 0;
    }

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id obj;

  obj = a3;
  objc_setAssociatedObject(self, &_UIScrollViewDelegateAssociationKey, obj, (void *)0x301);
  v4 = objc_storeWeak((id *)&self->_delegate, obj);
  objc_msgSend(obj, "scrollViewMonitorDidStartMonitoring:", self->_scrollView);

}

- (void)stopMonitoring
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "scrollViewMonitorDidStopMonitoring:", self->_scrollView);

  -[UIScrollView _removeScrollViewScrollObserver:](self->_scrollView, "_removeScrollViewScrollObserver:", self);
  v4 = objc_loadWeakRetained((id *)&self->_window);
  objc_msgSend(v4, "_unregisterSubtreeMonitor:", self);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  UIScrollViewMonitorDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "scrollViewMonitorScrollDidScrolled:", v4);

}

- (BOOL)_monitorsView:(id)a3
{
  return objc_msgSend(a3, "isDescendantOfView:", self->_scrollView);
}

- (void)_monitoredView:(id)a3 didMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id WeakRetained;
  void *v9;
  UIScrollView *scrollView;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  if (objc_msgSend(v13, "isDescendantOfView:", self->_scrollView))
  {
    if (!a5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = WeakRetained;
      scrollView = self->_scrollView;
      v11 = 0;
      v12 = v13;
      goto LABEL_6;
    }
    if (!a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v9 = WeakRetained;
      scrollView = self->_scrollView;
      v11 = v13;
      v12 = 0;
LABEL_6:
      objc_msgSend(WeakRetained, "scrollViewMonitorScrollDid:addView:removeView:", scrollView, v11, v12);

    }
  }

}

- (UIScrollViewMonitorDelegate)delegate
{
  return (UIScrollViewMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
