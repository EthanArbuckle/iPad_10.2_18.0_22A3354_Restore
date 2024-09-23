@implementation _UIPointerEffectTintView

- (_UIPointerEffectTintView)initWithTintColorMatrixProvider:(id)a3
{
  id v4;
  _UIPointerEffectTintView *v5;
  uint64_t v6;
  id tintColorMatrixProvider;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIPointerEffectTintView;
  v5 = -[UIVisualEffectView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tintColorMatrixProvider = v5->_tintColorMatrixProvider;
    v5->_tintColorMatrixProvider = (id)v6;

    -[_UIPointerEffectTintView _updateBackgroundEffects](v5, "_updateBackgroundEffects");
    -[_UIPointerEffectTintView _updateAlpha](v5, "_updateAlpha");
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UIView layer](v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsHitTesting:", 0);

  }
  return v5;
}

- (void)_updateAlpha
{
  BOOL v3;
  double v4;

  v3 = -[_UIPointerEffectTintView isDisabled](self, "isDisabled");
  v4 = 0.0;
  if (!v3)
  {
    -[_UIPointerEffectTintView isPressed](self, "isPressed", 0.0);
    PSContentOverlayIntensityForLuminanceAndUsage();
  }
  -[UIView setAlpha:](self, "setAlpha:", v4);
}

- (void)_updateBackgroundEffects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  (*((void (**)(void))self->_tintColorMatrixProvider + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "CAColorMatrixValue");
  else
    memset(v7, 0, sizeof(v7));
  +[UIColorEffect _colorEffectCAMatrix:](UIColorEffect, "_colorEffectCAMatrix:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self, "setBackgroundEffects:", v6);

}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[_UIPointerEffectTintView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[_UIPointerEffectTintView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  self->_luminance = a4;
  -[_UIPointerEffectTintView _updateBackgroundEffects](self, "_updateBackgroundEffects", a3);
  -[_UIPointerEffectTintView _updateAlpha](self, "_updateAlpha");
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tintColorMatrixProvider, 0);
}

@end
