@implementation SBAppClipOverlayView

- (SBAppClipOverlayView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBAppClipOverlayView *v10;
  SBAppClipOverlayView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBAppClipOverlayView;
  v10 = -[SBAppClipOverlayView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    objc_storeWeak((id *)&v10->_delegate, v9);

  return v11;
}

- (SBAppClipOverlayView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayViewController.m"), 186, CFSTR("Use -initWithFrame:delegate:"));

  return -[SBAppClipOverlayView initWithFrame:delegate:](self, "initWithFrame:delegate:", 0, x, y, width, height);
}

- (SBAppClipOverlayView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppClipOverlayViewController.m"), 191, CFSTR("Use -initWithFrame:delegate:"));

  return -[SBAppClipOverlayView initWithFrame:delegate:](self, "initWithFrame:delegate:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)invalidate
{
  id v3;

  -[SBAppClipOverlayView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appClipPlaceholderViewDidInvalidate:", self);

}

- (SBAppClipOverlayViewDelegate)delegate
{
  return (SBAppClipOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
