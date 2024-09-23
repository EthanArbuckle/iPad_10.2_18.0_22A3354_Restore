@implementation PXStoryMemoryFeedItemExtendedTraitCollection

- (PXStoryMemoryFeedItemExtendedTraitCollection)initWithSpecManager:(id)a3 initialReferenceSize:(CGSize)a4 isFullscreen:(BOOL)a5
{
  double height;
  double width;
  id v9;
  PXStoryMemoryFeedItemExtendedTraitCollection *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  NSShadow *viewportShadow;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryMemoryFeedItemExtendedTraitCollection;
  v10 = -[PXStoryExtendedTraitCollection initWithLayoutReferenceSize:](&v18, sel_initWithLayoutReferenceSize_, width, height);
  if (v10)
  {
    objc_msgSend(v9, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a5)
    {
      objc_msgSend(v11, "overlayFeedPeekDistance");
      v10->_bottomTitleContentOffset = v13;
    }
    else
    {
      objc_msgSend(v11, "itemCornerRadius");
      v10->_viewportCornerRadius = v14;
      objc_msgSend(v12, "itemShadow");
      v15 = objc_claimAutoreleasedReturnValue();
      viewportShadow = v10->_viewportShadow;
      v10->_viewportShadow = (NSShadow *)v15;

    }
    v10->_isFullscreen = a5;
    v10->_userInterfaceFeature = 1;

  }
  return v10;
}

- (double)viewportCornerRadius
{
  return self->_viewportCornerRadius;
}

- (id)viewportShadow
{
  return self->_viewportShadow;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (double)bottomTitleContentOffset
{
  return self->_bottomTitleContentOffset;
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportShadow, 0);
}

@end
