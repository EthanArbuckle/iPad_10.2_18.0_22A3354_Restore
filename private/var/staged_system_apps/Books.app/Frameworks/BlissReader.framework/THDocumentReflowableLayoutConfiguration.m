@implementation THDocumentReflowableLayoutConfiguration

- (BOOL)allowsScrollMode
{
  return 1;
}

- (double)chromeAnimationInterval
{
  return 0.15;
}

- (int64_t)columnCount
{
  if (-[THDocumentReflowableLayoutConfiguration hasSpreadPages](self, "hasSpreadPages"))
    return 2;
  else
    return 1;
}

- (CGPoint)pageNumberPosition
{
  double v2;
  double v3;
  CGPoint result;

  CGRectGetCenter(-[THDocumentReflowableLayoutConfiguration bottomFullWidthToolbarFrame](self, "bottomFullWidthToolbarFrame"));
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_manageSafeAreaInsets
{
  return 0;
}

- (UIEdgeInsets)contentInsets
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
  double v15;
  objc_super v16;
  UIEdgeInsets result;

  v16.receiver = self;
  v16.super_class = (Class)THDocumentReflowableLayoutConfiguration;
  -[THDocumentReflowableLayoutConfiguration contentInsets](&v16, "contentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[THDocumentReflowableLayoutConfiguration layout](self, "layout") != (char *)&dword_0 + 2)
  {
    -[THDocumentReflowableLayoutConfiguration _contentInsetScrubberVerticalPadding](self, "_contentInsetScrubberVerticalPadding");
    v8 = v8 + v11;
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)scrubberLeftRightInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THDocumentReflowableLayoutConfiguration;
  -[THDocumentReflowableLayoutConfiguration scrubberLeftRightInset](&v9, "scrubberLeftRightInset");
  v4 = v3;
  if (-[THDocumentReflowableLayoutConfiguration layout](self, "layout") == (char *)&dword_0 + 1)
  {
    objc_msgSend(-[THDocumentReflowableLayoutConfiguration environment](self, "environment"), "safeAreaInsets");
    if (v5 >= v6)
      v7 = v5;
    else
      v7 = v6;
    return v4 + v7;
  }
  return v4;
}

- (double)_noteSideLengthAtScale:(double)a3
{
  double result;

  +[AEAnnotationMarker imageSizeForScale:](AEAnnotationMarker, "imageSizeForScale:", a3);
  return result;
}

- (double)noteSideLength
{
  double result;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  -[THDocumentReflowableLayoutConfiguration _noteSideLengthAtScale:](self, "_noteSideLengthAtScale:");
  return result;
}

- (UIEdgeInsets)noteEdgeInsetsAtScale:(double)a3
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  objc_msgSend(-[THDocumentReflowableLayoutConfiguration environment](self, "environment"), "safeAreaInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[THDocumentReflowableLayoutConfiguration _noteSideLengthAtScale:](self, "_noteSideLengthAtScale:", a3);
  v14 = v13;
  -[THDocumentReflowableLayoutConfiguration gutterWidth](self, "gutterWidth");
  v16 = ceil((v15 - v14) * 0.5);
  v17 = v8 + v16;
  v18 = v12 + v16;
  v19 = v6;
  v20 = v10;
  result.right = v18;
  result.bottom = v20;
  result.left = v17;
  result.top = v19;
  return result;
}

- (double)_contentInsetScrubberVerticalPadding
{
  unsigned int v2;
  double result;

  v2 = objc_msgSend(-[THDocumentReflowableLayoutConfiguration environment](self, "environment"), "isLandscape");
  result = 20.0;
  if (v2)
    return 16.0;
  return result;
}

@end
