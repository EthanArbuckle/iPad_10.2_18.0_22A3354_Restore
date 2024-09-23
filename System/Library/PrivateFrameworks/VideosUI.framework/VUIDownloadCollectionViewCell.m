@implementation VUIDownloadCollectionViewCell

+ (void)configureVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4 width:(double)a5 forMetrics:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  VUITextLayout *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a4;
  objc_msgSend(v20, "setDownloadEntity:", v9);
  objc_msgSend(v9, "mediaEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setImageAspectRatio:", 0.5625);
  if (!a6)
  {
    +[VUILibraryLockupViewCell configureImageViewArtworkForLockupCell:withMedia:width:](VUILibraryLockupViewCell, "configureImageViewArtworkForLockupCell:withMedia:width:", v20, v11, a5);
    objc_msgSend(v9, "setDelegate:", v20);
  }
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v13, "setTextStyle:", 14);
    -[VUITextLayout setFontWeight:](v13, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v13, "setColor:", v14);

    -[VUITextLayout setNumberOfLines:](v13, "setNumberOfLines:", 2);
    objc_msgSend(v9, "title");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = &stru_1E9FF3598;
    objc_msgSend(v20, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v17, v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v20, "setTitleLabel:", v19);
  if (objc_msgSend(v9, "downloadType"))
  {
    if (objc_msgSend(v9, "downloadType") == 1 || objc_msgSend(v9, "downloadType") == 2)
      +[VUIDownloadCollectionViewCell _showConfigurationForVUIDownloadEntityCollectionViewCell:withDownloadEntity:](VUIDownloadCollectionViewCell, "_showConfigurationForVUIDownloadEntityCollectionViewCell:withDownloadEntity:", v20, v9);
  }
  else
  {
    +[VUIDownloadCollectionViewCell _movieConfigurationForVUIDownloadEntityCollectionViewCell:withDownloadEntity:](VUIDownloadCollectionViewCell, "_movieConfigurationForVUIDownloadEntityCollectionViewCell:withDownloadEntity:", v20, v9);
  }

}

+ (void)_movieConfigurationForVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_addMetaDataLabelsIfRequired:", v5);
  objc_msgSend(v5, "mediaEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_addDownloadButtonIfRequired:", v8);
}

+ (void)_showConfigurationForVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[VUIDownloadCollectionViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadCollectionViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetaDataHeaderFirstLabel:", v6);

}

+ (id)_generateMetaDataHeaderFirstLabelForDownloadEntity:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  VUITextLayout *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "numberOfMediaItemsDownloading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v6 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 < 1)
  {
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("NUMBER_OF_EPISODES"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberOfMediaItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%d"), 0, objc_msgSend(v14, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v12, "setTextStyle:", 16);
    -[VUITextLayout setFontWeight:](v12, "setFontWeight:", 10);
    -[VUITextLayout setNumberOfLines:](v12, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  }
  else
  {
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("DOWNLOADING_NUMBER_OF_EPISODES"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberOfMediaItemsDownloading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%d"), 0, objc_msgSend(v10, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v12, "setTextStyle:", 16);
    -[VUITextLayout setFontWeight:](v12, "setFontWeight:", 10);
    -[VUITextLayout setNumberOfLines:](v12, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v12, "setColor:", v15);

  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v11, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  -[VUIDownloadCollectionViewCell _updateViewForEditState](self, "_updateViewForEditState");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadCollectionViewCell;
  -[VUIDownloadCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  if (self->_editing)
    -[VUIDownloadCollectionViewCell _updateViewForEditState](self, "_updateViewForEditState");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadCollectionViewCell;
  -[VUIDownloadCollectionViewCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  if (self->_editing)
    -[VUIDownloadCollectionViewCell _updateViewForEditState](self, "_updateViewForEditState");
}

- (void)setMetaDataHeaderFirstLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_metaDataHeaderFirstLabel;
  VUILabel *metaDataHeaderFirstLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_metaDataHeaderFirstLabel = &self->_metaDataHeaderFirstLabel;
  metaDataHeaderFirstLabel = self->_metaDataHeaderFirstLabel;
  if (metaDataHeaderFirstLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](metaDataHeaderFirstLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, a3);
    if (*p_metaDataHeaderFirstLabel)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_metaDataHeaderFirstLabel);

    }
    -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setMetaDataHeaderSecondLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_metaDataHeaderSecondLabel;
  VUILabel *metaDataHeaderSecondLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_metaDataHeaderSecondLabel = &self->_metaDataHeaderSecondLabel;
  metaDataHeaderSecondLabel = self->_metaDataHeaderSecondLabel;
  if (metaDataHeaderSecondLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](metaDataHeaderSecondLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, a3);
    if (*p_metaDataHeaderSecondLabel)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_metaDataHeaderSecondLabel);

    }
    -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setDotSeparatorLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_dotSeparatorLabel;
  VUILabel *dotSeparatorLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_dotSeparatorLabel = &self->_dotSeparatorLabel;
  dotSeparatorLabel = self->_dotSeparatorLabel;
  if (dotSeparatorLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](dotSeparatorLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_dotSeparatorLabel, a3);
    if (*p_dotSeparatorLabel)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_dotSeparatorLabel);

    }
    -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setEditImageView:(id)a3
{
  UIImageView *v5;
  UIImageView **p_editImageView;
  UIImageView *editImageView;
  void *v8;
  UIImageView *v9;

  v5 = (UIImageView *)a3;
  p_editImageView = &self->_editImageView;
  editImageView = self->_editImageView;
  if (editImageView != v5)
  {
    v9 = v5;
    -[UIImageView removeFromSuperview](editImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_editImageView, a3);
    if (*p_editImageView)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_editImageView);

    }
    -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setDownloadButton:(id)a3
{
  VUIDownloadButton *v5;
  VUIDownloadButton *downloadButton;
  void *v7;
  VUIDownloadButton *v8;

  v5 = (VUIDownloadButton *)a3;
  downloadButton = self->_downloadButton;
  if (downloadButton != v5)
  {
    v8 = v5;
    if (downloadButton)
      -[VUIDownloadButton removeFromSuperview](downloadButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_downloadButton, a3);
    if (v8)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

    }
    -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v8;
  }

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadCollectionViewCell;
  -[VUILibraryLockupViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[VUIDownloadCollectionViewCell downloadEntity](self, "downloadEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[VUIDownloadCollectionViewCell setDownloadEntity:](self, "setDownloadEntity:", 0);
  -[VUIDownloadCollectionViewCell setEditImageView:](self, "setEditImageView:", 0);
  -[VUIDownloadCollectionViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", 0);
  -[VUIDownloadCollectionViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
  -[VUIDownloadCollectionViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", 0);
  -[VUILibraryLockupViewCell setTitleLabel:](self, "setTitleLabel:", 0);
  -[VUIDownloadCollectionViewCell setDownloadButton:](self, "setDownloadButton:", 0);
  -[VUIDownloadCollectionViewCell setPreviousDownloadState:](self, "setPreviousDownloadState:", 0);
  -[VUIDownloadCollectionViewCell setEditing:](self, "setEditing:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIDownloadCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadCollectionViewCell;
  -[VUILibraryLockupViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[VUIDownloadCollectionViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[VUIDownloadCollectionViewCell bounds](self, "bounds");
  -[VUIDownloadCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (void)downloadEntity:(id)a3 numberOfItemsDownloadingDidChange:(id)a4
{
  id v5;

  +[VUIDownloadCollectionViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadCollectionViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v5);
  -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)downloadEntity:(id)a3 numberOfItemsDidChange:(unint64_t)a4
{
  id v5;

  +[VUIDownloadCollectionViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadCollectionViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadCollectionViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v5);
  -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  int v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[VUIDownloadCollectionViewCell _configureViewElementsForAX](self, "_configureViewElementsForAX");
  -[VUIDownloadCollectionViewCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAXEnabled");

  if (v9)
    -[VUIDownloadCollectionViewCell _layoutForAccessibility:metricsOnly:](self, "_layoutForAccessibility:metricsOnly:", v4, width, height);
  else
    -[VUIDownloadCollectionViewCell _layoutForCompact:metricsOnly:](self, "_layoutForCompact:metricsOnly:", v4, width, height);
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  _BOOL4 v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double MaxY;
  void *v52;
  _BOOL4 v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double MaxX;
  double v66;
  uint64_t v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  CGFloat v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  _BOOL4 editing;
  void *v81;
  _BOOL4 v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
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
  void *v119;
  void *v120;
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
  CGFloat v133;
  double v134;
  double v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double y;
  double v148;
  double v149;
  double v150;
  double v151;
  double rect;
  double recta;
  double v154;
  CGFloat v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  CGSize result;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;

  height = a3.height;
  width = a3.width;
  -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VUIDownloadButton sizeToFit](self->_downloadButton, "sizeToFit");
    -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v10 = CGRectGetWidth(v167);

    -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v140 = CGRectGetHeight(v168);

    v12 = v10;
  }
  else
  {
    -[VUIDownloadCollectionViewCell editImageView](self, "editImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v140 = 0.0;
    if (v13)
      v10 = 22.0;
    else
      v10 = 0.0;
    v12 = 0.0;
  }
  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", width - v10, height);
  v163 = v15;
  v17 = v16;

  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topMarginWithBaselineMargin:", 24.0);
  v20 = v19;

  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", width, height);
  v157 = v21;
  rect = v22;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", width, height);
  v159 = v23;
  v145 = v24;
  -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", width, height);
  v149 = v25;
  v138 = v26;
  -[VUILabel topMarginWithBaselineMargin:](self->_metaDataHeaderFirstLabel, "topMarginWithBaselineMargin:", 20.0);
  v28 = v27;
  -[VUILabel topMarginWithBaselineMargin:](self->_metaDataHeaderSecondLabel, "topMarginWithBaselineMargin:", 20.0);
  v30 = v29;
  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topMarginToLabel:withBaselineMargin:", v33, 20.0);
    v154 = v34;

    -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topMarginToLabel:withBaselineMargin:", v36, 20.0);
    v161 = v37;

  }
  else
  {
    v154 = v28;
    v161 = v30;
  }
  v38 = v12 + v157 + v159;
  -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v149 + 12.0;
    if (!v41)
      v42 = -0.0;
    v38 = v38 + v42;
  }
  v43 = ceil(width * 0.5625);
  -[VUIDownloadCollectionViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setHidden:", v38 > width);

  v45 = -[VUIDownloadCollectionViewCell _hasSecondaryLabel](self, "_hasSecondaryLabel");
  v46 = v43;
  if (v45)
  {
    v47 = rect + v154;
    if (rect + v154 < v145 + v161)
      v47 = v145 + v161;
    if (v38 > width)
      v47 = v145 + v161 + rect + v154;
    v46 = v43 + v47;
  }
  v151 = v46;
  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    v128 = v12;
    v130 = v38;
    v132 = v20;
    v133 = v17;
    v49 = *MEMORY[0x1E0C9D648];
    v50 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v164 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v165 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v169.origin.x = 0.0;
    v169.origin.y = 0.0;
    v169.size.width = width;
    v169.size.height = v43;
    MaxY = CGRectGetMaxY(v169);
    -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v170.origin.y = v20 + MaxY;
      v170.origin.x = 0.0;
      v144 = v20 + MaxY;
      v170.size.width = v163;
      v170.size.height = v133;
      v126 = CGRectGetMaxY(v170);
      v143 = v133;
      v142 = 0.0;
    }
    else
    {
      v126 = MaxY;
      v143 = v165;
      v163 = v50;
      v144 = v164;
      v142 = v49;
    }
    v53 = -[VUIDownloadCollectionViewCell _hasSecondaryLabel](self, "_hasSecondaryLabel");
    v54 = v165;
    v55 = v50;
    v56 = v164;
    v57 = v49;
    v58 = v165;
    v59 = v50;
    v60 = v164;
    y = v164;
    v148 = v49;
    v61 = v165;
    v62 = v50;
    v63 = v49;
    if (v53)
    {
      -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        v171.origin.y = v154 + v126;
        v171.origin.x = 0.0;
        v155 = 0.0;
        y = v171.origin.y;
        v171.size.width = v157;
        v171.size.height = rect;
        MaxX = CGRectGetMaxX(v171);
      }
      else
      {
        MaxX = 0.0;
        rect = v165;
        v157 = v50;
        y = v164;
        v155 = v49;
      }
      v66 = v130;
      -[VUIDownloadCollectionViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
      v67 = objc_claimAutoreleasedReturnValue();
      if (v67
        && (v68 = (void *)v67,
            -[VUIDownloadCollectionViewCell dotSeparatorLabel](self, "dotSeparatorLabel"),
            v69 = (void *)objc_claimAutoreleasedReturnValue(),
            v70 = objc_msgSend(v69, "isHidden"),
            v69,
            v68,
            (v70 & 1) == 0))
      {
        v57 = MaxX + 6.0;
        v172.origin.x = v155;
        v172.size.width = v157;
        v172.origin.y = y;
        v172.size.height = rect;
        v173.origin.y = CGRectGetMidY(v172) + v138 * -0.5;
        v173.origin.x = v57;
        v136 = v173.origin.y;
        v173.size.width = v149;
        v173.size.height = v138;
        v148 = CGRectGetMaxX(v173) + 6.0;
        v134 = v138;
        v66 = v130;
      }
      else
      {
        v148 = MaxX;
        v134 = v165;
        v149 = v50;
        v136 = v164;
        v57 = v49;
      }
      -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        if (v66 <= width)
        {
          v61 = rect;
          v63 = v155;
          v62 = v157;
          v54 = v134;
          v56 = v136;
          v55 = v149;
          v74 = v126;
        }
        else
        {
          -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72)
          {
            v61 = rect;
            v63 = v155;
            v174.origin.x = v155;
            v174.origin.y = y;
            v174.size.width = v157;
            v174.size.height = rect;
            v73 = CGRectGetMaxY(v174);
            v62 = v157;
            v74 = v73;
            v148 = 0.0;
          }
          else
          {
            v74 = v161 + v126;
            v148 = 0.0;
            v61 = rect;
            v63 = v155;
            v62 = v157;
          }
          v54 = v134;
          v56 = v136;
          v55 = v149;
        }
        v59 = v159;
        v60 = v161 + v74;
        v58 = v145;
      }
      else
      {
        v60 = v164;
        v58 = v165;
        v59 = v50;
        v148 = v49;
        v61 = rect;
        v63 = v155;
        v62 = v157;
        v54 = v134;
        v56 = v136;
        v55 = v149;
      }
    }
    v146 = v59;
    v160 = v60;
    v162 = v58;
    v150 = v55;
    v135 = v54;
    v137 = v56;
    v156 = v63;
    v158 = v62;
    recta = v61;
    -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v164;
    v77 = v165;
    v78 = v50;
    v79 = v49;
    if (v75)
    {
      editing = self->_editing;

      v79 = width - v128;
      v76 = v43 + ceil((height - v43) * 0.5) - v140 * 0.5;
      v77 = editing ? v165 : v140;
      v78 = editing ? v50 : v128;
      if (editing)
      {
        v76 = v164;
        v79 = v49;
      }
    }
    v139 = v79;
    v141 = v76;
    -[VUIDownloadCollectionViewCell editImageView](self, "editImageView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v81)
    {
      v82 = self->_editing;

      v83 = v43 + ceil((height - v43) * 0.5) + -11.0;
      v84 = v165;
      if (v82)
      {
        v84 = 22.0;
        v50 = 22.0;
      }
      v85 = v164;
      if (v82)
        v85 = v83;
      v164 = v85;
      v165 = v84;
      if (v82)
        v49 = width + -22.0;
    }
    v86 = 0.0;
    if (-[VUIDownloadCollectionViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "bounds");

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v129 = v88;
      v131 = v89;
      v91 = v90;
      v124 = v92;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v142 = v93;
      v144 = v94;
      v163 = v95;
      v143 = v96;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v156 = v97;
      v158 = v98;
      y = v99;
      recta = v100;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v148 = v101;
      v160 = v102;
      v146 = v103;
      v162 = v104;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v139 = v105;
      v141 = v106;
      v125 = v108;
      v127 = v107;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v110 = v109;
      v150 = v111;
      v113 = v112;
      v86 = v91;
      v57 = v114;
      v43 = v124;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v49 = v115;
      v164 = v116;
      v165 = v117;
      v50 = v118;
    }
    else
    {
      v129 = 0.0;
      v131 = width;
      v125 = v77;
      v127 = v78;
      v113 = v135;
      v110 = v137;
    }
    -[VUILibraryLockupViewCell imageView](self, "imageView", *(_QWORD *)&v124);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setFrame:", v129, v86, v131, v43);

    -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setFrame:", v142, v144, v163, v143);

    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v156, y, v158, recta);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v148, v160, v146, v162);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v139, v141, v127, v125);
    -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v57, v110, v150, v113);
    -[UIImageView setFrame:](self->_editImageView, "setFrame:", v49, v164, v50, v165);
    v20 = v132;
    v17 = v133;
  }
  v121 = v17 + v20;
  if (!v48)
    v121 = -0.0;
  v122 = v151 + v121;
  v123 = width;
  result.height = v122;
  result.width = v123;
  return result;
}

- (CGSize)_layoutForAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MaxY;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 editing;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
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
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
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
  CGFloat v114;
  double v115;
  double v116;
  double v117;
  CGSize result;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  height = a3.height;
  width = a3.width;
  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v114 = v9;
  v11 = v10;

  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topMarginWithBaselineMargin:", 24.0);
  v14 = v13;

  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", width, height);
  v116 = v15;
  v17 = v16;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", width, height);
  v117 = v18;
  v20 = v19;
  -[VUILabel topMarginWithBaselineMargin:](self->_metaDataHeaderFirstLabel, "topMarginWithBaselineMargin:", 20.0);
  v22 = v21;
  -[VUILabel topMarginWithBaselineMargin:](self->_metaDataHeaderSecondLabel, "topMarginWithBaselineMargin:", 20.0);
  v24 = v23;
  -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    -[VUIDownloadButton sizeToFit](self->_downloadButton, "sizeToFit");
  v26 = ceil(width * 0.5625);
  if (!a4)
  {
    v92 = v22;
    v93 = v24;
    v94 = v17;
    v95 = v20;
    v96 = v14;
    v27 = *MEMORY[0x1E0C9D648];
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v119.origin.x = 0.0;
    v119.origin.y = 0.0;
    v119.size.width = width;
    v119.size.height = v26;
    MaxY = CGRectGetMaxY(v119);
    -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v112 = v26;
    v105 = v27;
    if (v32)
    {
      v33 = v96 + MaxY;
      v120.origin.x = 0.0;
      v120.origin.y = v96 + MaxY;
      v34 = v114;
      v120.size.width = v114;
      v120.size.height = v11;
      MaxY = CGRectGetMaxY(v120);
      v104 = v11;
      v35 = 0.0;
    }
    else
    {
      v104 = v29;
      v34 = v30;
      v35 = v27;
      v33 = v28;
    }
    v103 = v35;
    -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = v33;
    if (v36)
    {
      v121.origin.y = v92 + MaxY;
      v121.origin.x = 0.0;
      v101 = 0.0;
      v102 = v92 + MaxY;
      v121.size.width = v116;
      v121.size.height = v94;
      MaxY = CGRectGetMaxY(v121);
      v100 = v94;
    }
    else
    {
      v100 = v29;
      v116 = v30;
      v101 = v105;
      v102 = v28;
    }
    -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v122.origin.y = v93 + MaxY;
      v122.origin.x = 0.0;
      v98 = 0.0;
      v99 = v93 + MaxY;
      v122.size.width = v117;
      v122.size.height = v95;
      MaxY = CGRectGetMaxY(v122);
      v97 = v95;
    }
    else
    {
      v97 = v29;
      v117 = v30;
      v98 = v105;
      v99 = v28;
    }
    v91 = v11;
    -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v29;
    v113 = v30;
    v40 = v28;
    v41 = v105;
    if (v38)
    {
      editing = self->_editing;

      v39 = v29;
      v113 = v30;
      v40 = v28;
      v41 = v105;
      if (!editing)
      {
        -[VUIDownloadButton frame](self->_downloadButton, "frame", v29, v105, v28);
        v113 = CGRectGetWidth(v123);
        -[VUIDownloadButton frame](self->_downloadButton, "frame");
        v39 = CGRectGetHeight(v124);
        v41 = 0.0;
        v40 = MaxY;
      }
    }
    v109 = v40;
    v110 = v41;
    v90 = v39;
    -[VUIDownloadCollectionViewCell editImageView](self, "editImageView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0.0;
    if (v43)
    {
      v29 = 22.0;
      v45 = 22.0;
    }
    else
    {
      v45 = v30;
    }
    if (v43)
      v46 = MaxY;
    else
      v46 = v28;
    v107 = v46;
    v108 = v45;
    if (v43)
      v47 = 0.0;
    else
      v47 = v105;
    v106 = v47;
    if (-[VUIDownloadCollectionViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[VUIDownloadCollectionViewCell contentView](self, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bounds");

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v87 = v49;
      v88 = v50;
      v44 = v51;
      v89 = v52;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v103 = v53;
      v111 = v54;
      v115 = v55;
      v104 = v56;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v101 = v57;
      v102 = v58;
      v116 = v59;
      v100 = v60;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v98 = v61;
      v99 = v62;
      v117 = v63;
      v97 = v64;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v109 = v66;
      v110 = v65;
      v113 = v67;
      v69 = v68;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v106 = v70;
      v107 = v71;
      v108 = v72;
      v20 = v95;
      v14 = v96;
      v24 = v93;
      v17 = v94;
      v22 = v92;
      -[VUILibraryLockupViewCell imageView](self, "imageView", v73);
    }
    else
    {
      v88 = width;
      v89 = v112;
      v86 = v29;
      v87 = 0.0;
      v20 = v95;
      v14 = v96;
      v24 = v93;
      v17 = v94;
      v22 = v92;
      v115 = v34;
      v69 = v90;
      -[VUILibraryLockupViewCell imageView](self, "imageView", *(_QWORD *)&v86);
    }
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", v87, v44, v88, v89);

    -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFrame:", v103, v111, v115, v104);

    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v101, v102, v116, v100);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v98, v99, v117, v97);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v110, v109, v113, v69);
    -[UIImageView setFrame:](self->_editImageView, "setFrame:", v106, v107, v108, v85);
    v11 = v91;
    v26 = v112;
  }
  -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
    v77 = v17 + v26 + v22;
  else
    v77 = v26;
  -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
    v77 = v20 + v24 + v77;
  -[VUILibraryLockupViewCell titleLabel](self, "titleLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
    v77 = v11 + v14 + v77;
  -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    v81 = self->_editing;

    if (!v81)
    {
      -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "frame");
      v77 = v77 + CGRectGetHeight(v125);

    }
  }
  v83 = width;
  v84 = v77;
  result.height = v84;
  result.width = v83;
  return result;
}

- (void)_addMetaDataLabelsIfRequired:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUITextLayout *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  VUITextLayout *v21;
  void *v22;
  void *v23;
  void *v24;
  VUITextLayout *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  objc_msgSend(v29, "mediaEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v6 = v5;
  objc_msgSend(v6, "rentalExpirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadExpirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availabilityEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIRentalExpirationLabel labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:](VUIRentalExpirationLabel, "labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:", v7, v8, v9, objc_msgSend(v11, "status"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_4:
    objc_msgSend(v29, "releaseYear");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v14 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v14, "setTextStyle:", 16);
      -[VUITextLayout setFontWeight:](v14, "setFontWeight:", 10);
      -[VUITextLayout setNumberOfLines:](v14, "setNumberOfLines:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v14, "setColor:", v15);

      -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v12, v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    -[VUIDownloadCollectionViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v17);
    objc_msgSend(v29, "duration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0DC6B40]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transformedValue:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v21, "setTextStyle:", 16);
      -[VUITextLayout setFontWeight:](v21, "setFontWeight:", 10);
      -[VUITextLayout setNumberOfLines:](v21, "setNumberOfLines:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v21, "setColor:", v22);

      -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v20, v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIDownloadCollectionViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", v24);
      if (v12)
      {
        v25 = objc_alloc_init(VUITextLayout);
        -[VUITextLayout setTextStyle:](v25, "setTextStyle:", 21);
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUITextLayout setColor:](v25, "setColor:", v26);

        -[VUITextLayout setNumberOfLines:](v25, "setNumberOfLines:", 1);
        -[VUIDownloadCollectionViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("·"), v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        -[VUIDownloadCollectionViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", v28);

        goto LABEL_13;
      }
    }
    else
    {
      -[VUIDownloadCollectionViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
      v24 = 0;
    }
    v28 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v12, "setDelegate:", self);
  -[VUIDownloadCollectionViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v12);
  -[VUIDownloadCollectionViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
  -[VUIDownloadCollectionViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", 0);
LABEL_13:

}

- (void)_addDownloadButtonIfRequired:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  VUIDownloadButton *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, int, int);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(v4, "assetController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (VUIDownloadButton *)v6;
      objc_msgSend(v4, "assetController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButton updateWithAssetController:](v7, "updateWithAssetController:", v8);

    }
    else
    {
      v7 = -[VUIDownloadButton initWithMediaEntity:type:]([VUIDownloadButton alloc], "initWithMediaEntity:type:", v4, 8);
      -[VUIDownloadButton setUsesDefaultConfiguration:](v7, "setUsesDefaultConfiguration:", 1);
      objc_initWeak(&location, self);
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __62__VUIDownloadCollectionViewCell__addDownloadButtonIfRequired___block_invoke;
      v12 = &unk_1E9F9B1C0;
      objc_copyWeak(&v13, &location);
      -[VUIDownloadButton setDownloadStateChangeHandler:](v7, "setDownloadStateChangeHandler:", &v9);
      -[VUIDownloadCollectionViewCell setDownloadButton:](self, "setDownloadButton:", v7, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

void __62__VUIDownloadCollectionViewCell__addDownloadButtonIfRequired___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (a2 || !(a3 | a4))
  {
    if (objc_msgSend(WeakRetained, "previousDownloadState") != a2)
    {
      objc_msgSend(v10, "setMetaDataHeaderFirstLabel:", 0);
      objc_msgSend(v10, "downloadEntity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_addMetaDataLabelsIfRequired:", v9);

      objc_msgSend(v10, "setPreviousDownloadState:", a2);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "downloadCellDidRequestCancelDownload:", v10);

  }
}

- (void)_configureViewElementsForAX
{
  void *v3;
  uint64_t v4;
  id v5;

  -[VUIDownloadCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAXEnabled");

  -[VUIDownloadCollectionViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (BOOL)_hasSecondaryLabel
{
  void *v3;
  BOOL v4;
  void *v5;

  -[VUIDownloadCollectionViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[VUIDownloadCollectionViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)_updateViewForEditState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_editing)
  {
    if (-[VUIDownloadCollectionViewCell isSelected](self, "isSelected"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "vui_imageWithColor:", v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "vui_imageWithColor:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithRenderingMode:", 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    -[VUIDownloadCollectionViewCell setEditImageView:](self, "setEditImageView:", v8);
    -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    goto LABEL_8;
  }
  -[VUIDownloadCollectionViewCell setEditImageView:](self, "setEditImageView:", 0);
  -[VUIDownloadCollectionViewCell downloadButton](self, "downloadButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    -[VUIDownloadCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v10);

    -[VUIDownloadCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
LABEL_8:
    v5 = v10;
  }

}

- (VUIDownloadCollectionViewCellDelegate)delegate
{
  return (VUIDownloadCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)editing
{
  return self->_editing;
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
}

- (VUILabel)metaDataHeaderFirstLabel
{
  return self->_metaDataHeaderFirstLabel;
}

- (VUILabel)metaDataHeaderSecondLabel
{
  return self->_metaDataHeaderSecondLabel;
}

- (VUILabel)dotSeparatorLabel
{
  return self->_dotSeparatorLabel;
}

- (UIImageView)editImageView
{
  return self->_editImageView;
}

- (VUIDownloadEntity)downloadEntity
{
  return self->_downloadEntity;
}

- (void)setDownloadEntity:(id)a3
{
  objc_storeStrong((id *)&self->_downloadEntity, a3);
}

- (unint64_t)previousDownloadState
{
  return self->_previousDownloadState;
}

- (void)setPreviousDownloadState:(unint64_t)a3
{
  self->_previousDownloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadEntity, 0);
  objc_storeStrong((id *)&self->_editImageView, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
