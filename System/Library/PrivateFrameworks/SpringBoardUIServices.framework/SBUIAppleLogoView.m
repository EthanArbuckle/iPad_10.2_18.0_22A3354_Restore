@implementation SBUIAppleLogoView

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 appearance:(int64_t)a4 progressBarVisible:(BOOL)a5
{
  _BOOL8 v5;
  SBUIAppleLogoView *v7;
  id v8;
  double v9;
  uint64_t v10;
  PUIProgressWindow *progressWindow;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  UIView *layerView;
  void *v32;
  void *v33;
  _OWORD v35[8];
  CATransform3D v36;
  objc_super v37;

  v5 = a5;
  v37.receiver = self;
  v37.super_class = (Class)SBUIAppleLogoView;
  v7 = -[SBUIAppleLogoView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D81860]);
    LODWORD(v9) = 0;
    v10 = objc_msgSend(v8, "initWithProgressBarVisibility:createContext:contextLevel:appearance:", v5, 0, a4, v9);
    progressWindow = v7->_progressWindow;
    v7->_progressWindow = (PUIProgressWindow *)v10;

    -[PUIProgressWindow setVisible:](v7->_progressWindow, "setVisible:", 1);
    -[PUIProgressWindow layer](v7->_progressWindow, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[PUIProgressWindow layer](v7->_progressWindow, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "transform");
    else
      memset(&v36, 0, sizeof(v36));
    v23 = CATransform3DIsIdentity(&v36);

    if (!v23)
    {
      -[PUIProgressWindow layer](v7->_progressWindow, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v35[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v35[5] = v25;
      v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v35[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v35[7] = v26;
      v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v35[0] = *MEMORY[0x1E0CD2610];
      v35[1] = v27;
      v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v35[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v35[3] = v28;
      objc_msgSend(v24, "setTransform:", v35);

      -[PUIProgressWindow layer](v7->_progressWindow, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPosition:", v18 * 0.5, v20 * 0.5);

    }
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v14, v16, v18, v20);
    layerView = v7->_layerView;
    v7->_layerView = (UIView *)v30;

    -[UIView layer](v7->_layerView, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIProgressWindow layer](v7->_progressWindow, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSublayer:", v33);

    -[SBUIAppleLogoView addSubview:](v7, "addSubview:", v7->_layerView);
  }
  return v7;
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 inverted:(BOOL)a4 progressBarVisible:(BOOL)a5
{
  return -[SBUIAppleLogoView initWithFrame:appearance:progressBarVisible:](self, "initWithFrame:appearance:progressBarVisible:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 inverted:(BOOL)a4
{
  return -[SBUIAppleLogoView initWithFrame:inverted:progressBarVisible:](self, "initWithFrame:inverted:progressBarVisible:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 useWhiteLogo:(BOOL)a4 progressBarVisible:(BOOL)a5
{
  return -[SBUIAppleLogoView initWithFrame:inverted:progressBarVisible:](self, "initWithFrame:inverted:progressBarVisible:", (MGGetSInt32Answer() != 1) ^ a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 useWhiteLogo:(BOOL)a4
{
  return -[SBUIAppleLogoView initWithFrame:useWhiteLogo:progressBarVisible:](self, "initWithFrame:useWhiteLogo:progressBarVisible:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3 progressBarVisible:(BOOL)a4
{
  return -[SBUIAppleLogoView initWithFrame:useWhiteLogo:progressBarVisible:](self, "initWithFrame:useWhiteLogo:progressBarVisible:", MGGetSInt32Answer() != 1, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBUIAppleLogoView)initWithFrame:(CGRect)a3
{
  return -[SBUIAppleLogoView initWithFrame:progressBarVisible:](self, "initWithFrame:progressBarVisible:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  -[PUIProgressWindow setProgressValue:](self->_progressWindow, "setProgressValue:");
}

- (void)setStatusText:(id)a3
{
  -[PUIProgressWindow setStatusText:](self->_progressWindow, "setStatusText:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *layerView;
  __int128 v17;
  UIView *v18;
  CGAffineTransform v19;
  _OWORD v20[3];

  -[SBUIAppleLogoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PUIProgressWindow layer](self->_progressWindow, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  layerView = self->_layerView;
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v20[0] = *MEMORY[0x1E0C9BAA8];
  v20[1] = v17;
  v20[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](layerView, "setTransform:", v20);
  -[UIView setFrame:](self->_layerView, "setFrame:", v9, v11, v13, v15);
  v18 = self->_layerView;
  CGAffineTransformMakeScale(&v19, v4 / v13, v6 / v15);
  -[UIView setTransform:](v18, "setTransform:", &v19);
  -[UIView setCenter:](self->_layerView, "setCenter:", v4 * 0.5, v6 * 0.5);
}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressWindow, 0);
  objc_storeStrong((id *)&self->_layerView, 0);
}

@end
