@implementation PLLargeTextPlatterHeaderContentViewLayoutManager

+ (double)contentBaselineToBoundsBottomWithFont:(id)a3 boundsWidth:(double)a4 scale:(double)a5
{
  double result;

  objc_msgSend(a3, "_scaledValueForValue:", 6.5);
  UIRoundToScale();
  return result;
}

- (double)headerHeightForWidth:(double)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double result;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  if (a3 <= 0.0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLLargeTextPlatterHeaderContentViewLayoutManager;
    -[PLPlatterHeaderContentViewLayoutManager headerHeightForWidth:](&v10, sel_headerHeightForWidth_);
  }
  else
  {
    -[PLPlatterHeaderContentViewLayoutManager _measuringSizeForWidth:](self, "_measuringSizeForWidth:");
    v5 = v4;
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBoundsThatFitsWidth:](self, "_titleLabelBoundsThatFitsWidth:");
    CGRectGetHeight(v11);
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _dateLabelBoundsThatFitsWidth:](self, "_dateLabelBoundsThatFitsWidth:", v5);
    CGRectGetHeight(v12);
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _largeTextLabelBaselineOffsetFromBottom](self, "_largeTextLabelBaselineOffsetFromBottom");
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    UIRoundToScale();
    v8 = v7;

    return v8;
  }
  return result;
}

- (double)contentBaseline
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double MaxY;
  double v16;
  void *v17;
  CGRect v19;

  -[PLPlatterHeaderContentViewLayoutManager _date](self, "_date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLPlatterHeaderContentViewLayoutManager _dateLabel](self, "_dateLabel");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (v7 <= 0.0)
  {
    -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = (void *)v4;
    if (v4)
      goto LABEL_9;
    return 0.0;
  }
  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "imageForState:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      MaxY = CGRectGetMaxY(v19);
      goto LABEL_10;
    }
    return 0.0;
  }
  objc_msgSend(v12, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    return 0.0;
LABEL_9:
  objc_msgSend(v14, "_lastLineBaselineFrameOriginY");
LABEL_10:
  v16 = MaxY;

  return v16;
}

- (void)layoutIconButtonsWithScale:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  unint64_t i;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  CGRect v33;
  CGRect v34;

  -[PLPlatterHeaderContentViewLayoutManager _iconButtons](self, "_iconButtons");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v32, "count");
  if (v4)
  {
    v5 = v4;
    -[PLPlatterHeaderContentViewLayoutManager headerContentView](self, "headerContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v33.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v33.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v33.size.width = 44.0;
    v33.size.height = 44.0;
    v15 = (CGRectGetWidth(v33) + -20.0) * 0.5;
    v16 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v17 = 10.0;
    if (v16)
    {
      v34.origin.x = v8;
      v34.origin.y = v10;
      v34.size.width = v12;
      v34.size.height = v14;
      v17 = CGRectGetWidth(v34) + -10.0 + -20.0;
    }
    v18 = v17 - v15;
    -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "font");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "capHeight");
    v22 = v21;

    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    v24 = v23 + v22 * -0.5 + -10.0 - v15;
    v25 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v32, "objectAtIndex:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      UIRectIntegralWithScale();
      objc_msgSend(v27, "setFrame:");
      if (i < v5 - 1)
      {
        v28 = v18;
        v29 = v24;
        v30 = 0x4046000000000000;
        v31 = 0x4046000000000000;
        if (v25)
          v18 = CGRectGetMinX(*(CGRect *)&v28) + -10.0 + -20.0;
        else
          v18 = CGRectGetMaxX(*(CGRect *)&v28) + 10.0 + -v15 * 2.0;
      }

    }
  }

}

- (void)layoutTitleLabelWithTrailingXLimit:(double)a3 scale:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat rect;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v24 = v5;
    -[PLPlatterHeaderContentViewLayoutManager headerContentView](self, "headerContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = v14;
    -[PLPlatterHeaderContentViewLayoutManager _measuringSizeForWidth:](self, "_measuringSizeForWidth:", CGRectGetWidth(v25));
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBoundsThatFitsWidth:](self, "_titleLabelBoundsThatFitsWidth:");
    objc_msgSend(v24, "setBounds:");
    objc_msgSend(v24, "frame");
    v16 = v15;
    rect = v17;
    v19 = v18;
    v21 = v20;
    -[PLPlatterHeaderContentViewLayoutManager _iconButtons](self, "_iconButtons");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "count");

    if (-[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v26.origin.x = v8;
      v26.origin.y = v10;
      v26.size.width = v12;
      v26.size.height = v14;
      CGRectGetWidth(v26);
      v27.origin.x = v16;
      v27.origin.y = rect;
      v27.size.width = v19;
      v27.size.height = v21;
      CGRectGetWidth(v27);
    }
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    objc_msgSend(v24, "_firstLineBaselineOffsetFromBoundsTop");
    UIRectIntegralWithScale();
    objc_msgSend(v24, "setFrame:");
    v5 = v24;
  }

}

- (void)layoutUtilityButtonWithScale:(double)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double MinX;
  double v31;
  double Width;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  id v39;
  _QWORD v40[4];
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[PLPlatterHeaderContentViewLayoutManager _utilityView](self, "_utilityView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      return;
  }
  v39 = (id)v5;
  -[PLPlatterHeaderContentViewLayoutManager headerContentView](self, "headerContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v42.origin.x = v8;
  v42.origin.y = v10;
  v42.size.width = v12;
  v42.size.height = v14;
  -[PLPlatterHeaderContentViewLayoutManager _measuringSizeForWidth:](self, "_measuringSizeForWidth:", CGRectGetWidth(v42));
  -[PLLargeTextPlatterHeaderContentViewLayoutManager _utilityViewSizeThatFitsWidth:](self, "_utilityViewSizeThatFitsWidth:");
  v38 = a3;
  UISizeRoundToScale();
  BSRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v39, "setBounds:");
  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v39 == v23;
  if (v39 == v23)
  {
    -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (!v28)
    {
      v24 = 0;
      goto LABEL_7;
    }
    v29 = (void *)MEMORY[0x1E0CEABB0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __81__PLLargeTextPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke;
    v40[3] = &unk_1E91D3160;
    v41 = v39;
    objc_msgSend(v29, "performWithoutAnimation:", v40);
    v23 = v41;
  }

LABEL_7:
  if (-[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v43.origin.x = v16;
    v43.origin.y = v18;
    v43.size.width = v20;
    v43.size.height = v22;
    MinX = CGRectGetMinX(v43);
    v31 = 7.0;
  }
  else
  {
    v44.origin.x = v8;
    v44.origin.y = v10;
    v44.size.width = v12;
    v44.size.height = v14;
    Width = CGRectGetWidth(v44);
    v45.origin.x = v16;
    v45.origin.y = v18;
    v45.size.width = v20;
    v45.size.height = v22;
    MinX = Width - CGRectGetMaxX(v45);
    v31 = -7.0;
  }
  v33 = MinX + v31;
  -[PLLargeTextPlatterHeaderContentViewLayoutManager layoutTitleLabelWithTrailingXLimit:scale:](self, "layoutTitleLabelWithTrailingXLimit:scale:", 0.0, v38);
  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_lastLineBaselineFrameOriginY");
  if (v24)
  {
    -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_firstLineBaselineOffsetFromBoundsTop");

  }
  else
  {
    objc_msgSend(v34, "font");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "capHeight");

    v46.origin.x = v33;
    v46.origin.y = v18;
    v46.size.width = v20;
    v46.size.height = v22;
    CGRectGetHeight(v46);
  }
  UIRectIntegralWithScale();
  objc_msgSend(v39, "setFrame:");

}

uint64_t __81__PLLargeTextPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)layoutDateLabelWithScale:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[PLPlatterHeaderContentViewLayoutManager _dateLabel](self, "_dateLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_12;
  v36 = v5;
  -[PLPlatterHeaderContentViewLayoutManager headerContentView](self, "headerContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v32 = v10;
  v34 = v8;
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  -[PLPlatterHeaderContentViewLayoutManager _measuringSizeForWidth:](self, "_measuringSizeForWidth:", CGRectGetWidth(v37));
  -[PLLargeTextPlatterHeaderContentViewLayoutManager _dateLabelBoundsThatFitsWidth:](self, "_dateLabelBoundsThatFitsWidth:");
  objc_msgSend(v36, "setBounds:");
  -[PLLargeTextPlatterHeaderContentViewLayoutManager layoutTitleLabelWithTrailingXLimit:scale:](self, "layoutTitleLabelWithTrailingXLimit:scale:", 0.0, a3);
  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_lastLineBaselineFrameOriginY");

  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    v20 = objc_msgSend(v17, "isHidden");

    if ((v20 & 1) != 0)
      goto LABEL_9;
LABEL_7:
    objc_msgSend(v17, "frame", *(_QWORD *)&v10, *(_QWORD *)&v8);
    CGRectGetWidth(v38);
    goto LABEL_9;
  }
  objc_msgSend(v17, "currentImage");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

    goto LABEL_9;
  }
  v22 = (void *)v21;
  v23 = objc_msgSend(v17, "isHidden");

  if ((v23 & 1) == 0)
    goto LABEL_7;
LABEL_9:
  objc_msgSend(v36, "frame", *(_QWORD *)&v32, *(_QWORD *)&v34);
  v27 = v26;
  v29 = v28;
  if (v15)
  {
    v30 = v24;
    v31 = v25;
    v39.origin.y = v33;
    v39.origin.x = v35;
    v39.size.width = v12;
    v39.size.height = v14;
    CGRectGetWidth(v39);
    v40.origin.x = v30;
    v40.origin.y = v31;
    v40.size.width = v27;
    v40.size.height = v29;
    CGRectGetWidth(v40);
  }
  -[PLLargeTextPlatterHeaderContentViewLayoutManager _dateLabelBaselineOffset](self, "_dateLabelBaselineOffset");
  objc_msgSend(v36, "_firstLineBaselineOffsetFromBoundsTop");
  UIRectIntegralWithScale();
  objc_msgSend(v36, "setFrame:");

  v5 = v36;
LABEL_12:

}

- (double)_titleLabelBaselineOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 16.5);
  v5 = v4;

  return v5;
}

- (id)_dateLabelFont
{
  void *v2;
  void *v3;

  -[PLPlatterHeaderContentViewLayoutManager headerContentView](self, "headerContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dateLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)invalidateCachedSizeInfo
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D1285000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Invalidating cached size info", (uint8_t *)&v2, 0xCu);
}

- (CGSize)_boundingRectSizeForLabel:(id)a3 width:(double)a4 numberOfLines:(unint64_t *)a5
{
  id v8;
  double v9;
  double v10;
  NSStringDrawingContext *v11;
  NSStringDrawingContext *drawingContext;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v8 = a3;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v8 && a4 != 0.0)
  {
    if (!self->_drawingContext)
    {
      v11 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x1E0CEA248]);
      drawingContext = self->_drawingContext;
      self->_drawingContext = v11;

      -[NSStringDrawingContext setWantsNumberOfLineFragments:](self->_drawingContext, "setWantsNumberOfLineFragments:", 1);
    }
    objc_msgSend(v8, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, self->_drawingContext, a4, 1.79769313e308);
    v9 = v14;
    v10 = v15;

    if (a5)
      *a5 = -[NSStringDrawingContext numberOfLineFragments](self->_drawingContext, "numberOfLineFragments");
  }

  v16 = v9;
  v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (double)_largeTextUtilityLabelBaselineOffset
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 16.5);
  v6 = v5;

  return v6;
}

- (double)_largeTextLabelBaselineOffsetFromBottom
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 6.5);
  v5 = v4;

  return v5;
}

- (double)_dateLabelBaselineOffset
{
  void *v2;
  double v3;
  double v4;

  -[PLLargeTextPlatterHeaderContentViewLayoutManager _dateLabelFont](self, "_dateLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 16.5);
  v4 = v3;

  return v4;
}

- (CGSize)_utilityViewSizeThatFitsWidth:(double)a3
{
  double v3;
  double v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3 > 0.0)
  {
    -[PLPlatterHeaderContentViewLayoutManager _utilityView](self, "_utilityView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton"),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
      v3 = v8;
      v4 = v9;

    }
  }
  v10 = v3;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:(double)a3
{
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double referenceWidth;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  id v17;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && self->_referenceWidth != a3)
  {
    -[PLLargeTextPlatterHeaderContentViewLayoutManager invalidateCachedSizeInfo](self, "invalidateCachedSizeInfo");
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _utilityViewSizeThatFitsWidth:](self, "_utilityViewSizeThatFitsWidth:", a3);
    v8 = v7 + 7.0;
    v9 = v7 <= 0.0;
    v10 = 0.0;
    if (!v9)
      v10 = v8;
    v11 = a3 - v10;
    referenceWidth = self->_referenceWidth;
    if (referenceWidth != 0.0 && referenceWidth != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLargeTextPlatterHeaderContentViewLayoutManager.m"), 239, CFSTR("'_referenceWidth' is an unexpected value: %f"), *(_QWORD *)&self->_referenceWidth);

    }
    self->_referenceWidth = a3;
    -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _boundingRectSizeForLabel:width:numberOfLines:](self, "_boundingRectSizeForLabel:width:numberOfLines:", v17, &self->_cachedTitleNumberOfLines, v11);
    self->_cachedTitleBoundingRectSize.width = v14;
    self->_cachedTitleBoundingRectSize.height = v15;

  }
}

- (unint64_t)_titleLabelNumberOfLinesThatFitsWidth:(double)a3
{
  void *v5;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[PLLargeTextPlatterHeaderContentViewLayoutManager _updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:](self, "_updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:", a3);
  return self->_cachedTitleNumberOfLines;
}

- (CGRect)_dateLabelBoundsThatFitsWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[PLPlatterHeaderContentViewLayoutManager _date](self, "_date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    BSRectWithSize();
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_titleLabelBoundsThatFitsWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lineHeight");

    -[PLLargeTextPlatterHeaderContentViewLayoutManager _updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:](self, "_updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:", a3);
    BSRectWithSize();
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingContext, 0);
}

@end
