@implementation _PKVisibilityBackdropView

- (void)pkui_setVisibility:(double)a3 animated:(BOOL)a4
{
  if (self->_visibility != fmax(fmin(a3, 1.0), 0.0))
    -[_PKVisibilityBackdropView _pkui_setVisibility:animated:](self, "_pkui_setVisibility:animated:", a4);
}

- (void)setDelegate:(id)a3
{
  _PKVisibilityBackdropViewDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_storeWeak((id *)p_delegate, v5);

  if (WeakRetained != v5 || v5 == 0 || WeakRetained == 0)
    -[_PKVisibilityBackdropView _updateStyleIfNecessary](self, "_updateStyleIfNecessary");

}

- (void)pkui_updateBackdropSettings
{
  if (!self->_updatingBackdropSettings)
  {
    self->_updatingBackdropSettings = 1;
    -[_UIBackdropView transitionComplete](self, "transitionComplete");
    -[_PKVisibilityBackdropView pkui_commitBackdropSettings](self, "pkui_commitBackdropSettings");
  }
}

- (_PKVisibilityBackdropView)initWithFrame:(CGRect)a3 privateStyle:(int64_t)a4
{
  _PKVisibilityBackdropView *v5;
  _PKVisibilityBackdropView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PKVisibilityBackdropView;
  v5 = -[_UIBackdropView initWithFrame:privateStyle:](&v9, sel_initWithFrame_privateStyle_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_pkui_accessibilitySettingsDidChange_, *MEMORY[0x1E0DC44E0], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_pkui_accessibilitySettingsDidChange_, *MEMORY[0x1E0DC45B8], 0);
    -[_PKVisibilityBackdropView pkui_commitBackdropSettings](v6, "pkui_commitBackdropSettings");

  }
  return v6;
}

- (void)pkui_commitBackdropSettings
{
  void *v3;
  void *v4;
  double visibility;
  char v6;
  _BOOL8 v7;
  double v8;
  id v9;
  id v10;
  _QWORD v11[5];

  self->_updatingBackdropSettings = 0;
  v3 = (void *)MEMORY[0x1E0DC4030];
  objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:", self->_style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "pkui_createTransparentSettingsFromSettings:", v4);

  -[_UIBackdropView transitionToSettings:](self, "transitionToSettings:", v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___PKVisibilityBackdropView_pkui_commitBackdropSettings__block_invoke;
  v11[3] = &unk_1E3E612E8;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
  visibility = self->_visibility;
  self->_visibilityAnimationTarget = 0.0;
  self->_visibility = 0.0;
  self->_animationCounter = 0;
  ++self->_styleToken;
  v6 = -[_PKVisibilityBackdropView isHidden](self, "isHidden");
  v7 = 0;
  if ((v6 & 1) == 0)
  {
    -[_PKVisibilityBackdropView alpha](self, "alpha", 0);
    v7 = v8 > 0.0 && visibility > 0.0;
  }
  -[_PKVisibilityBackdropView _pkui_setVisibility:animated:](self, "_pkui_setVisibility:animated:", v7, visibility, v9);

}

- (void)_pkui_setVisibility:(double)a3 animated:(BOOL)a4
{
  unsigned int animationCounter;
  unsigned int styleToken;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  unsigned int v11;
  _QWORD v12[5];
  id location;

  self->_visibility = a3;
  if (!self->_updatingBackdropSettings)
  {
    animationCounter = self->_animationCounter;
    if (animationCounter)
    {
      if (vabdd_f64(a3, self->_visibilityAnimationTarget) >= 0.05 || a4)
        goto LABEL_7;
    }
    else
    {
      if (a4)
      {
LABEL_7:
        self->_animationCounter = animationCounter + 1;
        self->_visibilityAnimationTarget = a3;
        objc_initWeak(&location, self);
        styleToken = self->_styleToken;
        v7 = (void *)MEMORY[0x1E0DC3F10];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke;
        v12[3] = &unk_1E3E612E8;
        v12[4] = self;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_2;
        v9[3] = &unk_1E3E76198;
        objc_copyWeak(&v10, &location);
        v11 = styleToken;
        objc_msgSend(v7, "pkui_animateUsingOptions:animations:completion:", 6, v12, v9);
        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
        return;
      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58___PKVisibilityBackdropView__pkui_setVisibility_animated___block_invoke_5;
      v8[3] = &unk_1E3E612E8;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    }
  }
}

- (void)_updateStyleIfNecessary
{
  int64_t v3;

  v3 = -[_PKVisibilityBackdropView pkui_preferredBackdropStyle](self, "pkui_preferredBackdropStyle");
  if (self->_style != v3)
  {
    self->_style = v3;
    -[_PKVisibilityBackdropView pkui_updateBackdropSettings](self, "pkui_updateBackdropSettings");
  }
}

- (int64_t)pkui_preferredBackdropStyle
{
  id WeakRetained;
  void *v4;
  uint64_t style;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    -[_PKVisibilityBackdropView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    style = objc_msgSend(WeakRetained, "visibilityBackdropView:preferredStyleForTraitCollection:", self, v4);

  }
  else
  {
    style = self->_style;
  }

  return style;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_updatingBackdropSettings)
    -[_UIBackdropView transitionComplete](self, "transitionComplete");
  v3.receiver = self;
  v3.super_class = (Class)_PKVisibilityBackdropView;
  -[_UIBackdropView dealloc](&v3, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PKVisibilityBackdropView;
  -[_PKVisibilityBackdropView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_PKVisibilityBackdropView _updateStyleIfNecessary](self, "_updateStyleIfNecessary");
}

- (double)pkui_visibility
{
  return self->_visibility;
}

- (_PKVisibilityBackdropViewDelegate)delegate
{
  return (_PKVisibilityBackdropViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
