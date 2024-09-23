@implementation VideosExtrasLockupElementViewController

- (VideosExtrasLockupElementViewController)initWithViewElement:(id)a3
{
  VideosExtrasLockupElementViewController *v3;
  VideosExtrasLockupElementViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VideosExtrasLockupElementViewController;
  v3 = -[VideosExtrasViewElementViewController initWithViewElement:](&v10, sel_initWithViewElement_, a3);
  v4 = v3;
  if (v3)
  {
    -[VideosExtrasViewElementViewController viewElement](v3, "viewElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasLockupElementViewController setTitle:](v4, "setTitle:", v8);

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  VideosExtrasConstrainedArtworkContainerView *v4;
  VideosExtrasConstrainedArtworkContainerView *artworkContainerView;
  void *v6;
  UIView *v7;
  UIView *textContainmentView;
  UILabel *v9;
  UILabel *titleLabel;
  double v11;
  UILabel *v12;
  UILabel *subtitleLabel;
  double v14;
  UILabel *v15;
  UILabel *descriptionLabel;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)VideosExtrasLockupElementViewController;
  -[VideosExtrasViewElementViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[VideosExtrasLockupElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (VideosExtrasConstrainedArtworkContainerView *)-[VideosExtrasConstrainedArtworkContainerView initForAutolayout]([VideosExtrasConstrainedArtworkContainerView alloc], "initForAutolayout");
  artworkContainerView = self->_artworkContainerView;
  self->_artworkContainerView = v4;

  -[VideosExtrasConstrainedArtworkContainerView setUserInteractionEnabled:](self->_artworkContainerView, "setUserInteractionEnabled:", 1);
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  objc_msgSend(v6, "setDimsWhenHighlighted:", 1);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handlePress_);
  objc_msgSend(v28, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v28, "setAllowableMovement:", 1.79769313e308);
  objc_msgSend(v6, "addGestureRecognizer:", v28);
  objc_msgSend(v3, "addSubview:", self->_artworkContainerView);
  v7 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
  textContainmentView = self->_textContainmentView;
  self->_textContainmentView = v7;

  objc_msgSend(v3, "addSubview:", self->_textContainmentView);
  v9 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  LODWORD(v11) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](self->_titleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  -[UIView addSubview:](self->_textContainmentView, "addSubview:", self->_titleLabel);
  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v12;

  LODWORD(v14) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
  -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](self->_subtitleLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  -[UIView addSubview:](self->_textContainmentView, "addSubview:", self->_subtitleLabel);
  v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v15;

  -[UILabel MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:](self->_descriptionLabel, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
  LODWORD(v17) = 1148813312;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  -[UIView addSubview:](self->_textContainmentView, "addSubview:", self->_descriptionLabel);
  v18 = *MEMORY[0x1E0DC49E8];
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v21 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_titleLabel, self->_textContainmentView, 10, *MEMORY[0x1E0DC49E8], v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 4, -1, self->_textContainmentView, 4, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_subtitleLabel, self->_textContainmentView, 10, v18, v19, v20, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_subtitleLabel, 4, -1, self->_textContainmentView, 4, 1.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", self->_descriptionLabel, self->_textContainmentView, 10, v18, v19, v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_descriptionLabel, 4, -1, self->_textContainmentView, 4, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v22);
  objc_msgSend(v3, "addConstraint:", v23);
  objc_msgSend(v3, "addConstraints:", v24);
  objc_msgSend(v3, "addConstraint:", v25);
  objc_msgSend(v3, "addConstraints:", v26);
  objc_msgSend(v3, "addConstraint:", v27);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
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
  objc_super v16;

  v3 = a3;
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasLockupElementViewController _configureTitleLabelForTextElement:](self, "_configureTitleLabelForTextElement:", v6);

  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasLockupElementViewController _configureSubtitleLabelForTextElement:](self, "_configureSubtitleLabelForTextElement:", v8);

  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptionText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasLockupElementViewController _configureDescriptionLabelForTextElement:](self, "_configureDescriptionLabelForTextElement:", v10);

  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasLockupElementViewController;
  -[VideosExtrasElementViewController viewWillAppear:](&v16, sel_viewWillAppear_, v3);
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "overlays");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasLockupElementViewController _configureArtworkViewForImageElement:overlays:](self, "_configureArtworkViewForImageElement:overlays:", v12, v14);

  -[VideosExtrasLockupElementViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bringSubviewToFront:", self->_artworkContainerView);
  objc_msgSend(v15, "bringSubviewToFront:", self->_textContainmentView);
  objc_msgSend(v15, "layoutBelowIfNeeded");

}

- (void)_prepareLayout
{
  void *v3;
  void *v4;
  CGSize *p_artworkSize;
  VideosExtrasConstrainedArtworkContainerView *v6;
  VideosExtrasConstrainedArtworkContainerView *v7;
  VideosExtrasConstrainedArtworkContainerView *v8;
  _BOOL4 v9;
  double v10;
  VideosExtrasConstrainedArtworkContainerView *v11;
  VideosExtrasConstrainedArtworkContainerView *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  NSLayoutConstraint *artworkContainerTopConstraint;
  unint64_t v26;
  void *v27;
  VideosExtrasConstrainedArtworkContainerView *artworkContainerView;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *artworkContainerXConstraint;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *v37;
  void *v38;
  uint64_t v39;
  VideosExtrasConstrainedArtworkContainerView *v40;
  unint64_t v41;
  void *v42;
  VideosExtrasConstrainedArtworkContainerView *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *artworkContainerWidthConstraint;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *artworkContainerHeightConstraint;
  NSLayoutConstraint *v50;
  NSLayoutConstraint *v51;
  NSLayoutConstraint *textLeadingConstraint;
  NSLayoutConstraint *v53;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *textTrailingConstraint;
  VideosExtrasConstrainedArtworkContainerView *v58;
  NSLayoutConstraint *v59;
  NSLayoutConstraint *v60;
  NSLayoutConstraint *v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint *textTopConstraint;
  VideosExtrasConstrainedArtworkContainerView *v64;
  NSLayoutConstraint *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *textBottomConstraint;
  void *v70;
  UIView *textContainmentView;
  void *v72;
  NSLayoutConstraint *v73;
  NSLayoutConstraint *v74;
  NSLayoutConstraint *textHeightConstraint;
  VideosExtrasConstrainedArtworkContainerView *v76;
  NSLayoutConstraint *v77;
  NSLayoutConstraint *v78;
  NSLayoutConstraint *v79;
  NSLayoutConstraint *textCenterYConstraint;
  VideosExtrasConstrainedArtworkContainerView *v81;
  NSLayoutConstraint *v82;
  NSLayoutConstraint *v83;
  NSLayoutConstraint *v84;
  NSLayoutConstraint *v85;
  NSLayoutConstraint *v86;
  NSLayoutConstraint **p_titleVerticalConstraint;
  NSLayoutConstraint *titleVerticalConstraint;
  NSLayoutConstraint *v89;
  NSLayoutConstraint *v90;
  uint64_t v91;
  NSLayoutConstraint *v92;
  NSLayoutConstraint *v93;
  NSLayoutConstraint *v94;
  NSLayoutConstraint *v95;
  id *p_titleLabel;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id *p_textContainmentView;
  id v101;
  MPUContentSizeLayoutConstraint *subtitleBaselineConstraint;
  id v103;
  uint64_t v104;
  MPUContentSizeLayoutConstraint *v105;
  MPUContentSizeLayoutConstraint *v106;
  MPUContentSizeLayoutConstraint *v107;
  MPUContentSizeLayoutConstraint *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  id v114;
  void *v115;
  MPUContentSizeLayoutConstraint *descriptionBaselineConstraint;
  id v117;
  void *v118;
  char v119;
  MPUContentSizeLayoutConstraint *v120;
  MPUContentSizeLayoutConstraint *v121;
  MPUContentSizeLayoutConstraint *v122;
  MPUContentSizeLayoutConstraint *v123;
  uint64_t v124;
  double v125;
  uint64_t v126;
  VideosExtrasConstrainedArtworkContainerView *v127;
  VideosExtrasConstrainedArtworkContainerView *v128;
  VideosExtrasConstrainedArtworkContainerView *v129;
  objc_super v130;

  v130.receiver = self;
  v130.super_class = (Class)VideosExtrasLockupElementViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v130, sel__prepareLayout);
  -[VideosExtrasLockupElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VideosExtrasViewElementViewController embedded](self, "embedded"))
  {
    -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVignetteType:", 3);

  }
  p_artworkSize = &self->_artworkSize;
  self->_artworkSize = (CGSize)*MEMORY[0x1E0C9D820];
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v6 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v7 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue();
  v8 = self->_artworkContainerView;
  if (!-[VideosExtrasElementViewController isWide](self, "isWide"))
  {
    v128 = v6;
    v129 = v8;
    v127 = v7;
    if (-[VideosExtrasElementViewController extrasSize](self, "extrasSize"))
    {
      if (-[VideosExtrasElementViewController extrasSize](self, "extrasSize") != 1)
      {
        if (-[VideosExtrasElementViewController extrasSize](self, "extrasSize") == 2)
          v24 = xmmword_1DA1C1EE0;
        else
          v24 = xmmword_1DA1C1ED0;
        *p_artworkSize = (CGSize)v24;
        v21 = 15.0;
        v19 = -15.0;
        v14 = 25.0;
        v125 = 30.0;
        v15 = 20.0;
        v18 = 0.0;
        v16 = 5;
        v126 = 6;
        v124 = 3;
        v13 = 1;
        v17 = -37.0;
        v20 = 20.0;
        v22 = 25.0;
        goto LABEL_16;
      }
      v23 = xmmword_1DA1C1EF0;
    }
    else
    {
      v23 = xmmword_1DA1C1F00;
    }
    *p_artworkSize = (CGSize)v23;
    v21 = 15.0;
    v19 = -15.0;
    v125 = 30.0;
    v15 = 20.0;
    v18 = 0.0;
    v16 = 5;
    v126 = 6;
    v124 = 3;
    v13 = 1;
    v17 = -32.0;
    v14 = 20.0;
    v20 = 20.0;
    v22 = 20.0;
    goto LABEL_16;
  }
  v9 = -[VideosExtrasViewElementViewController embedded](self, "embedded");
  v10 = 435.0;
  if (v9)
    v10 = 335.0;
  p_artworkSize->width = 550.0;
  self->_artworkSize.height = v10;
  v11 = self->_artworkContainerView;

  v12 = self->_artworkContainerView;
  v128 = v11;
  v129 = 0;
  v13 = 0;
  v14 = 0.0;
  v15 = 25.0;
  v16 = 9;
  v126 = 5;
  v127 = v12;
  v17 = -60.0;
  v18 = 34.0;
  v124 = 4;
  v125 = 40.0;
  v19 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  v22 = 34.0;
LABEL_16:
  artworkContainerTopConstraint = self->_artworkContainerTopConstraint;
  v26 = 0x1E0CB3000;
  if (!artworkContainerTopConstraint)
  {
    v27 = (void *)MEMORY[0x1E0CB3718];
    artworkContainerView = self->_artworkContainerView;
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v29 = v3;
    v30 = v13;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v27;
    v26 = 0x1E0CB3000uLL;
    objc_msgSend(v32, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", artworkContainerView, 3, 0, v31, 3, 1.0, 0.0);
    v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v34 = self->_artworkContainerTopConstraint;
    self->_artworkContainerTopConstraint = v33;

    v13 = v30;
    v3 = v29;
    objc_msgSend(v29, "addConstraint:", self->_artworkContainerTopConstraint);
    artworkContainerTopConstraint = self->_artworkContainerTopConstraint;
  }
  -[NSLayoutConstraint setConstant:](artworkContainerTopConstraint, "setConstant:", v22);
  artworkContainerXConstraint = self->_artworkContainerXConstraint;
  if (!artworkContainerXConstraint)
    goto LABEL_22;
  if (-[NSLayoutConstraint firstAttribute](artworkContainerXConstraint, "firstAttribute") != v16)
  {
    objc_msgSend(v3, "removeConstraint:", self->_artworkContainerXConstraint);
    v36 = self->_artworkContainerXConstraint;
    self->_artworkContainerXConstraint = 0;

  }
  v37 = self->_artworkContainerXConstraint;
  if (!v37)
  {
LABEL_22:
    v38 = *(void **)(v26 + 1816);
    v39 = v13;
    v40 = self->_artworkContainerView;
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v41 = v26;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v40;
    v13 = v39;
    objc_msgSend(v38, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, v16, 0, v42, v16, 1.0, 0.0);
    v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v45 = self->_artworkContainerXConstraint;
    self->_artworkContainerXConstraint = v44;

    v26 = v41;
    p_artworkSize = &self->_artworkSize;
    objc_msgSend(v3, "addConstraint:", self->_artworkContainerXConstraint);
    v37 = self->_artworkContainerXConstraint;
  }
  -[NSLayoutConstraint setConstant:](v37, "setConstant:", v21);
  artworkContainerWidthConstraint = self->_artworkContainerWidthConstraint;
  if (!artworkContainerWidthConstraint)
  {
    objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_artworkContainerView, 7, 0, 0, 0, 1.0, 0.0);
    v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v48 = self->_artworkContainerWidthConstraint;
    self->_artworkContainerWidthConstraint = v47;

    -[VideosExtrasConstrainedArtworkContainerView addConstraint:](self->_artworkContainerView, "addConstraint:", self->_artworkContainerWidthConstraint);
    artworkContainerWidthConstraint = self->_artworkContainerWidthConstraint;
  }
  -[NSLayoutConstraint setConstant:](artworkContainerWidthConstraint, "setConstant:", p_artworkSize->width);
  artworkContainerHeightConstraint = self->_artworkContainerHeightConstraint;
  if (!artworkContainerHeightConstraint)
  {
    objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_artworkContainerView, 8, 0, 0, 0, 1.0, 0.0);
    v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v51 = self->_artworkContainerHeightConstraint;
    self->_artworkContainerHeightConstraint = v50;

    -[VideosExtrasConstrainedArtworkContainerView addConstraint:](self->_artworkContainerView, "addConstraint:", self->_artworkContainerHeightConstraint);
    artworkContainerHeightConstraint = self->_artworkContainerHeightConstraint;
  }
  -[NSLayoutConstraint setConstant:](artworkContainerHeightConstraint, "setConstant:", p_artworkSize->height);
  textLeadingConstraint = self->_textLeadingConstraint;
  if (!textLeadingConstraint)
    goto LABEL_31;
  if (-[NSLayoutConstraint secondAttribute](textLeadingConstraint, "secondAttribute") != v126)
  {
    objc_msgSend(v3, "removeConstraint:", self->_textLeadingConstraint);
    v53 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = 0;

  }
  v54 = self->_textLeadingConstraint;
  if (!v54)
  {
LABEL_31:
    objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textContainmentView, 5, 0, self->_artworkContainerView, v126, 1.0, v20);
    v55 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v56 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = v55;

    objc_msgSend(v3, "addConstraint:", self->_textLeadingConstraint);
    v54 = self->_textLeadingConstraint;
  }
  -[NSLayoutConstraint setConstant:](v54, "setConstant:", v20);
  textTrailingConstraint = self->_textTrailingConstraint;
  if (!textTrailingConstraint)
    goto LABEL_36;
  -[NSLayoutConstraint secondItem](textTrailingConstraint, "secondItem");
  v58 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue();

  if (v58 != v128)
  {
    objc_msgSend(v3, "removeConstraint:", self->_textTrailingConstraint);
    v59 = self->_textTrailingConstraint;
    self->_textTrailingConstraint = 0;

  }
  v60 = self->_textTrailingConstraint;
  if (!v60)
  {
LABEL_36:
    objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textContainmentView, 6, 0, v128, 6, 1.0, v19);
    v61 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v62 = self->_textTrailingConstraint;
    self->_textTrailingConstraint = v61;

    objc_msgSend(v3, "addConstraint:", self->_textTrailingConstraint);
    v60 = self->_textTrailingConstraint;
  }
  -[NSLayoutConstraint setConstant:](v60, "setConstant:", v19);
  textTopConstraint = self->_textTopConstraint;
  if (!textTopConstraint)
    goto LABEL_42;
  if (-[NSLayoutConstraint relation](textTopConstraint, "relation") != v13
    || (-[NSLayoutConstraint secondItem](self->_textTopConstraint, "secondItem"),
        v64 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue(),
        v64,
        v64 != v127))
  {
    objc_msgSend(v3, "removeConstraint:", self->_textTopConstraint);
    v65 = self->_textTopConstraint;
    self->_textTopConstraint = 0;

  }
  v66 = self->_textTopConstraint;
  if (!v66)
  {
LABEL_42:
    objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textContainmentView, 3, v13, v127, v124, 1.0, v14);
    v67 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v68 = self->_textTopConstraint;
    self->_textTopConstraint = v67;

    objc_msgSend(v3, "addConstraint:", self->_textTopConstraint);
    v66 = self->_textTopConstraint;
  }
  -[NSLayoutConstraint setConstant:](v66, "setConstant:", v14);
  textBottomConstraint = self->_textBottomConstraint;
  if (!textBottomConstraint)
  {
    v70 = *(void **)(v26 + 1816);
    textContainmentView = self->_textContainmentView;
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", textContainmentView, 4, -1, v72, 4, 1.0, v17);
    v73 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v74 = self->_textBottomConstraint;
    self->_textBottomConstraint = v73;

    objc_msgSend(v3, "addConstraint:", self->_textBottomConstraint);
    textBottomConstraint = self->_textBottomConstraint;
  }
  -[NSLayoutConstraint setConstant:](textBottomConstraint, "setConstant:", v17);
  textHeightConstraint = self->_textHeightConstraint;
  if (v129)
  {
    if (!textHeightConstraint)
      goto LABEL_50;
    -[NSLayoutConstraint secondItem](self->_textHeightConstraint, "secondItem");
    v76 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue();

    if (v76 != v129)
    {
      objc_msgSend(v3, "removeConstraint:", self->_textHeightConstraint);
      v77 = self->_textHeightConstraint;
      self->_textHeightConstraint = 0;

    }
    if (!self->_textHeightConstraint)
    {
LABEL_50:
      objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textContainmentView, 8, -1, v129, 8, 1.0, 0.0);
      v78 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v79 = self->_textHeightConstraint;
      self->_textHeightConstraint = v78;

      objc_msgSend(v3, "addConstraint:", self->_textHeightConstraint);
    }
    textCenterYConstraint = self->_textCenterYConstraint;
    if (!textCenterYConstraint)
      goto LABEL_55;
    -[NSLayoutConstraint secondItem](textCenterYConstraint, "secondItem");
    v81 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue();

    if (v81 != v129)
    {
      objc_msgSend(v3, "removeConstraint:", self->_textCenterYConstraint);
      v82 = self->_textCenterYConstraint;
      self->_textCenterYConstraint = 0;

    }
    if (!self->_textCenterYConstraint)
    {
LABEL_55:
      objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_textContainmentView, 10, 0, v129, 10, 1.0, 0.0);
      v83 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v84 = self->_textCenterYConstraint;
      self->_textCenterYConstraint = v83;

      objc_msgSend(v3, "addConstraint:", self->_textCenterYConstraint);
    }
  }
  else
  {
    if (textHeightConstraint)
    {
      objc_msgSend(v3, "removeConstraint:");
      v85 = self->_textHeightConstraint;
      self->_textHeightConstraint = 0;

    }
    if (self->_textCenterYConstraint)
    {
      objc_msgSend(v3, "removeConstraint:");
      v86 = self->_textCenterYConstraint;
      self->_textCenterYConstraint = 0;

    }
  }
  p_titleVerticalConstraint = &self->_titleVerticalConstraint;
  titleVerticalConstraint = self->_titleVerticalConstraint;
  if (v18 == 0.0)
  {
    if ((-[NSLayoutConstraint isMemberOfClass:](titleVerticalConstraint, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(v3, "removeConstraint:", *p_titleVerticalConstraint);
      v89 = *p_titleVerticalConstraint;
      *p_titleVerticalConstraint = 0;

    }
    v90 = *p_titleVerticalConstraint;
    if (!*p_titleVerticalConstraint)
    {
      objc_msgSend(*(id *)(v26 + 1816), "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 3, 1, self->_textContainmentView, 3, 1.0, 0.0);
      v91 = objc_claimAutoreleasedReturnValue();
      v92 = *p_titleVerticalConstraint;
      *p_titleVerticalConstraint = (NSLayoutConstraint *)v91;

      objc_msgSend(v3, "addConstraint:", *p_titleVerticalConstraint);
      v90 = *p_titleVerticalConstraint;
    }
    -[NSLayoutConstraint setConstant:](v90, "setConstant:", v18);
  }
  else
  {
    if ((-[NSLayoutConstraint isMemberOfClass:](titleVerticalConstraint, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      objc_msgSend(v3, "removeConstraint:", *p_titleVerticalConstraint);
      v93 = *p_titleVerticalConstraint;
      *p_titleVerticalConstraint = 0;

    }
    v94 = *p_titleVerticalConstraint;
    if (!*p_titleVerticalConstraint)
    {
      objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", self->_titleLabel, self->_textContainmentView, 3, *MEMORY[0x1E0DC4AD0], v18);
      v95 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_titleVerticalConstraint, v95);
      objc_msgSend(v3, "addConstraint:", *p_titleVerticalConstraint);
      v94 = v95;
    }
    -[NSLayoutConstraint setDefaultSizeConstant:](v94, "setDefaultSizeConstant:", v18);

  }
  p_titleLabel = (id *)&self->_titleLabel;
  -[UILabel text](self->_titleLabel, "text");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "length");

  if (v98)
  {
    v99 = 11;
    p_textContainmentView = (id *)&self->_titleLabel;
  }
  else
  {
    p_textContainmentView = (id *)&self->_textContainmentView;
    v99 = 3;
  }
  v101 = *p_textContainmentView;
  subtitleBaselineConstraint = self->_subtitleBaselineConstraint;
  if (subtitleBaselineConstraint)
  {
    -[MPUContentSizeLayoutConstraint secondItem](subtitleBaselineConstraint, "secondItem");
    v103 = (id)objc_claimAutoreleasedReturnValue();
    if (v103 == v101)
    {
      v104 = -[MPUContentSizeLayoutConstraint secondAttribute](self->_subtitleBaselineConstraint, "secondAttribute");

      if (v104 == v99)
        goto LABEL_79;
    }
    else
    {

    }
    objc_msgSend(v3, "removeConstraint:", self->_subtitleBaselineConstraint);
    v105 = self->_subtitleBaselineConstraint;
    self->_subtitleBaselineConstraint = 0;

LABEL_79:
    v106 = self->_subtitleBaselineConstraint;
    if (v106)
      goto LABEL_81;
  }
  objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", self->_subtitleLabel, v101, v99, *MEMORY[0x1E0DC4B10], v15);
  v107 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v108 = self->_subtitleBaselineConstraint;
  self->_subtitleBaselineConstraint = v107;

  objc_msgSend(v3, "addConstraint:", self->_subtitleBaselineConstraint);
  v106 = self->_subtitleBaselineConstraint;
LABEL_81:
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](v106, "setDefaultSizeConstant:", v15);
  -[UILabel text](self->_subtitleLabel, "text");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "length");

  if (v110)
  {
    v111 = 11;
    p_titleLabel = (id *)&self->_subtitleLabel;
  }
  else
  {
    objc_msgSend(*p_titleLabel, "text");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v112, "length");

    if (v113)
    {
      v111 = 11;
    }
    else
    {
      p_titleLabel = (id *)&self->_textContainmentView;
      v111 = 3;
    }
  }
  v114 = *p_titleLabel;
  -[VideosExtrasLockupElementViewController descriptionTextStyle](self, "descriptionTextStyle");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  descriptionBaselineConstraint = self->_descriptionBaselineConstraint;
  if (!descriptionBaselineConstraint)
    goto LABEL_94;
  -[MPUContentSizeLayoutConstraint secondItem](descriptionBaselineConstraint, "secondItem");
  v117 = (id)objc_claimAutoreleasedReturnValue();
  if (v117 != v114
    || -[MPUContentSizeLayoutConstraint secondAttribute](self->_descriptionBaselineConstraint, "secondAttribute") != v111)
  {

    goto LABEL_92;
  }
  -[MPUContentSizeLayoutConstraint textStyle](self->_descriptionBaselineConstraint, "textStyle");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = objc_msgSend(v118, "isEqualToString:", v115);

  if ((v119 & 1) == 0)
  {
LABEL_92:
    objc_msgSend(v3, "removeConstraint:", self->_descriptionBaselineConstraint);
    v120 = self->_descriptionBaselineConstraint;
    self->_descriptionBaselineConstraint = 0;

  }
  v121 = self->_descriptionBaselineConstraint;
  if (!v121)
  {
LABEL_94:
    objc_msgSend(MEMORY[0x1E0D46958], "constraintWithAutoupdatingBaselineOfView:toView:attribute:withTextStyle:nonStandardLeading:", self->_descriptionLabel, v114, v111, v115, v125);
    v122 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v123 = self->_descriptionBaselineConstraint;
    self->_descriptionBaselineConstraint = v122;

    objc_msgSend(v3, "addConstraint:", self->_descriptionBaselineConstraint);
    v121 = self->_descriptionBaselineConstraint;
  }
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](v121, "setDefaultSizeConstant:", v125);

}

- (void)_configureArtworkViewForImageElement:(id)a3 overlays:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "borderColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v33 = objc_retainAutorelease(v13);
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v33, "CGColor"));
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v34 = v9;
    objc_msgSend(v9, "setBorderWidth:", 1.0 / v15);

    objc_msgSend(v6, "placeholderURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageForPlaceholderURL:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaceholderImage:", v16);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v7;
    objc_msgSend(v7, "children");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "resourceImage");
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = (void *)v23;
              -[VideosExtrasConstrainedArtworkContainerView setOverlayImage:](self->_artworkContainerView, "setOverlayImage:", v23);
              -[VideosExtrasConstrainedArtworkContainerView setOverlayScale:](self->_artworkContainerView, "setOverlayScale:", 0.2);

              goto LABEL_16;
            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_16:

    objc_msgSend(v6, "artworkCatalog");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasLockupElementViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "screen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scale");
    v30 = v29;

    objc_msgSend(v25, "setFittingSize:", self->_artworkSize.width, self->_artworkSize.height);
    if (v30 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "scale");
      objc_msgSend(v25, "setDestinationScale:");

    }
    else
    {
      objc_msgSend(v25, "setDestinationScale:", v30);
    }
    objc_msgSend(v25, "setDestination:configurationBlock:", self->_artworkContainerView, &__block_literal_global_61);

    v7 = v35;
  }

}

void __89__VideosExtrasLockupElementViewController__configureArtworkViewForImageElement_overlays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "artworkView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)_configureTitleLabelForTextElement:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0DC1358];
    v5 = *MEMORY[0x1E0DC4AD0];
    v6 = a3;
    objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](self->_titleLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v6, v8, v5);
  }
}

- (void)_configureSubtitleLabelForTextElement:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0DC1358];
    v5 = *MEMORY[0x1E0DC4B10];
    v6 = a3;
    objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v7);

    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](self->_subtitleLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v6, v8, v5);
  }
}

- (void)_configureDescriptionLabelForTextElement:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  UILabel *descriptionLabel;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0DC1358];
    v5 = a3;
    -[VideosExtrasLockupElementViewController descriptionTextStyle](self, "descriptionTextStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v7);

    descriptionLabel = self->_descriptionLabel;
    -[VideosExtrasLockupElementViewController descriptionTextStyle](self, "descriptionTextStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel configureForIKTextElement:fontDescriptor:textStyle:](descriptionLabel, "configureForIKTextElement:fontDescriptor:textStyle:", v5, v10, v9);

  }
}

- (NSString)descriptionTextStyle
{
  unint64_t v2;
  id v3;
  id v4;

  v2 = -[VideosExtrasElementViewController extrasSize](self, "extrasSize");
  v3 = (id)*MEMORY[0x1E0DC4A98];
  if (v2 - 3 <= 1)
  {
    v4 = (id)*MEMORY[0x1E0DC4AB8];

    v3 = v4;
  }
  return (NSString *)v3;
}

- (void)_handlePress:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL8 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  CGPoint v25;
  CGRect v26;

  v24 = a3;
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDisabled");

  v6 = v24;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v24, "state");
    -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v24, "locationInView:", v8);
    v25.x = v17;
    v25.y = v18;
    v26.origin.x = v10;
    v26.origin.y = v12;
    v26.size.width = v14;
    v26.size.height = v16;
    v19 = CGRectContainsPoint(v26, v25);
    v20 = v19;
    switch(v7)
    {
      case 1:
        v21 = v8;
        v20 = 1;
        goto LABEL_8;
      case 2:
        v21 = v8;
LABEL_8:
        objc_msgSend(v21, "setHighlighted:animated:", v20, 1);
        break;
      case 3:
        if (v19)
        {
          -[VideosExtrasViewElementViewController viewElement](self, "viewElement", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);

        }
        goto LABEL_6;
      case 4:
LABEL_6:
        -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainerView, "artworkView", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setHighlighted:animated:", 0, 1);

        break;
      default:
        break;
    }

    v6 = v24;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_textBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_textHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textTopConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerXConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textContainmentView, 0);
  objc_storeStrong((id *)&self->_artworkContainerView, 0);
}

@end
