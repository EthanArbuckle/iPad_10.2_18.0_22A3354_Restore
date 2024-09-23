@implementation SBFluidSwitcherItemContainerHeaderView

- (SBFluidSwitcherItemContainerHeaderView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBFluidSwitcherItemContainerHeaderView *v10;
  SBFluidSwitcherItemContainerHeaderView *v11;
  uint64_t v12;
  NSMutableDictionary *itemsToTitleLabels;
  uint64_t v14;
  NSMutableDictionary *itemsToIconImageViews;
  uint64_t v16;
  NSMutableDictionary *itemsToSubtitleLabelViews;
  uint64_t v18;
  NSMutableDictionary *itemsToMultiWindowIndicatorViews;
  void *v20;
  void *v21;
  uint64_t v22;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBFluidSwitcherItemContainerHeaderView;
  v10 = -[SBFluidSwitcherItemContainerHeaderView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    v11->_textAlpha = 1.0;
    v12 = objc_opt_new();
    itemsToTitleLabels = v11->_itemsToTitleLabels;
    v11->_itemsToTitleLabels = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    itemsToIconImageViews = v11->_itemsToIconImageViews;
    v11->_itemsToIconImageViews = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    itemsToSubtitleLabelViews = v11->_itemsToSubtitleLabelViews;
    v11->_itemsToSubtitleLabelViews = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    itemsToMultiWindowIndicatorViews = v11->_itemsToMultiWindowIndicatorViews;
    v11->_itemsToMultiWindowIndicatorViews = (NSMutableDictionary *)v18;

    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addKeyObserver:", v11);
    -[SBFluidSwitcherItemContainerHeaderView _applyPrototypeSettings](v11, "_applyPrototypeSettings");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v11, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0CEB3F0], 0);

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v11, sel__handleTapGestureRecognizer_);
    tapGestureRecognizer = v11->_tapGestureRecognizer;
    v11->_tapGestureRecognizer = (UITapGestureRecognizer *)v22;

    -[SBFluidSwitcherItemContainerHeaderView addGestureRecognizer:](v11, "addGestureRecognizer:", v11->_tapGestureRecognizer);
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB3F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherItemContainerHeaderView;
  -[SBFluidSwitcherItemContainerHeaderView dealloc](&v4, sel_dealloc);
}

+ (double)distanceFromBoundingLeadingEdgeToIconTrailingEdge
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spacingBetweenLeadingEdgeAndIcon");
  v4 = v3;
  objc_msgSend(v2, "iconSideLength");
  v6 = v4 + v5;

  return v6;
}

- (double)preferredHeaderHeight
{
  return self->_spacingBetweenSnapshotAndIcon + self->_spacingBetweenSnapshotAndIcon + self->_iconSideLength;
}

- (void)setTitleItems:(id)a3
{
  -[SBFluidSwitcherItemContainerHeaderView setTitleItems:animated:](self, "setTitleItems:animated:", a3, 0);
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *titleItems;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableArray *titleLabelReusePool;
  NSMutableArray *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  NSMutableArray *iconImageViewReusePool;
  NSMutableArray *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  NSMutableArray *subtitleLabelReusePool;
  NSMutableArray *v30;
  NSMutableArray *v31;
  void *v32;
  void *v33;
  NSMutableArray *multiWindowIndicatorViewReusePool;
  NSMutableArray *v35;
  NSMutableArray *v36;
  void *v37;
  SBFluidSwitcherIconImageContainerView *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  SBFluidSwitcherIconImageContainerView *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  SBFluidSwitcherIconImageContainerView *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  SBFluidSwitcherIconImageContainerView *v72;
  SBFluidSwitcherIconImageContainerView *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  SBFluidSwitcherIconImageContainerView *v92;
  NSArray *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id obj;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint64_t v110;

  v89 = a4;
  v110 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[NSArray count](self->_titleItems, "count"))
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v101 = 0;
  }
  if (-[NSArray count](self->_titleItems, "count") < 2)
  {
    v100 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = self->_titleItems;
  v7 = (NSArray *)objc_msgSend(v5, "copy");
  titleItems = self->_titleItems;
  self->_titleItems = v7;

  if (-[NSArray count](self->_titleItems, "count"))
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v102 = 0;
  }
  v95 = v5;
  if (-[NSArray count](self->_titleItems, "count") < 2)
  {
    v9 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v102, "displayItem");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v9;
  objc_msgSend(v9, "displayItem");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v6;
  -[NSArray bs_map:](v6, "bs_map:", &__block_literal_global_393);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray bs_map:](self->_titleItems, "bs_map:", &__block_literal_global_10_5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
  v103 = v11;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v106 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
        if ((objc_msgSend(v11, "containsObject:", v16) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "setHidden:", 1);
            -[NSMutableDictionary removeObjectForKey:](self->_itemsToTitleLabels, "removeObjectForKey:", v16);
            titleLabelReusePool = self->_titleLabelReusePool;
            if (!titleLabelReusePool)
            {
              v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v21 = self->_titleLabelReusePool;
              self->_titleLabelReusePool = v20;

              titleLabelReusePool = self->_titleLabelReusePool;
            }
            -[NSMutableArray addObject:](titleLabelReusePool, "addObject:", v18);
          }
          -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "setHidden:", 1);
            -[NSMutableDictionary removeObjectForKey:](self->_itemsToIconImageViews, "removeObjectForKey:", v16);
            iconImageViewReusePool = self->_iconImageViewReusePool;
            if (!iconImageViewReusePool)
            {
              v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v26 = self->_iconImageViewReusePool;
              self->_iconImageViewReusePool = v25;

              iconImageViewReusePool = self->_iconImageViewReusePool;
            }
            -[NSMutableArray addObject:](iconImageViewReusePool, "addObject:", v23);
          }
          -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v16);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "setHidden:", 1);
            -[NSMutableDictionary removeObjectForKey:](self->_itemsToSubtitleLabelViews, "removeObjectForKey:", v16);
            subtitleLabelReusePool = self->_subtitleLabelReusePool;
            if (!subtitleLabelReusePool)
            {
              v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v31 = self->_subtitleLabelReusePool;
              self->_subtitleLabelReusePool = v30;

              subtitleLabelReusePool = self->_subtitleLabelReusePool;
            }
            -[NSMutableArray addObject:](subtitleLabelReusePool, "addObject:", v28);
          }
          -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v16);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v32)
          {
            objc_msgSend(v32, "setHidden:", 1);
            objc_msgSend(v33, "setAccessibilityIdentifier:", 0);
            -[NSMutableDictionary removeObjectForKey:](self->_itemsToMultiWindowIndicatorViews, "removeObjectForKey:", v16);
            multiWindowIndicatorViewReusePool = self->_multiWindowIndicatorViewReusePool;
            if (!multiWindowIndicatorViewReusePool)
            {
              v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v36 = self->_multiWindowIndicatorViewReusePool;
              self->_multiWindowIndicatorViewReusePool = v35;

              multiWindowIndicatorViewReusePool = self->_multiWindowIndicatorViewReusePool;
            }
            -[NSMutableArray addObject:](multiWindowIndicatorViewReusePool, "addObject:", v33);
          }

          v11 = v103;
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v109, 16);
    }
    while (v13);
  }

  v37 = v95;
  -[SBFluidSwitcherItemContainerHeaderView _updateVisualStylingWithTitleItems:](self, "_updateVisualStylingWithTitleItems:", v95);
  if (v102)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v99);
    v38 = (SBFluidSwitcherIconImageContainerView *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v99);
    v39 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v99);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v99);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) != 0)
    {
      LOBYTE(v41) = 1;
      v42 = (void *)v39;
      v43 = v96;
    }
    else
    {
      objc_msgSend(v102, "image");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v45 = v102;
        v42 = (void *)v39;
        if (!v38)
        {
          -[NSMutableArray _sb_dequeue](self->_iconImageViewReusePool, "_sb_dequeue");
          v38 = (SBFluidSwitcherIconImageContainerView *)objc_claimAutoreleasedReturnValue();
          if (!v38)
          {
            v46 = [SBFluidSwitcherIconImageContainerView alloc];
            v38 = -[SBFluidSwitcherIconImageContainerView initWithFrame:](v46, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
            -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v38);
          }
          -[NSMutableDictionary setObject:forKey:](self->_itemsToIconImageViews, "setObject:forKey:", v38, v99);
        }
        -[SBFluidSwitcherIconImageContainerView setHidden:](v38, "setHidden:", 0);
      }
      else
      {
        -[SBFluidSwitcherIconImageContainerView setHidden:](v38, "setHidden:", 1);
        v45 = v102;
        v42 = (void *)v39;
      }
      objc_msgSend(v45, "titleText");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "length");

      if (v48)
      {
        if (!v42)
        {
          -[NSMutableArray _sb_dequeue](self->_titleLabelReusePool, "_sb_dequeue");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v42)
          {
            v49 = objc_alloc(MEMORY[0x1E0CEA700]);
            v42 = (void *)objc_msgSend(v49, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
            objc_msgSend(v42, "setClipsToBounds:", 0);
            objc_msgSend(v42, "setSizingRule:", 1);
            -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v42);
          }
          -[SBFluidSwitcherItemContainerHeaderView _titleLabelFont](self, "_titleLabelFont");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setFont:", v50);

          -[NSMutableDictionary setObject:forKey:](self->_itemsToTitleLabels, "setObject:forKey:", v42, v99);
        }
        objc_msgSend(v42, "setAlpha:", self->_textAlpha);
        v51 = v102;
        objc_msgSend(v102, "titleTextColor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setTextColor:", v52);

        objc_msgSend(v42, "setHidden:", 0);
      }
      else
      {
        objc_msgSend(v42, "setHidden:", 1);
        v51 = v102;
      }
      objc_msgSend(v51, "subtitleText");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "length");

      if (v54)
      {
        v55 = v102;
        if (!v40)
        {
          -[NSMutableArray _sb_dequeue](self->_subtitleLabelReusePool, "_sb_dequeue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40)
          {
            v56 = objc_alloc(MEMORY[0x1E0D01920]);
            v40 = (void *)objc_msgSend(v56, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
            objc_msgSend(v40, "setClipsToBounds:", 0);
            -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v40);
          }
          -[SBFluidSwitcherItemContainerHeaderView _subtitleLabelFont](self, "_subtitleLabelFont");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setFont:", v57);

          -[NSMutableDictionary setObject:forKey:](self->_itemsToSubtitleLabelViews, "setObject:forKey:", v40, v99);
          v55 = v102;
        }
        objc_msgSend(v40, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
        objc_msgSend(v40, "setAlpha:", self->_textAlpha);
        objc_msgSend(v40, "setHidden:", 0);
      }
      else
      {
        objc_msgSend(v40, "setHidden:", 1);
        v55 = v102;
      }
      v43 = v96;
      if (objc_msgSend(v55, "showsMultiWindowIndicator"))
      {
        if (!v96)
        {
          -[NSMutableArray _sb_dequeue](self->_multiWindowIndicatorViewReusePool, "_sb_dequeue");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v43)
          {
            -[SBFluidSwitcherItemContainerHeaderView _makeMultipleWindowsIndicatorView](self, "_makeMultipleWindowsIndicatorView");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v43);
          }
          -[NSMutableDictionary setObject:forKey:](self->_itemsToMultiWindowIndicatorViews, "setObject:forKey:", v43, v99);
        }
        objc_msgSend(v43, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
        objc_msgSend(v55, "displayItem");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFluidSwitcherItemContainerHeaderView _multiWindowIndicatorAccessibilityIdentifierForDisplayItem:](self, "_multiWindowIndicatorAccessibilityIdentifierForDisplayItem:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setAccessibilityIdentifier:", v59);

        v55 = v102;
        objc_msgSend(v43, "setAlpha:", self->_textAlpha);
        v60 = v43;
        v61 = 0;
      }
      else
      {
        objc_msgSend(v96, "setAccessibilityIdentifier:", 0);
        v60 = v96;
        v61 = 1;
      }
      objc_msgSend(v60, "setHidden:", v61);
      objc_msgSend(v55, "image");
      v62 = v55;
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidSwitcherIconImageContainerView setImage:animated:](v38, "setImage:animated:", v63, v89);

      -[SBFluidSwitcherIconImageContainerView sizeToFit](v38, "sizeToFit");
      objc_msgSend(v62, "titleText");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setText:", v64);

      objc_msgSend(v42, "sizeToFit");
      objc_msgSend(v62, "subtitleText");
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setText:", v41);

      objc_msgSend(v40, "sizeToFit");
      LOBYTE(v41) = 0;
    }
  }
  else
  {
    v41 = BSEqualObjects();
    v38 = 0;
    v42 = 0;
    v40 = 0;
    v43 = 0;
  }
  v90 = v40;
  v91 = v42;
  v92 = v38;
  v65 = v94;
  if (v94)
  {
    v97 = v43;
    -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v98);
    v66 = (SBFluidSwitcherIconImageContainerView *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v98);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v98);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v98);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) != 0)
    {
      v70 = v103;
      v37 = v95;
      goto LABEL_75;
    }
    objc_msgSend(v94, "image");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      if (!v66)
      {
        -[NSMutableArray _sb_dequeue](self->_iconImageViewReusePool, "_sb_dequeue");
        v66 = (SBFluidSwitcherIconImageContainerView *)objc_claimAutoreleasedReturnValue();
        if (!v66)
        {
          v72 = [SBFluidSwitcherIconImageContainerView alloc];
          v66 = -[SBFluidSwitcherIconImageContainerView initWithFrame:](v72, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v66);
        }
        -[NSMutableDictionary setObject:forKey:](self->_itemsToIconImageViews, "setObject:forKey:", v66, v98);
      }
      v73 = v66;
      v74 = 0;
    }
    else
    {
      v73 = v66;
      v74 = 1;
    }
    -[SBFluidSwitcherIconImageContainerView setHidden:](v73, "setHidden:", v74);
    objc_msgSend(v94, "titleText");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "length");

    if (v76)
    {
      if (!v67)
      {
        -[NSMutableArray _sb_dequeue](self->_titleLabelReusePool, "_sb_dequeue");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v67)
        {
          v77 = objc_alloc(MEMORY[0x1E0CEA700]);
          v67 = (void *)objc_msgSend(v77, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          objc_msgSend(v67, "setClipsToBounds:", 0);
          objc_msgSend(v67, "setSizingRule:", 1);
          -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v67);
        }
        -[SBFluidSwitcherItemContainerHeaderView _titleLabelFont](self, "_titleLabelFont");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setFont:", v78);

        -[NSMutableDictionary setObject:forKey:](self->_itemsToTitleLabels, "setObject:forKey:", v67, v98);
      }
      v65 = v94;
      objc_msgSend(v94, "titleTextColor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setTextColor:", v79);

      objc_msgSend(v67, "setAlpha:", self->_textAlpha);
      objc_msgSend(v67, "setHidden:", 0);
    }
    else
    {
      objc_msgSend(v67, "setHidden:", 1);
      v65 = v94;
    }
    objc_msgSend(v65, "subtitleText");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "length");

    v37 = v95;
    if (v81)
    {
      v43 = v97;
      if (!v68)
      {
        -[NSMutableArray _sb_dequeue](self->_subtitleLabelReusePool, "_sb_dequeue");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v68)
        {
          v82 = objc_alloc(MEMORY[0x1E0D01920]);
          v68 = (void *)objc_msgSend(v82, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          objc_msgSend(v68, "setClipsToBounds:", 0);
          -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v68);
        }
        -[SBFluidSwitcherItemContainerHeaderView _subtitleLabelFont](self, "_subtitleLabelFont");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setFont:", v83);

        -[NSMutableDictionary setObject:forKey:](self->_itemsToSubtitleLabelViews, "setObject:forKey:", v68, v98);
      }
      objc_msgSend(v68, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
      objc_msgSend(v68, "setAlpha:", self->_textAlpha);
      objc_msgSend(v68, "setHidden:", 0);
    }
    else
    {
      objc_msgSend(v68, "setHidden:", 1);
      v43 = v97;
    }
    v70 = v103;
    if (objc_msgSend(v65, "showsMultiWindowIndicator"))
    {
      if (!v69)
      {
        -[NSMutableArray _sb_dequeue](self->_multiWindowIndicatorViewReusePool, "_sb_dequeue");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v69)
        {
          -[SBFluidSwitcherItemContainerHeaderView _makeMultipleWindowsIndicatorView](self, "_makeMultipleWindowsIndicatorView");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFluidSwitcherItemContainerHeaderView addSubview:](self, "addSubview:", v69);
        }
        -[NSMutableDictionary setObject:forKey:](self->_itemsToMultiWindowIndicatorViews, "setObject:forKey:", v69, v98);
      }
      objc_msgSend(v69, "mt_replaceVisualStyling:", self->_subtitleVisualStyling);
      objc_msgSend(v65, "displayItem");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidSwitcherItemContainerHeaderView _multiWindowIndicatorAccessibilityIdentifierForDisplayItem:](self, "_multiWindowIndicatorAccessibilityIdentifierForDisplayItem:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setAccessibilityIdentifier:", v85);

      objc_msgSend(v69, "setAlpha:", self->_textAlpha);
      objc_msgSend(v69, "setHidden:", 0);
      v43 = v97;
    }
    else
    {
      objc_msgSend(v69, "setAccessibilityIdentifier:", 0);
      objc_msgSend(v69, "setHidden:", 1);
    }
    objc_msgSend(v65, "image");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherIconImageContainerView setImage:animated:](v66, "setImage:animated:", v86, v89);

    -[SBFluidSwitcherIconImageContainerView sizeToFit](v66, "sizeToFit");
    objc_msgSend(v65, "titleText");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setText:", v87);

    objc_msgSend(v67, "sizeToFit");
    objc_msgSend(v65, "subtitleText");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setText:", v88);

    objc_msgSend(v68, "sizeToFit");
  }
  else
  {
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = 0;
    v70 = v103;
    if ((BSEqualObjects() & 1) != 0)
    {
LABEL_75:
      if ((v41 & 1) != 0)
        goto LABEL_107;
    }
  }
  -[SBFluidSwitcherItemContainerHeaderView setNeedsLayout](self, "setNeedsLayout");
LABEL_107:

}

uint64_t __65__SBFluidSwitcherItemContainerHeaderView_setTitleItems_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayItem");
}

uint64_t __65__SBFluidSwitcherItemContainerHeaderView_setTitleItems_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayItem");
}

- (void)setTextAlpha:(double)a3
{
  if (self->_textAlpha != a3)
  {
    self->_textAlpha = a3;
    -[SBFluidSwitcherItemContainerHeaderView _updateTitleAlpha](self, "_updateTitleAlpha");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double Width;
  double spacingBetweenLeadingEdgeAndIcon;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
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
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  id *v52;
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
  void *v63;
  void *v64;
  id v65;
  CGFloat v66;
  double v67;
  double spacingBetweenIconAndLabel;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  double v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  CGFloat v111;
  double v112;
  void *v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  double MaxY;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CGFloat v129;
  CGFloat v130;
  void *v131;
  CGFloat v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  CGFloat v141;
  double v142;
  double v143;
  double v144;
  double v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  void *v149;
  void *v150;
  void *v151;
  CGFloat v152;
  CGFloat v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  CGFloat v158;
  int v159;
  int v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  CGFloat v165;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat v169;
  CGFloat v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat v174;
  void *v175;
  CGFloat v176;
  CGFloat rect;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  double v181;
  CGFloat v182;
  CGFloat v183;
  CGFloat v184;
  CGFloat v185;
  CGFloat v186;
  CGFloat v187;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  double iconSideLength;
  CGFloat v192;
  objc_super v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;

  v193.receiver = self;
  v193.super_class = (Class)SBFluidSwitcherItemContainerHeaderView;
  -[SBFluidSwitcherItemContainerHeaderView layoutSubviews](&v193, sel_layoutSubviews);
  -[SBFluidSwitcherItemContainerHeaderView bounds](self, "bounds");
  v185 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (-[NSArray count](self->_titleItems, "count"))
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (-[NSArray count](self->_titleItems, "count") < 2)
  {
    v11 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "displayItem");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayItem");
  v13 = objc_claimAutoreleasedReturnValue();
  v150 = (void *)v12;
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v12);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v12);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v175 = 0;
    v163 = 0;
    v14 = 0;
  }
  v151 = v10;
  if (v11)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v13);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v16 = 0;
    v162 = 0;
    v17 = 0;
  }
  if (v175)
  {
    v19 = v11;
    v20 = objc_msgSend(v175, "isHidden") ^ 1;
    if (v14)
    {
LABEL_15:
      v159 = objc_msgSend(v14, "isHidden") ^ 1;
      goto LABEL_18;
    }
  }
  else
  {
    v19 = v11;
    v20 = 0;
    if (v14)
      goto LABEL_15;
  }
  v159 = 0;
LABEL_18:
  v149 = (void *)v13;
  if (v16)
    v21 = objc_msgSend(v16, "isHidden") ^ 1;
  else
    v21 = 0;
  v164 = v16;
  if (v17)
    v160 = objc_msgSend(v17, "isHidden") ^ 1;
  else
    v160 = 0;
  -[SBFluidSwitcherItemContainerHeaderView traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayScale");

  iconSideLength = self->_iconSideLength;
  objc_msgSend(v163, "frame");
  v24 = v23;
  v26 = v25;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    v194.origin.x = v185;
    v194.origin.y = v5;
    v194.size.width = v7;
    v194.size.height = v9;
    Width = CGRectGetWidth(v194);
    v195.origin.x = v24;
    v195.origin.y = v26;
    v195.size.width = iconSideLength;
    v195.size.height = iconSideLength;
    spacingBetweenLeadingEdgeAndIcon = Width - CGRectGetWidth(v195) - self->_spacingBetweenLeadingEdgeAndIcon;
  }
  else
  {
    spacingBetweenLeadingEdgeAndIcon = self->_spacingBetweenLeadingEdgeAndIcon;
  }
  rect = v5;
  v178 = spacingBetweenLeadingEdgeAndIcon;
  objc_msgSend(v162, "frame");
  v183 = v29;
  v155 = v30;
  v31 = *MEMORY[0x1E0C9D648];
  v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v186 = v34;
  v172 = v33;
  v192 = v32;
  v35 = *MEMORY[0x1E0C9D648];
  v188 = v33;
  if (v20)
  {
    objc_msgSend(v175, "sizeThatFits:", v7, v9);
    SBRectWithSize();
    v35 = v36;
    v32 = v37;
    v172 = v38;
    v186 = v39;
    v33 = v188;
  }
  v180 = v34;
  v40 = v33;
  v179 = v192;
  v157 = v31;
  if (v159)
  {
    objc_msgSend(v14, "sizeThatFits:", v7, v9, v33);
    SBRectWithSize();
    v157 = v41;
    v179 = v42;
    v180 = v43;
    v33 = v188;
  }
  v166 = v40;
  v152 = v35;
  v181 = v34;
  v174 = v33;
  v176 = v192;
  v182 = v31;
  v44 = v19;
  if (v15)
  {
    objc_msgSend(v15, "frame");
    v182 = v45;
    v176 = v46;
    v174 = v47;
    v181 = v48;
    v33 = v188;
  }
  v49 = v34;
  v156 = v33;
  v50 = v192;
  v51 = v31;
  v52 = (id *)MEMORY[0x1E0CEB258];
  if (v18)
  {
    objc_msgSend(v18, "frame");
    v51 = v53;
    v156 = v54;
    v33 = v188;
  }
  v147 = v50;
  v148 = v49;
  v189 = v34;
  v190 = v33;
  v171 = v192;
  v187 = v31;
  if (v21)
  {
    objc_msgSend(v164, "sizeThatFits:", v7, v9);
    SBRectWithSize();
    v187 = v55;
    v171 = v56;
    v189 = v58;
    v190 = v57;
  }
  if (v160)
  {
    objc_msgSend(v17, "sizeThatFits:", v7, v9);
    SBRectWithSize();
    v31 = v59;
    v192 = v60;
    v188 = v61;
    v34 = v62;
  }
  objc_msgSend(v14, "font");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
  {
    v65 = v63;
  }
  else
  {
    objc_msgSend(v17, "font");
    v65 = (id)objc_claimAutoreleasedReturnValue();
  }
  v161 = v65;

  v196.origin.x = v185;
  v196.origin.y = rect;
  v196.size.width = v7;
  v196.size.height = v9;
  v66 = CGRectGetWidth(v196) - self->_spacingBetweenLeadingEdgeAndIcon;
  v67 = self->_iconSideLength;
  spacingBetweenIconAndLabel = self->_spacingBetweenIconAndLabel;
  v69 = v66 - v67 - spacingBetweenIconAndLabel;
  v165 = v7;
  v168 = v9;
  v169 = v31;
  v170 = v34;
  v153 = v32;
  v154 = v51;
  if (v44)
  {
    v146 = v26;
    v70 = v69
        - self->_spacingBetweenLabelAndSecondIcon
        - v67
        - spacingBetweenIconAndLabel
        - self->_spacingBetweenTrailingEdgeAndLabels;
    v197.origin.y = v32;
    v71 = self->_spacingBetweenLabelAndMultipleWindowsIndicator + self->_multipleWindowsIndicatorSideLength;
    v197.origin.x = v152;
    v197.size.width = v172;
    v197.size.height = v186;
    v72 = CGRectGetWidth(v197);
    v73 = 0.0;
    if (v15)
      v74 = v71;
    else
      v74 = 0.0;
    v75 = v72 + v74;
    v198.origin.x = v157;
    v198.origin.y = v179;
    v198.size.height = v180;
    v198.size.width = v166;
    v76 = CGRectGetWidth(v198);
    if (v75 >= v76)
      v77 = v75;
    else
      v77 = v76;
    v199.origin.x = v187;
    v199.origin.y = v171;
    v199.size.height = v189;
    v199.size.width = v190;
    v78 = CGRectGetWidth(v199);
    if (v18)
      v73 = v71;
    v79 = v73 + v78;
    v200.origin.x = v31;
    v200.origin.y = v192;
    v200.size.width = v188;
    v200.size.height = v170;
    v80 = CGRectGetWidth(v200);
    if (v79 < v80)
      v79 = v80;
    if (v77 + v79 > v70)
    {
      if (v77 >= v70 * 0.5)
      {
        v95 = v165;
        v82 = v152;
        if (v79 >= v70 * 0.5)
        {
          v96 = v185;
          v97 = rect;
          v98 = v168;
          v79 = CGRectGetWidth(*(CGRect *)(&v95 - 2)) * 0.5
              - self->_spacingBetweenBoundsCenterAndSecondIcon
              - self->_spacingBetweenIconAndLabel
              - self->_iconSideLength
              - self->_spacingBetweenTrailingEdgeAndLabels;
        }
        v77 = v70 - v79;
        v81 = v186;
        v52 = (id *)MEMORY[0x1E0CEB258];
        goto LABEL_73;
      }
      v79 = v70 - v77;
    }
    v81 = v186;
    v52 = (id *)MEMORY[0x1E0CEB258];
    v82 = v152;
LABEL_73:
    v209.origin.x = v82;
    v209.origin.y = v153;
    v209.size.width = v172;
    v209.size.height = v81;
    v99 = CGRectGetWidth(v209);
    v100 = v77;
    if (v99 >= v77 - v74)
      v101 = v77 - v74;
    else
      v101 = v99;
    v210.origin.x = v187;
    v210.origin.y = v171;
    v210.size.height = v189;
    v210.size.width = v190;
    v102 = CGRectGetWidth(v210);
    v188 = v79;
    if (v102 >= v79 - v73)
      v102 = v79 - v73;
    v190 = v102;
    if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
    {
      v211.origin.x = v178;
      v211.origin.y = v146;
      v211.size.width = iconSideLength;
      v211.size.height = iconSideLength;
      v103 = CGRectGetMinX(v211) - self->_spacingBetweenIconAndLabel;
      v212.origin.x = v82;
      v212.origin.y = v153;
      v104 = v101;
      v212.size.width = v101;
      v212.size.height = v81;
      v105 = v103 - CGRectGetWidth(v212);
    }
    else
    {
      v104 = v101;
      v213.origin.x = v178;
      v213.origin.y = v146;
      v213.size.width = iconSideLength;
      v213.size.height = iconSideLength;
      v105 = CGRectGetMaxX(v213) + self->_spacingBetweenIconAndLabel;
    }
    v173 = v105;
    if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
    {
      v214.origin.x = v178;
      v214.origin.y = v146;
      v214.size.width = iconSideLength;
      v214.size.height = iconSideLength;
      v106 = CGRectGetMinX(v214) - self->_spacingBetweenIconAndLabel;
      v215.origin.x = v157;
      v215.origin.y = v179;
      v215.size.height = v180;
      v215.size.width = v100;
      v107 = v106 - CGRectGetWidth(v215);
    }
    else
    {
      v216.origin.x = v178;
      v216.origin.y = v146;
      v216.size.width = iconSideLength;
      v216.size.height = iconSideLength;
      v107 = CGRectGetMaxX(v216) + self->_spacingBetweenIconAndLabel;
    }
    v158 = v107;
    v89 = v181;
    v91 = v165;
    v94 = v104;
    if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
    {
      v217.origin.x = v185;
      v217.origin.y = rect;
      v217.size.width = v165;
      v217.size.height = v168;
      v108 = CGRectGetWidth(v217)
           - self->_spacingBetweenLeadingEdgeAndIcon
           - self->_iconSideLength
           - self->_spacingBetweenIconAndLabel
           - v100
           - self->_spacingBetweenLabelAndSecondIcon;
      v218.origin.x = v183;
      v218.origin.y = v155;
      v218.size.width = iconSideLength;
      v218.size.height = iconSideLength;
      v109 = v108 - CGRectGetWidth(v218);
    }
    else
    {
      v109 = self->_spacingBetweenLabelAndSecondIcon
           + v100
           + self->_spacingBetweenLeadingEdgeAndIcon
           + self->_iconSideLength
           + self->_spacingBetweenIconAndLabel;
    }
    v184 = v109;
    v167 = v100;
    if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
    {
      v219.origin.x = v184;
      v219.origin.y = v155;
      v219.size.width = iconSideLength;
      v219.size.height = iconSideLength;
      v110 = CGRectGetMinX(v219) - self->_spacingBetweenIconAndLabel;
      v220.origin.x = v187;
      v220.origin.y = v171;
      v220.size.height = v189;
      v220.size.width = v190;
      v90 = v110 - CGRectGetWidth(v220);
    }
    else
    {
      v221.origin.x = v184;
      v221.origin.y = v155;
      v221.size.width = iconSideLength;
      v221.size.height = iconSideLength;
      v90 = CGRectGetMaxX(v221) + self->_spacingBetweenIconAndLabel;
    }
    if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
    {
      v222.origin.x = v184;
      v222.origin.y = v155;
      v222.size.width = iconSideLength;
      v222.size.height = iconSideLength;
      v111 = CGRectGetMinX(v222) - self->_spacingBetweenIconAndLabel;
      v223.origin.x = v169;
      v223.size.height = v170;
      v223.origin.y = v192;
      v223.size.width = v188;
      v112 = v111 - CGRectGetWidth(v223);
    }
    else
    {
      v224.origin.x = v184;
      v224.origin.y = v155;
      v224.size.width = iconSideLength;
      v224.size.height = iconSideLength;
      v112 = CGRectGetMaxX(v224) + self->_spacingBetweenIconAndLabel;
    }
    v169 = v112;
    goto LABEL_94;
  }
  v83 = v69 - self->_spacingBetweenTrailingEdgeAndLabels;
  v84 = v83;
  if (v15)
    v84 = v83 - self->_spacingBetweenLabelAndMultipleWindowsIndicator - self->_multipleWindowsIndicatorSideLength;
  v201.origin.x = v152;
  v201.origin.y = v32;
  v201.size.width = v172;
  v201.size.height = v186;
  v85 = CGRectGetWidth(v201);
  if (v85 < v84)
    v84 = v85;
  v202.origin.x = v157;
  v202.origin.y = v179;
  v202.size.height = v180;
  v202.size.width = v166;
  v86 = CGRectGetWidth(v202);
  if (v86 >= v83)
    v86 = v83;
  v167 = v86;
  if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
  {
    v203.origin.x = v178;
    v203.origin.y = v26;
    v203.size.width = iconSideLength;
    v203.size.height = iconSideLength;
    v87 = CGRectGetMinX(v203) - self->_spacingBetweenIconAndLabel;
    v204.origin.x = v152;
    v204.origin.y = v32;
    v204.size.width = v84;
    v204.size.height = v186;
    v88 = v87 - CGRectGetWidth(v204);
  }
  else
  {
    v205.origin.x = v178;
    v205.origin.y = v26;
    v205.size.width = iconSideLength;
    v205.size.height = iconSideLength;
    v88 = CGRectGetMaxX(v205) + self->_spacingBetweenIconAndLabel;
  }
  v173 = v88;
  v89 = v181;
  v90 = v187;
  v91 = v7;
  if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
  {
    v206.origin.x = v178;
    v206.origin.y = v26;
    v206.size.width = iconSideLength;
    v206.size.height = iconSideLength;
    v92 = CGRectGetMinX(v206) - self->_spacingBetweenIconAndLabel;
    v207.origin.x = v157;
    v207.origin.y = v179;
    v207.size.height = v180;
    v207.size.width = v167;
    v93 = v92 - CGRectGetWidth(v207);
  }
  else
  {
    v208.origin.x = v178;
    v208.origin.y = v26;
    v208.size.width = iconSideLength;
    v208.size.height = iconSideLength;
    v93 = CGRectGetMaxX(v208) + self->_spacingBetweenIconAndLabel;
  }
  v158 = v93;
  v94 = v84;
LABEL_94:
  if (v159)
  {
    objc_msgSend(v14, "contentLabel");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v225.origin.x = v185;
    v225.origin.y = rect;
    v225.size.width = v91;
    v225.size.height = v168;
    v114 = CGRectGetMaxY(v225) - self->_spacingBetweenSnapshotAndDescriptionLabelBaseline;
    objc_msgSend(v113, "_firstLineBaseline");
    v226.origin.y = v114 - v115;
    v226.origin.x = v158;
    v226.size.width = v167;
    v226.size.height = v180;
    v116 = v89;
    MaxY = CGRectGetMaxY(v226);
    objc_msgSend(v113, "_baselineOffsetFromBottom");
    v119 = MaxY - v118;
    objc_msgSend(v161, "_scaledValueForValue:", self->_spacingBetweenTitleAndSubtitleBaseline);
    v121 = v119 - v120;
    objc_msgSend(v175, "_firstLineBaseline");
    v123 = v121 - v122;
    v52 = (id *)MEMORY[0x1E0CEB258];
    objc_msgSend(v175, "_capOffsetFromBoundsTop");

  }
  else
  {
    v116 = v89;
    v227.origin.x = v185;
    v227.origin.y = rect;
    v227.size.width = v91;
    v227.size.height = v168;
    CGRectGetMaxY(v227);
    UIRectCenteredYInRectScale();
    v173 = v124;
    v123 = v125;
    v94 = v126;
    v186 = v127;
  }
  v128 = v154;
  if (v15)
  {
    if (objc_msgSend(*v52, "userInterfaceLayoutDirection") == 1)
    {
      v228.origin.x = v173;
      v228.origin.y = v123;
      v228.size.width = v94;
      v228.size.height = v186;
      CGRectGetMinX(v228);
      v229.origin.x = v182;
      v229.origin.y = v176;
      v229.size.width = v174;
      v229.size.height = v116;
      CGRectGetWidth(v229);
    }
    else
    {
      v230.origin.x = v173;
      v230.origin.y = v123;
      v230.size.width = v94;
      v230.size.height = v186;
      CGRectGetMaxX(v230);
    }
    UIRectCenteredYInRectScale();
    v129 = v90;
    v128 = v154;
  }
  else
  {
    v129 = v90;
  }
  v130 = v128;
  if (v160)
  {
    objc_msgSend(v17, "contentLabel");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v231.origin.x = v185;
    v231.origin.y = rect;
    v231.size.width = v165;
    v231.size.height = v168;
    v132 = CGRectGetMaxY(v231) - self->_spacingBetweenSnapshotAndDescriptionLabelBaseline;
    objc_msgSend(v131, "_firstLineBaseline");
    v232.origin.y = v132 - v133;
    v232.origin.x = v169;
    v232.size.width = v188;
    v232.size.height = v170;
    v134 = CGRectGetMaxY(v232);
    objc_msgSend(v131, "_baselineOffsetFromBottom");
    v136 = v134 - v135;
    objc_msgSend(v161, "_scaledValueForValue:", self->_spacingBetweenTitleAndSubtitleBaseline);
    v138 = v136 - v137;
    objc_msgSend(v164, "_firstLineBaseline");
    v140 = v138 - v139;
    v141 = v189;

  }
  else
  {
    v233.origin.x = v185;
    v233.origin.y = rect;
    v233.size.width = v165;
    v233.size.height = v168;
    CGRectGetMaxY(v233);
    UIRectCenteredYInRectScale();
    v129 = v142;
    v140 = v143;
    v190 = v144;
    v141 = v145;
  }
  if (v18)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      v234.origin.x = v129;
      v234.origin.y = v140;
      v234.size.width = v190;
      v234.size.height = v141;
      CGRectGetMinX(v234);
      v235.origin.x = v130;
      v235.origin.y = v147;
      v235.size.width = v156;
      v235.size.height = v148;
      CGRectGetWidth(v235);
    }
    else
    {
      v236.origin.x = v129;
      v236.origin.y = v140;
      v236.size.width = v190;
      v236.size.height = v141;
      CGRectGetMaxX(v236);
    }
    UIRectCenteredYInRectScale();
  }
  UIRectIntegralWithScale();
  objc_msgSend(v163, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v175, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v14, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v15, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v18, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v162, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v164, "sb_setBoundsAndPositionFromFrame:");
  UIRectIntegralWithScale();
  objc_msgSend(v17, "sb_setBoundsAndPositionFromFrame:");

}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[SBFluidSwitcherItemContainerHeaderView _titleLabelFont](self, "_titleLabelFont", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_titleItems, "count"))
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[NSArray count](self->_titleItems, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "displayItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_9:
      -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v7);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
    if (v5)
      goto LABEL_9;
  }
  v11 = 0;
  v10 = 0;
LABEL_12:
  objc_msgSend(v8, "setFont:", v13);
  objc_msgSend(v8, "sizeToFit");
  objc_msgSend(v10, "setFont:", v13);
  objc_msgSend(v10, "sizeToFit");
  if (v9 | v11)
  {
    -[SBFluidSwitcherItemContainerHeaderView _subtitleLabelFont](self, "_subtitleLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "setFont:", v12);
    objc_msgSend((id)v9, "sizeToFit");
    objc_msgSend((id)v11, "setFont:", v12);
    objc_msgSend((id)v11, "sizeToFit");

  }
  -[SBFluidSwitcherItemContainerHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_handleTapGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double MinX;
  double MaxX;
  double spacingBetweenTrailingEdgeAndLabels;
  double v23;
  double v24;
  double spacingBetweenLeadingEdgeAndIcon;
  void *v26;
  double v27;
  double spacingBetweenLabelAndSecondIcon;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id WeakRetained;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v49 = a3;
  if (-[NSArray count](self->_titleItems, "count"))
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[NSArray count](self->_titleItems, "count") < 2)
  {
    v50 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "displayItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "displayItem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v5);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_9:
      -[NSMutableDictionary objectForKey:](self->_itemsToIconImageViews, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v7);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v45 = 0;
    v47 = 0;
    v48 = 0;
    v8 = 0;
    if (v6)
      goto LABEL_9;
  }
  v11 = 0;
  v46 = 0;
  v9 = 0;
  v10 = 0;
LABEL_12:
  objc_msgSend(v49, "locationInView:", self);
  v13 = v12;
  v15 = v14;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    if (v8)
      v16 = v8;
    else
      v16 = v47;
    objc_msgSend(v16, "frame");
    MinX = CGRectGetMinX(v52);
    objc_msgSend(v48, "frame");
    MaxX = CGRectGetMaxX(v53);
    if (v7)
      spacingBetweenTrailingEdgeAndLabels = self->_spacingBetweenLabelAndSecondIcon * 0.5;
    else
      spacingBetweenTrailingEdgeAndLabels = self->_spacingBetweenTrailingEdgeAndLabels;
    spacingBetweenLeadingEdgeAndIcon = self->_spacingBetweenLeadingEdgeAndIcon;
    if (v10)
      v26 = v10;
    else
      v26 = v46;
    objc_msgSend(v26, "frame");
    v30 = MaxX + spacingBetweenLeadingEdgeAndIcon;
    v31 = MinX - spacingBetweenTrailingEdgeAndLabels;
    v32 = CGRectGetMinX(v56) - self->_spacingBetweenTrailingEdgeAndLabels;
    objc_msgSend(v9, "frame");
    v33 = CGRectGetMaxX(v57) + self->_spacingBetweenLabelAndSecondIcon * 0.5;
    if (!v7)
      goto LABEL_37;
  }
  else
  {
    v44 = v15;
    objc_msgSend(v48, "frame");
    v17 = CGRectGetMinX(v51);
    v18 = self->_spacingBetweenLeadingEdgeAndIcon;
    if (v8)
      v19 = v8;
    else
      v19 = v47;
    objc_msgSend(v19, "frame");
    v23 = CGRectGetMaxX(v54);
    if (v7)
      v24 = self->_spacingBetweenLabelAndSecondIcon * 0.5;
    else
      v24 = self->_spacingBetweenTrailingEdgeAndLabels;
    objc_msgSend(v9, "frame");
    v27 = CGRectGetMinX(v55);
    spacingBetweenLabelAndSecondIcon = self->_spacingBetweenLabelAndSecondIcon;
    if (v10)
      v29 = v10;
    else
      v29 = v46;
    objc_msgSend(v29, "frame");
    v31 = v17 - v18;
    v30 = v23 + v24;
    v32 = v27 + spacingBetweenLabelAndSecondIcon * -0.5;
    v33 = CGRectGetMaxX(v58) + self->_spacingBetweenTrailingEdgeAndLabels;
    v15 = v44;
    if (!v7)
      goto LABEL_37;
  }
  if (v32 <= v13)
  {
    v34 = v50;
    if (v13 < v33)
      goto LABEL_43;
  }
  -[SBFluidSwitcherItemContainerHeaderView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v13, v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v50;
  if (v35 == v11)
    goto LABEL_43;
LABEL_37:
  if (v5)
  {
    v36 = v31 <= v13 && v13 < v30;
    v34 = v4;
    if (v36
      || (-[SBFluidSwitcherItemContainerHeaderView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v13, v15),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v37,
          v34 = v4,
          v37 == v45))
    {
LABEL_43:
      v38 = v34;
      if (v38)
      {
        v39 = v38;
        v40 = v9;
        v41 = v4;
        v42 = v11;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "itemContainerHeaderView:didSelectTitleItem:", self, v39);

        v11 = v42;
        v4 = v41;
        v9 = v40;

      }
    }
  }

}

- (void)_updateVisualStylingWithTitleItems:(id)a3
{
  void *v4;
  int64_t v5;
  BOOL v6;
  MTVisualStyling *v7;
  MTVisualStyling *subtitleVisualStyling;
  id v9;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "subtitleInterfaceStyle");

  if (self->_subtitleVisualStylingInterfaceStyle == v5)
  {
    if (self->_subtitleVisualStyling)
      v6 = 1;
    else
      v6 = v5 == 0;
    if (!v6)
      goto LABEL_9;
  }
  else if (v5)
  {
LABEL_9:
    self->_subtitleVisualStylingInterfaceStyle = v5;
    objc_msgSend(MEMORY[0x1E0D474B8], "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 53, 2, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_visualStylingForStyle:", 0);
    v7 = (MTVisualStyling *)objc_claimAutoreleasedReturnValue();
    subtitleVisualStyling = self->_subtitleVisualStyling;
    self->_subtitleVisualStyling = v7;

    -[SBFluidSwitcherItemContainerHeaderView _updateTitleAlpha](self, "_updateTitleAlpha");
    -[SBFluidSwitcherItemContainerHeaderView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (id)_multiWindowIndicatorAccessibilityIdentifierForDisplayItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("multiple-windows-indicator:%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_applyPrototypeSettings
{
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
  id v14;

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spacingBetweenLeadingEdgeAndIcon");
  self->_spacingBetweenLeadingEdgeAndIcon = v3;
  objc_msgSend(v14, "spacingBetweenTrailingEdgeAndLabels");
  self->_spacingBetweenTrailingEdgeAndLabels = v4;
  objc_msgSend(v14, "iconSideLength");
  self->_iconSideLength = v5;
  objc_msgSend(v14, "spacingBetweenSnapshotAndIcon");
  self->_spacingBetweenSnapshotAndIcon = v6;
  objc_msgSend(v14, "spacingBetweenSnapshotAndDescriptionLabelBaseline");
  self->_spacingBetweenSnapshotAndDescriptionLabelBaseline = v7;
  objc_msgSend(v14, "spacingBetweenTitleAndSubtitleBaseline");
  self->_spacingBetweenTitleAndSubtitleBaseline = v8;
  objc_msgSend(v14, "spacingBetweenIconAndLabel");
  self->_spacingBetweenIconAndLabel = v9;
  objc_msgSend(v14, "spacingBetweenLabelAndMultipleWindowsIndicator");
  self->_spacingBetweenLabelAndMultipleWindowsIndicator = v10;
  objc_msgSend(v14, "multipleWindowsIndicatorSideLength");
  self->_multipleWindowsIndicatorSideLength = v11;
  objc_msgSend(v14, "spacingBetweenLabelAndSecondIcon");
  self->_spacingBetweenLabelAndSecondIcon = v12;
  objc_msgSend(v14, "spacingBetweenBoundsCenterAndSecondIcon");
  self->_spacingBetweenBoundsCenterAndSecondIcon = v13;

}

- (id)_subtitleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0CEB588], *MEMORY[0x1E0CEB3E0]);
}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  char v6;
  int v7;
  char v8;
  double v9;
  double v10;
  double v11;
  NSString *v12;
  uint64_t v13;
  NSComparisonResult v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (id)*MEMORY[0x1E0CEB588];
  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_19;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v6 & 1) != 0)
        goto LABEL_19;
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_18;
  }
  v7 = __sb__runningInSpringBoard();
  v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v10 = v9;
  v11 = *(double *)(MEMORY[0x1E0DAB260] + 136);
  if ((v8 & 1) == 0)

  if ((v6 & 1) == 0)
  if (v10 >= v11)
  {
    v2 = v4;
    v4 = (id)*MEMORY[0x1E0CEB538];
    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CEB3E0];
  v14 = UIContentSizeCategoryCompareToCategory(v12, (UIContentSizeCategory)*MEMORY[0x1E0CEB3E0]);

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == NSOrderedDescending)
    objc_msgSend(v15, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 4, v13);
  else
    objc_msgSend(v15, "preferredFontForTextStyle:hiFontStyle:", v4, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_updateTitleAlpha
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MTVisualStyling *subtitleVisualStyling;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (-[NSArray count](self->_titleItems, "count"))
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (-[NSArray count](self->_titleItems, "count") < 2)
  {
    v3 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_titleItems, "objectAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "displayItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    v16 = 0;
    v6 = 0;
  }
  v15 = v3;
  if (v3)
  {
    -[NSMutableDictionary objectForKey:](self->_itemsToTitleLabels, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToSubtitleLabelViews, "objectForKey:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_itemsToMultiWindowIndicatorViews, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  objc_msgSend(v16, "setAlpha:", self->_textAlpha);
  objc_msgSend(v8, "setAlpha:", self->_textAlpha);
  objc_msgSend(v7, "setAlpha:", self->_textAlpha);
  objc_msgSend(v9, "setAlpha:", self->_textAlpha);
  subtitleVisualStyling = self->_subtitleVisualStyling;
  if (subtitleVisualStyling)
  {
    -[MTVisualStyling alpha](subtitleVisualStyling, "alpha");
    v12 = v11;
  }
  else
  {
    v12 = 1.0;
  }
  objc_msgSend(v6, "setAlpha:", self->_textAlpha);
  objc_msgSend(v6, "contentLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", v12);

  objc_msgSend(v3, "setAlpha:", self->_textAlpha);
  objc_msgSend(v3, "contentLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", v12);

}

- (id)_makeMultipleWindowsIndicatorView
{
  SBFluidSwitcherMultipleWindowsIndicatorView *v2;

  v2 = objc_alloc_init(SBFluidSwitcherMultipleWindowsIndicatorView);
  -[SBFluidSwitcherMultipleWindowsIndicatorView sizeToFit](v2, "sizeToFit");
  return v2;
}

- (SBFluidSwitcherItemContainerHeaderViewDelegate)delegate
{
  return (SBFluidSwitcherItemContainerHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (NSArray)titleItems
{
  return self->_titleItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_subtitleVisualStyling, 0);
  objc_storeStrong((id *)&self->_multiWindowIndicatorViewReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToMultiWindowIndicatorViews, 0);
  objc_storeStrong((id *)&self->_subtitleLabelReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToSubtitleLabelViews, 0);
  objc_storeStrong((id *)&self->_titleLabelReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToTitleLabels, 0);
  objc_storeStrong((id *)&self->_iconImageViewReusePool, 0);
  objc_storeStrong((id *)&self->_itemsToIconImageViews, 0);
}

@end
