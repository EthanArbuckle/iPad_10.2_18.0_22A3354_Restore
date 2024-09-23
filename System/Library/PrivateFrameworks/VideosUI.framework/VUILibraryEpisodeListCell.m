@implementation VUILibraryEpisodeListCell

+ (void)configureVUILibraryEpisodeListCell:(id)a3 withMedia:(id)a4 andAssetController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  VUILibraryEpisodeFrameView *v11;
  void *v12;
  void *v13;
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
  __CFString *v25;
  id *v26;

  v26 = (id *)a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v26, "imageFrameView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v26, "imageFrameView");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = [VUILibraryEpisodeFrameView alloc];
    v10 = -[VUILibraryEpisodeFrameView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v12 = (void *)v10;

  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 0.0, 48.0);
  +[VUILibraryEpisodeFrameView configureEpisodeFrameView:withMedia:layout:imageSize:](VUILibraryEpisodeFrameView, "configureEpisodeFrameView:withMedia:layout:imageSize:", v12, v7, 0);
  objc_msgSend(v26, "setImageFrameView:", v12);
  objc_storeStrong(v26 + 96, a4);
  objc_storeStrong(v26 + 95, a5);
  objc_msgSend(v26, "_addDownloadButtonIfRequired:", v7);
  objc_msgSend(v7, "episodeNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "vui_languageAwareDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "vui_stringWithFirstStrongDirectionalIsolates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:", CFSTR("EPISODE_NUMBER_INDICATOR_FOLLOWED_BY_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%@ %@"), 0, v14, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTitle:", v20);

  objc_msgSend(v7, "releaseDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v21, 2, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setReleaseDate:", v22);

  objc_msgSend(v7, "duration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0DC6B40]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transformedValue:", v23);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = &stru_1E9FF3598;
  }
  objc_msgSend(v26, "setDuration:", v25);
  objc_msgSend(v26, "setNeedsLayout");

}

- (VUILibraryEpisodeListCell)initWithFrame:(CGRect)a3
{
  VUILibraryEpisodeListCell *v3;
  VUISeparatorView *v4;
  uint64_t v5;
  VUISeparatorView *separatorView;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VUILibraryEpisodeListCell;
  v3 = -[VUILibraryEpisodeListCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUISeparatorView alloc];
    v5 = -[VUISeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separatorView = v3->_separatorView;
    v3->_separatorView = (VUISeparatorView *)v5;

    -[VUILibraryEpisodeListCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_separatorView);

    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__VUILibraryEpisodeListCell_initWithFrame___block_invoke;
    v11[3] = &unk_1E9F99F98;
    objc_copyWeak(&v12, &location);
    v9 = (id)-[VUILibraryEpisodeListCell registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v8, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__VUILibraryEpisodeListCell_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dotSeparatorLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", objc_msgSend(WeakRetained, "_contentSizeCategoryIsAccessibility"));

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUILibraryEpisodeListCell;
  -[VUIListCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[VUILibraryEpisodeListCell setImageFrameView:](self, "setImageFrameView:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  VUIDownloadButton *v10;
  double v11;
  double v12;
  VUIDownloadButton *downloadButton;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  VUILabel *releaseDateLabel;
  double v21;
  double v22;
  double v23;
  CGSize result;
  CGRect v25;
  CGRect v26;

  width = a3.width;
  v5 = (void *)MEMORY[0x1E0DC69B0];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "vuiContentSizeCategoryFor:", v7);

  if (!objc_msgSend(MEMORY[0x1E0DC6960], "contentSizeCategoryIsAccessibility:", v8))
  {
    +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 0.0, 48.0);
    v12 = width - (v11 + 16.0);
    downloadButton = self->_downloadButton;
    if (downloadButton)
    {
      -[VUIDownloadButton sizeToFit](downloadButton, "sizeToFit");
      -[VUIDownloadButton frame](self->_downloadButton, "frame");
      v12 = v12 - (CGRectGetWidth(v25) + 16.0);
    }
    -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v12, 1.79769313e308);
    v15 = v14;
    -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v12, 1.79769313e308);
    v17 = v16;
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, 1.79769313e308);
    -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", v12, 1.79769313e308);
    v19 = v18;
    -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 32.0);
    if (self->_dotSeparatorLabel && v17 + v15 + 4.0 + v19 + 4.0 > v12)
    {
      -[VUILabel topMarginToLabel:withBaselineMargin:](self->_releaseDateLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
    }
    else
    {
      releaseDateLabel = self->_releaseDateLabel;
      if (releaseDateLabel)
      {
        -[VUILabel topMarginToLabel:withBaselineMargin:](releaseDateLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
        goto LABEL_14;
      }
    }
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_durationLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
    goto LABEL_14;
  }
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
  -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", width, 1.79769313e308);
  -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", width, 1.79769313e308);
  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 0.0, 48.0);
  -[VUILibraryEpisodeListCell assetController](self, "assetController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[VUIDownloadButton initWithAssetController:type:]([VUIDownloadButton alloc], "initWithAssetController:type:", v9, 8);
  else
    v10 = 0;
  -[VUIDownloadButton setUsesDefaultConfiguration:](v10, "setUsesDefaultConfiguration:", 1);
  -[VUIDownloadButton sizeToFit](v10, "sizeToFit");
  -[VUIDownloadButton frame](v10, "frame");
  CGRectGetHeight(v26);
  -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 32.0);

LABEL_14:
  VUIRoundValue();
  v22 = v21;
  v23 = width;
  result.height = v22;
  result.width = v23;
  return result;
}

- (void)setImageFrameView:(id)a3
{
  VUILibraryEpisodeFrameView *v5;
  VUILibraryEpisodeFrameView *imageFrameView;
  VUILibraryEpisodeFrameView *v7;

  v5 = (VUILibraryEpisodeFrameView *)a3;
  imageFrameView = self->_imageFrameView;
  if (imageFrameView != v5)
  {
    v7 = v5;
    -[VUILibraryEpisodeFrameView removeFromSuperview](imageFrameView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageFrameView, a3);
    if (self->_imageFrameView)
      -[VUILibraryEpisodeListCell addSubview:](self, "addSubview:");
    -[VUILibraryEpisodeListCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setDownloadButton:(id)a3
{
  VUIDownloadButton *v5;
  VUIDownloadButton *downloadButton;
  VUIDownloadButton *v7;

  v5 = (VUIDownloadButton *)a3;
  downloadButton = self->_downloadButton;
  if (downloadButton != v5)
  {
    v7 = v5;
    -[VUIDownloadButton removeFromSuperview](downloadButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_downloadButton, a3);
    if (self->_downloadButton)
      -[VUILibraryEpisodeListCell addSubview:](self, "addSubview:");
    -[VUILibraryEpisodeListCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setTitle:(id)a3
{
  NSString **p_title;
  VUITextLayout *v6;
  void *v7;
  VUILabel *v8;
  VUILabel *titleLabel;
  void *v10;
  id v11;

  p_title = &self->_title;
  v11 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    v6 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v6, "setTextStyle:", 19);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v6, "setColor:", v7);

    -[VUITextLayout setNumberOfLines:](v6, "setNumberOfLines:", 2);
    -[VUITextLayout setAlignment:](v6, "setAlignment:", 2* (-[VUILibraryEpisodeListCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1));
    -[VUITextLayout setLineBreakMode:](v6, "setLineBreakMode:", 4);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", *p_title, v6, self->_titleLabel);
    v8 = (VUILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    -[VUILibraryEpisodeListCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_titleLabel);

  }
}

- (void)setReleaseDate:(id)a3
{
  NSString **p_releaseDate;
  VUILabel *v6;
  VUILabel *releaseDateLabel;
  void *v8;
  id v9;

  p_releaseDate = &self->_releaseDate;
  v9 = a3;
  if (!-[NSString isEqualToString:](*p_releaseDate, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_releaseDate, a3);
    if (*p_releaseDate)
    {
      objc_msgSend((id)objc_opt_class(), "_metadataLabelWithString:existingLabel:", *p_releaseDate, self->_releaseDateLabel);
      v6 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      releaseDateLabel = self->_releaseDateLabel;
      self->_releaseDateLabel = v6;

      -[VUILibraryEpisodeListCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_releaseDateLabel);
    }
    else
    {
      -[VUILabel removeFromSuperview](self->_releaseDateLabel, "removeFromSuperview");
      v8 = self->_releaseDateLabel;
      self->_releaseDateLabel = 0;
    }

    -[VUILibraryEpisodeListCell _configureDotSeparator](self, "_configureDotSeparator");
  }

}

- (void)setDuration:(id)a3
{
  NSString **p_duration;
  VUILabel *v6;
  VUILabel *durationLabel;
  void *v8;
  id v9;

  p_duration = &self->_duration;
  v9 = a3;
  if (!-[NSString isEqualToString:](*p_duration, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_duration, a3);
    if (*p_duration)
    {
      objc_msgSend((id)objc_opt_class(), "_metadataLabelWithString:existingLabel:", *p_duration, self->_durationLabel);
      v6 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      durationLabel = self->_durationLabel;
      self->_durationLabel = v6;

      -[VUILibraryEpisodeListCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_durationLabel);
    }
    else
    {
      -[VUILabel removeFromSuperview](self->_durationLabel, "removeFromSuperview");
      v8 = self->_durationLabel;
      self->_durationLabel = 0;
    }

    -[VUILibraryEpisodeListCell _configureDotSeparator](self, "_configureDotSeparator");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  VUILabel *titleLabel;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  VUISeparatorView *separatorView;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat MaxY;
  double v22;
  CGFloat v23;
  VUILabel *releaseDateLabel;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  void *v34;
  double MaxX;
  CGFloat v36;
  void *v37;
  double MidY;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  CGFloat v45;
  void *v46;
  double Width;
  double v48;
  VUISeparatorView *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  VUILabel *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BOOL4 v61;
  void *v62;
  VUILabel *v63;
  double v64;
  VUILabel *v65;
  void *v67;
  double v68;
  CGFloat v69;
  VUILabel *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  VUILabel *dotSeparatorLabel;
  double v81;
  double v82;
  double v83;
  double v84;
  VUILabel *durationLabel;
  void *v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  VUILabel *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  VUISeparatorView *v100;
  VUILabel *v101;
  VUILibraryEpisodeFrameView *imageFrameView;
  VUILabel *v103;
  VUILabel *v104;
  VUILabel *v105;
  VUIDownloadButton *downloadButton;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  double v114;
  double v115;
  CGFloat v116;
  CGFloat v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double rect;
  CGFloat rect_8;
  double rect_16;
  double rect_24;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  objc_super v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;

  v133.receiver = self;
  v133.super_class = (Class)VUILibraryEpisodeListCell;
  -[VUILibraryEpisodeListCell layoutSubviews](&v133, sel_layoutSubviews);
  v3 = *MEMORY[0x1E0C9D648];
  v132 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v131 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  if (-[VUILibraryEpisodeListCell _contentSizeCategoryIsAccessibility](self, "_contentSizeCategoryIsAccessibility"))
  {
    v5 = v4;
    titleLabel = self->_titleLabel;
    -[VUILibraryEpisodeListCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[VUILabel sizeThatFits:](titleLabel, "sizeThatFits:", CGRectGetWidth(v134), 1.79769313e308);
    v9 = v8;
    v11 = v10;

    rect = 0.0;
    +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778);
    v13 = v12;
    v15 = v14;
    separatorView = self->_separatorView;
    -[VUILibraryEpisodeListCell contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[VUIBaseView sizeThatFits:](separatorView, "sizeThatFits:", CGRectGetWidth(v135), 1.79769313e308);
    v19 = v18;
    v114 = v20;

    v136.origin.y = 32.0;
    v136.origin.x = 0.0;
    v120 = v13;
    v121 = v15;
    v136.size.width = v13;
    v136.size.height = v15;
    MaxY = CGRectGetMaxY(v136);
    v137.origin.x = 0.0;
    v137.origin.y = MaxY;
    v129 = v11;
    v130 = v9;
    v137.size.width = v9;
    v137.size.height = v11;
    v22 = CGRectGetMaxY(v137);
    v23 = v22;
    releaseDateLabel = self->_releaseDateLabel;
    v122 = MaxY;
    if (releaseDateLabel)
    {
      -[VUILibraryEpisodeListCell contentView](self, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      -[VUILabel sizeThatFits:](releaseDateLabel, "sizeThatFits:", CGRectGetWidth(v138), 1.79769313e308);
      v27 = v26;
      v29 = v28;

      v139.origin.x = 0.0;
      v139.origin.y = v23;
      rect_16 = v27;
      rect_24 = v29;
      v139.size.width = v27;
      v139.size.height = v29;
      v30 = CGRectGetMaxY(v139);
    }
    else
    {
      v30 = v22;
      v23 = v132;
      rect_16 = v131;
      rect_24 = v5;
      rect = v3;
    }
    durationLabel = self->_durationLabel;
    v115 = v19;
    v128 = v23;
    if (durationLabel)
    {
      -[VUILibraryEpisodeListCell contentView](self, "contentView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "bounds");
      -[VUILabel sizeThatFits:](durationLabel, "sizeThatFits:", CGRectGetWidth(v152), 1.79769313e308);
      v87 = v132;
      v89 = v88;
      v72 = v90;

      v153.origin.x = 0.0;
      v112 = 0.0;
      v153.origin.y = v30;
      v153.size.width = v89;
      v153.size.height = v72;
      v113 = CGRectGetMaxY(v153);
      v84 = v5;
      v73 = v131;
    }
    else
    {
      v112 = v3;
      v113 = v30;
      v84 = v5;
      v72 = v5;
      v73 = v131;
      v87 = v132;
      v89 = v131;
      v30 = v132;
    }
    -[VUIDownloadButton sizeToFit](self->_downloadButton, "sizeToFit");
    -[VUIDownloadButton frame](self->_downloadButton, "frame");
    rect_8 = v91;
    v116 = 0.0;
    v117 = v92;
    v119 = 32.0;
    v111 = v87;
    v71 = v3;
    v64 = 0.0;
    v131 = v89;
    v132 = v30;
    goto LABEL_35;
  }
  v112 = v3;
  -[VUIDownloadButton sizeToFit](self->_downloadButton, "sizeToFit");
  -[VUIDownloadButton frame](self->_downloadButton, "frame");
  rect_8 = v31;
  v33 = v32;
  -[VUILibraryEpisodeListCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  MaxX = CGRectGetMaxX(v140);
  -[VUIDownloadButton frame](self->_downloadButton, "frame");
  v36 = MaxX - CGRectGetWidth(v141);
  -[VUILibraryEpisodeListCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  MidY = CGRectGetMidY(v142);
  -[VUIDownloadButton frame](self->_downloadButton, "frame");
  v39 = MidY - CGRectGetHeight(v143) * 0.5;

  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778);
  v41 = v40;
  v43 = v42;
  -[VUILibraryEpisodeListCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  v45 = CGRectGetMidY(v144) - v43 * 0.5;

  v145.origin.x = 0.0;
  v119 = v45;
  v145.origin.y = v45;
  v145.size.width = v41;
  v121 = v43;
  v145.size.height = v43;
  v127 = CGRectGetMaxX(v145);
  -[VUILibraryEpisodeListCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  Width = CGRectGetWidth(v146);
  v116 = v36;
  v117 = v33;
  v147.origin.x = v36;
  v147.size.width = rect_8;
  v113 = v39;
  v147.origin.y = v39;
  v147.size.height = v33;
  v48 = Width - (v41 + CGRectGetWidth(v147) + 16.0);

  if (self->_downloadButton)
    v48 = v48 + -16.0;
  v49 = self->_separatorView;
  -[VUILibraryEpisodeListCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bounds");
  v120 = v41;
  -[VUIBaseView sizeThatFits:](v49, "sizeThatFits:", CGRectGetWidth(v148) - (v41 + 16.0), 1.79769313e308);
  v115 = v51;
  v53 = v52;

  v130 = v48;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v48, 1.79769313e308);
  v129 = v54;
  v55 = self->_releaseDateLabel;
  v118 = v4;
  v114 = v53;
  if (v55 && self->_durationLabel)
  {
    -[VUILabel sizeThatFits:](v55, "sizeThatFits:", v48, 1.79769313e308);
    v57 = v56;
    -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v130, 1.79769313e308);
    v59 = v58;
    -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", v130, 1.79769313e308);
    v61 = v59 + v57 + 4.0 + v60 + 4.0 > v130;
  }
  else
  {
    v61 = 0;
  }
  -[VUILabel baselineHeight](self->_titleLabel, "baselineHeight");
  -[VUILabel font](self->_titleLabel, "font");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "capHeight");

  v63 = self->_releaseDateLabel;
  if (v63)
  {
    -[VUILabel topMarginToLabel:withBaselineMargin:](v63, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
    -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v130, 1.79769313e308);
    -[VUILabel _baselineOffsetFromBottom](self->_releaseDateLabel, "_baselineOffsetFromBottom");
  }
  v64 = v127 + 16.0;
  v65 = self->_durationLabel;
  if (v65)
  {
    if (!self->_releaseDateLabel || v61)
    {
      -[VUILabel topMarginToLabel:withBaselineMargin:](v65, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
      -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v130, 1.79769313e308);
      -[VUILabel _baselineOffsetFromBottom](self->_durationLabel, "_baselineOffsetFromBottom");
    }
  }
  -[VUILibraryEpisodeListCell contentView](self, "contentView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "bounds");
  CGRectGetHeight(v149);
  VUIRoundValue();
  v69 = v68;

  v70 = self->_releaseDateLabel;
  v71 = v127 + 16.0;
  v72 = v118;
  v73 = v131;
  rect_16 = v131;
  rect_24 = v118;
  v128 = v132;
  v74 = v112;
  if (v70)
  {
    -[VUILabel topMarginToLabel:withBaselineMargin:](v70, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
    v76 = v75;
    -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v130, 1.79769313e308);
    v78 = v77;
    rect_24 = v79;
    v150.origin.x = v64;
    v150.origin.y = v69;
    v150.size.width = v130;
    v150.size.height = v129;
    v128 = v76 + CGRectGetMaxY(v150);
    rect_16 = v78;
    v71 = v64 + v78 + 4.0;
    v74 = v64;
  }
  v122 = v69;
  rect = v74;
  dotSeparatorLabel = self->_dotSeparatorLabel;
  if (!dotSeparatorLabel)
  {
    v83 = v71;
    v84 = v118;
    goto LABEL_27;
  }
  -[VUILabel sizeThatFits:](dotSeparatorLabel, "sizeThatFits:", v130, 1.79769313e308);
  if (v61)
  {
    -[VUILabel setHidden:](self->_dotSeparatorLabel, "setHidden:", 1);
    v151.origin.x = 0.0;
    v151.origin.y = v119;
    v151.size.width = v120;
    v151.size.height = v121;
    v83 = CGRectGetMaxX(v151) + 16.0;
    v84 = v118;
    v73 = v131;
LABEL_27:
    v111 = v132;
    v71 = v112;
    goto LABEL_31;
  }
  v73 = v81;
  v84 = v82;
  -[VUILabel setHidden:](self->_dotSeparatorLabel, "setHidden:", 0);
  v154.origin.x = rect;
  v154.size.height = rect_24;
  v154.origin.y = v128;
  v154.size.width = rect_16;
  v111 = CGRectGetMidY(v154) + v84 * -0.5;
  v83 = v71 + v73 + 4.0;
LABEL_31:
  v93 = self->_durationLabel;
  if (v93)
  {
    v112 = v83;
    -[VUILabel topMarginToLabel:withBaselineMargin:](v93, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, 20.0);
    v95 = v94;
    v155.origin.x = v64;
    v155.origin.y = v69;
    v155.size.height = v129;
    v155.size.width = v130;
    v96 = CGRectGetMaxY(v155);
    if (v61)
    {
      v156.origin.x = rect;
      v156.size.height = rect_24;
      v156.origin.y = v128;
      v156.size.width = rect_16;
      v96 = CGRectGetMaxY(v156);
    }
    v132 = v95 + v96;
    -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v130, 1.79769313e308);
    v131 = v97;
    v72 = v98;
  }
LABEL_35:
  if (-[VUILibraryEpisodeListCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[VUILibraryEpisodeListCell contentView](self, "contentView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "bounds");

    v100 = self->_separatorView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](v100, "setFrame:");
    v101 = self->_dotSeparatorLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v101, "setFrame:");
    imageFrameView = self->_imageFrameView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILibraryEpisodeFrameView setFrame:](imageFrameView, "setFrame:");
    v103 = self->_titleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v103, "setFrame:");
    v104 = self->_releaseDateLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v104, "setFrame:");
    v105 = self->_durationLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v105, "setFrame:");
    downloadButton = self->_downloadButton;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
  }
  else
  {
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v64, 0.0, v115, v114);
    -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v71, v111, v73, v84);
    -[VUILibraryEpisodeFrameView setFrame:](self->_imageFrameView, "setFrame:", 0.0, v119, v120, v121);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v64, v122, v130, v129);
    -[VUILabel setFrame:](self->_releaseDateLabel, "setFrame:", rect, v128, rect_16, rect_24);
    -[VUILabel setFrame:](self->_durationLabel, "setFrame:", v112, v132, v131, v72);
    downloadButton = self->_downloadButton;
    v109 = rect_8;
    v107 = v116;
    v110 = v117;
    v108 = v113;
  }
  -[VUIDownloadButton setFrame:](downloadButton, "setFrame:", v107, v108, v109, v110);
}

- (void)_addDownloadButtonIfRequired:(id)a3
{
  void *v4;
  VUIDownloadButton *v5;
  VUIDownloadButton *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "assetController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUILibraryEpisodeListCell downloadButton](self, "downloadButton");
    v5 = (VUIDownloadButton *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[VUIDownloadButton updateWithAssetController:](v5, "updateWithAssetController:", self->_assetController);
    }
    else
    {
      v6 = -[VUIDownloadButton initWithMediaEntity:type:]([VUIDownloadButton alloc], "initWithMediaEntity:type:", v8, 8);
      -[VUIDownloadButton setUsesDefaultConfiguration:](v6, "setUsesDefaultConfiguration:", 1);
      -[VUILibraryEpisodeListCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v6);

      -[VUILibraryEpisodeListCell setDownloadButton:](self, "setDownloadButton:", v6);
    }

  }
  else
  {
    -[VUILibraryEpisodeListCell setDownloadButton:](self, "setDownloadButton:", 0);
  }

}

- (void)_configureDotSeparator
{
  VUILabel *v3;
  void *v4;
  VUILabel *v5;
  VUILabel *dotSeparatorLabel;
  void *v7;
  VUITextLayout *v8;

  if (self->_releaseDate
    && self->_duration
    && !-[VUILibraryEpisodeListCell _contentSizeCategoryIsAccessibility](self, "_contentSizeCategoryIsAccessibility"))
  {
    v8 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v8, "setTextStyle:", 21);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v8, "setColor:", v4);

    -[VUITextLayout setNumberOfLines:](v8, "setNumberOfLines:", 1);
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("·"), v8, self->_dotSeparatorLabel);
    v5 = (VUILabel *)objc_claimAutoreleasedReturnValue();
    dotSeparatorLabel = self->_dotSeparatorLabel;
    self->_dotSeparatorLabel = v5;

    -[VUILibraryEpisodeListCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_dotSeparatorLabel);

    v3 = (VUILabel *)v8;
  }
  else
  {
    -[VUILabel removeFromSuperview](self->_dotSeparatorLabel, "removeFromSuperview");
    v3 = self->_dotSeparatorLabel;
    self->_dotSeparatorLabel = 0;
  }

}

- (double)_metadataScaledTopMarginForNonAXContentSizeCategory
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[VUILibraryEpisodeListCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v3, 20.0);
  v5 = v4;

  -[VUILibraryEpisodeListCell _metadataHeightToBaselineNonAXContentSizeCategory](self, "_metadataHeightToBaselineNonAXContentSizeCategory");
  return v5 - v6;
}

- (double)_metadataHeightToBaselineNonAXContentSizeCategory
{
  VUILabel *releaseDateLabel;
  double result;

  releaseDateLabel = self->_releaseDateLabel;
  if (!releaseDateLabel)
  {
    releaseDateLabel = self->_durationLabel;
    if (!releaseDateLabel)
      return 0.0;
  }
  -[UILabel vui_heightToBaseline](releaseDateLabel, "vui_heightToBaseline");
  return result;
}

- (BOOL)_contentSizeCategoryIsAccessibility
{
  void *v2;
  char v3;

  -[VUILibraryEpisodeListCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAXEnabled");

  return v3;
}

+ (id)_metadataLabelWithString:(id)a3 existingLabel:(id)a4
{
  id v5;
  id v6;
  VUITextLayout *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v7, "setTextStyle:", 21);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v7, "setColor:", v8);

  -[VUITextLayout setNumberOfLines:](v7, "setNumberOfLines:", 1);
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (NSString)duration
{
  return self->_duration;
}

- (VUILibraryEpisodeFrameView)imageFrameView
{
  return self->_imageFrameView;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIStackView)episodeInfoStackView
{
  return self->_episodeInfoStackView;
}

- (void)setEpisodeInfoStackView:(id)a3
{
  objc_storeStrong((id *)&self->_episodeInfoStackView, a3);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (VUILabel)releaseDateLabel
{
  return self->_releaseDateLabel;
}

- (void)setReleaseDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDateLabel, a3);
}

- (VUILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_durationLabel, a3);
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
}

- (VUILabel)dotSeparatorLabel
{
  return self->_dotSeparatorLabel;
}

- (void)setDotSeparatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dotSeparatorLabel, a3);
}

- (VUIMediaEntityAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_releaseDateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_episodeInfoStackView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_imageFrameView, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
