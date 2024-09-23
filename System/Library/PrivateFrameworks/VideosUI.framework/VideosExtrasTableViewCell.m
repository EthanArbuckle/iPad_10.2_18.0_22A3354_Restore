@implementation VideosExtrasTableViewCell

- (VideosExtrasTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VideosExtrasTableViewCell *v4;
  VideosExtrasTableViewCell *v5;
  uint64_t v6;
  VideosExtrasConstrainedArtworkContainerView *artworkContainer;
  void *v8;
  uint64_t v9;
  UIView *textContainerView;
  double v11;
  void *v12;
  uint64_t v13;
  UILabel *titleLabel;
  double v15;
  uint64_t v16;
  UILabel *subtitleLabel;
  double v18;
  void *v19;
  VideosExtrasConstrainedArtworkContainerView *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *artworkWidthConstraint;
  double v24;
  uint64_t v25;
  NSLayoutConstraint *artworkHeightConstraint;
  double v27;
  void *v28;
  UIView *v29;
  void *v30;
  void *v31;
  UIView *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *textTrailingConstraint;
  void *v36;
  void *v37;
  void *v38;
  VideosExtrasConstrainedArtworkContainerView *v39;
  void *v40;
  void *v41;
  void *v42;
  VideosExtrasConstrainedArtworkContainerView *v43;
  void *v44;
  void *v45;
  void *v46;
  UIView *v47;
  void *v48;
  void *v49;
  void *v50;
  UIView *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSArray *topConstraints;
  uint64_t v56;
  NSArray *bottomConstraints;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSLayoutConstraint *minimumHeightConstraint;
  double v70;
  void *v71;
  void *v73;
  void *v74;
  objc_super v75;
  _QWORD v76[4];
  void *v77;
  void *v78;
  _QWORD v79[7];

  v79[5] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)VideosExtrasTableViewCell;
  v4 = -[VideosExtrasTableViewCell initWithStyle:reuseIdentifier:](&v75, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
  {
    -[VideosExtrasTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = -[VideosExtrasConstrainedArtworkContainerView initForAutolayout]([VideosExtrasConstrainedArtworkContainerView alloc], "initForAutolayout");
    artworkContainer = v5->_artworkContainer;
    v5->_artworkContainer = (VideosExtrasConstrainedArtworkContainerView *)v6;

    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5->_artworkContainer);

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    textContainerView = v5->_textContainerView;
    v5->_textContainerView = (UIView *)v9;

    LODWORD(v11) = 1144750080;
    -[UIView setContentHuggingPriority:forAxis:](v5->_textContainerView, "setContentHuggingPriority:forAxis:", 1, v11);
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_textContainerView);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = (UILabel *)v13;

    LODWORD(v15) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v15);
    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v5->_titleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[UIView addSubview:](v5->_textContainerView, "addSubview:", v5->_titleLabel);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = (UILabel *)v16;

    LODWORD(v18) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](v5->_subtitleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    -[UIView addSubview:](v5->_textContainerView, "addSubview:", v5->_subtitleLabel);
    v19 = (void *)MEMORY[0x1E0CB3718];
    v20 = v5->_artworkContainer;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 10, 0, v21, 10, 1.0, 0.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_artworkContainer, 7, 0, 0, 0, 1.0, 0.0);
    v22 = objc_claimAutoreleasedReturnValue();
    artworkWidthConstraint = v5->_artworkWidthConstraint;
    v5->_artworkWidthConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1148829696;
    -[NSLayoutConstraint setPriority:](v5->_artworkWidthConstraint, "setPriority:", v24);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5->_artworkContainer, 8, 0, 0, 0, 1.0, 0.0);
    v25 = objc_claimAutoreleasedReturnValue();
    artworkHeightConstraint = v5->_artworkHeightConstraint;
    v5->_artworkHeightConstraint = (NSLayoutConstraint *)v25;

    LODWORD(v27) = 1148829696;
    -[NSLayoutConstraint setPriority:](v5->_artworkHeightConstraint, "setPriority:", v27);
    v28 = (void *)MEMORY[0x1E0CB3718];
    v29 = v5->_textContainerView;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 10, 0, v30, 10, 1.0, 0.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CB3718];
    v32 = v5->_textContainerView;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 6, 0, v33, 6, 1.0, -15.0);
    v34 = objc_claimAutoreleasedReturnValue();
    textTrailingConstraint = v5->_textTrailingConstraint;
    v5->_textTrailingConstraint = (NSLayoutConstraint *)v34;

    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v74;
    v79[1] = v5->_artworkWidthConstraint;
    v79[2] = v5->_artworkHeightConstraint;
    v79[3] = v73;
    v79[4] = v5->_textTrailingConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addConstraints:", v37);

    v38 = (void *)MEMORY[0x1E0CB3718];
    v39 = v5->_artworkContainer;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 3, 1, v40, 3, 1.0, 15.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)MEMORY[0x1E0CB3718];
    v43 = v5->_artworkContainer;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 4, -1, v44, 4, 1.0, -15.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x1E0CB3718];
    v47 = v5->_textContainerView;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, 3, 1, v48, 3, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)MEMORY[0x1E0CB3718];
    v51 = v5->_textContainerView;
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 4, -1, v52, 4, 1.0, 0.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v54 = objc_claimAutoreleasedReturnValue();
    topConstraints = v5->_topConstraints;
    v5->_topConstraints = (NSArray *)v54;

    v77 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
    v56 = objc_claimAutoreleasedReturnValue();
    bottomConstraints = v5->_bottomConstraints;
    v5->_bottomConstraints = (NSArray *)v56;

    v58 = (void *)MEMORY[0x1E0CB3718];
    v76[0] = v41;
    v76[1] = v45;
    v76[2] = v49;
    v76[3] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v59);

    v60 = *MEMORY[0x1E0DC49E8];
    v61 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v62 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v63 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v5->_titleLabel, v5->_textContainerView, 10, *MEMORY[0x1E0DC49E8], v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v5->_subtitleLabel, v5->_textContainerView, 10, v60, v61, v62, v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v5->_textContainerView, "addConstraints:", v64);
    -[UIView addConstraints:](v5->_textContainerView, "addConstraints:", v65);
    v66 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 8, 1, 0, 0, 1.0, 60.0);
    v68 = objc_claimAutoreleasedReturnValue();
    minimumHeightConstraint = v5->_minimumHeightConstraint;
    v5->_minimumHeightConstraint = (NSLayoutConstraint *)v68;

    LODWORD(v70) = 1148829696;
    -[NSLayoutConstraint setPriority:](v5->_minimumHeightConstraint, "setPriority:", v70);
    -[VideosExtrasTableViewCell contentView](v5, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addConstraint:", v5->_minimumHeightConstraint);

  }
  return v5;
}

- (void)configureForListItemLockupElement:(id)a3 wide:(BOOL)a4
{
  _BOOL4 v4;
  IKListItemLockupElement *v6;
  void *v7;
  double v8;
  double v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int *v22;
  VideosExtrasConstrainedArtworkContainerView *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  id v38;
  UILabel *v39;
  void *v40;
  void *v41;
  double v42;
  NSLayoutConstraint *leadingViewConstraint;
  UILabel *v44;
  void *v45;
  NSLayoutConstraint *v46;
  void *v47;
  void *v48;
  NSLayoutConstraint *v49;
  NSLayoutConstraint *v50;
  void *v51;
  UILabel *v52;
  void *v53;
  NSLayoutConstraint *textLeadingConstraint;
  UILabel **p_titleLabel;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *v57;
  void *v58;
  UILabel *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  UILabel **p_subtitleLabel;
  UILabel *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  UILabel **v76;
  UILabel **v77;
  _BOOL4 v78;
  BOOL v79;
  UILabel *v80;
  UILabel *v81;
  UILabel *v82;
  NSLayoutConstraint **p_topLabelConstraint;
  UILabel *v84;
  void *v85;
  NSLayoutConstraint *v86;
  NSLayoutConstraint *v87;
  void *v88;
  MPUContentSizeLayoutConstraint *v89;
  MPUContentSizeLayoutConstraint *subtitleBaselineConstraint;
  void *v91;
  NSLayoutConstraint **p_bottomLabelConstraint;
  void *v93;
  NSLayoutConstraint *v94;
  NSLayoutConstraint *v95;
  void *v96;
  IKListItemLockupElement *v97;
  UILabel *v98;
  UILabel *v99;
  UILabel *v100;
  void *v101;
  MPUContentSizeLayoutConstraint *v102;
  NSLayoutConstraint *topLabelConstraint;
  UILabel *v104;
  int v105;
  void *v106;
  NSLayoutConstraint *v107;
  NSLayoutConstraint *v108;
  NSLayoutConstraint *v109;
  void *v110;
  NSLayoutConstraint *bottomLabelConstraint;
  UILabel *v112;
  void *v113;
  NSLayoutConstraint *v114;
  NSLayoutConstraint *v115;
  NSLayoutConstraint *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  UILabel *v121;
  UILabel *v122;
  UILabel *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  IKListItemLockupElement *v128;
  _QWORD v129[4];
  IKListItemLockupElement *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v4 = a4;
  v141 = *MEMORY[0x1E0C80C00];
  v6 = (IKListItemLockupElement *)a3;
  self->_element = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v7);

  v8 = 60.0;
  if (v4)
  {
    v8 = 78.0;
    v9 = 15.0;
  }
  else
  {
    v9 = 10.0;
  }
  -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_textTrailingConstraint, "setConstant:", -v9);
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v10 = self->_topConstraints;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v135, v140, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v136 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "setConstant:", v9);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v135, v140, 16);
    }
    while (v12);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v15 = self->_bottomConstraints;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v132;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v132 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * j), "setConstant:", -v9);
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v131, v139, 16);
    }
    while (v17);
  }

  -[IKListItemLockupElement images](v6, "images");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = &OBJC_IVAR___VUIDownloadCollectionViewController__gridType;
  v128 = v6;
  if (v21)
  {
    v23 = self->_artworkContainer;
    -[IKListItemLockupElement decorationLabel](v6, "decorationLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v25 = 48.0;
    else
      v25 = 40.0;
    v26 = 71.0;
    if (v4)
      v26 = 86.0;
    if (v24)
      v27 = v26;
    else
      v27 = v25;
    -[NSLayoutConstraint setConstant:](self->_artworkWidthConstraint, "setConstant:", v27);
    -[NSLayoutConstraint setConstant:](self->_artworkHeightConstraint, "setConstant:", v25);
    objc_msgSend(v21, "placeholderURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageForPlaceholderURL:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainer, "artworkView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPlaceholderImage:", v29);
    objc_msgSend(v21, "artworkCatalog");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFittingSize:", v27, v25);
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __68__VideosExtrasTableViewCell_configureForListItemLockupElement_wide___block_invoke;
    v129[3] = &unk_1E9FA4598;
    v130 = v6;
    objc_msgSend(v31, "setDestination:configurationBlock:", self, v129);
    objc_msgSend(v30, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "setBorderColor:", objc_msgSend(v33, "CGColor"));

    objc_msgSend(v30, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scale");
    objc_msgSend(v34, "setBorderWidth:", 1.0 / v36);

    objc_msgSend(v30, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v37, "setShadowColor:", objc_msgSend(v38, "CGColor"));

    v39 = (UILabel *)v23;
    objc_msgSend(v30, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShadowRadius:", 2.0);

    objc_msgSend(v30, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = 0.5;
    objc_msgSend(v41, "setShadowOpacity:", v42);

    v22 = &OBJC_IVAR___VUIDownloadCollectionViewController__gridType;
  }
  else
  {
    v39 = self->_textContainerView;
    -[NSLayoutConstraint setConstant:](self->_artworkWidthConstraint, "setConstant:", 0.0);
    -[NSLayoutConstraint setConstant:](self->_artworkHeightConstraint, "setConstant:", 0.0);
  }
  leadingViewConstraint = self->_leadingViewConstraint;
  if (!leadingViewConstraint)
    goto LABEL_33;
  -[NSLayoutConstraint firstItem](leadingViewConstraint, "firstItem");
  v44 = (UILabel *)objc_claimAutoreleasedReturnValue();

  if (v44 != v39)
  {
    -[VideosExtrasTableViewCell contentView](self, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeConstraint:", self->_leadingViewConstraint);

    v46 = self->_leadingViewConstraint;
    self->_leadingViewConstraint = 0;

  }
  if (!self->_leadingViewConstraint)
  {
LABEL_33:
    v47 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasTableViewCell contentView](self, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 5, 0, v48, 5, 1.0, 15.0);
    v49 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v50 = self->_leadingViewConstraint;
    self->_leadingViewConstraint = v49;

    -[VideosExtrasTableViewCell contentView](self, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addConstraint:", self->_leadingViewConstraint);

  }
  v126 = v22[977];
  v52 = *(UILabel **)((char *)&self->super.super.super.super.isa + v126);
  if (v39 == v52 && v52)
  {
    -[VideosExtrasTableViewCell contentView](self, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "removeConstraint:", self->_textLeadingConstraint);

    textLeadingConstraint = self->_textLeadingConstraint;
    self->_textLeadingConstraint = 0;

  }
  p_titleLabel = &self->_titleLabel;
  if (v39 != self->_titleLabel && !self->_textLeadingConstraint)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(Class *)((char *)&self->super.super.super.super.isa + v126), 5, 0, self->_artworkContainer, 6, 1.0, 0.0);
    v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v57 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = v56;

    -[VideosExtrasTableViewCell contentView](self, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addConstraint:", self->_textLeadingConstraint);

  }
  v125 = v21;
  v123 = v39;
  -[NSLayoutConstraint setConstant:](self->_textLeadingConstraint, "setConstant:", v9);
  v59 = *p_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v59, "setBackgroundColor:", v60);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v59, "setTextColor:", v61);

  -[IKListItemLockupElement title](v128, "title");
  v62 = objc_claimAutoreleasedReturnValue();
  v63 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](v59, "configureForIKTextElement:fontDescriptor:textStyle:", v62, v64, v63);
  v127 = (void *)v62;
  v122 = v59;
  p_subtitleLabel = &self->_subtitleLabel;
  v66 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v66, "setBackgroundColor:", v67);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v66, "setTextColor:", v68);

  -[IKListItemLockupElement subtitle](v128, "subtitle");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = *MEMORY[0x1E0DC4AA0];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v71 = objc_claimAutoreleasedReturnValue();

  if (v69)
    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](v66, "configureForIKTextElement:fontDescriptor:textStyle:", v69, v71, v70);
  v124 = (void *)v71;
  v121 = v66;
  objc_msgSend(v127, "text");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "length");

  objc_msgSend(v69, "text");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "length");

  if (v73)
  {
    v76 = &self->_titleLabel;
    v77 = &self->_subtitleLabel;
    if (v75)
      goto LABEL_56;
  }
  v78 = v75 != 0;
  if (v73)
  {
    v76 = &self->_titleLabel;
    v77 = &self->_titleLabel;
    if (!v75)
      goto LABEL_56;
  }
  if (v73)
    v78 = 1;
  v76 = &self->_titleLabel;
  v77 = &self->_titleLabel;
  if (!v78 || (!v75 ? (v79 = 1) : (v79 = v73 != 0), v76 = &self->_subtitleLabel, v77 = &self->_subtitleLabel, !v79))
  {
LABEL_56:
    v81 = *v76;
    v82 = *v77;
    if (v81 != v82)
    {
      v80 = v82;
      p_topLabelConstraint = &self->_topLabelConstraint;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (-[NSLayoutConstraint firstItem](*p_topLabelConstraint, "firstItem"),
            v84 = (UILabel *)objc_claimAutoreleasedReturnValue(),
            v84,
            v84 != v81))
      {
        -[VideosExtrasTableViewCell contentView](self, "contentView");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "removeConstraint:", *p_topLabelConstraint);

        v86 = *p_topLabelConstraint;
        *p_topLabelConstraint = 0;

      }
      v87 = *p_topLabelConstraint;
      if (!v87)
      {
        objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", *p_titleLabel, 0, *(Class *)((char *)&self->super.super.super.super.isa + v126), 3, v63, 1.0, 28.0);
        v87 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_topLabelConstraint, v87);
        -[VideosExtrasTableViewCell contentView](self, "contentView");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addConstraint:", v87);

      }
      if (!self->_subtitleBaselineConstraint)
      {
        objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", *p_subtitleLabel, 0, *p_titleLabel, 11, v70, 1.0, 19.0);
        v89 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
        self->_subtitleBaselineConstraint = v89;

        -[VideosExtrasTableViewCell contentView](self, "contentView");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "addConstraint:", self->_subtitleBaselineConstraint);

      }
      p_bottomLabelConstraint = &self->_bottomLabelConstraint;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[VideosExtrasTableViewCell contentView](self, "contentView");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "removeConstraint:", *p_bottomLabelConstraint);

        v94 = *p_bottomLabelConstraint;
        *p_bottomLabelConstraint = 0;

      }
      v95 = *p_bottomLabelConstraint;
      if (!v95)
      {
        objc_msgSend(MEMORY[0x1E0D46958], "contentSizeAutoupdatingConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:textStyle:defaultSizeConstant:", *(Class *)((char *)&self->super.super.super.super.isa + v126), 4, 0, *p_subtitleLabel, 11, v70, 1.0, 14.0);
        v95 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_bottomLabelConstraint, v95);
        -[VideosExtrasTableViewCell contentView](self, "contentView");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "addConstraint:", v95);

      }
      v97 = v128;
      v99 = v122;
      v98 = v123;
      v100 = v121;
      goto LABEL_85;
    }
    v120 = v69;
    v80 = v81;
  }
  else
  {
    v120 = v69;
    v80 = 0;
  }
  v97 = v128;
  v99 = v122;
  v98 = v123;
  v100 = v121;
  if (self->_subtitleBaselineConstraint)
  {
    -[VideosExtrasTableViewCell contentView](self, "contentView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "removeConstraint:", self->_subtitleBaselineConstraint);

    v102 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

  }
  topLabelConstraint = self->_topLabelConstraint;
  if (topLabelConstraint)
  {
    -[NSLayoutConstraint firstItem](topLabelConstraint, "firstItem");
    v104 = (UILabel *)objc_claimAutoreleasedReturnValue();
    if (v104 == v80)
    {
      v105 = -[NSLayoutConstraint isMemberOfClass:](self->_topLabelConstraint, "isMemberOfClass:", objc_opt_class());

      if (!v105)
        goto LABEL_77;
    }
    else
    {

    }
    -[VideosExtrasTableViewCell contentView](self, "contentView", v120);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "removeConstraint:", self->_topLabelConstraint);

    v107 = self->_topLabelConstraint;
    self->_topLabelConstraint = 0;

LABEL_77:
    if (self->_topLabelConstraint)
      goto LABEL_79;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v80, 10, 0, *(Class *)((char *)&self->super.super.super.super.isa + v126), 10, 1.0, 0.0, v120);
  v108 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v109 = self->_topLabelConstraint;
  self->_topLabelConstraint = v108;

  -[VideosExtrasTableViewCell contentView](self, "contentView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "addConstraint:", self->_topLabelConstraint);

LABEL_79:
  bottomLabelConstraint = self->_bottomLabelConstraint;
  if (bottomLabelConstraint)
  {
    -[NSLayoutConstraint secondItem](bottomLabelConstraint, "secondItem");
    v112 = (UILabel *)objc_claimAutoreleasedReturnValue();

    if (v112 != v80)
    {
      -[VideosExtrasTableViewCell contentView](self, "contentView");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "removeConstraint:", self->_bottomLabelConstraint);

      v114 = self->_bottomLabelConstraint;
      self->_bottomLabelConstraint = 0;

    }
    if (self->_bottomLabelConstraint)
    {
      v81 = v80;
      v69 = v120;
      goto LABEL_86;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(Class *)((char *)&self->super.super.super.super.isa + v126), 4, 0, v80, 4, 1.0, 0.0, v120);
  v115 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v116 = self->_bottomLabelConstraint;
  self->_bottomLabelConstraint = v115;

  -[VideosExtrasTableViewCell contentView](self, "contentView");
  v87 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  -[NSLayoutConstraint addConstraint:](v87, "addConstraint:", self->_bottomLabelConstraint);
  v81 = v80;
  v69 = v120;
LABEL_85:

LABEL_86:
  -[VideosExtrasTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints", v120);
  -[IKListItemLockupElement decorationImages](v97, "decorationImages");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "firstObject");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  if (v118)
  {
    -[VideosExtrasTableViewCell setAccessoryType:](self, "setAccessoryType:", objc_msgSend(v118, "accessoryType"));
  }
  else
  {
    -[IKListItemLockupElement checkMark](v97, "checkMark");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (v119)
      -[VideosExtrasTableViewCell setAccessoryType:](self, "setAccessoryType:", 3);

  }
}

void __68__VideosExtrasTableViewCell_configureForListItemLockupElement_wide___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v10, "element");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && *(_QWORD *)(a1 + 32) == v6)
  {
    objc_msgSend(v10, "artworkContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artworkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v5);

  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasTableViewCell;
  -[VideosExtrasTableViewCell setHighlighted:animated:](&v9, sel_setHighlighted_animated_, a3, a4);
  if ((-[VideosExtrasTableViewCell isSelected](self, "isSelected") & 1) == 0)
  {
    if (a3)
    {
      v6 = 0.15;
      v7 = 1.0;
    }
    else
    {
      v7 = 0.0;
      v6 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v8);

  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasTableViewCell;
  -[VideosExtrasTableViewCell setSelected:animated:](&v9, sel_setSelected_animated_, a3, a4);
  if (a3)
  {
    v6 = 0.15;
    v7 = 1.0;
  }
  else
  {
    v7 = 0.0;
    v6 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v8);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasTableViewCell;
  -[VideosExtrasTableViewCell prepareForReuse](&v8, sel_prepareForReuse);
  -[VideosExtrasTableViewCell setElement:](self, "setElement:", 0);
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainer, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholderImage:", 0);
  objc_msgSend(v3, "setImage:", 0);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", 0.0);

  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowRadius:", 0.0);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setShadowOpacity:", v7);

  -[VideosExtrasTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (VideosExtrasConstrainedArtworkContainerView)artworkContainerView
{
  return self->_artworkContainer;
}

- (IKListItemLockupElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  self->_element = (IKListItemLockupElement *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelConstraint, 0);
  objc_storeStrong((id *)&self->_textTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_artworkHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textSpacerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkSpacerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingViewConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraints, 0);
  objc_storeStrong((id *)&self->_topConstraints, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_artworkContainer, 0);
}

@end
