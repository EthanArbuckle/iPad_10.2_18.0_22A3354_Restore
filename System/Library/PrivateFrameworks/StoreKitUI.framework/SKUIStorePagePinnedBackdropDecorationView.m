@implementation SKUIStorePagePinnedBackdropDecorationView

- (SKUIStorePagePinnedBackdropDecorationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIStorePagePinnedBackdropDecorationView *v16;
  uint64_t v17;
  _UIBackdropView *backdropView;
  _UIBackdropView *v19;
  uint64_t v20;
  _UIBackdropViewSettings *backdropStyleDefaultSettings;
  void *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIStorePagePinnedBackdropDecorationView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIStorePagePinnedBackdropDecorationView;
  v16 = -[SKUIStorePagePinnedBackdropDecorationView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2010);
    backdropView = v16->_backdropView;
    v16->_backdropView = (_UIBackdropView *)v17;

    -[_UIBackdropView setAutoresizingMask:](v16->_backdropView, "setAutoresizingMask:", 18);
    v19 = v16->_backdropView;
    -[SKUIStorePagePinnedBackdropDecorationView bounds](v16, "bounds");
    -[_UIBackdropView setFrame:](v19, "setFrame:");
    -[SKUIStorePagePinnedBackdropDecorationView addSubview:](v16, "addSubview:", v16->_backdropView);
    objc_msgSend(MEMORY[0x1E0DC4030], "settingsForStyle:", -[_UIBackdropView style](v16->_backdropView, "style"));
    v20 = objc_claimAutoreleasedReturnValue();
    backdropStyleDefaultSettings = v16->_backdropStyleDefaultSettings;
    v16->_backdropStyleDefaultSettings = (_UIBackdropViewSettings *)v20;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStorePagePinnedBackdropDecorationView setBackgroundColor:](v16, "setBackgroundColor:", v22);

  }
  return v16;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _UIBackdropViewSettings *v12;
  _UIBackdropViewSettings *backdropStyleDefaultSettings;
  void *v14;
  UIView *backgroundView;
  id v16;
  UIView *v17;
  UIView *v18;
  __CFString *v19;
  double v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;

  v4 = a3;
  objc_msgSend(v4, "transitionProgress");
  v6 = v5;
  v7 = objc_msgSend(v4, "hidesBackdropView");
  if (v6 <= 0.00000011920929)
    v8 = 1;
  else
    v8 = v7;
  -[_UIBackdropView inputSettings](self->_backdropView, "inputSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "backdropStyle");
  if ((v8 & 1) == 0)
  {
    v11 = v10;
    if (-[_UIBackdropView style](self->_backdropView, "style") != v10)
    {
      -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", v11);
      objc_msgSend(MEMORY[0x1E0DC4030], "settingsForStyle:", -[_UIBackdropView style](self->_backdropView, "style"));
      v12 = (_UIBackdropViewSettings *)objc_claimAutoreleasedReturnValue();
      backdropStyleDefaultSettings = self->_backdropStyleDefaultSettings;
      self->_backdropStyleDefaultSettings = v12;

    }
  }
  if ((_DWORD)v8 != -[_UIBackdropView isHidden](self->_backdropView, "isHidden"))
  {
    -[_UIBackdropView setHidden:](self->_backdropView, "setHidden:", v8);
    if (!(_DWORD)v8 || (objc_msgSend(v4, "backdropColor"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    backgroundView = self->_backgroundView;
    if (!backgroundView)
    {
      v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[SKUIStorePagePinnedBackdropDecorationView bounds](self, "bounds");
      v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
      v18 = self->_backgroundView;
      self->_backgroundView = v17;

      -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
      -[SKUIStorePagePinnedBackdropDecorationView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
      backgroundView = self->_backgroundView;
    }
    -[UIView setHidden:](backgroundView, "setHidden:", v8 ^ 1);
    -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v14);

  }
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", v6);
  -[_UIBackdropView groupName](self->_backdropView, "groupName");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = 1.0 - v6;
  if (1.0 - v6 <= 0.00000011920929)
  {
    objc_msgSend(v4, "backdropGroupName", v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = CFSTR("_SKUIStorePagePinnedBackdropGroupName");
    if (v22)
      v24 = (__CFString *)v22;
    v21 = v24;

  }
  else
  {
    v21 = 0;
  }
  if (v19 != v21 && (-[__CFString isEqualToString:](v19, "isEqualToString:", v21, v20) & 1) == 0)
    -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:", v21);
  -[_UIBackdropViewSettings blurRadius](self->_backdropStyleDefaultSettings, "blurRadius");
  v26 = v25;
  v27 = v6 * v25;
  objc_msgSend(v9, "blurRadius");
  v29 = vabdd_f64(v27, v28);
  if (v29 >= 1.0 || (vabdd_f64(v26, v27) <= 1.0 ? (v30 = v29 <= 0.00000011920929) : (v30 = 1), !v30))
    objc_msgSend(v9, "setBlurRadius:", v27);
  -[_UIBackdropViewSettings saturationDeltaFactor](self->_backdropStyleDefaultSettings, "saturationDeltaFactor");
  v32 = v6 * v31;
  objc_msgSend(v9, "saturationDeltaFactor");
  if (vabdd_f64(v32, v33) > 0.00000011920929)
    objc_msgSend(v9, "setSaturationDeltaFactor:", v32);
  -[_UIBackdropViewSettings darkeningTintAlpha](self->_backdropStyleDefaultSettings, "darkeningTintAlpha");
  v35 = v6 * v34;
  objc_msgSend(v9, "darkeningTintAlpha");
  if (vabdd_f64(v35, v36) > 0.00000011920929)
    objc_msgSend(v9, "setDarkeningTintAlpha:", v35);
  -[_UIBackdropViewSettings grayscaleTintAlpha](self->_backdropStyleDefaultSettings, "grayscaleTintAlpha");
  v38 = v6 * v37;
  objc_msgSend(v9, "grayscaleTintAlpha");
  if (vabdd_f64(v38, v39) > 0.00000011920929)
    objc_msgSend(v9, "setGrayscaleTintAlpha:", v38);
  -[_UIBackdropViewSettings colorBurnTintAlpha](self->_backdropStyleDefaultSettings, "colorBurnTintAlpha");
  v41 = v6 * v40;
  objc_msgSend(v9, "colorBurnTintAlpha");
  if (vabdd_f64(v41, v42) > 0.00000011920929)
    objc_msgSend(v9, "setColorBurnTintAlpha:", v41);
  -[_UIBackdropViewSettings colorTintAlpha](self->_backdropStyleDefaultSettings, "colorTintAlpha");
  v44 = v6 * v43;
  objc_msgSend(v9, "colorTintAlpha");
  if (vabdd_f64(v44, v45) > 0.00000011920929)
    objc_msgSend(v9, "setColorTintAlpha:", v44);
  v46.receiver = self;
  v46.super_class = (Class)SKUIStorePagePinnedBackdropDecorationView;
  -[SKUIStorePagePinnedBackdropDecorationView applyLayoutAttributes:](&v46, sel_applyLayoutAttributes_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropStyleDefaultSettings, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
