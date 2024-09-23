@implementation _VideosExtrasGridHeaderView

- (_VideosExtrasGridHeaderView)initWithFrame:(CGRect)a3
{
  _VideosExtrasGridHeaderView *v3;
  _VideosExtrasGridHeaderView *v4;
  uint64_t v5;
  MPUArtworkView *artworkView;
  uint64_t v7;
  UILabel *titleLabel;
  uint64_t v9;
  UILabel *subtitleLabel;
  uint64_t v11;
  UIView *bottomLabelSpacer;
  uint64_t v13;
  NSArray *artworkSizeConstraints;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *textLeadingConstraints;
  void *v24;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)_VideosExtrasGridHeaderView;
  v3 = -[_VideosExtrasGridHeaderView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_VideosExtrasGridHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B3A8]), "initForAutolayout");
    artworkView = v4->_artworkView;
    v4->_artworkView = (MPUArtworkView *)v5;

    -[_VideosExtrasGridHeaderView addSubview:](v4, "addSubview:", v4->_artworkView);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v7;

    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v4->_titleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[_VideosExtrasGridHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v9;

    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v4->_subtitleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[_VideosExtrasGridHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    bottomLabelSpacer = v4->_bottomLabelSpacer;
    v4->_bottomLabelSpacer = (UIView *)v11;

    -[_VideosExtrasGridHeaderView addSubview:](v4, "addSubview:", v4->_bottomLabelSpacer);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsBySizingView:toSize:", v4->_artworkView, 50.0, 50.0);
    v13 = objc_claimAutoreleasedReturnValue();
    artworkSizeConstraints = v4->_artworkSizeConstraints;
    v4->_artworkSizeConstraints = (NSArray *)v13;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_artworkView, 5, 0, v4, 5, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_artworkView, 10, 0, v4, 10, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_titleLabel, 5, 0, v4->_artworkView, 6, 1.0, 15.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_titleLabel, 6, -1, v4, 6, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_subtitleLabel, 5, 0, v4->_artworkView, 6, 1.0, 15.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_subtitleLabel, 6, -1, v4, 6, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_bottomLabelSpacer, 4, 0, v4, 4, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    v27[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v22 = objc_claimAutoreleasedReturnValue();
    textLeadingConstraints = v4->_textLeadingConstraints;
    v4->_textLeadingConstraints = (NSArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObjectsFromArray:", v4->_artworkSizeConstraints);
    objc_msgSend(v24, "addObject:", v15);
    objc_msgSend(v24, "addObject:", v16);
    objc_msgSend(v24, "addObject:", v21);
    objc_msgSend(v24, "addObject:", v17);
    objc_msgSend(v24, "addObject:", v18);
    objc_msgSend(v24, "addObject:", v19);
    objc_msgSend(v24, "addObject:", v20);
    -[_VideosExtrasGridHeaderView addConstraints:](v4, "addConstraints:", v24);

  }
  return v4;
}

- (void)configureForImage:(id)a3 title:(id)a4 subtitle:(id)a5 style:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UILabel *titleLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UILabel *subtitleLabel;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  MPUArtworkView *artworkView;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  uint64_t v45;
  UILabel *v46;
  _VideosExtrasGridHeaderView *v47;
  double v48;
  double v49;
  uint64_t v50;
  MPUContentSizeLayoutConstraint *topLabelConstraint;
  UILabel *v52;
  void *v53;
  void *v54;
  MPUContentSizeLayoutConstraint *v55;
  MPUContentSizeLayoutConstraint *v56;
  MPUContentSizeLayoutConstraint *v57;
  MPUContentSizeLayoutConstraint *v58;
  void *v59;
  void *v60;
  MPUContentSizeLayoutConstraint *subtitleBaselineConstraint;
  _VideosExtrasGridHeaderView *v62;
  uint64_t v63;
  MPUContentSizeLayoutConstraint *v64;
  void *v65;
  UILabel *v66;
  void *v67;
  double v68;
  MPUContentSizeLayoutConstraint *v69;
  MPUContentSizeLayoutConstraint *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  UILabel *v75;
  void *v76;
  void *v77;
  MPUContentSizeLayoutConstraint *bottomLabelSpacerHeight;
  void *v79;
  UIView *bottomLabelSpacer;
  double v81;
  MPUContentSizeLayoutConstraint *v82;
  MPUContentSizeLayoutConstraint *v83;
  void *v84;
  void *v85;
  NSLayoutConstraint *bottomLabelConstraint;
  UILabel *v87;
  void *v88;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *v91;
  NSLayoutConstraint *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  uint64_t v98;
  UILabel *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[5];
  NSLayoutConstraint *v113;
  NSLayoutConstraint *v114;
  MPUContentSizeLayoutConstraint *v115;
  MPUContentSizeLayoutConstraint *v116;
  MPUContentSizeLayoutConstraint *v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v102 = v12;
  if (v11)
  {
    objc_msgSend(v13, "titleColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v15);

    v16 = (void *)MEMORY[0x1E0DC1358];
    objc_msgSend(v14, "titleDefaultFontAttributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fontDescriptorWithFontAttributes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    titleLabel = self->_titleLabel;
    objc_msgSend(v14, "titleTextStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](titleLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v11, v18, v20);

  }
  v100 = v11;
  if (v12)
  {
    objc_msgSend(v14, "subtitleColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v21);

    v22 = (void *)MEMORY[0x1E0DC1358];
    objc_msgSend(v14, "subtitleDefaultFontAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fontDescriptorWithFontAttributes:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    subtitleLabel = self->_subtitleLabel;
    objc_msgSend(v14, "subtitleTextStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](subtitleLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v12, v24, v26);

  }
  v27 = 0.0;
  v28 = 10.0;
  if (v10 && objc_msgSend(v14, "showsImage"))
  {
    objc_msgSend(v10, "placeholderURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageForPlaceholderURL:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUArtworkView setPlaceholderImage:](self->_artworkView, "setPlaceholderImage:", v30);
    objc_msgSend(v10, "artworkCatalog");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 50.0;
    objc_msgSend(v31, "setFittingSize:", 50.0, 50.0);
    artworkView = self->_artworkView;
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __70___VideosExtrasGridHeaderView_configureForImage_title_subtitle_style___block_invoke;
    v112[3] = &unk_1E9F9C480;
    v112[4] = self;
    objc_msgSend(v31, "setDestination:configurationBlock:", artworkView, v112);

    v28 = 15.0;
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v33 = self->_artworkSizeConstraints;
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v109 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "setConstant:", v27);
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
    }
    while (v35);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v38 = self->_textLeadingConstraints;
  v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v105 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "setConstant:", v28);
      }
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
    }
    while (v40);
  }

  -[UILabel attributedText](self->_titleLabel, "attributedText");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v10;
  if (objc_msgSend(v43, "length"))
  {

  }
  else
  {
    -[UILabel text](self->_titleLabel, "text");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (!v45)
    {
      v46 = self->_subtitleLabel;
      v47 = self;
      objc_msgSend(v14, "subtitleLineHeight");
      v49 = v95;
      objc_msgSend(v14, "subtitleTextStyle");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 3;
      goto LABEL_26;
    }
  }
  v46 = self->_titleLabel;
  v47 = self->_titleLabel;
  objc_msgSend(v14, "titleLineHeight");
  v49 = v48;
  objc_msgSend(v14, "titleTextStyle");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 11;
LABEL_26:
  topLabelConstraint = self->_topLabelConstraint;
  if (!topLabelConstraint)
    goto LABEL_30;
  -[MPUContentSizeLayoutConstraint firstItem](topLabelConstraint, "firstItem");
  v52 = (UILabel *)objc_claimAutoreleasedReturnValue();

  if (v52 != v46)
  {
    v53 = (void *)MEMORY[0x1E0CB3718];
    v117 = self->_topLabelConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "deactivateConstraints:", v54);

    v55 = self->_topLabelConstraint;
    self->_topLabelConstraint = 0;

  }
  v56 = self->_topLabelConstraint;
  if (!v56)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", v46, 0, self, 3, v103, 1.0, v49);
    v57 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v58 = self->_topLabelConstraint;
    self->_topLabelConstraint = v57;

    v59 = (void *)MEMORY[0x1E0CB3718];
    v116 = self->_topLabelConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v60);

    v56 = self->_topLabelConstraint;
  }
  v99 = v46;
  -[MPUContentSizeLayoutConstraint setTextStyle:](v56, "setTextStyle:", v103);
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_topLabelConstraint, "setDefaultSizeConstant:", v49);
  subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
  if (subtitleBaselineConstraint)
  {
    -[MPUContentSizeLayoutConstraint secondItem](subtitleBaselineConstraint, "secondItem");
    v62 = (_VideosExtrasGridHeaderView *)objc_claimAutoreleasedReturnValue();
    if (v62 == v47)
    {
      v63 = -[MPUContentSizeLayoutConstraint secondAttribute](self->_subtitleBaselineConstraint, "secondAttribute");

      if (v63 == v50)
        goto LABEL_36;
    }
    else
    {

    }
    -[_VideosExtrasGridHeaderView removeConstraint:](self, "removeConstraint:", self->_subtitleBaselineConstraint);
    v64 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

LABEL_36:
    if (self->_subtitleBaselineConstraint)
      goto LABEL_38;
  }
  v65 = (void *)MEMORY[0x1E0D46958];
  v66 = self->_subtitleLabel;
  objc_msgSend(v14, "subtitleTextStyle");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subtitleLineHeight");
  objc_msgSend(v65, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", v66, 0, v47, v50, v67, 1.0, v68);
  v69 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v70 = self->_subtitleBaselineConstraint;
  self->_subtitleBaselineConstraint = v69;

  -[_VideosExtrasGridHeaderView addConstraint:](self, "addConstraint:", self->_subtitleBaselineConstraint);
LABEL_38:
  objc_msgSend(v14, "subtitleTextStyle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPUContentSizeLayoutConstraint setTextStyle:](self->_subtitleBaselineConstraint, "setTextStyle:", v71);

  objc_msgSend(v14, "subtitleLineHeight");
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_subtitleBaselineConstraint, "setDefaultSizeConstant:");
  -[UILabel attributedText](self->_subtitleLabel, "attributedText");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "length"))
  {

LABEL_41:
    v75 = self->_subtitleLabel;
    objc_msgSend(v14, "subtitleTextStyle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v100;
    goto LABEL_42;
  }
  -[UILabel text](self->_subtitleLabel, "text");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "length");

  if (v74)
    goto LABEL_41;
  -[UILabel attributedText](self->_titleLabel, "attributedText");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v96, "length"))
  {

    v77 = v100;
LABEL_54:
    v75 = self->_titleLabel;
    objc_msgSend(v14, "titleTextStyle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  -[UILabel text](self->_titleLabel, "text");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "length");

  v77 = v100;
  if (v98)
    goto LABEL_54;
  v75 = 0;
  v76 = 0;
LABEL_42:
  bottomLabelSpacerHeight = self->_bottomLabelSpacerHeight;
  if (!bottomLabelSpacerHeight)
  {
    v79 = (void *)MEMORY[0x1E0D46958];
    bottomLabelSpacer = self->_bottomLabelSpacer;
    objc_msgSend(v14, "bottomLabelDescender");
    objc_msgSend(v79, "contentSizeAutoupdatingConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:textStyle:defaultSizeConstant:", bottomLabelSpacer, 8, 0, 0, 0, v76, 1.0, v81);
    v82 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v83 = self->_bottomLabelSpacerHeight;
    self->_bottomLabelSpacerHeight = v82;

    v84 = (void *)MEMORY[0x1E0CB3718];
    v115 = self->_bottomLabelSpacerHeight;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "activateConstraints:", v85);

    bottomLabelSpacerHeight = self->_bottomLabelSpacerHeight;
  }
  -[MPUContentSizeLayoutConstraint setTextStyle:](bottomLabelSpacerHeight, "setTextStyle:", v76);
  objc_msgSend(v14, "bottomLabelDescender");
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_bottomLabelSpacerHeight, "setDefaultSizeConstant:");
  bottomLabelConstraint = self->_bottomLabelConstraint;
  if (!bottomLabelConstraint)
    goto LABEL_48;
  -[NSLayoutConstraint secondItem](bottomLabelConstraint, "secondItem");
  v87 = (UILabel *)objc_claimAutoreleasedReturnValue();

  if (v87 != v75)
  {
    v88 = (void *)MEMORY[0x1E0CB3718];
    v114 = self->_bottomLabelConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "deactivateConstraints:", v89);

    v90 = self->_bottomLabelConstraint;
    self->_bottomLabelConstraint = 0;

  }
  if (!self->_bottomLabelConstraint)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_bottomLabelSpacer, 3, 0, v75, 11, 1.0, 0.0);
    v91 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v92 = self->_bottomLabelConstraint;
    self->_bottomLabelConstraint = v91;

    v93 = (void *)MEMORY[0x1E0CB3718];
    v113 = self->_bottomLabelConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "activateConstraints:", v94);

  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomLabelSpacer, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_bottomLabelSpacerHeight, 0);
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraints, 0);
  objc_storeStrong((id *)&self->_artworkSizeConstraints, 0);
}

@end
