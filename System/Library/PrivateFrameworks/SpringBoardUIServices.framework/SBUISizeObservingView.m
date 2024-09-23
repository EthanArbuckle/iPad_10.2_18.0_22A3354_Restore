@implementation SBUISizeObservingView

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateInterestedInSizeChanges = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBUISizeObservingView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)SBUISizeObservingView;
  -[SBUISizeObservingView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  if (self->_delegateInterestedInSizeChanges)
  {
    -[SBUISizeObservingView bounds](self, "bounds");
    if (v9 != v13 || v11 != v12)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sizeObservingView:didChangeSize:", self, v9, v11);

    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id WeakRetained;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBUISizeObservingView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)SBUISizeObservingView;
  -[SBUISizeObservingView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (self->_delegateInterestedInSizeChanges)
  {
    -[SBUISizeObservingView bounds](self, "bounds");
    if (v9 != v13 || v11 != v12)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sizeObservingView:didChangeSize:", self, v9, v11);

    }
  }
}

- (SBUISizeObservingViewDelegate)delegate
{
  return (SBUISizeObservingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
