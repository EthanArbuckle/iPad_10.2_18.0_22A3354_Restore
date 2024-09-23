@implementation _UIContextMenuLargeFloatingPaletteCellLayout

- (_UIContextMenuLargeFloatingPaletteCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuLargeFloatingPaletteCellLayout *v5;
  _UIContextMenuLargeFloatingPaletteCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuLargeFloatingPaletteCellLayout;
  v5 = -[_UIContextMenuLargeFloatingPaletteCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuLargeFloatingPaletteCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLargeFloatingPaletteCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

  }
  return v6;
}

- (int64_t)layoutSize
{
  return 2;
}

- (int64_t)labelTextAlignment
{
  return 1;
}

- (unint64_t)labelMaximumNumberOfLines
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = 3;

  return v4;
}

- (BOOL)allowsHighlightingOnHover
{
  return 0;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "titleEmphasizedFont");
  else
    objc_msgSend(v6, "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIColor)preferredContentColorForCurrentState
{
  void *v3;
  void *v4;
  void *v5;

  if ((-[_UIContextMenuLargeFloatingPaletteCellLayout controlState](self, "controlState") & 8) != 0
    && (-[_UIContextMenuLargeFloatingPaletteCellLayout contentView](self, "contentView"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "iconView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    +[UIColor labelColor](UIColor, "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (UIColor *)v5;
}

- (UIColor)preferredBackgroundColorForCurrentState
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (UIHoverStyle)hoverStyle
{
  return 0;
}

- (UIShape)contentShape
{
  void *v2;
  void *v3;

  +[UIShape rectShapeWithCornerRadius:](UIShape, "rectShapeWithCornerRadius:", 8.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shapeByApplyingInsets:", 8.0, 0.0, 8.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIShape *)v3;
}

- (BOOL)useContentShapeForSelectionHighlight
{
  return 0;
}

- (int64_t)focusStyle
{
  return 0;
}

- (void)installConstraints
{
  _UIContextMenuLargeFloatingPaletteCellLayout *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UIFloatingContentView *v7;
  _UIFloatingContentView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _UIContextMenuLargeFloatingPaletteCellLayout *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  _UIContextMenuLargeFloatingPaletteCellLayout *v142;
  _UIContextMenuLargeFloatingPaletteCellLayout *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  _QWORD v157[6];
  _QWORD v158[4];
  _QWORD v159[6];
  _QWORD v160[2];
  void *v161;
  _QWORD v162[4];
  _QWORD v163[4];
  _QWORD v164[8];

  v2 = self;
  v164[6] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuLargeFloatingPaletteCellLayout removeConstraints](self, "removeConstraints");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](v2, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](v2, "floatingContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [_UIFloatingContentView alloc];
    v8 = -[_UIFloatingContentView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIContextMenuLargeFloatingPaletteCellLayout setFloatingContentView:](v2, "setFloatingContentView:", v8);

  }
  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](v2, "floatingContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v9);

  objc_msgSend(v4, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](v2, "floatingContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = v11;
  v151 = v10;
  if (v10)
  {
    -[_UIContextMenuLargeFloatingPaletteCellLayout _configureSharedFloatingContentViewStyleForImageStyle:](v2, "_configureSharedFloatingContentViewStyleForImageStyle:", 1);
    objc_msgSend(v4, "addSubview:", v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v142 = v2;
      v152 = v10;
      objc_msgSend(v152, "_currentImage");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "constraintEqualToAnchor:constant:", v126, 30.0);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v164[0] = v120;
      objc_msgSend(v12, "widthAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "size");
      objc_msgSend(v115, "constraintEqualToConstant:");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v164[1] = v112;
      objc_msgSend(v12, "heightAnchor");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "size");
      objc_msgSend(v109, "constraintEqualToConstant:", v13);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v164[2] = v106;
      objc_msgSend(v12, "centerXAnchor");
      v14 = v4;
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v15 = v3;
      v147 = v3;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v164[3] = v17;
      objc_msgSend(v12, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v164[4] = v20;
      objc_msgSend(v12, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v14;
      objc_msgSend(v14, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v22);
      v146 = v12;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v164[5] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v24);

      objc_msgSend(v146, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addSubview:", v152);

      objc_msgSend(v152, "widthAnchor");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "size");
      objc_msgSend(v133, "constraintEqualToConstant:");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v163[0] = v127;
      objc_msgSend(v152, "heightAnchor");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "size");
      objc_msgSend(v121, "constraintEqualToConstant:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v163[1] = v27;
      objc_msgSend(v152, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "contentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "centerXAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v163[2] = v31;
      objc_msgSend(v152, "centerYAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "centerYAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v163[3] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "addObjectsFromArray:", v36);

      v37 = v156;
      if (v156)
      {
        objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "setFont:", v38);

        v39 = (-[_UIContextMenuLargeFloatingPaletteCellLayout controlState](v142, "controlState") & 8) == 0
           && (-[_UIContextMenuLargeFloatingPaletteCellLayout controlState](v142, "controlState") & 1) == 0;
        objc_msgSend(v156, "setHidden:", v39);
        objc_msgSend(v149, "addSubview:", v156);
        objc_msgSend(v156, "topAnchor");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "bottomAnchor");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "constraintEqualToAnchor:constant:", v131, 5.0);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v162[0] = v125;
        objc_msgSend(v156, "bottomAnchor");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "bottomAnchor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "constraintLessThanOrEqualToAnchor:constant:", v95, -16.0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v162[1] = v96;
        objc_msgSend(v156, "centerXAnchor");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "centerXAnchor");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "constraintEqualToAnchor:", v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v162[2] = v99;
        objc_msgSend(v156, "widthAnchor");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "widthAnchor");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "constraintEqualToAnchor:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v162[3] = v102;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 4);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "addObjectsFromArray:", v103);

        v37 = v156;
        v67 = v147;

        v4 = v149;
        objc_msgSend(v156, "setPreferredMaxLayoutWidth:", 0.0);
      }
      else
      {
        objc_msgSend(v146, "bottomAnchor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v149;
        objc_msgSend(v149, "bottomAnchor");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "constraintLessThanOrEqualToAnchor:constant:", v92, -46.0);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = v93;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v161, 1);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v147;
        objc_msgSend(v147, "addObjectsFromArray:", v94);

      }
      v2 = v142;

      v74 = v151;
      v66 = v152;
      v12 = v146;
    }
    else
    {
      objc_msgSend(v4, "addSubview:", v10);
      objc_msgSend(v10, "centerYAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerYAnchor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "constraintEqualToAnchor:", v144);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v160[0] = v68;
      objc_msgSend(v10, "centerXAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v70);
      v71 = v12;
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v160[1] = v72;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 2);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v73, "mutableCopy");

      v12 = v71;
      v74 = v151;
      v66 = v154;

      v37 = v156;
    }
  }
  else
  {
    v148 = v3;
    v150 = v4;
    if (v11)
    {
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v40);

      -[_UIContextMenuLargeFloatingPaletteCellLayout _configureSharedFloatingContentViewStyleForImageStyle:](v2, "_configureSharedFloatingContentViewStyleForImageStyle:", 0);
      -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](v2, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "traitCollection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "userInterfaceIdiom");

      _UIContextMenuGetPlatformMetrics(v43);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "paletteMinimumItemSize");
      v45 = v44;
      v47 = v46;
      objc_msgSend(v12, "topAnchor");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "constraintEqualToAnchor:constant:", v134, 30.0);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v159[0] = v128;
      objc_msgSend(v12, "bottomAnchor");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "constraintEqualToAnchor:constant:", v116, -46.0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v159[1] = v113;
      objc_msgSend(v12, "leadingAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leadingAnchor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "constraintEqualToAnchor:", v107);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v159[2] = v48;
      objc_msgSend(v12, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "trailingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v159[3] = v51;
      objc_msgSend(v12, "widthAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "constraintGreaterThanOrEqualToConstant:", v45);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v159[4] = v53;
      objc_msgSend(v12, "heightAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "constraintGreaterThanOrEqualToConstant:", v47);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v159[5] = v55;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 6);
      v143 = v2;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "addObjectsFromArray:", v56);

      objc_msgSend(v12, "contentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "addSubview:", v156);

      objc_msgSend(v156, "topAnchor");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topAnchor");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "constraintEqualToAnchor:constant:", v135, 19.0);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v158[0] = v129;
      objc_msgSend(v156, "bottomAnchor");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bottomAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "constraintEqualToAnchor:constant:", v117, -19.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v158[1] = v58;
      objc_msgSend(v156, "centerXAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerXAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v158[2] = v61;
      objc_msgSend(v156, "widthAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "widthAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:constant:", v63, -20.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v158[3] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 4);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "addObjectsFromArray:", v65);

      v37 = v156;
      v66 = v153;

      v67 = v148;
      v4 = v150;

      v2 = v143;
      objc_msgSend(v156, "setPreferredMaxLayoutWidth:", 208.0);
    }
    else
    {
      -[_UIContextMenuLargeFloatingPaletteCellLayout _configureSharedFloatingContentViewStyleForImageStyle:](v2, "_configureSharedFloatingContentViewStyleForImageStyle:", 0);
      -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](v2, "contentView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "traitCollection");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "userInterfaceIdiom");

      _UIContextMenuGetPlatformMetrics(v77);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "paletteMinimumItemSize");
      v79 = v78;
      v81 = v80;
      objc_msgSend(v12, "topAnchor");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "constraintEqualToAnchor:constant:", v141, 30.0);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v157[0] = v136;
      objc_msgSend(v12, "bottomAnchor");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bottomAnchor");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "constraintEqualToAnchor:constant:", v124, -46.0);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v157[1] = v118;
      objc_msgSend(v12, "leadingAnchor");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "leadingAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "constraintEqualToAnchor:", v111);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v157[2] = v108;
      objc_msgSend(v12, "trailingAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "trailingAnchor");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "constraintEqualToAnchor:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v157[3] = v83;
      objc_msgSend(v12, "widthAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "constraintEqualToConstant:", v79);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v157[4] = v85;
      objc_msgSend(v12, "heightAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintEqualToConstant:", v81);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v157[5] = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v157, 6);
      v88 = v12;
      v89 = v2;
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v148;
      objc_msgSend(v148, "addObjectsFromArray:", v90);

      v2 = v89;
      v12 = v88;

      v37 = v156;
      v66 = v155;

      v4 = v150;
    }
    v74 = 0;
  }

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v67);
  -[_UIContextMenuLargeFloatingPaletteCellLayout setManagedConstraints:](v2, "setManagedConstraints:", v67);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *managedConstraints;

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuLargeFloatingPaletteCellLayout managedConstraints](self, "managedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;

}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  self->_controlState = a3;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self->_floatingContentView, "setControlState:withAnimationCoordinator:");
  -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](self, "contentView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", (v4 & 9) == 0);

  }
}

- (void)_configureSharedFloatingContentViewStyleForImageStyle:(BOOL)a3
{
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusAnimationConfiguration:", v6);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 24.0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRoundContentWhenDeselected:", 1);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsContentToBounds:", 1);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFocusedSizeIncrease:", 20.0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUseShadowImage:", 0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowRadius:", 10.0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShadowVerticalOffset:", 15.0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentMotionRotation:translation:", 0.0, 0.0, 4.0, 4.0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFocusScaleAnchorPoint:", 0.5, 1.0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v19;
  if (a3)
  {
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
  else
  {
    objc_msgSend(v19, "itemBackgroundColorProvider");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v24[2](v24, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "itemBackgroundColorProvider");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v25[2](v25, 8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "itemBackgroundColorProvider");
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v26[2](v26, 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "itemBackgroundColorProvider");
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v27[2](v27, 4, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:forState:", v22, 0);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:forState:", v21, 8);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:forState:", v23, 1);

  -[_UIContextMenuLargeFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:forState:", v20, 4);

}

- (_UIContextMenuCellContentView)contentView
{
  return (_UIContextMenuCellContentView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (NSArray)managedConstraints
{
  return self->_managedConstraints;
}

- (void)setManagedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_managedConstraints, a3);
}

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingContentView, a3);
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (void)setControlState:(unint64_t)a3
{
  self->_controlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
