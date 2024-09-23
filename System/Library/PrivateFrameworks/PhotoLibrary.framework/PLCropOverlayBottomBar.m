@implementation PLCropOverlayBottomBar

- (void)_commonPLCropOverlayBottomBarInitialization
{
  self->_style = 0;
  self->_inPopover = 0;
  self->_playingVideo = 0;
}

- (PLCropOverlayBottomBar)initWithFrame:(CGRect)a3
{
  PLCropOverlayBottomBar *v3;
  PLCropOverlayBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayBottomBar;
  v3 = -[PLCropOverlayBottomBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PLCropOverlayBottomBar _commonPLCropOverlayBottomBarInitialization](v3, "_commonPLCropOverlayBottomBarInitialization");
  return v4;
}

- (PLCropOverlayBottomBar)initWithCoder:(id)a3
{
  PLCropOverlayBottomBar *v3;
  PLCropOverlayBottomBar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCropOverlayBottomBar;
  v3 = -[PLCropOverlayBottomBar initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PLCropOverlayBottomBar _commonPLCropOverlayBottomBarInitialization](v3, "_commonPLCropOverlayBottomBarInitialization");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayBottomBar;
  -[PLCropOverlayBottomBar dealloc](&v3, sel_dealloc);
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLCropOverlayBottomBar;
  -[PLCropOverlayBottomBar layoutSubviews](&v11, sel_layoutSubviews);
  -[PLCropOverlayBottomBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PLCropOverlayPreviewBottomBar setFrame:](self->_previewBottomBar, "setFrame:");
  -[PLCropOverlayWallpaperBottomBar setFrame:](self->_wallpaperBottomBar, "setFrame:", v4, v6, v8, v10);
}

- (void)setCameraBottomBar:(id)a3
{
  UIView *cameraBottomBar;

  cameraBottomBar = self->_cameraBottomBar;
  if (cameraBottomBar != a3)
  {

    self->_cameraBottomBar = (UIView *)a3;
    -[PLCropOverlayBottomBar _updateBottomBars](self, "_updateBottomBars");
  }
}

- (void)setPreviewBottomBar:(id)a3
{
  PLCropOverlayPreviewBottomBar *previewBottomBar;
  PLCropOverlayPreviewBottomBar *v6;

  previewBottomBar = self->_previewBottomBar;
  if (previewBottomBar != a3)
  {
    -[PLCropOverlayPreviewBottomBar removeFromSuperview](previewBottomBar, "removeFromSuperview");

    v6 = (PLCropOverlayPreviewBottomBar *)a3;
    self->_previewBottomBar = v6;
    -[PLCropOverlayBottomBar addSubview:](self, "addSubview:", v6);
    -[PLCropOverlayBottomBar _updateBottomBars](self, "_updateBottomBars");
  }
}

- (void)setWallpaperBottomBar:(id)a3
{
  PLCropOverlayWallpaperBottomBar *wallpaperBottomBar;
  PLCropOverlayWallpaperBottomBar *v6;

  wallpaperBottomBar = self->_wallpaperBottomBar;
  if (wallpaperBottomBar != a3)
  {
    -[PLCropOverlayWallpaperBottomBar removeFromSuperview](wallpaperBottomBar, "removeFromSuperview");

    v6 = (PLCropOverlayWallpaperBottomBar *)a3;
    self->_wallpaperBottomBar = v6;
    -[PLCropOverlayBottomBar addSubview:](self, "addSubview:", v6);
    -[PLCropOverlayBottomBar _updateBottomBars](self, "_updateBottomBars");
  }
}

- (void)setStyle:(int64_t)a3
{
  -[PLCropOverlayBottomBar setStyle:animated:](self, "setStyle:animated:", a3, 0);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_style != a3)
  {
    self->_style = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__PLCropOverlayBottomBar_setStyle_animated___block_invoke;
    v4[3] = &unk_1E70B6370;
    v4[4] = self;
    if (a4)
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.3);
    else
      -[PLCropOverlayBottomBar _updateStyle](self, "_updateStyle");
  }
}

- (void)setPlayingVideo:(BOOL)a3
{
  if (self->_playingVideo != a3)
  {
    self->_playingVideo = a3;
    -[PLCropOverlayBottomBar _updatePreviewBottomBarForPlaybackState](self, "_updatePreviewBottomBarForPlaybackState");
  }
}

- (void)togglePlaybackState
{
  -[PLCropOverlayBottomBar setPlayingVideo:](self, "setPlayingVideo:", !self->_playingVideo);
}

- (void)setInPopover:(BOOL)a3
{
  if (self->_inPopover != a3)
  {
    self->_inPopover = a3;
    -[PLCropOverlayBottomBar _updateBottomBars](self, "_updateBottomBars");
  }
}

- (void)_updateBottomBars
{
  -[PLCropOverlayBottomBar _updateStyle](self, "_updateStyle");
  -[PLCropOverlayBottomBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updatePreviewBottomBarForPlaybackState
{
  UIButton *v3;
  _BOOL4 playingVideo;
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  v3 = -[PLCropOverlayPreviewBottomBar playbackButton](self->_previewBottomBar, "playbackButton");
  playingVideo = self->_playingVideo;
  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = PLPhotoLibraryFrameworkBundle();
  if (playingVideo)
    v7 = CFSTR("PLCameraPickerPause.png");
  else
    v7 = CFSTR("PLCameraPickerPlay.png");
  -[UIButton setImage:forState:](v3, "setImage:forState:", objc_msgSend(v5, "imageNamed:inBundle:", v7, v6), 0);
  -[PLCropOverlayPreviewBottomBar setNeedsLayout](self->_previewBottomBar, "setNeedsLayout");
}

- (BOOL)_isEditingStyle:(int64_t)a3
{
  return (unint64_t)(self->_style - 1) < 2;
}

- (void)_updateStyle
{
  double v3;
  double v4;
  int64_t style;
  UIButton *v6;

  v3 = 0.0;
  if (self->_style)
    v4 = 0.0;
  else
    v4 = 1.0;
  if (-[PLCropOverlayBottomBar _isEditingStyle:](self, "_isEditingStyle:"))
    v3 = 1.0;
  -[UIView setAlpha:](self->_cameraBottomBar, "setAlpha:", v4);
  -[PLCropOverlayPreviewBottomBar setAlpha:](self->_previewBottomBar, "setAlpha:", v3);
  style = self->_style;
  v6 = -[PLCropOverlayPreviewBottomBar playbackButton](self->_previewBottomBar, "playbackButton");
  if (style == 2)
  {
    -[UIButton setHidden:](v6, "setHidden:", 0);
    -[PLCropOverlayBottomBar _updatePreviewBottomBarForPlaybackState](self, "_updatePreviewBottomBarForPlaybackState");
  }
  else
  {
    -[UIButton setHidden:](v6, "setHidden:", 1);
  }
}

- (int64_t)style
{
  return self->_style;
}

- (UIView)cameraBottomBar
{
  return self->_cameraBottomBar;
}

- (PLCropOverlayPreviewBottomBar)previewBottomBar
{
  return self->_previewBottomBar;
}

- (PLCropOverlayWallpaperBottomBar)wallpaperBottomBar
{
  return self->_wallpaperBottomBar;
}

- (BOOL)isPlayingVideo
{
  return self->_playingVideo;
}

- (BOOL)isInPopover
{
  return self->_inPopover;
}

uint64_t __44__PLCropOverlayBottomBar_setStyle_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyle");
}

@end
