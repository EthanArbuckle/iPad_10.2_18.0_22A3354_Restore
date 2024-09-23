@implementation PXTripsFeedViewLayoutSpec

- (PXTripsFeedViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXTripsFeedViewLayoutSpec *v7;
  uint64_t v8;
  PXScrollBehavior *scrollBehavior;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXTripsFeedViewLayoutSpec;
  v7 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v19, sel_initWithExtendedTraitCollection_options_, v6, a4);
  if (v7)
  {
    +[PXScrollBehavior normalBehaviorWithAxis:](PXScrollBehavior, "normalBehaviorWithAxis:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    scrollBehavior = v7->_scrollBehavior;
    v7->_scrollBehavior = (PXScrollBehavior *)v8;

    v7->_feedInteritemSpacing = 11.0;
    v7->_feedAxis = 1;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "feedItemCornerRadius");
    v7->_itemCornerRadius = v11;
    v12 = objc_msgSend(v6, "userInterfaceIdiom");
    v7->_idiom = v12;
    objc_msgSend(v6, "layoutReferenceSize");
    v14 = v13;
    if (v12 == 4)
    {
      -[PXTripsFeedViewLayoutSpec _feedInteritemSpacingForReferenceSize:](v7, "_feedInteritemSpacingForReferenceSize:", v13);
      v7->_feedInteritemSpacing = v15;
    }
    else
    {
      +[PXLayoutMetricInterpolator gadgetColumnSpacingSpanSingleSetAInterpolator](PXLayoutMetricInterpolator, "gadgetColumnSpacingSpanSingleSetAInterpolator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForMetric:", v14);
      v7->_feedInteritemSpacing = v17;

    }
  }

  return v7;
}

- (PXTripsFeedViewLayoutSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedViewLayoutSpec.m"), 49, CFSTR("%s is not available as initializer"), "-[PXTripsFeedViewLayoutSpec init]");

  abort();
}

- (double)_feedInteritemSpacingForReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;

  height = a3.height;
  width = a3.width;
  -[PXTripsFeedViewLayoutSpec feedInteritemSpacing](self, "feedInteritemSpacing");
  v8 = v7;
  if (self->_idiom != 4)
    return v8;
  v9 = -[PXTripsFeedViewLayoutSpec feedAxis](self, "feedAxis");
  -[PXFeatureSpec contentGuideInsetsForScrollAxis:](self, "contentGuideInsetsForScrollAxis:", v9);
  switch(v9)
  {
    case 1:
      v15 = width - v11 - v13;
      return v15 * 0.05;
    case 2:
      v15 = height - v10 - v12;
      return v15 * 0.05;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTripsFeedViewLayoutSpec.m"), 61, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return v8;
}

- (BOOL)wantsScrollIndicators
{
  return 1;
}

- (UIEdgeInsets)horizontalScrollIndicatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)off_1E50B8020;
  v3 = *((double *)off_1E50B8020 + 1);
  v4 = *((double *)off_1E50B8020 + 2);
  v5 = *((double *)off_1E50B8020 + 3);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)verticalScrollIndicatorInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)off_1E50B8020;
  v3 = *((double *)off_1E50B8020 + 1);
  v4 = *((double *)off_1E50B8020 + 2);
  v5 = *((double *)off_1E50B8020 + 3);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)wantsSafeAreaInsets
{
  return 1;
}

- (BOOL)wantsFirstItemFullscreen
{
  return 0;
}

- (BOOL)wantsItemHoverEvents
{
  return 0;
}

- (UIEdgeInsets)placeholderMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)off_1E50B8020;
  v3 = *((double *)off_1E50B8020 + 1);
  v4 = *((double *)off_1E50B8020 + 2);
  v5 = *((double *)off_1E50B8020 + 3);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)rootLayoutOrientation
{
  void *v2;
  int64_t v3;

  -[PXFeatureSpec extendedTraitCollection](self, "extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutOrientation");

  return v3;
}

- (BOOL)allowsAutoplayContent
{
  return 1;
}

- (id)layoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unsigned int v10;
  unsigned int v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  PXGridLayoutMetrics *v34;
  PXGridLayoutGenerator *v35;
  double v37;
  double v38;
  double v39;

  height = a3.height;
  width = a3.width;
  v6 = -[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom");
  v7 = -[PXTripsFeedViewLayoutSpec rootLayoutOrientation](self, "rootLayoutOrientation");
  v8 = -[PXFeatureSpec sizeClass](self, "sizeClass");
  if (v6 == 4 || v7 == 2)
    v10 = 2;
  else
    v10 = 1;
  if (v8 == 2)
    v11 = 2;
  else
    v11 = 0;
  if (v8 >= 2)
    v12 = v11;
  else
    v12 = v10;
  self->_numberOfColumns = v12;
  -[PXTripsFeedViewLayoutSpec feedInteritemSpacing](self, "feedInteritemSpacing");
  if (v13 >= 20.0)
    v14 = v13;
  else
    v14 = 20.0;
  -[PXFeatureSpec contentGuideInsetsForScrollAxis:](self, "contentGuideInsetsForScrollAxis:", 1);
  v19 = v16;
  v20 = v18;
  if (v15 < v14)
    v15 = v14;
  if (v17 < v14)
    v17 = v14;
  v38 = v17;
  v39 = v15;
  v21 = width - v16 - v18;
  v37 = width;
  v22 = PXEdgeInsetsMax();
  MEMORY[0x1A85CD660](v22, 1.5, width - v23 - v24, height - v25 - v26 + v14 * -2.0);
  PXSizeMin();
  v28 = v27;
  v30 = v29;
  v31 = (v21 - -(v14 - (double)v12 * (v14 + v27))) * 0.5;
  v32 = v19 + v31;
  v33 = v20 + v31;
  v34 = objc_alloc_init(PXGridLayoutMetrics);
  -[PXLayoutMetrics setReferenceSize:](v34, "setReferenceSize:", v37, height);
  -[PXGridLayoutMetrics setAxis:](v34, "setAxis:", 1);
  -[PXGridLayoutMetrics setContentInsets:](v34, "setContentInsets:", v39, v32, v38, v33);
  -[PXGridLayoutMetrics setItemSize:](v34, "setItemSize:", v28, v30);
  -[PXGridLayoutMetrics setInterItemSpacing:](v34, "setInterItemSpacing:", v14, v14);
  v35 = -[PXGridLayoutGenerator initWithMetrics:]([PXGridLayoutGenerator alloc], "initWithMetrics:", v34);

  return v35;
}

- (PXScrollBehavior)scrollBehavior
{
  return self->_scrollBehavior;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (double)overlayFeedPeekDistance
{
  return self->_overlayFeedPeekDistance;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (NSShadow)itemShadow
{
  return self->_itemShadow;
}

- (UIEdgeInsets)viewOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_viewOutsets.top;
  left = self->_viewOutsets.left;
  bottom = self->_viewOutsets.bottom;
  right = self->_viewOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isFullScreen
{
  return self->_isFullScreen;
}

- (void)setIsFullScreen:(BOOL)a3
{
  self->_isFullScreen = a3;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (UIEdgeInsets)subtitleInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_subtitleInsets.top;
  left = self->_subtitleInsets.left;
  bottom = self->_subtitleInsets.bottom;
  right = self->_subtitleInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)feedInteritemSpacing
{
  return self->_feedInteritemSpacing;
}

- (int64_t)feedAxis
{
  return self->_feedAxis;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_itemShadow, 0);
  objc_storeStrong((id *)&self->_scrollBehavior, 0);
}

@end
