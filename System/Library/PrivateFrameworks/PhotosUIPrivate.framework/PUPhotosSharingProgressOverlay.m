@implementation PUPhotosSharingProgressOverlay

- (PUPhotosSharingProgressOverlay)initWithFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  -[PUPhotosSharingProgressOverlay _mainWindow](self, "_mainWindow", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v14.receiver = self;
  v14.super_class = (Class)PUPhotosSharingProgressOverlay;
  return -[PUPhotosSharingProgressOverlay initWithFrame:](&v14, sel_initWithFrame_, v6, v8, v10, v12);
}

- (id)_mainWindow
{
  void *v4;
  void *v5;
  void *v7;

  -[PUPhotosSharingProgressOverlay cachedMainWindow](self, "cachedMainWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "px_firstKeyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosSharingProgressOverlay setCachedMainWindow:](self, "setCachedMainWindow:", v5);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosSharingProgressOverlay.m"), 63, CFSTR("Main window could not be determined for PUPhotosSharingProgressOverlay"));

    }
  }
  return -[PUPhotosSharingProgressOverlay cachedMainWindow](self, "cachedMainWindow");
}

- (void)_installInStatusBarWindow
{
  id v3;

  -[PUPhotosSharingProgressOverlay setAlpha:](self, "setAlpha:", 0.0);
  -[PUPhotosSharingProgressOverlay _mainWindow](self, "_mainWindow");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self);

}

- (id)_screenshotImage
{
  return (id)_UICreateScreenUIImageWithRotation();
}

- (id)_grayScaleImageFromImage:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGColorSpace *DeviceGray;
  CGContext *v14;
  id v15;
  CGImage *v16;
  CGImageRef Image;
  void *v18;
  CGRect v20;

  if (a3)
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v5 = a3;
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "scale");
    v11 = v7 * v10;
    v12 = v9 * v10;
    DeviceGray = CGColorSpaceCreateDeviceGray();
    v14 = CGBitmapContextCreate(0, (unint64_t)v11, (unint64_t)v12, 8uLL, 0, DeviceGray, 0);
    v15 = objc_retainAutorelease(v5);
    v16 = (CGImage *)objc_msgSend(v15, "CGImage");

    v20.origin.x = v3;
    v20.origin.y = v4;
    v20.size.width = v11;
    v20.size.height = v12;
    CGContextDrawImage(v14, v20, v16);
    Image = CGBitmapContextCreateImage(v14);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CGColorSpaceRelease(DeviceGray);
    CGContextRelease(v14);
    CFRelease(Image);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (void)_setupOverlayAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[PUPhotosSharingProgressOverlay cachedMainWindow](self, "cachedMainWindow", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginDisablingInterfaceAutorotation");

  -[PUPhotosSharingProgressOverlay _installInStatusBarWindow](self, "_installInStatusBarWindow");
  -[PUPhotosSharingProgressOverlay _screenshotImage](self, "_screenshotImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PUPhotosSharingProgressOverlay _grayScaleImageFromImage:](self, "_grayScaleImageFromImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
      -[PUPhotosSharingProgressOverlay addSubview:](self, "addSubview:", v7);
      -[PUPhotosSharingProgressOverlay bounds](self, "bounds");
      objc_msgSend(v7, "setFrame:");
      v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PUPhotosSharingProgressOverlay bounds](self, "bounds");
      v9 = (void *)objc_msgSend(v8, "initWithFrame:");
      -[PUPhotosSharingProgressOverlay addSubview:](self, "addSubview:", v9);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v10);

    }
  }
  -[PUPhotosSharingProgressOverlay progressView](self, "progressView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingProgressOverlay bringSubviewToFront:](self, "bringSubviewToFront:", v11);

  -[PUPhotosSharingProgressOverlay setAlpha:](self, "setAlpha:", 0.0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__PUPhotosSharingProgressOverlay__setupOverlayAnimated___block_invoke;
  v12[3] = &unk_1E58ABD10;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "pu_animateWithDuration:animations:", v12, 0.2);

}

- (void)_tearDownOverlayAnimated:(BOOL)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke_2;
  v3[3] = &unk_1E58A9910;
  objc_msgSend(MEMORY[0x1E0DC3F10], "pu_animateWithDuration:animations:completion:", v4, v3, 0.2);
}

- (void)addProgressView:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  double MaxY;
  double v12;
  void *v13;
  double Width;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (a3)
  {
    v15 = a3;
    -[PUPhotosSharingProgressOverlay _installInStatusBarWindow](self, "_installInStatusBarWindow");
    objc_msgSend(v15, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[PUPhotosSharingProgressOverlay window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    MaxY = CGRectGetMaxY(v16);
    v17.origin.x = 0.0;
    v17.origin.y = v5;
    v17.size.width = v7;
    v17.size.height = v9;
    v12 = MaxY - CGRectGetHeight(v17);

    -[PUPhotosSharingProgressOverlay window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    Width = CGRectGetWidth(v18);

    -[PUPhotosSharingProgressOverlay convertRect:fromView:](self, "convertRect:fromView:", 0, 0.0, v12, Width, v9);
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v15, "setAutoresizingMask:", 10);
    -[PUPhotosSharingProgressOverlay addSubview:](self, "addSubview:", v15);
    -[PUPhotosSharingProgressOverlay setProgressView:](self, "setProgressView:", v15);

  }
}

- (void)setShowing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isShowing != a3)
  {
    self->_isShowing = a3;
    if (a3)
      -[PUPhotosSharingProgressOverlay _setupOverlayAnimated:](self, "_setupOverlayAnimated:", a4);
    else
      -[PUPhotosSharingProgressOverlay _tearDownOverlayAnimated:](self, "_tearDownOverlayAnimated:", a4);
  }
}

- (void)willRemoveSubview:(id)a3
{
  id v4;
  id v5;
  dispatch_time_t v6;
  _QWORD block[5];

  v4 = a3;
  -[PUPhotosSharingProgressOverlay progressView](self, "progressView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = dispatch_time(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PUPhotosSharingProgressOverlay_willRemoveSubview___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  }
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UIWindow)cachedMainWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_cachedMainWindow);
}

- (void)setCachedMainWindow:(id)a3
{
  objc_storeWeak((id *)&self->_cachedMainWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedMainWindow);
  objc_storeStrong((id *)&self->_progressView, 0);
}

uint64_t __52__PUPhotosSharingProgressOverlay_willRemoveSubview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowing:animated:", 0, 1);
}

uint64_t __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __59__PUPhotosSharingProgressOverlay__tearDownOverlayAnimated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "cachedMainWindow");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDisablingInterfaceAutorotation");

}

uint64_t __56__PUPhotosSharingProgressOverlay__setupOverlayAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

@end
