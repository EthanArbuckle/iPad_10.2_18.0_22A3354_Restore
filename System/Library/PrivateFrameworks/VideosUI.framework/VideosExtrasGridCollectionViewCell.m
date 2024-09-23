@implementation VideosExtrasGridCollectionViewCell

- (VideosExtrasGridCollectionViewCell)initWithFrame:(CGRect)a3
{
  VideosExtrasGridCollectionViewCell *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  VideosExtrasConstrainedArtworkContainerView *artworkContainer;
  uint64_t v15;
  NSLayoutConstraint *artworkContainerWidthConstraint;
  uint64_t v17;
  NSLayoutConstraint *artworkContainerHeightConstraint;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  VideosExtrasConstrainedArtworkContainerView *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  UIView *spacerView;
  void *v43;
  void *v44;
  UIView *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v50;
  _QWORD v51[3];

  v51[2] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)VideosExtrasGridCollectionViewCell;
  v3 = -[VideosExtrasGridCollectionViewCell initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    objc_msgSend(v5, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(v5, "setTextAlignment:", 1);
    LODWORD(v7) = 1144750080;
    objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v7);
    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v5);

    -[VideosExtrasGridCollectionViewCell setTitleLabel:](v3, "setTitleLabel:", v5);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initForAutolayout");
    objc_msgSend(v9, "MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(v9, "setTextAlignment:", 1);
    LODWORD(v11) = 1144733696;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v11);
    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v9);

    -[VideosExtrasGridCollectionViewCell setSubtitleLabel:](v3, "setSubtitleLabel:", v9);
    v13 = -[VideosExtrasConstrainedArtworkContainerView initForAutolayout]([VideosExtrasConstrainedArtworkContainerView alloc], "initForAutolayout");
    artworkContainer = v3->_artworkContainer;
    v3->_artworkContainer = (VideosExtrasConstrainedArtworkContainerView *)v13;

    -[VideosExtrasConstrainedArtworkContainerView setClipsToBounds:](v3->_artworkContainer, "setClipsToBounds:", 1);
    -[VideosExtrasConstrainedArtworkContainerView setShouldBottomAlignArtwork:](v3->_artworkContainer, "setShouldBottomAlignArtwork:", 1);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainer, 7, 0, 0, 0, 1.0, 0.0);
    v15 = objc_claimAutoreleasedReturnValue();
    artworkContainerWidthConstraint = v3->_artworkContainerWidthConstraint;
    v3->_artworkContainerWidthConstraint = (NSLayoutConstraint *)v15;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_artworkContainer, 8, 0, 0, 0, 1.0, 0.0);
    v17 = objc_claimAutoreleasedReturnValue();
    artworkContainerHeightConstraint = v3->_artworkContainerHeightConstraint;
    v3->_artworkContainerHeightConstraint = (NSLayoutConstraint *)v17;

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v3->_artworkContainer);

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v3->_artworkContainerWidthConstraint;
    v51[1] = v3->_artworkContainerHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addConstraints:", v21);

    -[VideosExtrasConstrainedArtworkContainerView artworkView](v3->_artworkContainer, "artworkView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDimsWhenHighlighted:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v23);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0DC49E8];
    v27 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v28 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v29 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(v24, "constraintsByAttachingView:toView:alongEdges:insets:", v5, v25, 10, *MEMORY[0x1E0DC49E8], v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0CB3718];
    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintsByAttachingView:toView:alongEdges:insets:", v9, v32, 10, v26, v27, v28, v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addConstraints:", v30);

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addConstraints:", v33);

    v36 = (void *)MEMORY[0x1E0CB3718];
    v37 = v3->_artworkContainer;
    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintsByAttachingView:toView:alongEdges:insets:", v37, v38, 11, v26, v27, v28, v29);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addConstraints:", v39);

    v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initForAutolayout");
    spacerView = v3->_spacerView;
    v3->_spacerView = (UIView *)v41;

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v3->_spacerView);

    v44 = (void *)MEMORY[0x1E0CB3718];
    v45 = v3->_spacerView;
    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 4, 0, v46, 4, 1.0, 0.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[VideosExtrasGridCollectionViewCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addConstraint:", v47);

  }
  return v3;
}

- (void)configureForLockup:(id)a3 cellStyle:(id)a4 withSizing:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  id v72;
  BOOL v73;
  void *v74;
  MPUContentSizeLayoutConstraint *topLineHeight;
  void *v76;
  MPUContentSizeLayoutConstraint *subtitleLineHeight;
  NSLayoutConstraint *spacerTop;
  VideosExtrasConstrainedArtworkContainerView *v79;
  VideosExtrasConstrainedArtworkContainerView *artworkContainer;
  void *v81;
  NSLayoutConstraint *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  NSLayoutConstraint *v90;
  NSLayoutConstraint *v91;
  void *v92;
  void *v93;
  NSLayoutConstraint *spacerHeight;
  NSLayoutConstraint *v95;
  NSLayoutConstraint *v96;
  NSLayoutConstraint *v97;
  void *v98;
  MPUContentSizeLayoutConstraint *v99;
  void *v100;
  void *v101;
  MPUContentSizeLayoutConstraint *v102;
  MPUContentSizeLayoutConstraint *v103;
  void *v104;
  VideosExtrasConstrainedArtworkContainerView *v105;
  double v106;
  MPUContentSizeLayoutConstraint *v107;
  MPUContentSizeLayoutConstraint *v108;
  void *v109;
  MPUContentSizeLayoutConstraint *v110;
  void *v111;
  void *v112;
  MPUContentSizeLayoutConstraint *v113;
  MPUContentSizeLayoutConstraint *v114;
  void *v115;
  double v116;
  MPUContentSizeLayoutConstraint *v117;
  MPUContentSizeLayoutConstraint *v118;
  void *v119;
  void *v120;
  MPUContentSizeLayoutConstraint *v121;
  NSLayoutConstraint **p_spacerHeight;
  void *v123;
  NSLayoutConstraint *v124;
  NSLayoutConstraint *v125;
  void *v126;
  UIView *spacerView;
  double v128;
  void *v129;
  NSLayoutConstraint *v130;
  void *v131;
  void *v132;
  NSLayoutConstraint *v133;
  NSLayoutConstraint *v134;
  NSLayoutConstraint *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  _QWORD v144[4];
  id v145;
  VideosExtrasGridCollectionViewCell *v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[VideosExtrasGridCollectionViewCell setLockupElement:](self, "setLockupElement:", v7);
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v7;
  objc_msgSend(v7, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v9;
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v141 = v10;
  objc_msgSend(v10, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v12)
  {
    objc_msgSend(v8, "titleTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

    v17 = (void *)MEMORY[0x1E0DC1358];
    objc_msgSend(v8, "titleDefaultFontAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fontDescriptorWithFontAttributes:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v142, "alignment");
    -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleTextStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configureForIKTextElement:fontDescriptor:textStyle:", v142, v19, v22);

    -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "numberOfLines");

    if (v24 >= 3)
    {
      -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setNumberOfLines:", 2);

    }
    if (!v20)
    {
      v26 = objc_msgSend(v8, "defaultTextAlignment");
      -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTextAlignment:", v26);

    }
  }
  if (v14)
  {
    objc_msgSend(v8, "subtitleTextColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextColor:", v28);

    v30 = (void *)MEMORY[0x1E0DC1358];
    objc_msgSend(v8, "subtitleDefaultFontAttributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fontDescriptorWithFontAttributes:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v10, "alignment");
    -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtitleTextStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "configureForIKTextElement:fontDescriptor:textStyle:", v10, v32, v35);

    -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "numberOfLines");

    if (v37 >= 3)
    {
      -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setNumberOfLines:", 2);

    }
    if (!v33)
    {
      v39 = objc_msgSend(v8, "defaultTextAlignment");
      -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setTextAlignment:", v39);

    }
  }
  objc_msgSend(v8, "imageSize");
  v42 = v41;
  v44 = v43;
  -[NSLayoutConstraint setConstant:](self->_artworkContainerWidthConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_artworkContainerHeightConstraint, "setConstant:", v44);
  objc_msgSend(v143, "image");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 && !a5)
  {
    objc_msgSend(v143, "overlays");
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "children");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v148, v152, 16);
    v140 = v12;
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v149;
LABEL_17:
      v50 = 0;
      while (1)
      {
        if (*(_QWORD *)v149 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * v50);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v48 == ++v50)
        {
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v148, v152, 16);
          if (v48)
            goto LABEL_17;
          goto LABEL_26;
        }
      }
      objc_msgSend(v51, "resourceImage");
      v52 = objc_claimAutoreleasedReturnValue();

      if (!v52)
        goto LABEL_27;
      -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setOverlayImage:", v52);

      -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setOverlayScale:", 0.3);

      v46 = (void *)v52;
    }
LABEL_26:

LABEL_27:
    objc_msgSend(v45, "placeholderURL");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageForPlaceholderURL:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "artworkView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setPlaceholderImage:", v56);

    objc_msgSend(v45, "borderColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    v61 = v45;
    if (v59)
    {
      v62 = v59;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.2, 1.0);
      v62 = (id)objc_claimAutoreleasedReturnValue();
    }
    v63 = v62;

    -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_retainAutorelease(v63);
    objc_msgSend(v65, "setBorderColor:", objc_msgSend(v66, "CGColor"));

    -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "layer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "scale");
    objc_msgSend(v68, "setBorderWidth:", 1.0 / v70);

    v45 = v61;
    objc_msgSend(v61, "artworkCatalog");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setFittingSize:", v42, v44);
    v144[0] = MEMORY[0x1E0C809B0];
    v144[1] = 3221225472;
    v144[2] = __78__VideosExtrasGridCollectionViewCell_configureForLockup_cellStyle_withSizing___block_invoke;
    v144[3] = &unk_1E9FA1410;
    v145 = v143;
    v146 = self;
    v147 = v66;
    v72 = v66;
    objc_msgSend(v71, "setDestination:configurationBlock:", self, v144);

    v12 = v140;
  }
  v73 = v14 != 0;
  if (!(v12 | v14))
  {
    if (self->_topLineHeight)
    {
      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "removeConstraint:", self->_topLineHeight);

      topLineHeight = self->_topLineHeight;
      self->_topLineHeight = 0;

    }
    if (self->_subtitleLineHeight)
    {
      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "removeConstraint:", self->_subtitleLineHeight);

      subtitleLineHeight = self->_subtitleLineHeight;
      self->_subtitleLineHeight = 0;

    }
    spacerTop = self->_spacerTop;
    if (!spacerTop)
      goto LABEL_51;
    -[NSLayoutConstraint secondItem](spacerTop, "secondItem");
    v79 = (VideosExtrasConstrainedArtworkContainerView *)objc_claimAutoreleasedReturnValue();
    artworkContainer = self->_artworkContainer;

    if (v79 != artworkContainer)
    {
      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "removeConstraint:", self->_spacerTop);

      v82 = self->_spacerTop;
      self->_spacerTop = 0;

    }
    if (!self->_spacerTop)
    {
LABEL_51:
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spacerView, 3, 0, self->_artworkContainer, 4, 1.0, 0.0);
      v90 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v91 = self->_spacerTop;
      self->_spacerTop = v90;

      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "addConstraint:", self->_spacerTop);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "removeConstraint:", self->_spacerHeight);

      spacerHeight = self->_spacerHeight;
      self->_spacerHeight = 0;

    }
    v95 = self->_spacerHeight;
    if (!v95)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spacerView, 8, 0, 0, 0, 1.0, 0.0);
      v96 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v97 = self->_spacerHeight;
      self->_spacerHeight = v96;

      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "addConstraint:", self->_spacerHeight);

      v95 = self->_spacerHeight;
    }
    -[NSLayoutConstraint setConstant:](v95, "setConstant:", 10.0);
    goto LABEL_83;
  }
  v138 = v45;
  if (!v12 || !v14)
  {
    if (!v12)
      v73 = 1;
    if (!v73)
    {
      -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleTextStyle");
      v14 = objc_claimAutoreleasedReturnValue();
      -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "titleTextStyle");
      v88 = objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
    if (v12)
    {
      v85 = 0;
      v14 = 0;
    }
    else
    {
      if (v14)
      {
        -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "subtitleTextStyle");
        v86 = objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
      v85 = 0;
    }
    v87 = 0;
    v89 = 0;
    goto LABEL_59;
  }
  -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setNumberOfLines:", 1);

  -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setNumberOfLines:", 1);

  -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleTextStyle");
  v86 = objc_claimAutoreleasedReturnValue();
LABEL_44:
  v14 = v86;
  -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitleTextStyle");
  v88 = objc_claimAutoreleasedReturnValue();
LABEL_58:
  v89 = (void *)v88;
LABEL_59:
  v99 = self->_topLineHeight;
  if (!v99)
    goto LABEL_63;
  -[MPUContentSizeLayoutConstraint firstItem](v99, "firstItem");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100 != v85)
  {
    -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "removeConstraint:", self->_topLineHeight);

    v102 = self->_topLineHeight;
    self->_topLineHeight = 0;

  }
  v103 = self->_topLineHeight;
  if (!v103)
  {
LABEL_63:
    v104 = (void *)MEMORY[0x1E0D46958];
    v105 = self->_artworkContainer;
    objc_msgSend(v8, "titleFirstBaselineHeight");
    objc_msgSend(v104, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", v85, 0, v105, 4, v14, 1.0, v106);
    v107 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v108 = self->_topLineHeight;
    self->_topLineHeight = v107;

    -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addConstraint:", self->_topLineHeight);

    v103 = self->_topLineHeight;
  }
  -[MPUContentSizeLayoutConstraint setTextStyle:](v103, "setTextStyle:", v14);
  objc_msgSend(v8, "titleFirstBaselineHeight");
  -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_topLineHeight, "setDefaultSizeConstant:");
  v110 = self->_subtitleLineHeight;
  if (v85 == v87)
  {
    if (v110)
    {
      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "removeConstraint:", self->_subtitleLineHeight);

      v121 = self->_subtitleLineHeight;
      self->_subtitleLineHeight = 0;

    }
  }
  else
  {
    if (!v110)
      goto LABEL_69;
    -[MPUContentSizeLayoutConstraint firstItem](v110, "firstItem");
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    if (v111 != v87)
    {
      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "removeConstraint:", self->_subtitleLineHeight);

      v113 = self->_subtitleLineHeight;
      self->_subtitleLineHeight = 0;

    }
    v114 = self->_subtitleLineHeight;
    if (!v114)
    {
LABEL_69:
      v115 = (void *)MEMORY[0x1E0D46958];
      objc_msgSend(v8, "subtitleFirstBaselineHeight");
      objc_msgSend(v115, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", v87, 0, v85, 11, v89, 1.0, v116);
      v117 = (MPUContentSizeLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v118 = self->_subtitleLineHeight;
      self->_subtitleLineHeight = v117;

      -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "addConstraint:", self->_subtitleLineHeight);

      v114 = self->_subtitleLineHeight;
    }
    -[MPUContentSizeLayoutConstraint setTextStyle:](v114, "setTextStyle:", v89);
    objc_msgSend(v8, "subtitleFirstBaselineHeight");
    -[MPUContentSizeLayoutConstraint setDefaultSizeConstant:](self->_subtitleLineHeight, "setDefaultSizeConstant:");
  }
  p_spacerHeight = &self->_spacerHeight;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "removeConstraint:", *p_spacerHeight);

    v124 = *p_spacerHeight;
    *p_spacerHeight = 0;

  }
  v125 = *p_spacerHeight;
  if (!v125)
  {
    v126 = (void *)MEMORY[0x1E0D46958];
    spacerView = self->_spacerView;
    objc_msgSend(v8, "textFirstBaselineToBottom");
    objc_msgSend(v126, "contentSizeAutoupdatingConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:textStyle:defaultSizeConstant:", spacerView, 8, 0, 0, 0, v14, 1.0, v128);
    v125 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_spacerHeight, v125);
    -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "addConstraint:", *p_spacerHeight);

  }
  -[NSLayoutConstraint setTextStyle:](v125, "setTextStyle:", v14);
  objc_msgSend(v8, "textFirstBaselineToBottom");
  -[NSLayoutConstraint setDefaultSizeConstant:](v125, "setDefaultSizeConstant:");
  v130 = self->_spacerTop;
  if (!v130)
    goto LABEL_81;
  -[NSLayoutConstraint secondItem](v130, "secondItem");
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  if (v131 != v85)
  {
    -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "removeConstraint:", self->_spacerTop);

    v133 = self->_spacerTop;
    self->_spacerTop = 0;

  }
  if (!self->_spacerTop)
  {
LABEL_81:
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spacerView, 3, 0, v85, 12, 1.0, 0.0);
    v134 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v135 = self->_spacerTop;
    self->_spacerTop = v134;

    -[VideosExtrasGridCollectionViewCell contentView](self, "contentView");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "addConstraint:", self->_spacerTop);

  }
  v45 = v138;
LABEL_83:

}

void __78__VideosExtrasGridCollectionViewCell_configureForLockup_cellStyle_withSizing___block_invoke(void **a1, void *a2, void *a3)
{
  id v5;
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
  double v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  objc_msgSend(v19, "lockupElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4] == v6)
  {
    objc_msgSend(v19, "artworkContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "artworkView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v5);

    objc_msgSend(a1[5], "artworkContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "artworkView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(objc_retainAutorelease(a1[6]), "CGColor"));

    objc_msgSend(a1[5], "artworkContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "artworkView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    objc_msgSend(v14, "setBorderWidth:", 1.0 / v16);

    objc_msgSend(a1[5], "artworkContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderWidth:", 0.0);

  }
}

- (void)configureForLockup:(id)a3 cellStyle:(id)a4
{
  -[VideosExtrasGridCollectionViewCell configureForLockup:cellStyle:withSizing:](self, "configureForLockup:cellStyle:withSizing:", a3, a4, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasGridCollectionViewCell;
  -[VideosExtrasGridCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self->_artworkContainer, "artworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (void)prepareForReuse
{
  void *v3;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VideosExtrasGridCollectionViewCell;
  -[VideosExtrasGridCollectionViewCell prepareForReuse](&v17, sel_prepareForReuse);
  -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", 0.0);

  -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", 0.0);

  -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaceholderImage:", 0);

  -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", 0);

  -[VideosExtrasGridCollectionViewCell artworkContainer](self, "artworkContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOverlayImage:", 0);

  -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", 0);

  -[VideosExtrasGridCollectionViewCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedText:", 0);

  -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", 0);

  -[VideosExtrasGridCollectionViewCell subtitleLabel](self, "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAttributedText:", 0);

}

- (IKLockupElement)lockupElement
{
  return (IKLockupElement *)objc_loadWeakRetained((id *)&self->_lockupElement);
}

- (void)setLockupElement:(id)a3
{
  objc_storeWeak((id *)&self->_lockupElement, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (VideosExtrasConstrainedArtworkContainerView)artworkContainer
{
  return self->_artworkContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkContainer, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_lockupElement);
  objc_storeStrong((id *)&self->_spacerTop, 0);
  objc_storeStrong((id *)&self->_spacerHeight, 0);
  objc_storeStrong((id *)&self->_subtitleLineHeight, 0);
  objc_storeStrong((id *)&self->_topLineHeight, 0);
  objc_storeStrong((id *)&self->_artworkContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_artworkContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_spacerView, 0);
}

@end
