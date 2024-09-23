@implementation SBLoginAppContainerOverlayWrapperView

- (SBLoginAppContainerOverlayWrapperView)initWithFrame:(CGRect)a3 overlayView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  SBLoginAppContainerOverlayWrapperView *v11;
  SBLoginAppContainerOverlayWrapperView *v12;
  id *p_overlayView;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _UIBackdropView *backdropView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBLoginAppContainerOverlayWrapperView;
  v11 = -[SBLoginAppContainerOverlayWrapperView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_overlayView = (id *)&v11->_overlayView;
    objc_storeStrong((id *)&v11->_overlayView, a4);
    objc_msgSend(*p_overlayView, "underlayPropertiesFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "propertiesWithDeviceDefaultGraphicsQuality");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", -2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackdropVisible:", 1);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithSettings:", v16);
    backdropView = v12->_backdropView;
    v12->_backdropView = (_UIBackdropView *)v17;

    -[_UIBackdropView inputSettings](v12->_backdropView, "inputSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "blurRadius");
    objc_msgSend(v19, "setBlurRadius:");

    -[_UIBackdropView inputSettings](v12->_backdropView, "inputSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColorTint:", v21);

    -[_UIBackdropView inputSettings](v12->_backdropView, "inputSettings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tintAlpha");
    objc_msgSend(v22, "setColorTintAlpha:");

    -[SBLoginAppContainerOverlayWrapperView addSubview:](v12, "addSubview:", v12->_backdropView);
    -[SBLoginAppContainerOverlayWrapperView addSubview:](v12, "addSubview:", *p_overlayView);

  }
  return v12;
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

  -[SBLoginAppContainerOverlayWrapperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[SBLockOverlayView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
}

- (SBLockOverlayView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
