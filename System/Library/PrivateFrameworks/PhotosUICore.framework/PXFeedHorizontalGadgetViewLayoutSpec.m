@implementation PXFeedHorizontalGadgetViewLayoutSpec

- (PXFeedHorizontalGadgetViewLayoutSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedHorizontalGadgetViewLayoutSpecManager.m"), 121, CFSTR("%s is not available as initializer"), "-[PXFeedHorizontalGadgetViewLayoutSpec init]");

  abort();
}

- (PXFeedHorizontalGadgetViewLayoutSpec)initWithGadgetSpec:(id)a3 style:(int64_t)a4
{
  id v6;
  PXFeedHorizontalGadgetViewLayoutSpec *v7;
  PXFeedHorizontalGadgetViewLayoutSpec *v8;
  uint64_t v9;
  void *v10;
  int64_t rootLayoutOrientation;
  void *v12;
  double v13;
  double v14;
  NSShadow *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  NSShadow *itemShadow;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
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
  double v39;
  int v40;
  _BOOL8 v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  PXGridLayoutMetrics *v47;
  PXGridLayoutMetrics *cachedGridLayoutMetrics;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  PXScrollBehavior *scrollBehavior;
  uint64_t v59;
  UIFont *subtitleFont;
  uint64_t v61;
  UIColor *subtitleColor;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v75;
  objc_super v76;

  v6 = a3;
  v76.receiver = self;
  v76.super_class = (Class)PXFeedHorizontalGadgetViewLayoutSpec;
  v7 = -[PXFeedHorizontalGadgetViewLayoutSpec init](&v76, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_style = a4;
    v9 = objc_msgSend(v6, "layoutSizeClass");
    objc_msgSend(v6, "rootExtendedTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_rootLayoutOrientation = objc_msgSend(v10, "layoutOrientation");

    rootLayoutOrientation = v8->_rootLayoutOrientation;
    if (a4 == 1)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "feedItemCornerRadius");
      v8->_itemCornerRadius = v13;
      if (rootLayoutOrientation == 2)
        objc_msgSend(v12, "feedCardLandscapeAspectRatio");
      else
        objc_msgSend(v12, "feedCardPortraitAspectRatio");
      v8->_itemAspectRatio = v14;
      if ((objc_msgSend(v12, "wantsFeedItemShadow") & 1) != 0)
      {
        objc_msgSend(v12, "feedItemShadow");
        v18 = objc_claimAutoreleasedReturnValue();
        itemShadow = v8->_itemShadow;
        v8->_itemShadow = (NSShadow *)v18;
      }
      else
      {
        itemShadow = v8->_itemShadow;
        v8->_itemShadow = 0;
      }

      -[NSShadow shadowBlurRadius](v8->_itemShadow, "shadowBlurRadius");
      -[NSShadow shadowOffset](v8->_itemShadow, "shadowOffset");
      -[NSShadow shadowBlurRadius](v8->_itemShadow, "shadowBlurRadius");
      -[NSShadow shadowOffset](v8->_itemShadow, "shadowOffset");
      PXEdgeInsetsMake();
      v8->_viewOutsets.top = v20;
      v8->_viewOutsets.left = v21;
      v8->_viewOutsets.bottom = v22;
      v8->_viewOutsets.right = v23;

      v17 = 2;
    }
    else
    {
      v8->_itemAspectRatio = 1.5;
      v15 = v8->_itemShadow;
      v8->_itemCornerRadius = 16.0;
      v8->_itemShadow = 0;

      v16 = *((_OWORD *)off_1E50B8020 + 1);
      *(_OWORD *)&v8->_viewOutsets.top = *(_OWORD *)off_1E50B8020;
      *(_OWORD *)&v8->_viewOutsets.bottom = v16;
      v17 = 1;
    }
    v24 = v9 == 1;
    objc_msgSend(v6, "contentInsets");
    v26 = v25;
    v28 = v27;
    PXEdgeInsetsAdd();
    v30 = v29;
    v75 = v31;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v6, "columnWidthForColumnSpan:", 1);
    v37 = v36;
    objc_msgSend(v6, "columnSpacingForColumnSpan:", 1);
    v39 = v38;
    v40 = rootLayoutOrientation != 2 || v24;
    v41 = rootLayoutOrientation != 2 && v24;
    if (v40)
      v42 = 1;
    else
      v42 = v17;
    v43 = v38 * (double)(v42 - 1) + (double)v42 * v37;
    objc_msgSend(v6, "layoutReferenceWidth");
    v45 = v44 - v26 - v28;
    if ((CGFloatIsValid() & (v43 > v45)) != 0)
      v46 = v45;
    else
      v46 = v43;
    v8->_height = floor(v33 + v30 + v46 / v8->_itemAspectRatio);
    v47 = objc_alloc_init(PXGridLayoutMetrics);
    cachedGridLayoutMetrics = v8->_cachedGridLayoutMetrics;
    v8->_cachedGridLayoutMetrics = v47;

    -[PXGridLayoutMetrics setAxis:](v8->_cachedGridLayoutMetrics, "setAxis:", 2);
    -[PXGridLayoutMetrics setContentInsets:](v8->_cachedGridLayoutMetrics, "setContentInsets:", v30, v75, v33, v35);
    -[PXGridLayoutMetrics setInterItemSpacing:](v8->_cachedGridLayoutMetrics, "setInterItemSpacing:", v39, v39);
    v8->_placeholderMargins.top = v30;
    v8->_placeholderMargins.left = v75;
    v8->_placeholderMargins.bottom = v33;
    v8->_placeholderMargins.right = v35;
    objc_msgSend(v6, "layoutReferenceWidth");
    v50 = v49;
    objc_msgSend(v6, "layoutReferenceHeight");
    -[PXFeedHorizontalGadgetViewLayoutSpec _metricsWithReferenceSize:](v8, "_metricsWithReferenceSize:", v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "itemSize");
    v54 = v53;
    objc_msgSend(v52, "interItemSpacing");
    v56 = 0.0;
    +[PXScrollBehavior pagingBehaviorWithAxis:pagingOrigin:pageOffset:decelerationRate:](PXScrollBehavior, "pagingBehaviorWithAxis:pagingOrigin:pageOffset:decelerationRate:", 2, v41, 0.0, v54 + v55);
    v57 = objc_claimAutoreleasedReturnValue();
    scrollBehavior = v8->_scrollBehavior;
    v8->_scrollBehavior = (PXScrollBehavior *)v57;

    PXFontWithTextStyleSymbolicTraits();
    v59 = objc_claimAutoreleasedReturnValue();
    subtitleFont = v8->_subtitleFont;
    v8->_subtitleFont = (UIFont *)v59;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v61 = objc_claimAutoreleasedReturnValue();
    subtitleColor = v8->_subtitleColor;
    v8->_subtitleColor = (UIColor *)v61;

    PXEdgeInsetsForEdges();
    v8->_subtitleInsets.top = v63;
    v8->_subtitleInsets.left = v64;
    v8->_subtitleInsets.bottom = v65;
    v8->_subtitleInsets.right = v66;
    -[UIFont ascender](v8->_subtitleFont, "ascender");
    v68 = v67;
    PXScaledValueForTextStyleWithSymbolicTraits();
    v8->_subtitleInsets.top = v69 - v68;
    -[UIFont descender](v8->_subtitleFont, "descender");
    v71 = v70;
    PXScaledValueForTextStyleWithSymbolicTraits();
    v8->_subtitleInsets.bottom = v72 - v71;
    if (a4 != 1)
    {
      -[UIFont lineHeight](v8->_subtitleFont, "lineHeight");
      v56 = v8->_subtitleInsets.top + v73 * 2.0 + v8->_subtitleInsets.bottom;
    }
    v8->_gadgetHeight = v56 + v8->_height;

  }
  return v8;
}

- (BOOL)wantsScrollIndicators
{
  return 0;
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
  return 0;
}

- (BOOL)wantsFirstItemFullscreen
{
  return 0;
}

- (BOOL)wantsItemHoverEvents
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PXFeedHorizontalGadgetViewLayoutSpec height](self, "height", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)gadgetSizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[PXFeedHorizontalGadgetViewLayoutSpec gadgetHeight](self, "gadgetHeight", a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (id)layoutGeneratorWithReferenceSize:(CGSize)a3
{
  void *v3;
  PXGridLayoutGenerator *v4;

  -[PXFeedHorizontalGadgetViewLayoutSpec _metricsWithReferenceSize:](self, "_metricsWithReferenceSize:", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGridLayoutGenerator initWithMetrics:]([PXGridLayoutGenerator alloc], "initWithMetrics:", v3);

  return v4;
}

- (id)_metricsWithReferenceSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[PXFeedHorizontalGadgetViewLayoutSpec sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PXGridLayoutMetrics contentInsets](self->_cachedGridLayoutMetrics, "contentInsets");
  v10 = v7 - (v8 + v9);
  -[PXFeedHorizontalGadgetViewLayoutSpec itemAspectRatio](self, "itemAspectRatio");
  v12 = v11 * v10;
  -[PXLayoutMetrics setReferenceSize:](self->_cachedGridLayoutMetrics, "setReferenceSize:", v5, v7);
  -[PXGridLayoutMetrics setItemSize:](self->_cachedGridLayoutMetrics, "setItemSize:", v12, v10);
  return self->_cachedGridLayoutMetrics;
}

- (int64_t)numberOfColumns
{
  return 0;
}

- (double)overlayFeedPeekDistance
{
  return 0.0;
}

- (BOOL)allowsAutoplayContent
{
  return 1;
}

- (UIEdgeInsets)placeholderMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_placeholderMargins.top;
  left = self->_placeholderMargins.left;
  bottom = self->_placeholderMargins.bottom;
  right = self->_placeholderMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXScrollBehavior)scrollBehavior
{
  return self->_scrollBehavior;
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

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (int64_t)rootLayoutOrientation
{
  return self->_rootLayoutOrientation;
}

- (double)height
{
  return self->_height;
}

- (double)gadgetHeight
{
  return self->_gadgetHeight;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_itemShadow, 0);
  objc_storeStrong((id *)&self->_scrollBehavior, 0);
  objc_storeStrong((id *)&self->_cachedGridLayoutMetrics, 0);
}

@end
