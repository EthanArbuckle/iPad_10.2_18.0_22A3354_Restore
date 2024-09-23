@implementation SBFluidSwitcherItemContainerFooterView

- (SBFluidSwitcherItemContainerFooterView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBFluidSwitcherItemContainerFooterView *v10;
  SBFluidSwitcherItemContainerFooterView *v11;
  void *v12;
  uint64_t v13;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v15;
  SBMedusaSettings *settings;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBFluidSwitcherItemContainerFooterView;
  v10 = -[SBFluidSwitcherItemContainerFooterView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v11, sel__handleTapGestureRecognizer_);
    tapGestureRecognizer = v11->_tapGestureRecognizer;
    v11->_tapGestureRecognizer = (UITapGestureRecognizer *)v13;

    -[SBFluidSwitcherItemContainerFooterView addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_tapGestureRecognizer);
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    settings = v11->_settings;
    v11->_settings = (SBMedusaSettings *)v15;

    -[PTSettings addKeyObserver:](v11->_settings, "addKeyObserver:", v11);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PTSettings removeKeyObserver:](self->_settings, "removeKeyObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherItemContainerFooterView;
  -[SBFluidSwitcherItemContainerFooterView dealloc](&v4, sel_dealloc);
}

- (void)setFooterStyle:(unint64_t)a3
{
  if (self->_footerStyle != a3)
  {
    self->_footerStyle = a3;
    -[SBFluidSwitcherItemContainerFooterView _updateIconViewsAndLabels](self, "_updateIconViewsAndLabels");
  }
}

- (void)setTextAlpha:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_textAlpha = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_titleLabels;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setAlpha:", a3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[BSUIEmojiLabelView setAlpha:](self->_subtitleLabel, "setAlpha:", a3);
  }
}

- (void)setIconAlignment:(unint64_t)a3
{
  if (self->_iconAlignment != a3)
  {
    self->_iconAlignment = a3;
    -[SBFluidSwitcherItemContainerFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUniqueIconsOnly:(BOOL)a3
{
  if (self->_uniqueIconsOnly != a3)
  {
    self->_uniqueIconsOnly = a3;
    -[SBFluidSwitcherItemContainerFooterView _reloadVisibleTitleItems](self, "_reloadVisibleTitleItems");
  }
}

- (void)setWantsIconPointerInteractions:(BOOL)a3
{
  if (self->_wantsIconPointerInteractions != a3)
  {
    self->_wantsIconPointerInteractions = a3;
    -[SBFluidSwitcherItemContainerFooterView _updateIconPointerInteractions](self, "_updateIconPointerInteractions");
  }
}

- (void)setIconHitTestOutset:(double)a3
{
  if (self->_iconHitTestOutset != a3)
  {
    self->_iconHitTestOutset = a3;
    -[SBFluidSwitcherItemContainerFooterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  NSArray *v5;
  NSArray *titleItems;

  v5 = (NSArray *)objc_msgSend(a3, "copy");
  titleItems = self->_titleItems;
  self->_titleItems = v5;

  -[SBFluidSwitcherItemContainerFooterView _reloadVisibleTitleItems](self, "_reloadVisibleTitleItems");
}

- (CGSize)intrinsicContentSize
{
  id *v3;
  uint64_t v4;
  NSMutableArray *iconViews;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  NSMutableArray *titleLabels;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  NSMutableArray *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  NSMutableArray *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t footerStyle;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGSize result;

  v3 = (id *)MEMORY[0x1E0CEB258];
  v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  iconViews = self->_iconViews;
  if (v4 == 1)
    -[NSMutableArray firstObject](iconViews, "firstObject");
  else
    -[NSMutableArray lastObject](iconViews, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;

  v11 = objc_msgSend(*v3, "userInterfaceLayoutDirection");
  titleLabels = self->_titleLabels;
  if (v11 == 1)
    -[NSMutableArray firstObject](titleLabels, "firstObject");
  else
    -[NSMutableArray lastObject](titleLabels, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;

  v18 = objc_msgSend(*v3, "userInterfaceLayoutDirection");
  v19 = self->_iconViews;
  if (v18 == 1)
    -[NSMutableArray lastObject](v19, "lastObject");
  else
    -[NSMutableArray firstObject](v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;

  v23 = objc_msgSend(*v3, "userInterfaceLayoutDirection");
  v24 = self->_titleLabels;
  if (v23 == 1)
    -[NSMutableArray lastObject](v24, "lastObject");
  else
    -[NSMutableArray firstObject](v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;

  v28 = v15 + v17;
  if (v8 + v10 >= v15 + v17)
    v28 = v8 + v10;
  if (v22 >= v27)
    v29 = v27;
  else
    v29 = v22;
  v30 = v28 - v29;
  footerStyle = self->_footerStyle;
  v32 = 36.0;
  if (footerStyle != 1)
    v32 = 30.0;
  if (footerStyle == 2)
    v33 = 46.0;
  else
    v33 = v32;
  -[SBFluidSwitcherItemContainerFooterView _maximumTitleLabelHeight](self, "_maximumTitleLabelHeight", v32);
  v35 = v34 + v33;
  -[BSUIEmojiLabelView intrinsicContentSize](self->_subtitleLabel, "intrinsicContentSize");
  v37 = v35 + v36;
  v38 = v30;
  result.height = v37;
  result.width = v38;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  unint64_t footerStyle;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t iconAlignment;
  id *v20;
  double MinX;
  double v22;
  double MidX;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  char v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double Width;
  double v57;
  uint64_t v58;
  double v59;
  double Height;
  uint64_t v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  NSMutableArray *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  uint64_t i;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  BSUIEmojiLabelView *subtitleLabel;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  BSUIEmojiLabelView *v88;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  double iconHitTestOutset;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  CGFloat v99;
  double rect;
  double v101;
  CGFloat v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  v108 = *MEMORY[0x1E0C80C00];
  -[SBFluidSwitcherItemContainerFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  footerStyle = self->_footerStyle;
  v12 = footerStyle - 1;
  v13 = 24.0;
  if (footerStyle == 1)
    v13 = 30.0;
  if (footerStyle == 2)
    v14 = 40.0;
  else
    v14 = v13;
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "switcherShelfSplitViewIconInset");
  v94 = v16;

  iconHitTestOutset = self->_iconHitTestOutset;
  v17 = -[NSMutableArray count](self->_iconViews, "count");
  v18 = v17;
  iconAlignment = self->_iconAlignment;
  v20 = (id *)MEMORY[0x1E0CEB258];
  v101 = v8;
  v102 = v6;
  rect = v10;
  if (iconAlignment == 1)
  {
    v29 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v30 = v4;
    v31 = v6;
    v32 = v8;
    v33 = v10;
    if (v29 == 1)
      MinX = CGRectGetMaxX(*(CGRect *)&v30) - v14;
    else
      MinX = CGRectGetMinX(*(CGRect *)&v30);
  }
  else
  {
    MinX = 0.0;
    if (!iconAlignment)
    {
      if (v12 > 1)
      {
        v110.origin.x = v4;
        v110.origin.y = v6;
        v110.size.width = v8;
        v110.size.height = v10;
        v34 = CGRectGetWidth(v110) / (double)v17;
        MinX = (v34 - v14) * 0.5;
        if (objc_msgSend(*v20, "userInterfaceLayoutDirection") == 1)
        {
          v111.origin.x = v4;
          v111.origin.y = v102;
          v111.size.width = v8;
          v111.size.height = v10;
          MinX = MinX + CGRectGetMaxX(v111) - v34;
        }
      }
      else
      {
        v22 = -(v94 - (double)v17 * (v14 + v94));
        v109.origin.x = v4;
        v109.size.width = v8;
        v109.origin.y = v102;
        v109.size.height = v10;
        MidX = CGRectGetMidX(v109);
        v24 = objc_msgSend(*v20, "userInterfaceLayoutDirection");
        v25 = 0.5;
        if (v24 == 1)
          v25 = -0.5;
        v26 = MidX - v22 * v25;
        v27 = objc_msgSend(*v20, "userInterfaceLayoutDirection");
        v28 = 0.0;
        if (v27 == 1)
          v28 = v14;
        MinX = v26 - v28;
      }
    }
  }
  SBFluidSwitcherItemContainerFooterViewIconOffsetForFooterStyle(self->_footerStyle, self->_iconAlignment);
  v36 = v35;
  v38 = MinX + v37;
  v39 = self->_iconAlignment;
  v99 = v4;
  v90 = v38;
  if (-[NSMutableArray count](self->_iconViews, "count"))
  {
    v40 = 0;
    if (v39)
      v41 = 0;
    else
      v41 = v12 >= 2;
    v42 = !v41;
    v43 = (double)v18;
    v44 = *MEMORY[0x1E0CEB4B0];
    v45 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v95 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    v97 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v92 = v14;
    v91 = v36;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v40);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidSwitcherItemContainerFooterView _updateIconViewShadow:](self, "_updateIconViewShadow:", v46);
      objc_msgSend(v46, "setFrame:", v38, v36, v14, v14);
      v47 = objc_msgSend(*v20, "userInterfaceLayoutDirection");
      if ((v42 & 1) != 0)
      {
        v112.origin.x = v38;
        v112.origin.y = v36;
        v112.size.width = v14;
        v112.size.height = v14;
        v48 = v94 + CGRectGetWidth(v112);
        if (v47 == 1)
          v49 = -v48;
        else
          v49 = v48;
        if (v12 > 1)
        {
          v55 = v44;
          v53 = v45;
          v54 = v95;
          v52 = v97;
        }
        else
        {
          if (v40)
            v50 = v94 * 0.5;
          else
            v50 = iconHitTestOutset;
          if (v40 == -[NSMutableArray count](self->_iconViews, "count") - 1)
            v51 = iconHitTestOutset;
          else
            v51 = v94 * 0.5;
          v52 = -iconHitTestOutset;
          v36 = v91;
          v14 = v92;
          v53 = -v50;
          v4 = v99;
          v54 = -v51;
          v55 = -iconHitTestOutset;
        }
      }
      else
      {
        v113.origin.x = v4;
        v113.size.width = v101;
        v113.origin.y = v102;
        v113.size.height = rect;
        Width = CGRectGetWidth(v113);
        if (v47 == 1)
          v57 = -Width;
        else
          v57 = Width;
        v55 = v44;
        v53 = v45;
        v54 = v95;
        v52 = v97;
        v49 = v57 / v43;
      }
      v38 = v38 + v49;
      objc_msgSend(v46, "setHitTestInsets:", v55, v53, v52, v54);

      ++v40;
    }
    while (v40 < -[NSMutableArray count](self->_iconViews, "count"));
  }
  v58 = -[NSMutableArray count](self->_titleLabels, "count");
  v114.origin.x = v4;
  v114.origin.y = v102;
  v114.size.width = v101;
  v114.size.height = rect;
  v98 = (double)v58;
  v59 = CGRectGetWidth(v114) / (double)v58;
  v115.origin.x = v4;
  v115.origin.y = v102;
  v115.size.width = v101;
  v115.size.height = rect;
  v96 = CGRectGetWidth(v115);
  v116.origin.x = v4;
  v116.origin.y = v102;
  v116.size.width = v101;
  v116.size.height = rect;
  Height = CGRectGetHeight(v116);
  v61 = objc_msgSend(*v20, "userInterfaceLayoutDirection");
  v62 = v4;
  v63 = v102;
  v64 = v101;
  v65 = rect;
  if (v61 == 1)
    v66 = CGRectGetMaxX(*(CGRect *)&v62) - v59;
  else
    v66 = CGRectGetMinX(*(CGRect *)&v62);
  v117.origin.x = v90;
  v117.origin.y = v36;
  v117.size.width = v14;
  v117.size.height = v14;
  v67 = CGRectGetMaxY(v117) + 6.0;
  if (-[SBFluidSwitcherItemContainerFooterView _hasTitleShadow](self, "_hasTitleShadow"))
    v68 = v67 + -2.0;
  else
    v68 = v67;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v69 = self->_titleLabels;
  v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v104;
    v73 = 0.0;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v104 != v72)
          objc_enumerationMutation(v69);
        v75 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        objc_msgSend(v75, "sizeThatFits:", v96 / v98 + -2.0, Height);
        v77 = v76;
        v79 = v78;
        if (-[NSMutableArray count](self->_titleLabels, "count") == 1)
          v77 = v77 + 12.0;
        if (-[SBFluidSwitcherItemContainerFooterView _hasTitleShadow](self, "_hasTitleShadow"))
          v79 = v79 + 4.0;
        objc_msgSend(v75, "setFrame:", v66 + (v59 - v77) * 0.5, v68, v77, v79);
        v80 = objc_msgSend(*v20, "userInterfaceLayoutDirection");
        v118.origin.x = v99;
        v118.size.height = rect;
        v118.size.width = v101;
        v118.origin.y = v102;
        v81 = CGRectGetWidth(v118);
        if (v80 == 1)
          v81 = -v81;
        v66 = v66 + v81 / v98;
        if (v73 < v79)
          v73 = v79;
      }
      v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
    }
    while (v71);
  }
  else
  {
    v73 = 0.0;
  }

  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[BSUIEmojiLabelView sizeThatFits:](subtitleLabel, "sizeThatFits:", v101, rect);
    v84 = v83;
    v85 = v68 + v73;
    v87 = v86 + 12.0;
    v88 = self->_subtitleLabel;
    v119.origin.x = v99;
    v119.origin.y = v102;
    v119.size.width = v101;
    v119.size.height = rect;
    v89 = CGRectGetMinX(v119);
    v120.origin.x = v99;
    v120.origin.y = v102;
    v120.size.width = v101;
    v120.size.height = rect;
    -[BSUIEmojiLabelView setFrame:](v88, "setFrame:", v89 + (CGRectGetWidth(v120) - v87) * 0.5, v85, v87, v84);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherItemContainerFooterView;
  if (-[SBFluidSwitcherItemContainerFooterView pointInside:withEvent:](&v14, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = -[NSMutableArray count](self->_iconViews, "count");
      v8 = v9 < v10;
      if (v9 >= v10)
        break;
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
      v12 = objc_msgSend(v11, "pointInside:withEvent:", v7);
      ++v9;

    }
    while (!v12);
  }

  return v8;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3)
    -[SBFluidSwitcherItemContainerFooterView _updateLabels](self, "_updateLabels");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  v6 = (void *)MEMORY[0x1E0CEA870];
  v7 = a3;
  objc_msgSend(a5, "rect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "hitTestInsets");
  objc_msgSend(v6, "regionWithRect:identifier:", 0, v9 + v20, v11 + v17, v13 - (v20 + v18), v15 - (v17 + v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", v4, v5);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_reloadVisibleTitleItems
{
  void *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_uniqueIconsOnly)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](self->_titleItems, "count"));
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_titleItems, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_titleItems;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "displayItem", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v3, "containsObject:", v12) & 1) == 0)
          {
            -[NSArray addObject:](v4, "addObject:", v10);
            objc_msgSend(v3, "addObject:", v12);
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = self->_titleItems;
  }
  if (-[NSArray isEqualToArray:](self->_visibleTitleItems, "isEqualToArray:", v4, (_QWORD)v13))
  {
    -[SBFluidSwitcherItemContainerFooterView _updateSubtitleLabel](self, "_updateSubtitleLabel");
  }
  else
  {
    objc_storeStrong((id *)&self->_visibleTitleItems, v4);
    -[SBFluidSwitcherItemContainerFooterView _updateIconViewsAndLabels](self, "_updateIconViewsAndLabels");
  }

}

- (void)_updateIconViewsAndLabels
{
  NSMutableArray *iconViews;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *titleLabels;
  unint64_t footerStyle;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  NSUInteger v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  iconViews = self->_iconViews;
  if (!iconViews)
  {
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
    v5 = self->_iconViews;
    self->_iconViews = v4;

    iconViews = self->_iconViews;
  }
  v6 = -[NSMutableArray count](iconViews, "count");
  v7 = v6 - -[NSArray count](self->_visibleTitleItems, "count");
  if (v7 < 1)
  {
    if (v7 < 0)
    {
      if (-v7 > 1)
        v10 = -v7;
      else
        v10 = 1;
      do
      {
        -[SBFluidSwitcherItemContainerFooterView _makeIconView](self, "_makeIconView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFluidSwitcherItemContainerFooterView addSubview:](self, "addSubview:", v11);
        -[NSMutableArray addObject:](self->_iconViews, "addObject:", v11);

        --v10;
      }
      while (v10);
    }
  }
  else
  {
    for (i = 0; i != v7; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", -[NSArray count](self->_visibleTitleItems, "count") + i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    -[NSMutableArray removeObjectsInRange:](self->_iconViews, "removeObjectsInRange:", -[NSArray count](self->_visibleTitleItems, "count"), v7);
  }
  if (!self->_titleLabels)
  {
    v12 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
    titleLabels = self->_titleLabels;
    self->_titleLabels = v12;

  }
  footerStyle = self->_footerStyle;
  if (footerStyle)
    v15 = 1;
  else
    v15 = -[NSArray count](self->_visibleTitleItems, "count");
  v16 = -[NSMutableArray count](self->_titleLabels, "count");
  v17 = v16 - v15;
  if ((uint64_t)(v16 - v15) < 1)
  {
    if ((v17 & 0x8000000000000000) != 0)
    {
      if ((uint64_t)(v15 - v16) > 1)
        v22 = v15 - v16;
      else
        v22 = 1;
      do
      {
        -[SBFluidSwitcherItemContainerFooterView _makeLabel](self, "_makeLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFluidSwitcherItemContainerFooterView addSubview:](self, "addSubview:", v23);
        -[NSMutableArray addObject:](self->_titleLabels, "addObject:", v23);

        --v22;
      }
      while (v22);
    }
  }
  else
  {
    v18 = v16;
    v19 = footerStyle;
    v20 = v15;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_titleLabels, "objectAtIndex:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeFromSuperview");

      ++v20;
    }
    while (v18 != v20);
    -[NSMutableArray removeObjectsInRange:](self->_titleLabels, "removeObjectsInRange:", v15, v17);
    footerStyle = v19;
  }
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
  if (-[NSArray count](self->_visibleTitleItems, "count"))
  {
    v24 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_visibleTitleItems, "objectAtIndex:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "image");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setImage:", v27);

      if (footerStyle)
      {
        objc_msgSend(v25, "titleText");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[SBFluidSwitcherItemContainerFooterView _isTextEffectivelyEmpty:](self, "_isTextEffectivelyEmpty:", v28))
          objc_msgSend(v35, "addObject:", v28);
      }
      else
      {
        -[NSMutableArray objectAtIndex:](self->_titleLabels, "objectAtIndex:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "subtitleText");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SBFluidSwitcherItemContainerFooterView _isTextEffectivelyEmpty:](self, "_isTextEffectivelyEmpty:", v29))
        {
          objc_msgSend(v25, "titleText");
          v30 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v30;
        }
        -[SBFluidSwitcherItemContainerFooterView _attributedTextFromText:](self, "_attributedTextFromText:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAttributedText:", v31);

        footerStyle = 0;
      }

      ++v24;
    }
    while (v24 < -[NSArray count](self->_visibleTitleItems, "count"));
  }
  if (footerStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray firstObject](self->_titleLabels, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherItemContainerFooterView _attributedTextFromText:](self, "_attributedTextFromText:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAttributedText:", v34);

  }
  -[SBFluidSwitcherItemContainerFooterView _updateSubtitleLabel](self, "_updateSubtitleLabel");
  -[SBFluidSwitcherItemContainerFooterView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateSubtitleLabel
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BSUIEmojiLabelView *subtitleLabel;
  BSUIEmojiLabelView *v11;
  BSUIEmojiLabelView *v12;
  void *v13;
  void *v14;
  int64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_visibleTitleItems, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_titleItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "subtitleText", (_QWORD)v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[SBFluidSwitcherItemContainerFooterView _isTextEffectivelyEmpty:](self, "_isTextEffectivelyEmpty:", v9))
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  subtitleLabel = self->_subtitleLabel;
  if (self->_footerStyle - 1 <= 1)
  {
    if (!subtitleLabel)
    {
      -[SBFluidSwitcherItemContainerFooterView _makeSubtitleLabel](self, "_makeSubtitleLabel");
      v11 = (BSUIEmojiLabelView *)objc_claimAutoreleasedReturnValue();
      v12 = self->_subtitleLabel;
      self->_subtitleLabel = v11;

      -[SBFluidSwitcherItemContainerFooterView addSubview:](self, "addSubview:", self->_subtitleLabel);
    }
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v3, (_QWORD)v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIEmojiLabelView setText:](self->_subtitleLabel, "setText:", v13);
    -[NSArray firstObject](self->_titleItems, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "subtitleInterfaceStyle");

    if (v15)
      v16 = self->_subtitleStylingUserInterfaceStyle == v15;
    else
      v16 = 1;
    if (!v16)
    {
      self->_subtitleStylingUserInterfaceStyle = v15;
      objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 53, 2, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_visualStylingForStyle:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIEmojiLabelView mt_replaceVisualStyling:](self->_subtitleLabel, "mt_replaceVisualStyling:", v18);
      -[BSUIEmojiLabelView setAlpha:](self->_subtitleLabel, "setAlpha:", self->_textAlpha);
      -[BSUIEmojiLabelView contentLabel](self->_subtitleLabel, "contentLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "alpha");
      objc_msgSend(v19, "setAlpha:");

    }
    -[SBFluidSwitcherItemContainerFooterView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_21;
  }
  if (subtitleLabel)
  {
    -[BSUIEmojiLabelView removeFromSuperview](subtitleLabel, "removeFromSuperview");
    v13 = self->_subtitleLabel;
    self->_subtitleLabel = 0;
LABEL_21:

  }
}

- (id)_attributedTextFromText:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x1E0CEA5E8];
  v5 = *MEMORY[0x1E0CEB550];
  v6 = *MEMORY[0x1E0CEB5F8];
  v7 = a3;
  objc_msgSend(v4, "_preferredFontForTextStyle:addingSymbolicTraits:weight:", v5, 0x8000, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointSize");
  objc_msgSend(v8, "fontWithSize:", fmin(fmax(v9, 13.0), 16.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  objc_msgSend(v11, "setAlignment:", 1);
  objc_msgSend(v11, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(v11, "setLineBreakMode:", 4);
  objc_msgSend(v11, "setLineBreakStrategy:", 0xFFFFLL);
  -[SBMedusaSettings switcherShelfLabelLineSpacing](self->_settings, "switcherShelfLabelLineSpacing");
  objc_msgSend(v11, "setLineSpacing:");
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKey:", v10, *MEMORY[0x1E0CEA098]);
  objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0CEA0D0]);
  if (-[SBFluidSwitcherItemContainerFooterView _hasTitleShadow](self, "_hasTitleShadow"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CEA240]);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShadowColor:", v15);

    objc_msgSend(v13, "setShadowBlurRadius:", 3.0);
    objc_msgSend(v13, "setShadowOffset:", 0.0, 0.5);
    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0CEA0F0]);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);

  return v16;
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  unint64_t footerStyle;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double Width;
  NSUInteger v12;
  uint64_t v13;
  id WeakRetained;
  id v15;
  id v16;
  CGRect v17;

  footerStyle = self->_footerStyle;
  objc_msgSend(a3, "locationInView:", self);
  v7 = v6;
  if (footerStyle)
  {
    v8 = v5;
    if (-[NSArray count](self->_visibleTitleItems, "count"))
    {
      v9 = 0;
      while (1)
      {
        -[NSMutableArray objectAtIndex:](self->_iconViews, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "convertPoint:fromView:", self, v7, v8);
        if (objc_msgSend(v10, "pointInside:withEvent:", 0))
          break;

        if (++v9 >= -[NSArray count](self->_visibleTitleItems, "count"))
          return;
      }
      -[NSArray objectAtIndex:](self->_visibleTitleItems, "objectAtIndex:", v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v13 = (uint64_t)v15;
      if (v15)
        goto LABEL_14;
    }
  }
  else
  {
    -[SBFluidSwitcherItemContainerFooterView bounds](self, "bounds");
    Width = CGRectGetWidth(v17);
    v12 = (uint64_t)(v7 / (Width / (double)-[NSArray count](self->_visibleTitleItems, "count")));
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v12 = -[NSArray count](self->_visibleTitleItems, "count") + ~v12;
    if ((v12 & 0x8000000000000000) == 0 && v12 < -[NSArray count](self->_visibleTitleItems, "count"))
    {
      -[NSArray objectAtIndex:](self->_visibleTitleItems, "objectAtIndex:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
LABEL_14:
        v16 = (id)v13;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "itemContainerFooterView:didSelectTitleItem:", self, v16);

      }
    }
  }
}

- (id)_makeIconView
{
  SBFluidSwitcherIconImageContainerView *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_alloc_init(SBFluidSwitcherIconImageContainerView);
  -[SBFluidSwitcherIconImageContainerView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v5, "CGColor"));

  objc_msgSend(v4, "setShadowPathIsBounds:", 1);
  -[SBFluidSwitcherItemContainerFooterView _updateIconViewShadow:](self, "_updateIconViewShadow:", v3);
  if (self->_wantsIconPointerInteractions)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
    -[SBFluidSwitcherIconImageContainerView addInteraction:](v3, "addInteraction:", v6);

  }
  return v3;
}

- (void)_updateIconViewShadow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 4.0;
  if (self->_footerStyle - 1 >= 2)
    v6 = -1.0;
  v10 = v5;
  objc_msgSend(v5, "setShadowOffset:", 0.0, v6);
  objc_msgSend(v4, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    LODWORD(v8) = dword_1D0E89460[self->_footerStyle - 1 < 2];
  else
    LODWORD(v8) = 0;
  objc_msgSend(v10, "setShadowOpacity:", v8);

  v9 = 6.0;
  if (self->_footerStyle - 1 < 2)
    v9 = 12.0;
  objc_msgSend(v10, "setShadowRadius:", v9);

}

- (id)_makeLabel
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v3, "setNumberOfLines:", 2);
  objc_msgSend(v3, "setText:", &stru_1E8EC7EC0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  objc_msgSend(v3, "setAlpha:", self->_textAlpha);
  objc_msgSend(v3, "setSizingRule:", 1);
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  return v3;
}

- (id)_makeSubtitleLabel
{
  id v3;
  void *v4;
  double v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D01920]);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:addingSymbolicTraits:weight:", *MEMORY[0x1E0CEB550], 0x8000, *MEMORY[0x1E0CEB5F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v4, "fontWithSize:", fmin(fmax(v5, 13.0), 16.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setFont:", v6);
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 2);
  objc_msgSend(v3, "setAlpha:", self->_textAlpha);

  return v3;
}

- (void)_updateLabels
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  BSUIEmojiLabelView *subtitleLabel;
  void *v12;
  __CFString *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_titleLabels;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "text", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFluidSwitcherItemContainerFooterView _attributedTextFromText:](self, "_attributedTextFromText:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setAttributedText:", v10);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    -[BSUIEmojiLabelView text](subtitleLabel, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[BSUIEmojiLabelView text](self->_subtitleLabel, "text");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &stru_1E8EC7EC0;
    }

    -[BSUIEmojiLabelView setText:](self->_subtitleLabel, "setText:", v13);
  }
  -[SBFluidSwitcherItemContainerFooterView setNeedsLayout](self, "setNeedsLayout", (_QWORD)v14);
}

- (double)_maximumTitleLabelHeight
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_titleLabels;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "intrinsicContentSize", (_QWORD)v10);
        if (v6 < v8)
          v6 = v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)_isTextEffectivelyEmpty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "length") == 0;
  return (char)v4;
}

- (BOOL)_hasTitleShadow
{
  return self->_footerStyle == 0;
}

- (void)_updateIconPointerInteractions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_wantsIconPointerInteractions)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = self->_iconViews;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
          objc_msgSend(v8, "addInteraction:", v9);

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v5);
    }
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = self->_iconViews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v3);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          objc_msgSend(v14, "interactions", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "removeInteraction:", v16);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }
  }

}

- (SBFluidSwitcherItemContainerFooterViewDelegate)delegate
{
  return (SBFluidSwitcherItemContainerFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)footerStyle
{
  return self->_footerStyle;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (unint64_t)iconAlignment
{
  return self->_iconAlignment;
}

- (BOOL)uniqueIconsOnly
{
  return self->_uniqueIconsOnly;
}

- (BOOL)wantsIconPointerInteractions
{
  return self->_wantsIconPointerInteractions;
}

- (double)iconHitTestOutset
{
  return self->_iconHitTestOutset;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_visibleTitleItems, 0);
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabels, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
}

@end
