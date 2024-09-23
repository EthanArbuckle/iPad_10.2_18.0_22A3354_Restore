@implementation _UIPopoverViewArtworkLoader

- (_UIPopoverViewArtworkLoader)initWithBackgroundStyle:(int64_t)a3
{
  _UIPopoverViewArtworkLoader *v4;
  _UIPopoverViewArtworkLoader *v5;
  uint64_t v6;
  NSString *backgroundSelector;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPopoverViewArtworkLoader;
  v4 = -[_UIPopoverViewArtworkLoader init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_backgroundStyle = a3;
    objc_msgSend((id)objc_opt_class(), "backgroundSelectorForBackgroundStyle:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundSelector = v5->_backgroundSelector;
    v5->_backgroundSelector = (NSString *)v6;

  }
  return v5;
}

+ (id)backgroundSelectorForBackgroundStyle:(int64_t)a3
{
  id result;

  result = CFSTR("Clear");
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      result = CFSTR("Cream");
      break;
    case 3:
      result = CFSTR("Black");
      break;
    case 4:
      result = CFSTR("Share");
      break;
    case 5:
      result = CFSTR("ShareBlack");
      break;
    case 6:
    case 7:
      goto LABEL_4;
    case 8:
      result = CFSTR("Gray");
      break;
    default:
      if (a3 == 100)
LABEL_4:
        result = CFSTR("BlurMask");
      else
        result = CFSTR("Blue");
      break;
  }
  return result;
}

- (BOOL)modern
{
  int64_t backgroundStyle;
  unint64_t v3;
  BOOL v4;

  backgroundStyle = self->_backgroundStyle;
  v3 = backgroundStyle - 6;
  v4 = backgroundStyle == 100;
  return v3 < 2 || v4;
}

- (id)templateImageForDirection:(id)a3 shortArtwork:(BOOL)a4 traitCollection:(id)a5
{
  return -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", a3, a4, a5, 0);
}

- (id)_templateImageForDirection:(id)a3 shortArtwork:(BOOL)a4 traitCollection:(id)a5 rimShadow:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v10 = a3;
  v11 = a5;
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (a6)
  {
    if (a4)
      v13 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("_UIPopoverViewShortRimShadowArrow%@.png"), v10, v17);
    else
      v13 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("_UIPopoverViewRimShadowArrow%@.png"), v10, v17);
  }
  else if (a4)
  {
    v13 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("_UIPopoverViewShort%@BackgroundArrow%@.png"), self->_backgroundSelector, v10);
  }
  else
  {
    v13 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("_UIPopoverView%@BackgroundArrow%@.png"), self->_backgroundSelector, v10);
  }
  v14 = v13;
  _UIImageWithNameAndTraitCollection(v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CGRect)contentRectForRect:(CGRect)a3 inImageOfSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = a3.origin.x / a4.width;
  v5 = a3.origin.y / a4.height;
  v6 = a3.size.width / a4.width;
  v7 = a3.size.height / a4.height;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)contentsCenterForRect:(CGRect)a3 inImageOfSize:(CGSize)a4
{
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v4 = a3.size.width + -1.0;
  v5 = a3.size.height + -1.0;
  v6 = (a3.origin.x + 0.5) / a4.width;
  v7 = a3.origin.y + 0.5;
  v8 = v4 / a4.width;
  if (v4 == 0.0)
    v9 = 0.00000011920929;
  else
    v9 = v8;
  if (v5 == 0.0)
    v10 = 0.00000011920929;
  else
    v10 = v5 / a4.height;
  v11 = v7 / a4.height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v6;
  return result;
}

- (id)viewWithContentsImage:(id)a3 rect:(CGRect)a4 center:(CGRect)a5 antialiasingMask:(unsigned int)a6 directionSelector:(id)a7
{
  uint64_t v7;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v16;
  id v17;
  _UIPopoverViewBackgroundComponentView *v18;
  double v19;
  double v20;
  double v21;
  _UIPopoverViewBackgroundComponentView *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double height;

  v7 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v16 = a7;
  v17 = a3;
  v18 = [_UIPopoverViewBackgroundComponentView alloc];
  objc_msgSend(v17, "size");
  v20 = v19;
  objc_msgSend(v17, "size");
  v22 = -[UIView initWithFrame:](v18, "initWithFrame:", 0.0, 0.0, v20, v21);
  -[UIView setOpaque:](v22, "setOpaque:", 0);
  -[UIView layer](v22, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_retainAutorelease(v17);
  objc_msgSend(v23, "setContents:", objc_msgSend(v24, "CGImage"));

  -[UIView layer](v22, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentsRect:", v14, v13, v12, v11);

  -[UIView layer](v22, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setContentsCenter:", x, y, width, height);

  -[UIView layer](v22, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  v29 = v28;

  objc_msgSend(v27, "setContentsScale:", v29);
  -[UIView layer](v22, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEdgeAntialiasingMask:", v7);

  -[_UIPopoverViewBackgroundComponentView setDirectionSelector:](v22, "setDirectionSelector:", v16);
  return v22;
}

- (double)arrowHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 18.0;
  if (v2)
    return 13.0;
  return result;
}

- (double)arrowBase
{
  -[_UIPopoverViewArtworkLoader modern](self, "modern");
  return 37.0;
}

- (double)topArrowStart
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 10.0;
  if (v2)
    return 25.0;
  return result;
}

- (double)sideArrowStart
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 24.0;
  if (v2)
    return 25.0;
  return result;
}

- (double)clampArrowBase
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 44.0;
  if (v2)
    return 32.0;
  return result;
}

- (double)arrowTopGradientEnd
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 42.0;
  if (v2)
    return 25.0;
  return result;
}

- (double)noArrowTopGradientEnd
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 24.0;
  if (v2)
    return 25.0;
  return result;
}

- (double)capCornerRadius
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 8.0;
  if (v2)
    return 16.0;
  return result;
}

- (double)bottomEndCapHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 10.0;
  if (v2)
    return 16.0;
  return result;
}

- (double)shortArtNoArrowTopGradientEnd
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 28.0;
  if (v2)
    return 25.0;
  return result;
}

- (double)shortArtArrowTopGradientEnd
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 46.0;
  if (v2)
    return 25.0;
  return result;
}

- (double)shortArtRightArrowBase
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  result = 33.0;
  if (!v2)
    return 22.0;
  return result;
}

- (id)topArrowView
{
  return -[_UIPopoverViewArtworkLoader _topArrowViewForTraitCollection:withRimShadow:](self, "_topArrowViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_topArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Up"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader topArrowStart](self, "topArrowStart");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
  v23 = v22;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v25 = v24;
  objc_msgSend(v5, "size");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
  v31 = v27 - (v29 + v30);
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v33 = v32;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v31, v33, v34);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 3, CFSTR("Up"), v15, v17, v19, v21, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v41 = v40;
  objc_msgSend(v5, "size");
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)topArrowPinnedView
{
  return -[_UIPopoverViewArtworkLoader _topArrowPinnedViewForTraitCollection:withRimShadow:](self, "_topArrowPinnedViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_topArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("UpRight"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v9 = v7 - v8;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v11 = v10;
  objc_msgSend(v5, "size");
  v13 = v12;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v27 = v26;
  objc_msgSend(v5, "size");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v30;
  -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
  v33 = v29 - (v31 + v32);
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v35 = v34;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v33, v35, v36);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 1, CFSTR("UpRight"), v17, v19, v21, v23, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v43 = v42;
  objc_msgSend(v5, "size");
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)topArrowLeftEndCapView
{
  return -[_UIPopoverViewArtworkLoader _topArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_topArrowLeftEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_topArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Up"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v21 = v20;
  -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
  v29 = v25 - (v27 + v28);
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v30;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v29, v31, v32);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 2, CFSTR("Up"), v13, v15, v17, v19, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v39 = v38;
  objc_msgSend(v5, "size");
  objc_msgSend(v37, "setFrame:", 0.0, 0.0, v39, v40);

  return v37;
}

- (id)topArrowRightEndCapView
{
  return -[_UIPopoverViewArtworkLoader _topArrowRightEndCapViewForTraitCollection:withRimShadow:](self, "_topArrowRightEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_topArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  CGAffineTransform v46;
  CATransform3D v47;
  CGAffineTransform v48;

  v4 = a4;
  v6 = a3;
  if (-[_UIPopoverViewArtworkLoader modern](self, "modern"))
  {
    -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Up"), 0, v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "size");
    v9 = v8;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v11 = v9 - v10;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v13 = v12;
    objc_msgSend(v7, "size");
    v15 = v14;
    objc_msgSend(v7, "size");
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v11, 0.0, v13, v15, v16, v17);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
    v27 = v26;
    objc_msgSend(v7, "size");
    v29 = v28;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v31 = v30;
    -[_UIPopoverViewArtworkLoader arrowTopGradientEnd](self, "arrowTopGradientEnd");
    v33 = v29 - (v31 + v32);
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v35 = v34;
    objc_msgSend(v7, "size");
    -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v27, 1.0, v33, v35, v36);
    -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v7, 1, CFSTR("Up"), v19, v21, v23, v25, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v43 = v42;
    objc_msgSend(v7, "size");
    objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  }
  else
  {
    -[_UIPopoverViewArtworkLoader _topArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_topArrowLeftEndCapViewForTraitCollection:withRimShadow:", v6, v4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    CATransform3DMakeScale(&v47, -1.0, 1.0, 1.0);
    CATransform3DGetAffineTransform(&v48, &v47);
    v46 = v48;
    objc_msgSend(v41, "setTransform:", &v46);
  }
  return v41;
}

- (id)rightArrowView
{
  return -[_UIPopoverViewArtworkLoader _rightArrowViewForTraitCollection:withRimShadow:](self, "_rightArrowViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_rightArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Side"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader sideArrowStart](self, "sideArrowStart");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v11 = v10;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, v7, v9, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v29 = v27 + v28;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v31 = v25 - (v29 + v30);
  objc_msgSend(v5, "size");
  v33 = v32;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v23, 1.0, v31, 1.0, v33, v34);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 10, CFSTR("Side"), v15, v17, v19, v21, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v41 = v40;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)rightArrowPinnedTopView
{
  return -[_UIPopoverViewArtworkLoader _rightArrowPinnedTopViewForTraitCollection:withRimShadow:](self, "_rightArrowPinnedTopViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_rightArrowPinnedTopViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("SideTop"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v9 = v8;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v21 = v20;
  objc_msgSend(v5, "size");
  v23 = v22;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v27 = v25 + v26;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v29 = v23 - (v27 + v28);
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v31 = v30;
  objc_msgSend(v5, "size");
  v33 = v32;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, 0.0, v29, v31, v33, v34);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 4, CFSTR("SideTop"), v13, v15, v17, v19, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v41 = v40;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)rightArrowPinnedBottomView
{
  return -[_UIPopoverViewArtworkLoader _rightArrowPinnedBottomViewForTraitCollection:withRimShadow:](self, "_rightArrowPinnedBottomViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_rightArrowPinnedBottomViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("SideBottom"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v9 = v7 - v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v13 = v12;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, v9, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v25 = v24;
  objc_msgSend(v5, "size");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v29 + v30;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v33 = v27 - (v31 + v32);
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v35 = v34;
  objc_msgSend(v5, "size");
  v37 = v36;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v25, 0.0, v33, v35, v37, v38);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 8, CFSTR("SideBottom"), v17, v19, v21, v23, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v45 = v44;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  return v43;
}

- (id)rightArrowTopEndCapView
{
  return -[_UIPopoverViewArtworkLoader _rightArrowTopEndCapViewForTraitCollection:withRimShadow:](self, "_rightArrowTopEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_rightArrowTopEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
  _BOOL4 v6;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Side"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  objc_msgSend(v5, "size");
  v8 = v7;
  if (v6)
  {
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v10 = v9;
    objc_msgSend(v5, "size");
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v8, v10, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v22 = v21;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v24 = v23;
    objc_msgSend(v5, "size");
    v26 = v25;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v28 = v27;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v30 = v28 + v29;
    -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
    v32 = v26 - (v30 + v31);
    objc_msgSend(v5, "size");
    v34 = v33;
    -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
    v36 = v35;
  }
  else
  {
    objc_msgSend(v5, "size");
    v24 = 24.0;
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v8, 24.0, v37, v38);
    v14 = v39;
    v16 = v40;
    v18 = v41;
    v20 = v42;
    objc_msgSend(v5, "size");
    v32 = v43 + -34.0;
    objc_msgSend(v5, "size");
    v34 = v44;
    v22 = 8.0;
    v36 = 24.0;
  }
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v22, v24, v32, 1.0, v34, v36);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 4, CFSTR("Side"), v14, v16, v18, v20, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v51 = v50;
  -[_UIPopoverViewArtworkLoader sideArrowStart](self, "sideArrowStart");
  v53 = v52;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, v51, v53 - v54);

  return v49;
}

- (id)rightArrowBottomEndCapView
{
  return -[_UIPopoverViewArtworkLoader _rightArrowBottomEndCapViewForTraitCollection:withRimShadow:](self, "_rightArrowBottomEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_rightArrowBottomEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Side"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader bottomEndCapHeight](self, "bottomEndCapHeight");
  v9 = v7 - v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  -[_UIPopoverViewArtworkLoader bottomEndCapHeight](self, "bottomEndCapHeight");
  v13 = v12;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, v9, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v25 = v24;
  objc_msgSend(v5, "size");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v29 + v30;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v33 = v27 - (v31 + v32);
  objc_msgSend(v5, "size");
  v35 = v34;
  -[_UIPopoverViewArtworkLoader sideArrowStart](self, "sideArrowStart");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v25, 0.0, v33, 1.0, v35, v36);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 8, CFSTR("Side"), v17, v19, v21, v23, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v43 = v42;
  objc_msgSend(v5, "size");
  v45 = v44;
  -[_UIPopoverViewArtworkLoader sideArrowStart](self, "sideArrowStart");
  v47 = v46;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v45 - (v47 + v48));

  return v41;
}

- (id)bottomArrowView
{
  return -[_UIPopoverViewArtworkLoader _bottomArrowViewForTraitCollection:withRimShadow:](self, "_bottomArrowViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_bottomArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Down"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader topArrowStart](self, "topArrowStart");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
  v23 = v22;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v25 = v24;
  objc_msgSend(v5, "size");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
  v31 = v29 + v30;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v33 = v27 - (v31 + v32);
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v35 = v34;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v33, v35, v36);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 12, CFSTR("Down"), v15, v17, v19, v21, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v43 = v42;
  objc_msgSend(v5, "size");
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)bottomArrowPinnedView
{
  return -[_UIPopoverViewArtworkLoader _bottomArrowPinnedViewForTraitCollection:withRimShadow:](self, "_bottomArrowPinnedViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_bottomArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("DownRight"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v9 = v7 - v8;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v11 = v10;
  objc_msgSend(v5, "size");
  v13 = v12;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v27 = v26;
  objc_msgSend(v5, "size");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
  v31 = v30;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v33 = v31 + v32;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v35 = v29 - (v33 + v34);
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v37 = v36;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v35, v37, v38);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 1, CFSTR("DownRight"), v17, v19, v21, v23, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v45 = v44;
  objc_msgSend(v5, "size");
  objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  return v43;
}

- (id)bottomArrowLeftEndCapView
{
  return -[_UIPopoverViewArtworkLoader _bottomArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_bottomArrowLeftEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_bottomArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Down"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v21 = v20;
  -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
  v29 = v27 + v28;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v25 - (v29 + v30);
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v33 = v32;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v31, v33, v34);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 1, CFSTR("Down"), v13, v15, v17, v19, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v41 = v40;
  objc_msgSend(v5, "size");
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)bottomArrowRightEndCapView
{
  return -[_UIPopoverViewArtworkLoader _bottomArrowRightEndCapViewForTraitCollection:withRimShadow:](self, "_bottomArrowRightEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_bottomArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  CGAffineTransform v48;
  CATransform3D v49;
  CGAffineTransform v50;

  v4 = a4;
  v6 = a3;
  if (-[_UIPopoverViewArtworkLoader modern](self, "modern"))
  {
    -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Down"), 0, v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "size");
    v9 = v8;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v11 = v9 - v10;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v13 = v12;
    objc_msgSend(v7, "size");
    v15 = v14;
    objc_msgSend(v7, "size");
    -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v11, 0.0, v13, v15, v16, v17);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
    v27 = v26;
    objc_msgSend(v7, "size");
    v29 = v28;
    -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
    v31 = v30;
    -[_UIPopoverViewArtworkLoader noArrowTopGradientEnd](self, "noArrowTopGradientEnd");
    v33 = v31 + v32;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v35 = v29 - (v33 + v34);
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v37 = v36;
    objc_msgSend(v7, "size");
    -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v27, 1.0, v35, v37, v38);
    -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v7, 2, CFSTR("Down"), v19, v21, v23, v25, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v45 = v44;
    objc_msgSend(v7, "size");
    objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  }
  else
  {
    -[_UIPopoverViewArtworkLoader _bottomArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_bottomArrowLeftEndCapViewForTraitCollection:withRimShadow:", v6, v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    CATransform3DMakeScale(&v49, -1.0, 1.0, 1.0);
    CATransform3DGetAffineTransform(&v50, &v49);
    v48 = v50;
    objc_msgSend(v43, "setTransform:", &v48);
  }
  return v43;
}

- (id)shortTopArrowView
{
  return -[_UIPopoverViewArtworkLoader _shortTopArrowViewForTraitCollection:withRimShadow:](self, "_shortTopArrowViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortTopArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Up"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader topArrowStart](self, "topArrowStart");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIPopoverViewArtworkLoader shortArtArrowTopGradientEnd](self, "shortArtArrowTopGradientEnd");
  v23 = v22;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v25 = v24;
  objc_msgSend(v5, "size");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader shortArtArrowTopGradientEnd](self, "shortArtArrowTopGradientEnd");
  v31 = v27 - (v29 + v30);
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v33 = v32;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v31, v33, v34);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 3, CFSTR("Up"), v15, v17, v19, v21, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v41 = v40;
  objc_msgSend(v5, "size");
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)shortTopArrowPinnedView
{
  return -[_UIPopoverViewArtworkLoader _shortTopArrowPinnedViewForTraitCollection:withRimShadow:](self, "_shortTopArrowPinnedViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortTopArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("UpRight"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v9 = v7 - v8;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v11 = v10;
  objc_msgSend(v5, "size");
  v13 = v12;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPopoverViewArtworkLoader shortArtArrowTopGradientEnd](self, "shortArtArrowTopGradientEnd");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v27 = v26;
  objc_msgSend(v5, "size");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v30;
  -[_UIPopoverViewArtworkLoader shortArtArrowTopGradientEnd](self, "shortArtArrowTopGradientEnd");
  v33 = v29 - (v31 + v32);
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v35 = v34;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v33, v35, v36);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 1, CFSTR("UpRight"), v17, v19, v21, v23, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v43 = v42;
  objc_msgSend(v5, "size");
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)shortTopArrowLeftEndCapView
{
  return -[_UIPopoverViewArtworkLoader _shortTopArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_shortTopArrowLeftEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortTopArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Up"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v21 = v20 + -1.0;
  -[_UIPopoverViewArtworkLoader shortArtArrowTopGradientEnd](self, "shortArtArrowTopGradientEnd");
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader shortArtArrowTopGradientEnd](self, "shortArtArrowTopGradientEnd");
  v29 = v25 - (v27 + v28);
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v30;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v29, v31, v32);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 2, CFSTR("Up"), v13, v15, v17, v19, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v39 = v38;
  objc_msgSend(v5, "size");
  objc_msgSend(v37, "setFrame:", 0.0, 0.0, v39, v40);

  return v37;
}

- (id)shortTopArrowRightEndCapView
{
  return -[_UIPopoverViewArtworkLoader _shortTopArrowRightEndCapViewForTraitCollection:withRimShadow:](self, "_shortTopArrowRightEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortTopArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v4;
  CGAffineTransform v6;
  CATransform3D v7;
  CGAffineTransform v8;

  -[_UIPopoverViewArtworkLoader _shortTopArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_shortTopArrowLeftEndCapViewForTraitCollection:withRimShadow:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v7, -1.0, 1.0, 1.0);
  CATransform3DGetAffineTransform(&v8, &v7);
  v6 = v8;
  objc_msgSend(v4, "setTransform:", &v6);
  return v4;
}

- (id)shortRightArrowView
{
  return -[_UIPopoverViewArtworkLoader _shortRightArrowViewForTraitCollection:withRimShadow:](self, "_shortRightArrowViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortRightArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  _BOOL4 v21;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Side"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  v10 = 0.0;
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v11, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[_UIPopoverViewArtworkLoader modern](self, "modern");
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  if (v21)
  {
    v26 = v23 / v24;
    objc_msgSend(v5, "size");
    v28 = v27;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v30 = v28 - v29;
    -[_UIPopoverViewArtworkLoader shortArtRightArrowBase](self, "shortArtRightArrowBase");
    v32 = v30 - v31;
    objc_msgSend(v5, "size");
    v33 = 1.0;
    v35 = v32 / v34;
  }
  else
  {
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v37 = v36;
    -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
    v39 = v37 + v38;
    -[_UIPopoverViewArtworkLoader shortArtRightArrowBase](self, "shortArtRightArrowBase");
    v41 = v25 - (v39 + v40);
    objc_msgSend(v5, "size");
    v43 = v42;
    objc_msgSend(v5, "size");
    -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v23, 0.0, v41, v43, v44, v45);
    v26 = v46;
    v10 = v47;
    v35 = v48;
    v33 = v49;
  }
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 0, CFSTR("Side"), v14, v16, v18, v20, v26, v10, v35, v33);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v52 = v51;
  objc_msgSend(v5, "size");
  objc_msgSend(v50, "setFrame:", 0.0, 0.0, v52, v53);

  return v50;
}

- (id)shortBottomArrowView
{
  return -[_UIPopoverViewArtworkLoader _shortBottomArrowViewForTraitCollection:withRimShadow:](self, "_shortBottomArrowViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortBottomArrowViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Down"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader topArrowStart](self, "topArrowStart");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v9 = v8;
  objc_msgSend(v5, "size");
  v11 = v10;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v7, 0.0, v9, v11, v12, v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIPopoverViewArtworkLoader shortArtNoArrowTopGradientEnd](self, "shortArtNoArrowTopGradientEnd");
  v23 = v22;
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v25 = v24;
  objc_msgSend(v5, "size");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader shortArtNoArrowTopGradientEnd](self, "shortArtNoArrowTopGradientEnd");
  v31 = v29 + v30;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v33 = v27 - (v31 + v32);
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v35 = v34;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v23, v25, v33, v35, v36);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 3, CFSTR("Down"), v15, v17, v19, v21, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader arrowBase](self, "arrowBase");
  v43 = v42;
  objc_msgSend(v5, "size");
  objc_msgSend(v41, "setFrame:", 0.0, 0.0, v43, v44);

  return v41;
}

- (id)shortBottomArrowPinnedView
{
  return -[_UIPopoverViewArtworkLoader _shortBottomArrowPinnedViewForTraitCollection:withRimShadow:](self, "_shortBottomArrowPinnedViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortBottomArrowPinnedViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("DownRight"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v9 = v7 - v8;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v11 = v10;
  objc_msgSend(v5, "size");
  v13 = v12;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", v9, 0.0, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[_UIPopoverViewArtworkLoader shortArtNoArrowTopGradientEnd](self, "shortArtNoArrowTopGradientEnd");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v27 = v26;
  objc_msgSend(v5, "size");
  v29 = v28;
  -[_UIPopoverViewArtworkLoader shortArtNoArrowTopGradientEnd](self, "shortArtNoArrowTopGradientEnd");
  v31 = v30;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v33 = v31 + v32;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v35 = v29 - (v33 + v34);
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v37 = v36;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", 0.0, v25, v27, v35, v37, v38);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 1, CFSTR("DownRight"), v17, v19, v21, v23, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader clampArrowBase](self, "clampArrowBase");
  v45 = v44;
  objc_msgSend(v5, "size");
  objc_msgSend(v43, "setFrame:", 0.0, 0.0, v45, v46);

  return v43;
}

- (id)shortBottomArrowLeftEndCapView
{
  return -[_UIPopoverViewArtworkLoader _shortBottomArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_shortBottomArrowLeftEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortBottomArrowLeftEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v5;
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
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;

  -[_UIPopoverViewArtworkLoader _templateImageForDirection:shortArtwork:traitCollection:rimShadow:](self, "_templateImageForDirection:shortArtwork:traitCollection:rimShadow:", CFSTR("Down"), 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v7 = v6;
  objc_msgSend(v5, "size");
  v9 = v8;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentRectForRect:inImageOfSize:](self, "contentRectForRect:inImageOfSize:", 0.0, 0.0, v7, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v21 = v20;
  -[_UIPopoverViewArtworkLoader shortArtNoArrowTopGradientEnd](self, "shortArtNoArrowTopGradientEnd");
  v23 = v22;
  objc_msgSend(v5, "size");
  v25 = v24;
  -[_UIPopoverViewArtworkLoader arrowHeight](self, "arrowHeight");
  v27 = v26;
  -[_UIPopoverViewArtworkLoader shortArtNoArrowTopGradientEnd](self, "shortArtNoArrowTopGradientEnd");
  v29 = v27 + v28;
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v31 = v25 - (v29 + v30);
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v33 = v32;
  objc_msgSend(v5, "size");
  -[_UIPopoverViewArtworkLoader contentsCenterForRect:inImageOfSize:](self, "contentsCenterForRect:inImageOfSize:", v21, v23, 1.0, v31, v33, v34);
  -[_UIPopoverViewArtworkLoader viewWithContentsImage:rect:center:antialiasingMask:directionSelector:](self, "viewWithContentsImage:rect:center:antialiasingMask:directionSelector:", v5, 2, CFSTR("Down"), v13, v15, v17, v19, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverViewArtworkLoader capCornerRadius](self, "capCornerRadius");
  v41 = v40;
  objc_msgSend(v5, "size");
  objc_msgSend(v39, "setFrame:", 0.0, 0.0, v41, v42);

  return v39;
}

- (id)shortBottomArrowRightEndCapView
{
  return -[_UIPopoverViewArtworkLoader _shortBottomArrowRightEndCapViewForTraitCollection:withRimShadow:](self, "_shortBottomArrowRightEndCapViewForTraitCollection:withRimShadow:", 0, 0);
}

- (id)_shortBottomArrowRightEndCapViewForTraitCollection:(id)a3 withRimShadow:(BOOL)a4
{
  void *v4;
  CGAffineTransform v6;
  CATransform3D v7;
  CGAffineTransform v8;

  -[_UIPopoverViewArtworkLoader _shortBottomArrowLeftEndCapViewForTraitCollection:withRimShadow:](self, "_shortBottomArrowLeftEndCapViewForTraitCollection:withRimShadow:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v7, -1.0, 1.0, 1.0);
  CATransform3DGetAffineTransform(&v8, &v7);
  v6 = v8;
  objc_msgSend(v4, "setTransform:", &v6);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundSelector, 0);
}

@end
