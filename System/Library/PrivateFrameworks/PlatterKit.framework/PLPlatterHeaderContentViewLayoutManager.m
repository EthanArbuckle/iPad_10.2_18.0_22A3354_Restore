@implementation PLPlatterHeaderContentViewLayoutManager

+ (double)_headerHeightWithFont:(id)a3 forWidth:(double)a4
{
  double v4;

  objc_msgSend(a3, "_scaledValueForValue:");
  return 10.0 + 20.0 + v4;
}

+ (double)contentBaselineToBoundsBottomWithFont:(id)a3 boundsWidth:(double)a4 scale:(double)a5
{
  id v7;
  double result;

  v7 = a3;
  objc_msgSend(a1, "_headerHeightWithFont:forWidth:", v7, a4);
  objc_msgSend(a1, "_titleLabelBaselineOffsetWithFont:", v7);

  UIRoundToScale();
  return result;
}

- (PLPlatterHeaderContentViewLayoutManager)initWithPlatterHeaderContentView:(id)a3
{
  id v4;
  PLPlatterHeaderContentViewLayoutManager *v5;
  PLPlatterHeaderContentViewLayoutManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPlatterHeaderContentViewLayoutManager;
  v5 = -[PLPlatterHeaderContentViewLayoutManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_headerContentView, v4);

  return v6;
}

- (double)headerHeightForWidth:(double)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;

  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "_titleLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_headerHeightWithFont:forWidth:", v7, a3);
  v9 = v8;

  return v9;
}

- (double)contentBaseline
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "_iconDimension");
  v5 = v4 + 10.0;
  -[PLPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
  v7 = v6;

  if (v5 >= v7)
    return v5;
  else
    return v7;
}

- (void)layoutIconButtonsWithScale:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double MinY;
  double v24;
  _BOOL4 v25;
  unint64_t i;
  void *v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat rect;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[PLPlatterHeaderContentViewLayoutManager _iconButtons](self, "_iconButtons");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v37, "count");
  if (v4)
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
    objc_msgSend(WeakRetained, "bounds");
    v8 = v7;
    v34 = v9;
    v35 = v10;
    rect = v11;
    objc_msgSend(WeakRetained, "_iconDimension");
    v13 = v12;
    BSRectWithSize();
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    v33 = (CGRectGetWidth(v38) - v13) * 0.5;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v32 = (CGRectGetHeight(v39) - v13) * 0.5;
    objc_msgSend(WeakRetained, "_iconLeadingPadding");
    v19 = v18;
    if (-[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v40.origin.x = v8;
      v40.origin.y = v34;
      v40.size.height = v35;
      v40.size.width = rect;
      CGRectGetWidth(v40);
    }
    UIRectCenteredYInRect();
    v20 = v41.origin.x;
    v21 = v41.size.width;
    v22 = v41.size.height;
    MinY = CGRectGetMinY(v41);
    if (MinY >= 10.0 - v32)
      v24 = MinY;
    else
      v24 = 10.0 - v32;
    v25 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v37, "objectAtIndex:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      UIRectIntegralWithScale();
      objc_msgSend(v27, "setFrame:");
      if (i < v5 - 1)
      {
        v28 = v20;
        v29 = v24;
        v30 = v21;
        v31 = v22;
        if (v25)
          v20 = CGRectGetMinX(*(CGRect *)&v28) - v19 - v13;
        else
          v20 = v19 + CGRectGetMaxX(*(CGRect *)&v28) + -v33 * 2.0;
      }

    }
  }

}

- (void)layoutTitleLabelWithTrailingXLimit:(double)a3 scale:(double)a4
{
  void *v6;
  id WeakRetained;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  _BOOL4 v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v40 = a3;
    v41 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
    objc_msgSend(WeakRetained, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v36 = v11;
    v38 = v9;
    v42.origin.x = v9;
    v42.origin.y = v11;
    v32 = v15;
    v34 = v13;
    v42.size.width = v13;
    v42.size.height = v15;
    -[PLPlatterHeaderContentViewLayoutManager _measuringSizeForWidth:](self, "_measuringSizeForWidth:", CGRectGetWidth(v42));
    -[PLPlatterHeaderContentViewLayoutManager _titleLabelBoundsForSize:withNumberOfLines:](self, "_titleLabelBoundsForSize:withNumberOfLines:");
    objc_msgSend(v41, "setBounds:");
    objc_msgSend(v41, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[PLPlatterHeaderContentViewLayoutManager _dateLabel](self, "_dateLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      v25 = 0.0;
    else
      v25 = 16.0;

    -[PLPlatterHeaderContentViewLayoutManager _iconButtons](self, "_iconButtons");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
      v27 = 10.0;
    else
      v27 = 12.0;

    v28 = v27;
    if (-[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v28 = v25 + v40;
      v43.origin.y = v36;
      v43.origin.x = v38;
      v43.size.height = v32;
      v43.size.width = v34;
      v29 = CGRectGetWidth(v43) - v27;
      v44.origin.x = v17;
      v44.origin.y = v19;
      v44.size.width = v21;
      v44.size.height = v23;
      v30 = v29 - CGRectGetWidth(v44);
      if (v25 + v40 < v30)
        v28 = v30;
    }
    v31 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", *(_QWORD *)&v32, *(_QWORD *)&v34, *(_QWORD *)&v36, *(_QWORD *)&v38);
    v45.origin.x = v28;
    v45.origin.y = v19;
    v45.size.width = v21;
    v45.size.height = v23;
    CGRectGetWidth(v45);
    if (v31)
    {
      v46.origin.y = v37;
      v46.origin.x = v39;
      v46.size.height = v33;
      v46.size.width = v35;
      CGRectGetMaxX(v46);
    }
    v47.origin.x = v28;
    v47.origin.y = v19;
    v47.size.width = v21;
    v47.size.height = v23;
    CGRectGetMinX(v47);
    -[PLPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    objc_msgSend(v41, "_firstLineBaselineOffsetFromBoundsTop");
    UIRectIntegralWithScale();
    objc_msgSend(v41, "setFrame:");
    v6 = v41;
  }

}

- (void)layoutUtilityButtonWithScale:(double)a3
{
  id WeakRetained;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
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
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  CGFloat v53;
  CGFloat rect;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  id v61;
  _QWORD v62[4];
  id v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "bounds");
  v6 = v5;
  v55 = v8;
  v56 = v7;
  rect = v9;

  -[PLPlatterHeaderContentViewLayoutManager _utilityView](self, "_utilityView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v61 = v12;

  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v61 == v13)
  {
    -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v17, "length") != 0;

  }
  else
  {
    v14 = 0;
  }

  v18 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v19 = -[PLPlatterHeaderContentViewLayoutManager _heedsHorizontalLayoutMargins](self, "_heedsHorizontalLayoutMargins");
  -[PLPlatterHeaderContentViewLayoutManager _layoutMargins](self, "_layoutMargins");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v61, "sizeToFit");
  if (!v14)
  {
    objc_msgSend(v61, "bounds");
    v59 = v44;
    v60 = v43;
    v57 = v46;
    v58 = v45;
    if (!v18)
    {
LABEL_26:
      v66.origin.x = v6;
      v66.size.width = v55;
      v66.origin.y = v56;
      v66.size.height = rect;
      CGRectGetWidth(v66);
      v67.origin.y = v59;
      v67.origin.x = v60;
      v67.size.height = v57;
      v67.size.width = v58;
      CGRectGetMaxX(v67);
      goto LABEL_28;
    }
LABEL_24:
    v65.origin.y = v59;
    v65.origin.x = v60;
    v65.size.height = v57;
    v65.size.width = v58;
    CGRectGetMinX(v65);
    goto LABEL_28;
  }
  v53 = v6;
  v24 = (void *)MEMORY[0x1E0CEABB0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __72__PLPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke;
  v62[3] = &unk_1E91D3160;
  v25 = v61;
  v63 = v25;
  objc_msgSend(v24, "performWithoutAnimation:", v62);

  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v25, "contentRectForBounds:");
  objc_msgSend(v25, "titleRectForContentRect:");
  v59 = v35;
  v60 = v34;
  v57 = v37;
  v58 = v36;
  if (v19)
  {
    v38 = v21;
  }
  else
  {
    v23 = 16.0;
    v38 = 16.0;
  }
  if (v18)
    v39 = v38;
  else
    v39 = v23;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = v53;
    if (!v18)
      goto LABEL_26;
    goto LABEL_24;
  }
  if (v18)
    v40 = v38;
  else
    v40 = 0.0;
  if (v18)
    v41 = 0.0;
  else
    v41 = v23;
  objc_msgSend(v25, "setTitleEdgeInsets:", 0.0, v40, 0.0, v41);
  v64.origin.x = v27;
  v64.origin.y = v29;
  v64.size.width = v31;
  v64.size.height = v33;
  v42 = v39 + CGRectGetWidth(v64);
  if (!v18)
  {
    v68.size.height = rect;
    v68.origin.x = v53;
    v68.size.width = v55;
    v68.origin.y = v56;
    CGRectGetWidth(v68);
    v69.origin.x = v27;
    v69.origin.y = v29;
    v69.size.width = v42;
    v69.size.height = v33;
    CGRectGetWidth(v69);
  }
LABEL_28:
  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "text");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "length");

  if (v50)
  {
    -[PLPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "titleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_firstLineBaselineOffsetFromBoundsTop");
    v70.origin.y = v59;
    v70.origin.x = v60;
    v70.size.height = v57;
    v70.size.width = v58;
    CGRectGetMinY(v70);

  }
  else
  {
    UIRectCenteredYInRect();
  }
  UIRectIntegralWithScale();
  objc_msgSend(v61, "setFrame:");

}

uint64_t __72__PLPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)layoutDateLabelWithScale:(double)a3
{
  void *v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[PLPlatterHeaderContentViewLayoutManager _dateLabel](self, "_dateLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_12;
  v31 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "bounds");
  v29 = v7;
  v30 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[PLPlatterHeaderContentViewLayoutManager _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(v31, "sizeToFit");
  -[PLPlatterHeaderContentViewLayoutManager _utilityButton](self, "_utilityButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v13, "alpha");
    v17 = v16;
    goto LABEL_6;
  }
  objc_msgSend(v13, "currentImage");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v13, "alpha");
    v17 = v20;

LABEL_6:
    if (v17 > 0.0)
    {
      objc_msgSend(v13, "frame");
      CGRectGetWidth(v32);
    }
    goto LABEL_9;
  }

LABEL_9:
  objc_msgSend(v31, "frame");
  v24 = v23;
  v26 = v25;
  if (!v12)
  {
    v27 = v21;
    v28 = v22;
    v33.size.width = v29;
    v33.origin.x = v30;
    v33.origin.y = v9;
    v33.size.height = v11;
    CGRectGetWidth(v33);
    v34.origin.x = v27;
    v34.origin.y = v28;
    v34.size.width = v24;
    v34.size.height = v26;
    CGRectGetWidth(v34);
  }
  -[PLPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
  objc_msgSend(v31, "_firstLineBaselineOffsetFromBoundsTop");
  UIRectIntegralWithScale();
  objc_msgSend(v31, "setFrame:");

  v4 = v31;
LABEL_12:

}

+ (double)_titleLabelBaselineOffsetWithFont:(id)a3
{
  double v3;

  objc_msgSend(a3, "_scaledValueForValue:", 15.0);
  return v3 + 10.0;
}

- (BOOL)_shouldReverseLayoutDirection
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  v3 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");

  return v3;
}

- (BOOL)_heedsHorizontalLayoutMargins
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  v3 = objc_msgSend(WeakRetained, "heedsHorizontalLayoutMargins");

  return v3;
}

- (NSArray)_iconButtons
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "iconButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (UILabel)_titleLabel
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(WeakRetained, "_titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UILabel *)v4;
}

- (NSDate)_date
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (UILabel)_dateLabel
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "_dateLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UILabel *)v3;
}

- (UIView)_utilityView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "utilityView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIButton)_utilityButton
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "_utilityButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (UIEdgeInsets)_layoutMargins
{
  id WeakRetained;
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
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)_titleLabelBaselineOffset
{
  void *v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  objc_msgSend(WeakRetained, "_titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_titleLabelBaselineOffsetWithFont:", v5);
  v7 = v6;

  return v7;
}

- (CGSize)_measuringSizeForWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = a3 + -10.0 + -7.0;
  v4 = 1.79769313e308;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)_titleLabelBoundsForSize:(CGSize)a3 withNumberOfLines:(double)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[PLPlatterHeaderContentViewLayoutManager _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLPlatterHeaderContentViewLayoutManager _titleLabelBaselineOffset](self, "_titleLabelBaselineOffset");
    BSRectWithSize();
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (PLPlatterHeaderContentView)headerContentView
{
  return (PLPlatterHeaderContentView *)objc_loadWeakRetained((id *)&self->_headerContentView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerContentView);
}

@end
