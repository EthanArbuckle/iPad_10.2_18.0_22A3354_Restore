@implementation _UIBarCustomizationChiclet

- (_UIBarCustomizationChiclet)initWithItem:(id)a3
{
  id v4;
  _UIBarCustomizationChiclet *v5;
  _UIBarCustomizationChiclet *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  id v16;
  void *v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  UIView *v21;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  UIPointerInteraction *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_UIBarCustomizationChiclet;
  v5 = -[UIView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_chicletSize = 0;
    objc_storeWeak((id *)&v5->_representedItem, v4);
    objc_msgSend(v4, "set_chiclet:", v6);
    objc_msgSend(v4, "_sourceFrameInContainer:", 0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_opt_new();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __43___UIBarCustomizationChiclet_initWithItem___block_invoke;
    v44[3] = &unk_1E16C3280;
    v16 = v15;
    v45 = v16;
    v46 = v8;
    v47 = v10;
    v48 = v12;
    v49 = v14;
    objc_msgSend(v4, "_enumerateSubitemsWithBlock:", v44);
    _itemViewFromItem(v4, v8, v10, v12, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationChiclet setRootItemView:](v6, "setRootItemView:", v17);

    -[_UIBarCustomizationChiclet setSubitemViews:](v6, "setSubitemViews:", v16);
    v18 = [UIView alloc];
    -[UIView bounds](v6, "bounds");
    v19 = -[UIView initWithFrame:](v18, "initWithFrame:");
    -[_UIBarCustomizationChiclet setContentWrapperView:](v6, "setContentWrapperView:", v19);

    -[_UIBarCustomizationChiclet contentWrapperView](v6, "contentWrapperView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v6, "addSubview:", v20);

    v21 = [UIView alloc];
    -[UIView bounds](v6, "bounds");
    v22 = -[UIView initWithFrame:](v21, "initWithFrame:");
    -[_UIBarCustomizationChiclet setPlatterView:](v6, "setPlatterView:", v22);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationChiclet platterView](v6, "platterView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v23);

    -[_UIBarCustomizationChiclet platterView](v6, "platterView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShadowPathIsBounds:", 1);

    -[_UIBarCustomizationChiclet platterView](v6, "platterView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsEdgeAntialiasing:", 1);

    -[_UIBarCustomizationChiclet contentWrapperView](v6, "contentWrapperView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationChiclet platterView](v6, "platterView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v30);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = v16;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v41;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(v31);
          -[_UIBarCustomizationChiclet _addContentView:](v6, "_addContentView:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v35++), (_QWORD)v40);
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      }
      while (v33);
    }

    -[_UIBarCustomizationChiclet rootItemView](v6, "rootItemView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationChiclet _addContentView:](v6, "_addContentView:", v36);

    v37 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v6);
    -[_UIBarCustomizationChiclet setPointerInteraction:](v6, "setPointerInteraction:", v37);

    -[_UIBarCustomizationChiclet pointerInteraction](v6, "pointerInteraction");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addInteraction:](v6, "addInteraction:", v38);

  }
  return v6;
}

- (void)updateItemCenterPoints
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;

  -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_sourceFrameInContainer:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBarCustomizationChiclet rootItemView](self, "rootItemView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _updateSourceCenterForItemView(v21, v11, v4, v6, v8, v10);

  objc_msgSend(v21, "subitems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      objc_msgSend(v21, "subitems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarCustomizationChiclet subitemViews](self, "subitemViews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _updateSourceCenterForItemView(v16, v18, v4, v6, v8, v10);

      ++v14;
      objc_msgSend(v21, "subitems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v20 > v14);
  }

}

- (void)_addContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v10;
    objc_msgSend(v4, "sourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      +[_UIBarCustomizationCustomViewPortalSourceContainer sharedContainer](_UIBarCustomizationCustomViewPortalSourceContainer, "sharedContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

    }
  }
  -[_UIBarCustomizationChiclet contentWrapperView](self, "contentWrapperView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)layoutSubviews
{
  void *v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFArray *SeparateComponents;
  CFIndex Count;
  double v23;
  CFIndex v24;
  CFIndex v25;
  const CGPath *ValueAtIndex;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  unint64_t v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  void *v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  double MaxX;
  int v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  int64_t v93;
  double v94;
  void *v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double MidX;
  CGFloat v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t i;
  void *v120;
  void *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _OWORD v125[3];
  CGAffineTransform v126;
  CGAffineTransform v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  CGAffineTransform v132;
  CGAffineTransform v133;
  CGAffineTransform v134;
  CGAffineTransform v135;
  CGAffineTransform v136;
  CGAffineTransform v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _OWORD v142[3];
  _OWORD v143[3];
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  CGAffineTransform v148;
  CGAffineTransform v149;
  objc_super v150;
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;
  CGRect v155;
  CGRect PathBoundingBox;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;

  v154 = *MEMORY[0x1E0C80C00];
  v150.receiver = self;
  v150.super_class = (Class)_UIBarCustomizationChiclet;
  -[UIView layoutSubviews](&v150, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIBarCustomizationChiclet contentWrapperView](self, "contentWrapperView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIBarCustomizationChiclet minimized](self, "minimized"))
  {
    objc_msgSend(v12, "setFrame:", round(v5 + v9 * 0.5 + -19.0), round(v7 + v11 * 0.5 + -19.0), 38.0, 38.0);
    -[_UIBarCustomizationChiclet platterView](self, "platterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v13, "setAlpha:", 1.0);
    objc_msgSend(v13, "bounds");
    objc_msgSend(v13, "_setCornerRadius:", CGRectGetWidth(v155) * 0.5);
    -[UIView tintColor](self, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    -[UIView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithTraitCollection:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_outlinePath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutorelease(v19);
    SeparateComponents = CGPathCreateSeparateComponents((CGPathRef)objc_msgSend(v20, "CGPath"), 0);
    Count = CFArrayGetCount(SeparateComponents);
    v23 = 0.0;
    if (Count >= 1)
    {
      v24 = Count;
      v25 = 0;
      while (1)
      {
        ValueAtIndex = (const CGPath *)CFArrayGetValueAtIndex(SeparateComponents, v25);
        PathBoundingBox = CGPathGetPathBoundingBox(ValueAtIndex);
        x = PathBoundingBox.origin.x;
        y = PathBoundingBox.origin.y;
        width = PathBoundingBox.size.width;
        height = PathBoundingBox.size.height;
        v31 = CGRectGetWidth(PathBoundingBox);
        objc_msgSend(v20, "bounds");
        if (v31 < CGRectGetWidth(v157) * 0.5)
          break;
        if (v24 == ++v25)
          goto LABEL_54;
      }
      v169.origin.x = x;
      v169.origin.y = y;
      v169.size.width = width;
      v169.size.height = height;
      v23 = CGRectGetWidth(v169);
    }
LABEL_54:

    CGAffineTransformMakeScale(&v149, v23 / 38.0, v23 / 38.0);
    v148 = v149;
    -[UIView setTransform:](self, "setTransform:", &v148);
    objc_msgSend(v12, "bounds");
    v111 = v110 + v109 * 0.5;
    v114 = v113 + v112 * 0.5;
    -[_UIBarCustomizationChiclet rootItemView](self, "rootItemView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "setCenter:", v111, v114);

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    -[_UIBarCustomizationChiclet subitemViews](self, "subitemViews");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v144, v153, 16);
    if (v116)
    {
      v117 = v116;
      v118 = *(_QWORD *)v145;
      do
      {
        for (i = 0; i != v117; ++i)
        {
          if (*(_QWORD *)v145 != v118)
            objc_enumerationMutation(v65);
          v120 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * i);
          -[_UIBarCustomizationChiclet rootItemView](self, "rootItemView");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "center");
          objc_msgSend(v120, "setCenter:");

          objc_msgSend(v120, "setAlpha:", 0.0);
        }
        v117 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v144, v153, 16);
      }
      while (v117);
    }
  }
  else
  {
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
    v123 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v124 = *MEMORY[0x1E0C9BAA8];
    v143[0] = *MEMORY[0x1E0C9BAA8];
    v143[1] = v123;
    v122 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v143[2] = v122;
    -[UIView setTransform:](self, "setTransform:", v143);
    -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_sourceFrameInContainer:", 0);

    -[_UIBarCustomizationChiclet _currentContentSize](self, "_currentContentSize");
    v34 = v33;
    v36 = v35;
    -[_UIBarCustomizationChiclet subitemViews](self, "subitemViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_UIBarCustomizationChiclet platterVisible](self, "platterVisible"))
    {
      v37 = objc_msgSend(v13, "count");
      -[_UIBarCustomizationChiclet _currentInterItemSpacing](self, "_currentInterItemSpacing");
      v39 = v34 - v38 * (double)(v37 - 1);
      v158.origin.x = v5;
      v158.origin.y = v7;
      v158.size.width = v9;
      v158.size.height = v11;
      v40 = (CGRectGetWidth(v158) - v39) / (double)(v37 + 1);
      if (v40 >= 16.0)
        v41 = v40;
      else
        v41 = 16.0;
      if (objc_msgSend(v13, "count"))
      {
        v42 = 0;
        v43 = 0.0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "subitems");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectAtIndexedSubscript:", v42);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "tintColor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setTintColor:", v48);

          objc_msgSend(v44, "bounds");
          v49 = CGRectGetWidth(v159) * 0.5;
          objc_msgSend(v44, "setCenter:", v41 + v43 + v49, v7 + v11 * 0.5);
          objc_msgSend(v44, "center");
          v43 = v49 + v50;

          ++v42;
        }
        while (objc_msgSend(v13, "count") > v42);
      }
    }
    else
    {
      v160.origin.x = v5;
      v160.origin.y = v7;
      v160.size.width = v9;
      v160.size.height = v11;
      v51 = CGRectGetWidth(v160);
      v161.origin.x = v5;
      v161.origin.y = v7;
      v161.size.width = v9;
      v161.size.height = v11;
      v52 = CGRectGetHeight(v161);
      if (objc_msgSend(v13, "count"))
      {
        v53 = 0;
        v54 = (v51 - v34) * 0.5;
        v55 = (v52 - v36) * 0.5;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "_getSourceCenter");
          objc_msgSend(v56, "setCenter:", v54 + v57, v55 + v58);
          -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "subitems");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectAtIndexedSubscript:", v53);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v61, "enabled") & 1) == 0)
          {
            objc_msgSend(v61, "tintColor");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v62;
            if (!v62)
            {
              -[UIView tintColor](self, "tintColor");
              v2 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v2;
            }
            +[UIColor _disabledColorForColor:]((uint64_t)UIColor, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setTintColor:", v64);

            if (!v62)
          }

          ++v53;
        }
        while (objc_msgSend(v13, "count") > v53);
      }
    }
    -[_UIBarCustomizationChiclet rootItemView](self, "rootItemView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setCenter:", v5 + v9 * 0.5, v7 + v11 * 0.5);
    if (-[_UIBarCustomizationChiclet _isDisplayingRootItem](self, "_isDisplayingRootItem"))
    {
      objc_msgSend(v65, "setAlpha:", 1.0);
      v142[0] = v124;
      v142[1] = v123;
      v142[2] = v122;
      objc_msgSend(v65, "setTransform:", v142);
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v66 = v13;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v138, v152, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v139;
        do
        {
          for (j = 0; j != v68; ++j)
          {
            if (*(_QWORD *)v139 != v69)
              objc_enumerationMutation(v66);
            v71 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * j);
            memset(&v137, 0, sizeof(v137));
            objc_msgSend(v65, "center");
            v73 = v72;
            objc_msgSend(v71, "center");
            v75 = v73 - v74;
            objc_msgSend(v65, "center");
            v77 = v76;
            objc_msgSend(v71, "center");
            CGAffineTransformMakeTranslation(&v137, v75, v77 - v78);
            v135 = v137;
            CGAffineTransformScale(&v136, &v135, 0.5, 0.5);
            v134 = v136;
            objc_msgSend(v71, "setTransform:", &v134);
            objc_msgSend(v71, "setAlpha:", 0.0);
          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v138, v152, 16);
        }
        while (v68);
      }
    }
    else
    {
      objc_msgSend(v65, "setAlpha:", 0.0);
      CGAffineTransformMakeScale(&v133, 0.5, 0.5);
      v132 = v133;
      objc_msgSend(v65, "setTransform:", &v132);
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v79 = v13;
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v128, v151, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v129;
        do
        {
          for (k = 0; k != v81; ++k)
          {
            if (*(_QWORD *)v129 != v82)
              objc_enumerationMutation(v79);
            v84 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
            objc_msgSend(v84, "frame");
            MaxX = CGRectGetMaxX(v162);
            v163.origin.x = v5;
            v163.origin.y = v7;
            v163.size.width = v9;
            v163.size.height = v11;
            if (MaxX <= CGRectGetWidth(v163))
            {
              v125[0] = v124;
              v125[1] = v123;
              v125[2] = v122;
              objc_msgSend(v84, "setTransform:", v125);
              objc_msgSend(v84, "setAlpha:", 1.0);
            }
            else
            {
              objc_msgSend(v84, "setAlpha:", 0.0);
              CGAffineTransformMakeScale(&v127, 0.0, 0.0);
              v126 = v127;
              objc_msgSend(v84, "setTransform:", &v126);
              v86 = objc_msgSend(v79, "indexOfObject:", v84);
              objc_msgSend(v79, "objectAtIndexedSubscript:", v86 - (v86 > 0));
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "center");
              objc_msgSend(v84, "setCenter:");

            }
          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v128, v151, 16);
        }
        while (v81);
      }
    }

    if (-[_UIBarCustomizationChiclet platterVisible](self, "platterVisible"))
    {
      v88 = -[_UIBarCustomizationChiclet fixed](self, "fixed");
      -[_UIBarCustomizationChiclet platterView](self, "platterView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 1.0;
      if (v88)
      {
        v90 = 0.0;
        v91 = 2.0;
      }
      else
      {
        v91 = 0.0;
      }
    }
    else
    {
      -[_UIBarCustomizationChiclet platterView](self, "platterView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0.0;
      v91 = 2.0;
    }
    objc_msgSend(v89, "setAlpha:", v90);
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setBackgroundColor:", v92);

    objc_msgSend(v12, "bounds");
    v165 = CGRectInset(v164, v91, v91);
    objc_msgSend(v89, "setFrame:", v165.origin.x, v165.origin.y, v165.size.width, v165.size.height);
    v93 = -[_UIBarCustomizationChiclet chicletSize](self, "chicletSize");
    v94 = 13.0;
    if (v93 != 1)
      v94 = 10.0;
    objc_msgSend(v89, "_setContinuousCornerRadius:", v94);
    -[_UIBarCustomizationChiclet _updatePlatterShadow](self, "_updatePlatterShadow");
    -[_UIBarCustomizationChiclet label](self, "label");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      objc_msgSend(v89, "bounds");
      objc_msgSend(v89, "convertRect:toView:", self);
      v96 = v166.origin.x;
      v97 = v166.origin.y;
      v98 = v166.size.width;
      v99 = v166.size.height;
      MidX = CGRectGetMidX(v166);
      v167.origin.x = v96;
      v167.origin.y = v97;
      v167.size.width = v98;
      v167.size.height = v99;
      v101 = CGRectGetMaxY(v167) + 10.0;
      -[_UIBarCustomizationChiclet label](self, "label");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setCenter:", MidX, v101);

      -[_UIBarCustomizationChiclet label](self, "label");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "bounds");
      objc_msgSend(v103, "sizeThatFits:", CGRectGetWidth(v168) + 20.0, 0.0);
      v105 = v104;
      v107 = v106;

      -[_UIBarCustomizationChiclet label](self, "label");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setBounds:", 0.0, 0.0, v105, v107);

    }
  }

}

- (void)setPlatterVisible:(BOOL)a3
{
  _BOOL4 platterVisible;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  if (self->_platterVisible != a3)
  {
    self->_platterVisible = a3;
    if (-[_UIBarCustomizationChiclet fixed](self, "fixed"))
    {
      platterVisible = self->_platterVisible;
      -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (platterVisible)
      {
        +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_colorBlendedWithColor:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setTintColor:](self, "setTintColor:", v8);

        v9 = 0.32;
      }
      else
      {
        -[UIView setTintColor:](self, "setTintColor:", v6);

        v9 = 1.0;
      }
      -[UIView setAlpha:](self, "setAlpha:", v9);
    }
    else
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
      {
        -[_UIBarCustomizationChiclet sizeToFit](self, "sizeToFit");
        -[UIView layoutIfNeeded](self, "layoutIfNeeded");
      }
    }
  }
}

- (void)setLabelVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  _QWORD v19[5];

  if (self->_labelVisible != a3)
  {
    self->_labelVisible = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    if (self->_labelVisible)
    {
      -[_UIBarCustomizationChiclet label](self, "label");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v5 = (void *)objc_opt_new();
        -[_UIBarCustomizationChiclet setLabel:](self, "setLabel:", v5);

        -[_UIBarCustomizationChiclet label](self, "label");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTextAlignment:", 1);

        -[_UIBarCustomizationChiclet label](self, "label");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAllowsDefaultTighteningForTruncation:", 1);

        -[_UIBarCustomizationChiclet label](self, "label");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

        -[_UIBarCustomizationChiclet label](self, "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNumberOfLines:", 2);

        objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarCustomizationChiclet label](self, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v10);

        -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIBarCustomizationChiclet label](self, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setText:", v13);

        -[_UIBarCustomizationChiclet label](self, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAnchorPoint:", 0.5, 0.0);

        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __46___UIBarCustomizationChiclet_setLabelVisible___block_invoke;
        v19[3] = &unk_1E16B1B28;
        v19[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
      }
    }
    if (self->_labelVisible)
      v17 = 1.0;
    else
      v17 = 0.0;
    -[_UIBarCustomizationChiclet label](self, "label");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", v17);

  }
}

- (void)setMinimized:(BOOL)a3
{
  if (self->_minimized != a3)
  {
    self->_minimized = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)fixed
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)sizeToFit
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
  id v14;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBarCustomizationChiclet sizeThatFits:](self, "sizeThatFits:", v7, v9);
  if (v8 != v11 || v10 != v12)
  {
    -[UIView setBounds:](self, "setBounds:", v4, v6, v11, v12);
    -[_UIBarCustomizationChiclet pointerInteraction](self, "pointerInteraction");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UIBarCustomizationChiclet fittingSizeWithChicletSize:](self, "fittingSizeWithChicletSize:", -[_UIBarCustomizationChiclet chicletSize](self, "chicletSize", a3.width, a3.height));
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)fittingSizeWithChicletSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  CGSize result;

  -[_UIBarCustomizationChiclet _interItemSpacingForChicletSize:](self, "_interItemSpacingForChicletSize:");
  v6 = v5;
  -[_UIBarCustomizationChiclet _contentSizeWithInterItemSpacing:](self, "_contentSizeWithInterItemSpacing:");
  if (a3 == 1)
  {
    v9 = 0;
    v10 = v7 + 20.0;
    do
    {
      if (v10 <= fittingSizeWithChicletSize___sizeBuckets[v9])
        break;
      ++v9;
    }
    while (v9 != 4);
    if (v9 >= 3)
      LODWORD(v9) = 3;
    v11 = fittingSizeWithChicletSize___sizeBuckets[v9];
    if (v11 < 60.0)
      v11 = 60.0;
    if (v8 < 60.0)
      v8 = 60.0;
  }
  else
  {
    if (v8 < 38.0)
      v8 = 38.0;
    v11 = v6 + v6 + v7;
    if (v11 < 38.0)
      v11 = 38.0;
  }
  result.height = v8;
  result.width = v11;
  return result;
}

- (CGSize)_currentContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[_UIBarCustomizationChiclet _currentInterItemSpacing](self, "_currentInterItemSpacing");
  -[_UIBarCustomizationChiclet _contentSizeWithInterItemSpacing:](self, "_contentSizeWithInterItemSpacing:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_contentSizeWithInterItemSpacing:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v18;
  void *v19;
  void *v20;
  double MidX;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _QWORD v46[2];
  CGSize result;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v46[1] = *MEMORY[0x1E0C80C00];
  if (-[_UIBarCustomizationChiclet _isDisplayingRootItem](self, "_isDisplayingRootItem"))
  {
    -[_UIBarCustomizationChiclet rootItemView](self, "rootItemView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_UIBarCustomizationChiclet subitemViews](self, "subitemViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[_UIBarCustomizationChiclet platterVisible](self, "platterVisible"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "bounds");
          x = v48.origin.x;
          y = v48.origin.y;
          width = v48.size.width;
          height = v48.size.height;
          v12 = v12 + CGRectGetWidth(v48);
          v49.origin.x = x;
          v49.origin.y = y;
          v49.size.width = width;
          v49.size.height = height;
          v18 = CGRectGetHeight(v49);
          if (v11 < v18)
            v11 = v18;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
    }

    v27 = v12 + (double)(unint64_t)(objc_msgSend(v7, "count") - 1) * a3;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    MidX = CGRectGetMidX(v50);
    objc_msgSend(v20, "_getSourceCenter");
    v23 = v22;
    objc_msgSend(v19, "_getSourceCenter");
    v25 = v23 - v24;
    objc_msgSend(v20, "bounds");
    v26 = MidX + v25 + CGRectGetMidX(v51);
    v11 = 0.0;
    v36 = 0u;
    v37 = 0u;
    v27 = v26;
    v38 = 0u;
    v39 = 0u;
    v28 = v6;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "bounds", (_QWORD)v36);
          v33 = CGRectGetHeight(v52);
          if (v11 < v33)
            v11 = v33;
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v30);
    }

  }
  v34 = v27;
  v35 = v11;
  result.height = v35;
  result.width = v34;
  return result;
}

- (double)_currentInterItemSpacing
{
  double result;

  -[_UIBarCustomizationChiclet _interItemSpacingForChicletSize:](self, "_interItemSpacingForChicletSize:", -[_UIBarCustomizationChiclet chicletSize](self, "chicletSize"));
  return result;
}

- (double)_interItemSpacingForChicletSize:(int64_t)a3
{
  double result;

  result = 16.0;
  if (a3 == 1)
    return 20.0;
  return result;
}

- (void)_updatePlatterShadow
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[_UIBarCustomizationChiclet chicletSize](self, "chicletSize");
  if (v3 == 1)
    v4 = 4.0;
  else
    v4 = 2.0;
  if (v3 == 1)
    v5 = 32.0;
  else
    v5 = 16.0;
  -[_UIBarCustomizationChiclet platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1036831949;
  objc_msgSend(v7, "setShadowOpacity:", v8);

  -[_UIBarCustomizationChiclet platterView](self, "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowRadius:", v5);

  -[_UIBarCustomizationChiclet platterView](self, "platterView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowOffset:", 0.0, v4);

}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  _QWORD *var1;
  _QWORD *var0;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UIBarCustomizationChiclet;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v18, sel__traitCollectionDidChangeOnSubtreeInternal_);
  var1 = a3->var1;
  if (var1)
  {
    var0 = a3->var0;
    if (!a3->var0 || var1[13] != var0[13] || var1[15] != var0[15])
    {
      -[_UIBarCustomizationChiclet rootItemView](self, "rootItemView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sizeToFit");

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[_UIBarCustomizationChiclet subitemViews](self, "subitemViews", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "sizeToFit");
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v10);
      }

      -[_UIBarCustomizationChiclet sizeToFit](self, "sizeToFit");
      -[UIView setNeedsLayout](self, "setNeedsLayout");
      -[_UIBarCustomizationChiclet anchorView](self, "anchorView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sizeToFit");

    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  BOOL v16;
  objc_super v18;
  CGPoint v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  width = v12;
  height = v14;
  if (objc_msgSend(v7, "type") == 11)
  {
    v20.origin.x = v9;
    v20.origin.y = v11;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectInset(v20, -10.0, -10.0);
    v9 = v21.origin.x;
    v11 = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = width;
  v22.size.height = height;
  v19.x = x;
  v19.y = y;
  if (CGRectContainsPoint(v22, v19))
  {
    v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIBarCustomizationChiclet;
    v16 = -[UIView pointInside:withEvent:](&v18, sel_pointInside_withEvent_, v7, x, y);
  }

  return v16;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  uint64_t v16;
  _UIBarCustomizationChiclet *v17;
  CGPoint v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  width = v12;
  height = v14;
  v16 = objc_msgSend(v7, "type");

  if (v16 == 11)
  {
    v20.origin.x = v9;
    v20.origin.y = v11;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectInset(v20, -10.0, -10.0);
    v9 = v21.origin.x;
    v11 = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = width;
  v22.size.height = height;
  v19.x = x;
  v19.y = y;
  if (CGRectContainsPoint(v22, v19))
    v17 = self;
  else
    v17 = 0;
  return v17;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v5;
  CGRect v7;
  CGRect v8;

  -[UIView bounds](self, "bounds", a3, a4, a5);
  v8 = CGRectInset(v7, -10.0, -10.0);
  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLatchingAxes:", 3);
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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
  void *v26;
  void *v27;
  UITargetedPreview *v28;
  void *v29;
  void *v30;
  void *v31;

  -[_UIBarCustomizationChiclet platterView](self, "platterView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizationChiclet contentWrapperView](self, "contentWrapperView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v5, "_cornerRadius");
  v25 = v24;
  v26 = (void *)objc_opt_new();
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowPath:", v27);

  v28 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", v6, v26);
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v30, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)_isDisplayingRootItem
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UIBarCustomizationChiclet representedItem](self, "representedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "collapsed") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[_UIBarCustomizationChiclet subitemViews](self, "subitemViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (BOOL)platterVisible
{
  return self->_platterVisible;
}

- (BOOL)labelVisible
{
  return self->_labelVisible;
}

- (BOOL)minimized
{
  return self->_minimized;
}

- (int64_t)chicletSize
{
  return self->_chicletSize;
}

- (void)setChicletSize:(int64_t)a3
{
  self->_chicletSize = a3;
}

- (_UIBarCustomizationChicletAnchorView)anchorView
{
  return (_UIBarCustomizationChicletAnchorView *)objc_loadWeakRetained((id *)&self->_anchorView);
}

- (void)setAnchorView:(id)a3
{
  objc_storeWeak((id *)&self->_anchorView, a3);
}

- (_UIBarCustomizationItem)representedItem
{
  return (_UIBarCustomizationItem *)objc_loadWeakRetained((id *)&self->_representedItem);
}

- (UIView)contentWrapperView
{
  return self->_contentWrapperView;
}

- (void)setContentWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_contentWrapperView, a3);
}

- (UIView)rootItemView
{
  return self->_rootItemView;
}

- (void)setRootItemView:(id)a3
{
  objc_storeStrong((id *)&self->_rootItemView, a3);
}

- (NSArray)subitemViews
{
  return self->_subitemViews;
}

- (void)setSubitemViews:(id)a3
{
  objc_storeStrong((id *)&self->_subitemViews, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_subitemViews, 0);
  objc_storeStrong((id *)&self->_rootItemView, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
  objc_destroyWeak((id *)&self->_representedItem);
  objc_destroyWeak((id *)&self->_anchorView);
}

@end
