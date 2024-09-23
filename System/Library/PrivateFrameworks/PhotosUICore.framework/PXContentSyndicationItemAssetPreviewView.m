@implementation PXContentSyndicationItemAssetPreviewView

- (PXContentSyndicationItemAssetPreviewView)initWithFrame:(CGRect)a3
{
  PXContentSyndicationItemAssetPreviewView *v3;
  NSArray *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  PXContentSyndicationStackedImageView *v10;
  PXContentSyndicationStackedImageView *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *imageViews;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXContentSyndicationItemAssetPreviewView;
  v3 = -[PXContentSyndicationItemAssetPreviewView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = 1;
    do
    {
      v10 = -[PXContentSyndicationStackedImageView initWithFrame:]([PXContentSyndicationStackedImageView alloc], "initWithFrame:", v5, v6, v7, v8);
      v11 = v10;
      v12 = v9 - 1;
      if (v9 == 1)
      {
        -[PXContentSyndicationItemAssetPreviewView traitCollection](v3, "traitCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXContentSyndicationStackedImageView setDarkenedStyle:](v11, "setDarkenedStyle:", objc_msgSend(v13, "userInterfaceStyle") != 2);

      }
      else
      {
        -[PXContentSyndicationStackedImageView setBlurred:](v10, "setBlurred:", 1);
        -[PXContentSyndicationStackedImageView setCornerRadius:](v11, "setCornerRadius:", 16.0);
        if (v9)
          v14 = 3;
        else
          v14 = 2;
        -[PXContentSyndicationStackedImageView setDarkenedStyle:](v11, "setDarkenedStyle:", v14);
      }
      -[NSArray addObject:](v4, "addObject:", v11);
      -[PXContentSyndicationItemAssetPreviewView insertSubview:atIndex:](v3, "insertSubview:atIndex:", v11, 0);

      v9 = v12;
    }
    while (v12 != -2);
    imageViews = v3->_imageViews;
    v3->_imageViews = v4;

    -[PXContentSyndicationItemAssetPreviewView setAccessibilityIgnoresInvertColors:](v3, "setAccessibilityIgnoresInvertColors:", 1);
  }
  return v3;
}

- (int64_t)maximumPreviewCount
{
  return 3;
}

- (void)setVisiblePreviewCount:(int64_t)a3
{
  if (self->_visiblePreviewCount != a3)
  {
    self->_visiblePreviewCount = a3;
    -[PXContentSyndicationItemAssetPreviewView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPreviewImage:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PXContentSyndicationItemAssetPreviewView imageViews](self, "imageViews");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (void)setOverlayTitle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[PXContentSyndicationItemAssetPreviewView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOverlayTitle:", v4);
  v6 = objc_msgSend(v4, "length");

  objc_msgSend(v7, "setHasBottomDarkGradient:", v6 != 0);
}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  void *v2;
  void *v3;
  void *v4;

  -[PXContentSyndicationItemAssetPreviewView imageViews](self, "imageViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "regionOfInterestForOneUpTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXRegionOfInterest *)v4;
}

- (PXFocusInfo)focusInfo
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_imageViews, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXFocusInfo focusInfoWithView:](PXFocusInfo, "focusInfoWithView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setWantsInnerBorder:", 1);
  objc_msgSend(v3, "setWantsOuterBorder:", 1);
  return (PXFocusInfo *)v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXContentSyndicationItemAssetPreviewView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    -[PXContentSyndicationItemAssetPreviewView traitCollection](self, "traitCollection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "userInterfaceStyle") != 2;
    -[NSArray firstObject](self->_imageViews, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDarkenedStyle:", v7);

  }
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  double v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  int64_t v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double MidX;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22.receiver = self;
  v22.super_class = (Class)PXContentSyndicationItemAssetPreviewView;
  -[PXContentSyndicationItemAssetPreviewView layoutSubviews](&v22, sel_layoutSubviews);
  -[PXContentSyndicationItemAssetPreviewView bounds](self, "bounds");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetMidY(v24);
  PXRectWithCenterAndSize();
  -[PXContentSyndicationItemAssetPreviewView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  if (v8 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");

  }
  for (i = 0; i != 3; ++i)
  {
    -[PXContentSyndicationItemAssetPreviewView imageViews](self, "imageViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PXContentSyndicationItemAssetPreviewView visiblePreviewCount](self, "visiblePreviewCount");
    if (i < v13)
    {
      PXEdgeInsetsScale();
      PXRectRoundToPixel();
      v14 = v25.origin.x;
      v15 = v25.origin.y;
      v16 = v25.size.width;
      v17 = v25.size.height;
      MidX = CGRectGetMidX(v25);
      v26.origin.x = v14;
      v26.origin.y = v15;
      v26.size.width = v16;
      v26.size.height = v17;
      objc_msgSend(v12, "setCenter:", MidX, CGRectGetMidY(v26));
      objc_msgSend(v12, "setBounds:", 0.0, 0.0, v16, v17);
      CGAffineTransformMakeTranslation(&v21, 0.0, (double)i * -10.0 + (double)i * -5.0);
      objc_msgSend(v12, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v21;
      objc_msgSend(v19, "setAffineTransform:", &v20);

    }
    objc_msgSend(v12, "setHidden:", i >= v13);

  }
}

- (int64_t)visiblePreviewCount
{
  return self->_visiblePreviewCount;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (NSAttributedString)overlayTitle
{
  return self->_overlayTitle;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_overlayTitle, 0);
}

@end
