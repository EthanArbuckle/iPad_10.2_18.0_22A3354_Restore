@implementation PXSharedLibraryAssistantCameraHeaderView

- (PXSharedLibraryAssistantCameraHeaderView)initWithFrame:(CGRect)a3
{
  PXSharedLibraryAssistantCameraHeaderView *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  UIView *cameraView;
  double v23;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)PXSharedLibraryAssistantCameraHeaderView;
  v3 = -[PXSharedLibraryAssistantCameraHeaderView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (PLPhysicalDeviceIsIPad())
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("SharedLibraryAssistantCameraPad"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 52.0;
    }
    else if (PLHasHomeButton())
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("SharedLibraryAssistantCameraLegacy"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 86.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("SharedLibraryAssistantCamera"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 82.0;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v4, "size");
    v9 = v8;
    objc_msgSend(v4, "size");
    v11 = (void *)objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, v9, v10);
    objc_msgSend(v11, "addSubview:", v6);
    v12 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(v12, "_setContinuousCornerRadius:", 2.0);
    objc_msgSend(v11, "addSubview:", v12);
    v14 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    CEKFontOfSizeAndStyle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_CameraRules_CameraBadge"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v17);

    objc_msgSend(v11, "addSubview:", v14);
    objc_msgSend(v14, "sizeToFit");
    objc_msgSend(v11, "frame");
    v19 = v18 * 0.5;
    objc_msgSend(v14, "frame");
    objc_msgSend(v14, "setCenter:", v19, v5 - v20);
    objc_msgSend(v14, "frame");
    v27 = CGRectInset(v26, -4.0, -2.0);
    objc_msgSend(v12, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
    objc_msgSend(v11, "bounds");
    objc_msgSend(v11, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
    v21 = objc_claimAutoreleasedReturnValue();

    cameraView = v3->_cameraView;
    v3->_cameraView = (UIView *)v21;

    -[UIView frame](v3->_cameraView, "frame");
    PXSizeGetAspectRatio();
    v3->_aspectRatio = v23;
    -[PXSharedLibraryAssistantCameraHeaderView addSubview:](v3, "addSubview:", v3->_cameraView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double MinY;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryAssistantCameraHeaderView;
  -[PXSharedLibraryAssistantCameraHeaderView layoutSubviews](&v13, sel_layoutSubviews);
  if (PLPhysicalDeviceIsIPad())
  {
    -[PXSharedLibraryAssistantCameraHeaderView bounds](self, "bounds");
    v4 = v3 + -100.0;
    v5 = (v3 + -100.0) / self->_aspectRatio;
    -[PXSharedLibraryAssistantCameraHeaderView bounds](self, "bounds");
    v6 = CGRectGetMaxY(v14) - v5;
    -[PXSharedLibraryAssistantCameraHeaderView bounds](self, "bounds");
    MinY = CGRectGetMinY(v15);
    if (v6 >= MinY)
      v8 = v6;
    else
      v8 = MinY;
    v9 = 50.0;
  }
  else
  {
    -[PXSharedLibraryAssistantCameraHeaderView bounds](self, "bounds");
    PXRectWithAspectRatioFittingRect();
    v9 = v10;
    v4 = v11;
    v5 = v12;
    -[PXSharedLibraryAssistantCameraHeaderView bounds](self, "bounds");
    v8 = CGRectGetMaxY(v16) - v5;
  }
  -[UIView setFrame:](self->_cameraView, "setFrame:", v9, v8, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraView, 0);
}

@end
