@implementation SearchUIHeroCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SearchUIHeroCardSectionView;
  if ((objc_msgSendSuper2(&v7, sel_fillsBackgroundWithContentForRowModel_, v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "showsBackgroundImageViewForRowModel:", v4);

  return v5;
}

+ (BOOL)showsBackgroundImageViewForRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "imageAlign") == 4)
  {
    objc_msgSend(v3, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 1;
}

- (SearchUIHeroCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  SearchUIHeroCardSectionView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIHeroCardSectionView;
  v4 = -[SearchUICardSectionView initWithRowModel:feedbackDelegate:](&v7, sel_initWithRowModel_feedbackDelegate_, a3, a4);
  if (v4)
  {
    if ((TLKSnippetModernizationEnabled() & 1) == 0)
    {
      +[SearchUIAutoLayout sectionCornerRadius](SearchUIAutoLayout, "sectionCornerRadius");
      -[SearchUIHeroCardSectionView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
    }
    if (initWithRowModel_feedbackDelegate__onceToken != -1)
      dispatch_once(&initWithRowModel_feedbackDelegate__onceToken, &__block_literal_global_34);
    -[SearchUIHeroCardSectionView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);

  }
  return v4;
}

uint64_t __65__SearchUIHeroCardSectionView_initWithRowModel_feedbackDelegate___block_invoke()
{
  return +[SearchUIMediaUtilities prewarmMediaLibrary](SearchUIMediaUtilities, "prewarmMediaLibrary");
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAlignment:", 3);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDisableCornerRounding:", 1);
  -[SearchUIHeroCardSectionView setBackgroundImageView:](self, "setBackgroundImageView:", v4);
  objc_msgSend(v3, "addArrangedSubview:", v4);
  objc_msgSend(v3, "setAlignment:forView:inAxis:", 0, v4, 0);
  v46 = v4;
  objc_msgSend(v3, "setAlignment:forView:inAxis:", 0, v4, 1);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setProminence:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSymbolFont:", v6);

  objc_msgSend(v5, "setSymbolWeight:", 7);
  v45 = v5;
  -[SearchUIHeroCardSectionView setPunchoutIndicatorImageView:](self, "setPunchoutIndicatorImageView:", v5);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0DBDA48], "appIconCornerRadiusRatio");
  v10 = v9 * 24.0;
  objc_msgSend(v7, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", v10);

  v12 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v7, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v12);

  LODWORD(v14) = 1148846080;
  objc_msgSend(v7, "setLayoutSize:withContentPriority:", 24.0, 24.0, v14);
  objc_msgSend(v3, "addArrangedSubview:", v7);
  objc_msgSend(v3, "setAlignment:forView:inAxis:", 4, v7, 0);
  v47 = v3;
  objc_msgSend(v3, "setAlignment:forView:inAxis:", 1, v7, 1);
  v15 = objc_alloc(MEMORY[0x1E0CFAA98]);
  -[SearchUIHeroCardSectionView punchoutIndicatorImageView](self, "punchoutIndicatorImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithArrangedSubviews:", v17);

  objc_msgSend(v18, "setHorizontalAlignment:", 3);
  objc_msgSend(v18, "setVerticalAlignment:", 3);
  objc_msgSend(v7, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v18);

  v44 = v18;
  +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v18);
  -[SearchUIHeroCardSectionView setPunchoutIndicatorBackgroundBlurView:](self, "setPunchoutIndicatorBackgroundBlurView:", v7);
  v20 = (void *)objc_opt_new();
  LODWORD(v21) = 1148846080;
  objc_msgSend(v20, "setContentHuggingPriority:forAxis:", 0, v21);
  LODWORD(v22) = 1148846080;
  objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 0, v22);
  -[SearchUIHeroCardSectionView setThumbnailImageView:](self, "setThumbnailImageView:", v20);
  v23 = (void *)objc_opt_new();
  -[SearchUIHeroCardSectionView setTitleLabel:](self, "setTitleLabel:", v23);
  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4A90], TLKSnippetModernizationEnabled() ^ 1, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v25);

  objc_msgSend(v24, "setProminence:", 1);
  -[SearchUIHeroCardSectionView setSubtitleLabel:](self, "setSubtitleLabel:", v24);
  v26 = (void *)objc_opt_new();
  -[SearchUIHeroCardSectionView setButtonStackView:](self, "setButtonStackView:", v26);

  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDistribution:", 1);

  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSpacing:", 8.0);

  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v29);

  v30 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  v43 = v24;
  v50[0] = v23;
  v50[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithArrangedSubviews:", v31);

  objc_msgSend(v32, "setAxis:", 1);
  objc_msgSend(v32, "setSpacing:", 2.0);
  LODWORD(v33) = 1148846080;
  objc_msgSend(v32, "setContentCompressionResistancePriority:forAxis:", 1, v33);
  -[SearchUIHeroCardSectionView setLabelsStackView:](self, "setLabelsStackView:", v32);
  v49[0] = v20;
  v49[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (TLKSnippetModernizationEnabled())
  {
    v35 = (void *)objc_opt_new();
    objc_msgSend(v35, "setShouldReverseButtonOrder:", 1);
    -[SearchUIHeroCardSectionView setButtonItemStackView:](self, "setButtonItemStackView:", v35);
    objc_msgSend(v34, "arrayByAddingObject:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v36;
  }
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAAB0]), "initWithArrangedSubviews:", v34);
  objc_msgSend(v37, "setAlignment:forView:inAxis:", 1, v20, 1);
  objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v37);
  -[SearchUIHeroCardSectionView setThumbnailAndLabelsStackView:](self, "setThumbnailAndLabelsStackView:", v37);
  v38 = objc_alloc(MEMORY[0x1E0CFAAB0]);
  v48[0] = v37;
  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v38, "initWithArrangedSubviews:", v40);

  objc_msgSend(v41, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v41);
  -[SearchUIHeroCardSectionView setContainerStackView:](self, "setContainerStackView:", v41);
  objc_msgSend(v47, "addArrangedSubview:", v41);

  return v47;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double width;
  id v7;
  id v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a4.width;
  v7 = a5;
  -[SearchUICardSectionView contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v7)
  {

LABEL_5:
    width = *MEMORY[0x1E0CFAA88];
    v10 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
    goto LABEL_6;
  }
  v9 = -[SearchUIHeroCardSectionView hasBackground](self, "hasBackground");

  if (!v9)
    goto LABEL_5;
  v10 = width * 10.0 * 0.0625;
LABEL_6:

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
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
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  _BOOL4 v38;
  _BOOL4 v39;
  BOOL v40;
  void *v41;
  int v42;
  _BOOL8 v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
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
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  uint64_t *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  _BOOL4 v85;
  void *v86;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)SearchUIHeroCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v87, sel_updateWithRowModel_, v4);
  objc_msgSend(MEMORY[0x1E0DBDA50], "enableShadow:forView:", 0, self);
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[SearchUIHeroCardSectionView hasBackground](self, "hasBackground");
  if (v7)
  {
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMaxLines:", 1);

    objc_msgSend(v5, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaxLines:", 1);

  }
  v10 = (void *)MEMORY[0x1E0DBD940];
  if (v6 && objc_msgSend(v5, "imageAlign") != 1 && (TLKSnippetModernizationEnabled() & 1) != 0)
    v11 = (_QWORD *)MEMORY[0x1E0DC4B58];
  else
    v11 = (_QWORD *)MEMORY[0x1E0DC4B50];
  objc_msgSend(v10, "cachedFontForTextStyle:isShort:isBold:", *v11, TLKSnippetModernizationEnabled() ^ 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(v5, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSfText:", v14);

  -[SearchUIHeroCardSectionView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "richText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasContent") ^ 1;
  -[SearchUIHeroCardSectionView titleLabel](self, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v18);

  objc_msgSend(v5, "subtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView subtitleLabel](self, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSfText:", v20);

  -[SearchUIHeroCardSectionView subtitleLabel](self, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "richText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hasContent") ^ 1;
  -[SearchUIHeroCardSectionView subtitleLabel](self, "subtitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v24);

  -[SearchUIHeroCardSectionView titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isHidden");
  v85 = v7;
  v28 = v4;
  if (v27)
  {
    -[SearchUIHeroCardSectionView subtitleLabel](self, "subtitleLabel");
    v24 = objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend((id)v24, "isHidden");
  }
  else
  {
    v29 = 0;
  }
  -[SearchUIHeroCardSectionView labelsStackView](self, "labelsStackView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setHidden:", v29);

  if (v27)
  v31 = (void *)MEMORY[0x1E0DBD910];
  -[SearchUIHeroCardSectionView containerStackView](self, "containerStackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "disableAppearanceOverrideForView:", v32);

  v33 = (void *)MEMORY[0x1E0DBD910];
  -[SearchUIHeroCardSectionView punchoutIndicatorImageView](self, "punchoutIndicatorImageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "disableAppearanceOverrideForView:", v34);

  v35 = (void *)MEMORY[0x1E0DBD910];
  -[SearchUIHeroCardSectionView punchoutIndicatorBackgroundBlurView](self, "punchoutIndicatorBackgroundBlurView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "disableAppearanceOverrideForView:", v36);

  v37 = objc_msgSend(v5, "imageAlign");
  v38 = -[SearchUIHeroCardSectionView showBackgroundImageView](self, "showBackgroundImageView");
  v39 = v38;
  if (v6)
    v40 = v37 == 0;
  else
    v40 = 0;
  v41 = (void *)v6;
  v42 = !v40;
  v43 = !v38;
  v44 = v37 == 4 && !v38;
  if (v37 == 1)
    v45 = 1;
  else
    v45 = v44;
  v86 = v41;
  if (v41)
    v46 = v45;
  else
    v46 = 0;
  v47 = v4;
  if (v38)
  {
    -[SearchUIHeroCardSectionView backgroundImageView](self, "backgroundImageView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "updateWithImage:", v86);

    -[SearchUIHeroCardSectionView backgroundImageView](self, "backgroundImageView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "imageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "image");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v28;
    if (v51)
      -[SearchUIHeroCardSectionView showGradientAnimated:](self, "showGradientAnimated:", 0);
  }
  -[SearchUICardSectionView contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "layer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setMasksToBounds:", v85);

  -[SearchUIHeroCardSectionView backgroundImageView](self, "backgroundImageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setHidden:", v43);

  if ((v42 ^ 1 | v46) == 1)
  {
    -[SearchUIHeroCardSectionView thumbnailImageView](self, "thumbnailImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "updateWithImage:", v86);

  }
  -[SearchUIHeroCardSectionView thumbnailImageView](self, "thumbnailImageView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setHidden:", v42 & (v46 ^ 1));

  objc_msgSend(v47, "backgroundColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
    -[SearchUIHeroCardSectionView showGradientAnimated:](self, "showGradientAnimated:", 0);
  -[SearchUIHeroCardSectionView updateButtonsForCardSection:](self, "updateButtonsForCardSection:", v5);
  -[SearchUIHeroCardSectionView updatePunchoutIconForRowModel:](self, "updatePunchoutIconForRowModel:", v47);
  -[SearchUIHeroCardSectionView thumbnailAndLabelsStackView](self, "thumbnailAndLabelsStackView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setAxis:", v46);

  if ((_DWORD)v46)
    v59 = 0;
  else
    v59 = 3;
  -[SearchUIHeroCardSectionView thumbnailAndLabelsStackView](self, "thumbnailAndLabelsStackView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setAlignment:", v59);

  if ((v46 & !v85) != 0)
    v61 = 1;
  else
    v61 = 4;
  -[SearchUIHeroCardSectionView titleLabel](self, "titleLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setTextAlignment:", v61);

  -[SearchUIHeroCardSectionView subtitleLabel](self, "subtitleLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTextAlignment:", v61);

  v64 = 4.0;
  if (v85)
    v64 = 16.0;
  if (v42)
    v65 = v64;
  else
    v65 = 12.0;
  -[SearchUIHeroCardSectionView thumbnailAndLabelsStackView](self, "thumbnailAndLabelsStackView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setSpacing:", v65);

  -[SearchUICardSectionView contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    v68 = 4;
  else
    v68 = 3;
  -[SearchUIHeroCardSectionView containerStackView](self, "containerStackView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setAlignment:forView:inAxis:", v68, v69, 1);

  -[SearchUICardSectionView rowModel](self, "rowModel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "shouldFillAvailableSpace");

  v73 = *MEMORY[0x1E0DC49E8];
  v72 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v74 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if ((v71 & 1) != 0)
  {
    v75 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  }
  else if (-[SearchUIHeroCardSectionView hasBackground](self, "hasBackground")
         && (-[SearchUICardSectionView rowModel](self, "rowModel"),
             v76 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v76, "backgroundColor"),
             v77 = (void *)objc_claimAutoreleasedReturnValue(),
             v77,
             v76,
             !v77))
  {
    v75 = 0.0;
    v74 = -11.0;
    v72 = -11.0;
    v73 = 0.0;
  }
  else
  {
    v75 = -12.0;
  }
  -[SearchUICardSectionView contentView](self, "contentView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setCustomAlignmentRectInsets:", v73, v72, v75, v74);

  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri"))
  {
    v79 = 28.0 - 12.0;
  }
  else
  {
    if (v71)
      v80 = &SearchUIHeroCardSectionViewCornerRadiusForLeadingTrailingView;
    else
      v80 = &SearchUIHeroCardSectionViewCornerRadius;
    v79 = *(double *)v80;
  }
  -[SearchUICardSectionView contentView](self, "contentView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E0CD2A68], v79);

  v82 = v79 + -12.0;
  if (v79 + -12.0 < 7.0)
    v82 = 7.0;
  v83 = -v82;
  -[SearchUIHeroCardSectionView punchoutIndicatorBackgroundBlurView](self, "punchoutIndicatorBackgroundBlurView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setCustomAlignmentRectInsets:", v83, 0.0, 0.0, v83);

}

- (BOOL)hasBackground
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "fillsBackgroundWithContentForRowModel:", v4);

  return (char)v3;
}

- (BOOL)showBackgroundImageView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "showsBackgroundImageViewForRowModel:", v4);

  return (char)v3;
}

- (void)updatePunchoutIconForRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  SearchUIHeroCardSectionView *v22;
  _QWORD v23[4];
  id v24;
  SearchUIHeroCardSectionView *v25;
  id v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView punchoutIndicatorBackgroundBlurView](self, "punchoutIndicatorBackgroundBlurView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[SearchUIHeroCardSectionView punchoutIndicatorBackgroundBlurView](self, "punchoutIndicatorBackgroundBlurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffect:", 0);

  objc_msgSend(v5, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "mediaMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke;
    v23[3] = &unk_1EA1F83F8;
    v24 = v5;
    v25 = self;
    v26 = v10;
    v27 = v9;
    v11 = v9;
    v12 = v10;
    +[SearchUIMediaUtilities predictionForMediaMetadata:completion:](SearchUIMediaUtilities, "predictionForMediaMetadata:completion:", v12, v23);

LABEL_15:
    goto LABEL_16;
  }
  objc_msgSend(v4, "punchouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v8, "punchout"), (v12 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v12, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v12, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIHeroCardSectionView updatePunchoutImageWithBundleIdentifier:](self, "updatePunchoutImageWithBundleIdentifier:", v15);
    }
    else
    {
      objc_msgSend(v12, "preferredOpenableURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16;
      if (v16)
      {
        objc_msgSend(v16, "scheme");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("http")) & 1) == 0
          && (objc_msgSend(v18, "isEqualToString:", CFSTR("https")) & 1) == 0)
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_3;
          v19[3] = &unk_1EA1F6518;
          v20 = v15;
          v21 = v5;
          v22 = self;
          +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v19);

        }
      }
    }

    goto LABEL_15;
  }
LABEL_16:

}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_2;
  v8[3] = &unk_1EA1F83D0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v3;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v8);

}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  SearchUISymbolImage *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "selectedBundleIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(*(id *)(a1 + 56), "bundleIdentifiersToExclude"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "containsObject:", v10),
          v5,
          (v6 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 64), "setClientSelectedBundleIdentifier:", v10);
      objc_msgSend(*(id *)(a1 + 40), "updatePunchoutImageWithBundleIdentifier:", v10);
    }
    else
    {
      v7 = -[SearchUISymbolImage initWithSymbolName:]([SearchUISymbolImage alloc], "initWithSymbolName:", CFSTR("arrow.up.forward"));
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "punchoutIndicatorBackgroundBlurView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEffect:", v8);

      objc_msgSend(*(id *)(a1 + 40), "updateWithPunchoutImage:", v7);
    }

  }
}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(v2, "bundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_4;
    v7[3] = &unk_1EA1F6518;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = v5;
    v9 = v6;
    v10 = v4;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

  }
}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
    objc_msgSend(*(id *)(a1 + 40), "updatePunchoutImageWithBundleIdentifier:", *(_QWORD *)(a1 + 48));
}

- (void)updatePunchoutImageWithBundleIdentifier:(id)a3
{
  id v4;

  +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", a3, 5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView updateWithPunchoutImage:](self, "updateWithPunchoutImage:", v4);

}

- (void)updateWithPunchoutImage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  -[SearchUICardSectionView section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView punchoutIndicatorImageView](self, "punchoutIndicatorImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6 == 0);

  -[SearchUIHeroCardSectionView punchoutIndicatorImageView](self, "punchoutIndicatorImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "isHidden");

  if ((v6 & 1) == 0)
  {
    -[SearchUIHeroCardSectionView punchoutIndicatorImageView](self, "punchoutIndicatorImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithImage:", v4);

  }
  -[SearchUICardSectionView section](self, "section");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v11 = objc_claimAutoreleasedReturnValue();
  -[SearchUIHeroCardSectionView punchoutIndicatorBackgroundBlurView](self, "punchoutIndicatorBackgroundBlurView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v11 == 0);

  -[SearchUIHeroCardSectionView punchoutIndicatorBackgroundBlurView](self, "punchoutIndicatorBackgroundBlurView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "isHidden");

  if ((v11 & 1) == 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__SearchUIHeroCardSectionView_updateWithPunchoutImage___block_invoke;
    v14[3] = &unk_1EA1F62F0;
    v14[4] = self;
    +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v14);
  }

}

void __55__SearchUIHeroCardSectionView_updateWithPunchoutImage___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "punchoutIndicatorBackgroundBlurView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)updateButtonsForCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  SearchUIHeroButton *v44;
  void *v45;
  void *v46;
  SearchUIHeroButton *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  SearchUIHeroCardSectionView *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  SearchUIHeroCardSectionView *v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63 = self;
  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  objc_msgSend(v4, "buttonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v4, "imageAlign"))
    v8 = 0;
  else
    v8 = TLKSnippetModernizationEnabled();

  -[SearchUIHeroCardSectionView buttonItemStackView](v63, "buttonItemStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "buttonItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[SearchUICardSectionView rowModel](v63, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView feedbackDelegate](v63, "feedbackDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v10, 2, 1, v11, v12);

  if (v8)
  {

LABEL_12:
    v21 = 0;
    goto LABEL_37;
  }

  objc_msgSend(v6, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v15 = (void *)objc_opt_new();
    v79[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHeroCardSectionView updateWithButtonViews:visible:addBackground:animate:](v63, "updateWithButtonViews:visible:addBackground:animate:", v16, 0, 1, 0);

    objc_msgSend(v6, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "watchListItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", objc_msgSend(v18, "type"), objc_msgSend(v18, "isMediaContainer"));
    objc_msgSend(v18, "watchListIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke;
    v73[3] = &unk_1EA1F8448;
    v74 = v4;
    v75 = v63;
    v76 = v6;
    +[SearchUIWatchListUtilities fetchWatchListStateForWatchListIdentifier:type:completion:](SearchUIWatchListUtilities, "fetchWatchListStateForWatchListIdentifier:type:completion:", v20, v19, v73);

    goto LABEL_12;
  }
  v61 = v4;
  v22 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v60 = v6;
  v23 = v6;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v24)
  {
    v25 = v24;
    v21 = 0;
    v26 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v70 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = v28;
          objc_msgSend(v22, "addObject:", v29);
          objc_msgSend(v29, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = objc_msgSend(v30, "length");
          v21 |= v31 != 0;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v25);
  }
  else
  {
    v21 = 0;
  }

  v32 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v22;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v66;
    v62 = *MEMORY[0x1E0DC4AE8];
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v66 != v35)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        if ((v21 & 1) != 0)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "image");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIHeroCardSectionView effectiveScreenScale](v63, "effectiveScreenScale");
          v41 = v40;
          objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", v63);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "loadImageWithScale:isDarkStyle:", objc_msgSend(v42, "isDark"), v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = [SearchUIHeroButton alloc];
          objc_msgSend(v37, "title");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "command");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = -[SearchUIHeroButton initWithTitle:image:command:](v44, "initWithTitle:image:command:", v45, v43, v46);
        }
        else
        {
          v47 = (SearchUIHeroButton *)objc_opt_new();
          objc_msgSend(v37, "image");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v48);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          -[SearchUIHeroButton setTlkImage:](v47, "setTlkImage:", v43);
          objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", v62);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIHeroButton tlkImageView](v47, "tlkImageView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setSymbolFont:", v45);
        }

        -[SearchUIHeroButton setButtonItem:](v47, "setButtonItem:", v37);
        objc_msgSend(v32, "addObject:", v47);

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v34);
  }

  if (objc_msgSend(v32, "count"))
    -[SearchUIHeroCardSectionView updateWithButtonViews:visible:addBackground:animate:](v63, "updateWithButtonViews:visible:addBackground:animate:", v32, 1, 0, 0);

  v6 = v60;
  v4 = v61;
LABEL_37:
  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  if (TLKSnippetModernizationEnabled())
  {
    if (-[SearchUIHeroCardSectionView hasBackground](v63, "hasBackground"))
    {
      v49 = 12.0;
      goto LABEL_42;
    }
  }
  else
  {
    v49 = 8.0;
    if ((v21 & 1) != 0)
      goto LABEL_42;
  }
  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v49 = v50;
LABEL_42:
  if (-[SearchUIHeroCardSectionView hasBackground](v63, "hasBackground"))
    v51 = v49;
  else
    v51 = 0.0;
  -[SearchUIHeroCardSectionView containerStackView](v63, "containerStackView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setLayoutMargins:", v49, v49, v51, v49);

  -[SearchUIHeroCardSectionView containerStackView](v63, "containerStackView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setAxis:", v21 & 1);

  v54 = *MEMORY[0x1E0DBDA70];
  -[SearchUIHeroCardSectionView containerStackView](v63, "containerStackView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  v57 = 16.0;
  if ((v21 & 1) != 0)
  {
    v58 = 0;
  }
  else
  {
    v57 = v54;
    v58 = 4;
  }
  objc_msgSend(v55, "setSpacing:", v57);

  -[SearchUIHeroCardSectionView containerStackView](v63, "containerStackView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setAlignment:", v58);

}

void __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;

  v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") ^ 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke_2;
  v9[3] = &unk_1EA1F8420;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v13 = v7;
  v14 = v4;
  v8 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v9);

}

void __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  SearchUICommandButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rowModel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    v4 = *(_QWORD *)(a1 + 48);

    if (v4)
    {
      v5 = -[SearchUICommandButton initWithWatchListState:]([SearchUICommandButton alloc], "initWithWatchListState:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 56), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICommandButton setButtonItem:](v5, "setButtonItem:", v6);

      v7 = *(void **)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithButtonViews:visible:addBackground:animate:", v8, 1, 1, *(unsigned __int8 *)(a1 + 64));

      objc_msgSend(*(id *)(a1 + 40), "buttonStackView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutIfNeeded");

    }
  }
  else
  {

  }
}

- (void)updateWithButtonViews:(id)a3 visible:(BOOL)a4 addBackground:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  id v19;
  uint64_t v20;
  void *v21;
  SearchUIHeroCardSectionView *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  _BOOL4 v28;
  uint64_t v29;
  id obj;
  _QWORD v31[5];
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v28 = a6;
  v6 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  v10 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      v29 = v12;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
        objc_msgSend(v15, "addTarget:action:", self, sel_buttonPressed_);
        v16 = v15;
        if (v6)
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "_setCornerRadius:", 18.0);
          v18 = v6;
          v19 = objc_alloc(MEMORY[0x1E0CFAA98]);
          v37[0] = v17;
          v37[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
          v20 = v13;
          v21 = v10;
          v22 = self;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v19, "initWithArrangedSubviews:", v23);

          self = v22;
          v10 = v21;
          v13 = v20;
          LODWORD(v25) = 1148846080;
          objc_msgSend(v24, "setLayoutSize:withContentPriority:", 36.0, 36.0, v25);
          objc_msgSend(v24, "setAlignment:forView:inAxis:", 3, v16, 0);
          objc_msgSend(v24, "setAlignment:forView:inAxis:", 3, v16, 1);

          v16 = v24;
          v6 = v18;
          v12 = v29;
        }
        objc_msgSend(v10, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }

  -[SearchUIHeroCardSectionView buttonStackView](self, "buttonStackView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setArrangedSubviews:", v10);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __83__SearchUIHeroCardSectionView_updateWithButtonViews_visible_addBackground_animate___block_invoke;
  v31[3] = &unk_1EA1F6318;
  v31[4] = self;
  v32 = a4;
  +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", v31, v28);

}

void __83__SearchUIHeroCardSectionView_updateWithButtonViews_visible_addBackground_animate___block_invoke(uint64_t a1, double a2)
{
  double v2;
  id v3;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  v2 = (double)*(unint64_t *)&a2;
  objc_msgSend(*(id *)(a1 + 32), "buttonStackView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

- (void)buttonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F0311F40))
    objc_msgSend(v5, "setWatchListDelegate:", v9);
  objc_msgSend(v9, "buttonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView rowModel](self, "rowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeWithTriggerEvent:", 2);

}

- (void)didUpdateWithImage:(id)a3
{
  if (-[SearchUIHeroCardSectionView showBackgroundImageView](self, "showBackgroundImageView", a3))
    -[SearchUIHeroCardSectionView showGradientAnimated:](self, "showGradientAnimated:", 1);
}

- (void)showGradientAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  _QWORD v10[5];
  int v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBDA50], "enableShadow:forView:", 1, self);
  -[SearchUIHeroCardSectionView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shadowOpacity");
  v7 = v6;

  -[SearchUIHeroCardSectionView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  objc_msgSend(v8, "setShadowOpacity:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__SearchUIHeroCardSectionView_showGradientAnimated___block_invoke;
  v10[3] = &unk_1EA1F8470;
  v10[4] = self;
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0DBDA48], "performAnimatableChanges:animated:", v10, v3);
}

void __52__SearchUIHeroCardSectionView_showGradientAnimated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = v2;
  objc_msgSend(v3, "setShadowOpacity:", v4);

  objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overrideAppearanceForView:", v5);

  objc_msgSend(*(id *)(a1 + 32), "punchoutIndicatorImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "overrideAppearanceForView:", v6);

  objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "punchoutIndicatorBackgroundBlurView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideAppearanceForView:", v8);

}

- (id)highlightReferenceView
{
  void *v3;

  if (-[SearchUIHeroCardSectionView hasBackground](self, "hasBackground"))
  {
    -[SearchUICardSectionView contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (SearchUIImageView)backgroundImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setBackgroundImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 792);
}

- (SearchUIImageView)thumbnailImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 800, 1);
}

- (void)setThumbnailImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 800);
}

- (SearchUIImageView)punchoutIndicatorImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 808, 1);
}

- (void)setPunchoutIndicatorImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 808);
}

- (NUIContainerStackView)thumbnailAndLabelsStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 816, 1);
}

- (void)setThumbnailAndLabelsStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 816);
}

- (NUIContainerStackView)labelsStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 824, 1);
}

- (void)setLabelsStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (SearchUILabel)titleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 832, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (SearchUILabel)subtitleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 840, 1);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (NUIContainerStackView)containerStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 848, 1);
}

- (void)setContainerStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (NUIContainerStackView)buttonStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 856, 1);
}

- (void)setButtonStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (SFImage)currentImage
{
  return (SFImage *)objc_getProperty(self, a2, 864, 1);
}

- (void)setCurrentImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (SearchUIButtonItemStackView)buttonItemStackView
{
  return self->_buttonItemStackView;
}

- (void)setButtonItemStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemStackView, a3);
}

- (UIVisualEffectView)punchoutIndicatorBackgroundBlurView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 880, 1);
}

- (void)setPunchoutIndicatorBackgroundBlurView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 880);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutIndicatorBackgroundBlurView, 0);
  objc_storeStrong((id *)&self->_buttonItemStackView, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_thumbnailAndLabelsStackView, 0);
  objc_storeStrong((id *)&self->_punchoutIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
