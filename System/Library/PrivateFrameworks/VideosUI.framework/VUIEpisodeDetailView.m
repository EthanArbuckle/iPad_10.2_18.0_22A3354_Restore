@implementation VUIEpisodeDetailView

+ (CGSize)_episodeFrameImageSizeForDetailView:(id)a3 withViewSize:(CGSize)a4
{
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a4.width;
  if (+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface", a3, a4.width, a4.height))
    v5 = width + -48.0;
  else
    v5 = width;
  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, v5, 0.0);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (void)configureEpisodeDetailView:(id)a3 withMedia:(id)a4 viewSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  VUILibraryEpisodeFrameView *v11;
  VUILibraryEpisodeFrameView *v12;
  VUITextLayout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  VUITextLayout *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  VUITextLayout *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  VUITextLayout *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  VUITextLayout *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  VUIMediaTagsViewLayout *v62;
  VUIMediaTagsView *v63;
  VUIMediaTagsView *v64;
  VUIMediaTagsViewHelper *v65;
  void *v66;
  void *v67;
  void *v68;
  VUILibraryEpisodeFrameView *v69;
  id v70;

  height = a5.height;
  width = a5.width;
  v70 = a3;
  v9 = a4;
  objc_msgSend(v70, "setMediaItem:", v9);
  objc_msgSend(v70, "imageFrameView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v70, "imageFrameView");
    v11 = (VUILibraryEpisodeFrameView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[VUILibraryEpisodeFrameView initWithFrame:]([VUILibraryEpisodeFrameView alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v12 = v11;

  objc_msgSend(a1, "_episodeFrameImageSizeForDetailView:withViewSize:", v70, width, height);
  +[VUILibraryEpisodeFrameView configureEpisodeFrameView:withMedia:layout:imageSize:](VUILibraryEpisodeFrameView, "configureEpisodeFrameView:withMedia:layout:imageSize:", v12, v9, 1);
  v69 = v12;
  objc_msgSend(v70, "setImageFrameView:", v12);
  v13 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v13, "setTextStyle:", +[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface") ^ 1);
  -[VUITextLayout setFontWeight:](v13, "setFontWeight:", 10);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v13, "setColor:", v14);

  -[VUITextLayout setNumberOfLines:](v13, "setNumberOfLines:", 2);
  objc_msgSend(v9, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "episodeTitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v15, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setEpisodeTitleLabel:", v17);

  v18 = objc_alloc_init(VUITextLayout);
  if (+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface"))
    v19 = 15;
  else
    v19 = 17;
  -[VUITextLayout setTextStyle:](v18, "setTextStyle:", v19);
  -[VUITextLayout setFontWeight:](v18, "setFontWeight:", 10);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v18, "setColor:", v20);

  -[VUITextLayout setNumberOfLines:](v18, "setNumberOfLines:", 1);
  objc_msgSend(v9, "seasonNumber");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = &unk_1EA0B9DC0;
  if (v21)
    v23 = (void *)v21;
  v24 = v23;

  v25 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:", CFSTR("SEASON_%@"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), 0, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "localizedUppercaseString");
  v29 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "seasonNumberLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)v29;
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v29, v18, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setSeasonNumberLabel:", v31);

  v32 = objc_alloc_init(VUITextLayout);
  if (+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface"))
    v33 = 15;
  else
    v33 = 17;
  -[VUITextLayout setTextStyle:](v32, "setTextStyle:", v33);
  -[VUITextLayout setFontWeight:](v32, "setFontWeight:", 10);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v32, "setColor:", v34);

  -[VUITextLayout setNumberOfLines:](v32, "setNumberOfLines:", 1);
  v35 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:", CFSTR("EPISODE_%@"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "episodeNumber");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), 0, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedUppercaseString");
  v40 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "episodeNumberLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)v40;
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v40, v32, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setEpisodeNumberLabel:", v42);

  v43 = objc_alloc_init(VUITextLayout);
  -[VUITextLayout setTextStyle:](v43, "setTextStyle:", 20);
  -[VUITextLayout setFontWeight:](v43, "setFontWeight:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v43, "setColor:", v44);

  -[VUITextLayout setNumberOfLines:](v43, "setNumberOfLines:", 1);
  objc_msgSend(v9, "releaseDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v45, 2, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "releaseDateLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v46, v43, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setReleaseDateLabel:", v48);

  }
  objc_msgSend(v9, "contentDescription");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "length");

  if (v50)
  {
    v51 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v51, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v51, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v51, "setColor:", v52);

    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setSeeMoreTextColor:](v51, "setSeeMoreTextColor:", v53);

    -[VUITextLayout setNumberOfLines:](v51, "setNumberOfLines:", 0);
    objc_msgSend(v9, "contentDescription");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "contentDescriptionView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIFocusableTextView textViewWithString:textLayout:existingTextView:](VUIFocusableTextView, "textViewWithString:textLayout:existingTextView:", v54, v51, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "contentDescription");
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v57;
    if (v57)
      v59 = (const __CFString *)v57;
    else
      v59 = &stru_1E9FF3598;
    -[VUITextLayout attributedStringWithString:](v51, "attributedStringWithString:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "setDescriptionText:", v60);
    objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", -[VUITextLayout textStyle](v51, "textStyle"), 0, 0, 0.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setContentDescriptionFont:", v61);

    objc_msgSend(v70, "setContentDescriptionView:", v56);
  }
  v62 = -[VUIMediaTagsViewLayout initWithType:]([VUIMediaTagsViewLayout alloc], "initWithType:", 7);
  v63 = [VUIMediaTagsView alloc];
  v64 = -[VUIMediaTagsView initWithFrame:layout:](v63, "initWithFrame:layout:", v62, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v65 = -[VUIMediaTagsViewHelper initWithVUIMediaItem:]([VUIMediaTagsViewHelper alloc], "initWithVUIMediaItem:", v9);
  -[VUIMediaTagsViewHelper tagsViewDictionary](v65, "tagsViewDictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView updateWithMetadata:](v64, "updateWithMetadata:", v66);

  objc_msgSend(v70, "setMediaBadgeTagsView:", v64);
}

- (VUIEpisodeDetailView)initWithFrame:(CGRect)a3
{
  VUIEpisodeDetailView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIEpisodeDetailView;
  v3 = -[VUIEpisodeDetailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIEpisodeDetailView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[VUIEpisodeDetailView setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 0);
    -[VUIEpisodeDetailView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
    -[VUIEpisodeDetailView setAlwaysBounceVertical:](v3, "setAlwaysBounceVertical:", 1);
  }
  return v3;
}

- (void)setImageFrameView:(id)a3
{
  VUILibraryEpisodeFrameView *v5;
  VUILibraryEpisodeFrameView **p_imageFrameView;
  VUILibraryEpisodeFrameView *imageFrameView;
  VUILibraryEpisodeFrameView *v8;

  v5 = (VUILibraryEpisodeFrameView *)a3;
  p_imageFrameView = &self->_imageFrameView;
  imageFrameView = self->_imageFrameView;
  if (imageFrameView != v5)
  {
    v8 = v5;
    -[VUILibraryEpisodeFrameView removeFromSuperview](imageFrameView, "removeFromSuperview");
    -[VUILibraryEpisodeFrameView setDelegate:](*p_imageFrameView, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_imageFrameView, a3);
    if (*p_imageFrameView)
    {
      -[VUILibraryEpisodeFrameView setDelegate:](*p_imageFrameView, "setDelegate:", self);
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:", *p_imageFrameView);
    }
    -[VUIEpisodeDetailView setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)setEpisodeTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *episodeTitleLabel;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  episodeTitleLabel = self->_episodeTitleLabel;
  if (episodeTitleLabel != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](episodeTitleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_episodeTitleLabel, a3);
    if (self->_episodeTitleLabel)
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
    -[VUIEpisodeDetailView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setSeasonNumberLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *seasonNumberLabel;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  seasonNumberLabel = self->_seasonNumberLabel;
  if (seasonNumberLabel != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](seasonNumberLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_seasonNumberLabel, a3);
    if (self->_seasonNumberLabel)
    {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
      -[VUIEpisodeDetailView _configureDotSeparator](self, "_configureDotSeparator");
    }
    -[VUIEpisodeDetailView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setEpisodeNumberLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *episodeNumberLabel;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  episodeNumberLabel = self->_episodeNumberLabel;
  if (episodeNumberLabel != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](episodeNumberLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_episodeNumberLabel, a3);
    if (self->_episodeNumberLabel)
    {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
      -[VUIEpisodeDetailView _configureDotSeparator](self, "_configureDotSeparator");
    }
    -[VUIEpisodeDetailView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setReleaseDateLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *releaseDateLabel;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  releaseDateLabel = self->_releaseDateLabel;
  if (releaseDateLabel != v5)
  {
    v7 = v5;
    -[VUILabel removeFromSuperview](releaseDateLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_releaseDateLabel, a3);
    if (self->_releaseDateLabel)
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
    -[VUIEpisodeDetailView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setMediaBadgeTagsView:(id)a3
{
  VUIMediaTagsView *v5;
  VUIMediaTagsView *mediaBadgeTagsView;
  VUIMediaTagsView *v7;

  v5 = (VUIMediaTagsView *)a3;
  mediaBadgeTagsView = self->_mediaBadgeTagsView;
  v7 = v5;
  if (mediaBadgeTagsView != v5)
  {
    -[VUIMediaTagsView removeFromSuperview](mediaBadgeTagsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_mediaBadgeTagsView, a3);
    if (self->_mediaBadgeTagsView)
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
  }

}

- (void)setContentDescriptionView:(id)a3
{
  VUIFocusableTextView *v5;
  VUIFocusableTextView **p_contentDescriptionView;
  VUIFocusableTextView *contentDescriptionView;
  VUIFocusableTextView *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = (VUIFocusableTextView *)a3;
  p_contentDescriptionView = &self->_contentDescriptionView;
  contentDescriptionView = self->_contentDescriptionView;
  if (contentDescriptionView != v5)
  {
    -[VUIFocusableTextView removeFromSuperview](contentDescriptionView, "removeFromSuperview");
    -[TVFocusableTextView setSelectionHandler:](*p_contentDescriptionView, "setSelectionHandler:", 0);
    objc_storeStrong((id *)&self->_contentDescriptionView, a3);
    if (*p_contentDescriptionView)
    {
      -[VUIEpisodeDetailView addSubview:](self, "addSubview:");
      objc_initWeak(&location, self);
      v8 = *p_contentDescriptionView;
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __50__VUIEpisodeDetailView_setContentDescriptionView___block_invoke;
      v12 = &unk_1E9FA1640;
      objc_copyWeak(&v13, &location);
      -[TVFocusableTextView setSelectionHandler:](v8, "setSelectionHandler:", &v9);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    -[VUIEpisodeDetailView setNeedsLayout](self, "setNeedsLayout", v9, v10, v11, v12);
  }

}

void __50__VUIEpisodeDetailView_setContentDescriptionView___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentDescriptionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMaximumNumberOfLines:", 0);

  objc_msgSend(WeakRetained, "bounds");
  objc_msgSend(WeakRetained, "sizeThatFits:", v2, v3);
  objc_msgSend(WeakRetained, "setContentSize:");
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  VUILabel *seasonNumberLabel;
  double v22;
  double v23;
  VUILabel *episodeNumberLabel;
  double v25;
  VUIMediaTagsView *mediaBadgeTagsView;
  double v27;
  double v28;
  VUILabel *v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  VUILabel *v35;
  double v36;
  double v37;
  VUILabel *dotSeparatorLabel;
  CGFloat v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat MaxX;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  VUILabel *episodeTitleLabel;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  VUILabel *v58;
  VUILabel *v59;
  _BOOL4 v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  VUILabel *releaseDateLabel;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double MaxY;
  VUILabel *v77;
  BOOL v78;
  _BOOL4 v79;
  int v80;
  double v81;
  double v82;
  double v83;
  double v84;
  VUIFocusableTextView *contentDescriptionView;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
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
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double Width;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CGFloat v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  double v146;
  CGFloat v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  CGFloat v162;
  double v163;
  CGFloat rect;
  double rect_8;
  double rect_8a;
  double rect_16;
  double rect_24;
  double v169;
  double v170;
  double v171;
  double v172;
  objc_super v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;

  v173.receiver = self;
  v173.super_class = (Class)VUIEpisodeDetailView;
  -[VUIEpisodeDetailView layoutSubviews](&v173, sel_layoutSubviews);
  -[VUIEpisodeDetailView _configureViewElementsForAX](self, "_configureViewElementsForAX");
  -[VUIEpisodeDetailView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAXEnabled");

  -[VUIEpisodeDetailView safeAreaInsets](self, "safeAreaInsets");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v8 = v7;
  v10 = v9;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  +[VUIEpisodeDetailView _episodeFrameImageSizeForDetailView:withViewSize:](VUIEpisodeDetailView, "_episodeFrameImageSizeForDetailView:withViewSize:", self, v11, v12);
  v171 = v13;
  v15 = v14;
  v16 = +[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface");
  if (v16)
    v17 = 24.0;
  else
    v17 = v6;
  rect = v17;
  if (v16)
    v18 = 24.0;
  else
    v18 = 0.0;
  if (v16)
    v19 = 24.0;
  else
    v19 = v10;
  if (v16)
    v20 = 24.0;
  else
    v20 = v8;
  seasonNumberLabel = self->_seasonNumberLabel;
  -[VUIEpisodeDetailView _seasonMargin](self, "_seasonMargin");
  -[VUILabel topMarginWithBaselineMargin:](seasonNumberLabel, "topMarginWithBaselineMargin:");
  v23 = v22;
  episodeNumberLabel = self->_episodeNumberLabel;
  -[VUIEpisodeDetailView _seasonMargin](self, "_seasonMargin");
  -[VUILabel topMarginWithBaselineMargin:](episodeNumberLabel, "topMarginWithBaselineMargin:");
  rect_8 = v25;
  mediaBadgeTagsView = self->_mediaBadgeTagsView;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  -[VUIBaseView sizeThatFits:](mediaBadgeTagsView, "sizeThatFits:", CGRectGetWidth(v174), 1.79769313e308);
  v142 = v27;
  v172 = v28;
  v29 = self->_seasonNumberLabel;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  v30 = v20 + v19;
  -[VUILabel sizeThatFits:](v29, "sizeThatFits:", CGRectGetWidth(v175) - v30, 1.79769313e308);
  v32 = v31;
  v34 = v33;
  v35 = self->_episodeNumberLabel;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  -[VUILabel sizeThatFits:](v35, "sizeThatFits:", CGRectGetWidth(v176) - v30, 1.79769313e308);
  rect_24 = v36;
  rect_16 = v37;
  dotSeparatorLabel = self->_dotSeparatorLabel;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  v160 = v30;
  v39 = CGRectGetWidth(v177) - v30;
  v40 = v15;
  -[VUILabel sizeThatFits:](dotSeparatorLabel, "sizeThatFits:", v39, 1.79769313e308);
  v42 = v41;
  v44 = v43;
  v178.origin.x = rect;
  v162 = v18;
  v178.origin.y = v18;
  v178.size.width = v171;
  v178.size.height = v40;
  v169 = v23;
  v45 = v23 + CGRectGetMaxY(v178);
  v179.origin.x = v20;
  v179.origin.y = v45;
  v179.size.width = v32;
  v179.size.height = v34;
  MaxX = CGRectGetMaxX(v179);
  v180.origin.x = v20;
  v180.origin.y = v45;
  v180.size.width = v32;
  v180.size.height = v34;
  v47 = CGRectGetMidY(v180) + v44 * -0.5;
  v145 = v32;
  v147 = v40;
  v143 = v34;
  v158 = v42;
  v159 = v44;
  v156 = MaxX;
  v157 = v45;
  v155 = v47;
  if (v4)
  {
    v181.origin.x = v20;
    v181.origin.y = v45;
    v181.size.width = v32;
    v181.size.height = v34;
    v48 = v169 + CGRectGetMaxY(v181);
    v49 = v20;
  }
  else
  {
    v50 = MaxX;
    v51 = v42;
    v52 = v44;
    v49 = CGRectGetMaxX(*(CGRect *)(&v47 - 1));
    v182.origin.y = v162;
    v182.origin.x = rect;
    v182.size.width = v171;
    v182.size.height = v40;
    v48 = rect_8 + CGRectGetMaxY(v182);
  }
  episodeTitleLabel = self->_episodeTitleLabel;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  -[VUILabel sizeThatFits:](episodeTitleLabel, "sizeThatFits:", CGRectGetWidth(v183) - v160, 1.79769313e308);
  v55 = v54;
  v57 = v56;
  v58 = self->_episodeTitleLabel;
  v59 = self->_episodeNumberLabel;
  v60 = +[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface");
  v61 = 32.0;
  if (v60)
    v61 = 40.0;
  -[VUILabel topMarginToLabel:withBaselineMargin:](v58, "topMarginToLabel:withBaselineMargin:", v59, v61);
  v63 = v62;
  v153 = v48;
  v154 = v49;
  v184.origin.x = v49;
  v184.origin.y = v48;
  v184.size.width = rect_24;
  v184.size.height = rect_16;
  v64 = v63 + CGRectGetMaxY(v184);
  releaseDateLabel = self->_releaseDateLabel;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  -[VUILabel sizeThatFits:](releaseDateLabel, "sizeThatFits:", CGRectGetWidth(v185) - v160, 1.79769313e308);
  v67 = v66;
  v69 = v68;
  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_releaseDateLabel, "topMarginToLabel:withBaselineMargin:", self->_episodeTitleLabel, 28.0);
  v71 = v70;
  v186.origin.x = v20;
  v186.origin.y = v64;
  v186.size.width = v55;
  v186.size.height = v57;
  v72 = v71 + CGRectGetMaxY(v186);
  -[VUILabel bottomMarginWithBaselineMargin:](self->_episodeTitleLabel, "bottomMarginWithBaselineMargin:", 28.0);
  v74 = v73 - v172;
  v187.origin.x = v20;
  v187.origin.y = v72;
  v170 = v67;
  v187.size.width = v67;
  v187.size.height = v69;
  v75 = CGRectGetMaxX(v187) + 5.0;
  v188.origin.x = v20;
  v151 = v57;
  v152 = v64;
  v188.origin.y = v64;
  v188.size.width = v55;
  v188.size.height = v57;
  MaxY = CGRectGetMaxY(v188);
  v77 = self->_releaseDateLabel;
  v78 = v77 == 0;
  v79 = v77 != 0;
  if (v78)
    v80 = 0;
  else
    v80 = v4;
  if ((v79 & ~v4) != 0)
    v81 = v75;
  else
    v81 = v20;
  if (v80 == 1)
  {
    v189.origin.x = v20;
    v189.origin.y = v72;
    v189.size.width = v170;
    v189.size.height = v69;
    MaxY = CGRectGetMaxY(v189);
    rect_8a = v20;
  }
  else
  {
    rect_8a = v81;
  }
  v82 = v142;
  v83 = v72;
  v84 = v74 + MaxY;
  contentDescriptionView = self->_contentDescriptionView;
  -[VUIEpisodeDetailView bounds](self, "bounds");
  -[TVFocusableTextView sizeThatFits:](contentDescriptionView, "sizeThatFits:", CGRectGetWidth(v190) - v160, 1.79769313e308);
  v141 = v86;
  v161 = v87;
  -[VUILabel font](self->_releaseDateLabel, "font");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailView _descriptionTopMarginWithBaselineMargin:otherFont:](self, "_descriptionTopMarginWithBaselineMargin:otherFont:", v88, 28.0);
  v90 = v89;

  v191.origin.x = v20;
  v191.origin.y = v72;
  v191.size.width = v170;
  v191.size.height = v69;
  v91 = CGRectGetMaxY(v191);
  if (!self->_releaseDateLabel || (v92 = v90 + v91, v4) && self->_mediaBadgeTagsView)
  {
    -[VUIEpisodeDetailView _descriptionTopMarginWithBaselineMargin:otherFont:](self, "_descriptionTopMarginWithBaselineMargin:otherFont:", 0, 28.0);
    v94 = v93;
    v192.origin.x = rect_8a;
    v192.origin.y = v84;
    v192.size.width = v142;
    v192.size.height = v172;
    v92 = v94 + CGRectGetMaxY(v192);
  }
  v149 = v84;
  v150 = v69;
  if (-[VUIEpisodeDetailView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[VUIEpisodeDetailView bounds](self, "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v96 = v95;
    v163 = v97;
    v171 = v98;
    v148 = v99;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v140 = v100;
    v157 = v101;
    v144 = v103;
    v146 = v102;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v155 = v105;
    v156 = v104;
    v158 = v106;
    v159 = v107;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v153 = v109;
    v154 = v108;
    rect_24 = v110;
    rect_16 = v111;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v139 = v112;
    v151 = v114;
    v152 = v113;
    v116 = v115;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v137 = v118;
    v138 = v117;
    v170 = v119;
    v150 = v120;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    rect_8a = v121;
    v149 = v122;
    v172 = v123;
    v82 = v124;
    v126 = v144;
    v125 = v146;
    v55 = v116;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v20 = v127;
    v128 = v96;
    v92 = v129;
    v130 = v163;
    v132 = v131;
    v134 = v133;
    v135 = v148;
  }
  else
  {
    v138 = v20;
    v139 = v20;
    v140 = v20;
    v125 = v145;
    v135 = v147;
    v130 = v162;
    v128 = rect;
    v126 = v143;
    v137 = v83;
    v134 = v161;
    v132 = v141;
  }
  -[VUILibraryEpisodeFrameView setFrame:](self->_imageFrameView, "setFrame:", v128, v130, v171, v135);
  -[VUILabel setFrame:](self->_seasonNumberLabel, "setFrame:", v140, v157, v125, v126);
  -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v156, v155, v158, v159);
  -[VUILabel setFrame:](self->_episodeNumberLabel, "setFrame:", v154, v153, rect_24, rect_16);
  -[VUILabel setFrame:](self->_episodeTitleLabel, "setFrame:", v139, v152, v55, v151);
  -[VUILabel setFrame:](self->_releaseDateLabel, "setFrame:", v138, v137, v170, v150);
  -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", rect_8a, v149, v82, v172);
  -[TVFocusableTextView setFrame:](self->_contentDescriptionView, "setFrame:", v20, v92, v132, v134);
  -[VUIEpisodeDetailView bounds](self, "bounds");
  Width = CGRectGetWidth(v193);
  v194.origin.x = v20;
  v194.origin.y = v92;
  v194.size.width = v132;
  v194.size.height = v134;
  -[VUIEpisodeDetailView setContentSize:](self, "setContentSize:", Width, CGRectGetMaxY(v194));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  VUILabel *seasonNumberLabel;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  VUILabel *episodeNumberLabel;
  double v21;
  double v22;
  double v23;
  VUILabel *episodeTitleLabel;
  VUILabel *v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v7 = v6;
  v9 = v8;
  +[VUIEpisodeDetailView _episodeFrameImageSizeForDetailView:withViewSize:](VUIEpisodeDetailView, "_episodeFrameImageSizeForDetailView:withViewSize:", self, width, height);
  v11 = v10 + 0.0;
  seasonNumberLabel = self->_seasonNumberLabel;
  -[VUIEpisodeDetailView _seasonMargin](self, "_seasonMargin");
  -[VUILabel topMarginWithBaselineMargin:](seasonNumberLabel, "topMarginWithBaselineMargin:");
  v14 = v11 + v13;
  v15 = width - (v7 + v9);
  -[VUILabel sizeThatFits:](self->_seasonNumberLabel, "sizeThatFits:", v15, 1.79769313e308);
  v17 = v14 + v16;
  -[VUIEpisodeDetailView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isAXEnabled");

  if (v19)
  {
    episodeNumberLabel = self->_episodeNumberLabel;
    -[VUIEpisodeDetailView _seasonMargin](self, "_seasonMargin");
    -[VUILabel topMarginWithBaselineMargin:](episodeNumberLabel, "topMarginWithBaselineMargin:");
    v22 = v17 + v21;
    -[VUILabel sizeThatFits:](self->_episodeNumberLabel, "sizeThatFits:", v15, 1.79769313e308);
    v17 = v22 + v23;
  }
  episodeTitleLabel = self->_episodeTitleLabel;
  v25 = self->_seasonNumberLabel;
  v26 = +[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface");
  v27 = 32.0;
  if (v26)
    v27 = 40.0;
  -[VUILabel topMarginToLabel:withBaselineMargin:](episodeTitleLabel, "topMarginToLabel:withBaselineMargin:", v25, v27);
  v29 = v17 + v28;
  -[VUILabel sizeThatFits:](self->_episodeTitleLabel, "sizeThatFits:", v15, 1.79769313e308);
  v31 = v29 + v30;
  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_releaseDateLabel, "topMarginToLabel:withBaselineMargin:", self->_episodeTitleLabel, 28.0);
  v33 = v31 + v32;
  -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v15, 1.79769313e308);
  v35 = v33 + v34;
  -[VUILabel font](self->_releaseDateLabel, "font");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailView _descriptionTopMarginWithBaselineMargin:otherFont:](self, "_descriptionTopMarginWithBaselineMargin:otherFont:", v36, 28.0);
  v38 = v35 + v37;

  -[TVFocusableTextView sizeThatFits:](self->_contentDescriptionView, "sizeThatFits:", v15, 1.79769313e308);
  v40 = v38 + v39;
  if (+[VUIUtilities isIpadInterface](VUIUtilities, "isIpadInterface"))
    v41 = v40 + 48.0;
  else
    v41 = v40;
  v42 = width;
  result.height = v41;
  result.width = v42;
  return result;
}

- (void)updateProgress
{
  void *v3;
  id v4;

  -[VUIEpisodeDetailView imageFrameView](self, "imageFrameView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailView mediaItem](self, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateProgress:", v3);

}

- (void)_configureDotSeparator
{
  VUITextLayout *v3;
  void *v4;
  VUILabel *v5;
  VUILabel *dotSeparatorLabel;
  id v7;

  if (self->_seasonNumberLabel)
  {
    if (self->_episodeNumberLabel)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@ "), CFSTR("·"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v3 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v3, "setTextStyle:", 21);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v3, "setColor:", v4);

      -[VUITextLayout setNumberOfLines:](v3, "setNumberOfLines:", 1);
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v7, v3, self->_dotSeparatorLabel);
      v5 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      dotSeparatorLabel = self->_dotSeparatorLabel;
      self->_dotSeparatorLabel = v5;

      -[VUIEpisodeDetailView addSubview:](self, "addSubview:", self->_dotSeparatorLabel);
    }
  }
}

- (double)_descriptionTopMarginWithBaselineMargin:(double)a3 otherFont:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a4;
  -[VUIEpisodeDetailView contentDescriptionFont](self, "contentDescriptionFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "topMarginToFont:withBaselineMargin:traitCollection:", v6, v8, a3);
  else
    objc_msgSend(v7, "topMarginWithBaselineMargin:traitCollection:", v8, a3);
  v10 = v9;

  return v10;
}

- (double)_descriptionBottomMarginWithBaselineMargin:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[VUIEpisodeDetailView contentDescriptionFont](self, "contentDescriptionFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIEpisodeDetailView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomMarginWithBaselineMargin:traitCollection:", v6, a3);
  v8 = v7;

  return v8;
}

- (void)didTapButtonForEpisodeFrameView:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_episodeViewDelegate);
  objc_msgSend(WeakRetained, "didTapPlay");

}

- (void)_configureViewElementsForAX
{
  void *v3;
  uint64_t v4;
  id v5;

  -[VUIEpisodeDetailView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAXEnabled");

  -[VUIEpisodeDetailView dotSeparatorLabel](self, "dotSeparatorLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (double)_seasonMargin
{
  void *v2;
  uint64_t v3;
  double result;

  -[VUIEpisodeDetailView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 15.0;
  if (!v3)
    result = 20.0;
  if (v3 == 1)
    return 24.0;
  return result;
}

- (VUIEpisodeDetailViewDelegate)episodeViewDelegate
{
  return (VUIEpisodeDetailViewDelegate *)objc_loadWeakRetained((id *)&self->_episodeViewDelegate);
}

- (void)setEpisodeViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_episodeViewDelegate, a3);
}

- (VUILibraryEpisodeFrameView)imageFrameView
{
  return self->_imageFrameView;
}

- (VUILabel)episodeTitleLabel
{
  return self->_episodeTitleLabel;
}

- (VUILabel)seasonNumberLabel
{
  return self->_seasonNumberLabel;
}

- (VUILabel)episodeNumberLabel
{
  return self->_episodeNumberLabel;
}

- (VUILabel)releaseDateLabel
{
  return self->_releaseDateLabel;
}

- (VUILabel)dotSeparatorLabel
{
  return self->_dotSeparatorLabel;
}

- (void)setDotSeparatorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dotSeparatorLabel, a3);
}

- (VUIFocusableTextView)contentDescriptionView
{
  return self->_contentDescriptionView;
}

- (UIFont)contentDescriptionFont
{
  return self->_contentDescriptionFont;
}

- (void)setContentDescriptionFont:(id)a3
{
  objc_storeStrong((id *)&self->_contentDescriptionFont, a3);
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (VUIMediaTagsView)mediaBadgeTagsView
{
  return self->_mediaBadgeTagsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaBadgeTagsView, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_contentDescriptionFont, 0);
  objc_storeStrong((id *)&self->_contentDescriptionView, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_releaseDateLabel, 0);
  objc_storeStrong((id *)&self->_episodeNumberLabel, 0);
  objc_storeStrong((id *)&self->_seasonNumberLabel, 0);
  objc_storeStrong((id *)&self->_episodeTitleLabel, 0);
  objc_storeStrong((id *)&self->_imageFrameView, 0);
  objc_destroyWeak((id *)&self->_episodeViewDelegate);
}

@end
