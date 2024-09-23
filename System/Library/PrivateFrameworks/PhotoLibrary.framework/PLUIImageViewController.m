@implementation PLUIImageViewController

- (BOOL)_displaysFullScreen
{
  return (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
      || -[PLUIImageViewController cropOverlayMode](self, "cropOverlayMode") == 4;
}

- (PLUIImageViewController)initWithPhoto:(id)a3
{
  PLUIImageViewController *v4;
  PLManagedAsset *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLUIImageViewController;
  v4 = -[PLUIImageViewController init](&v8, sel_init);
  if (v4)
  {
    v5 = (PLManagedAsset *)a3;
    v4->_photo = v5;
    if (-[PLManagedAsset isVideo](v5, "isVideo"))
      v6 = 4;
    else
      v6 = 0;
    *((_BYTE *)v4 + 1088) = *((_BYTE *)v4 + 1088) & 0xFB | v6;
  }
  return v4;
}

- (PLUIImageViewController)initWithImage:(CGImage *)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PLUIImageViewController *v9;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PLUIImageViewController;
  v9 = -[PLUIImageViewController init](&v11, sel_init);
  if (v9)
  {
    v9->_imageRef = CGImageRetain(a3);
    v9->_cropRect.origin.x = x;
    v9->_cropRect.origin.y = y;
    v9->_cropRect.size.width = width;
    v9->_cropRect.size.height = height;
  }
  return v9;
}

- (PLUIImageViewController)initWithUIImage:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PLUIImageViewController *v9;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PLUIImageViewController;
  v9 = -[PLUIImageViewController init](&v11, sel_init);
  if (v9)
  {
    v9->_image = (UIImage *)a3;
    v9->_cropRect.origin.x = x;
    v9->_cropRect.origin.y = y;
    v9->_cropRect.size.width = width;
    v9->_cropRect.size.height = height;
  }
  return v9;
}

- (PLUIImageViewController)initWithImageData:(id)a3 cropRect:(CGRect)a4
{
  PLUIImageViewController *v4;
  UIImage *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLUIImageViewController;
  v4 = -[PLUIImageViewController init](&v11, sel_init);
  if (v4)
  {
    v5 = (UIImage *)PLCreateImageFromDataWithFormat();
    v4->_image = v5;
    -[UIImage size](v5, "size");
    PLImageSizeFromImageData();
    PLScaledCropRect();
    v4->_cropRect.origin.x = v6;
    v4->_cropRect.origin.y = v7;
    v4->_cropRect.size.width = v8;
    v4->_cropRect.size.height = v9;
    if (!v4->_image)
    {

      return 0;
    }
  }
  return v4;
}

- (PLUIImageViewController)initWithVideoURL:(id)a3
{
  PLUIImageViewController *v4;
  PLUIImageViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLUIImageViewController;
  v4 = -[PLUIImageViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 1088) |= 4u;
    v4->_videoURL = (NSURL *)a3;
  }
  return v5;
}

- (void)dealloc
{
  CGImage *imageRef;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  imageRef = self->_imageRef;
  if (imageRef)
    CGImageRelease(imageRef);

  -[PLPhotoTileViewController setTileDelegate:](self->_imageTile, "setTileDelegate:", 0);
  -[PLVideoView setDelegate:](self->_videoView, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PLUIImageViewController;
  -[PLUIImageViewController dealloc](&v4, sel_dealloc);
}

- (int)cropOverlayMode
{
  int v3;

  if (-[UIViewController uiipc_useTelephonyUI](self, "uiipc_useTelephonyUI"))
    return 4;
  v3 = 1;
  if ((*((_BYTE *)self + 1088) & 4) != 0)
  {
    if (-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI"))
      return 1;
    else
      return 2;
  }
  return v3;
}

- (id)cropOverlay
{
  return self->_cropOverlay;
}

- (void)setCropOverlayDone
{
  -[PLCropOverlay setProgressDone](self->_cropOverlay, "setProgressDone");
}

- (CGRect)previewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 320.0;
  v3 = 426.0;
  v4 = 0.0;
  v5 = 1.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_viewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[PLUIImageViewController navigationController](self, "navigationController"))
  {
    objc_msgSend((id)objc_msgSend((id)-[PLUIImageViewController navigationController](self, "navigationController"), "view"), "bounds");
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom");
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v16 = 320.0;
  else
    v16 = v8;
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v17 = 426.0;
  else
    v17 = v10;
  v18 = v4;
  v19 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (unint64_t)_contentAutoresizingMask
{
  return 18;
}

- (unint64_t)_tileAutoresizingMask
{
  return 18;
}

- (NSString)localizedUseButtonTitle
{
  return (NSString *)PLLocalizedFrameworkString();
}

- (NSString)localizedTitle
{
  return (NSString *)PLLocalizedFrameworkString();
}

- (BOOL)clientIsWallpaper
{
  return 0;
}

- (BOOL)wantsAutoloopUI
{
  return 0;
}

- (BOOL)wantsLegacyImageUI
{
  return 1;
}

- (void)setupNavigationItem
{
  void *v3;
  NSString *v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;

  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v3 = (void *)-[PLUIImageViewController navigationItem](self, "navigationItem");
    objc_msgSend(v3, "setTitle:", -[PLUIImageViewController localizedTitle](self, "localizedTitle"));
    v4 = -[PLUIImageViewController chooseButtonTitle](self, "chooseButtonTitle");
    if (!-[NSString length](v4, "length"))
      v4 = -[PLUIImageViewController localizedUseButtonTitle](self, "localizedUseButtonTitle");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", v4, 2, self, sel_cropOverlayWasOKed_);
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("Done"));
    objc_msgSend(v3, "setRightBarButtonItem:", v5);

    v6 = -[PLUIImageViewController cropOverlayMode](self, "cropOverlayMode");
    if (v6 <= 8 && ((1 << v6) & 0x1E6) != 0)
    {
      v7 = -[PLUIImageViewController cancelButtonTitle](self, "cancelButtonTitle");
      if (!objc_msgSend(v7, "length"))
        v7 = (id)PLLocalizedFrameworkString();
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithTitle:style:target:action:", v7, 0, self, sel_cropOverlayWasCancelled_);
      objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("Cancel"));
      objc_msgSend(v3, "setLeftBarButtonItem:", v8);

    }
  }
}

- (Class)_viewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  uint64_t v9;
  id v10;
  id v11;
  _BOOL4 v12;
  _BOOL8 v13;
  id v14;
  double v15;
  double v16;
  id v17;
  PLCropOverlay *v18;
  PLVideoView *v19;
  CGImage *imageRef;
  uint64_t v21;
  PLPhotoTileViewController *v22;
  NSURL *videoURL;
  uint64_t v24;
  PLVideoView *v25;
  double v26;
  double v27;
  PLManagedAsset *photo;
  UIImage *image;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  PLPhotoTileViewController *v35;
  _BOOL8 v36;
  PLVideoView *videoView;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  PLPhotoTileViewController *v42;
  id v43;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[PLUIImageViewController previewFrame](self, "previewFrame");
  -[PLUIImageViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v7);
  v43 = (id)objc_msgSend(objc_alloc(-[PLUIImageViewController _viewClass](self, "_viewClass")), "initWithFrame:", v3, v4, v6, v5);
  objc_msgSend(v43, "setAutoresizingMask:", -[PLUIImageViewController _contentAutoresizingMask](self, "_contentAutoresizingMask"));
  v8 = (double *)MEMORY[0x1E0C9D538];
  v9 = objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v10 = -[PLUIImageViewController customBackgroundColor](self, "customBackgroundColor");
  if (v10)
    v11 = v10;
  else
    v11 = (id)v9;
  objc_msgSend(v43, "setBackgroundColor:", v11);
  -[PLUIImageViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  v12 = -[UIViewController uiipc_useTelephonyUI](self, "uiipc_useTelephonyUI");
  v13 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
     && v12;
  -[PLUIImageViewController setupNavigationItem](self, "setupNavigationItem");
  v14 = -[PLUIImageViewController chooseButtonTitle](self, "chooseButtonTitle");
  if (!objc_msgSend(v14, "length"))
    v14 = (id)PLLocalizedFrameworkString();
  v16 = *v8;
  v15 = v8[1];
  v17 = -[PLUIImageViewController cancelButtonTitle](self, "cancelButtonTitle");
  if (!objc_msgSend(v17, "length"))
    v17 = (id)PLLocalizedFrameworkString();

  v18 = -[PLCropOverlay initWithFrame:mode:offsettingStatusBar:]([PLCropOverlay alloc], "initWithFrame:mode:offsettingStatusBar:", -[PLUIImageViewController cropOverlayMode](self, "cropOverlayMode"), v13, v16, v15, v6, v5);
  self->_cropOverlay = v18;
  -[PLCropOverlay setDisplayedInPopover:](v18, "setDisplayedInPopover:", 0);
  -[PLCropOverlay setOKButtonTitle:](self->_cropOverlay, "setOKButtonTitle:", v14);
  -[PLCropOverlay setDefaultOKButtonTitle:](self->_cropOverlay, "setDefaultOKButtonTitle:", v14);
  -[PLCropOverlay setCancelButtonTitle:](self->_cropOverlay, "setCancelButtonTitle:", v17);
  -[PLCropOverlay setDefaultCancelButtonTitle:](self->_cropOverlay, "setDefaultCancelButtonTitle:", v17);
  -[PLCropOverlay setDelegate:](self->_cropOverlay, "setDelegate:", self);
  -[PLCropOverlay setAutoresizingMask:](self->_cropOverlay, "setAutoresizingMask:", -[PLUIImageViewController _tileAutoresizingMask](self, "_tileAutoresizingMask"));
  -[PLVideoView setDelegate:](self->_videoView, "setDelegate:", 0);

  self->_videoView = 0;
  self->_imageTile = 0;
  if ((*((_BYTE *)self + 1088) & 4) == 0 && !-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI"))
  {
    imageRef = self->_imageRef;
    if (imageRef)
    {
      if (-[PLUIImageViewController clientIsWallpaper](self, "clientIsWallpaper"))
        v21 = 2;
      else
        v21 = 1;
      v22 = +[PLPhotoTileViewController newPhotoTileViewControllerWithFrame:imageRef:imageOrientation:allowZoomToFill:mode:](PLPhotoTileViewController, "newPhotoTileViewControllerWithFrame:imageRef:imageOrientation:allowZoomToFill:mode:", imageRef, 0, 1, v21, v16, v15, v6, v5);
    }
    else
    {
      image = self->_image;
      if (!image)
      {
        v40 = -[PLManagedAsset pl_PHAssetFromPhotoLibrary:](self->_photo, "pl_PHAssetFromPhotoLibrary:", pl_appPhotoLibrary());
        if (-[PLUIImageViewController clientIsWallpaper](self, "clientIsWallpaper"))
          v41 = 2;
        else
          v41 = 1;
        v42 = +[PLPhotoTileViewController newPhotoTileViewControllerWithFrame:modelPhoto:mode:](PLPhotoTileViewController, "newPhotoTileViewControllerWithFrame:modelPhoto:mode:", v40, v41, v16, v15, v6, v5);
        self->_imageTile = v42;
        -[PLPhotoTileViewController setTileDelegate:](v42, "setTileDelegate:", self);
        goto LABEL_36;
      }
      if (-[PLUIImageViewController clientIsWallpaper](self, "clientIsWallpaper"))
        v30 = 2;
      else
        v30 = 1;
      v22 = +[PLPhotoTileViewController newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:](PLPhotoTileViewController, "newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:", image, 1, v30, v16, v15, v6, v5);
    }
    self->_imageTile = v22;
    goto LABEL_36;
  }
  if (!-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI"))
  {
    if (-[NSURL isFileURL](self->_videoURL, "isFileURL"))
    {
      v19 = (PLVideoView *)+[PLVideoView videoViewForVideoFileAtURL:](PLVideoView, "videoViewForVideoFileAtURL:", self->_videoURL);
    }
    else
    {
      videoURL = self->_videoURL;
      if (videoURL)
      {
        v24 = objc_msgSend(MEMORY[0x1E0D71880], "photoFromAssetURL:photoLibrary:", videoURL, objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary"));
        v25 = [PLVideoView alloc];
        v26 = 1.0;
        v27 = 1.0;
        photo = (PLManagedAsset *)v24;
      }
      else
      {
        v25 = [PLVideoView alloc];
        photo = self->_photo;
        v26 = 1.0;
        v27 = 1.0;
      }
      v19 = -[PLVideoView initWithFrame:videoCameraImage:orientation:](v25, "initWithFrame:videoCameraImage:orientation:", photo, 1, 0.0, 0.0, v26, v27);
    }
    self->_videoView = v19;
    -[PLUIImageViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 14);
    -[PLUIImageViewController previewFrame](self, "previewFrame");
    v32 = v31;
    v34 = v33;
    if (!PLIsTallScreen())
      v5 = v34;
    v35 = objc_alloc_init(PLPhotoTileViewController);
    self->_imageTile = v35;
    objc_msgSend((id)-[PLPhotoTileViewController view](v35, "view"), "setFrame:", 0.0, 0.0, v32, v5);
    -[PLVideoView setFrame:](self->_videoView, "setFrame:", 0.0, 0.0, v32, v5);
    -[PLVideoView setDelegate:](self->_videoView, "setDelegate:", self);
    v36 = 1;
    -[PLVideoView setLoadMediaImmediately:](self->_videoView, "setLoadMediaImmediately:", 1);
    -[PLVideoView setShowsPlayOverlay:](self->_videoView, "setShowsPlayOverlay:", 0);
    videoView = self->_videoView;
    if ((*((_BYTE *)self + 1088) & 1) == 0)
      v36 = -[PLUIImageViewController viewImageBeforeSelecting](self, "viewImageBeforeSelecting");
    -[PLVideoView setCanEdit:](videoView, "setCanEdit:", v36);
    -[PLVideoView setImageTile:](self->_videoView, "setImageTile:", self->_imageTile);
    -[PLPhotoTileViewController setVideoView:](self->_imageTile, "setVideoView:", self->_videoView);
    -[PLCropOverlay didCaptureVideo](self->_cropOverlay, "didCaptureVideo");
    -[PLCropOverlay setUserInteractionEnabled:](self->_cropOverlay, "setUserInteractionEnabled:", 0);
  }
LABEL_36:
  -[PLPhotoTileViewController setOrientationDelegate:](self->_imageTile, "setOrientationDelegate:", self);
  -[PLPhotoTileViewController setForceNativeScreenScale:](self->_imageTile, "setForceNativeScreenScale:", -[PLUIImageViewController forceNativeScreenScale](self, "forceNativeScreenScale"));
  -[PLPhotoTileViewController setForce1XCroppedImage:](self->_imageTile, "setForce1XCroppedImage:", -[PLUIImageViewController force1XCroppedImage](self, "force1XCroppedImage"));
  -[PLPhotoTileViewController setMaxZoomScaleOverride:](self->_imageTile, "setMaxZoomScaleOverride:", -[PLUIImageViewController maxZoomScaleOverride](self, "maxZoomScaleOverride"));
  if (-[PLUIImageViewController wantsLegacyImageUI](self, "wantsLegacyImageUI") && self->_imageTile)
  {
    -[PLUIImageViewController addChildViewController:](self, "addChildViewController:");
    v38 = (void *)-[PLPhotoTileViewController view](self->_imageTile, "view");
    objc_msgSend(v38, "setAutoresizingMask:", -[PLUIImageViewController _tileAutoresizingMask](self, "_tileAutoresizingMask"));
    objc_msgSend(v43, "addSubview:", v38);
  }
  objc_msgSend(v43, "addSubview:", self->_cropOverlay);
  -[PLUIImageViewController _updateGestureSettings](self, "_updateGestureSettings");
  -[PLUIImageViewController setView:](self, "setView:", v43);
  if ((*((_BYTE *)self + 1088) & 1) != 0 && !-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI"))
    v39 = -[PLUIImageViewController wantsLegacyImageUI](self, "wantsLegacyImageUI") ^ 1;
  else
    v39 = 1;
  -[PLCropOverlay setPreviewMode:](self->_cropOverlay, "setPreviewMode:", v39);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  PLCropOverlay *cropOverlay;
  PLPhotoTileViewController *imageTile;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLUIImageViewController;
  -[PLUIImageViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  v3 = (void *)-[PLUIImageViewController view](self, "view");
  v4 = (void *)-[PLPhotoTileViewController view](self->_imageTile, "view");
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  if ((*((_BYTE *)self + 1088) & 4) == 0 && !-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI"))
  {
    cropOverlay = self->_cropOverlay;
    -[PLCropOverlay setNeedsLayout](cropOverlay, "setNeedsLayout");
    -[PLCropOverlay layoutIfNeeded](cropOverlay, "layoutIfNeeded");
    imageTile = self->_imageTile;
    -[PLCropOverlay cropRect](cropOverlay, "cropRect");
    -[PLPhotoTileViewController setCropOverlayRect:forCropRect:](imageTile, "setCropOverlayRect:forCropRect:");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  PLPhotoTileViewController *imageTile;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLUIImageViewController;
  -[PLUIImageViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, a3);
  if (-[UIViewController uiipc_useTelephonyUI](self, "uiipc_useTelephonyUI"))
  {
    imageTile = self->_imageTile;
    -[PLCropOverlay cropRect](self->_cropOverlay, "cropRect");
    -[PLPhotoTileViewController setCropOverlayRect:forCropRect:](imageTile, "setCropOverlayRect:forCropRect:");
  }
  -[PLPhotoTileViewController reloadZoomScale](self->_imageTile, "reloadZoomScale");
}

- (BOOL)wantsStatusBarVisible
{
  return 0;
}

- (int64_t)desiredStatusBarAnimation
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return !-[PLUIImageViewController wantsStatusBarVisible](self, "wantsStatusBarVisible");
}

- (BOOL)isDisplayedInPhotoPicker
{
  return -[UIViewController uiipc_imagePickerController](self, "uiipc_imagePickerController") != 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  char v8;
  double v9;
  objc_super v10;
  _QWORD v11[5];

  v3 = a3;
  if (-[PLUIImageViewController isDisplayedInPhotoPicker](self, "isDisplayedInPhotoPicker"))
  {
    -[PLUIImageViewController setAllowsEditing:](self, "setAllowsEditing:", -[PLUIImageViewController imagePickerAllowsEditing](self, "imagePickerAllowsEditing"));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__editabilityChanged_, *MEMORY[0x1E0CEC028], 0);
  }
  v6 = -[PLUIImageViewController cropOverlayMode](self, "cropOverlayMode");
  v7 = (void *)-[PLUIImageViewController navigationController](self, "navigationController");
  if (v6 == 4)
    objc_msgSend(v7, "setNavigationBarHidden:", 1);
  else
    objc_msgSend((id)objc_msgSend(v7, "navigationBar"), "setBarStyle:", 0);
  -[PLVideoView setDelegate:](self->_videoView, "setDelegate:", self);
  -[PLVideoView setShowsScrubber:](self->_videoView, "setShowsScrubber:", 1);
  -[PLVideoView setScrubberIsSubview:](self->_videoView, "setScrubberIsSubview:", 1);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "isStatusBarHidden"))
    v8 = 2;
  else
    v8 = 0;
  *((_BYTE *)self + 1088) = *((_BYTE *)self + 1088) & 0xFD | v8;
  v9 = *MEMORY[0x1E0CEB9E0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__PLUIImageViewController_viewWillAppear___block_invoke;
  v11[3] = &unk_1E70B6370;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v11, v9);
  v10.receiver = self;
  v10.super_class = (Class)PLUIImageViewController;
  -[PLUIImageViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  PLPhotoTileViewController *imageTile;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLUIImageViewController;
  -[PLUIImageViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[UIViewController uiipc_useTelephonyUI](self, "uiipc_useTelephonyUI"))
  {
    imageTile = self->_imageTile;
    -[PLCropOverlay cropRect](self->_cropOverlay, "cropRect");
    -[PLPhotoTileViewController setCropOverlayRect:forCropRect:](imageTile, "setCropOverlayRect:forCropRect:");
  }
}

- (int64_t)_imagePickerStatusBarStyle
{
  return self->_newStatusBarStyle;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if ((*((_BYTE *)self + 1088) & 0x10) != 0)
    -[PLVideoRemaker cancel](self->_remaker, "cancel");
  *((_BYTE *)self + 1088) |= 8u;
  -[PLVideoView stop](self->_videoView, "stop");
  -[PLVideoView setDelegate:](self->_videoView, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PLUIImageViewController;
  -[PLUIImageViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  *((_BYTE *)self + 1088) &= ~8u;
}

- (void)attachScrubberPalette
{
  UIView *v3;
  UIView *v4;
  void *v5;
  double Width;
  uint64_t v7;
  void *v8;
  CGRect v9;
  CGRect v10;

  v3 = -[PLVideoView scrubberBackgroundView](self->_videoView, "scrubberBackgroundView");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)-[PLUIImageViewController navigationController](self, "navigationController");
    if ((objc_msgSend(v5, "isNavigationBarHidden") & 1) == 0 && !objc_msgSend(v5, "existingPaletteForEdge:", 2))
    {
      -[PLUIImageViewController _viewFrame](self, "_viewFrame");
      Width = CGRectGetWidth(v9);
      -[UIView bounds](v4, "bounds");
      v7 = objc_msgSend(v5, "paletteForEdge:size:", 2, Width, CGRectGetHeight(v10));
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v5, "attachPalette:isPinned:", v7, 1);
        objc_msgSend(v8, "addSubview:", v4);
        -[UIView setBackgroundColor:](v4, "setBackgroundColor:", 0);
        objc_msgSend(v8, "bounds");
        -[UIView setFrame:](v4, "setFrame:");
        -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 10);
      }
    }
  }
}

- (void)_removedAsTopViewController
{
  -[PLPhotoTileViewController noteParentViewControllerDidDisappear](self->_imageTile, "noteParentViewControllerDidDisappear");
}

- (void)setAllowsEditing:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)self + 1088);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 1088) = v3 & 0xFE | a3;
    -[PLUIImageViewController _updateGestureSettings](self, "_updateGestureSettings");
    -[PLCropOverlay setPreviewMode:](self->_cropOverlay, "setPreviewMode:", (*((_BYTE *)self + 1088) & 1) == 0);
  }
}

- (void)_editabilityChanged:(id)a3
{
  -[PLUIImageViewController setAllowsEditing:](self, "setAllowsEditing:", -[PLUIImageViewController imagePickerAllowsEditing](self, "imagePickerAllowsEditing", a3));
}

- (void)_updateGestureSettings
{
  if ((*((_BYTE *)self + 1088) & 4) == 0 && !-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI"))
  {
    objc_msgSend(-[PLPhotoTileViewController scrollView](self->_imageTile, "scrollView"), "setUserInteractionEnabled:", *((_BYTE *)self + 1088) & 1);
    objc_msgSend(-[PLPhotoTileViewController scrollView](self->_imageTile, "scrollView"), "setScrollEnabled:", *((_BYTE *)self + 1088) & 1);
  }
}

- (void)cropOverlayWasCancelled:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = -[UIViewController uiipc_imagePickerController](self, "uiipc_imagePickerController", a3);
  if (!v4)
  {
    v6 = (void *)-[PLUIImageViewController navigationController](self, "navigationController");
    goto LABEL_5;
  }
  v5 = v4;
  if (objc_msgSend((id)objc_msgSend(v4, "viewControllers"), "indexOfObjectIdenticalTo:", self))
  {
    v6 = v5;
LABEL_5:
    objc_msgSend(v6, "popViewControllerAnimated:", 1);
    return;
  }
  objc_msgSend(v5, "_imagePickerDidCancel");
}

- (void)_enableCropOverlayIfNecessary
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    -[PLUIImageViewController _enableCropOverlay](self, "_enableCropOverlay");
}

- (void)_enableCropOverlay
{
  -[PLCropOverlay setUserInteractionEnabled:](self->_cropOverlay, "setUserInteractionEnabled:", 1);
}

- (void)cropOverlayWasOKed:(id)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 1088) & 4) != 0 || -[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI", a3))
  {
    if (-[PLUIImageViewController wantsAutoloopUI](self, "wantsAutoloopUI", a3))
      -[PLUIImageViewController handleAutoloopSelected](self, "handleAutoloopSelected");
    else
      -[PLUIImageViewController _handleVideoSelected](self, "_handleVideoSelected");
  }
  else if ((*((_BYTE *)self + 1088) & 1) != 0)
  {
    if ((-[PLUIImageViewController imagePickerSavingOptions](self, "imagePickerSavingOptions") & 1) != 0)
      v4 = 4;
    else
      v4 = 16;
    -[PLCropOverlay beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:](self->_cropOverlay, "beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:", self->_imageTile, 0, self, v4);
  }
  else
  {
    -[PLUIImageViewController handleMediaSelectionUsingTile:managedAsset:args:includeEditing:](self, "handleMediaSelectionUsingTile:managedAsset:args:includeEditing:", self->_imageTile, self->_photo, 0, 0);
    -[PLUIImageViewController _enableCropOverlayIfNecessary](self, "_enableCropOverlayIfNecessary");
  }
}

- (void)_handleVideoSelected
{
  PLManagedAsset *v3;
  NSString *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  PLVideoRemaker *v18;
  id v19;
  id v20;
  uint64_t v21;
  BOOL v22;
  unsigned int v23;
  double v24;
  double v25;
  double v26;
  PLProgressView *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;

  -[PLVideoView pause](self->_videoView, "pause");
  v3 = -[PLVideoView videoCameraImage](self->_videoView, "videoCameraImage");
  if (-[NSURL isFileURL](self->_videoURL, "isFileURL"))
    v4 = -[NSURL path](self->_videoURL, "path");
  else
    v4 = 0;
  -[PLVideoView startTime](self->_videoView, "startTime");
  v6 = v5;
  -[PLVideoView endTime](self->_videoView, "endTime");
  v8 = v7;
  if (-[PLUIImageViewController doNotTranscode](self, "doNotTranscode"))
  {
    if (-[PLVideoView isEditing](self->_videoView, "isEditing"))
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D80]);
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v11 = *MEMORY[0x1E0CEC080];
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v13 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, v11, v12, *MEMORY[0x1E0CEC078], 0);
      if (v3)
      {
LABEL_7:
        v14 = -[PLManagedAsset mainFileURL](v3, "mainFileURL");
        goto LABEL_13;
      }
    }
    else
    {
      v13 = 0;
      if (v3)
        goto LABEL_7;
    }
    if (!v4)
    {
      v16 = 0;
      goto LABEL_14;
    }
    v14 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
LABEL_13:
    v16 = v14;
LABEL_14:
    -[PLUIImageViewController handleVideoSelectionWithURL:args:](self, "handleVideoSelectionWithURL:args:", v16, v13);

    -[PLUIImageViewController _enableCropOverlayIfNecessary](self, "_enableCropOverlayIfNecessary");
    return;
  }

  self->_remaker = 0;
  if (v3)
  {
    self->_remaker = -[PLVideoRemaker initWithManagedAsset:applyVideoAdjustments:]([PLVideoRemaker alloc], "initWithManagedAsset:applyVideoAdjustments:", v3, 1);
    v15 = -[PLManagedAsset isHDVideo](v3, "isHDVideo");
  }
  else
  {
    v17 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v18 = -[PLVideoRemaker initWithAVAsset:]([PLVideoRemaker alloc], "initWithAVAsset:", objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v17));
    self->_remaker = v18;
    -[PLVideoView duration](self->_videoView, "duration");
    -[PLVideoRemaker setDuration:](v18, "setDuration:");
    v15 = 0;
  }
  -[PLVideoRemaker setDelegate:](self->_remaker, "setDelegate:", self);
  -[PLVideoRemaker setTrimStartTime:](self->_remaker, "setTrimStartTime:", v6);
  -[PLVideoRemaker setTrimEndTime:](self->_remaker, "setTrimEndTime:", v8);
  v19 = -[PLUIImageViewController exportPreset](self, "exportPreset");
  v20 = -[PLUIImageViewController videoQuality](self, "videoQuality");
  if (v19)
  {
    -[PLVideoRemaker setExportPresetOverride:](self->_remaker, "setExportPresetOverride:", v19);
    v21 = PLVideoRemakerModeForAVAssetExportPreset(v19);
  }
  else if (v20)
  {
    switch(objc_msgSend(v20, "intValue"))
    {
      case 0u:
      case 4u:
      case 5u:
        v22 = v15 == 0;
        v23 = 5;
        goto LABEL_28;
      case 1u:
        if (v15)
          v21 = 5;
        else
          v21 = 7;
        break;
      case 2u:
        v21 = 8;
        break;
      case 3u:
        v22 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1;
        v23 = 6;
LABEL_28:
        if (v22)
          v21 = v23 + 1;
        else
          v21 = v23;
        break;
      default:
        goto LABEL_21;
    }
  }
  else
  {
LABEL_21:
    v21 = 7;
  }
  -[PLVideoRemaker setMode:](self->_remaker, "setMode:", v21);
  -[PLVideoView hideTrimMessage](self->_videoView, "hideTrimMessage");
  v24 = v8 - v6;
  -[PLVideoView duration](self->_videoView, "duration");
  v26 = v25;
  v27 = -[PLVideoRemaker progressView](self->_remaker, "progressView");
  self->_progressView = v27;
  -[PLProgressView frame](v27, "frame");
  v29 = v28;
  v31 = v30;
  -[PLProgressView setBackgroundType:](v27, "setBackgroundType:", 3);
  v32 = (void *)-[PLUIImageViewController view](self, "view");
  v33 = -[PLCropOverlay bottomBar](self->_cropOverlay, "bottomBar");
  objc_msgSend(v33, "bounds");
  objc_msgSend(v32, "convertRect:fromView:", v33);
  v35 = v34;
  v37 = v36 - v31;
  objc_msgSend(v32, "addSubview:", v27);
  -[PLProgressView setFrame:](v27, "setFrame:", v29, v37, v35, v31);
  if (v24 >= v26)
    -[PLProgressView setLabelText:](v27, "setLabelText:", PLLocalizedFrameworkString());
  -[PLVideoRemaker remake](self->_remaker, "remake");
}

- (void)beginDisplayingProgress
{
  void *v3;
  id v4;
  double v5;
  double v6;
  PLProgressView *v7;

  v3 = (void *)-[PLUIImageViewController view](self, "view");
  v4 = -[PLCropOverlay bottomBar](self->_cropOverlay, "bottomBar");
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "convertRect:fromView:", v4);
  v7 = -[PLProgressView initWithFrame:]([PLProgressView alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], v5 - *(double *)(MEMORY[0x1E0C9D648] + 24), v6, 45.0);
  self->_progressView = v7;
  -[PLProgressView setBackgroundType:](v7, "setBackgroundType:", 3);
  -[PLProgressView setAutoresizingMask:](self->_progressView, "setAutoresizingMask:", 2);
  objc_msgSend(v3, "addSubview:", self->_progressView);
}

- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4
{
  -[PLUIImageViewController handleMediaSelectionUsingTile:managedAsset:args:includeEditing:](self, "handleMediaSelectionUsingTile:managedAsset:args:includeEditing:", self->_imageTile, self->_photo, a4, *((_BYTE *)self + 1088) & 1);
  -[PLUIImageViewController _enableCropOverlayIfNecessary](self, "_enableCropOverlayIfNecessary");
}

- (void)cropOverlayPlay:(id)a3
{
  -[PLVideoView play](self->_videoView, "play", a3);
}

- (void)cropOverlayPause:(id)a3
{
  -[PLVideoView pause](self->_videoView, "pause", a3);
}

- (void)videoView:(id)a3 scrubberWasCreated:(id)a4 slalomRegionEditor:(id)a5
{
  if (self->_videoView == a3)
    -[PLUIImageViewController attachScrubberPalette](self, "attachScrubberPalette");
}

- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4
{
  void *v5;
  double v6;

  v5 = (void *)-[PLUIImageViewController view](self, "view", a3, a4);
  objc_msgSend((id)objc_msgSend(v5, "safeAreaLayoutGuide"), "layoutFrame");
  objc_msgSend(a3, "convertPoint:fromView:", v5, 0.0);
  return v6;
}

- (BOOL)videoViewCanBeginPlayback:(id)a3
{
  return 0;
}

- (id)_trimMessage
{
  return (id)PLLocalizedFrameworkString();
}

- (void)videoViewIsReadyToBeginPlayback:(id)a3
{
  id v5;
  double v6;
  double v7;
  BOOL v8;
  char v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  id v15;
  double v16;

  v5 = -[PLUIImageViewController videoMaximumDuration](self, "videoMaximumDuration");
  objc_msgSend(a3, "duration");
  v7 = v6;
  v8 = -[PLUIImageViewController disableVideoTrimMessage](self, "disableVideoTrimMessage");
  if ((*((_BYTE *)self + 1088) & 1) != 0)
    v9 = 0;
  else
    v9 = !-[PLUIImageViewController viewImageBeforeSelecting](self, "viewImageBeforeSelecting");
  -[PLCropOverlay setUserInteractionEnabled:](self->_cropOverlay, "setUserInteractionEnabled:", 1);
  objc_msgSend(v5, "doubleValue");
  if (v10 > 0.0 && (v9 & 1) == 0)
  {
    objc_msgSend(v5, "doubleValue");
    if (v7 > v11)
    {
      objc_msgSend(v5, "doubleValue");
      objc_msgSend(a3, "setMaximumTrimLength:");
      if ((objc_msgSend(a3, "isEditing") & 1) == 0)
        objc_msgSend(a3, "setEditing:", 1);
      if (!v8)
      {
        v12 = -[PLCropOverlay bottomBar](self->_cropOverlay, "bottomBar");
        objc_msgSend(v12, "bounds");
        objc_msgSend(a3, "convertRect:fromView:", v12);
        v14 = v13;
        v15 = -[PLUIImageViewController _trimMessage](self, "_trimMessage");
        v16 = v14 + -20.0;
        *(float *)&v16 = v14 + -20.0;
        objc_msgSend(a3, "showTrimMessage:withBottomY:", v15, v16);
      }
    }
  }
}

- (void)videoViewDidBeginPlayback:(id)a3
{
  -[PLCropOverlay didPlayVideo](self->_cropOverlay, "didPlayVideo", a3);
}

- (void)videoViewDidPausePlayback:(id)a3 didFinish:(BOOL)a4
{
  -[PLCropOverlay didPauseVideo](self->_cropOverlay, "didPauseVideo", a3, a4);
}

- (void)videoViewDidEndPlayback:(id)a3 didFinish:(BOOL)a4
{
  -[PLCropOverlay didPauseVideo](self->_cropOverlay, "didPauseVideo", a3, a4);
}

- (void)videoRemakerDidBeginRemaking:(id)a3
{
  *((_BYTE *)self + 1088) |= 0x10u;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "beginIgnoringInteractionEvents", a3);
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  uint64_t v6;

  *((_BYTE *)self + 1088) &= ~0x10u;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "endIgnoringInteractionEvents", a3);
  if (a4)
    v6 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a4, 0);
  else
    v6 = 0;
  -[PLUIImageViewController handleVideoSelectionWithURL:args:](self, "handleVideoSelectionWithURL:args:", v6, 0);

  self->_remaker = 0;
  -[PLUIImageViewController _enableCropOverlayIfNecessary](self, "_enableCropOverlayIfNecessary");
}

- (BOOL)photoTileViewControllerIsDisplayingLandscape:(id)a3
{
  return (unint64_t)(objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", a3), "statusBarOrientation")- 3) < 2;
}

- (unsigned)imageFormat
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID");
}

- (void)photoTileViewControllerRequestsFullScreenImage:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  -[PLUIImageViewController photoTileViewControllerCancelImageRequests:](self, "photoTileViewControllerCancelImageRequests:");
  v4 = objc_msgSend(a3, "photo");
  v5 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v5, "setDeliveryMode:", 1);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PLUIImageViewController_photoTileViewControllerRequestsFullScreenImage___block_invoke;
  v7[3] = &unk_1E70B6260;
  v7[4] = a3;
  objc_msgSend(a3, "setInflightFullSizeImageRequestID:", objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 0, v5, v7, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8)));

}

- (void)photoTileViewControllerCancelImageRequests:(id)a3
{
  if (objc_msgSend(a3, "inflightFullSizeImageRequestID"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager"), "cancelImageRequest:", objc_msgSend(a3, "inflightFullSizeImageRequestID"));
    objc_msgSend(a3, "setInflightFullSizeImageRequestID:", 0);
  }
}

- (BOOL)photoTileViewControllerAllowsEditing:(id)a3
{
  return *((_BYTE *)self + 1088) & 1;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (void)handleMediaSelectionUsingTile:(id)a3 managedAsset:(id)a4 args:(id)a5 includeEditing:(BOOL)a6
{
  PLNotifyImagePickerOfMediaAvailability(-[UIViewController uiipc_imagePickerController](self, "uiipc_imagePickerController"), a3, a4, a5, a6);
}

- (void)handleVideoSelectionWithURL:(id)a3 args:(id)a4
{
  id v7;

  v7 = -[UIViewController uiipc_imagePickerController](self, "uiipc_imagePickerController");
  if (v7)
    PLNotifyImagePickerOfVideoAvailability(v7, (uint64_t)a3, self->_photo, (uint64_t)a4);
  else
    -[PLUIImageViewController didChooseVideoAtURL:options:](self, "didChooseVideoAtURL:options:", a3, a4);
}

- (BOOL)doNotTranscode
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC070]), "BOOLValue");
}

- (id)videoQuality
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEB6F0]);
}

- (id)exportPreset
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC088]);
}

- (BOOL)viewImageBeforeSelecting
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC090]), "BOOLValue");
}

- (id)videoMaximumDuration
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEB6E8]);
}

- (BOOL)disableVideoTrimMessage
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC020]), "BOOLValue");
}

- (BOOL)forceNativeScreenScale
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC030]), "BOOLValue");
}

- (BOOL)force1XCroppedImage
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC008]), "BOOLValue");
}

- (id)chooseButtonTitle
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return (id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEC018]);
}

- (id)cancelButtonTitle
{
  return (id)objc_msgSend(-[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions"), "objectForKey:", CFSTR("_UIImagePickerControllerCancelButtonTitle"));
}

- (id)customBackgroundColor
{
  void *v2;

  v2 = (void *)objc_msgSend(-[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions"), "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerCustomBackgroundColor"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (id)maxZoomScaleOverride
{
  void *v2;

  v2 = (void *)objc_msgSend(-[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions"), "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerMaxZoomScaleOverride"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (BOOL)imagePickerAllowsEditing
{
  id v2;

  v2 = -[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions");
  return objc_msgSend((id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CEB690]), "BOOLValue");
}

- (unint64_t)imagePickerSavingOptions
{
  return objc_msgSend(-[UIViewController uiipc_imagePickerController](self, "uiipc_imagePickerController"), "_imagePickerSavingOptions");
}

uint64_t __74__PLUIImageViewController_photoTileViewControllerRequestsFullScreenImage___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setFullSizeImage:", a2);
  return result;
}

uint64_t __42__PLUIImageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

@end
