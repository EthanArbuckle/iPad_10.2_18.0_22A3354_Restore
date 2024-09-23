@implementation PLCropOverlay

- (PLCropOverlay)initWithFrame:(CGRect)a3 mode:(int)a4 offsettingStatusBar:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  PLCropOverlay *v11;
  PLCropOverlay *v12;
  char v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  UIToolbar *v20;
  void *v21;
  PLCropOverlayBottomBar *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  PLCropOverlayBottomBar *v28;
  PLCropOverlayWallpaperBottomBar *v29;
  PLWallpaperButton *v30;
  uint64_t v31;
  PLWallpaperButton *v32;
  PLWallpaperButton *v33;
  PLWallpaperButton *v34;
  PLWallpaperButton *v35;
  uint64_t v36;
  UIView *v37;
  UIView *v38;
  id v39;
  void *v40;
  PLCropOverlayBottomBar *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  PLCropOverlayBottomBar *v46;
  PLCropOverlayPreviewBottomBar *v47;
  UIButton *v48;
  UILabel *v49;
  UIButton *v50;
  PLContactPhotoOverlay *v51;
  UIButton *v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v53.receiver = self;
  v53.super_class = (Class)PLCropOverlay;
  v11 = -[PLCropOverlay initWithFrame:](&v53, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    if (v5)
      v13 = 4;
    else
      v13 = 0;
    *((_BYTE *)v11 + 512) = *((_BYTE *)v11 + 512) & 0xFB | v13;
    *((_BYTE *)v11 + 512) |= 0x20u;
    -[PLCropOverlay setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    if ((_DWORD)v6 == 5
      || (v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom"),
          (_DWORD)v6 == 2)
      && (v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v15 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      objc_msgSend(MEMORY[0x1E0CEAB20], "defaultHeight");
      v18 = v17;
      v54.origin.x = v15;
      v54.origin.y = v16;
      v54.size.width = width;
      v54.size.height = height;
      v19 = CGRectGetMaxY(v54) - v18;
      v55.origin.x = v15;
      v55.origin.y = v16;
      v55.size.width = width;
      v55.size.height = height;
      v20 = (UIToolbar *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB20]), "initWithFrame:", 0.0, v19, CGRectGetWidth(v55), v18);
      v12->_customToolbar = v20;
      -[UIToolbar setAutoresizingMask:](v20, "setAutoresizingMask:", 10);
      -[PLCropOverlay addSubview:](v12, "addSubview:", v12->_customToolbar);
      -[PLCropOverlay _updateToolbarItems:](v12, "_updateToolbarItems:", 1);
    }
    else
    {
      if ((_DWORD)v6 == 6)
      {
        v23 = [PLCropOverlayBottomBar alloc];
        v24 = *MEMORY[0x1E0C9D648];
        v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v28 = -[PLCropOverlayBottomBar initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E0C9D648], v25, v26, v27);
        v12->__bottomBar = v28;
        -[PLCropOverlayBottomBar setAutoresizingMask:](v28, "setAutoresizingMask:", 10);
        -[PLCropOverlayBottomBar setInPopover:](v12->__bottomBar, "setInPopover:", -[PLCropOverlay isDisplayedInPopover](v12, "isDisplayedInPopover"));
        -[PLCropOverlay addSubview:](v12, "addSubview:", v12->__bottomBar);
        v29 = -[PLCropOverlayWallpaperBottomBar initWithFrame:]([PLCropOverlayWallpaperBottomBar alloc], "initWithFrame:", v24, v25, v26, v27);
        -[PLCropOverlayBottomBar setWallpaperBottomBar:](v12->__bottomBar, "setWallpaperBottomBar:", v29);

        v30 = -[PLCropOverlayWallpaperBottomBar doCancelButton](v29, "doCancelButton");
        -[PLWallpaperButton addTarget:action:forControlEvents:](v30, "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarCancelButton_, 64);
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          v31 = objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
          -[PLWallpaperButton setTitleColor:forState:](v30, "setTitleColor:forState:", v31, 1);
          v32 = -[PLCropOverlayWallpaperBottomBar doSetHomeScreenButton](v29, "doSetHomeScreenButton");
          -[PLWallpaperButton addTarget:action:forControlEvents:](v32, "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarSetHomeButton, 64);
          -[PLWallpaperButton setTitleColor:forState:](v32, "setTitleColor:forState:", v31, 1);
          v33 = -[PLCropOverlayWallpaperBottomBar doSetLockScreenButton](v29, "doSetLockScreenButton");
          -[PLWallpaperButton addTarget:action:forControlEvents:](v33, "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarSetLockButton, 64);
          -[PLWallpaperButton setTitleColor:forState:](v33, "setTitleColor:forState:", v31, 1);
          v34 = -[PLCropOverlayWallpaperBottomBar doSetBothScreenButton](v29, "doSetBothScreenButton");
          -[PLWallpaperButton addTarget:action:forControlEvents:](v34, "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarSetBothButton, 64);
          -[PLWallpaperButton setTitleColor:forState:](v34, "setTitleColor:forState:", v31, 1);
          v35 = -[PLCropOverlayWallpaperBottomBar motionToggle](v29, "motionToggle");
          -[PLWallpaperButton addTarget:action:forControlEvents:](v35, "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarMotionToggle, 64);
          -[PLWallpaperButton setTitleColor:forState:](v35, "setTitleColor:forState:", v31, 1);
        }
        else
        {
          -[PLWallpaperButton addTarget:action:forControlEvents:](-[PLCropOverlayWallpaperBottomBar doSetButton](v29, "doSetButton"), "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarDoneButton_, 64);
        }
        goto LABEL_9;
      }
      v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom");
      if ((_DWORD)v6 != 1 || (v36 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        v41 = [PLCropOverlayBottomBar alloc];
        v42 = *MEMORY[0x1E0C9D648];
        v43 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v44 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v45 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v46 = -[PLCropOverlayBottomBar initWithFrame:](v41, "initWithFrame:", *MEMORY[0x1E0C9D648], v43, v44, v45);
        v12->__bottomBar = v46;
        -[PLCropOverlayBottomBar setAutoresizingMask:](v46, "setAutoresizingMask:", 2);
        -[PLCropOverlayBottomBar setInPopover:](v12->__bottomBar, "setInPopover:", -[PLCropOverlay isDisplayedInPopover](v12, "isDisplayedInPopover"));
        -[PLCropOverlay addSubview:](v12, "addSubview:", v12->__bottomBar);
        v47 = -[PLCropOverlayPreviewBottomBar initWithFrame:]([PLCropOverlayPreviewBottomBar alloc], "initWithFrame:", v42, v43, v44, v45);
        -[PLCropOverlayPreviewBottomBar setBackgroundStyle:](v47, "setBackgroundStyle:", -[PLCropOverlay isTelephonyUIMode:](v12, "isTelephonyUIMode:", v6));
        -[PLCropOverlayBottomBar setPreviewBottomBar:](v12->__bottomBar, "setPreviewBottomBar:", v47);

        -[UIButton addTarget:action:forControlEvents:](-[PLCropOverlayPreviewBottomBar cancelButton](v47, "cancelButton"), "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarCancelButton_, 64);
        -[UIButton addTarget:action:forControlEvents:](-[PLCropOverlayPreviewBottomBar doneButton](v47, "doneButton"), "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarDoneButton_, 64);
        -[UIButton addTarget:action:forControlEvents:](-[PLCropOverlayPreviewBottomBar playbackButton](v47, "playbackButton"), "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarPlaybackButton_, 64);
        v48 = (UIButton *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
        v12->__cameraCancelButton = v48;
        -[UIButton setTitleColor:forState:](v48, "setTitleColor:forState:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"), 0);
        -[UIButton addTarget:action:forControlEvents:](v12->__cameraCancelButton, "addTarget:action:forControlEvents:", v12, sel__tappedBottomBarCancelButton_, 64);
        -[UIButton setExclusiveTouch:](v12->__cameraCancelButton, "setExclusiveTouch:", 1);
        -[UIButton setTitle:forState:](v12->__cameraCancelButton, "setTitle:forState:", PLLocalizedFrameworkString(), 0);
        v49 = -[UIButton titleLabel](v12->__cameraCancelButton, "titleLabel");
        -[UILabel setFont:](v49, "setFont:", objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB538]), 18.0));
        v50 = v12->__cameraCancelButton;
        if (-[PLCropOverlay isTelephonyUIMode:](v12, "isTelephonyUIMode:", v6))
        {
          v51 = -[PLContactPhotoOverlay initWithFrame:]([PLContactPhotoOverlay alloc], "initWithFrame:", v42, v43, v44, v45);
          v12->_contactPhotoOverlay = v51;
          -[PLCropOverlay insertSubview:belowSubview:](v12, "insertSubview:belowSubview:", v51, v12->__bottomBar);
          if ((_DWORD)v6 != 7)
          {
            if ((_DWORD)v6 == 3)
              -[UIView pl_setHidden:animated:](v51, "pl_setHidden:animated:", 1, 0);
            goto LABEL_9;
          }
        }
        else if ((_DWORD)v6 != 7)
        {
          goto LABEL_9;
        }
        v52 = -[PLCropOverlayPreviewBottomBar fileResizingButton](v47, "fileResizingButton");
        -[UIButton setMenu:](v52, "setMenu:", -[PLCropOverlay _bottomBarFileSizeMenu](v12, "_bottomBarFileSizeMenu"));
        -[UIButton setShowsMenuAsPrimaryAction:](v52, "setShowsMenuAsPrimaryAction:", 1);
        goto LABEL_9;
      }
      v37 = -[PLCropOverlay _newOverlayViewWithFrame:lighterEdgeOnTop:](v12, "_newOverlayViewWithFrame:lighterEdgeOnTop:", 0, x, 0.0, width, 53.0);
      v12->_wildcatPickerTopView = v37;
      -[UIView setAutoresizingMask:](v37, "setAutoresizingMask:", 34);
      -[PLCropOverlay addSubview:](v12, "addSubview:", v12->_wildcatPickerTopView);
      v38 = -[PLCropOverlay _newOverlayViewWithFrame:lighterEdgeOnTop:](v12, "_newOverlayViewWithFrame:lighterEdgeOnTop:", 1, x, y + height + -53.0, width, 53.0);
      v12->_wildcatPickerBottomView = v38;
      -[UIView setAutoresizingMask:](v38, "setAutoresizingMask:", 10);
      -[PLCropOverlay addSubview:](v12, "addSubview:", v12->_wildcatPickerBottomView);
      v39 = objc_alloc(MEMORY[0x1E0CEA700]);
      -[UIView bounds](v12->_wildcatPickerBottomView, "bounds");
      v40 = (void *)objc_msgSend(v39, "initWithFrame:");
      objc_msgSend(v40, "setText:", PLLocalizedFrameworkString());
      objc_msgSend(v40, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
      objc_msgSend(v40, "setFont:", UISystemFontBoldForSize());
      objc_msgSend(v40, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
      objc_msgSend(v40, "setTextAlignment:", 1);
      objc_msgSend(v40, "setShadowColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.75));
      objc_msgSend(v40, "setShadowOffset:", 0.0, -1.0);
      objc_msgSend(v40, "sizeToFit");
      objc_msgSend(v40, "frame");
      objc_msgSend(v40, "setFrame:");
      objc_msgSend(v40, "setAutoresizingMask:", 2);
      -[UIView addSubview:](v12->_wildcatPickerBottomView, "addSubview:", v40);

    }
LABEL_9:
    v21 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v21, "addObserver:selector:name:object:", v12, sel_statusBarHeightDidChange_, *MEMORY[0x1E0CEB320], 0);
    -[PLCropOverlay _setMode:](v12, "_setMode:", v6);
    -[PLCropOverlay _updateTitle](v12, "_updateTitle");
  }
  return v12;
}

- (void)setDisplayedInPopover:(BOOL)a3
{
  if (self->_displayedInPopover != a3)
  {
    self->_displayedInPopover = a3;
    -[PLCropOverlayBottomBar setInPopover:](self->__bottomBar, "setInPopover:", -[PLCropOverlay isDisplayedInPopover](self, "isDisplayedInPopover"));
  }
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
  PLCropOverlayCropView *cropView;
  id v12;
  double v13;
  double v14;
  double MaxY;
  double v16;
  double v17;
  double Width;
  double x;
  id v20;
  double y;
  double height;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  UILabel *titleLabel;
  double v39;
  float v40;
  CGRect v41;
  CGRect slice;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v43.receiver = self;
  v43.super_class = (Class)PLCropOverlay;
  -[PLCropOverlay layoutSubviews](&v43, sel_layoutSubviews);
  -[PLCropOverlay bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  cropView = self->_cropView;
  if (cropView)
  {
    -[PLCropOverlayCropView bounds](cropView, "bounds");
    -[PLCropOverlay _updateCropRectInRect:](self, "_updateCropRectInRect:");
    -[PLCropOverlayCropView setCropRect:](self->_cropView, "setCropRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  }
  if (-[PLCropOverlay mode](self, "mode") == 5
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && -[PLCropOverlay mode](self, "mode") == 2)
  {
    v12 = -[PLCropOverlay bottomBar](self, "bottomBar");
    objc_msgSend(MEMORY[0x1E0CEAB20], "defaultHeight");
    v14 = v13;
    v44.origin.x = v4;
    v44.origin.y = v6;
    v44.size.width = v8;
    v44.size.height = v10;
    MaxY = CGRectGetMaxY(v44);
    -[PLCropOverlay safeAreaInsets](self, "safeAreaInsets");
    v17 = MaxY - (v14 + v16);
    v45.origin.x = v4;
    v45.origin.y = v6;
    v45.size.width = v8;
    v45.size.height = v10;
    Width = CGRectGetWidth(v45);
    x = 0.0;
    v20 = v12;
    y = v17;
    height = v14;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
    v24 = 1.0 / v23 + 72.0;
    if (-[PLCropOverlay mode](self, "mode") == 6)
      v24 = 49.0;
    -[PLCropOverlay safeAreaInsets](self, "safeAreaInsets");
    v26 = v24 + v25;
    memset(&slice, 0, sizeof(slice));
    -[PLCropOverlay bounds](self, "bounds", 0, 0, 0, 0);
    CGRectDivide(v46, &slice, &v41, v26, CGRectMaxYEdge);
    v20 = -[PLCropOverlay bottomBar](self, "bottomBar");
    x = slice.origin.x;
    y = slice.origin.y;
    Width = slice.size.width;
    height = slice.size.height;
  }
  objc_msgSend(v20, "setFrame:", x, y, Width, height);
  if (-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"))
    -[PLContactPhotoOverlay setFrame:](-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"), "setFrame:", v4, v6, v8, v10);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarHeight");
  v28 = v27;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
  -[PLCropOverlay convertRect:fromView:](self, "convertRect:fromView:", 0);
  v30 = v29;
  -[PLCropOverlay bounds](self, "bounds");
  v32 = v31;
  v34 = v33;
  v35 = v30 - v28;
  v36 = 0.0;
  if (v33 > v35)
  {
    if ((*((_BYTE *)self + 512) & 4) != 0)
      v36 = (float)(v28 + 0.0);
    else
      v36 = 0.0;
  }
  -[UIImage size](-[UIImageView image](self->_topShineView, "image"), "size");
  -[UIImageView setFrame:](self->_topShineView, "setFrame:", 0.0, v36, v32, v37);
  titleLabel = self->_titleLabel;
  -[UILabel frame](titleLabel, "frame");
  UIRectCenteredIntegralRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[UIImage size](-[UIImageView image](self->_bottomShineView, "image"), "size");
    -[UIImageView setFrame:](self->_bottomShineView, "setFrame:", 0.0, v34 - v39, v32, v39);
    UIRectCenteredYInRect();
    v40 = (v32 + -16.0) * 0.5;
    -[UIButton setFrame:](self->_okButton, "setFrame:", roundf(v40) + -132.0 + 148.0);
  }
}

- (UIView)cameraBottomBar
{
  return -[PLCropOverlayBottomBar cameraBottomBar](self->__bottomBar, "cameraBottomBar");
}

- (void)setCameraBottomBar:(id)a3
{
  -[PLCropOverlayBottomBar setCameraBottomBar:](self->__bottomBar, "setCameraBottomBar:", a3);
  -[PLCropOverlay setNeedsLayout](self, "setNeedsLayout");
}

- (PLCropOverlayWallpaperBottomBar)wallpaperBottomBar
{
  return -[PLCropOverlayBottomBar wallpaperBottomBar](self->__bottomBar, "wallpaperBottomBar");
}

- (BOOL)controlsAreVisible
{
  return (*((unsigned __int8 *)self + 512) >> 5) & 1;
}

- (void)setControlsAreVisible:(BOOL)a3
{
  char v3;
  char v5;
  _BOOL8 v6;
  double v7;

  v3 = *((_BYTE *)self + 512);
  if (((((v3 & 0x20) == 0) ^ a3) & 1) == 0)
  {
    v5 = a3 ? 32 : 0;
    *((_BYTE *)self + 512) = v3 & 0xDF | v5;
    if (!self->_mode)
    {
      if (a3)
      {
        v6 = 0;
      }
      else
      {
        -[PLCropOverlay setShowsCropRegion:](self, "setShowsCropRegion:", 0);
        LODWORD(v7) = 0;
        -[PLCropOverlay setCropRectVisible:duration:](self, "setCropRectVisible:duration:", 0, v7);
        v6 = (*((_BYTE *)self + 512) & 0x20) == 0;
      }
      -[PLCropOverlayBottomBar setHidden:](self->__bottomBar, "setHidden:", v6);
    }
  }
}

- (id)overlayContainerView
{
  if (self->_mode)
    return 0;
  else
    return self->_overlayContainerView;
}

- (void)setOverlayContainerView:(id)a3
{
  UIView *overlayContainerView;
  UIView *v6;

  if (!self->_mode)
  {
    overlayContainerView = self->_overlayContainerView;
    if (overlayContainerView != a3)
    {
      -[UIView removeFromSuperview](overlayContainerView, "removeFromSuperview");

      v6 = (UIView *)a3;
      self->_overlayContainerView = v6;
      -[PLCropOverlay addSubview:](self, "addSubview:", v6);
    }
  }
}

- (PLCropOverlay)initWithFrame:(CGRect)a3 mode:(int)a4
{
  return -[PLCropOverlay initWithFrame:mode:offsettingStatusBar:](self, "initWithFrame:mode:offsettingStatusBar:", *(_QWORD *)&a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLCropOverlay)initWithFrame:(CGRect)a3
{
  return -[PLCropOverlay initWithFrame:mode:offsettingStatusBar:](self, "initWithFrame:mode:offsettingStatusBar:", 1, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_createCropView
{
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float statusBarHeight;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PLCropOverlayCropView *v17;

  if (!self->_cropView)
  {
    v3 = 0.0;
    if (!-[PLCropOverlay isDisplayedInPopover](self, "isDisplayedInPopover")
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "isStatusBarHidden") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarHeight");
      v3 = v4;
    }
    self->_statusBarHeight = v3;
    if (-[PLCropOverlay isDisplayedInPopover](self, "isDisplayedInPopover"))
    {
      v5 = 480.0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
      -[PLCropOverlay convertRect:fromView:](self, "convertRect:fromView:", 0);
      v5 = v6;
    }
    -[PLCropOverlay frame](self, "frame");
    v8 = v7;
    v10 = v9;
    statusBarHeight = self->_statusBarHeight;
    v12 = v5 - statusBarHeight;
    v13 = 0.0;
    if (v9 > v12)
    {
      v14 = (float)(statusBarHeight + 0.0);
      if ((*((_BYTE *)self + 512) & 4) != 0)
        v13 = v14;
      else
        v13 = 0.0;
    }
    -[PLCropOverlayBottomBar bounds](self->__bottomBar, "bounds");
    v16 = v10 - v15 - v13;
    -[PLCropOverlay _updateCropRectInRect:](self, "_updateCropRectInRect:", 0.0, v13, v8, v16);
    v17 = -[PLCropOverlayCropView initWithFrame:]([PLCropOverlayCropView alloc], "initWithFrame:", 0.0, v13, v8, v16);
    self->_cropView = v17;
    -[PLCropOverlayCropView setCropRect:](v17, "setCropRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    -[PLCropOverlayCropView setUserInteractionEnabled:](self->_cropView, "setUserInteractionEnabled:", 0);
    -[PLCropOverlayCropView setOpaque:](self->_cropView, "setOpaque:", 0);
    -[PLCropOverlayCropView setAutoresizingMask:](self->_cropView, "setAutoresizingMask:", 18);
    -[PLCropOverlay insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_cropView, self->__bottomBar);
  }
}

- (void)insertIrisView:(id)a3
{
  if (self->_cropView)
    -[PLCropOverlay insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", a3);
  else
    -[PLCropOverlay addSubview:](self, "addSubview:", a3);
  -[PLCropOverlay bringSubviewToFront:](self, "bringSubviewToFront:", self->__bottomBar);
}

- (id)bottomBar
{
  int *v3;

  if (self->_mode == 5
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && self->_mode == 2)
  {
    v3 = &OBJC_IVAR___PLCropOverlay__customToolbar;
  }
  else
  {
    v3 = &OBJC_IVAR___PLCropOverlay___bottomBar;
  }
  return *(Class *)((char *)&self->super.super.super.isa + *v3);
}

- (CGRect)bottomBarFrame
{
  int *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (self->_mode == 5
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
    && self->_mode == 2)
  {
    v3 = &OBJC_IVAR___PLCropOverlay__customToolbar;
  }
  else
  {
    v3 = &OBJC_IVAR___PLCropOverlay___bottomBar;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "frame");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setCropRectVisible:(BOOL)a3 duration:(float)a4
{
  _BOOL4 v5;
  char v7;
  char v8;
  _QWORD v9[5];

  v5 = a3;
  if (!a3 || !-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"))
  {
    v7 = *((_BYTE *)self + 512);
    if (((((v7 & 2) == 0) ^ v5) & 1) == 0)
    {
      if (v5)
        v8 = 2;
      else
        v8 = 0;
      *((_BYTE *)self + 512) = v7 & 0xFD | v8;
      -[PLCropOverlay _createCropView](self, "_createCropView");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__PLCropOverlay_setCropRectVisible_duration___block_invoke;
      v9[3] = &unk_1E70B6370;
      v9[4] = self;
      if (a4 <= 0.0)
        -[PLCropOverlayCropView setAlpha:](self->_cropView, "setAlpha:", (double)((*((unsigned __int8 *)self + 512) >> 1) & 1));
      else
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v9, a4);
    }
  }
}

- (void)_setMode:(int)a3
{
  double v3;
  uint64_t v6;
  PLCropOverlayBottomBar *v7;
  PLCropOverlayPreviewBottomBar *v8;
  UIButton *v9;
  UILabel *v10;
  unint64_t v11;

  self->_mode = a3;
  if (self->__bottomBar)
  {
    if (a3 <= 6 && ((1 << a3) & 0x45) != 0)
      v6 = 0;
    else
      v6 = -[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", *(_QWORD *)&a3) ^ 1;
    LODWORD(v3) = 0;
    -[PLCropOverlay setCropRectVisible:duration:](self, "setCropRectVisible:duration:", v6, v3);
    v7 = -[PLCropOverlay _bottomBar](self, "_bottomBar");
    v8 = -[PLCropOverlayBottomBar previewBottomBar](v7, "previewBottomBar");
    v9 = -[PLCropOverlayPreviewBottomBar doneButton](v8, "doneButton");
    v10 = -[PLContactPhotoOverlay titleLabel](-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"), "titleLabel");
    switch(a3)
    {
      case 0:
      case 3:
        -[PLCropOverlayBottomBar setStyle:](v7, "setStyle:", 0);
        goto LABEL_9;
      case 1:
      case 4:
        -[PLCropOverlayBottomBar setStyle:](v7, "setStyle:", 1);
        -[PLCropOverlay _updateEditImageDoneButtonTitle](self, "_updateEditImageDoneButtonTitle");
LABEL_9:
        -[PLCropOverlay _updateEditImageCancelButtonTitle](self, "_updateEditImageCancelButtonTitle");
        -[UILabel setText:](v10, "setText:", PLLocalizedFrameworkString());
        return;
      case 2:
        -[PLCropOverlayBottomBar setStyle:](v7, "setStyle:", 2);
        -[UIButton setTitle:forState:](v9, "setTitle:forState:", PLLocalizedFrameworkString(), 0);
        goto LABEL_17;
      case 6:
        v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL;
        -[PLWallpaperButton setTitle:forState:](-[PLCropOverlayWallpaperBottomBar doCancelButton](-[PLCropOverlayBottomBar wallpaperBottomBar](v7, "wallpaperBottomBar"), "doCancelButton"), "setTitle:forState:", PLLocalizedFrameworkString(), 0);
        if (v11 == 1)
        {
          -[PLWallpaperButton setTitle:forState:](-[PLCropOverlayWallpaperBottomBar doSetHomeScreenButton](-[PLCropOverlayBottomBar wallpaperBottomBar](v7, "wallpaperBottomBar"), "doSetHomeScreenButton"), "setTitle:forState:", PLLocalizedFrameworkString(), 0);
          -[PLWallpaperButton setTitle:forState:](-[PLCropOverlayWallpaperBottomBar doSetLockScreenButton](-[PLCropOverlayBottomBar wallpaperBottomBar](v7, "wallpaperBottomBar"), "doSetLockScreenButton"), "setTitle:forState:", PLLocalizedFrameworkString(), 0);
          -[PLWallpaperButton setTitle:forState:](-[PLCropOverlayWallpaperBottomBar doSetBothScreenButton](-[PLCropOverlayBottomBar wallpaperBottomBar](v7, "wallpaperBottomBar"), "doSetBothScreenButton"), "setTitle:forState:", PLLocalizedFrameworkString(), 0);
          -[PLCropOverlay _updateMotionToggle](self, "_updateMotionToggle");
        }
        return;
      case 7:
        -[PLCropOverlayBottomBar setStyle:](v7, "setStyle:", 1);
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          -[UIButton setHidden:](-[PLCropOverlayPreviewBottomBar cancelButton](v8, "cancelButton"), "setHidden:", 1);
          -[UIButton setHidden:](-[PLCropOverlayPreviewBottomBar doneButton](v8, "doneButton"), "setHidden:", 1);
        }
        else
        {
          -[PLCropOverlay _updateEditImageDoneButtonTitle](self, "_updateEditImageDoneButtonTitle");
LABEL_17:
          -[PLCropOverlay _updateEditImageCancelButtonTitle](self, "_updateEditImageCancelButtonTitle");
        }
        break;
      default:
        return;
    }
  }
}

- (void)didCapturePhoto
{
  int mode;
  PLCropOverlayPreviewBottomBar *v5;
  double v6;

  mode = self->_mode;
  if (mode == 3 || mode == 0)
  {
    *((_BYTE *)self + 512) |= 8u;
    v5 = -[PLCropOverlayBottomBar previewBottomBar](self->__bottomBar, "previewBottomBar");
    -[UIButton setTitle:forState:](-[PLCropOverlayPreviewBottomBar doneButton](v5, "doneButton"), "setTitle:forState:", -[PLCropOverlay defaultOKButtonTitle](self, "defaultOKButtonTitle"), 0);
    -[PLCropOverlayPreviewBottomBar setNeedsLayout](v5, "setNeedsLayout");
    LODWORD(v6) = 0;
    -[PLCropOverlay setCropRectVisible:duration:](self, "setCropRectVisible:duration:", (*((unsigned __int8 *)self + 512) >> 4) & 1, v6);
    -[PLCropOverlayBottomBar setStyle:animated:](self->__bottomBar, "setStyle:animated:", 1, 1);
    if (-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"))
      -[UIView pl_setHidden:animated:](-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"), "pl_setHidden:animated:", 0, 1);
  }
}

- (void)didCaptureVideo
{
  PLCropOverlayPreviewBottomBar *v3;

  if (!self->_mode)
  {
    *((_BYTE *)self + 512) |= 8u;
    v3 = -[PLCropOverlayBottomBar previewBottomBar](self->__bottomBar, "previewBottomBar");
    -[UIButton setTitle:forState:](-[PLCropOverlayPreviewBottomBar doneButton](v3, "doneButton"), "setTitle:forState:", PLLocalizedFrameworkString(), 0);
    -[PLCropOverlayPreviewBottomBar setNeedsLayout](v3, "setNeedsLayout");
    -[PLCropOverlayBottomBar setStyle:animated:](self->__bottomBar, "setStyle:animated:", 2, 1);
  }
}

- (void)didPlayVideo
{
  if (self->__bottomBar)
    -[PLCropOverlayBottomBar setPlayingVideo:](self->__bottomBar, "setPlayingVideo:", 1);
  else
    -[PLCropOverlay _updateToolbarItems:](self, "_updateToolbarItems:", 0);
}

- (void)didPauseVideo
{
  if (self->__bottomBar)
    -[PLCropOverlayBottomBar setPlayingVideo:](self->__bottomBar, "setPlayingVideo:", 0);
  else
    -[PLCropOverlay _updateToolbarItems:](self, "_updateToolbarItems:", 1);
}

- (int)mode
{
  return self->_mode;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlay;
  -[PLCropOverlay dealloc](&v3, sel_dealloc);
}

- (void)statusBarHeightDidChange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PLCropOverlayCropView *cropView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;

  if (-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
  {
    -[UIImageView frame](self->_topShineView, "frame");
    v5 = v4;
    v7 = v6;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarHeight");
    *(float *)&v8 = v8;
    if (v7 != *(float *)&v8)
    {
      -[UIImageView setFrame:](self->_topShineView, "setFrame:", v5);
      -[PLCropOverlay setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    cropView = self->_cropView;
    if (cropView)
    {
      -[PLCropOverlayCropView frame](cropView, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarHeight");
      *(float *)&v18 = v18;
      v19 = *(float *)&v18 - self->_statusBarHeight;
      self->_statusBarHeight = *(float *)&v18;
      -[PLCropOverlayCropView setFrame:](self->_cropView, "setFrame:", v11, v13 + v19, v15, v17 - v19);
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dismiss
{
  PLCropOverlay *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = self;
  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__PLCropOverlay_dismiss__block_invoke;
  v5[3] = &unk_1E70B6370;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__PLCropOverlay_dismiss__block_invoke_2;
  v4[3] = &unk_1E70B6398;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v5, v4, 0.5);
  -[PLProgressHUD done](self->_hud, "done");
  -[PLProgressHUD removeFromSuperview](self->_hud, "removeFromSuperview");

  self->_hud = 0;
}

- (void)_fadeOutCompleted:(id)a3
{
  PLCropOverlay *v4;

  -[PLCropOverlay removeFromSuperview](self, "removeFromSuperview", a3);
  v4 = self;
}

- (void)cancelButtonClicked:(id)a3
{
  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "cropOverlayWasCancelled:", self);
}

- (void)_tappedBottomBarCancelButton:(id)a3
{
  double v4;

  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "cropOverlayWasCancelled:", self);
  if ((*((_BYTE *)self + 512) & 8) != 0)
  {
    *((_BYTE *)self + 512) &= ~8u;
    -[PLCropOverlayBottomBar setStyle:animated:](self->__bottomBar, "setStyle:animated:", 0, 1);
    LODWORD(v4) = 0.5;
    -[PLCropOverlay setCropRectVisible:duration:](self, "setCropRectVisible:duration:", 0, v4);
    if (-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"))
      -[UIView pl_setHidden:animated:](-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"), "pl_setHidden:animated:", 1, 1);
  }
}

- (void)_tappedBottomBarDoneButton:(id)a3
{
  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "cropOverlayWasOKed:", self);
}

- (void)_tappedBottomBarSetHomeButton
{
  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "setImageAsHomeScreenClicked:", self);
}

- (void)_tappedBottomBarSetLockButton
{
  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "setImageAsLockScreenClicked:", self);
}

- (void)_tappedBottomBarSetBothButton
{
  -[PLCropOverlay setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "setImageAsHomeScreenAndLockScreenClicked:", self);
}

- (void)_tappedBottomBarMotionToggle
{
  -[PLCropOverlay setMotionToggleIsOn:](self, "setMotionToggleIsOn:", !self->_motionToggleIsOn);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "motionToggledManually:", self->_motionToggleIsOn);
}

- (id)_bottomBarFileSizeMenu
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA4F0];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __39__PLCropOverlay__bottomBarFileSizeMenu__block_invoke;
  v8 = &unk_1E70B5BB0;
  objc_copyWeak(&v9, &location);
  v11[0] = objc_msgSend(v2, "elementWithProvider:", &v5);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E70B6A68, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1, v5, v6, v7, v8));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_bottomBarFileSizeMenuActions
{
  PLCropOverlayDelegate **p_delegate;

  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)objc_msgSend(objc_loadWeak((id *)p_delegate), "cropOverlayFileSizeMenuActions:", self);
  else
    return 0;
}

- (void)setMotionToggleIsOn:(BOOL)a3
{
  if (self->_motionToggleIsOn != a3)
  {
    self->_motionToggleIsOn = a3;
    -[PLCropOverlay _updateMotionToggle](self, "_updateMotionToggle");
    -[PLCropOverlayWallpaperBottomBar setNeedsLayout](-[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar"), "setNeedsLayout");
  }
}

- (void)_updateMotionToggle
{
  -[PLWallpaperButton setTitle:forState:](-[PLCropOverlayWallpaperBottomBar motionToggle](-[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar"), "motionToggle"), "setTitle:forState:", PLLocalizedFrameworkString(), 0);
}

- (void)setIsEditingHomeScreen:(BOOL)a3
{
  if (self->_isEditingHomeScreen != a3)
  {
    self->_isEditingHomeScreen = a3;
    -[PLCropOverlay _updateWallpaperBottomBarSettingButtons](self, "_updateWallpaperBottomBarSettingButtons");
  }
}

- (void)setIsEditingLockScreen:(BOOL)a3
{
  if (self->_isEditingLockScreen != a3)
  {
    self->_isEditingLockScreen = a3;
    -[PLCropOverlay _updateWallpaperBottomBarSettingButtons](self, "_updateWallpaperBottomBarSettingButtons");
  }
}

- (void)_updateWallpaperBottomBarSettingButtons
{
  _BOOL4 isEditingLockScreen;
  PLCropOverlayWallpaperBottomBar *v4;
  uint64_t v5;
  _BOOL4 isEditingHomeScreen;

  isEditingLockScreen = self->_isEditingLockScreen;
  if (self->_isEditingLockScreen)
  {
    v4 = -[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar");
  }
  else
  {
    isEditingHomeScreen = self->_isEditingHomeScreen;
    v4 = -[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar");
    if (isEditingHomeScreen)
    {
      v5 = 1;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  -[PLCropOverlayWallpaperBottomBar setShouldOnlyShowHomeScreenButton:](v4, "setShouldOnlyShowHomeScreenButton:", v5);
  -[PLCropOverlayWallpaperBottomBar setShouldOnlyShowLockScreenButton:](-[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar"), "setShouldOnlyShowLockScreenButton:", isEditingLockScreen);
}

- (void)setMotionToggleHidden:(BOOL)a3
{
  -[PLCropOverlayWallpaperBottomBar setMotionToggleHidden:](-[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar"), "setMotionToggleHidden:", a3);
}

- (BOOL)motionToggleHidden
{
  return -[PLCropOverlayWallpaperBottomBar motionToggleHidden](-[PLCropOverlay wallpaperBottomBar](self, "wallpaperBottomBar"), "motionToggleHidden");
}

- (void)_tappedBottomBarPlaybackButton:(id)a3
{
  _BOOL4 v4;

  -[PLCropOverlayBottomBar togglePlaybackState](self->__bottomBar, "togglePlaybackState", a3);
  v4 = -[PLCropOverlayBottomBar isPlayingVideo](self->__bottomBar, "isPlayingVideo");
  objc_loadWeak((id *)&self->_delegate);
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "cropOverlayPlay:", self);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "cropOverlayPause:", self);
  }
}

- (void)cropOverlayBottomBarPlayButtonClicked:(id)a3
{
  PLCropOverlayDelegate **p_delegate;

  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)p_delegate), "cropOverlayPlay:", self);
}

- (void)_playButtonPressed:(id)a3
{
  -[PLCropOverlay cropOverlayBottomBarPlayButtonClicked:](self, "cropOverlayBottomBarPlayButtonClicked:", 0);
}

- (void)cropOverlayBottomBarPauseButtonClicked:(id)a3
{
  PLCropOverlayDelegate **p_delegate;

  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)p_delegate), "cropOverlayPause:", self);
}

- (void)_pauseButtonPressed:(id)a3
{
  -[PLCropOverlay cropOverlayBottomBarPauseButtonClicked:](self, "cropOverlayBottomBarPauseButtonClicked:", 0);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PLCropOverlay;
  -[PLCropOverlay setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  -[PLCropOverlayBottomBar setUserInteractionEnabled:](-[PLCropOverlay _bottomBar](self, "_bottomBar"), "setUserInteractionEnabled:", v3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIView *v5;
  char isKindOfClass;
  UIView *overlayContainerView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLCropOverlay;
  v5 = -[PLCropOverlay hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  overlayContainerView = self->_overlayContainerView;
  if ((!overlayContainerView || v5 == overlayContainerView || !-[UIView isDescendantOfView:](v5, "isDescendantOfView:"))
    && (isKindOfClass & 1) == 0)
  {
    return 0;
  }
  return v5;
}

- (CGRect)cropRect
{
  uint64_t v3;
  CGFloat x;
  double y;
  BOOL v6;
  PLCropOverlayBottomBar *bottomBar;
  PLContactPhotoOverlay *contactPhotoOverlay;
  double v9;
  double v10;
  double v11;
  double height;
  CGFloat width;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v3 = MEMORY[0x1E0C9D648];
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = -[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode);
  bottomBar = self->__bottomBar;
  if (v6)
  {
    if (-[PLCropOverlayBottomBar previewBottomBar](bottomBar, "previewBottomBar"))
    {
      contactPhotoOverlay = self->_contactPhotoOverlay;
      if (contactPhotoOverlay && (-[PLContactPhotoOverlay bounds](contactPhotoOverlay, "bounds"), !CGRectIsEmpty(v28)))
        -[PLContactPhotoOverlay inscribingBounds](self->_contactPhotoOverlay, "inscribingBounds");
      else
        -[PLCropOverlay bounds](self, "bounds");
    }
    else
    {
      -[PLCropOverlay bounds](self, "bounds");
      -[UIImageView frame](self->_bottomShineView, "frame");
      -[UIImageView frame](self->_topShineView, "frame");
      CGRectGetMaxY(v29);
      UIRectCenteredIntegralRect();
    }
    x = v9;
    y = v10;
    width = v11;
  }
  else if (bottomBar)
  {
    x = self->_cropRect.origin.x;
    y = self->_cropRect.origin.y;
    width = self->_cropRect.size.width;
    height = self->_cropRect.size.height;
  }
  else
  {
    width = *(double *)(v3 + 16);
    height = *(double *)(v3 + 24);
    if (self->_wildcatPickerBottomView && self->_wildcatPickerTopView)
    {
      -[PLCropOverlay bounds](self, "bounds");
      x = v14;
      v16 = v15;
      width = v17;
      v19 = v18;
      -[UIView frame](self->_wildcatPickerTopView, "frame");
      v21 = v20;
      v23 = v22;
      -[UIView frame](self->_wildcatPickerBottomView, "frame");
      y = v16 + v21 + v23;
      height = v19 - (v21 + v23 + v24);
    }
  }
  v25 = x;
  v26 = y;
  v27 = width;
  result.size.height = height;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)setTitle:(id)a3 okButtonTitle:(id)a4
{
  if (-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
  {
    -[UILabel setText:](self->_titleLabel, "setText:", a3);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[PLCropOverlay setNeedsLayout](self, "setNeedsLayout");
    -[UIButton setTitle:forState:](self->_okButton, "setTitle:forState:", a4, 0);
  }
}

- (void)setTitle:(id)a3
{
  if (-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
  {
    -[UILabel setText:](self->_titleLabel, "setText:", a3);
    -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    -[PLCropOverlay setNeedsLayout](self, "setNeedsLayout");
  }
  else if (self->_mode == 6)
  {
    -[PLCropOverlayWallpaperBottomBar setText:](-[PLCropOverlayBottomBar wallpaperBottomBar](self->__bottomBar, "wallpaperBottomBar"), "setText:", a3);
  }
}

- (CGRect)titleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
  {
    -[UILabel frame](self->_titleLabel, "frame");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setOKButtonTitle:(id)a3
{
  if (!-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
  {
    -[UIButton setTitle:forState:](-[PLCropOverlayPreviewBottomBar doneButton](-[PLCropOverlayBottomBar previewBottomBar](self->__bottomBar, "previewBottomBar"), "doneButton"), "setTitle:forState:", a3, 0);
    -[PLCropOverlayBottomBar setNeedsLayout](self->__bottomBar, "setNeedsLayout");
  }
  -[UIButton setTitle:forState:](self->_okButton, "setTitle:forState:", a3, 0);
  if (self->_mode == 6)
    -[PLWallpaperButton setTitle:forState:](-[PLCropOverlayWallpaperBottomBar doSetButton](-[PLCropOverlayBottomBar wallpaperBottomBar](self->__bottomBar, "wallpaperBottomBar"), "doSetButton"), "setTitle:forState:", a3, 0);
}

- (void)setDefaultOKButtonTitle:(id)a3
{
  if (self->_defaultOKButtonTitle != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_defaultOKButtonTitle = (NSString *)objc_msgSend(a3, "copy");
    -[PLCropOverlay _updateEditImageDoneButtonTitle](self, "_updateEditImageDoneButtonTitle");
  }
}

- (void)setDefaultCancelButtonTitle:(id)a3
{
  if (self->_defaultCancelButtonTitle != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->_defaultCancelButtonTitle = (NSString *)objc_msgSend(a3, "copy");
    -[PLCropOverlay _updateEditImageCancelButtonTitle](self, "_updateEditImageCancelButtonTitle");
  }
}

- (void)setOKButtonShowsCamera:(BOOL)a3
{
  if (!-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
    -[PLCropOverlayBottomBar setStyle:](self->__bottomBar, "setStyle:", 0);
}

- (void)setCancelButtonTitle:(id)a3
{
  if (!-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode))
  {
    -[UIButton setTitle:forState:](-[PLCropOverlayPreviewBottomBar cancelButton](-[PLCropOverlayBottomBar previewBottomBar](self->__bottomBar, "previewBottomBar"), "cancelButton"), "setTitle:forState:", a3, 0);
    -[PLCropOverlayBottomBar setNeedsLayout](self->__bottomBar, "setNeedsLayout");
  }
}

- (void)setShowProgress:(BOOL)a3 title:(id)a4
{
  PLProgressHUD *v6;

  if (a3
    && (-[PLCropOverlay isTelephonyUIMode:](self, "isTelephonyUIMode:", self->_mode)
     || -[PLCropOverlay isWallpaperUIMode:](self, "isWallpaperUIMode:", self->_mode)))
  {

    v6 = objc_alloc_init(PLProgressHUD);
    self->_hud = v6;
    -[PLProgressHUD setText:](v6, "setText:", a4);
    -[PLProgressHUD showInView:](self->_hud, "showInView:", self);
  }
  else
  {
    -[PLProgressHUD hide](self->_hud, "hide");
  }
}

- (void)removeProgress
{
  -[PLProgressHUD removeFromSuperview](self->_hud, "removeFromSuperview");

  self->_hud = 0;
}

- (void)setProgressDone
{
  -[PLProgressHUD done](self->_hud, "done");
}

- (void)setShowsCropRegion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 512) = *((_BYTE *)self + 512) & 0xEF | v3;
}

- (void)setTitleHidden:(BOOL)a3 animationDuration:(double)a4
{
  double v4;
  _QWORD v5[6];

  v4 = 1.0;
  if (a3)
    v4 = 0.0;
  if (a4 <= 0.0)
  {
    -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__PLCropOverlay_setTitleHidden_animationDuration___block_invoke;
    v5[3] = &unk_1E70B6640;
    v5[4] = self;
    *(double *)&v5[5] = v4;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5);
  }
}

- (void)setPreviewMode:(BOOL)a3
{
  char v3;
  double v5;

  v3 = *((_BYTE *)self + 512);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 512) = v3 & 0xFE | a3;
    -[PLCropOverlay _updateTitle](self, "_updateTitle");
    -[UIView setHidden:](self->_wildcatPickerTopView, "setHidden:", *((_BYTE *)self + 512) & 1);
    -[UIView setHidden:](self->_wildcatPickerBottomView, "setHidden:", *((_BYTE *)self + 512) & 1);
    LODWORD(v5) = 0;
    -[PLCropOverlay setCropRectVisible:duration:](self, "setCropRectVisible:duration:", (*((_BYTE *)self + 512) & 1) == 0, v5);
  }
}

- (BOOL)previewMode
{
  return *((_BYTE *)self + 512) & 1;
}

- (id)_fileResizingButton
{
  return -[PLCropOverlayPreviewBottomBar fileResizingButton](-[PLCropOverlayBottomBar previewBottomBar](-[PLCropOverlay _bottomBar](self, "_bottomBar"), "previewBottomBar"), "fileResizingButton");
}

- (void)setFileResizingTitle:(id)a3
{
  objc_msgSend(-[PLCropOverlay _fileResizingButton](self, "_fileResizingButton"), "setTitle:forState:", a3, 0);
}

- (void)setFileResizingHidden:(BOOL)a3
{
  objc_msgSend(-[PLCropOverlay _fileResizingButton](self, "_fileResizingButton"), "setHidden:", a3);
}

- (void)_updateTitle
{
  -[PLCropOverlay setTitle:](self, "setTitle:", PLLocalizedFrameworkString());
}

- (void)_updateEditImageDoneButtonTitle
{
  unsigned int mode;
  BOOL v3;
  int v4;
  UIButton *v7;
  NSString *v8;

  mode = self->_mode;
  v3 = mode > 7;
  v4 = (1 << mode) & 0x92;
  if (!v3 && v4 != 0)
  {
    v7 = -[PLCropOverlayPreviewBottomBar doneButton](-[PLCropOverlayBottomBar previewBottomBar](-[PLCropOverlay _bottomBar](self, "_bottomBar"), "previewBottomBar"), "doneButton");
    v8 = -[PLCropOverlay defaultOKButtonTitle](self, "defaultOKButtonTitle");
    if (!-[NSString length](v8, "length"))
      v8 = (NSString *)PLLocalizedFrameworkString();
    -[UIButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);
  }
}

- (void)_updateEditImageCancelButtonTitle
{
  UIButton *v3;
  NSString *v4;

  v3 = -[PLCropOverlayPreviewBottomBar cancelButton](-[PLCropOverlayBottomBar previewBottomBar](-[PLCropOverlay _bottomBar](self, "_bottomBar"), "previewBottomBar"), "cancelButton");
  v4 = -[PLCropOverlay defaultCancelButtonTitle](self, "defaultCancelButtonTitle");
  if (!-[NSString length](v4, "length"))
    v4 = (NSString *)PLLocalizedFrameworkString();
  -[UIButton setTitle:forState:](v3, "setTitle:forState:", v4, 0);
}

- (void)_updateToolbarItems:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  uint64_t v7;
  char **v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v6 = objc_alloc(MEMORY[0x1E0CEA380]);
  if (v3)
    v7 = 17;
  else
    v7 = 18;
  v8 = &selRef__playButtonPressed_;
  if (!v3)
    v8 = &selRef__pauseButtonPressed_;
  v9 = (id)objc_msgSend(v6, "initWithBarButtonSystemItem:target:action:", v7, self, *v8);
  -[UIToolbar setItems:](self->_customToolbar, "setItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v5, v9, v5, 0));

}

- (void)_updateCropRectInRect:(CGRect)a3
{
  CGRect *p_cropRect;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;

  p_cropRect = &self->_cropRect;
  self->_cropRect.origin.x = 0.0;
  self->_cropRect.origin.y = 0.0;
  if (a3.size.width >= a3.size.height)
    a3.size.width = a3.size.height;
  self->_cropRect.size.width = a3.size.width;
  self->_cropRect.size.height = a3.size.width;
  UIRectCenteredIntegralRect();
  p_cropRect->origin.x = v4;
  p_cropRect->origin.y = v5;
  p_cropRect->size.width = v6;
  p_cropRect->size.height = v7;
}

- (id)_newOverlayViewWithFrame:(CGRect)a3 lighterEdgeOnTop:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  UIImage *ImageFromCurrentImageContext;
  uint64_t v14;
  void *v15;
  CGSize v17;
  CGRect v18;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.width = 1.0;
  v17.height = 5.0;
  UIGraphicsBeginImageContext(v17);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.098, 0.62), "set");
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = 1.0;
  v18.size.height = 5.0;
  UIRectFillUsingBlendMode(v18, kCGBlendModeNormal);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.37), "set");
  if (v4)
    v9 = 1.0;
  else
    v9 = 3.0;
  v10 = 0;
  v11 = 1.0;
  v12 = 1.0;
  UIRectFillUsingBlendMode(*(CGRect *)(&v9 - 1), kCGBlendModeCopy);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v14 = -[UIImage resizableImageWithCapInsets:resizingMode:](ImageFromCurrentImageContext, "resizableImageWithCapInsets:resizingMode:", 1, 2.0, 0.0, 2.0, 0.0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, width, height);
  objc_msgSend(v15, "setImage:", v14);
  return v15;
}

- (BOOL)isTelephonyUIMode:(int)a3
{
  return (a3 - 3) < 2;
}

- (BOOL)isWallpaperUIMode:(int)a3
{
  return a3 == 6;
}

- (PLContactPhotoOverlay)contactPhotoOverlay
{
  return self->_contactPhotoOverlay;
}

- (BOOL)motionToggleIsOn
{
  return self->_motionToggleIsOn;
}

- (BOOL)isEditingHomeScreen
{
  return self->_isEditingHomeScreen;
}

- (BOOL)isEditingLockScreen
{
  return self->_isEditingLockScreen;
}

- (BOOL)isDisplayedInPopover
{
  return self->_displayedInPopover;
}

- (NSString)defaultOKButtonTitle
{
  return self->_defaultOKButtonTitle;
}

- (NSString)defaultCancelButtonTitle
{
  return self->_defaultCancelButtonTitle;
}

- (PLCropOverlayDelegate)delegate
{
  return (PLCropOverlayDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (PLCropOverlayBottomBar)_bottomBar
{
  return self->__bottomBar;
}

- (UIButton)_cameraCancelButton
{
  return self->__cameraCancelButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __50__PLCropOverlay_setTitleHidden_animationDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __39__PLCropOverlay__bottomBarFileSizeMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_bottomBarFileSizeMenuActions");
  if (v3)
    v4 = v3;
  else
    v4 = MEMORY[0x1E0C9AA60];
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v4);
}

uint64_t __24__PLCropOverlay_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __24__PLCropOverlay_dismiss__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeOutCompleted:", 0);
}

uint64_t __45__PLCropOverlay_setCropRectVisible_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", (double)((*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 512) >> 1) & 1));
}

- (void)beginBackgroundSaveWithTile:(id)a3 progressTitle:(id)a4 completionCallbackTarget:(id)a5 options:(int)a6
{
  uint64_t v6;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;

  v6 = *(_QWORD *)&a6;
  v11 = (void *)objc_msgSend(a3, "scrollView");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v6);
  objc_msgSend(v11, "cancelMouseTracking");
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "beginIgnoringInteractionEvents");
  if (!a4)
    a4 = (id)PLLocalizedFrameworkString();
  -[PLCropOverlay setShowProgress:title:](self, "setShowProgress:title:", 1, a4);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a3, CFSTR("tile"), a5, CFSTR("completionTarget"), v12, CFSTR("options"), 0);
  v14 = (void *)objc_msgSend(a3, "scrollView");
  if ((v6 & 4) != 0)
    -[PLContactPhotoOverlay inscribingBounds](-[PLCropOverlay contactPhotoOverlay](self, "contactPhotoOverlay"), "inscribingBounds");
  else
    -[PLCropOverlay cropRect](self, "cropRect");
  objc_msgSend(v14, "convertRect:fromView:", self);
  v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
  v17 = dispatch_queue_create("com.apple.photos.plcropoverlay.save", v16);
  pl_dispatch_async();
  dispatch_release(v17);

}

- (void)_backgroundSavePhoto:(id)a3 cropRect:(CGRect)a4 minimalCropDimension:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("tile")), "dictionaryWithCroppedImageForRect:minimalCropDimension:withOptions:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("options")), "unsignedIntValue"), x, y, width, height, a5);
  v13 = objc_msgSend(a3, "objectForKey:", CFSTR("completionTarget"));
  if (v12)
    v14 = (id)objc_msgSend(v12, "mutableCopy");
  else
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v14;
  if (v13)
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("completionTarget"));
  pl_dispatch_sync();

}

- (void)_savePhotoFinished:(id)a3
{
  -[PLCropOverlay setProgressDone](self, "setProgressDone");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "endIgnoringInteractionEvents");
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("completionTarget")), "cropOverlay:didFinishSaving:", self, a3);
}

uint64_t __81__PLCropOverlay_PhotoSaving___backgroundSavePhoto_cropRect_minimalCropDimension___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_savePhotoFinished:", *(_QWORD *)(a1 + 40));
}

uint64_t __105__PLCropOverlay_PhotoSaving__beginBackgroundSaveWithTile_progressTitle_completionCallbackTarget_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backgroundSavePhoto:cropRect:minimalCropDimension:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

@end
