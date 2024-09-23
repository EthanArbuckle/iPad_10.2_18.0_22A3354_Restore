@implementation PXHighFidelityVideoOverlayButton

- (PXHighFidelityVideoOverlayButton)initWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  PXHighFidelityVideoOverlayButton *v9;
  PXHighFidelityVideoOverlayButton *v10;
  id *p_button;
  void *v12;
  uint64_t v13;
  UIImageView *overlayPlayBackground;
  uint64_t v15;
  _UIBackdropView *backdropView;
  objc_super v18;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC3518]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v8, "setImage:forState:", v6, 0);
  objc_msgSend(v8, "sizeToFit");
  objc_msgSend(v8, "frame");
  v18.receiver = self;
  v18.super_class = (Class)PXHighFidelityVideoOverlayButton;
  v9 = -[PXHighFidelityVideoOverlayButton initWithFrame:](&v18, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_overlayConfiguration, a3);
    p_button = (id *)&v10->_button;
    objc_storeStrong((id *)&v10->_button, v8);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonTapped_, 64);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonActivate_, 1);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonActivate_, 4);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v10, sel__playButtonDeactivate_, 8);
    objc_msgSend(v8, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[PXHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", v10->_button);
    -[PXHighFidelityVideoOverlayButton setAutoresizingMask:](v10, "setAutoresizingMask:", 45);
    if ((unint64_t)objc_msgSend(v5, "style") <= 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v12);
      overlayPlayBackground = v10->_overlayPlayBackground;
      v10->_overlayPlayBackground = (UIImageView *)v13;

      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2010);
      backdropView = v10->_backdropView;
      v10->_backdropView = (_UIBackdropView *)v15;

      -[PXHighFidelityVideoOverlayButton insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v10->_backdropView, *p_button);
      -[PXHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", v10->_overlayPlayBackground);
      -[UIImageView _setBackdropMaskViewFlags:](v10->_overlayPlayBackground, "_setBackdropMaskViewFlags:", 7);
      -[UIImageView setAlpha:](v10->_overlayPlayBackground, "setAlpha:", 0.0);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", v10->_overlayPlayBackground);
      objc_msgSend(*p_button, "_setBackdropMaskViewFlags:", 3);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", *p_button);

    }
  }
  -[PXHighFidelityVideoOverlayButton _playButtonDeactivate:](v10, "_playButtonDeactivate:", 0);

  return v10;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXHighFidelityVideoOverlayButton;
  -[PXHighFidelityVideoOverlayButton layoutSubviews](&v11, sel_layoutSubviews);
  -[PXHighFidelityVideoOverlayButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIImageView setFrame:](self->_overlayPlayBackground, "setFrame:", v4, v6, v8, v10);
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  self->_action = a4;
}

- (void)_playButtonActivate:(id)a3
{
  -[UIButton setAlpha:](self->_button, "setAlpha:", a3, 0.5);
}

- (void)_playButtonDeactivate:(id)a3
{
  -[UIButton setAlpha:](self->_button, "setAlpha:", a3, 0.300000012);
}

- (void)_playButtonTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  -[PXHighFidelityVideoOverlayButton _playButtonDeactivate:](self, "_playButtonDeactivate:");
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained(&self->_target);
    objc_msgSend(v6, "performSelector:withObject:", self->_action, v7);

  }
}

- (void)setShowAsPause:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_showAsPause != a3)
  {
    v3 = a3;
    self->_showAsPause = a3;
    if (a3 && !-[PXHighFidelityVideoOverlayButton _didConfigureForPause](self, "_didConfigureForPause"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](self->_button, "setImage:forState:", v5, 4);
      -[UIButton setImage:forState:](self->_button, "setImage:forState:", v5, 5);
      -[PXHighFidelityVideoOverlayButton _setDidConfigureForPause:](self, "_setDidConfigureForPause:", 1);

    }
    -[UIButton setSelected:](self->_button, "setSelected:", v3);
    -[_UIBackdropView updateMaskViewsForView:](self->_backdropView, "updateMaskViewsForView:", self->_button);
  }
}

- (BOOL)showAsPause
{
  return self->_showAsPause;
}

- (BOOL)_didConfigureForPause
{
  return self->__didConfigureForPause;
}

- (void)_setDidConfigureForPause:(BOOL)a3
{
  self->__didConfigureForPause = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_storeStrong((id *)&self->_overlayPlayBackground, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
