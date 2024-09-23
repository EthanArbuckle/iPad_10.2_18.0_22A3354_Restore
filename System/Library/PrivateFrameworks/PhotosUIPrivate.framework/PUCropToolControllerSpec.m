@implementation PUCropToolControllerSpec

- (double)cropRectMargin
{
  return 16.0;
}

- (CGSize)cropActionButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)minimumCropInset
{
  void *v2;
  double v3;
  double v4;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cropSideMargins");
  v4 = v3;

  return v4;
}

- (CGSize)minimumCropSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PUCropToolControllerSpec cropHandleViewLineThickness](self, "cropHandleViewLineThickness");
  v4 = v3;
  -[PUCropToolControllerSpec cropHandleViewLineMargin](self, "cropHandleViewLineMargin");
  v6 = v4 + v5;
  -[PUCropToolControllerSpec minimumCropHandleViewSize](self, "minimumCropHandleViewSize");
  v9 = v7 - v6 + v7 - v6;
  v10 = v8 - v6 + v8 - v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)cropHandleViewLineMargin
{
  return 10.0;
}

- (double)cropHandleViewLineThickness
{
  return 2.0;
}

- (double)standardBottomBarHeight
{
  return 141.0;
}

- (double)standardSideBarWidth
{
  return 141.0;
}

- (double)leftInsetForiPad
{
  return 80.0;
}

- (double)standardBottomBarWidth
{
  return 240.0;
}

- (double)standardSideBarHeight
{
  return 240.0;
}

- (PXLabelSpec)cropHeaderLabelSpec
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  PXFontWithTextStyle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  return (PXLabelSpec *)v2;
}

- (double)cropAspectRatioScrollHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[PUPhotoEditToolControllerSpec isiPadLayout](self, "isiPadLayout");
  result = 105.0;
  if (!v2)
    return 21.0;
  return result;
}

- (double)cropAspectFlipperWidth
{
  return 180.0;
}

- (UIEdgeInsets)cropAspectRatioScrollContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 90.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 90.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)cropAspectRatioButtonTitleInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = -20.0;
  v4 = 0.0;
  v5 = -20.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIColor)cropAspectButtonColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)cropAspectButtonSelectedColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

@end
