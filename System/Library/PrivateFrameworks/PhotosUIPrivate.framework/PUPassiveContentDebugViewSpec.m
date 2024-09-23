@implementation PUPassiveContentDebugViewSpec

- (PUPassiveContentDebugViewSpec)initWithViewMode:(unint64_t)a3
{
  PUPassiveContentDebugViewSpec *v4;
  PUPassiveContentDebugViewSpec *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUPassiveContentDebugViewSpec;
  v4 = -[PUPassiveContentDebugViewSpec init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_viewMode = a3;
    v4->_shouldShowClockOverlay = objc_msgSend((id)objc_opt_class(), "shouldShowClockOverlayForViewMode:", a3);
    v5->_cropMode = objc_msgSend((id)objc_opt_class(), "cropModeForViewMode:", a3);
  }
  return v5;
}

- (UIEdgeInsets)collectionViewContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  v3 = 10.0;
  v4 = 10.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)headerReferenceSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  v5 = 30.0;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)headerInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 15.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)itemSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  v6 = (v5 + -20.0) / 3.0 + -8.0;
  switch(-[PUPassiveContentDebugViewSpec viewMode](self, "viewMode"))
  {
    case 0uLL:
    case 2uLL:
      PXSizeGetAspectRatio();
      v8 = v6 / v7;
      break;
    case 1uLL:
      v8 = v6 + 30.0;
      break;
    case 3uLL:
      +[PUAmbientPhotoFrameSettings sharedInstance](PUAmbientPhotoFrameSettings, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PUWatchFaceHelper screenBoundsForWatchType:](PUWatchFaceHelper, "screenBoundsForWatchType:", objc_msgSend(v9, "watchType"));
      PXSizeGetAspectRatio();
      v8 = v6 / v10;

      break;
    default:
      v8 = 0.0;
      v6 = 0.0;
      break;
  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (Class)collectionViewCellClass
{
  void *v2;

  if (-[PUPassiveContentDebugViewSpec viewMode](self, "viewMode") <= 3)
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v2;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (BOOL)shouldShowClockOverlay
{
  return self->_shouldShowClockOverlay;
}

- (unint64_t)cropMode
{
  return self->_cropMode;
}

+ (BOOL)shouldShowClockOverlayForViewMode:(unint64_t)a3
{
  return a3 == 3 || a3 == 0;
}

+ (unint64_t)cropModeForViewMode:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return qword_1AB0EFF20[a3 - 1];
}

@end
