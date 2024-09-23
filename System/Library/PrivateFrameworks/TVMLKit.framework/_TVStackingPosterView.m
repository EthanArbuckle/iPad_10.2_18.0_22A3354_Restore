@implementation _TVStackingPosterView

- (_TVStackingPosterView)initWithFrame:(CGRect)a3
{
  _TVStackingPosterView *v3;
  _TVStackingPosterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVStackingPosterView;
  v3 = -[_TVStackingPosterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVStackingPosterView _commonInit](v3, "_commonInit");
  return v4;
}

- (_TVStackingPosterView)initWithCoder:(id)a3
{
  _TVStackingPosterView *v3;
  _TVStackingPosterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVStackingPosterView;
  v3 = -[_TVStackingPosterView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_TVStackingPosterView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setWantsDimmingOverlay:", 1);
  -[_TVStackingPosterView _setIdleModeLayoutAttributes:](self, "_setIdleModeLayoutAttributes:", v3);

}

- (void)setMaxBoundsSize:(CGSize)a3
{
  __int128 v4;
  _OWORD v5[9];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (self->_maxBoundsSize.width != a3.width || self->_maxBoundsSize.height != a3.height)
  {
    self->_maxBoundsSize = a3;
    v4 = *MEMORY[0x24BDF7718];
    v8 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5[2] = v8;
    memset(&v5[3], 0, 96);
    v6 = *MEMORY[0x24BDBF148];
    v7 = v4;
    v5[0] = v6;
    v5[1] = v4;
    -[_TVStackingPosterView setCellMetrics:](self, "setCellMetrics:", v5);
  }
}

- (void)setComponents:(id)a3
{
  -[_TVStackingPosterView setComponents:mainImageComponent:](self, "setComponents:mainImageComponent:", a3, 0);
}

- (void)setComponents:(id)a3 mainImageComponent:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *components;
  double *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  _TVAnimatedLabel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  _TVAnimatedLabel *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[18];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (NSArray *)objc_msgSend(v6, "copy");
  components = self->_components;
  self->_components = v8;

  -[_TVStackingPosterView _resetSubviews](self, "_resetSubviews");
  v10 = (double *)MEMORY[0x24BDBF148];
  v11 = *MEMORY[0x24BDBF148];
  v13 = *MEMORY[0x24BDF7718];
  v12 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  memset(&v52[12], 0, 96);
  v52[9] = v11;
  v52[2] = v12;
  memset(&v52[3], 0, 96);
  v52[10] = v13;
  v52[11] = v12;
  v52[0] = v11;
  v52[1] = v13;
  -[_TVStackingPosterView setCellMetrics:](self, "setCellMetrics:", v52);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  v42 = v15;
  if (!v16)
  {
    v44 = 0;
    v38 = v15;
LABEL_37:

    goto LABEL_39;
  }
  v17 = v16;
  v44 = 0;
  v18 = *(_QWORD *)v49;
  v19 = *v10;
  v20 = v10[1];
  v41 = CFSTR("marquee-and-show-on-highlight");
  v21 = v43;
  v45 = v14;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v49 != v18)
        objc_enumerationMutation(v15);
      v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v22);
      if (!v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || objc_msgSend(v23, "conformsToProtocol:", &unk_25578CA30))
        {
          v7 = v23;
          v32 = v14;
          v33 = v7;
          goto LABEL_22;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      v24 = v23;
      objc_msgSend(v24, "valueForTVViewStyle:", CFSTR("tv-text-highlight-style"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "tv_marqueeOnHighlight") & 1) == 0)
      {

        v14 = v45;
LABEL_21:
        v32 = v14;
        v33 = v23;
LABEL_22:
        objc_msgSend(v32, "addObject:", v33, v41);
        goto LABEL_23;
      }
      if (!v44)
      {
        v26 = -[_TVAnimatedLabel initWithSize:]([_TVAnimatedLabel alloc], "initWithSize:", v19, v20);
        objc_msgSend(v24, "tv_layout");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v24, "tv_layout");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView tv_setLayout:](v26, "tv_setLayout:", v28);

        }
        -[_TVLabel setNumberOfLines:](v26, "setNumberOfLines:", 1, v41);
        -[UIView setValue:forTVViewStyle:](v26, "setValue:forTVViewStyle:", v25, CFSTR("tv-text-highlight-style"));
        -[_TVLabel setLineBreakMode:](v26, "setLineBreakMode:", 2);
        objc_msgSend(v24, "_defaultAttributes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "copy");
        -[_TVAnimatedLabel _setDefaultAttributes:](v26, "_setDefaultAttributes:", v30);

        if (objc_msgSend(v25, "isEqualToString:", CFSTR("marquee-on-highlight")))
        {
          objc_msgSend(v24, "highlightedTextColor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVAnimatedLabel setHighlightedTextColor:](v26, "setHighlightedTextColor:", v31);

        }
        else
        {
          -[_TVAnimatedLabel setUnderPosterOutset:](v26, "setUnderPosterOutset:", 20.0);
        }
        if ((objc_msgSend(v25, "isEqualToString:", CFSTR("show-on-highlight")) & 1) != 0
          || objc_msgSend(v25, "isEqualToString:", v41))
        {
          -[_TVStackingPosterView _updateShadowForLabel:inFocus:](self, "_updateShadowForLabel:inFocus:", v26, 1);
          -[_TVAnimatedLabel setHighlighted:](v26, "setHighlighted:", 1);
        }
        objc_msgSend(v45, "addObject:", v26);
        objc_msgSend(v24, "tv_associatedIKViewElement");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = v26;
        if (v34)
        {
          objc_msgSend(v24, "tv_associatedIKViewElement");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView transferLayoutStylesFromElement:](v26, "transferLayoutStylesFromElement:", v35);

        }
        v15 = v42;
        v21 = v43;
      }
      objc_msgSend(v21, "addObject:", v24, v41);

      v14 = v45;
LABEL_23:
      ++v22;
    }
    while (v17 != v22);
    v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    v17 = v36;
  }
  while (v36);

  if (v44)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __58___TVStackingPosterView_setComponents_mainImageComponent___block_invoke;
    v46[3] = &unk_24EB86880;
    v47 = v37;
    v38 = v37;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v46);
    v39 = (void *)objc_msgSend(v38, "copy");
    -[_TVAnimatedLabel setAttributedStrings:](v44, "setAttributedStrings:", v39);

    goto LABEL_37;
  }
  v44 = 0;
LABEL_39:
  -[_TVStackingPosterView setFilteredComponents:](self, "setFilteredComponents:", v14, v41);
  -[_TVStackingPosterView setMainImageComponent:](self, "setMainImageComponent:", v7);
  -[_TVStackingPosterView _updateFocusSizeIncrease](self, "_updateFocusSizeIncrease");
  -[_TVStackingPosterView setAnimatedLabel:](self, "setAnimatedLabel:", v44);
  v40 = (void *)objc_msgSend(v43, "copy");
  -[_TVStackingPosterView setMarqueeLabels:](self, "setMarqueeLabels:", v40);

}

- (void)setOverlayView:(id)a3
{
  UIView *v5;
  UIView *overlayView;
  UIView *v7;

  v5 = (UIView *)a3;
  overlayView = self->_overlayView;
  v7 = v5;
  if (overlayView != v5)
  {
    -[UIView removeFromSuperview](overlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayView, a3);
  }
  -[_TVStackingPosterView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setConfiguresForCollectionViewCell:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  if (self->_configuresForCollectionViewCell != a3)
  {
    self->_configuresForCollectionViewCell = a3;
    -[_TVStackingPosterView components](self, "components");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[_TVStackingPosterView _resetSubviews](self, "_resetSubviews");
      -[_TVStackingPosterView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (TVCellMetrics)cellMetrics
{
  char *p_height;
  TVCellMetrics *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  p_height = (char *)&self[4].cellSize.height;
  if (self[4].cellSize.height == *MEMORY[0x24BDBF148]
    && self[4].cellPadding.top == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v6 = self;
    -[TVCellMetrics maxBoundsSize](self, "maxBoundsSize");
    if (v7 <= 0.0)
    {
      -[TVCellMetrics bounds](v6, "bounds");
      v8 = v10;
      v9 = v11;
    }
    else
    {
      -[TVCellMetrics maxBoundsSize](v6, "maxBoundsSize");
    }
    self = (TVCellMetrics *)-[TVCellMetrics _cellMetricsForMaxSize:](v6, "_cellMetricsForMaxSize:", v8, v9);
    *((_OWORD *)p_height + 6) = v22;
    *((_OWORD *)p_height + 7) = v23;
    *((_OWORD *)p_height + 8) = v24;
    *((_OWORD *)p_height + 2) = v18;
    *((_OWORD *)p_height + 3) = v19;
    *((_OWORD *)p_height + 4) = v20;
    *((_OWORD *)p_height + 5) = v21;
    *(_OWORD *)p_height = v16;
    *((_OWORD *)p_height + 1) = v17;
    v6[3].cellInset.left = *((double *)p_height + 15) + *((double *)p_height + 17);
  }
  v12 = *((_OWORD *)p_height + 7);
  *(_OWORD *)&retstr->cellInsetAlt.bottom = *((_OWORD *)p_height + 6);
  *(_OWORD *)&retstr->cellMargin.top = v12;
  *(_OWORD *)&retstr->cellMargin.bottom = *((_OWORD *)p_height + 8);
  v13 = *((_OWORD *)p_height + 3);
  *(_OWORD *)&retstr->cellPadding.bottom = *((_OWORD *)p_height + 2);
  *(_OWORD *)&retstr->cellInset.top = v13;
  v14 = *((_OWORD *)p_height + 5);
  *(_OWORD *)&retstr->cellInset.bottom = *((_OWORD *)p_height + 4);
  *(_OWORD *)&retstr->cellInsetAlt.top = v14;
  v15 = *((_OWORD *)p_height + 1);
  retstr->cellSize = *(CGSize *)p_height;
  *(_OWORD *)&retstr->cellPadding.top = v15;
  return self;
}

- (void)setNeedsUpdateComponentLayout
{
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _OWORD v21[10];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v3 = *MEMORY[0x24BDBF148];
  v4 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v22 = *MEMORY[0x24BDF7718];
  v23 = v4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21[9] = v3;
  v21[2] = v4;
  memset(&v21[3], 0, 96);
  v21[0] = v3;
  v21[1] = v22;
  -[_TVStackingPosterView setCellMetrics:](self, "setCellMetrics:", v21);
  v5 = (void *)MEMORY[0x24BDBCEB8];
  -[_TVStackingPosterView marqueeLabels](self, "marqueeLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVStackingPosterView marqueeLabels](self, "marqueeLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54___TVStackingPosterView_setNeedsUpdateComponentLayout__block_invoke;
  v19[3] = &unk_24EB86880;
  v20 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);

  -[_TVStackingPosterView marqueeLabels](self, "marqueeLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVStackingPosterView animatedLabel](self, "animatedLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_defaultAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v12, "_setDefaultAttributes:", v14);

  -[_TVStackingPosterView animatedLabel](self, "animatedLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "highlightedTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHighlightedTextColor:", v16);

  -[_TVStackingPosterView animatedLabel](self, "animatedLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v17, "setAttributedStrings:", v18);

  -[_TVStackingPosterView _updateFocusSizeIncrease](self, "_updateFocusSizeIncrease");
  -[_TVStackingPosterView setNeedsLayout](self, "setNeedsLayout");

}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_preferredConfigurationForFocusAnimation:inContext:", a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_TVStackingPosterView;
    -[_TVStackingPosterView _preferredConfigurationForFocusAnimation:inContext:](&v12, sel__preferredConfigurationForFocusAnimation_inContext_, a3, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[_TVStackingPosterView _cellMetricsForMaxSize:](self, "_cellMetricsForMaxSize:", a3.width, a3.height);
  v3 = v5;
  v4 = v6;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _TVStackingPosterView *v16;
  void *v17;
  void *v18;
  objc_super v19;

  if (self->_requiresReconfiguration)
  {
    -[_TVStackingPosterView _configureSubviews](self, "_configureSubviews");
    self->_requiresReconfiguration = 0;
  }
  else
  {
    -[_TVStackingPosterView _updateComponentConstraints](self, "_updateComponentConstraints");
  }
  v19.receiver = self;
  v19.super_class = (Class)_TVStackingPosterView;
  -[_TVStackingPosterView layoutSubviews](&v19, sel_layoutSubviews);
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[_TVStackingPosterView overlayView](self, "overlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_TVStackingPosterView bounds](self, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      if (!-[_TVStackingPosterView configuresForCollectionViewCell](self, "configuresForCollectionViewCell"))
      {
        -[_TVStackingPosterView cellMetrics](self, "cellMetrics", 0, 0);
        v7 = 0.0;
        v9 = 0.0;
        v11 = v11 - (0.0 + 0.0);
        v13 = v13 - (0.0 + 0.0);
      }
      -[_TVStackingPosterView overlayView](self, "overlayView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

      -[_TVStackingPosterView overlayView](self, "overlayView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "superview");
      v16 = (_TVStackingPosterView *)objc_claimAutoreleasedReturnValue();

      if (v16 != self)
      {
        -[_TVStackingPosterView overlayView](self, "overlayView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVStackingPosterView insertSubview:above:](self, "insertSubview:above:", v17, v18);

      }
    }
  }
}

- (CGPoint)focusDirection
{
  double v3;
  double v4;
  CGPoint result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView focusDirection](self->_mainImageComponent, "focusDirection");
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setFocusDirection:(CGPoint)a3
{
  -[_TVStackingPosterView setFocusDirection:animated:](self, "setFocusDirection:animated:", 0, a3.x, a3.y);
}

- (void)setFocusDirection:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView setFocusDirection:animated:](self->_mainImageComponent, "setFocusDirection:animated:", v4, x, y);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView setPressed:animated:completion:](self->_mainImageComponent, "setPressed:animated:completion:", v6, v5, v8);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView setHighlighted:](self->_mainImageComponent, "setHighlighted:", v3);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 focusUpdateContext:(id)a5 withAnimationCoordinator:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void (**v17)(void);
  id v18;
  void (**v19)(_QWORD);
  double v20;
  _BOOL4 IsReduceMotionEnabled;
  void (**v22)(_QWORD);
  void *v23;
  _BOOL4 v24;
  double v25;
  double v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  void (**v29)(_QWORD);
  _QWORD v30[6];
  BOOL v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  _TVStackingPosterView *v35;
  BOOL v36;
  BOOL v37;
  _QWORD v38[5];
  id v39;
  BOOL v40;
  BOOL v41;
  CGRect v42;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  if (v8)
  {
    if (!v7)
    {
      -[_TVStackingPosterView subviews](self, "subviews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
        -[_TVStackingPosterView layoutIfNeeded](self, "layoutIfNeeded");
    }
  }
  else
  {
    -[_TVStackingPosterView bounds](self, "bounds");
    if (CGRectEqualToRect(v42, *MEMORY[0x24BDBF090]))
      goto LABEL_27;
  }
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_25578CA30))
  {
    -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  if (v11)
    objc_msgSend(v15, "setSelected:animated:withAnimationCoordinator:", v8, v7, v11);
  else
    objc_msgSend(v15, "setSelected:animated:", v8, v7);
  v16 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke;
  v38[3] = &unk_24EB868A8;
  v38[4] = self;
  v40 = v8;
  v41 = v7;
  v39 = v11;
  v17 = (void (**)(void))MEMORY[0x22767F470](v38);
  v17[2]();
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_2;
  v33[3] = &unk_24EB868A8;
  v18 = v15;
  v34 = v18;
  v35 = self;
  v36 = v8;
  v37 = v7;
  v19 = (void (**)(_QWORD))MEMORY[0x22767F470](v33);
  v20 = 0.0;
  if (v7)
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v20 = v8 ? 0.12 : 0.5;
    if (IsReduceMotionEnabled)
      v20 = 0.0;
  }
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_4;
  v30[3] = &unk_24EB868F8;
  v30[4] = self;
  v31 = v8;
  v32 = v7;
  *(double *)&v30[5] = v20;
  v22 = (void (**)(_QWORD))MEMORY[0x22767F470](v30);
  if (v7)
  {
    v23 = (void *)MEMORY[0x24BDF6F90];
    v24 = UIAccessibilityIsReduceMotionEnabled();
    v25 = 0.12;
    if (!v8)
      v25 = 0.5;
    if (v24)
      v26 = 0.0;
    else
      v26 = v25;
    v27[0] = v16;
    v27[1] = 3221225472;
    v27[2] = __90___TVStackingPosterView_setSelected_animated_focusUpdateContext_withAnimationCoordinator___block_invoke_6;
    v27[3] = &unk_24EB86920;
    v28 = v19;
    v29 = v22;
    objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 327684, v27, 0, v26, 0.0);

  }
  else
  {
    v19[2](v19);
    v22[2](v22);
  }

LABEL_27:
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  -[_TVStackingPosterView setSelected:animated:focusUpdateContext:withAnimationCoordinator:](self, "setSelected:animated:focusUpdateContext:withAnimationCoordinator:", a3, a4, 0, a5);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  -[_TVStackingPosterView setSelected:animated:focusUpdateContext:withAnimationCoordinator:](self, "setSelected:animated:focusUpdateContext:withAnimationCoordinator:", a3, a4, 0, 0);
}

- (UIEdgeInsets)tv_alignmentInsetsForExpectedWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[_TVStackingPosterView _cellMetricsForMaxSize:](self, "_cellMetricsForMaxSize:", a3, 0.0);
  v3 = v7;
  v4 = v8;
  v5 = v9;
  v6 = v10;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;
  UIEdgeInsets result;

  height = a3.height;
  width = a3.width;
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_25578CA30);

  if (v7)
  {
    -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionMarginsForSize:", width, height);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForTVViewStyle:", CFSTR("tv-focus-align"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("bottom"));

    if (v19)
    {
      v20 = v10 + v14;
      v21 = 0.0;
    }
    else
    {
      -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "valueForTVViewStyle:", CFSTR("tv-focus-align"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("top"));

      v25 = -0.0;
      if (v24)
        v25 = v10;
      v21 = v14 + v25;
      v20 = 0.0;
      if (!v24)
        v20 = v10;
    }
  }
  else
  {
    v20 = *MEMORY[0x24BDF7718];
    v12 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v21 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v16 = *(double *)(MEMORY[0x24BDF7718] + 24);
  }
  v26 = v12;
  v27 = v16;
  result.right = v27;
  result.bottom = v21;
  result.left = v26;
  result.top = v20;
  return result;
}

- (void)_resetSubviews
{
  void *v3;
  void *v4;
  NSLayoutConstraint *topAnchorConstraint;
  NSLayoutConstraint *bottomAnchorConstraint;
  NSLayoutConstraint *topImageConstraint;
  NSLayoutConstraint *bottomImageConstraint;

  -[_TVStackingPosterView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[_TVStackingPosterView constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackingPosterView removeConstraints:](self, "removeConstraints:", v4);

  topAnchorConstraint = self->_topAnchorConstraint;
  self->_topAnchorConstraint = 0;

  bottomAnchorConstraint = self->_bottomAnchorConstraint;
  self->_bottomAnchorConstraint = 0;

  topImageConstraint = self->_topImageConstraint;
  self->_topImageConstraint = 0;

  bottomImageConstraint = self->_bottomImageConstraint;
  self->_bottomImageConstraint = 0;

  self->_topAnchorConstant = 0.0;
  self->_bottomAnchorConstant = 0.0;
  self->_topImageConstant = 0.0;
  self->_bottomImageConstant = 0.0;
  self->_requiresReconfiguration = 1;
}

- (void)_updateSubviewHeirarchyWithComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _TVStackingPosterView *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_TVStackingPosterView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v12, "removeFromSuperview");
          objc_msgSend(v7, "removeObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63___TVStackingPosterView__updateSubviewHeirarchyWithComponents___block_invoke;
  v14[3] = &unk_24EB86948;
  v15 = v7;
  v16 = self;
  v13 = v7;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v14);

}

- (void)_configureSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  uint64_t i;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  char v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  double v46;
  double v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *topImageConstraint;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *bottomImageConstraint;
  NSLayoutConstraint *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  NSArray *v62;
  void *labelWidthConstraints;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  double labelWidthExpansionAmount;
  _BOOL4 v71;
  id obj;
  double v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  void *v90;
  _QWORD v91[2];
  _QWORD v92[3];
  _QWORD v93[2];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  -[_TVStackingPosterView filteredComponents](self, "filteredComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return;
  -[_TVStackingPosterView filteredComponents](self, "filteredComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v81 = 0u;
  -[_TVStackingPosterView cellMetrics](self, "cellMetrics");
  v71 = -[_TVStackingPosterView configuresForCollectionViewCell](self, "configuresForCollectionViewCell");
  v73 = *(double *)&v81;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  labelWidthExpansionAmount = self->_labelWidthExpansionAmount;
  -[_TVStackingPosterView _updateSubviewHeirarchyWithComponents:](self, "_updateSubviewHeirarchyWithComponents:", v5);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v5;
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
  v7 = 0;
  if (!v76)
  {
    v74 = 0;
    v69 = 0;
    goto LABEL_33;
  }
  v74 = 0;
  v69 = 0;
  v8 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v75 = *(_QWORD *)v78;
  v9 = 0.0;
  do
  {
    for (i = 0; i != v76; ++i)
    {
      if (*(_QWORD *)v78 != v75)
        objc_enumerationMutation(obj);
      v11 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * i);
      if (v11 == v6)
      {
        v12 = v6;
        objc_msgSend(v12, "tv_margin");
        v14 = v33;
        v18 = v34;
        v32 = 0.0;
        if (v71)
          v35 = 0.0;
        else
          v35 = -(*((double *)&v82 + 1) + *((double *)&v83 + 1));
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 7, 0, self, 7, 1.0, v35);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, self, 9, 1.0, 0.0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = v27;
        v93[1] = v36;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVStackingPosterView addConstraints:](self, "addConstraints:", v37);
      }
      else
      {
        v12 = v11;
        objc_msgSend(v12, "tv_margin");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v21 = v73 - (v15 + v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_msgSend(v12, "tv_showOnHighlight");
          v23 = v22;
          v24 = 0.0;
          if (!v22)
            v24 = 1.0;
          objc_msgSend(v12, "setAlpha:", v24);
          -[_TVStackingPosterView _labelWidthForWidth:component:expansionAmount:](self, "_labelWidthForWidth:component:expansionAmount:", v12, v21, labelWidthExpansionAmount);
          v26 = v25;
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 7, 0, 0, 0, 1.0, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v23 & 1) == 0)
            objc_msgSend(v68, "addObject:", v27);
          v28 = v12;
          objc_msgSend(v28, "tv_textSizeForWidth:", v26);
          v30 = v29;
          objc_msgSend(v28, "layer");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "setZPosition:", 901.0);
          v32 = 8.0;
        }
        else
        {
          objc_msgSend(v12, "sizeThatFits:", v21, 3.40282347e38);
          v30 = v38;
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 7, 0, 0, 0, 1.0, v21);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0.0;
        }
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 8, 0, 0, 0, 1.0, v30 + v32 * 2.0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, self, 9, 1.0, v16 - v20);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v92[0] = v27;
        v92[1] = v36;
        v92[2] = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 3);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVStackingPosterView addConstraints:](self, "addConstraints:", v39);

      }
      if (v12)
      {
        if (v7)
        {
          objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 3, 0, v7, 4, 1.0, fmax(v14, v8) - v9 - v32);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVStackingPosterView addConstraint:](self, "addConstraint:", v40);
          if (v12 == v6)
          {
            v42 = v69;
            v43 = v74;
            v69 = v40;
            goto LABEL_26;
          }
          v41 = v74;
          v42 = v74;
          v43 = v40;
          if (v7 == v6)
          {
LABEL_26:
            v44 = v40;

            v41 = v43;
          }
          v74 = v41;

        }
        v45 = v12;

        v7 = v45;
        v9 = v32;
        v8 = v18;
      }

    }
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v94, 16);
  }
  while (v76);
LABEL_33:

  if (v6)
  {
    -[_TVStackingPosterView bringSubviewToFront:](self, "bringSubviewToFront:", v6);
    v46 = *(double *)&v82;
    if (v71)
    {
      v46 = 0.0;
      v47 = 0.0;
    }
    else
    {
      v47 = -*(double *)&v83;
    }
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, self, 3, 1.0, v46);
    v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topImageConstraint = self->_topImageConstraint;
    self->_topImageConstraint = v48;

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, 0, self, 4, 1.0, v47);
    v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomImageConstraint = self->_bottomImageConstraint;
    self->_bottomImageConstraint = v50;

    v52 = self->_bottomImageConstraint;
    v91[0] = self->_topImageConstraint;
    v91[1] = v52;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVStackingPosterView addConstraints:](self, "addConstraints:", v53);

    v54 = v69;
    objc_storeStrong((id *)&self->_topAnchorConstraint, v69);
    v55 = v74;
    objc_storeStrong((id *)&self->_bottomAnchorConstraint, v74);
    -[NSLayoutConstraint constant](self->_topImageConstraint, "constant");
    self->_topImageConstant = v56;
    -[NSLayoutConstraint constant](self->_bottomImageConstraint, "constant");
    self->_bottomImageConstant = v57;
    objc_msgSend(v69, "constant");
    self->_topAnchorConstant = v58;
    objc_msgSend(v74, "constant");
    self->_bottomAnchorConstant = v59;
    v60 = v68;
    objc_msgSend(v68, "tv_arrayByMappingObjectsUsingBlock:", &__block_literal_global_27);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVStackingPosterView setVisibleLabelWidths:](self, "setVisibleLabelWidths:", v61);

    v62 = v68;
    labelWidthConstraints = self->_labelWidthConstraints;
    self->_labelWidthConstraints = v62;
  }
  else
  {
    -[_TVStackingPosterView subviews](self, "subviews");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "firstObject");
    labelWidthConstraints = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(labelWidthConstraints, "tv_margin");
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", labelWidthConstraints, 3, 0, self, 3, 1.0, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v66;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVStackingPosterView addConstraints:](self, "addConstraints:", v67);

    v60 = v68;
    v54 = v69;
    v55 = v74;
  }

}

- (void)_updateComponentConstraints
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  double *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
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
  void *v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  id obj;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  -[_TVStackingPosterView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __52___TVStackingPosterView__updateComponentConstraints__block_invoke;
  v75[3] = &unk_24EB869B0;
  v46 = v3;
  v76 = v46;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22767F470](v75);
  v5 = (double *)MEMORY[0x24BDF7718];
  v6 = *MEMORY[0x24BDF7718];
  v68 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v63 = 0u;
  v64 = 0u;
  v59 = v68;
  v60 = 0u;
  v7 = *MEMORY[0x24BDBF148];
  v65 = 0u;
  v66 = v7;
  v67 = v6;
  v61 = 0u;
  v62 = 0u;
  v57 = v7;
  v58 = v6;
  -[_TVStackingPosterView setCellMetrics:](self, "setCellMetrics:", &v57);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  -[_TVStackingPosterView cellMetrics](self, "cellMetrics");
  v51 = *(double *)&v57;
  v8 = (void *)MEMORY[0x24BDBCEB8];
  -[_TVStackingPosterView visibleLabelWidths](self, "visibleLabelWidths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[_TVStackingPosterView filteredComponents](self, "filteredComponents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = v5[2];
    v14 = *(_QWORD *)v54;
    v48 = *v5;
    v52 = 0.0;
    v49 = v13;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v17)
        {
          v32 = -[_TVStackingPosterView configuresForCollectionViewCell](self, "configuresForCollectionViewCell");
          v31 = 0.0;
          if (v32)
            v33 = 0.0;
          else
            v33 = -(*((double *)&v58 + 1) + *((double *)&v59 + 1));
          if (v32)
            v34 = 0.0;
          else
            v34 = *(double *)&v58;
          if (v32)
            v35 = 0.0;
          else
            v35 = -*(double *)&v59;
          ((void (**)(_QWORD, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v16, self, 7);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setConstant:", v33);
          ((void (**)(_QWORD, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v16, self, 3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setConstant:", v34);
          ((void (**)(_QWORD, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v16, self, 4);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setConstant:", v35);
          v19 = v48;
          v23 = v49;
        }
        else
        {
          objc_msgSend(v16, "tv_margin");
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v26 = v51 - (v20 + v24);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[_TVStackingPosterView _labelWidthForWidth:component:expansionAmount:](self, "_labelWidthForWidth:component:expansionAmount:", v16, v26, self->_labelWidthExpansionAmount);
            v26 = v27;
            if ((objc_msgSend(v16, "tv_showOnHighlight") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v28);

            }
            objc_msgSend(v16, "tv_textSizeForWidth:", v26);
            v30 = v29;
            v31 = 8.0;
          }
          else
          {
            objc_msgSend(v16, "sizeThatFits:", v26, 3.40282347e38);
            v30 = v39;
            v31 = 0.0;
          }
          ((void (**)(_QWORD, void *, _QWORD, uint64_t))v4)[2](v4, v16, 0, 7);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setConstant:", v26);
          ((void (**)(_QWORD, void *, _QWORD, uint64_t))v4)[2](v4, v16, 0, 8);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setConstant:", v30 + v31 * 2.0);
          ((void (**)(_QWORD, void *, _TVStackingPosterView *, uint64_t))v4)[2](v4, v16, self, 9);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setConstant:", v21 - v25);
        }

        if (v16)
        {
          if (v12)
          {
            ((void (**)(_QWORD, void *, void *, uint64_t))v4)[2](v4, v16, v12, 3);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setConstant:", fmax(v19, v13) - v52 - v31);

          }
          v41 = v16;

          v52 = v31;
          v12 = v41;
          v13 = v23;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  -[NSLayoutConstraint constant](self->_topImageConstraint, "constant");
  self->_topImageConstant = v42;
  -[NSLayoutConstraint constant](self->_bottomImageConstraint, "constant");
  self->_bottomImageConstant = v43;
  -[NSLayoutConstraint constant](self->_topAnchorConstraint, "constant");
  self->_topAnchorConstant = v44;
  -[NSLayoutConstraint constant](self->_bottomAnchorConstraint, "constant");
  self->_bottomAnchorConstant = v45;
  -[_TVStackingPosterView setVisibleLabelWidths:](self, "setVisibleLabelWidths:", v47);

}

- (TVCellMetrics)_cellMetricsForMaxSize:(SEL)a3
{
  double width;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  double *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v43;
  double v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  BOOL v57;
  id v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  char isKindOfClass;
  double v74;
  double v75;
  double v76;
  id v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  double v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  TVCellMetrics *result;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  double v108;
  double v109;
  double height;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  double v117;
  double v118;
  _QWORD v119[4];
  id v120;
  id v121;
  id v122;
  uint64_t *v123;
  uint64_t *v124;
  double v125;
  _QWORD v126[4];
  id v127;
  id v128;
  id v129;
  uint64_t *v130;
  uint64_t *v131;
  double v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  void *v144;
  double v145;
  double v146;
  double v147;
  double v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[128];
  uint64_t v154;

  height = a4.height;
  width = a4.width;
  v154 = *MEMORY[0x24BDAC8D0];
  -[_TVStackingPosterView filteredComponents](self, "filteredComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDF7718];
  v8 = *MEMORY[0x24BDF7718];
  v9 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v10 = (double *)MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v113 = v11;
  v111 = v12;
  v118 = *MEMORY[0x24BDF7718];
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_25578CA30))
  {
    objc_msgSend(v6, "selectionMarginsForSize:", v12, v11);
    v14 = v13;
    v108 = v16;
    v109 = v15;
    v18 = v17;
    objc_msgSend(v6, "valueForTVViewStyle:", CFSTR("tv-focus-align"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("bottom"));

    if (v20)
    {
      v102 = v14 + v18;
      v103 = 0.0;
    }
    else
    {
      objc_msgSend(v6, "valueForTVViewStyle:", CFSTR("tv-focus-align"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("top"));

      v23 = -0.0;
      if (v22)
        v23 = v14;
      v24 = v18 + v23;
      v25 = 0.0;
      if (!v22)
        v25 = v14;
      v102 = v25;
      v103 = v24;
    }
  }
  else
  {
    v108 = *(double *)(v7 + 24);
    v109 = *(double *)(v7 + 8);
    v102 = v8;
    v103 = v9;
  }
  -[UIView tv_padding](self, "tv_padding");
  v105 = v29;
  v106 = v28;
  v30 = v26 + v27;
  v31 = v26 + v27 < width;
  if (v26 + v27 >= width)
    v27 = 0.0;
  v112 = v27;
  if (!v31)
    v26 = 0.0;
  v114 = v26;
  if (v31)
    v32 = v30;
  else
    v32 = 0.0;
  -[_TVStackingPosterView mainImageComponent](self, "mainImageComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (double *)MEMORY[0x24BDBF148];
  v35 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v36 = width - v32;

  if (v33)
  {
    v37 = *v34;
    objc_msgSend(v6, "tv_sizeThatFits:", *v34, v35);
    v40 = v39;
    v41 = v38;
    if (v39 == v37 && v38 == v35)
    {
      objc_msgSend(v6, "frame");
      v40 = v43;
      v41 = v44;
    }
    if (v40 > v36 || v41 > height)
    {
      v46 = v36 / v40;
      v47 = 1.0;
      if (v36 <= 0.0)
        v46 = 1.0;
      if (height > 0.0)
        v47 = height / v41;
      v48 = fmin(v46, v47);
      v40 = floor(v40 * v48);
      v41 = floor(v41 * v48);
    }
    objc_msgSend(v6, "tv_margin");
    v117 = v51;
    v118 = v50;
    v53 = v52;
    if (v36 == 0.0)
    {
      v55 = v40;
    }
    else
    {
      v54 = v49;
      if (-[_TVStackingPosterView configuresForCollectionViewCell](self, "configuresForCollectionViewCell"))
      {
        v49 = v54;
        v55 = v36 - (v54 + v53);
        if (v40 <= 0.0)
          v41 = 0.0;
        else
          v41 = floor(v41 * (v55 / v40));
      }
      else
      {
        v55 = v40;
        v49 = v54;
      }
    }
    v104 = v49;
    v111 = v55;
    v56 = v49 + v53 + v55;
    v113 = v41;
    v35 = v41;
  }
  else
  {
    v56 = width - v32;
    v104 = *v10;
    v117 = v9;
  }
  v57 = v6 != 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v58 = v5;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v149, v153, 16);
  v60 = v10[1];
  if (v59)
  {
    v61 = 0;
    v62 = *(_QWORD *)v150;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v150 != v62)
          objc_enumerationMutation(v58);
        v64 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
        if (v64 == v6)
        {
          v57 = 0;
          v82 = fmax(v9, v118);
          v9 = v117;
          v83 = v82;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * i), "tv_margin");
          v66 = v65;
          v68 = v67;
          v70 = v69;
          v72 = v71;
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v74 = v56 - (v68 + v72);
          if ((isKindOfClass & 1) != 0)
          {
            -[_TVStackingPosterView _labelWidthForWidth:component:expansionAmount:](self, "_labelWidthForWidth:component:expansionAmount:", v64, v74, v108 + v109);
            v76 = v75;
            v77 = v64;
            objc_msgSend(v77, "tv_textSizeForWidth:", v76);
            v79 = v78;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v78);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v61 + i);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "setObject:forKeyedSubscript:", v80, v81);

          }
          else
          {
            objc_msgSend(v64, "sizeThatFits:", v74, 3.40282347e38);
            v79 = v84;
          }
          v83 = fmax(v9, v66) + v79;
          v82 = -0.0;
          if (v57)
            v82 = v83;
          v9 = v70;
        }
        v60 = v60 + v82;
        v35 = v35 + v83;
      }
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v149, v153, 16);
      v61 += i;
    }
    while (v59);
  }

  v85 = v106 + v105 + v9 + v35;
  v86 = v114 + v104;
  v87 = v85 - height;
  if (v85 > height && v87 < v113)
  {
    v89 = floor(v111 / v113 * (v113 - v87));
    v86 = v86 + floor((v111 - v89) * 0.5);
    v85 = v85 - v87;
    v113 = v113 - v87;
    v111 = v89;
  }
  v141 = 0;
  v142 = &v141;
  v143 = 0x4010000000;
  v144 = &unk_222E82B8D;
  v145 = v106;
  v146 = v114;
  v147 = v105;
  v148 = v112;
  v133 = 0;
  v134 = &v133;
  v135 = 0x4010000000;
  v136 = &unk_222E82B8D;
  v137 = v106;
  v138 = v114;
  v139 = v105;
  v140 = v112;
  v90 = MEMORY[0x24BDAC760];
  v126[0] = MEMORY[0x24BDAC760];
  v126[1] = 3221225472;
  v126[2] = __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke;
  v126[3] = &unk_24EB869D8;
  v132 = v56;
  v130 = &v133;
  v131 = &v141;
  v91 = v6;
  v127 = v91;
  v92 = v58;
  v128 = v92;
  v93 = v115;
  v129 = v93;
  objc_msgSend(v92, "enumerateObjectsUsingBlock:", v126);
  v119[0] = v90;
  v119[1] = 3221225472;
  v119[2] = __48___TVStackingPosterView__cellMetricsForMaxSize___block_invoke_2;
  v119[3] = &unk_24EB86A00;
  v125 = v56;
  v94 = v92;
  v120 = v94;
  v123 = &v133;
  v124 = &v141;
  v95 = v91;
  v121 = v95;
  v96 = v93;
  v122 = v96;
  objc_msgSend(v94, "enumerateObjectsWithOptions:usingBlock:", 2, v119);
  v97 = v114 + v112 + v56;
  retstr->cellSize.width = v97;
  retstr->cellSize.height = v85;
  if (v6)
  {
    retstr->cellPadding.top = v106 + v60;
    retstr->cellPadding.left = v86;
    retstr->cellPadding.bottom = v85 - (v106 + v60 + v113);
    retstr->cellPadding.right = v97 - (v111 + v86);
  }
  else
  {
    v98 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)&retstr->cellPadding.top = *MEMORY[0x24BDF7718];
    *(_OWORD *)&retstr->cellPadding.bottom = v98;
  }
  v99 = *((_OWORD *)v142 + 3);
  *(_OWORD *)&retstr->cellInset.top = *((_OWORD *)v142 + 2);
  *(_OWORD *)&retstr->cellInset.bottom = v99;
  v100 = *((_OWORD *)v134 + 3);
  *(_OWORD *)&retstr->cellInsetAlt.top = *((_OWORD *)v134 + 2);
  *(_OWORD *)&retstr->cellInsetAlt.bottom = v100;
  retstr->cellMargin.top = v102;
  retstr->cellMargin.left = v109;
  retstr->cellMargin.bottom = v103;
  retstr->cellMargin.right = v108;

  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v141, 8);

  return result;
}

- (double)_labelWidthForWidth:(double)a3 component:(id)a4 expansionAmount:(double)a5
{
  id v7;
  int v8;
  double v9;

  v7 = a4;
  if (objc_msgSend(v7, "tv_showOnHighlight"))
  {
    v8 = objc_msgSend(v7, "tv_marqueeOnHighlight");
    v9 = 40.0;
    if (!v8)
      v9 = 0.0;
    a3 = v9 + a5 + a3;
  }

  return a3;
}

- (void)_updateShadowForLabel:(id)a3 inFocus:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v5 = a3;
  v11 = v5;
  if (v4)
  {
    if (!_updateShadowForLabel_inFocus____ShadowColor)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)_updateShadowForLabel_inFocus____ShadowColor;
      _updateShadowForLabel_inFocus____ShadowColor = v6;

      v5 = v11;
    }
    objc_msgSend(v5, "setShadowColor:");
    v8 = 2.0;
    v9 = 0.0;
    v10 = 6.0;
  }
  else
  {
    objc_msgSend(v5, "setShadowColor:", 0);
    v9 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v10 = 0.0;
  }
  objc_msgSend(v11, "setShadowOffset:", v9, v8);
  objc_msgSend(v11, "setShadowBlur:", v10);

}

- (CGSize)maxBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxBoundsSize.width;
  height = self->_maxBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)components
{
  return self->_components;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)configuresForCollectionViewCell
{
  return self->_configuresForCollectionViewCell;
}

- (void)setCellMetrics:(TVCellMetrics *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  self->_cellMetrics.cellSize = a3->cellSize;
  v3 = *(_OWORD *)&a3->cellInset.bottom;
  v5 = *(_OWORD *)&a3->cellPadding.top;
  v4 = *(_OWORD *)&a3->cellPadding.bottom;
  *(_OWORD *)&self->_cellMetrics.cellInset.top = *(_OWORD *)&a3->cellInset.top;
  *(_OWORD *)&self->_cellMetrics.cellInset.bottom = v3;
  *(_OWORD *)&self->_cellMetrics.cellPadding.top = v5;
  *(_OWORD *)&self->_cellMetrics.cellPadding.bottom = v4;
  v6 = *(_OWORD *)&a3->cellMargin.bottom;
  v8 = *(_OWORD *)&a3->cellInsetAlt.top;
  v7 = *(_OWORD *)&a3->cellInsetAlt.bottom;
  *(_OWORD *)&self->_cellMetrics.cellMargin.top = *(_OWORD *)&a3->cellMargin.top;
  *(_OWORD *)&self->_cellMetrics.cellMargin.bottom = v6;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.top = v8;
  *(_OWORD *)&self->_cellMetrics.cellInsetAlt.bottom = v7;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (NSArray)filteredComponents
{
  return self->_filteredComponents;
}

- (void)setFilteredComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (UIView)mainImageComponent
{
  return self->_mainImageComponent;
}

- (void)setMainImageComponent:(id)a3
{
  objc_storeStrong((id *)&self->_mainImageComponent, a3);
}

- (_TVAnimatedLabel)animatedLabel
{
  return self->_animatedLabel;
}

- (void)setAnimatedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_animatedLabel, a3);
}

- (NSArray)marqueeLabels
{
  return self->_marqueeLabels;
}

- (void)setMarqueeLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (NSArray)visibleLabelWidths
{
  return self->_visibleLabelWidths;
}

- (void)setVisibleLabelWidths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleLabelWidths, 0);
  objc_storeStrong((id *)&self->_marqueeLabels, 0);
  objc_storeStrong((id *)&self->_animatedLabel, 0);
  objc_storeStrong((id *)&self->_mainImageComponent, 0);
  objc_storeStrong((id *)&self->_filteredComponents, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraints, 0);
  objc_storeStrong((id *)&self->_bottomImageConstraint, 0);
  objc_storeStrong((id *)&self->_topImageConstraint, 0);
  objc_storeStrong((id *)&self->_bottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_topAnchorConstraint, 0);
}

@end
