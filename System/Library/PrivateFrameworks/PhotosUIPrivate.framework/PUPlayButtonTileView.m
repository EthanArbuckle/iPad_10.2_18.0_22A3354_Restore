@implementation PUPlayButtonTileView

- (PUPlayButtonTileView)initWithStyle:(int64_t)a3
{
  PUPlayButtonTileView *v4;
  uint64_t v5;
  PXVideoOverlayButton *button;
  void *v7;
  uint64_t v8;
  PXVideoOverlayButton *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPlayButtonTileView;
  v4 = -[PUPlayButtonTileView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", 3);
        v5 = objc_claimAutoreleasedReturnValue();
        button = v4->_button;
        v4->_button = (PXVideoOverlayButton *)v5;

        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXVideoOverlayButton setTintColor:](v4->_button, "setTintColor:", v7);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v4->_button;
      v4->_button = (PXVideoOverlayButton *)v8;

    }
    -[PXVideoOverlayButton setAutoresizingMask:](v4->_button, "setAutoresizingMask:", 45);
    -[PUPlayButtonTileView bounds](v4, "bounds");
    PXRectGetCenter();
    -[PXVideoOverlayButton setCenter:](v4->_button, "setCenter:");
    -[PUPlayButtonTileView addSubview:](v4, "addSubview:", v4->_button);
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PUPlayButtonTileView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPlayButtonTileView;
  -[PUPlayButtonTileView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PUPlayButtonTileView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)setShowAsPause:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPlayButtonTileView button](self, "button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAsPause:", v3);

}

- (BOOL)showAsPause
{
  void *v2;
  char v3;

  -[PUPlayButtonTileView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showAsPause");

  return v3;
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PUPlayButtonTileView button](self, "button");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTarget:action:", v6, a4);

}

- (PUPlayButtonTileView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayButtonTileView.m"), 65, CFSTR("%s is not available as initializer"), "-[PUPlayButtonTileView initWithFrame:]");

  abort();
}

- (PUPlayButtonTileView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayButtonTileView.m"), 69, CFSTR("%s is not available as initializer"), "-[PUPlayButtonTileView init]");

  abort();
}

- (PUPlayButtonTileView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPlayButtonTileView.m"), 73, CFSTR("%s is not available as initializer"), "-[PUPlayButtonTileView initWithCoder:]");

  abort();
}

- (PXVideoOverlayButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
