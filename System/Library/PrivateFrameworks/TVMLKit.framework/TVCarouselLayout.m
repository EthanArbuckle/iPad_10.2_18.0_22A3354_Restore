@implementation TVCarouselLayout

+ (int64_t)layoutTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("upsell")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ribbon")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("centerGrowth")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

+ (unint64_t)scrollModeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("continuous")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("none")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)layoutTypeForElement:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("tv_layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(a1, "layoutTypeForString:", v5);
  else
    v6 = 3;

  return v6;
}

+ (TVCarouselLayout)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6;
  id v7;
  TVCarouselLayout *v8;
  TVCarouselLayout *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v21;
  double v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v8 = (TVCarouselLayout *)v6;
  v9 = v8;
  if (!v8)
    v9 = objc_alloc_init(TVCarouselLayout);
  v23.receiver = a1;
  v23.super_class = (Class)&OBJC_METACLASS___TVCarouselLayout;
  v10 = objc_msgSendSuper2(&v23, sel_layoutWithLayout_element_, v9, v7);
  objc_msgSend(v7, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "layoutTypeForElement:", v7);
  if (v12 != 3)
    -[TVCarouselLayout setLayoutType:](v9, "setLayoutType:", v12);
  objc_msgSend(v11, "tv_scrollMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVCarouselLayout setScrollMode:](v9, "setScrollMode:", objc_msgSend(a1, "scrollModeForString:", v13));

  if (-[TVCarouselLayout layoutType](v9, "layoutType") == 2 || -[TVCarouselLayout layoutType](v9, "layoutType") == 1)
  {
    v14 = -[TVCarouselLayout layoutType](v9, "layoutType");
    v15 = 130.0;
    if (v14 == 2)
      v15 = 480.0;
    v16 = 0.0;
    if (v14 == 2)
      v17 = 100.0;
    else
      v17 = 0.0;
    -[TVCarouselLayout setRevealDistance:](v9, "setRevealDistance:", v15);
    -[TVCarouselLayout setFocusedEdgeExpansion:](v9, "setFocusedEdgeExpansion:", v17);
    goto LABEL_13;
  }
  objc_msgSend(v11, "tv_interitemSpacing");
  if (v21 != 0.0)
  {
    objc_msgSend(v11, "tv_interitemSpacing");
    v16 = v22;
LABEL_13:
    -[TVCarouselLayout setInteritemSpacing:](v9, "setInteritemSpacing:", v16);
  }
  if (-[TVCarouselLayout layoutType](v9, "layoutType") == 2)
  {
    -[TVCarouselLayout setParallaxEnabled:](v9, "setParallaxEnabled:", 1);
    -[TVCarouselLayout setShearAngle:](v9, "setShearAngle:", -0.162444763);
  }
  objc_msgSend(v7, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("pageControl"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
    -[TVCarouselLayout setShowsPageControl:](v9, "setShowsPageControl:", objc_msgSend(v19, "BOOLValue"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_TVLockupFactory cellMetricsForCollectionElement:](_TVLockupFactory, "cellMetricsForCollectionElement:", v7);
    -[TVCarouselLayout setCellPadding:](v9, "setCellPadding:", (unsigned __int128)0, (unsigned __int128)0);
    -[TVCarouselLayout setCellSize:](v9, "setCellSize:", (unsigned __int128)0);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TVCarouselLayout *v4;
  TVCarouselLayout *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  void *v41;
  float v42;
  float v43;
  void *v44;
  float v45;

  v4 = (TVCarouselLayout *)a3;
  if (v4 == self)
  {
    v15 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_20;
  }
  v5 = v4;
  -[TVCarouselLayout interitemSpacing](self, "interitemSpacing");
  v7 = v6;
  -[TVCarouselLayout interitemSpacing](v5, "interitemSpacing");
  if (v7 != v8)
    goto LABEL_16;
  v9 = -[TVCarouselLayout layoutType](self, "layoutType");
  if (v9 != -[TVCarouselLayout layoutType](v5, "layoutType"))
    goto LABEL_16;
  -[TVCarouselLayout cellSize](self, "cellSize");
  v11 = v10;
  v13 = v12;
  -[TVCarouselLayout cellSize](v5, "cellSize");
  v15 = 0;
  if (v11 != v16)
    goto LABEL_17;
  if (v13 != v14)
    goto LABEL_17;
  -[TVCarouselLayout cellPadding](self, "cellPadding");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[TVCarouselLayout cellPadding](v5, "cellPadding");
  v15 = 0;
  if (v20 != v28 || v18 != v25 || v24 != v27 || v22 != v26)
    goto LABEL_17;
  -[TVCarouselLayout focusedEdgeExpansion](self, "focusedEdgeExpansion");
  v30 = v29;
  -[TVCarouselLayout focusedEdgeExpansion](v5, "focusedEdgeExpansion");
  if (v30 != v31)
    goto LABEL_16;
  -[TVCarouselLayout revealDistance](self, "revealDistance");
  v33 = v32;
  -[TVCarouselLayout revealDistance](v5, "revealDistance");
  if (v33 != v34)
    goto LABEL_16;
  v35 = -[TVCarouselLayout isParallaxEnabled](self, "isParallaxEnabled");
  if (v35 == -[TVCarouselLayout isParallaxEnabled](v5, "isParallaxEnabled")
    && (-[TVCarouselLayout shearAngle](self, "shearAngle"),
        v37 = v36,
        -[TVCarouselLayout shearAngle](v5, "shearAngle"),
        v37 == v38)
    && (v39 = -[TVCarouselLayout showsPageControl](self, "showsPageControl"),
        v39 == -[TVCarouselLayout showsPageControl](v5, "showsPageControl")))
  {
    -[TVCarouselLayout pageControlMarginNumber](self, "pageControlMarginNumber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "floatValue");
    v43 = v42;
    -[TVCarouselLayout pageControlMarginNumber](v5, "pageControlMarginNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "floatValue");
    v15 = v43 == v45;

  }
  else
  {
LABEL_16:
    v15 = 0;
  }
LABEL_17:

LABEL_20:
  return v15;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (UIEdgeInsets)cellPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cellPadding.top;
  left = self->_cellPadding.left;
  bottom = self->_cellPadding.bottom;
  right = self->_cellPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCellPadding:(UIEdgeInsets)a3
{
  self->_cellPadding = a3;
}

- (unint64_t)scrollMode
{
  return self->_scrollMode;
}

- (void)setScrollMode:(unint64_t)a3
{
  self->_scrollMode = a3;
}

- (double)focusedEdgeExpansion
{
  return self->_focusedEdgeExpansion;
}

- (void)setFocusedEdgeExpansion:(double)a3
{
  self->_focusedEdgeExpansion = a3;
}

- (double)revealDistance
{
  return self->_revealDistance;
}

- (void)setRevealDistance:(double)a3
{
  self->_revealDistance = a3;
}

- (BOOL)isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (double)shearAngle
{
  return self->_shearAngle;
}

- (void)setShearAngle:(double)a3
{
  self->_shearAngle = a3;
}

- (BOOL)showsPageControl
{
  return self->_showsPageControl;
}

- (void)setShowsPageControl:(BOOL)a3
{
  self->_showsPageControl = a3;
}

- (NSNumber)pageControlMarginNumber
{
  return self->_pageControlMarginNumber;
}

- (void)setPageControlMarginNumber:(id)a3
{
  self->_pageControlMarginNumber = (NSNumber *)a3;
}

@end
