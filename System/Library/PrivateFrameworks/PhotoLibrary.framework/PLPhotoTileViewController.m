@implementation PLPhotoTileViewController

- (id)_newOriginalImageForPickerFromCachedData
{
  UIImage *v3;

  v3 = -[PLPhotoTileViewController unscaledImage](self, "unscaledImage");
  if (!v3)
    v3 = -[PLPhotoTileViewController image](self, "image");
  return (id)NewUIImageFromCachedImage(v3);
}

- (int64_t)_imageOrientation
{
  if (-[PLPhotoTileViewController imageView](self, "imageView"))
    -[PLPhotoTileViewController imageOrientation](self, "imageOrientation");
  return PLImageOrientationFromDeviceOrientation();
}

- (void)setOverlayInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_overlayInsets.left
    || a3.top != self->_overlayInsets.top
    || a3.right != self->_overlayInsets.right
    || a3.bottom != self->_overlayInsets.bottom)
  {
    self->_overlayInsets = a3;
    -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
    -[PLPhotoTileViewController _centerImageInScrollView](self, "_centerImageInScrollView");
  }
}

- (PLPhotoTileViewController)init
{
  PLPhotoTileViewController *v2;
  PLPhotoTileViewController *v3;
  UIGestureRecognizer *v4;
  UIGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLPhotoTileViewController;
  v2 = -[PLPhotoTileViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowZoomToFill = 1;
    v2->_forceNativeScreenScale = 0;
    v2->_centerContentVertically = 1;
    *((_BYTE *)v2 + 1338) &= ~0x40u;
    v4 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v2, sel__handleSingleTap_);
    -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", v3);
    v5 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel__handleDoubleTap_);
    -[UIGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 2);
    -[UIGestureRecognizer setDelegate:](v5, "setDelegate:", v3);
    v3->_singleTapGestureRecognizer = v4;
    v3->_doubleTapGestureRecognizer = v5;
  }
  return v3;
}

- (PLPhotoTileViewController)initWithModelPhoto:(id)a3 image:(id)a4 frame:(CGRect)a5 isThumbnail:(BOOL)a6 imageOrientation:(int)a7 allowZoomToFill:(BOOL)a8 mode:(int)a9
{
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  PLPhotoTileViewController *v18;
  PLPhotoTileViewController *v19;

  v11 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v18 = -[PLPhotoTileViewController init](self, "init", a3, a4, a6, *(_QWORD *)&a7);
  v19 = v18;
  if (v18)
  {
    v18->_allowZoomToFill = a8;
    *((_BYTE *)v18 + 1337) = *((_BYTE *)v18 + 1337) & 0x7F | ((a9 == 0) << 7);
    v18->_mode = a9;
    -[PLPhotoTileViewController _setPhoto:](v18, "_setPhoto:", a3);
    -[PLPhotoTileViewController setTileFrame:](v19, "setTileFrame:", x, y, width, height);
    -[PLPhotoTileViewController _setImage:isThumbnail:preserveFrame:](v19, "_setImage:isThumbnail:preserveFrame:", a4, v11, 0);
    if (!v19->_videoView && !v19->_scrollView && v19->_image)
    {
      -[PLPhotoTileViewController _configureViews](v19, "_configureViews");
      -[PLExpandableImageView setImage:](v19->_imageView, "setImage:", v19->_image);
    }
  }
  return v19;
}

- (id)initForPageController
{
  id result;

  result = -[PLPhotoTileViewController init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 1337) |= 0x80u;
    *((_DWORD *)result + 310) = 0;
  }
  return result;
}

- (PLPhotoTileViewController)initWithModelPhoto:(id)a3 thumbnailImage:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  PLPhotoTileViewController *result;

  height = a5.height;
  width = a5.width;
  objc_msgSend(a4, "imageOrientation");
  result = -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:](self, "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", a3, a4, 1, PLDeviceOrientationFromImageOrientation(), 1, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), width, height);
  *((_BYTE *)result + 1337) |= 0x80u;
  return result;
}

- (id)cachingImageManager
{
  id result;

  result = self->__cachingImageManager;
  if (!result)
  {
    result = (id)objc_opt_new();
    self->__cachingImageManager = (PHCachingImageManager *)result;
  }
  return result;
}

- (void)_teardownDispatchTimer
{
  NSObject *dispatchTimer;

  dispatchTimer = self->_dispatchTimer;
  if (dispatchTimer)
  {
    dispatch_source_cancel(dispatchTimer);
    dispatch_release((dispatch_object_t)self->_dispatchTimer);
    self->_dispatchTimer = 0;
  }
}

- (void)dealloc
{
  void *v3;
  _QWORD *v4;
  void *v5;
  objc_super v6;

  -[PLPhotoTileViewController cancelFullSizeImageRequest](self, "cancelFullSizeImageRequest");

  -[PLTileContainerView clearBackReference](self->_containerView, "clearBackReference");
  -[UIImageView removeFromSuperview](self->_gradientView, "removeFromSuperview");

  -[PLImageScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[PLImageScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");

  -[UIGestureRecognizer removeTarget:action:](self->_singleTapGestureRecognizer, "removeTarget:action:", self, sel__handleSingleTap_);
  -[UIGestureRecognizer setDelegate:](self->_singleTapGestureRecognizer, "setDelegate:", 0);

  -[UIGestureRecognizer removeTarget:action:](self->_doubleTapGestureRecognizer, "removeTarget:action:", self, sel__handleDoubleTap_);
  -[UIGestureRecognizer setDelegate:](self->_doubleTapGestureRecognizer, "setDelegate:", 0);

  -[PLExpandableImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  -[PLExpandableImageView removeAllGestureRecognizers](self->_imageView, "removeAllGestureRecognizers");

  -[PLVideoView removeFromSuperview](self->_videoView, "removeFromSuperview");
  -[PLVideoView removeAllGestureRecognizers](self->_videoView, "removeAllGestureRecognizers");

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (_QWORD *)MEMORY[0x1E0CEB258];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB358], *MEMORY[0x1E0CEB258]);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB270], *v4);
  -[PLPhotoTileViewController _teardownDispatchTimer](self, "_teardownDispatchTimer");

  v6.receiver = self;
  v6.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)tileIsOnScreen
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v20;
  CGRect v21;

  if (!-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "windows");
  if (!objc_msgSend(v3, "count"))
    return 0;
  v4 = objc_msgSend(v3, "objectAtIndex:", 0);
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = (void *)-[PLPhotoTileViewController view](self, "view");
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", v5);
  v21.origin.x = v15;
  v21.origin.y = v16;
  v21.size.width = v17;
  v21.size.height = v18;
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  return CGRectIntersectsRect(v20, v21);
}

- (void)_setPhoto:(id)a3
{
  PHAsset *modelPhoto;

  modelPhoto = self->_modelPhoto;
  if (modelPhoto != a3)
  {

    self->_modelPhoto = (PHAsset *)a3;
    -[PLPhotoTileViewController _updateVideoViewForModelPhoto](self, "_updateVideoViewForModelPhoto");
    if (self->_modelPhoto)
    {
      -[PLPhotoTileViewController _configureViews](self, "_configureViews");
      if (self->_image)
        -[PLExpandableImageView setImage:isFullscreen:](self->_imageView, "setImage:isFullscreen:");
    }
    if (!self->_image)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PLPhotoTileViewController _setImage:isThumbnail:preserveFrame:](self, "_setImage:isThumbnail:preserveFrame:", self->_image, *((_BYTE *)self + 1337) & 1, 0);
    }
  }
}

- (void)_updateVideoViewForModelPhoto
{
  int v3;
  PHAsset *modelPhoto;
  double v5;
  double x;
  double v7;
  double y;
  double v9;
  double width;
  double v11;
  double height;
  char v13;
  int v14;
  PLVideoView *videoView;
  PLVideoView *v16;

  v3 = -[PHAsset isVideo](self->_modelPhoto, "isVideo");
  modelPhoto = self->_modelPhoto;
  if (v3)
  {
    -[PHAsset isStreamedVideo](modelPhoto, "isStreamedVideo");
    goto LABEL_3;
  }
  v13 = -[PHAsset isAudio](modelPhoto, "isAudio");
  v14 = -[PHAsset isStreamedVideo](self->_modelPhoto, "isStreamedVideo");
  if ((v13 & 1) != 0 || v14)
  {
LABEL_3:
    if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
      x = v5;
      y = v7;
      width = v9;
      height = v11;
    }
    else
    {
      x = self->_tileFrame.origin.x;
      y = self->_tileFrame.origin.y;
      width = self->_tileFrame.size.width;
      height = self->_tileFrame.size.height;
    }
    -[PLVideoView setImageTile:](self->_videoView, "setImageTile:", 0);
    -[PLVideoView removeFromSuperview](self->_videoView, "removeFromSuperview");

    v16 = -[PLVideoView initWithFrame:videoCameraImage:orientation:]([PLVideoView alloc], "initWithFrame:videoCameraImage:orientation:", -[PHAsset pl_managedAsset](self->_modelPhoto, "pl_managedAsset"), 1, x, y, width, height);
    self->_videoView = v16;
    -[PLVideoView setAllowSlalomEditor:](v16, "setAllowSlalomEditor:", 1);
    -[PLVideoView setImageTile:](self->_videoView, "setImageTile:", self);
    if (self->_image)
      -[PLVideoView setPosterFrameImage:](self->_videoView, "setPosterFrameImage:");
    -[PLVideoView setScrubberIsSubview:](self->_videoView, "setScrubberIsSubview:", 0);
    if ((*((_BYTE *)self + 1338) & 4) != 0)
      -[PLVideoView viewWillAppear:](self->_videoView, "viewWillAppear:", 1);
    return;
  }
  videoView = self->_videoView;
  if (videoView)
  {
    objc_msgSend(-[PLVideoView videoOverlayPlayButton](videoView, "videoOverlayPlayButton"), "removeFromSuperview");
    -[PLVideoView removeFromSuperview](self->_videoView, "removeFromSuperview");

    self->_videoView = 0;
  }
}

- (PHAsset)photo
{
  return self->_modelPhoto;
}

- (UIImage)thumbnailImage
{
  if ((*((_BYTE *)self + 1337) & 1) != 0)
    return self->_image;
  else
    return 0;
}

- (void)setThumbnailImage:(id)a3
{
  -[PLPhotoTileViewController _setImage:isThumbnail:preserveFrame:](self, "_setImage:isThumbnail:preserveFrame:", a3, 1, 0);
}

- (CGRect)tileFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_tileFrame.origin.x;
  y = self->_tileFrame.origin.y;
  width = self->_tileFrame.size.width;
  height = self->_tileFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTileFrame:(CGRect)a3
{
  self->_tileFrame = a3;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileViewController;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ photo:%@"), -[PLPhotoTileViewController description](&v3, sel_description), self->_modelPhoto);
}

- (void)setZoomScale:(float)a3
{
  *((_BYTE *)self + 1337) |= 0x40u;
  -[PLImageScrollView setZoomScale:](self->_scrollView, "setZoomScale:", a3);
  -[PLPhotoTileViewController _updatePlaceholderImageRect](self, "_updatePlaceholderImageRect");
  *((_BYTE *)self + 1337) &= ~0x40u;
}

- (void)setCropOverlayRect:(CGRect)a3 forCropRect:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGRect *p_cropOverlayRect;
  CGSize v10;
  float v11;
  double v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_cropOverlayRect = &self->_cropOverlayRect;
  self->_cropOverlayRect = a3;
  if (CGRectIsEmpty(a4))
  {
    *((_BYTE *)self + 1338) &= ~0x10u;
    v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_cropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_cropRect.size = v10;
    v11 = 1.0;
  }
  else
  {
    *((_BYTE *)self + 1338) |= 0x10u;
    self->_cropRect.origin.x = x;
    self->_cropRect.origin.y = y;
    self->_cropRect.size.width = width;
    self->_cropRect.size.height = height;
    v12 = p_cropOverlayRect->size.height / height;
    if (v12 >= p_cropOverlayRect->size.width / width)
      v12 = p_cropOverlayRect->size.width / width;
    v11 = v12;
  }
  self->_cropRectZoomScale = v11;
  -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
}

- (void)setZoomingGesturesEnabled:(BOOL)a3
{
  char v3;
  char v5;
  void *scrollView;
  _BOOL4 v7;

  v3 = *((_BYTE *)self + 1337);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 16;
    else
      v5 = 0;
    *((_BYTE *)self + 1337) = v3 & 0xEF | v5;
    scrollView = self->_scrollView;
    if (!scrollView)
      scrollView = self->_videoView;
    if (scrollView)
      v7 = a3;
    else
      v7 = 0;
    if (v7)
    {
      -[UIGestureRecognizer requireGestureRecognizerToFail:](self->_singleTapGestureRecognizer, "requireGestureRecognizerToFail:", self->_doubleTapGestureRecognizer);
      objc_msgSend(scrollView, "addGestureRecognizer:", self->_doubleTapGestureRecognizer);
    }
    else
    {
      if (!scrollView)
        return;
      -[UIGestureRecognizer removeFailureRequirement:](self->_singleTapGestureRecognizer, "removeFailureRequirement:", self->_doubleTapGestureRecognizer);
      objc_msgSend(scrollView, "removeGestureRecognizer:", self->_doubleTapGestureRecognizer);
    }
    -[PLImageScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", !v7);
    -[PLVideoView setClipsToBounds:](self->_videoView, "setClipsToBounds:", !v7);
  }
}

- (void)forceZoomingGesturesEnabled
{
  if ((*((_BYTE *)self + 1337) & 0x10) != 0)
    -[PLPhotoTileViewController setZoomingGesturesEnabled:](self, "setZoomingGesturesEnabled:", 0);
  -[PLPhotoTileViewController setZoomingGesturesEnabled:](self, "setZoomingGesturesEnabled:", 1);
}

- (id)expandableImageView
{
  return self->_imageView;
}

- (id)imageView
{
  return self->_imageView;
}

- (id)image
{
  UIImageView *imageView;

  if (-[PHAsset isVideo](self->_modelPhoto, "isVideo"))
    imageView = -[PLVideoView previewImageView](self->_videoView, "previewImageView");
  else
    imageView = (UIImageView *)self->_imageView;
  return -[UIImageView image](imageView, "image");
}

- (id)_newCGImageBackedUIImageFromImage:(id)a3
{
  id result;
  CGImage *v4;
  void *v5;

  if (objc_msgSend(a3, "CGImage"))
    return a3;
  result = (id)PLCreateCGImageFromIOSurfaceBackedUIImage();
  if (result)
  {
    v4 = (CGImage *)result;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:imageOrientation:", result, objc_msgSend(a3, "imageOrientation"));
    CGImageRelease(v4);
    return v5;
  }
  return result;
}

- (id)scrollView
{
  return self->_scrollView;
}

- (id)videoView
{
  return self->_videoView;
}

- (void)setVideoView:(id)a3
{
  PLVideoView *videoView;
  PLVideoView *v6;

  videoView = self->_videoView;
  if (videoView != a3)
  {
    -[PLVideoView viewDidDisappear](videoView, "viewDidDisappear");
    -[PLVideoView setImageTile:](self->_videoView, "setImageTile:", 0);
    -[PLVideoView removeFromSuperview](self->_videoView, "removeFromSuperview");

    v6 = (PLVideoView *)a3;
    self->_videoView = v6;
    -[PLVideoView setImageTile:](v6, "setImageTile:", self);
    if (self->_videoView)
    {
      if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
        -[PLPhotoTileViewController _configureViews](self, "_configureViews");
    }
  }
}

- (void)updateCenterOverlay
{
  uint64_t v3;
  int v4;
  PLVideoView *videoView;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[PLPhotoTileViewControllerDelegate photoTileViewControllerCustomCenterOverlay:](self->_tileDelegate, "photoTileViewControllerCustomCenterOverlay:", self);
  else
    v3 = 0;
  -[PLPhotoTileViewController _setCustomCenterOverlay:](self, "_setCustomCenterOverlay:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = -[PLPhotoTileViewControllerDelegate photoTileViewControllerCanShowCenterOverlay:](self->_tileDelegate, "photoTileViewControllerCanShowCenterOverlay:", self);
  else
    v4 = 1;
  videoView = self->_videoView;
  if (videoView)
    -[PLVideoView setShowsPlayOverlay:](self->_videoView, "setShowsPlayOverlay:", ((-[PLPhotoTileViewController _customCenterOverlay](self, "_customCenterOverlay") == 0) & ~-[PLVideoView isPlaying](videoView, "isPlaying")) & v4);
  -[UIView setHidden:](-[PLPhotoTileViewController _customCenterOverlay](self, "_customCenterOverlay"), "setHidden:", v4 ^ 1u);
}

- (void)_setCustomCenterOverlay:(id)a3
{
  UIView *customCenterOverlay;

  customCenterOverlay = self->__customCenterOverlay;
  if (customCenterOverlay != a3)
  {
    -[UIView removeFromSuperview](customCenterOverlay, "removeFromSuperview");

    self->_customCenterOverlayConstraints = 0;
    self->__customCenterOverlay = (UIView *)a3;
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addSubview:", self->__customCenterOverlay);
    -[PLPhotoTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "setNeedsUpdateConstraints");
  }
}

- (void)hideContentView
{
  -[PLVideoView setHidden:](self->_videoView, "setHidden:", 1);
  objc_msgSend(-[PLVideoView videoOverlayPlayButton](self->_videoView, "videoOverlayPlayButton"), "setHidden:", 1);
  -[PLImageScrollView setHidden:](self->_scrollView, "setHidden:", 1);
}

- (void)showContentView
{
  -[PLVideoView setHidden:](self->_videoView, "setHidden:", 0);
  objc_msgSend(-[PLVideoView videoOverlayPlayButton](self->_videoView, "videoOverlayPlayButton"), "setHidden:", 0);
  -[PLImageScrollView setHidden:](self->_scrollView, "setHidden:", 0);
}

- (id)tileDelegate
{
  return self->_tileDelegate;
}

- (void)setTileDelegate:(id)a3
{
  if (self->_tileDelegate != a3)
  {
    self->_tileDelegate = (PLPhotoTileViewControllerDelegate *)a3;
    self->_isLoadingFullSizeImage = 0;
    -[PLPhotoTileViewController ensureFullSizeImageLoaded](self, "ensureFullSizeImageLoaded");
  }
}

- (BOOL)isTVOut
{
  return (*((unsigned __int8 *)self + 1337) >> 1) & 1;
}

- (void)setTVOut:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 1337) = *((_BYTE *)self + 1337) & 0xFD | v3;
}

- (BOOL)userDidAdjustWallpaper
{
  return self->_userDidAdjustWallpaper;
}

- (BOOL)_clientIsWallpaper
{
  return self->_mode == 2 || self->_clientIsTemporarilyWallpaper;
}

- (void)setClientIsWallpaper:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  UIImageView *gradientView;

  self->_clientIsTemporarilyWallpaper = a3;
  self->_userDidAdjustWallpaper = 0;
  if (a3)
  {
    *((_BYTE *)self + 1337) |= 0x40u;
    -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
    v5 = v4;
    -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
    *(float *)&v6 = v5 / v6;
    if (*(float *)&v6 > 1.0)
      self->_userDidAdjustWallpaper = 1;
  }
  else
  {
    gradientView = self->_gradientView;
    if (gradientView)
      -[UIImageView removeFromSuperview](gradientView, "removeFromSuperview");
  }
  -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
}

- (BOOL)allowsEditing
{
  PLPhotoTileViewControllerDelegate *tileDelegate;

  tileDelegate = self->_tileDelegate;
  if (tileDelegate)
    LOBYTE(tileDelegate) = -[PLPhotoTileViewControllerDelegate photoTileViewControllerAllowsEditing:](tileDelegate, "photoTileViewControllerAllowsEditing:", self);
  return (char)tileDelegate;
}

- (BOOL)gesturesEnabled
{
  return -[PLImageScrollView isUserInteractionEnabled](self->_scrollView, "isUserInteractionEnabled");
}

- (void)setGesturesEnabled:(BOOL)a3
{
  -[PLImageScrollView setUserInteractionEnabled:](self->_scrollView, "setUserInteractionEnabled:", a3);
}

- (BOOL)photoShouldHaveHDRBadge
{
  if (-[PHAsset mediaType](self->_modelPhoto, "mediaType") == PHAssetMediaTypeImage)
    return -[PHAsset isMediaSubtype:](self->_modelPhoto, "isMediaSubtype:", 2);
  else
    return 0;
}

- (BOOL)photoShouldHaveAvalancheBadge
{
  _BOOL4 v3;

  v3 = -[PHAsset representsBurst](self->_modelPhoto, "representsBurst");
  if (v3)
    LOBYTE(v3) = !self->_reviewing && (*((_BYTE *)self + 1338) & 0x20) == 0;
  return v3;
}

- (void)setAvalancheBadgesHidden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 1338) = *((_BYTE *)self + 1338) & 0xDF | v3;
  -[PLPhotoTileViewController _showBadgeViewIfAppropriate](self, "_showBadgeViewIfAppropriate");
}

- (void)setBadgeVisible:(BOOL)a3
{
  -[PLPhotoTileViewController setBadgeVisible:animated:](self, "setBadgeVisible:animated:", a3, 0);
}

- (void)setBadgeVisible:(BOOL)a3 animated:(BOOL)a4
{
  char v4;
  char v5;
  _QWORD v6[5];

  v4 = *((_BYTE *)self + 1338);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 64;
    else
      v5 = 0;
    *((_BYTE *)self + 1338) = v4 & 0xBF | v5;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__PLPhotoTileViewController_setBadgeVisible_animated___block_invoke;
    v6[3] = &unk_1E70B6370;
    v6[4] = self;
    if (a4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.300000012);
    else
      -[PLPhotoTileViewController _showBadgeViewIfAppropriate](self, "_showBadgeViewIfAppropriate");
  }
}

- (void)_configureViews
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  PLVideoView *videoView;
  uint64_t v10;
  PLVideoView *v11;
  PLImageScrollView *v12;
  PLExpandableImageView *v13;
  PLImageScrollView *scrollView;
  PLImageScrollView *v15;
  double v16;
  double v17;
  uint64_t v18;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = self->_tileFrame.size.width;
    v8 = self->_tileFrame.size.height;
  }
  if (*((char *)self + 1337) < 0 || !self->_videoView)
  {
    if ((-[PHAsset isVideo](self->_modelPhoto, "isVideo") & 1) != 0
      || (-[PHAsset isStreamedVideo](self->_modelPhoto, "isStreamedVideo") & 1) != 0
      || (-[PHAsset isAudio](self->_modelPhoto, "isAudio") & 1) != 0)
    {
      -[PLImageScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");

      self->_scrollView = 0;
      videoView = self->_videoView;
      if (videoView)
      {
        v10 = -[PLVideoView superview](videoView, "superview");
        if (v10 != -[PLPhotoTileViewController view](self, "view"))
          -[PLPhotoTileViewController _installSubview:](self, "_installSubview:", self->_videoView);
        v11 = self->_videoView;
        objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "frame");
        -[PLVideoView setFrame:](v11, "setFrame:");
      }
      v12 = (PLImageScrollView *)-[PLPhotoTileViewController view](self, "view");
    }
    else
    {
      if (!self->_imageView)
      {
        v13 = -[PLExpandableImageView initWithFrame:frameStyle:withBorder:]([PLExpandableImageView alloc], "initWithFrame:frameStyle:withBorder:", 1, 0, 0.0, 0.0, width, height);
        self->_imageView = v13;
        -[PLExpandableImageView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
      }
      if (self->_videoView)
        -[PLExpandableImageView setVideoView:](self->_imageView, "setVideoView:");
      scrollView = self->_scrollView;
      if (!scrollView)
      {
        v15 = -[PLImageScrollView initWithFrame:]([PLImageScrollView alloc], "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v8);
        self->_scrollView = v15;
        if ((*((char *)self + 1337) & 0x80000000) == 0)
        {
          -[PLExpandableImageView frame](self->_imageView, "frame");
          -[PLImageScrollView setContentSize:](v15, "setContentSize:", v16, v17);
          -[PLImageScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
          -[PLImageScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1);
          v15 = self->_scrollView;
        }
        -[PLImageScrollView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
        -[PLImageScrollView setPreservesCenterDuringRotation:](self->_scrollView, "setPreservesCenterDuringRotation:", 1);
        -[PLImageScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
        -[PLImageScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
        -[PLImageScrollView addSubview:](self->_scrollView, "addSubview:", self->_imageView);
        -[PLImageScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
        -[PLImageScrollView setBouncesZoom:](self->_scrollView, "setBouncesZoom:", 1);
        -[PLImageScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
        -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
        scrollView = self->_scrollView;
      }
      v18 = -[PLImageScrollView superview](scrollView, "superview");
      if (v18 != -[PLPhotoTileViewController view](self, "view"))
        -[PLPhotoTileViewController _installSubview:](self, "_installSubview:", self->_scrollView);
      v12 = self->_scrollView;
    }
    -[PLImageScrollView addGestureRecognizer:](v12, "addGestureRecognizer:", self->_singleTapGestureRecognizer);
  }
  else if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PLPhotoTileViewController _installSubview:](self, "_installSubview:", self->_videoView);
  }
  -[PLPhotoTileViewController _updatePlaceholderViewAnimated:](self, "_updatePlaceholderViewAnimated:", 0);
}

- (void)_installSubview:(id)a3
{
  objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addSubview:", a3);
  -[PLPhotoTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
}

- (void)_updateSubviewOrdering
{
  void *v3;

  v3 = (void *)-[PLPhotoTileViewController view](self, "view");
  objc_msgSend(v3, "sendSubviewToBack:", self->_scrollView);
  objc_msgSend(v3, "sendSubviewToBack:", self->_videoView);
  objc_msgSend(v3, "bringSubviewToFront:", -[PLVideoView videoOverlayPlayButton](self->_videoView, "videoOverlayPlayButton"));
  objc_msgSend(v3, "bringSubviewToFront:", -[PLPhotoTileViewController _customCenterOverlay](self, "_customCenterOverlay"));
  objc_msgSend(v3, "bringSubviewToFront:", self->_reviewCheckmarkImageView);
  objc_msgSend(v3, "bringSubviewToFront:", self->_placeholderView);
}

- (void)updateCloudDownloadProgress:(double)a3
{
  -[PLTilePlaceholderView updateCloudDownloadProgress:](self->_placeholderView, "updateCloudDownloadProgress:", a3);
}

- (void)_updatePlaceholderViewAnimated:(BOOL)a3
{
  int v4;
  PLTilePlaceholderView *placeholderView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PLPhotoTileCloudPlaceholderView *v14;
  PLPhotoTilePlaceholderView *v15;

  v4 = objc_msgSend((id)objc_opt_class(), "shouldShowPlaceholderForAsset:", self->_modelPhoto);
  placeholderView = self->_placeholderView;
  if (v4)
  {
    if (!placeholderView)
    {
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      if (-[PHAsset isCloudPlaceholder](self->_modelPhoto, "isCloudPlaceholder"))
      {
        if (!self->_currentTileDownloadFinished)
        {
          v14 = -[PLPhotoTileCloudPlaceholderView initWithFrame:]([PLPhotoTileCloudPlaceholderView alloc], "initWithFrame:", v7, v9, v11, v13);
          self->_placeholderView = (PLTilePlaceholderView *)v14;
          -[PLPhotoTileCloudPlaceholderView setAutoresizingMask:](v14, "setAutoresizingMask:", 18);
          -[PLTilePlaceholderView setRetryDelegate:](self->_placeholderView, "setRetryDelegate:", self);
        }
      }
      else
      {
        v15 = -[PLPhotoTilePlaceholderView initWithFrame:]([PLPhotoTilePlaceholderView alloc], "initWithFrame:", v7, v9, v11, v13);
        self->_placeholderView = (PLTilePlaceholderView *)v15;
        -[PLPhotoTilePlaceholderView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
      }
      -[PLPhotoTileViewController _installSubview:](self, "_installSubview:", self->_placeholderView);
    }
  }
  else if (placeholderView)
  {
    -[PLPhotoTileViewController _removePlaceholderView](self, "_removePlaceholderView");
  }
}

- (void)retryDownload
{
  *((_BYTE *)self + 1338) &= ~8u;
  -[PLPhotoTileViewController cancelFullSizeImageRequest](self, "cancelFullSizeImageRequest");
  -[PLPhotoTileViewController _requestFullSizeImage](self, "_requestFullSizeImage");
}

- (void)_centerImageInScrollView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  _BOOL4 zoomToFillInsteadOfToFit;
  double Width;
  double Height;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 centerContentVertically;
  double *v30;
  double v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  float v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3 * self->_imageSize.width;
  v5 = v3 * self->_imageSize.height;
  -[PLImageScrollView contentSize](self->_scrollView, "contentSize");
  v7 = v6;
  v48 = v8;
  -[PLImageScrollView bounds](self->_scrollView, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PLImageScrollView contentInset](self->_scrollView, "contentInset");
  v45 = v17;
  v46 = v18;
  zoomToFillInsteadOfToFit = self->_zoomToFillInsteadOfToFit;
  v51.origin.x = v10;
  v51.origin.y = v12;
  v51.size.width = v14;
  v51.size.height = v16;
  Width = CGRectGetWidth(v51);
  v52.origin.x = v10;
  v52.origin.y = v12;
  v52.size.width = v14;
  v52.size.height = v16;
  Height = CGRectGetHeight(v52);
  v49 = v5;
  v50 = v4;
  if (zoomToFillInsteadOfToFit)
  {
    v22 = v5 < Height;
    if (v4 < Width)
      goto LABEL_3;
LABEL_10:
    v55.origin.x = v10;
    v55.origin.y = v12;
    v55.size.width = v14;
    v55.size.height = v16;
    v27 = CGRectGetWidth(v55);
    if (v7 < v27)
      v27 = v7;
    v47 = v27;
    v24 = v48;
    if (!v22)
      goto LABEL_6;
LABEL_13:
    v56.origin.x = v10;
    v56.origin.y = v12;
    v56.size.width = v14;
    v56.size.height = v16;
    v28 = CGRectGetHeight(v56);
    if (v24 >= v28)
      v26 = v24;
    else
      v26 = v28;
    goto LABEL_16;
  }
  v22 = v5 > Height;
  if (v4 <= Width)
    goto LABEL_10;
LABEL_3:
  v53.origin.x = v10;
  v53.origin.y = v12;
  v53.size.width = v14;
  v53.size.height = v16;
  v23 = CGRectGetWidth(v53);
  if (v7 >= v23)
    v23 = v7;
  v47 = v23;
  v24 = v48;
  if (v22)
    goto LABEL_13;
LABEL_6:
  v54.origin.x = v10;
  v54.origin.y = v12;
  v54.size.width = v14;
  v54.size.height = v16;
  v25 = CGRectGetHeight(v54);
  if (v24 >= v25)
    v26 = v25;
  else
    v26 = v24;
LABEL_16:
  centerContentVertically = self->_centerContentVertically;
  v30 = (double *)MEMORY[0x1E0C9D538];
  v57.origin.x = v10;
  v57.origin.y = v12;
  v57.size.width = v14;
  v57.size.height = v16;
  if (CGRectGetWidth(v57) <= v7)
  {
    v34 = *v30;
  }
  else
  {
    v31 = rint(v46);
    v32 = -[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper", *(_QWORD *)&v45);
    v33 = rint(v31 * 0.5);
    if (v32)
      v34 = v33;
    else
      v34 = v31;
  }
  v35 = v30[1];
  v58.origin.x = v10;
  v58.origin.y = v12;
  v58.size.width = v14;
  v58.size.height = v16;
  v36 = CGRectGetHeight(v58) - v24;
  if (v36 <= 0.0)
  {
    v37 = v49;
    v38 = v47;
  }
  else
  {
    v37 = v49;
    v38 = v47;
    if (self->_centerContentVertically)
    {
      v39 = -[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper");
      v40 = v36 * 0.5;
      v41 = rint(v45);
      v42 = rintf(v40);
      if (v41 <= v42)
        v42 = v41;
      v43 = rint(v36 * 0.5);
      if (v39)
        v35 = v43;
      else
        v35 = v42;
    }
  }
  v44 = rint((v37 - v26) * 0.5);
  if (!centerContentVertically)
    v44 = 0.0;
  -[PLImageScrollView setContentOffset:](self->_scrollView, "setContentOffset:", rint((v50 - v38) * 0.5) - v34, v44 - v35);
}

- (void)_adjustScrollViewContentOffsetForInsets
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
  BOOL v15;
  double v16;
  char v17;
  double v18;
  double v19;
  double v20;
  char v21;
  double v22;
  double v23;

  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  v5 = v3 * self->_imageSize.height;
  -[PLImageScrollView frame](self->_scrollView, "frame");
  v7 = v6;
  v8 = v4 * self->_imageSize.width;
  -[PLImageScrollView frame](self->_scrollView, "frame");
  v10 = v9;
  -[PLImageScrollView contentOffset](self->_scrollView, "contentOffset");
  v12 = v11;
  v14 = v13;
  v15 = v7 <= v5;
  v16 = v13;
  if (!v15)
  {
    v17 = *((_BYTE *)self + 1338);
    -[PLImageScrollView contentInset](self->_scrollView, "contentInset");
    v19 = rint(v18 * 0.5);
    if ((v17 & 1) != 0)
      v16 = v14 - v19;
    else
      v16 = v14 + v19;
  }
  v20 = v12;
  if (v10 > v8)
  {
    v21 = *((_BYTE *)self + 1338);
    -[PLImageScrollView contentInset](self->_scrollView, "contentInset", v12);
    v23 = rint(v22 * 0.5);
    if ((v21 & 1) != 0)
      v20 = v12 - v23;
    else
      v20 = v12 + v23;
  }
  if (v12 != v20 || v14 != v16)
    -[PLImageScrollView setContentOffset:](self->_scrollView, "setContentOffset:");
}

- (void)_updateContentInset
{
  PLImageScrollView **p_scrollView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxY;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat rect;
  double MaxX;
  double v42;
  double v43;
  CGFloat x;
  CGFloat v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
  {
    p_scrollView = &self->_scrollView;
    -[PLImageScrollView bounds](self->_scrollView, "bounds");
    v5 = v4;
    v7 = v6;
    -[PLImageScrollView contentSize](self->_scrollView, "contentSize");
    v9 = v8;
    v11 = v7 - v10;
    v12 = v7 <= v10;
    v13 = 0.0;
    if (v12)
      v11 = 0.0;
    if (v11 < 110.0)
      v11 = 110.0;
    if (v5 > v9)
      v13 = v5 - v9;
    v14 = v11;
    v15 = v13;
    goto LABEL_17;
  }
  if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    p_scrollView = &self->_scrollView;
    if (self->_scrollView)
    {
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
      v45 = v17;
      v46 = v16;
      v19 = v18;
      v21 = v20;
      if (CGRectIsEmpty(self->_cropOverlayRect))
      {
        -[PLImageScrollView safeAreaInsets](*p_scrollView, "safeAreaInsets");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
      }
      else
      {
        objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "convertRect:fromView:", objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "superview"), self->_cropOverlayRect.origin.x, self->_cropOverlayRect.origin.y, self->_cropOverlayRect.size.width, self->_cropOverlayRect.size.height);
        x = v47.origin.x;
        y = v47.origin.y;
        width = v47.size.width;
        height = v47.size.height;
        MinX = CGRectGetMinX(v47);
        v48.origin.x = v46;
        v48.origin.y = v45;
        v48.size.width = v19;
        v48.size.height = v21;
        v43 = MinX - CGRectGetMinX(v48);
        v49.origin.x = v46;
        v49.origin.y = v45;
        v49.size.width = v19;
        v49.size.height = v21;
        rect = width;
        MaxX = CGRectGetMaxX(v49);
        v50.origin.x = x;
        v50.origin.y = y;
        v50.size.width = width;
        v50.size.height = height;
        v42 = MaxX - CGRectGetMaxX(v50);
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        MinY = CGRectGetMinY(v51);
        v52.origin.x = v46;
        v52.origin.y = v45;
        v52.size.width = v19;
        v52.size.height = v21;
        v23 = MinY - CGRectGetMinY(v52);
        v53.origin.x = v46;
        v53.origin.y = v45;
        v53.size.width = v19;
        v53.size.height = v21;
        MaxY = CGRectGetMaxY(v53);
        v25 = v43;
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        v27 = MaxY - CGRectGetMaxY(v54);
        v29 = v42;
      }
      -[PLPhotoTileViewController overlayInsets](self, "overlayInsets", *(_QWORD *)&rect);
      v11 = v23 + v36;
      v13 = v25 + v37;
      v14 = v27 + v38;
      v15 = v29 + v39;
LABEL_17:
      -[PLImageScrollView setContentInset:](*p_scrollView, "setContentInset:", v11, v13, v14, v15);
    }
  }
}

- (void)_updatePlaceholderImageRect
{
  PLTilePlaceholderView *placeholderView;

  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    -[PLExpandableImageView frame](self->_imageView, "frame");
    -[PLTilePlaceholderView convertRect:fromView:](placeholderView, "convertRect:fromView:", self->_scrollView);
    -[PLTilePlaceholderView setImageRect:](placeholderView, "setImageRect:");
  }
}

- (void)_updatePlaceholderVisibility
{
  uint64_t v3;

  if (-[PLPhotoTileViewController shouldHideProgressIndicator](self, "shouldHideProgressIndicator")
    || (*((_BYTE *)self + 1337) & 4) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = -[PLImageScrollView isDragging](self->_scrollView, "isDragging");
  }
  -[PLTilePlaceholderView setHidden:](self->_placeholderView, "setHidden:", v3);
}

- (void)setShouldHideProgressIndicator:(BOOL)a3
{
  if (self->_shouldHideProgressIndicator != a3)
  {
    self->_shouldHideProgressIndicator = a3;
    -[PLPhotoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  }
}

- (void)_updateModelPhotoWithImage:(id)a3
{
  if (-[PLPhotoTileViewController photoShouldHaveHDRBadge](self, "photoShouldHaveHDRBadge", a3))
    -[PLPhotoTileViewController _setupBadgeView](self, "_setupBadgeView");
  if (-[PLPhotoTileViewController photoShouldHaveAvalancheBadge](self, "photoShouldHaveAvalancheBadge"))
    -[PLPhotoTileViewController _setupBadgeView](self, "_setupBadgeView");
  if (self->_reviewing)
    -[PLPhotoTileViewController _updateReviewCheckmark](self, "_updateReviewCheckmark");
}

- (void)_setImage:(id)a3 isThumbnail:(BOOL)a4 preserveFrame:(BOOL)a5
{
  _BOOL4 v5;
  PLExpandableImageView *imageView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIImage *image;
  UIImage *v16;
  CGFloat v17;
  CGFloat v18;
  CGSize *p_imageSize;
  UIImage *v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  PLExpandableImageView *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double height;
  double width;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  v5 = a5;
  if (!a4)
    self->_isLoadingFullSizeImage = 0;
  imageView = self->_imageView;
  -[PLExpandableImageView frame](imageView, "frame");
  v44 = v11;
  v45 = v10;
  v13 = v12;
  v46 = v14;
  image = self->_image;
  v16 = (UIImage *)a3;
  if (image != a3)
  {

    v16 = (UIImage *)a3;
    self->_image = v16;
  }
  if (v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a4)
    {
      p_imageSize = &self->_imageSize;
      v20 = self->_image;
      if (v20)
      {
        -[UIImage size](v20, "size");
        p_imageSize->width = v21;
        self->_imageSize.height = v22;
      }
      else
      {
        *p_imageSize = *(CGSize *)MEMORY[0x1E0C9D820];
      }
    }
  }
  else
  {
    v17 = (double)-[PHAsset pixelWidth](self->_modelPhoto, "pixelWidth");
    v18 = (double)-[PHAsset pixelHeight](self->_modelPhoto, "pixelHeight");
    self->_imageSize.width = v17;
    self->_imageSize.height = v18;
  }
  -[PLPhotoTileViewController _updateModelPhotoWithImage:](self, "_updateModelPhotoWithImage:", a3);
  -[PLPhotoTileViewController _configureViews](self, "_configureViews");
  -[PLPhotoTileViewController _showBadgeViewIfAppropriate](self, "_showBadgeViewIfAppropriate");
  -[PLImageScrollView contentOffset](self->_scrollView, "contentOffset");
  v24 = v23;
  v26 = v25;
  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  v28 = v27;
  v29 = self->_imageView;
  if (v29)
  {
    -[PLExpandableImageView bounds](v29, "bounds");
    v31 = v30;
    v33 = v32;
    v29 = self->_imageView;
  }
  else
  {
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v34 = v28;
  width = self->_imageSize.width;
  height = self->_imageSize.height;
  -[PLExpandableImageView setBounds:](v29, "setBounds:", 0.0, 0.0, width, height);
  *((_BYTE *)self + 1337) = *((_BYTE *)self + 1337) & 0xFE | a4;
  if (a4)
  {
    v37 = 1;
  }
  else
  {
    -[UIImage imageOrientation](self->_image, "imageOrientation");
    v37 = PLDeviceOrientationFromImageOrientation();
  }
  v38 = v31 * v34;
  self->_imageOrientation = v37;
  -[PLVideoView setPosterFrameImage:](self->_videoView, "setPosterFrameImage:", a3);
  -[PLExpandableImageView setImage:isFullscreen:](self->_imageView, "setImage:isFullscreen:", a3, (*((_BYTE *)self + 1337) & 1) == 0);
  -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
  if ((*((_BYTE *)self + 1337) & 0x20) != 0)
  {
    v39 = v38 / width;
    *(float *)&v39 = v38 / width;
    -[PLPhotoTileViewController setZoomScale:](self, "setZoomScale:", v39);
    if (!imageView)
      goto LABEL_26;
  }
  else
  {
    if (self->_image)
      -[PLPhotoTileViewController _setDefaultZoomScale](self, "_setDefaultZoomScale");
    if (!imageView)
    {
LABEL_26:
      if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper") || self->_mode == 1)
        -[PLPhotoTileViewController _centerImageInScrollView](self, "_centerImageInScrollView");
      if (v5)
        goto LABEL_30;
      return;
    }
  }
  if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper")
    || (*((char *)self + 1337) & 0x80000000) == 0)
  {
    goto LABEL_26;
  }
  v40 = v33 * v34;
  if (v38 <= 0.0)
    v41 = *MEMORY[0x1E0C9D820];
  else
    v41 = v24 / v38;
  if (v40 <= 0.0)
    v42 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  else
    v42 = v26 / v40;
  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  *(float *)&v43 = v43;
  -[PLImageScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v41 * (width * *(float *)&v43), v42 * (height * *(float *)&v43));
  if (v5)
  {
LABEL_30:
    if (v13 != *MEMORY[0x1E0C9D820] || v46 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      -[PLExpandableImageView setFrame:](self->_imageView, "setFrame:", v45, v44, v13, v46);
  }
}

- (void)refreshTileWithFullScreenImage:(id)a3 modelPhoto:(id)a4
{

  self->_modelPhoto = (PHAsset *)a4;
  if (!-[PLVideoView isPlaying](self->_videoView, "isPlaying"))
  {
    -[PLPhotoTileViewController _updateVideoViewForModelPhoto](self, "_updateVideoViewForModelPhoto");
    if (self->_videoView)
    {
      if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
        -[PLPhotoTileViewController _installSubview:](self, "_installSubview:", self->_videoView);
    }
  }
  -[PLPhotoTileViewController _updatePlaceholderViewAnimated:](self, "_updatePlaceholderViewAnimated:", 1);
  -[PLPhotoTileViewController _setImage:isThumbnail:preserveFrame:](self, "_setImage:isThumbnail:preserveFrame:", a3, 0, 0);
  if (self->_fullSizeImageRequestID)
  {
    -[PLPhotoTileViewController cancelFullSizeImageRequest](self, "cancelFullSizeImageRequest");
    -[PLPhotoTileViewController _requestFullSizeImage](self, "_requestFullSizeImage");
  }
}

- (void)didLoadImage
{
  self->_isLoadingFullSizeImage = 0;
  if ((-[PHAsset isTimelapsePlaceholder](self->_modelPhoto, "isTimelapsePlaceholder") & 1) == 0)
    -[PLPhotoTileViewController _removePlaceholderView](self, "_removePlaceholderView");
}

- (void)_removePlaceholderView
{
  PLTilePlaceholderView *placeholderView;

  self->_currentTileDownloadFinished = 1;
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    -[PLTilePlaceholderView fadeOutSoonIfNeededAndRemoveFromSuperview:](placeholderView, "fadeOutSoonIfNeededAndRemoveFromSuperview:", 1);

    self->_placeholderView = 0;
  }
}

- (void)showErrorPlaceholderView
{
  PLTilePlaceholderView *placeholderView;

  self->_currentTileDownloadFinished = 1;
  placeholderView = self->_placeholderView;
  if (placeholderView)
    -[PLTilePlaceholderView showErrorIndicator](placeholderView, "showErrorIndicator");
}

- (void)setFullSizeImage:(id)a3
{
  if ((*((_BYTE *)self + 1337) & 8) != 0)
  {

    self->_pendingImage = (UIImage *)a3;
  }
  else
  {
    -[PLPhotoTileViewController _setImage:isThumbnail:preserveFrame:](self, "_setImage:isThumbnail:preserveFrame:", a3, 0, 1);
  }
}

- (BOOL)hasFullSizeImage
{
  return (*((_BYTE *)self + 1337) & 1) == 0 && -[PLExpandableImageView image](self->_imageView, "image") != 0;
}

- (void)cancelFullSizeImageRequest
{
  if (self->_fullSizeImageRequestID)
    objc_msgSend(-[PLPhotoTileViewController cachingImageManager](self, "cachingImageManager"), "cancelImageRequest:", self->_fullSizeImageRequestID);
  self->_fullSizeImageRequestID = 0;
}

- (void)loadView
{
  double x;
  double y;
  double width;
  double height;
  PLTileContainerView *v7;

  x = self->_tileFrame.origin.x;
  y = self->_tileFrame.origin.y;
  width = self->_tileFrame.size.width;
  height = self->_tileFrame.size.height;
  if (-[PLPhotoTileViewController isTVOut](self, "isTVOut"))
  {
    width = *(double *)&__TVOutTileSize_0;
    height = *(double *)&__TVOutTileSize_1;
  }
  self->_shouldUpdateBadgeViewOptimalLayout = 1;
  v7 = -[PLTileContainerView initWithFrame:photoTileController:]([PLTileContainerView alloc], "initWithFrame:photoTileController:", self, x, y, width, height);
  self->_containerView = v7;
  -[PLTileContainerView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
  -[PLPhotoTileViewController setView:](self, "setView:", self->_containerView);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  *((_BYTE *)self + 1338) &= ~2u;
  *((_BYTE *)self + 1338) &= ~4u;
  if (*((char *)self + 1337) < 0)
    -[PLPhotoTileViewController setZoomingGesturesEnabled:](self, "setZoomingGesturesEnabled:", 0);
  -[PLVideoView viewDidDisappear](self->_videoView, "viewDidDisappear");
  if (!-[PLPhotoTileViewController tileIsOnScreen](self, "tileIsOnScreen"))
  {
    -[PLPhotoTileViewController _setDefaultZoomScale](self, "_setDefaultZoomScale");
    -[PLPhotoTileViewControllerDelegate photoTileViewController:didDisappear:](self->_tileDelegate, "photoTileViewController:didDisappear:", self, v3);
  }
  -[PLPhotoTileViewController _teardownDispatchTimer](self, "_teardownDispatchTimer");
}

- (void)updateForVisibleOverlays:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PLPhotoTileViewController setBadgeVisible:](self, "setBadgeVisible:");
  -[PLTilePlaceholderView setToolbarVisible:](self->_placeholderView, "setToolbarVisible:", v3);
}

- (void)noteParentViewControllerDidDisappear
{
  if ((*((_BYTE *)self + 1338) & 2) != 0)
    -[PLPhotoTileViewController viewDidDisappear:](self, "viewDidDisappear:", 0);
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  double height;
  double width;
  double v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  CGSize result;

  height = a5.height;
  width = a5.width;
  if (*((char *)self + 1337) < 0
    && !-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper")
    && (-[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale"), v10 >= a4))
  {
    objc_msgSend(a3, "bounds");
    v16 = v15;
    v18 = v17;
    objc_msgSend(-[PLPhotoTileViewController viewForZoomingInScrollView:](self, "viewForZoomingInScrollView:", a3), "frame");
    if (v16 >= v19)
      v21 = v19;
    else
      v21 = v16;
    v22 = v21;
    v12 = rintf(v22);
    if (v18 >= v20)
      height = v20;
    else
      height = v18;
  }
  else
  {
    v11 = width;
    v12 = rintf(v11);
  }
  if ((*((_BYTE *)self + 1337) & 4) == 0
    && (*((_BYTE *)self + 1337) & 0x40) == 0
    && ((*((char *)self + 1337) & 0x80000000) == 0 && CGRectEqualToRect(self->_cropRect, *MEMORY[0x1E0C9D648])
     || -[PLPhotoTileViewController allowsEditing](self, "allowsEditing", a3)))
  {
    -[PLPhotoTileViewController _centerImageInScrollView](self, "_centerImageInScrollView");
  }
  v13 = rint(height);
  v14 = v12;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  double v6;

  self->_shouldUpdateBadgeViewOptimalLayout = 0;
  if (self->_scrollView == a3)
  {
    -[PLPhotoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
    if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
    {
      objc_msgSend(a3, "zoomScale");
      *(float *)&v6 = v6;
      self->_zoomScaleBeforeZooming = *(float *)&v6;
    }
    *((_BYTE *)self + 1337) |= 4u;
    -[PLPhotoTileViewControllerDelegate photoTileViewControllerWillBeginGesture:](self->_tileDelegate, "photoTileViewControllerWillBeginGesture:", self);
    if (!self->_hasNotedZoom)
      self->_hasNotedZoom = 1;
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  double zoomScaleBeforeZooming;
  double v8;
  UIImage *pendingImage;

  if (self->_scrollView == a3)
  {
    if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper", a5))
    {
      if ((*((_BYTE *)self + 1337) & 0x40) == 0)
      {
        zoomScaleBeforeZooming = self->_zoomScaleBeforeZooming;
        objc_msgSend(a3, "zoomScale");
        if (v8 != zoomScaleBeforeZooming)
          self->_userDidAdjustWallpaper = 1;
      }
      if ((*((_BYTE *)self + 1337) & 0x40) != 0)
        *((_BYTE *)self + 1337) &= ~0x40u;
      -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
    }
    *((_BYTE *)self + 1337) &= ~4u;
    *((_BYTE *)self + 1337) &= ~8u;
    -[PLPhotoTileViewControllerDelegate photoTileViewControllerDidEndGesture:](self->_tileDelegate, "photoTileViewControllerDidEndGesture:", self);
    pendingImage = self->_pendingImage;
    if (pendingImage)
    {
      -[PLPhotoTileViewController _setImage:isThumbnail:preserveFrame:](self, "_setImage:isThumbnail:preserveFrame:", pendingImage, 0, 0);

      self->_pendingImage = 0;
    }
    -[PLPhotoTileViewController _performDidEndZoomBlock](self, "_performDidEndZoomBlock");
    if ((-[PLImageScrollView isDragging](self->_scrollView, "isDragging") & 1) == 0)
      -[PLPhotoTileViewController _updatePlaceholderImageRect](self, "_updatePlaceholderImageRect");
    -[PLPhotoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  double v4;
  double v5;
  double v6;

  if ((*((_BYTE *)self + 1337) & 4) != 0 && (*((_BYTE *)self + 1337) & 0x40) == 0)
  {
    *((_BYTE *)self + 1337) |= 0x20u;
    -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale", a3);
    v5 = v4;
    -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
    *(float *)&v6 = v5 / v6;
    if (*(float *)&v6 > 1.0)
      -[PLPhotoTileViewController _requestFullSizeImage](self, "_requestFullSizeImage");
    if (self->_badgeViewOptimalLayoutLowestTop != 0.0)
      -[PLPhotoTileViewController _repositionBadgeView](self, "_repositionBadgeView");
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  if (self->_scrollView == a3)
  {
    -[PLPhotoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
    if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
    {
      objc_msgSend(a3, "visibleBounds");
      self->_cropRectBeforeDragging.origin.x = v5;
      self->_cropRectBeforeDragging.origin.y = v6;
      self->_cropRectBeforeDragging.size.width = v7;
      self->_cropRectBeforeDragging.size.height = v8;
    }
  }
  -[PLPhotoTileViewControllerDelegate photoTileViewControllerWillBeginGesture:](self->_tileDelegate, "photoTileViewControllerWillBeginGesture:", self);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v10;

  if (!a4)
  {
    -[PLPhotoTileViewControllerDelegate photoTileViewControllerDidEndGesture:](self->_tileDelegate, "photoTileViewControllerDidEndGesture:", self);
    if (self->_scrollView == a3)
    {
      if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
      {
        objc_msgSend(a3, "visibleBounds");
        v10.origin.x = v6;
        v10.origin.y = v7;
        v10.size.width = v8;
        v10.size.height = v9;
        if (!CGRectEqualToRect(self->_cropRectBeforeDragging, v10))
          self->_userDidAdjustWallpaper = 1;
      }
      if ((*((_BYTE *)self + 1337) & 4) == 0)
        -[PLPhotoTileViewController _updatePlaceholderImageRect](self, "_updatePlaceholderImageRect");
      -[PLPhotoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGRect v9;

  -[PLPhotoTileViewControllerDelegate photoTileViewControllerDidEndGesture:](self->_tileDelegate, "photoTileViewControllerDidEndGesture:", self);
  if (self->_scrollView == a3)
  {
    if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
    {
      objc_msgSend(a3, "visibleBounds");
      v9.origin.x = v5;
      v9.origin.y = v6;
      v9.size.width = v7;
      v9.size.height = v8;
      if (!CGRectEqualToRect(self->_cropRectBeforeDragging, v9))
        self->_userDidAdjustWallpaper = 1;
    }
    if ((*((_BYTE *)self + 1337) & 4) == 0)
      -[PLPhotoTileViewController _updatePlaceholderImageRect](self, "_updatePlaceholderImageRect");
    -[PLPhotoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  if ((id)-[PLPhotoTileViewController view](self, "view") == a3)
    return 0;
  else
    return self->_imageView;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "view", a3);
  return v5 != objc_msgSend(-[PLPhotoTileViewController videoView](self, "videoView"), "videoOverlayPlayButton");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return (*((_BYTE *)self + 1337) & 2) == 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height;
  CGFloat width;
  _QWORD *v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[5];
  CGAffineTransform v14;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_);
  if (!-[PLPhotoTileViewController shouldSupressViewWillTransitionToSize](self, "shouldSupressViewWillTransitionToSize"))
  {
    if (a4)
      objc_msgSend(a4, "targetTransform");
    else
      memset(&v14, 0, sizeof(v14));
    if (CGAffineTransformIsIdentity(&v14))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v13[3] = &unk_1E70B5D78;
      v13[4] = self;
      v8 = v13;
      v9 = a4;
      v10 = 0;
    }
    else
    {
      self->_shouldUpdateBadgeViewOptimalLayout = 1;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
      v12[3] = &unk_1E70B5DA0;
      v12[4] = self;
      *(CGFloat *)&v12[5] = width;
      *(CGFloat *)&v12[6] = height;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
      v11[3] = &unk_1E70B5D78;
      v11[4] = self;
      v8 = v12;
      v10 = v11;
      v9 = a4;
    }
    objc_msgSend(v9, "animateAlongsideTransition:completion:", v8, v10);
  }
}

- (void)_performRotationUpdatesWithDuration:(double)a3 size:(CGSize)a4
{
  PLExpandableImageView *imageView;
  PLVideoView *videoView;
  double v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  float v18;
  double v19;
  double v20;
  char v21;

  if ((*((_BYTE *)self + 1337) & 2) != 0)
    return;
  imageView = self->_imageView;
  videoView = self->_videoView;
  if (imageView)
  {
    if (!videoView)
    {
      -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale", a3, a4.width, a4.height);
      v8 = v7;
      -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
      v10 = v9;
      if (v10 >= v8)
        v11 = v10;
      else
        v11 = v8;
      -[PLExpandableImageView frame](self->_imageView, "frame");
      if (*((char *)self + 1337) < 0
        && (v13 = v12, !-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
        && (v11 == v8 || (v18 = v13, -[PLImageScrollView bounds](self->_scrollView, "bounds"), v19 > v18)))
      {
        -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
        -[PLPhotoTileViewController minRotatedScale](self, "minRotatedScale");
        v15 = v20;
      }
      else
      {
        v15 = v11;
        if (!-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
          goto LABEL_23;
        v15 = v11;
        if ((*((_BYTE *)self + 1337) & 1) != 0)
          goto LABEL_23;
        v15 = v11;
        if (self->_userDidAdjustWallpaper)
          goto LABEL_23;
        -[PLPhotoTileViewController _calculateZoomScale:inView:](self, "_calculateZoomScale:inView:", 0, self->_scrollView);
        v15 = v16;
      }
      -[PLImageScrollView setAdjustZoomScaleAfterRotation:](self->_scrollView, "setAdjustZoomScaleAfterRotation:", 1);
LABEL_23:
      v21 = *((_BYTE *)self + 1337);
      *(float *)&v14 = v15;
      -[PLPhotoTileViewController setZoomScale:](self, "setZoomScale:", v14);
      if (v15 == v11)
        *((_BYTE *)self + 1337) = *((_BYTE *)self + 1337) & 0xDF | v21 & 0x20;
      if ((*((char *)self + 1337) & 0x80000000) == 0
        || -[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
      {
        -[PLPhotoTileViewController _centerImageInScrollView](self, "_centerImageInScrollView");
      }
      if (!self->_mode)
        -[PLPhotoTileViewController _repositionBadgeView](self, "_repositionBadgeView");
      goto LABEL_15;
    }
  }
  else if (!videoView)
  {
    goto LABEL_15;
  }
  -[PLVideoView updateForRotationWithDuration:isLandscape:](videoView, "updateForRotationWithDuration:isLandscape:", a4.width > a4.height, a3);
LABEL_15:
  -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales", a3, a4.width, a4.height);
  if (self->_videoView)
  {
    if (self->_scrollView)
    {
      -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
      *(float *)&v17 = v17;
      -[PLPhotoTileViewController setZoomScale:](self, "setZoomScale:", v17);
    }
  }
}

- (void)_resetZoomCommon
{
  if ((*((_BYTE *)self + 1338) & 2) == 0 && self->_image && (*((char *)self + 1337) < 0 || self->_mode == 1))
    -[PLPhotoTileViewController reloadZoomScale](self, "reloadZoomScale");
}

- (void)_viewWillMoveToSuperView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  if (a3)
  {
    objc_msgSend(a3, "bounds");
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "setFrame:", v4, v5, v6, v7);
    -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
  }
}

- (void)viewDidLayoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Width;
  double v20;
  double MaxY;
  CGRect rect;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = PLPhotoTileViewController;
  -[CGFloat viewDidLayoutSubviews]((objc_super *)&rect.origin.y, sel_viewDidLayoutSubviews);
  -[PLPhotoTileViewController _resetZoomCommon](self, "_resetZoomCommon");
  -[UIImageView sizeToFit](self->_reviewCheckmarkImageView, "sizeToFit");
  -[PLExpandableImageView frame](self->_imageView, "frame");
  v4 = v3;
  rect.origin.x = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView bounds](self->_reviewCheckmarkImageView, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v12;
  v24.origin.y = v14;
  v24.size.width = v16;
  v24.size.height = v18;
  v20 = floor((Width - CGRectGetWidth(v24)) * 0.5);
  v25.origin.x = rect.origin.x;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  MaxY = CGRectGetMaxY(v25);
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  -[UIImageView setFrame:](self->_reviewCheckmarkImageView, "setFrame:", v20, MaxY - CGRectGetHeight(v26) + -15.0, v16, v18);
  -[PLPhotoTileViewController _repositionBadgeView](self, "_repositionBadgeView");
  if ((*((_BYTE *)self + 1338) & 2) == 0 && CGRectEqualToRect(self->_cropRect, *MEMORY[0x1E0C9D648]))
    -[PLPhotoTileViewController _centerImageInScrollView](self, "_centerImageInScrollView");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[PLPhotoTileViewController _updateContentInset](self, "_updateContentInset");
}

- (void)didMoveToParentViewController:(id)a3
{
  char isKindOfClass;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  NSClassFromString(CFSTR("CAMImagePickerCameraViewController"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((*((char *)self + 1337) & 0x80000000) == 0 && (isKindOfClass & 1) != 0)
  {
    -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
    -[PLPhotoTileViewController _setDefaultZoomScale](self, "_setDefaultZoomScale");
  }
}

- (void)updateViewConstraints
{
  UIView *v3;
  UIView *v4;
  NSArray *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController updateViewConstraints](&v6, sel_updateViewConstraints);
  v3 = -[PLPhotoTileViewController _customCenterOverlay](self, "_customCenterOverlay");
  if (v3)
  {
    if (!self->_customCenterOverlayConstraints)
    {
      v4 = v3;
      v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      -[NSArray addObject:](v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, -[PLPhotoTileViewController view](self, "view"), 9, 1.0, 0.0));
      -[NSArray addObject:](v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, -[PLPhotoTileViewController view](self, "view"), 10, 1.0, 0.0));
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addConstraints:", v5);
      self->_customCenterOverlayConstraints = v5;
    }
  }
}

- (void)resetZoom
{
  -[PLPhotoTileViewController _resetZoomCommon](self, "_resetZoomCommon");
  objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "layoutBelowIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  v5 = 1;
  if (!a3)
  {
    if (*((char *)self + 1337) < 0 && (objc_opt_respondsToSelector() & 1) != 0)
      v5 = -[PLPhotoTileViewControllerDelegate isPhotoTileParentPageControllerAnimating:](self->_tileDelegate, "isPhotoTileParentPageControllerAnimating:", self);
    else
      v5 = 0;
  }
  self->_shouldUpdateBadgeViewOptimalLayout = 1;
  *((_BYTE *)self + 1338) |= 4u;
  -[PLVideoView viewWillAppear:](self->_videoView, "viewWillAppear:", v5);
  if (*((char *)self + 1337) < 0)
  {
    -[PLPhotoTileViewController _setDefaultZoomScale](self, "_setDefaultZoomScale");
    -[PLExpandableImageView setBorderAndAccessoriesVisible:](self->_imageView, "setBorderAndAccessoriesVisible:", 0);
    -[PLPhotoTileViewControllerDelegate photoTileViewController:willAppear:](self->_tileDelegate, "photoTileViewController:willAppear:", self, v5);
    -[PLPhotoTileViewController setZoomingGesturesEnabled:](self, "setZoomingGesturesEnabled:", 0);
  }
  else
  {
    -[PLPhotoTileViewController reloadZoomScale](self, "reloadZoomScale");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  dispatch_time_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewDidAppear:](&v12, sel_viewDidAppear_);
  *((_BYTE *)self + 1338) |= 2u;
  if (*((char *)self + 1337) < 0)
    -[PLPhotoTileViewController setZoomingGesturesEnabled:](self, "setZoomingGesturesEnabled:", 1);
  -[PLVideoView viewDidAppear](self->_videoView, "viewDidAppear");
  -[PLPhotoTileViewControllerDelegate photoTileViewController:didAppear:](self->_tileDelegate, "photoTileViewController:didAppear:", self, v3);
  -[PLTilePlaceholderView showLoadingIndicatorWhenReady](self->_placeholderView, "showLoadingIndicatorWhenReady");
  if (!self->_dispatchTimer)
  {
    self->_dispatchTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    objc_initWeak(&location, self);
    v9 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v10, &location);
    pl_dispatch_source_set_event_handler();
    v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    self->_dispatchStartTime = CFAbsoluteTimeGetCurrent();
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v9, 3221225472, __43__PLPhotoTileViewController_viewDidAppear___block_invoke, &unk_1E70B5DC8);
    v7 = (_QWORD *)MEMORY[0x1E0CEB258];
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_applicationWillResignActive_, *MEMORY[0x1E0CEB358], *MEMORY[0x1E0CEB258]);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x1E0CEB270], *v7);
    dispatch_resume((dispatch_object_t)self->_dispatchTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  self->_hasNotedZoom = 0;
}

- (void)applicationWillResignActive:(id)a3
{
  if (self->_dispatchTimer)
  {
    self->_dispatchTimeElapsed = CFAbsoluteTimeGetCurrent() - self->_dispatchStartTime;
    dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  dispatch_time_t v4;

  if (self->_dispatchTimer)
  {
    v4 = dispatch_time(0, (uint64_t)((5.0 - self->_dispatchTimeElapsed) * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
}

- (void)ensureFullSizeImageLoaded
{
  PHAsset *modelPhoto;
  int v4;

  if (!self->_isLoadingFullSizeImage)
  {
    modelPhoto = self->_modelPhoto;
    if (modelPhoto)
      v4 = -[PHAsset complete](modelPhoto, "complete") ^ 1;
    else
      LOBYTE(v4) = 0;
    if (self->_tileDelegate)
    {
      if ((*((_BYTE *)self + 1337) & 1) == 0)
        LOBYTE(v4) = 1;
      if ((v4 & 1) == 0)
      {
        self->_isLoadingFullSizeImage = 1;
        -[PLPhotoTileViewControllerDelegate photoTileViewControllerRequestsFullScreenImage:](self->_tileDelegate, "photoTileViewControllerRequestsFullScreenImage:", self);
      }
    }
  }
}

- (void)_handleSingleTap:(id)a3
{
  -[PLPhotoTileViewControllerDelegate photoTileViewControllerSingleTap:](self->_tileDelegate, "photoTileViewControllerSingleTap:", self);
}

- (void)_requestFullSizeImage
{
  id v3;
  id v4;
  PHAsset *modelPhoto;
  _QWORD v6[5];

  if (!self->_fullSizeImageRequestID)
  {
    if (self->_modelPhoto)
    {
      v3 = (id)objc_opt_new();
      objc_msgSend(v3, "setDeliveryMode:", 1);
      objc_msgSend(v3, "setLoadingMode:", 1);
      objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
      v4 = -[PLPhotoTileViewController cachingImageManager](self, "cachingImageManager");
      modelPhoto = self->_modelPhoto;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __50__PLPhotoTileViewController__requestFullSizeImage__block_invoke;
      v6[3] = &unk_1E70B5DF0;
      v6[4] = self;
      self->_fullSizeImageRequestID = objc_msgSend(v4, "requestImageDataAndOrientationForAsset:options:resultHandler:", modelPhoto, v3, v6);
    }
  }
}

- (void)_handleFullSizeImageRequestResult:(id)a3 dataUTI:(id)a4 orientation:(int64_t)a5
{
  void *v7;
  int v8;
  PHAsset *modelPhoto;
  char v10;

  if (a4
    && (v7 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a4),
        v8 = objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC530]),
        a3)
    && v8)
  {
    -[PHAsset localIdentifier](self->_modelPhoto, "localIdentifier");
    dispatch_get_global_queue(0, 0);
    pl_dispatch_async();
  }
  else
  {
    modelPhoto = self->_modelPhoto;
    if (modelPhoto)
      v10 = -[PHAsset complete](modelPhoto, "complete", a3) ^ 1;
    else
      v10 = 0;
    if (self->_tileDelegate && (v10 & 1) == 0 && (*((_BYTE *)self + 1338) & 8) == 0)
    {
      *((_BYTE *)self + 1338) |= 8u;
      -[PLPhotoTileViewControllerDelegate photoTileViewControllerRequestsFullSizeImage:](self->_tileDelegate, "photoTileViewControllerRequestsFullSizeImage:", self);
    }
  }
}

- (void)_handleDoubleTap:(id)a3
{
  PLVideoView *videoView;
  PLImageScrollView *scrollView;
  double v7;
  PLImageScrollView *v8;
  double v9;
  float v10;
  double v11;
  float doubleTapZoomScale;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  videoView = self->_videoView;
  if (videoView)
  {
    -[PLVideoView handleDoubleTap](videoView, "handleDoubleTap", a3);
  }
  else if (-[PLImageScrollView isUserInteractionEnabled](self->_scrollView, "isUserInteractionEnabled"))
  {
    *((_BYTE *)self + 1337) |= 8u;
    *((_BYTE *)self + 1337) |= 0x20u;
    if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper"))
    {
      self->_userDidAdjustWallpaper = !self->_zoomToFillInsteadOfToFit;
      self->_zoomToFillInsteadOfToFit ^= 1u;
      scrollView = self->_scrollView;
      -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
      v8 = scrollView;
    }
    else
    {
      -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
      v10 = v9;
      -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
      *(float *)&v11 = v11;
      if (v10 == *(float *)&v11)
      {
        doubleTapZoomScale = self->_doubleTapZoomScale;
        objc_msgSend(a3, "locationInView:", self->_imageView);
        v14 = v13;
        v16 = v15;
        -[PLExpandableImageView frame](self->_imageView, "frame");
        -[PLImageScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", 1, v14 - v17 / doubleTapZoomScale * 0.5, v16 - v18 / doubleTapZoomScale * 0.5);
        goto LABEL_10;
      }
      v8 = self->_scrollView;
      v7 = v10;
    }
    -[PLImageScrollView setZoomScale:animated:](v8, "setZoomScale:animated:", 1, v7);
  }
LABEL_10:
  -[PLPhotoTileViewControllerDelegate photoTileViewControllerDoubleTap:](self->_tileDelegate, "photoTileViewControllerDoubleTap:", self);
  -[PLPhotoTileViewController _updatePlaceholderImageRect](self, "_updatePlaceholderImageRect");
}

- (id)newImageWithCropRect:(CGRect)a3 minimalCropDimension:(double)a4 croppedImageData:(id *)a5 fullScreenImageData:(id *)a6 imageCropRect:(CGRect *)a7 intersectCropWithFullRect:(BOOL)a8
{
  _BOOL4 v8;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  CGFloat v47;
  CGFloat v48;
  double v50;
  double v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v8 = a8;
  v13 = PLIntegralRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[PLPhotoTileViewController imageView](self, "imageView");
  v21 = -[PLPhotoTileViewController image](self, "image");
  objc_msgSend(v21, "size");
  v23 = v22;
  v25 = v24;
  if (-[UIViewController uiipc_imagePickerController](self, "uiipc_imagePickerController"))
    v26 = -[PLPhotoTileViewController _newCGImageBackedUIImageFromImage:](self, "_newCGImageBackedUIImageFromImage:", v21);
  else
    v26 = 0;
  PLPhysicalScreenScale();
  *(float *)&v27 = v27;
  memset(&v53, 0, sizeof(v53));
  CGAffineTransformMakeScale(&v53, *(float *)&v27, *(float *)&v27);
  v47 = v15;
  v48 = v13;
  objc_msgSend(v20, "convertRect:fromView:", -[PLPhotoTileViewController scrollView](self, "scrollView"), v13, v15, v17, v19);
  v55 = CGRectIntegral(v54);
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  if (v8)
  {
    objc_msgSend(v20, "bounds");
    v60.origin.x = v32;
    v60.origin.y = v33;
    v60.size.width = v34;
    v60.size.height = v35;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v57 = CGRectIntersection(v56, v60);
    v50 = v57.origin.x;
    v51 = v57.origin.y;
    v36 = v57.size.width;
    v37 = v57.size.height;
    if (width != v57.size.width || height != v57.size.height)
    {
      v17 = floor(v17 * (v57.size.width / width));
      v19 = floor(v19 * (v57.size.height / height));
    }
  }
  else
  {
    v50 = v55.origin.x;
    v51 = v55.origin.y;
    v37 = v55.size.height;
    v36 = v55.size.width;
  }
  v38 = v25;
  v39 = v23;
  v40 = a4;
  if (!-[PLPhotoTileViewController force1XCroppedImage](self, "force1XCroppedImage")
    && ((dyld_program_sdk_at_least() & 1) != 0
     || -[PLPhotoTileViewController forceNativeScreenScale](self, "forceNativeScreenScale")))
  {
    v52 = v53;
    v58.origin.y = v47;
    v58.origin.x = v48;
    v58.size.width = v17;
    v58.size.height = v19;
    v59 = CGRectApplyAffineTransform(v58, &v52);
    PLIntegralRect(v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    v17 = v41;
    v19 = v42;
  }
  a7->origin.x = v50;
  a7->origin.y = v51;
  a7->size.width = v36;
  a7->size.height = v37;
  if (a6)
  {
    v52 = v53;
    -[PLPhotoTileViewController _getFullScreenImageData:forImage:fullSize:imageView:screenScaleTransform:](self, "_getFullScreenImageData:forImage:fullSize:imageView:screenScaleTransform:", a6, v26, v20, &v52, v38, v23);
  }
  if (a4 <= 0.0 || v17 >= a4 || v19 >= a4)
    goto LABEL_30;
  if (v36 < v37)
  {
    if (v37 > v19)
    {
      if (v37 <= a4)
        v43 = v37;
      else
        v43 = a4;
      if (v17 == v19)
        v40 = v43;
      else
        v40 = floor(v17 * (v43 / v19));
      goto LABEL_31;
    }
LABEL_30:
    v40 = v17;
    v43 = v19;
    goto LABEL_31;
  }
  if (v36 <= v17)
    goto LABEL_30;
  if (v36 <= a4)
    v40 = v36;
  if (v17 == v19)
    v43 = v40;
  else
    v43 = floor(v19 * (v40 / v17));
LABEL_31:
  if (v26)
    v44 = (id)PLCreateCroppedImageFromImage();
  else
    v44 = -[PLPhotoTileViewController _newImageForAsset:targetSize:cropRect:fullSize:](self, "_newImageForAsset:targetSize:cropRect:fullSize:", -[PLPhotoTileViewController photo](self, "photo"), v40, v43, v50, v51, v36, v37, v38, v39);
  v45 = v44;
  if (a5 && v44)
  {
    objc_msgSend(v44, "CGImage");
    *a5 = (id)imageDataFromImageWithFormat();
  }
  if (v26)

  return v45;
}

- (void)_getFullScreenImageData:(id *)a3 forImage:(id)a4 fullSize:(CGSize)a5 imageView:(id)a6 screenScaleTransform:(CGAffineTransform *)a7
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double width;
  double height;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  CGAffineTransform v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  if (-[PLPhotoTileViewController _clientIsWallpaper](self, "_clientIsWallpaper")
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
    || *((char *)self + 1337) < 0)
  {
    v17 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
    width = v20;
    height = v21;
  }
  else
  {
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "frame");
    v14 = rint((v12 + v13 + -480.0) * 0.5);
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "frame");
    v17 = rint((v15 + v16 + -320.0) * 0.5);
    width = 320.0;
    height = 480.0;
  }
  objc_msgSend(a6, "convertRect:fromView:", -[PLPhotoTileViewController view](self, "view"), v17, v14, width, height);
  x = PLIntegralRect(v22, v23, v24, v25);
  y = v27;
  v30 = v29;
  v32 = v31;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || -[PLPhotoTileViewController forceNativeScreenScale](self, "forceNativeScreenScale"))
  {
    v33 = *(_OWORD *)&a7->c;
    *(_OWORD *)&v49.a = *(_OWORD *)&a7->a;
    *(_OWORD *)&v49.c = v33;
    *(_OWORD *)&v49.tx = *(_OWORD *)&a7->tx;
    v34 = v17;
    *(double *)&v33 = v14;
    v35 = width;
    v36 = height;
    v50 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v33 - 8), &v49);
    width = v50.size.width;
    height = v50.size.height;
  }
  v37 = a5.width;
  v38 = a5.height;
  if (v30 > a5.width || v32 > a5.height)
  {
    v40 = a5.width / v30;
    if (a5.width / v30 >= a5.height / v32)
      v40 = a5.height / v32;
    if (v30 * v40 < a5.width)
      v37 = v30 * v40;
    v41 = v32 * v40;
    if (v41 < a5.height)
      v38 = v41;
    v42 = x + (v30 - v37) * 0.5;
    v43 = y + (v32 - v38) * 0.5;
    v51 = CGRectIntegral(*(CGRect *)(&v37 - 2));
    x = v51.origin.x;
    y = v51.origin.y;
    v30 = v51.size.width;
    v32 = v51.size.height;
  }
  v44 = 0.0;
  v45 = 0.0;
  if (x >= 0.0)
  {
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = v30;
    v52.size.height = v32;
    if (CGRectGetMaxX(v52) <= a5.width)
    {
      v45 = x;
    }
    else
    {
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = v30;
      v53.size.height = v32;
      v45 = x - (CGRectGetMaxX(v53) - a5.width);
    }
  }
  if (y >= 0.0)
  {
    v54.origin.x = v45;
    v54.origin.y = y;
    v54.size.width = v30;
    v54.size.height = v32;
    if (CGRectGetMaxY(v54) <= a5.height)
    {
      v44 = y;
      if (a4)
        goto LABEL_28;
      goto LABEL_30;
    }
    v55.origin.x = v45;
    v55.origin.y = y;
    v55.size.width = v30;
    v55.size.height = v32;
    v44 = y - (CGRectGetMaxY(v55) - a5.height);
  }
  if (a4)
  {
LABEL_28:
    v46 = (id)PLCreateCroppedImageFromImage();
    goto LABEL_31;
  }
LABEL_30:
  v46 = -[PLPhotoTileViewController _newImageForAsset:targetSize:cropRect:fullSize:](self, "_newImageForAsset:targetSize:cropRect:fullSize:", -[PLPhotoTileViewController photo](self, "photo"), width, height, v45, v44, v30, v32, a5.width, a5.height);
LABEL_31:
  v47 = v46;
  if (v46)
  {
    objc_msgSend(v46, "CGImage");
    *a3 = (id)imageDataFromImageWithFormat();

  }
}

- (id)_newImageForAsset:(id)a3 targetSize:(CGSize)a4 cropRect:(CGRect)a5 fullSize:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  CGAffineTransform v23;
  CGAffineTransform v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.height;
  v11 = a4.width;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&v24, 1.0 / a6.width, 1.0 / a6.height);
  v23 = v24;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v32 = CGRectApplyAffineTransform(v31, &v23);
  v13 = v32.size.width;
  v14 = v32.size.height;
  if (v32.origin.x >= 0.0)
    v15 = v32.origin.x;
  else
    v15 = 0.0;
  if (v32.origin.y >= 0.0)
    v16 = v32.origin.y;
  else
    v16 = 0.0;
  v17 = (void *)MEMORY[0x1BCCC6CF8]();
  v18 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v18, "setSynchronous:", 1);
  objc_msgSend(v18, "setNormalizedCropRect:", v15, v16, fmin(v13, 1.0), fmin(v14, 1.0));
  objc_msgSend(v18, "setResizeMode:", 2);
  v19 = (void *)objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__PLPhotoTileViewController__newImageForAsset_targetSize_cropRect_fullSize___block_invoke;
  v22[3] = &unk_1E70B5E68;
  v22[4] = &v25;
  objc_msgSend(v19, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", a3, 0, v18, v22, v11, v10);

  objc_autoreleasePoolPop(v17);
  v20 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v20;
}

- (id)dictionaryWithCroppedImageForRect:(CGRect)a3 minimalCropDimension:(double)a4 withOptions:(int)a5
{
  double height;
  double width;
  double y;
  double x;
  __int128 v12;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = 0;
  v22 = 0;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *MEMORY[0x1E0C9D648];
  v20 = v12;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((a5 & 8) != 0)
    v14 = &v22;
  else
    v14 = 0;
  if ((a5 & 4) != 0)
    v15 = &v21;
  else
    v15 = 0;
  v16 = -[PLPhotoTileViewController newImageWithCropRect:minimalCropDimension:croppedImageData:fullScreenImageData:imageCropRect:intersectCropWithFullRect:](self, "newImageWithCropRect:minimalCropDimension:croppedImageData:fullScreenImageData:imageCropRect:intersectCropWithFullRect:", v14, v15, &v19, (a5 >> 4) & 1, x, y, width, height, a4);
  v17 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v19, v20);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D74F48]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D74F50]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D74F58]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D74F60]);

  return v13;
}

- (void)zoomToScale:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  PLImageScrollView *scrollView;
  _BOOL8 v8;
  double v9;
  double v10;

  scrollView = self->_scrollView;
  if (scrollView
    && (v8 = a4,
        v9 = a3,
        -[PLImageScrollView zoomScale](scrollView, "zoomScale"),
        a3 = vabdd_f64(v10, v9),
        a3 >= 0.00000011920929))
  {
    -[PLPhotoTileViewController _setDidEndZoomingBlock:](self, "_setDidEndZoomingBlock:", a5);
    -[PLImageScrollView setZoomScale:animated:](self->_scrollView, "setZoomScale:animated:", v8, v9);
  }
  else if (a5)
  {
    (*((void (**)(id, __n128))a5 + 2))(a5, *(__n128 *)&a3);
  }
}

- (void)_setDidEndZoomingBlock:(id)a3
{
  id didEndZoomingBlock;

  didEndZoomingBlock = self->_didEndZoomingBlock;
  if (didEndZoomingBlock)
  {

    self->_didEndZoomingBlock = 0;
  }
  if (a3)
    self->_didEndZoomingBlock = (id)objc_msgSend(a3, "copy");
}

- (void)_performDidEndZoomBlock
{
  void (**didEndZoomingBlock)(id, SEL);

  didEndZoomingBlock = (void (**)(id, SEL))self->_didEndZoomingBlock;
  if (didEndZoomingBlock)
  {
    didEndZoomingBlock[2](didEndZoomingBlock, a2);
    -[PLPhotoTileViewController _setDidEndZoomingBlock:](self, "_setDidEndZoomingBlock:", 0);
  }
}

- (double)minRotatedScale
{
  double *p_minZoomScale;

  if (!self->_allowZoomToFill
    || (p_minZoomScale = &self->_zoomToFillScale,
        (__ShouldZoomToFill((uint64_t)self, self->_minZoomScale, self->_zoomToFillScale) & 1) == 0))
  {
    p_minZoomScale = &self->_minZoomScale;
  }
  return *p_minZoomScale;
}

- (float)_calculateZoomScale:(BOOL)a3 inView:(id)a4
{
  double v4;
  _BOOL4 v5;
  int v7;
  void *v8;
  void *v9;
  CGSize *p_imageSize;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  _BOOL4 v16;
  double v18;
  double v19;
  double v20;

  v5 = a3;
  if (a4)
    goto LABEL_2;
  if (-[PLPhotoTileViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "superview");
    if (v8)
    {
      a4 = v8;
LABEL_2:
      v7 = 0;
      goto LABEL_10;
    }
  }
  v9 = (void *)objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "window");
  if (v9 || (v9 = (void *)objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow")) != 0)
  {
    a4 = v9;
  }
  else
  {
    LODWORD(v4) = 1.0;
    if ((*((_BYTE *)self + 1337) & 2) == 0)
      return *(float *)&v4;
    a4 = 0;
  }
  v7 = 1;
LABEL_10:
  p_imageSize = &self->_imageSize;
  LODWORD(v4) = 1.0;
  if (self->_imageSize.width <= 0.0 || self->_imageSize.height <= 0.0)
    return *(float *)&v4;
  if ((*((_BYTE *)self + 1337) & 2) != 0)
  {
    v12 = *(double *)&__TVOutTileSize_0;
    v14 = *(double *)&__TVOutTileSize_1;
  }
  else
  {
    objc_msgSend(a4, "bounds", v4);
    v12 = v11;
    v14 = v13;
  }
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarStyle");
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "isStatusBarHidden") & 1) == 0)
  {
    v16 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
       && v15 == 1;
    if (!v7)
      goto LABEL_28;
LABEL_25:
    if ((*((char *)self + 1337) & 0x80000000) == 0 && !v16)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarFrame");
      v14 = v14 - v18;
    }
    goto LABEL_28;
  }
  v16 = 1;
  if (v7)
    goto LABEL_25;
LABEL_28:
  v4 = v12 / p_imageSize->width;
  v19 = v14 / self->_imageSize.height;
  if (v4 >= v19)
    v20 = v14 / self->_imageSize.height;
  else
    v20 = v12 / p_imageSize->width;
  if (v4 < v19)
    v4 = v14 / self->_imageSize.height;
  if (v5)
    v4 = v20;
  *(float *)&v4 = v4;
  return *(float *)&v4;
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)zoomToFillScale
{
  return self->_zoomToFillScale;
}

- (double)zoomToFitScale
{
  return self->_minZoomScale;
}

- (double)defaultZoomScale
{
  double result;

  if (self->_zoomToFillInsteadOfToFit)
    -[PLPhotoTileViewController zoomToFillScale](self, "zoomToFillScale");
  else
    -[PLPhotoTileViewController minZoomScale](self, "minZoomScale");
  return result;
}

- (double)currentToMinZoomRatio
{
  double v3;
  double v4;
  double v5;

  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  -[PLPhotoTileViewController minZoomScale](self, "minZoomScale");
  return v4 / v5;
}

- (double)currentToDefaultZoomRatio
{
  double v3;
  double v4;
  double v5;

  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  v4 = v3;
  -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
  return v4 / v5;
}

- (BOOL)isZoomedOut
{
  double v3;
  float v4;
  double v5;
  float v6;

  -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
  v4 = v3;
  -[PLImageScrollView zoomScale](self->_scrollView, "zoomScale");
  v6 = v5;
  if (self->_useLessThanMinZoomForZoomedOutTest)
    return v4 + 0.001 >= v6;
  self->_useLessThanMinZoomForZoomedOutTest = 1;
  return vabds_f32(v6, v4) < 0.0001;
}

- (void)setOrientationDelegate:(id)a3
{
  id orientationDelegate;

  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      orientationDelegate = self->_orientationDelegate;
      self->_orientationDelegate = a3;
      if (!orientationDelegate)
        -[PLPhotoTileViewController reloadZoomScale](self, "reloadZoomScale");
    }
  }
  else
  {
    self->_orientationDelegate = 0;
  }
}

- (void)_setDefaultZoomScale
{
  double v2;
  double v4;
  double v5;
  double v6;

  if ((*((_BYTE *)self + 1338) & 0x10) != 0)
  {
    *(float *)&v2 = self->_cropRectZoomScale;
    -[PLPhotoTileViewController setZoomScale:](self, "setZoomScale:", v2);
    -[PLImageScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", self->_imageView, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    -[PLImageScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v5 - self->_cropOverlayRect.origin.x, v6 - self->_cropOverlayRect.origin.y);
  }
  else
  {
    -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
    *(float *)&v4 = v4;
    -[PLPhotoTileViewController setZoomScale:](self, "setZoomScale:", v4);
  }
}

- (void)reloadZoomScale
{
  -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
  -[PLPhotoTileViewController _setDefaultZoomScale](self, "_setDefaultZoomScale");
}

- (void)updateZoomScales
{
  float v3;
  float v4;
  char ShouldZoomToFill;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
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
  NSNumber *v24;
  NSNumber *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  PHAsset *modelPhoto;
  double doubleTapZoomScale;
  double minZoomScale;
  double zoomToFillScale;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[PLPhotoTileViewController _calculateZoomScale:inView:](self, "_calculateZoomScale:inView:", 1, 0);
  self->_minZoomScale = v3;
  -[PLPhotoTileViewController _calculateZoomScale:inView:](self, "_calculateZoomScale:inView:", 0, 0);
  self->_zoomToFillScale = v4;
  if (self->_allowZoomToFill)
    ShouldZoomToFill = __ShouldZoomToFill((uint64_t)self, self->_minZoomScale, v4);
  else
    ShouldZoomToFill = 0;
  self->_zoomToFillInsteadOfToFit = ShouldZoomToFill;
  v6 = (void *)-[PLPhotoTileViewController viewIfLoaded](self, "viewIfLoaded");
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "window"), "screen");
  if (!v7)
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  objc_msgSend(v6, "bounds");
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  if (CGRectIsEmpty(v35))
  {
    objc_msgSend(v7, "bounds");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }
  v16 = self->_imageSize.width;
  v17 = self->_imageSize.height;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v18 = v16 / CGRectGetWidth(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v19 = v17 / CGRectGetHeight(v37);
  if (v18 >= v19)
    v20 = v18;
  else
    v20 = v19;
  objc_msgSend(v7, "scale");
  v22 = v20 / v21;
  if (v22 >= 3.0)
    v23 = v22;
  else
    v23 = 3.0;
  v24 = -[PLPhotoTileViewController maxZoomScaleOverride](self, "maxZoomScaleOverride");
  v25 = v24;
  if (v24)
  {
    -[NSNumber doubleValue](v24, "doubleValue");
    v23 = v26;
  }
  if (_UIAccessibilityZoomTouchEnabled())
  {
    v27 = self->_imageSize.height * 0.0165999997;
    if (self->_imageSize.width * 0.0165999997 >= v27)
      v27 = self->_imageSize.width * 0.0165999997;
    if (v27 >= v23)
      v23 = v27;
  }
  if (v25)
  {
    -[NSNumber doubleValue](v25, "doubleValue");
    v29 = v28;
  }
  else
  {
    v29 = 3.0;
  }
  modelPhoto = self->_modelPhoto;
  if (modelPhoto
    && -[PHAsset isCloudSharedAsset](modelPhoto, "isCloudSharedAsset")
    && -[PHAsset cloudPlaceholderKind](self->_modelPhoto, "cloudPlaceholderKind") == 3)
  {
    v23 = 1.15;
    v29 = 1.15;
  }
  doubleTapZoomScale = v29 * self->_minZoomScale;
  self->_doubleTapZoomScale = doubleTapZoomScale;
  minZoomScale = self->_minZoomScale;
  zoomToFillScale = self->_zoomToFillScale;
  if (v25 && doubleTapZoomScale < zoomToFillScale)
  {
    self->_zoomToFillScale = doubleTapZoomScale;
    zoomToFillScale = doubleTapZoomScale;
    doubleTapZoomScale = self->_doubleTapZoomScale;
  }
  v34 = v23 * minZoomScale;
  if (doubleTapZoomScale < zoomToFillScale)
  {
    self->_doubleTapZoomScale = zoomToFillScale;
    zoomToFillScale = self->_zoomToFillScale;
  }
  if (v34 < zoomToFillScale && (_UIAccessibilityZoomTouchEnabled() & 1) == 0)
    v34 = self->_zoomToFillScale;
  -[PLImageScrollView setMaximumZoomScale:](self->_scrollView, "setMaximumZoomScale:", v34);
  -[PLImageScrollView setMinimumZoomScale:](self->_scrollView, "setMinimumZoomScale:", self->_minZoomScale);
}

- (void)setAllowsZoomToFill:(BOOL)a3
{
  if (self->_allowZoomToFill != a3)
  {
    self->_allowZoomToFill = a3;
    -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
  }
}

- (int)imageOrientation
{
  return self->_imageOrientation;
}

- (void)updateAfterCollapse
{
  if (self->_videoView)
  {
    -[PLExpandableImageView setVideoView:](self->_imageView, "setVideoView:", 0);
    -[PLExpandableImageView setVideoView:](self->_imageView, "setVideoView:", self->_videoView);
  }
  -[PLPhotoTileViewController reloadZoomScale](self, "reloadZoomScale");
  -[PLImageScrollView setContentOffset:](self->_scrollView, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_adjustZoomForEnteringMode:(BOOL)a3
{
  _BOOL4 v3;
  PLImageScrollView *scrollView;

  v3 = a3;
  -[PLPhotoTileViewController _adjustScrollViewContentOffsetForInsets](self, "_adjustScrollViewContentOffsetForInsets");
  if (v3)
  {
    if (!-[PLPhotoTileViewController isZoomedOut](self, "isZoomedOut"))
      return;
    -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
  }
  else
  {
    -[PLPhotoTileViewController updateZoomScales](self, "updateZoomScales");
    if (!-[PLPhotoTileViewController isZoomedOut](self, "isZoomedOut"))
      return;
  }
  scrollView = self->_scrollView;
  -[PLPhotoTileViewController defaultZoomScale](self, "defaultZoomScale");
  -[PLImageScrollView setZoomScale:animated:](scrollView, "setZoomScale:animated:", 1);
}

- (void)setLockedUnderCropOverlay:(BOOL)a3
{
  *((_BYTE *)self + 1338) = *((_BYTE *)self + 1338) & 0xFE | a3;
  -[PLPhotoTileViewController _adjustZoomForEnteringMode:](self, "_adjustZoomForEnteringMode:");
}

- (void)_setupReviewCheckmark
{
  id v3;
  UIImageView *v4;

  if (self->_reviewing && !self->_reviewCheckmarkImageView)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA658]);
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    self->_reviewCheckmarkImageView = v4;
    -[UIImageView setImage:](v4, "setImage:", objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("BlueCheckUnselected.png"), PLPhotoLibraryFrameworkBundle()));
    -[UIImageView setHighlightedImage:](self->_reviewCheckmarkImageView, "setHighlightedImage:", objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("BlueCheckSelected.png"), PLPhotoLibraryFrameworkBundle()));
    -[PLPhotoTileViewController _updateReviewCheckmark](self, "_updateReviewCheckmark");
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addSubview:", self->_reviewCheckmarkImageView);
    -[PLPhotoTileViewController _updateSubviewOrdering](self, "_updateSubviewOrdering");
  }
}

- (void)setReviewing:(BOOL)a3
{
  -[PLPhotoTileViewController setReviewing:animated:](self, "setReviewing:animated:", a3, 0);
}

- (void)setReviewing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  _QWORD v7[5];
  _QWORD v8[6];

  if (self->_reviewing != a3)
  {
    v4 = a4;
    self->_reviewing = a3;
    -[PLPhotoTileViewController _setupReviewCheckmark](self, "_setupReviewCheckmark");
    v6 = 1.0;
    if (!self->_reviewing)
      v6 = 0.0;
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__PLPhotoTileViewController_setReviewing_animated___block_invoke;
    v8[3] = &unk_1E70B6640;
    v8[4] = self;
    *(double *)&v8[5] = v6;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__PLPhotoTileViewController_setReviewing_animated___block_invoke_2;
    v7[3] = &unk_1E70B6398;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v8, v7, 0.3);
    }
    else
    {
      -[UIImageView setAlpha:](self->_reviewCheckmarkImageView, "setAlpha:");
      __51__PLPhotoTileViewController_setReviewing_animated___block_invoke_2((uint64_t)v7);
    }
  }
}

- (void)setPicked:(BOOL)a3
{
  if (self->_picked != a3)
  {
    self->_picked = a3;
    -[PLPhotoTileViewController _updateReviewCheckmark](self, "_updateReviewCheckmark");
  }
}

- (void)_updateReviewCheckmark
{
  -[UIImageView setHighlighted:](self->_reviewCheckmarkImageView, "setHighlighted:", self->_picked);
}

- (BOOL)centerContentVertically
{
  return self->_centerContentVertically;
}

- (void)setCenterContentVertically:(BOOL)a3
{
  self->_centerContentVertically = a3;
}

- (UIImage)unscaledImage
{
  return self->_unscaledImage;
}

- (void)setUnscaledImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (BOOL)forceNativeScreenScale
{
  return self->_forceNativeScreenScale;
}

- (void)setForceNativeScreenScale:(BOOL)a3
{
  self->_forceNativeScreenScale = a3;
}

- (BOOL)force1XCroppedImage
{
  return self->_force1XCroppedImage;
}

- (void)setForce1XCroppedImage:(BOOL)a3
{
  self->_force1XCroppedImage = a3;
}

- (int)inflightFullSizeImageRequestID
{
  return self->_inflightFullSizeImageRequestID;
}

- (void)setInflightFullSizeImageRequestID:(int)a3
{
  self->_inflightFullSizeImageRequestID = a3;
}

- (UIEdgeInsets)overlayInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_overlayInsets.top;
  left = self->_overlayInsets.left;
  bottom = self->_overlayInsets.bottom;
  right = self->_overlayInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSNumber)maxZoomScaleOverride
{
  return self->_maxZoomScaleOverride;
}

- (void)setMaxZoomScaleOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1408);
}

- (BOOL)wantsCompactLayout
{
  return self->_wantsCompactLayout;
}

- (void)setWantsCompactLayout:(BOOL)a3
{
  self->_wantsCompactLayout = a3;
}

- (BOOL)reviewing
{
  return self->_reviewing;
}

- (BOOL)picked
{
  return self->_picked;
}

- (BOOL)shouldHideProgressIndicator
{
  return self->_shouldHideProgressIndicator;
}

- (BOOL)shouldSupressViewWillTransitionToSize
{
  return self->_shouldSupressViewWillTransitionToSize;
}

- (void)setShouldSupressViewWillTransitionToSize:(BOOL)a3
{
  self->_shouldSupressViewWillTransitionToSize = a3;
}

- (UIView)_customCenterOverlay
{
  return self->__customCenterOverlay;
}

uint64_t __51__PLPhotoTileViewController_setReviewing_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setAlpha:", *(double *)(a1 + 40));
}

void __51__PLPhotoTileViewController_setReviewing_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 1394))
  {
    objc_msgSend(*(id *)(v1 + 1032), "removeFromSuperview");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032) = 0;
  }
}

id __76__PLPhotoTileViewController__newImageForAsset_targetSize_cropRect_fullSize___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __83__PLPhotoTileViewController__handleFullSizeImageRequestResult_dataUTI_orientation___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *Log;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "pixelWidth");
  v3 = (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "pixelHeight");
  v4 = *(_QWORD *)(a1 + 56);
  PLGetOrientationAndUntransformedSizeFromImageData();
  PLOrientationTransformImageSize();
  v6 = v5;
  v8 = v7;
  v9 = PLImageOrientationFromExifOrientation();
  v10 = v9;
  if (v6 != v2 || v8 != v3 || v9 != v4)
  {
    Log = PLPhotoKitGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992);
      *(_DWORD *)buf = 138413826;
      v17 = v14;
      v18 = 2048;
      v19 = v2;
      v20 = 2048;
      v21 = v3;
      v22 = 2048;
      v23 = v4;
      v24 = 2048;
      v25 = v6;
      v26 = 2048;
      v27 = v8;
      v28 = 2048;
      v29 = v10;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_ERROR, "Mis-matched image size and/or orientation for asset %@. PhotoKit: %.0f x %.0f (%ld). Data: %.0f x %.0f (%ld)", buf, 0x48u);
    }
  }
  return pl_dispatch_async();
}

uint64_t __83__PLPhotoTileViewController__handleFullSizeImageRequestResult_dataUTI_orientation___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "localIdentifier"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setFullSizeImageJPEGData:size:orientation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return result;
}

uint64_t __50__PLPhotoTileViewController__requestFullSizeImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFullSizeImageRequestResult:dataUTI:orientation:", a2, a3, PLImageOrientationFromExifOrientation());
}

id *__43__PLPhotoTileViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id *result;
  id *v2;

  result = (id *)objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v2 = result;
    if ((*((_BYTE *)result + 1338) & 2) != 0)
      objc_msgSend(result[124], "uuid");
    return (id *)objc_msgSend(v2, "_teardownDispatchTimer");
  }
  return result;
}

uint64_t __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double *v4;
  double v5;
  double v6;
  _BYTE *v7;
  uint64_t v8;
  double v9;
  double v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "zoomScale");
  v3 = v2;
  v4 = *(double **)(a1 + 32);
  v5 = v4[153];
  v6 = v4[154];
  objc_msgSend(v4, "updateZoomScales");
  v7 = *(_BYTE **)(a1 + 32);
  if (v7[1128])
    v8 = 1232;
  else
    v8 = 1224;
  if (v7[1128])
    v9 = v6;
  else
    v9 = v5;
  v10 = v3 * (*(double *)&v7[v8] / v9);
  *(float *)&v10 = v10;
  objc_msgSend(v7, "setZoomScale:", v10);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "updateScaleMode");
}

uint64_t __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "transitionDuration");
  return objc_msgSend(v2, "_performRotationUpdatesWithDuration:size:");
}

uint64_t __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_BYTE *)(v1 + 1337) & 2) == 0)
    return objc_msgSend(*(id *)(v1 + 1000), "setAdjustZoomScaleAfterRotation:", 0);
  return result;
}

uint64_t __54__PLPhotoTileViewController_setBadgeVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showBadgeViewIfAppropriate");
}

+ (BOOL)shouldShowPlaceholderForAsset:(id)a3
{
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  if (a3)
  {
    if ((objc_msgSend(a3, "isCloudPlaceholder") & 1) != 0
      || !objc_msgSend(a3, "complete")
      || (v4 = objc_msgSend(a3, "isTimelapsePlaceholder")) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      PHFullScreenSizeForScreen();
      v6 = v5;
      v8 = v7;
      v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "pl_managedAsset"), "masterThumbnailResource");
      LOBYTE(v4) = (int)objc_msgSend(v9, "localAvailability") < 1
                || v6 >= (double)objc_msgSend(v9, "orientedWidth")
                || v8 >= (double)objc_msgSend(v9, "orientedHeight");
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (CGSize)tileSize
{
  double v2;
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *(double *)&__TileSize_0;
  if (*(double *)&__TileSize_0 == 0.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", *(double *)&__TileSize_0), "bounds");
    v4 = *(double *)&v3;
    __TileSize_1 = v3;
    v2 = v5 + 40.0;
    *(double *)&__TileSize_0 = v5 + 40.0;
  }
  else
  {
    v4 = *(double *)&__TileSize_1;
  }
  result.height = v4;
  result.width = v2;
  return result;
}

+ (CGSize)tvOutTileSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGSize result;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(double *)&__TVOutTileSize_0 == 0.0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CEA950], "screens", *(double *)&__TVOutTileSize_0);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (v7 != (void *)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"))
          {
            if (v7)
            {
              objc_msgSend(v7, "bounds");
              __TVOutTileSize_0 = v8;
              __TVOutTileSize_1 = v9;
            }
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          continue;
        break;
      }
    }
  }
LABEL_13:
  v10 = *(double *)&__TVOutTileSize_0;
  v11 = *(double *)&__TVOutTileSize_1;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 imageRef:(CGImage *)a4 imageOrientation:(int64_t)a5 allowZoomToFill:(BOOL)a6 mode:(int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  PLPhotoTileViewController *v14;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:imageOrientation:", a4, a5);
  v14 = -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:]([PLPhotoTileViewController alloc], "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", 0, v13, 0, PLDeviceOrientationFromImageOrientation(), v8, v7, x, y, width, height);

  return v14;
}

+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 image:(id)a4 allowZoomToFill:(BOOL)a5 mode:(int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "imageOrientation");
  return -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:]([PLPhotoTileViewController alloc], "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", 0, a4, 0, PLDeviceOrientationFromImageOrientation(), v7, v6, x, y, width, height);
}

+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 modelPhoto:(id)a4 mode:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  double y;
  double x;
  id v11;

  v5 = *(_QWORD *)&a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setDeliveryMode:", 2);
  return -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:]([PLPhotoTileViewController alloc], "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", a4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager"), "synchronousImageForAsset:targetSize:contentMode:options:", a4, 0, v11, 160.0, 120.0), 1, 1, 1, v5, x, y, width, height);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

@end
