@implementation PXStoryMemoryFeedViewLayoutSpec

- (PXStoryMemoryFeedViewLayoutSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedViewLayoutSpecManager.m"), 109, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryFeedViewLayoutSpec init]");

  abort();
}

- (PXStoryMemoryFeedViewLayoutSpec)initWithMemoriesSpec:(id)a3
{
  id v6;
  PXStoryMemoryFeedViewLayoutSpec *v7;
  PXStoryMemoryFeedViewLayoutSpec *v8;
  uint64_t v9;
  PXScrollBehavior *scrollBehavior;
  void *v11;
  double v12;
  uint64_t v13;
  NSShadow *itemShadow;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedViewLayoutSpecManager.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memoriesSpec != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PXStoryMemoryFeedViewLayoutSpec;
  v7 = -[PXStoryMemoryFeedViewLayoutSpec init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_memoriesSpec, a3);
    +[PXScrollBehavior normalBehaviorWithAxis:](PXScrollBehavior, "normalBehaviorWithAxis:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    scrollBehavior = v8->_scrollBehavior;
    v8->_scrollBehavior = (PXScrollBehavior *)v9;

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "feedItemCornerRadius");
    v8->_itemCornerRadius = v12;
    if ((objc_msgSend(v11, "wantsFeedItemShadow") & 1) != 0)
    {
      objc_msgSend(v11, "feedItemShadow");
      v13 = objc_claimAutoreleasedReturnValue();
      itemShadow = v8->_itemShadow;
      v8->_itemShadow = (NSShadow *)v13;
    }
    else
    {
      itemShadow = v8->_itemShadow;
      v8->_itemShadow = 0;
    }

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
  void *v2;
  char v3;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsFullscreenFeedExperience");

  return v3;
}

- (BOOL)wantsItemHoverEvents
{
  void *v2;
  char v3;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showFeedChromeOnHover");

  return v3;
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
  int64_t result;
  void *v4;
  void *v5;

  result = self->_rootLayoutOrientation;
  if (!result)
  {
    -[PXStoryMemoryFeedViewLayoutSpec memoriesSpec](self, "memoriesSpec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootExtendedTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_rootLayoutOrientation = objc_msgSend(v5, "layoutOrientation");

    return self->_rootLayoutOrientation;
  }
  return result;
}

- (BOOL)allowsAutoplayContent
{
  return 1;
}

- (id)layoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height;
  double width;
  PXGridLayoutGenerator *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  PXGridLayoutMetrics *v39;
  double v41;
  double v42;
  double v43;
  double v44;

  height = a3.height;
  width = a3.width;
  if (-[PXStoryMemoryFeedViewLayoutSpec wantsFirstItemFullscreen](self, "wantsFirstItemFullscreen"))
  {
    -[PXStoryMemoryFeedViewLayoutSpec _fullscreenLayoutGeneratorWithReferenceSize:](self, "_fullscreenLayoutGeneratorWithReferenceSize:", width, height);
    v6 = (PXGridLayoutGenerator *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXStoryMemoryFeedViewLayoutSpec memoriesSpec](self, "memoriesSpec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "userInterfaceIdiom");
    v11 = -[PXStoryMemoryFeedViewLayoutSpec rootLayoutOrientation](self, "rootLayoutOrientation") == 2 || v9 == 4;
    v12 = objc_msgSend(v7, "sizeClass");
    if (v11)
      v13 = 2;
    else
      v13 = 1;
    if (v12 == 2)
      v14 = 2;
    else
      v14 = 0;
    if (v12 >= 2)
      v15 = v14;
    else
      v15 = v13;
    self->_numberOfColumns = v15;
    v44 = height;
    if (v11)
      objc_msgSend(v8, "feedCardLandscapeAspectRatio");
    else
      objc_msgSend(v8, "feedCardPortraitAspectRatio");
    v43 = v16;
    objc_msgSend(v7, "feedInteritemSpacing");
    if (v17 >= 20.0)
      v18 = v17;
    else
      v18 = 20.0;
    objc_msgSend(v7, "feedEntryEdgeInsets");
    v23 = v20;
    v24 = v22;
    if (v19 >= v18)
      v25 = v19;
    else
      v25 = v18;
    if (v21 >= v18)
      v26 = v21;
    else
      v26 = v18;
    v42 = v26;
    v41 = width - v20 - v22;
    objc_msgSend(v7, "safeAreaInsets");
    v27 = PXEdgeInsetsMax();
    MEMORY[0x1A85CD660](v27, v43, width - v28 - v29, height - v30 - v31 + v18 * -2.0);
    PXSizeMin();
    v33 = v32;
    v35 = v34;
    v36 = (v41 - -(v18 - (double)v15 * (v18 + v32))) * 0.5;
    v37 = v23 + v36;
    v38 = v24 + v36;
    v39 = objc_alloc_init(PXGridLayoutMetrics);
    -[PXLayoutMetrics setReferenceSize:](v39, "setReferenceSize:", width, v44);
    -[PXGridLayoutMetrics setAxis:](v39, "setAxis:", 1);
    -[PXGridLayoutMetrics setContentInsets:](v39, "setContentInsets:", v25, v37, v42, v38);
    -[PXGridLayoutMetrics setItemSize:](v39, "setItemSize:", v33, v35);
    -[PXGridLayoutMetrics setInterItemSpacing:](v39, "setInterItemSpacing:", v18, v18);
    v6 = -[PXGridLayoutGenerator initWithMetrics:]([PXGridLayoutGenerator alloc], "initWithMetrics:", v39);

  }
  return v6;
}

- (id)_fullscreenLayoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PXScrollBehavior *v15;
  PXScrollBehavior *scrollBehavior;
  PXOverlayFeedLayoutMetrics *v17;
  PXOverlayFeedLayoutGenerator *v18;

  height = a3.height;
  width = a3.width;
  -[PXStoryMemoryFeedViewLayoutSpec memoriesSpec](self, "memoriesSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfColumns = 4;
  objc_msgSend(v6, "feedEntryEdgeInsets");
  if (v8 >= 12.0)
    v10 = v8;
  else
    v10 = 12.0;
  if (v9 >= 12.0)
    v11 = v9;
  else
    v11 = 12.0;
  v12 = (width + -24.0 + -24.0 - (double)(self->_numberOfColumns - 1) * 12.0) / (double)self->_numberOfColumns;
  objc_msgSend(v7, "feedCardLandscapeAspectRatio");
  v14 = v12 / v13 * 0.5;
  self->_overlayFeedPeekDistance = v14;
  +[PXScrollBehavior normalBehaviorWithAxis:intrinsicContentOffset:](PXScrollBehavior, "normalBehaviorWithAxis:intrinsicContentOffset:", 1, height - v14);
  v15 = (PXScrollBehavior *)objc_claimAutoreleasedReturnValue();
  scrollBehavior = self->_scrollBehavior;
  self->_scrollBehavior = v15;

  v17 = objc_alloc_init(PXOverlayFeedLayoutMetrics);
  -[PXLayoutMetrics setReferenceSize:](v17, "setReferenceSize:", width, height);
  -[PXOverlayFeedLayoutMetrics setContentInsets:](v17, "setContentInsets:", v10, 24.0, v11, 24.0);
  -[PXOverlayFeedLayoutMetrics setInterItemSpacing:](v17, "setInterItemSpacing:", 12.0, 12.0);
  -[PXOverlayFeedLayoutMetrics setFirstRowTopMargin:](v17, "setFirstRowTopMargin:", -self->_overlayFeedPeekDistance);
  objc_msgSend(v7, "feedCardLandscapeAspectRatio");
  -[PXOverlayFeedLayoutMetrics setRegularItemAspectRatio:](v17, "setRegularItemAspectRatio:");
  objc_msgSend(v7, "feedCardWideLandscapeAspectRatio");
  -[PXOverlayFeedLayoutMetrics setLargeItemAspectRatio:](v17, "setLargeItemAspectRatio:");
  -[PXOverlayFeedLayoutMetrics setUseSimpleLayout:](v17, "setUseSimpleLayout:", objc_msgSend(v7, "useSimpleOverlayFeedLayout"));
  v18 = -[PXOverlayFeedLayoutGenerator initWithMetrics:]([PXOverlayFeedLayoutGenerator alloc], "initWithMetrics:", v17);

  return v18;
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

- (PXMemoriesSpec)memoriesSpec
{
  return self->_memoriesSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoriesSpec, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_itemShadow, 0);
  objc_storeStrong((id *)&self->_scrollBehavior, 0);
}

@end
