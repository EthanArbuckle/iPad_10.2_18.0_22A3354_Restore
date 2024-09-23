@implementation SBHWidgetContainerViewSnapshotResizeCoordinator

- (SBHWidgetContainerViewSnapshotResizeCoordinator)initWithResizableView:(id)a3 multiplexingView:(id)a4 newSize:(CGSize)a5 hideMultiplexingViewInitially:(BOOL)a6 showMultiplexingViewWhenFinished:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  SBHWidgetContainerViewSnapshotResizeCoordinator *v16;
  CGFloat v17;
  CGFloat v18;
  id v19;
  void *v20;
  UIView *v21;
  UIView *backgroundView;
  objc_super v24;

  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBHWidgetContainerViewSnapshotResizeCoordinator;
  v16 = -[SBHWidgetContainerViewSnapshotResizeCoordinator init](&v24, sel_init);
  if (v16 == self)
  {
    objc_storeStrong((id *)&self->_resizableView, a3);
    objc_storeStrong((id *)&self->_multiplexingView, a4);
    self->_newSize.width = width;
    self->_newSize.height = height;
    objc_msgSend(v14, "bounds");
    self->_currentSize.width = v17;
    self->_currentSize.height = v18;
    self->_shouldHideMultiplexingViewInitially = a6;
    self->_shouldShowMultiplexingViewWhenFinished = a7;
    v19 = v14;
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "backgroundView");
      v21 = (UIView *)objc_claimAutoreleasedReturnValue();
      backgroundView = self->_backgroundView;
      self->_backgroundView = v21;

    }
  }

  return v16;
}

- (void)resize
{
  double height;
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "coordinatorWillResize:", self);
  height = self->_currentSize.height;
  -[SBHWidgetContainerViewSnapshotResizeCoordinator _deltaHeight](self, "_deltaHeight");
  -[UIView setFrame:](self->_resizableView, "setFrame:", 0.0, height + v4, self->_currentSize.width, self->_currentSize.height);
  -[UIView setNeedsLayout](self->_resizableView, "setNeedsLayout");

}

- (void)setUpResize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *backgroundView;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "coordinatorWillSetUpResize:", self);
  -[UIView frame](self->_resizableView, "frame");
  v4 = v3;
  v6 = v5;
  -[SBHWidgetContainerViewSnapshotResizeCoordinator _deltaWidth](self, "_deltaWidth");
  v8 = v7 * -0.5;
  -[SBHWidgetContainerViewSnapshotResizeCoordinator _deltaHeight](self, "_deltaHeight");
  -[UIView setFrame:](self->_resizableView, "setFrame:", v8, v6 + v9 * -0.5, v4, v6);
  -[UIView setNeedsLayout](self->_resizableView, "setNeedsLayout");
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    self->_backgroundViewAutoresizing = -[UIView autoresizingMask](backgroundView, "autoresizingMask");
    -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
  }
  if (self->_shouldHideMultiplexingViewInitially)
    -[UIView setAlpha:](self->_multiplexingView, "setAlpha:", 0.0);

}

- (void)finishResize
{
  UIView *backgroundView;
  id WeakRetained;

  backgroundView = self->_backgroundView;
  if (backgroundView)
    -[UIView setAutoresizingMask:](backgroundView, "setAutoresizingMask:", self->_backgroundViewAutoresizing);
  if (self->_shouldShowMultiplexingViewWhenFinished)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "coordinatorWillFinishResize:", self);
    -[UIView setAlpha:](self->_multiplexingView, "setAlpha:", 1.0);

  }
}

- (double)_deltaHeight
{
  return self->_newSize.height - self->_currentSize.height;
}

- (double)_deltaWidth
{
  return self->_newSize.width - self->_currentSize.width;
}

- (SBHViewResizeCoordinatorDelegate)delegate
{
  return (SBHViewResizeCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_multiplexingView, 0);
  objc_storeStrong((id *)&self->_resizableView, 0);
}

@end
