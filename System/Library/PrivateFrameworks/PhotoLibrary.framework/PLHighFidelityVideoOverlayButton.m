@implementation PLHighFidelityVideoOverlayButton

- (PLHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  UIButton *v8;
  PLHighFidelityVideoOverlayButton *v9;
  PLHighFidelityVideoOverlayButton *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v5 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLVideoOverlayGlyphMask"), v5);
  v7 = objc_alloc(MEMORY[0x1E0CEA3A0]);
  v8 = (UIButton *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIButton setImage:forState:](v8, "setImage:forState:", v6, 0);
  -[UIButton sizeToFit](v8, "sizeToFit");
  -[UIButton frame](v8, "frame");
  v14.receiver = self;
  v14.super_class = (Class)PLHighFidelityVideoOverlayButton;
  v9 = -[PLHighFidelityVideoOverlayButton initWithFrame:](&v14, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    v9->_button = v8;
    -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v9, sel__playButtonTapped_, 64);
    -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v10, sel__playButtonActivate_, 1);
    -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v10, sel__playButtonActivate_, 4);
    -[UIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v10, sel__playButtonDeactivate_, 8);
    -[UIButton setDeliversTouchesForGesturesToSuperview:](v8, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[PLHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", v10->_button);
    -[PLHighFidelityVideoOverlayButton setAutoresizingMask:](v10, "setAutoresizingMask:", 45);
    if (!a3)
    {
      v11 = objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLVideoOverlayBackgroundMask"), v5);
      v10->_overlayPlayBackground = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v11);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithPrivateStyle:", 2010);
      v10->_backdropView = (_UIBackdropView *)v12;
      -[PLHighFidelityVideoOverlayButton insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v12, v10->_button);
      -[PLHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", v10->_overlayPlayBackground);
      -[UIImageView _setBackdropMaskViewFlags:](v10->_overlayPlayBackground, "_setBackdropMaskViewFlags:", 7);
      -[UIImageView setAlpha:](v10->_overlayPlayBackground, "setAlpha:", 0.0);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", v10->_overlayPlayBackground);
      -[UIButton _setBackdropMaskViewFlags:](v10->_button, "_setBackdropMaskViewFlags:", 3);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", v10->_button);
    }
  }
  else
  {

  }
  -[PLHighFidelityVideoOverlayButton _playButtonDeactivate:](v10, "_playButtonDeactivate:", 0);
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
  v11.super_class = (Class)PLHighFidelityVideoOverlayButton;
  -[PLHighFidelityVideoOverlayButton layoutSubviews](&v11, sel_layoutSubviews);
  -[PLHighFidelityVideoOverlayButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIImageView setFrame:](self->_overlayPlayBackground, "setFrame:", v4, v6, v8, v10);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLHighFidelityVideoOverlayButton;
  -[PLHighFidelityVideoOverlayButton dealloc](&v3, sel_dealloc);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_target = a3;
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
  -[PLHighFidelityVideoOverlayButton _playButtonDeactivate:](self, "_playButtonDeactivate:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_target, "performSelector:withObject:", self->_action, self);
}

@end
