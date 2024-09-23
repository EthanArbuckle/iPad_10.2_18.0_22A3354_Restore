@implementation SBDockView

- (SBDockIconListView)dockListView
{
  return self->_iconListView;
}

- (BOOL)isDockInset
{
  void *v2;
  double v3;
  double v4;

  -[SBDockView _visualConfiguration](self, "_visualConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockBackgroundViewCornerRadius");
  v4 = v3;

  return v4 > 0.0;
}

- (void)setDockListOffset:(double)a3
{
  if (self->_dockListOffset != a3)
  {
    self->_dockListOffset = a3;
    -[SBDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundAlpha:(double)a3
{
  -[SBHighlightView setAlpha:](self->_highlightView, "setAlpha:");
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", a3);
  -[UIView setAlpha:](self->_accessibilityBackgroundView, "setAlpha:", a3);
  -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:", a3);
}

- (id)_visualConfiguration
{
  void *v2;
  void *v3;

  -[SBDockView _listLayout](self, "_listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolderVisualConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_listLayout
{
  void *v2;
  void *v3;

  -[SBIconListView layoutProvider](self->_iconListView, "layoutProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)dockHeight
{
  void *v2;
  double v3;
  double v4;

  -[SBDockView _visualConfiguration](self, "_visualConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockViewHeight");
  v4 = v3;

  return v4;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBDockView)initWithDockListView:(id)a3 forSnapshot:(BOOL)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBDockView *v12;
  SBDockView *v13;
  double v14;
  SBHighlightView *v15;
  SBHighlightView *highlightView;
  void *v17;

  v7 = a3;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[SBDockView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconListView, a3);
    v13->_dockEdge = 4;
    v13->_forSnapshot = a4;
    -[SBDockView _layoutScale](v13, "_layoutScale");
    v15 = -[SBHighlightView initWithFrame:highlightAlpha:highlightHeight:]([SBHighlightView alloc], "initWithFrame:highlightAlpha:highlightHeight:", v8, v9, v10, v11, 0.05, 1.0 / v14);
    highlightView = v13->_highlightView;
    v13->_highlightView = v15;

    -[SBDockView addSubview:](v13, "addSubview:", v13->_iconListView);
    -[SBDockView addSubview:](v13, "addSubview:", v13->_highlightView);
    -[SBDockView _updateCornerRadii](v13, "_updateCornerRadii");
    -[SBDockView _backgroundContrastDidChange:](v13, "_backgroundContrastDidChange:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v13, sel__backgroundContrastDidChange_, *MEMORY[0x1E0DC45B8], 0);

    -[SBDockView setAutoresizesSubviews:](v13, "setAutoresizesSubviews:", 0);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBDockView;
  -[SBDockView dealloc](&v4, sel_dealloc);
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBDockView updateAccessibilityTintColor](self, "updateAccessibilityTintColor");
  }

}

- (void)setDockEdge:(unint64_t)a3
{
  if (self->_dockEdge != a3)
  {
    self->_dockEdge = a3;
    -[SBDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v5 = v7;
    if (v7)
    {
      -[SBDockView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);
      -[SBDockView _updateCornerRadii](self, "_updateCornerRadii");
      v5 = v7;
    }
  }

}

- (double)dockHeightPadding
{
  void *v2;
  double v3;
  double v4;

  -[SBDockView _visualConfiguration](self, "_visualConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockListViewInsets");
  v4 = v3;

  return v4;
}

- (CGRect)dockListViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGRect result;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  -[SBDockView getDockViewMetrics:](self, "getDockViewMetrics:", &v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = *((double *)&v7 + 1);
  v4 = *(double *)&v7;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)getDockViewMetrics:(id *)a3
{
  double x;
  double y;
  double width;
  double height;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  char IsZero;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect v68;
  CGRect v69;

  -[SBDockView bounds](self, "bounds");
  x = v68.origin.x;
  y = v68.origin.y;
  width = v68.size.width;
  height = v68.size.height;
  v9 = CGRectGetWidth(v68);
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  v10 = CGRectGetHeight(v69);
  -[SBDockView _visualConfiguration](self, "_visualConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dockListViewInsets");
  SBFEdgeInsetsRelativeToRectEdge();
  v13 = v12;
  v15 = v14;
  v66 = v16;
  v64 = v17;

  -[SBDockView _visualConfiguration](self, "_visualConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dockBackgroundViewInsets");
  SBFEdgeInsetsRelativeToRectEdge();
  v59 = v19;
  v54 = v21;
  v55 = v20;
  v57 = v22;

  -[SBDockView _dockOverhangInsets](self, "_dockOverhangInsets");
  v58 = v23;
  v52 = v25;
  v53 = v24;
  v56 = v26;
  v60 = v10;
  v61 = v9;
  v62 = x;
  v63 = y;
  v27 = x + v15;
  v28 = y + v13;
  v29 = v15 + v64;
  v65 = width;
  v30 = width - v29;
  v31 = v13 + v66;
  v67 = height;
  v32 = height - v31;
  v33 = v27;
  v34 = v28;
  v35 = v30;
  v36 = v32;
  if (v9 >= v10)
  {
    v51 = CGRectGetMinY(*(CGRect *)&v33) + -1.0;
    -[SBHighlightView highlightHeight](self->_highlightView, "highlightHeight");
    v40 = v41 + 2.0;
    v37 = v27;
    v39 = v30;
  }
  else
  {
    v37 = CGRectGetMinX(*(CGRect *)&v33) + -1.0;
    -[SBHighlightView highlightHeight](self->_highlightView, "highlightHeight");
    v39 = v38 + 2.0;
    v51 = v28;
    v40 = v32;
  }
  -[SBDockView dockListOffset](self, "dockListOffset");
  v43 = v42;
  IsZero = BSFloatIsZero();
  v45 = v27 + v43;
  v46 = v28 + v43;
  if (v61 < v60)
    v45 = v27;
  else
    v46 = v28;
  if ((IsZero & 1) != 0)
  {
    v46 = v28;
    v45 = v27;
  }
  v47 = v62 + v55 + v53;
  v48 = v63 + v59 + v58;
  v49 = v65 - (v55 + v54) - (v53 + v52);
  a3->var0.origin.x = v45;
  a3->var0.origin.y = v46;
  a3->var0.size.width = v30;
  a3->var0.size.height = v32;
  a3->var1.origin.x = v37;
  a3->var1.origin.y = v51;
  a3->var1.size.width = v39;
  a3->var1.size.height = v40;
  a3->var2.origin.x = v47;
  a3->var2.origin.y = v48;
  v50 = v67 - (v59 + v57) - (v58 + v56);
  a3->var2.size.width = v49;
  a3->var2.size.height = v50;
  a3->var3.origin.x = v47;
  a3->var3.origin.y = v48;
  a3->var3.size.width = v49;
  a3->var3.size.height = v50;
  a3->var4.origin.x = v47;
  a3->var4.origin.y = v48;
  a3->var4.size.width = v49;
  a3->var4.size.height = v50;
}

- (UIEdgeInsets)_dockOverhangInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat Height;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat rect;
  double rect_8;
  CGFloat rect_16;
  double rect_24;
  double v34;
  CGRect v35;
  CGRect v36;
  UIEdgeInsets result;

  -[SBDockView _minimumHomeScreenScale](self, "_minimumHomeScreenScale");
  v4 = v3;
  v6 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (!-[SBDockView isDockInset](self, "isDockInset") && BSFloatGreaterThanFloat())
  {
    v9 = -[SBDockView dockEdge](self, "dockEdge");
    -[SBDockView bounds](self, "bounds");
    v11 = v10;
    rect = v10;
    v13 = v12;
    v15 = v14;
    rect_16 = v16;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    rect_24 = v19;
    v34 = v18;

    v35.origin.x = v11;
    v35.origin.y = v13;
    v35.size.width = v15;
    v35.size.height = rect_16;
    rect_8 = CGRectGetWidth(v35);
    v36.origin.x = rect;
    v36.origin.y = v13;
    v36.size.width = v15;
    v36.size.height = rect_16;
    Height = CGRectGetHeight(v36);
    v21 = 1.0 / v4 + -1.0;
    v22 = v21 * v34;
    v23 = v21 * rect_24;
    if (rect_8 >= Height)
    {
      v24 = 0.0;
      if (v9 == 1)
        v25 = 0.0;
      else
        v25 = v23;
      v8 = v8 - v25;
      if (v9 == 1)
        v24 = v23;
      v6 = v6 - v24;
      v5 = v5 - v22 * 0.5;
      v7 = v7 - v22 * 0.5;
    }
    else
    {
      if (v9 == 2)
        v5 = -v22;
      else
        v7 = -v22;
      v8 = v23 * -0.5;
      v6 = v23 * -0.5;
    }
  }
  v26 = v6;
  v27 = v5;
  v28 = v8;
  v29 = v7;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (void)layoutSubviews
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  -[SBDockView getDockViewMetrics:](self, "getDockViewMetrics:", &v3);
  -[SBIconListView setFrame:](self->_iconListView, "setFrame:", v3, v4);
  -[SBHighlightView sbf_setBoundsAndPositionFromFrame:](self->_highlightView, "sbf_setBoundsAndPositionFromFrame:", v5, v6);
  -[UIView sbf_setBoundsAndPositionFromFrame:](self->_backgroundView, "sbf_setBoundsAndPositionFromFrame:", v7, v8);
  -[UIImageView sbf_setBoundsAndPositionFromFrame:](self->_backgroundImageView, "sbf_setBoundsAndPositionFromFrame:", v9, v10);
  -[UIView sbf_setBoundsAndPositionFromFrame:](self->_accessibilityBackgroundView, "sbf_setBoundsAndPositionFromFrame:", v11, v12);
}

- (double)_minimumHomeScreenScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SBDockView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "minimumHomeScreenScaleForDockView:", self);
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (void)listLayoutProviderDidChange
{
  -[SBDockView _updateCornerRadii](self, "_updateCornerRadii");
  -[SBDockView setNeedsLayout](self, "setNeedsLayout");
  -[SBDockView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_backgroundContrastDidChange:(id)a3
{
  _BOOL4 IsReduceTransparencyEnabled;
  UIView *accessibilityBackgroundView;
  id v6;
  UIView *v7;
  UIView *v8;
  UIView *backgroundView;
  UIImageView *v10;
  UIView *v11;
  UIImageView *v12;
  _OWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  accessibilityBackgroundView = self->_accessibilityBackgroundView;
  if (!IsReduceTransparencyEnabled)
  {
    if (!accessibilityBackgroundView)
      return;
    backgroundView = self->_backgroundView;
    if (backgroundView)
    {
      v10 = backgroundView;
    }
    else
    {
      v10 = self->_backgroundImageView;
      if (!v10)
      {
        v12 = 0;
        goto LABEL_10;
      }
    }
    v12 = v10;
    -[SBDockView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10, 0);
LABEL_10:
    -[UIView removeFromSuperview](self->_accessibilityBackgroundView, "removeFromSuperview");
    v11 = self->_accessibilityBackgroundView;
    self->_accessibilityBackgroundView = 0;

    return;
  }
  if (!accessibilityBackgroundView)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    memset(v13, 0, sizeof(v13));
    -[SBDockView getDockViewMetrics:](self, "getDockViewMetrics:", v13);
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", v14, v15);
    v8 = self->_accessibilityBackgroundView;
    self->_accessibilityBackgroundView = v7;

    -[SBDockView updateAccessibilityTintColor](self, "updateAccessibilityTintColor");
    -[SBDockView _updateCornerRadii](self, "_updateCornerRadii");
    -[SBDockView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_accessibilityBackgroundView, 0);
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    -[UIImageView removeFromSuperview](self->_backgroundImageView, "removeFromSuperview");
  }
}

- (void)updateAccessibilityTintColor
{
  void *v3;
  id v4;

  if (self->_accessibilityBackgroundView)
  {
    -[SBDockView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityTintColorForDockView:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIView setBackgroundColor:](self->_accessibilityBackgroundView, "setBackgroundColor:", v3);

  }
}

- (void)_updateCornerRadii
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[SBDockView _visualConfiguration](self, "_visualConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockBackgroundViewCornerRadius");
  v5 = v4;

  -[UIView _cornerRadius](self->_backgroundView, "_cornerRadius");
  if (v5 != v6
    || (-[UIImageView _cornerRadius](self->_backgroundImageView, "_cornerRadius"), v5 != v7)
    || (-[UIView _cornerRadius](self->_accessibilityBackgroundView, "_cornerRadius"), v5 != v8))
  {
    -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v5);
    -[UIImageView _setContinuousCornerRadius:](self->_backgroundImageView, "_setContinuousCornerRadius:", v5);
    -[UIView _setContinuousCornerRadius:](self->_accessibilityBackgroundView, "_setContinuousCornerRadius:", v5);
    -[SBHighlightView setHidden:](self->_highlightView, "setHidden:", v5 > 0.0);
    -[SBDockView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIColor)accessibilityBackgroundColor
{
  return -[UIView backgroundColor](self->_accessibilityBackgroundView, "backgroundColor");
}

- (double)_layoutScale
{
  void *v2;
  double v3;
  double v4;

  -[SBDockView _listLayout](self, "_listLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageInfo");
  v4 = v3;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)dockEdge
{
  return self->_dockEdge;
}

- (double)dockListOffset
{
  return self->_dockListOffset;
}

- (SBDockViewDelegate)delegate
{
  return (SBDockViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_accessibilityBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
}

@end
