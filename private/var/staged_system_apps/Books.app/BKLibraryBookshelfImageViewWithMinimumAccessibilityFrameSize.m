@implementation BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize

+ (double)accessibilityAcceptableMinimumSizeForDimension
{
  return 44.0;
}

- (BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize)initWithFrame:(CGRect)a3
{
  BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize;
  v3 = -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityAcceptableMinimumSizeForDimension](BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize, "accessibilityAcceptableMinimumSizeForDimension");
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityFrameMinimumWidth:](v3, "setAccessibilityFrameMinimumWidth:");
    +[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityAcceptableMinimumSizeForDimension](BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize, "accessibilityAcceptableMinimumSizeForDimension");
    -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize setAccessibilityFrameMinimumHeight:](v3, "setAccessibilityFrameMinimumHeight:");
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
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
  CGFloat v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize;
  -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityFrame](&v18, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityFrameMinimumHeight](self, "accessibilityFrameMinimumHeight");
  v12 = v11 - v10;
  if (v12 <= 0.0)
    v13 = 0.0;
  else
    v13 = v12 * 0.5;
  -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize accessibilityFrameMinimumWidth](self, "accessibilityFrameMinimumWidth");
  v15 = v14 - v8;
  if (v15 <= 0.0)
    v16 = 0.0;
  else
    v16 = v15 * 0.5;
  v17 = -v16;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  return CGRectInset(v19, v17, -v13);
}

- (double)accessibilityFrameMinimumHeight
{
  return self->_accessibilityFrameMinimumHeight;
}

- (void)setAccessibilityFrameMinimumHeight:(double)a3
{
  self->_accessibilityFrameMinimumHeight = a3;
}

- (double)accessibilityFrameMinimumWidth
{
  return self->_accessibilityFrameMinimumWidth;
}

- (void)setAccessibilityFrameMinimumWidth:(double)a3
{
  self->_accessibilityFrameMinimumWidth = a3;
}

@end
