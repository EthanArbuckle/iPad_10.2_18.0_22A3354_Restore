@implementation VUIDownloadEntityTableViewCell

+ (void)configureVUIDownloadEntityTableViewCell:(id)a3 withDownloadEntity:(id)a4 forMetrics:(BOOL)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  VUITextLayout *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  VUILibraryEpisodeFrameView *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  VUIVideosImageView *v51;
  VUIVideosImageView *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  VUILibraryEpisodeFrameView *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  VUIVideosImageView *v67;
  VUIVideosImageView *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;

  v73 = a3;
  v7 = a4;
  objc_msgSend(v73, "setDownloadEntity:", v7);
  +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 1);
  v9 = v8;
  v10 = 0.0;
  if (!a5)
  {
    objc_msgSend(v7, "setDelegate:", v73);
    objc_msgSend(v73, "_imageHeightForCurrentSizeClass");
    v10 = v11;
  }
  objc_msgSend(v7, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v13, "setTextStyle:", 19);
    -[VUITextLayout setFontWeight:](v13, "setFontWeight:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v13, "setColor:", v14);

    -[VUITextLayout setAllowsTextAlignmentOverride:](v13, "setAllowsTextAlignmentOverride:", 1);
    -[VUITextLayout setNumberOfLines:](v13, "setNumberOfLines:", 2);
    objc_msgSend(v7, "title");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = &stru_1E9FF3598;
    objc_msgSend(v73, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v17, v13, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v73, "setTitleLabel:", v12);
  objc_msgSend(v7, "mediaEntities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "downloadType"))
  {
    if (!a5)
    {
      +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v20, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "posterImageView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v73, "posterImageView");
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
      }
      v32 = v26;

      objc_msgSend(v32, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageHighlightColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_setFocusedColor:", v33);

      objc_msgSend(v73, "_episodePlaceholderImage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPlaceholderImage:", v34);

      if (v24)
      {
        v35 = (void *)MEMORY[0x1E0DC6A08];
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "decoratorWithOutlineColor:outlineWidths:", v36, 1.0, 1.0, 1.0, 1.0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_alloc(MEMORY[0x1E0DC6A10]);
        objc_msgSend(v20, "mediaLibrary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v38, "initWithObject:imageLoader:groupType:", v24, v39, 0);

        objc_msgSend(v37, "setScaleToSize:", v10 * 1.77777778, v10);
        objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v9);
        objc_msgSend(v37, "setCornerRadii:");
        objc_msgSend(v40, "setDecorator:", v37);
        objc_msgSend(v32, "setImageProxy:", v40);
        +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 1);
        objc_msgSend(v32, "setCornerRadius:");

      }
      objc_msgSend(v73, "setPosterImageView:", v32);

    }
    goto LABEL_36;
  }
  if (objc_msgSend(v7, "downloadType") == 1)
  {
    if (!a5)
    {
      +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "posterImageView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v73, "posterImageView");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
      }
      v41 = v23;

      objc_msgSend(v41, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageHighlightColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "_setFocusedColor:", v42);

      objc_msgSend(v73, "_episodePlaceholderImage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPlaceholderImage:", v43);

      if (v21)
      {
        v44 = (void *)MEMORY[0x1E0DC6A08];
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "decoratorWithOutlineColor:outlineWidths:", v45, 1.0, 1.0, 1.0, 1.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = objc_alloc(MEMORY[0x1E0DC6A10]);
        objc_msgSend(v20, "mediaLibrary");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v47, "initWithObject:imageLoader:groupType:", v21, v48, 0);

        objc_msgSend(v46, "setScaleToSize:", v10 * 1.77777778, v10);
        objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v9);
        objc_msgSend(v46, "setCornerRadii:");
        objc_msgSend(v49, "setDecorator:", v46);
        objc_msgSend(v41, "setImageProxy:", v49);
        +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 1);
        objc_msgSend(v41, "setCornerRadius:");

      }
      objc_msgSend(v73, "setPosterImageView:", v41);

    }
    objc_msgSend(v73, "_addMetaDataLabelsIfRequired:", v7);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = [VUIVideosImageView alloc];
    v52 = -[VUIVideosImageView initWithFrame:](v51, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "imageWithTintColor:renderingMode:", v53, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setImage:](v52, "setImage:", v54);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "imageWithTintColor:renderingMode:", v55, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setHighlightOrSelectedImage:](v52, "setHighlightOrSelectedImage:", v56);

    objc_msgSend(v73, "setRightImageView:", v52);
LABEL_33:

    goto LABEL_37;
  }
  if (objc_msgSend(v7, "downloadType") == 3)
  {
    if (!a5)
    {
      objc_msgSend(v73, "episodeImageView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v73, "episodeImageView");
        v28 = (VUILibraryEpisodeFrameView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = -[VUILibraryEpisodeFrameView initWithFrame:]([VUILibraryEpisodeFrameView alloc], "initWithFrame:", 0.0, 0.0, v10 * 1.77777778, v10);
      }
      v57 = v28;

      +[VUILibraryEpisodeFrameView configureEpisodeFrameView:withMedia:layout:imageSize:](VUILibraryEpisodeFrameView, "configureEpisodeFrameView:withMedia:layout:imageSize:", v57, v20, 0, v10 * 1.77777778, v10);
      objc_msgSend(v73, "setEpisodeImageView:", v57);

    }
LABEL_36:
    objc_msgSend(v73, "_addMetaDataLabelsIfRequired:", v7);
    objc_msgSend(v73, "_addDownloadButtonIfRequired:", v20);
    goto LABEL_37;
  }
  if (objc_msgSend(v7, "downloadType") == 2)
  {
    if (!a5)
    {
      +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v20, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "posterImageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(v73, "posterImageView");
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
      }
      v58 = v31;

      objc_msgSend(v58, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageHighlightColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "_setFocusedColor:", v59);

      objc_msgSend(v73, "_episodePlaceholderImage");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setPlaceholderImage:", v60);

      if (v29)
      {
        v61 = (void *)MEMORY[0x1E0DC6A08];
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "decoratorWithOutlineColor:outlineWidths:", v62, 1.0, 1.0, 1.0, 1.0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = objc_alloc(MEMORY[0x1E0DC6A10]);
        objc_msgSend(v20, "mediaLibrary");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(v64, "initWithObject:imageLoader:groupType:", v29, v65, 0);

        objc_msgSend(v63, "setScaleToSize:", v10 * 1.77777778, v10);
        objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v9);
        objc_msgSend(v63, "setCornerRadii:");
        objc_msgSend(v66, "setDecorator:", v63);
        objc_msgSend(v58, "setImageProxy:", v66);
        +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 1);
        objc_msgSend(v58, "setCornerRadius:");

      }
      objc_msgSend(v73, "setPosterImageView:", v58);

    }
    +[VUIDownloadEntityTableViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadEntityTableViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v52 = (VUIVideosImageView *)objc_claimAutoreleasedReturnValue();
    v67 = [VUIVideosImageView alloc];
    v68 = -[VUIVideosImageView initWithFrame:](v67, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView imageWithTintColor:renderingMode:](v52, "imageWithTintColor:renderingMode:", v69, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setImage:](v68, "setImage:", v70);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView imageWithTintColor:renderingMode:](v52, "imageWithTintColor:renderingMode:", v71, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIVideosImageView setHighlightOrSelectedImage:](v68, "setHighlightOrSelectedImage:", v72);

    objc_msgSend(v73, "setRightImageView:", v68);
    objc_msgSend(v73, "setMetaDataHeaderFirstLabel:", v50);
    objc_msgSend(v73, "setMetaDataHeaderSecondLabel:", 0);
    objc_msgSend(v73, "setDotSeparatorLabel:", 0);

    goto LABEL_33;
  }
LABEL_37:

}

- (VUIDownloadEntityTableViewCell)initWithFrame:(CGRect)a3
{
  VUIDownloadEntityTableViewCell *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VUIDownloadEntityTableViewCell;
  v3 = -[VUIDownloadEntityTableViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v11[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__VUIDownloadEntityTableViewCell_initWithFrame___block_invoke;
    v7[3] = &unk_1E9F99F98;
    objc_copyWeak(&v8, &location);
    v5 = (id)-[VUIDownloadEntityTableViewCell registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v4, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __48__VUIDownloadEntityTableViewCell_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rightImageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setImage:", v2);

}

- (void)prepareForReuse
{
  void *v3;
  VUIDownloadEntity *downloadEntity;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadEntityTableViewCell;
  -[VUIDownloadEntityTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[VUIDownloadEntityTableViewCell setRightImageView:](self, "setRightImageView:", 0);
  -[VUIDownloadEntityTableViewCell _removeDownloadButtonIfRequired](self, "_removeDownloadButtonIfRequired");
  -[VUIDownloadEntityTableViewCell setEpisodeImageView:](self, "setEpisodeImageView:", 0);
  -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", 0);
  -[VUIDownloadEntityTableViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
  -[VUIDownloadEntityTableViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", 0);
  -[VUIDownloadEntityTableViewCell downloadEntity](self, "downloadEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  downloadEntity = self->_downloadEntity;
  self->_downloadEntity = 0;

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadEntityTableViewCell;
  -[VUIDownloadEntityTableViewCell setSelected:animated:](&v9, sel_setSelected_animated_, a3, a4);
  if (-[VUIDownloadEntityTableViewCell isEditing](self, "isEditing"))
  {
    -[VUIDownloadEntityTableViewCell topSeparatorView](self, "topSeparatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.78, 0.78, 0.8, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[VUIDownloadEntityTableViewCell bottomSeparatorView](self, "bottomSeparatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.78, 0.78, 0.8, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
}

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel **p_titleLabel;
  VUILabel *titleLabel;
  void *v8;
  VUILabel *v9;

  v5 = (VUILabel *)a3;
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    v9 = v5;
    -[VUILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (*p_titleLabel)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_titleLabel);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setPosterImageView:(id)a3
{
  VUIImageView *v5;
  VUIImageView **p_posterImageView;
  VUIImageView *posterImageView;
  void *v8;
  VUIImageView *v9;

  v5 = (VUIImageView *)a3;
  p_posterImageView = &self->_posterImageView;
  posterImageView = self->_posterImageView;
  if (posterImageView != v5)
  {
    v9 = v5;
    -[VUIImageView removeFromSuperview](posterImageView, "removeFromSuperview");
    -[VUIImageView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    objc_storeStrong((id *)&self->_posterImageView, a3);
    if (*p_posterImageView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_posterImageView);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

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
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_metaDataHeaderFirstLabel);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
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
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_metaDataHeaderSecondLabel);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setEpisodeImageView:(id)a3
{
  VUILibraryEpisodeFrameView *v5;
  VUILibraryEpisodeFrameView **p_episodeImageView;
  VUILibraryEpisodeFrameView *episodeImageView;
  void *v8;
  VUILibraryEpisodeFrameView *v9;

  v5 = (VUILibraryEpisodeFrameView *)a3;
  p_episodeImageView = &self->_episodeImageView;
  episodeImageView = self->_episodeImageView;
  if (episodeImageView != v5)
  {
    v9 = v5;
    -[VUILibraryEpisodeFrameView removeFromSuperview](episodeImageView, "removeFromSuperview");
    -[VUILibraryEpisodeFrameView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    objc_storeStrong((id *)&self->_episodeImageView, a3);
    if (*p_episodeImageView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_episodeImageView);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
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
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_dotSeparatorLabel);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setRightImageView:(id)a3
{
  VUIVideosImageView *v5;
  VUIVideosImageView **p_rightImageView;
  VUIVideosImageView *rightImageView;
  void *v8;
  VUIVideosImageView *v9;

  v5 = (VUIVideosImageView *)a3;
  p_rightImageView = &self->_rightImageView;
  rightImageView = self->_rightImageView;
  if (rightImageView != v5)
  {
    v9 = v5;
    -[VUIVideosImageView removeFromSuperview](rightImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_rightImageView, a3);
    if (*p_rightImageView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_rightImageView);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setTopSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView **p_topSeparatorView;
  VUISeparatorView *topSeparatorView;
  void *v8;
  VUISeparatorView *v9;

  v5 = (VUISeparatorView *)a3;
  p_topSeparatorView = &self->_topSeparatorView;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    v9 = v5;
    -[VUISeparatorView removeFromSuperview](topSeparatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (*p_topSeparatorView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_topSeparatorView);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setBottomSeparatorView:(id)a3
{
  VUISeparatorView *v5;
  VUISeparatorView **p_bottomSeparatorView;
  VUISeparatorView *bottomSeparatorView;
  void *v8;
  VUISeparatorView *v9;

  v5 = (VUISeparatorView *)a3;
  p_bottomSeparatorView = &self->_bottomSeparatorView;
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView != v5)
  {
    v9 = v5;
    -[VUISeparatorView removeFromSuperview](bottomSeparatorView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
    if (*p_bottomSeparatorView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_bottomSeparatorView);

    }
    -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (void)setDownloadEntity:(id)a3
{
  VUIDownloadEntity *v5;
  VUIDownloadEntity **p_downloadEntity;
  VUIDownloadEntity *v7;

  v5 = (VUIDownloadEntity *)a3;
  p_downloadEntity = &self->_downloadEntity;
  if (*p_downloadEntity != v5)
  {
    v7 = v5;
    -[VUIDownloadEntity setDelegate:](*p_downloadEntity, "setDelegate:", 0);
    objc_storeStrong((id *)p_downloadEntity, a3);
    v5 = v7;
  }

}

- (void)willTransitionToState:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIDownloadEntityTableViewCell;
  -[VUIDownloadEntityTableViewCell willTransitionToState:](&v8, sel_willTransitionToState_);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__VUIDownloadEntityTableViewCell_willTransitionToState___block_invoke;
  v6[3] = &unk_1E9F9A5F8;
  v6[4] = self;
  v7 = a3 == 1;
  v5 = _Block_copy(v6);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, 0, 0.300000012);

}

void __56__VUIDownloadEntityTableViewCell_willTransitionToState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rightImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", *(unsigned __int8 *)(a1 + 40));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIDownloadEntityTableViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
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
  v4.super_class = (Class)VUIDownloadEntityTableViewCell;
  -[VUIDownloadEntityTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[VUIDownloadEntityTableViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[VUIDownloadEntityTableViewCell bounds](self, "bounds");
  -[VUIDownloadEntityTableViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (void)downloadEntity:(id)a3 numberOfItemsDownloadingDidChange:(id)a4
{
  id v5;

  +[VUIDownloadEntityTableViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadEntityTableViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v5);
  -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)downloadEntity:(id)a3 numberOfItemsDidChange:(unint64_t)a4
{
  id v5;

  +[VUIDownloadEntityTableViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadEntityTableViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v5);
  -[VUIDownloadEntityTableViewCell setNeedsLayout](self, "setNeedsLayout");

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
  -[VUIDownloadEntityTableViewCell _configureViewElementsForAX](self, "_configureViewElementsForAX");
  -[VUIDownloadEntityTableViewCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAXEnabled");

  if (v9)
    -[VUIDownloadEntityTableViewCell _layoutForCategoryAccessibility:metricsOnly:](self, "_layoutForCategoryAccessibility:metricsOnly:", v4, width, height);
  else
    -[VUIDownloadEntityTableViewCell _layoutForCompact:metricsOnly:](self, "_layoutForCompact:metricsOnly:", v4, width, height);
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  VUISeparatorView *topSeparatorView;
  void *v38;
  double v39;
  double v40;
  double v41;
  double MaxY;
  void *v43;
  double v44;
  CGFloat v45;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  VUIDownloadButton *downloadButton;
  void *v63;
  VUISeparatorView *bottomSeparatorView;
  void *v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  uint64_t v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
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
  void *v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
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
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  CGFloat v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
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
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  CGFloat v168;
  double v169;
  double v170;
  CGFloat v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  CGSize result;
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

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:");
  v176 = v8;
  v10 = v9;
  -[VUIDownloadEntityTableViewCell _imageHeightForCurrentSizeClass](self, "_imageHeightForCurrentSizeClass");
  v174 = v11;
  -[VUIVideosImageView image](self->_rightImageView, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  if (!-[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType")
    || -[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType") == 3)
  {
    v16 = 28.0;
    v14 = 16.0;
  }
  v17 = (double *)MEMORY[0x1E0C9D820];
  v18 = width - (v176 + v10 + 10.0 + v14);
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v18, height);
  v171 = v19;
  v21 = v20;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", v18, height);
  v170 = v22;
  v168 = v23;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", v18, height);
  v25 = v24;
  v169 = v26;
  -[VUIDownloadButton sizeToFit](self->_downloadButton, "sizeToFit");
  -[VUIDownloadEntityTableViewCell traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v27, 8.0);
  v175 = v28;

  -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIDownloadEntityTableViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      goto LABEL_9;
    -[VUIDownloadEntityTableViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v30;
LABEL_9:
  v165 = *v17;
  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_titleLabel, "topMarginToLabel:withBaselineMargin:", v31, 21.0);
  v167 = v32;
  if (!a4)
  {
    v163 = v25;
    v152 = v16;
    v154 = v14;
    v159 = v10;
    v141 = v21;
    v33 = *MEMORY[0x1E0C9D648];
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    topSeparatorView = self->_topSeparatorView;
    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v178) - v176, 1.79769313e308);
    v40 = v39;
    v156 = v41;

    -[VUIDownloadEntityTableViewCell posterImageView](self, "posterImageView");
    v179.origin.x = v176;
    v179.origin.y = v175;
    v173 = v174 * 1.77777778;
    v179.size.width = v174 * 1.77777778;
    v179.size.height = v174;
    MaxY = CGRectGetMaxY(v179);
    -[VUIDownloadEntityTableViewCell titleLabel](self, "titleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v161 = v34;
    v162 = v33;
    if (v43)
    {
      v34 = v167 + MaxY;
      v44 = v176;
      v180.origin.x = v176;
      v180.origin.y = v34;
      v45 = v171;
      v180.size.width = v171;
      v180.size.height = v141;
      v166 = CGRectGetMaxY(v180);
      v143 = v141;
    }
    else
    {
      v166 = MaxY;
      v143 = v35;
      v45 = v36;
      v44 = v33;
    }
    -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v172 = v45;
    v158 = v34;
    v149 = v40;
    if (v46)
    {
      v181.origin.x = v176;
      v181.origin.y = v166;
      v181.size.width = v170;
      v181.size.height = v168;
      v47 = CGRectGetMaxY(v181);
      v48 = v168;
      v142 = v176;
      v50 = v161;
      v49 = v162;
    }
    else
    {
      v47 = v166;
      v48 = v35;
      v170 = v36;
      v50 = v161;
      v166 = v161;
      v49 = v162;
      v142 = v162;
    }
    -[VUIDownloadEntityTableViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v35;
    v53 = v36;
    v54 = v50;
    v55 = v49;
    v56 = v50;
    if (v51)
    {
      v52 = v169;
      v53 = v163;
      v54 = v47;
      v55 = v176;
    }
    v146 = v55;
    v147 = v54;
    v148 = v53;
    v151 = v52;
    v57 = v35;
    v58 = v36;
    v164 = v49;
    v59 = v156;
    if (self->_rightImageView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView", v56, v35);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "bounds");
      v58 = v154;
      v61 = CGRectGetMaxX(v182) - (v159 + v154);

      if (-[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType")
        && -[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType") != 3)
      {
        v61 = v61 + (16.0 - v154) * -0.5;
      }
      v164 = v61;
      v183.origin.y = v175;
      v183.origin.x = v176;
      v183.size.width = v174 * 1.77777778;
      v183.size.height = v174;
      v56 = CGRectGetMidY(v183) + v152 * -0.5;
      v57 = v152;
      v59 = v156;
      v49 = v162;
    }
    v138 = v56;
    v139 = v58;
    v140 = v57;
    downloadButton = self->_downloadButton;
    if (downloadButton)
    {
      -[VUIDownloadButton frame](downloadButton, "frame");
      v36 = CGRectGetWidth(v184);
      -[VUIDownloadButton frame](self->_downloadButton, "frame");
      v35 = CGRectGetHeight(v185);
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "bounds");
      v49 = CGRectGetMaxX(v186) - (v159 + v36);
      v187.origin.y = v175;
      v187.origin.x = v176;
      v187.size.width = v174 * 1.77777778;
      v187.size.height = v174;
      v161 = CGRectGetMidY(v187) + v35 * -0.5;

    }
    v153 = v48;
    v155 = v44;
    v160 = v36;
    bottomSeparatorView = self->_bottomSeparatorView;
    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bounds");
    -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", CGRectGetWidth(v188) - v176, 1.79769313e308);
    v131 = v66;
    v68 = v67;

    v189.origin.x = v176;
    v189.size.height = v174;
    v189.origin.y = v175;
    v189.size.width = v174 * 1.77777778;
    v145 = CGRectGetMaxX(v189) + 16.0;
    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "bounds");
    v144 = CGRectGetHeight(v190) - v68;

    v70 = -[VUIDownloadEntityTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v71 = 0.0;
    if (v70 == 1)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "bounds");
      v128 = v35;

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v129 = v73;
      v130 = v74;
      v150 = v75;
      v157 = v76;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v137 = v77;
      v134 = v79;
      v135 = v78;
      v132 = v80;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v176 = v81;
      v136 = v82;
      v173 = v83;
      v133 = v84;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v142 = v85;
      v166 = v86;
      v170 = v87;
      v153 = v88;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v146 = v89;
      v147 = v90;
      v148 = v91;
      v151 = v92;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v155 = v93;
      v158 = v94;
      v172 = v95;
      v143 = v96;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v164 = v97;
      v99 = v98;
      v101 = v100;
      v103 = v102;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v105 = v104;
      v160 = v106;
      v49 = v107;
      v35 = v108;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v144 = v110;
      v145 = v109;
      v111 = v129;
      v113 = v112;
      v114 = v150;
      v68 = v115;
      v116 = v157;
      v71 = v130;
    }
    else
    {
      v136 = v175;
      v133 = v174;
      v137 = v176;
      v135 = v175;
      v134 = v174 * 1.77777778;
      v132 = v174;
      v111 = v176;
      v105 = v161;
      v116 = v59;
      v114 = v149;
      v101 = v139;
      v103 = v140;
      v99 = v138;
      v113 = v131;
    }
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v111, v71, v114, v116, *(_QWORD *)&v128);
    -[VUIImageView setFrame:](self->_posterImageView, "setFrame:", v137, v135, v134, v132);
    -[VUILibraryEpisodeFrameView setFrame:](self->_episodeImageView, "setFrame:", v176, v136, v173, v133);
    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v142, v166, v170, v153);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v146, v147, v148, v151);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v155, v158, v172, v143);
    -[VUIVideosImageView setFrame:](self->_rightImageView, "setFrame:", v164, v99, v101, v103);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v49, v105, v160, v35);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v145, v144, v113, v68);
    v21 = v141;
  }
  -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = v168;
  if (!v117)
    v118 = -0.0;
  v119 = v174 + 0.0 + v118;
  -[VUIDownloadEntityTableViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = v169;
  if (!v120)
    v121 = -0.0;
  v122 = v119 + v121;
  -[VUIDownloadEntityTableViewCell titleLabel](self, "titleLabel");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  v124 = v21 + v167 + v122;
  if (!v123)
    v124 = v122;
  v125 = v124 + v175 * 2.0;

  v126 = v165;
  v127 = v125;
  result.height = v127;
  result.width = v126;
  return result;
}

- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height;
  double width;
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
  VUIDownloadButton *downloadButton;
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
  double v31;
  double v32;
  VUILabel *metaDataHeaderFirstLabel;
  VUILabel *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  VUISeparatorView *topSeparatorView;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  CGFloat v51;
  double v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  CGFloat MaxX;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat MidY;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  VUIDownloadButton *v85;
  void *v86;
  void *v87;
  VUISeparatorView *bottomSeparatorView;
  void *v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  uint64_t v94;
  double v95;
  void *v96;
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
  double v136;
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
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  CGFloat v154;
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
  CGFloat rect;
  double recta;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  CGFloat v188;
  double v189;
  double v190;
  CGFloat v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  CGSize result;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:");
  v9 = v8;
  v11 = v10;
  -[VUIDownloadEntityTableViewCell _imageHeightForCurrentSizeClass](self, "_imageHeightForCurrentSizeClass");
  v13 = v12;
  -[VUIDownloadEntityTableViewCell _verticalPaddingForCurrentSizeClass](self, "_verticalPaddingForCurrentSizeClass");
  v190 = v14;
  -[VUIVideosImageView image](self->_rightImageView, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  if (-[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType")
    && -[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType") != 3)
  {
    v168 = v19;
  }
  else
  {
    v168 = 28.0;
    v17 = 16.0;
  }
  v201 = v13 * 1.77777778;
  v183 = v11;
  downloadButton = self->_downloadButton;
  v21 = v17;
  if (downloadButton)
  {
    -[VUIDownloadButton sizeToFit](downloadButton, "sizeToFit", v17);
    -[VUIDownloadButton frame](self->_downloadButton, "frame");
    v21 = CGRectGetWidth(v204);
  }
  v185 = v17;
  v22 = width - (v11 + v9 + v13 * 1.77777778 + 32.0 + 10.0 + v21);
  if (-[VUIDownloadEntityTableViewCell isEditing](self, "isEditing"))
    v23 = v22 + -10.0;
  else
    v23 = v22;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23, height);
  v25 = v24;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", v23, height);
  v193 = v26;
  v194 = v27;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", v23, height);
  v29 = v28;
  v174 = v30;
  -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", v23, height);
  v188 = v31;
  v189 = v32;
  metaDataHeaderFirstLabel = self->_metaDataHeaderFirstLabel;
  if (metaDataHeaderFirstLabel || (metaDataHeaderFirstLabel = self->_metaDataHeaderSecondLabel) != 0)
  {
    v34 = metaDataHeaderFirstLabel;
    -[VUILabel sizeThatFits:](v34, "sizeThatFits:", v23, height);
    v36 = v35;
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_titleLabel, "topMarginToLabel:withBaselineMargin:", v34, 21.0);
    v38 = v37;
  }
  else
  {
    v34 = 0;
    v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v38 = 0.0;
  }
  v39 = v25 + v38 + v36;
  if (!a4)
  {
    v172 = v29;
    v191 = v23;
    v187 = v25;
    v156 = v25 + v38 + v36;
    v157 = width;
    v179 = (v13 - v39) * 0.5;
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v199 = *MEMORY[0x1E0C9D648];
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v158 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    topSeparatorView = self->_topSeparatorView;
    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v205) - v9, 1.79769313e308);
    v159 = v44;
    v161 = v45;

    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bounds");
    v47 = CGRectGetMidY(v206) - v13 * 0.5;

    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bounds");
    v49 = CGRectGetMidY(v207) - v13 * 0.5;

    -[VUIDownloadEntityTableViewCell posterImageView](self, "posterImageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = v49;
    v182 = v47;
    if (v50)
      v51 = v47;
    else
      v51 = v49;

    v208.origin.x = v9;
    v208.origin.y = v51;
    v208.size.width = v13 * 1.77777778;
    v208.size.height = v13;
    v52 = v179 + CGRectGetMinY(v208);
    -[VUIDownloadEntityTableViewCell titleLabel](self, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v195 = v40;
    v197 = v41;
    v202 = v9;
    if (v53)
    {
      v209.origin.x = v9;
      v209.origin.y = v51;
      v209.size.width = v13 * 1.77777778;
      v209.size.height = v13;
      v54 = CGRectGetMaxX(v209) + 16.0;
      v210.origin.x = v54;
      v180 = v52;
      v210.origin.y = v52;
      v55 = v191;
      v210.size.width = v191;
      v210.size.height = v187;
      v56 = v38 + CGRectGetMaxY(v210);
      v57 = v158;
    }
    else
    {
      v56 = v52;
      v187 = v41;
      v57 = v158;
      v55 = v158;
      v180 = v40;
      v54 = v199;
    }
    v211.origin.x = v9;
    v211.origin.y = v51;
    v211.size.width = v13 * 1.77777778;
    v211.size.height = v13;
    MaxX = CGRectGetMaxX(v211);
    v60 = v51;
    v61 = MaxX + 16.0;
    v192 = v55;
    v178 = v54;
    rect = v60;
    if (self->_metaDataHeaderFirstLabel)
    {
      v62 = v9;
      v63 = v13;
      v59 = v13 * 1.77777778;
      v64 = CGRectGetMaxX(*(CGRect *)(&v60 - 1));
      v65 = v64 + 16.0;
      v177 = v64 + 16.0;
      if (self->_dotSeparatorLabel)
      {
        v212.origin.x = v64 + 16.0;
        v212.origin.y = v56;
        v212.size.width = v193;
        v212.size.height = v194;
        v66 = CGRectGetMaxX(v212) + 6.0;
        v213.origin.x = v65;
        v213.origin.y = v56;
        v213.size.width = v193;
        v213.size.height = v194;
        MidY = CGRectGetMidY(v213);
        v214.size.height = v189;
        v68 = MidY + v189 * -0.5;
        v155 = v66;
        v214.origin.x = v66;
        v214.origin.y = v68;
        v214.size.width = v188;
        v69 = CGRectGetMaxX(v214);
        v70 = v68;
        v61 = v69 + 6.0;
        v71 = v56;
        v72 = v197;
        v73 = v199;
        v74 = v195;
      }
      else
      {
        v74 = v195;
        v72 = v197;
        v188 = v57;
        v189 = v197;
        v70 = v195;
        v73 = v199;
        v155 = v199;
        v71 = v56;
      }
    }
    else
    {
      v74 = v195;
      v72 = v197;
      v188 = v57;
      v189 = v197;
      v70 = v195;
      v155 = v199;
      v73 = v199;
      v193 = v57;
      v194 = v197;
      v71 = v195;
      v177 = v199;
    }
    v176 = v71;
    v154 = v70;
    v75 = v72;
    v76 = v57;
    v77 = v74;
    v78 = v73;
    if (self->_metaDataHeaderSecondLabel)
    {
      v76 = v172;
      v75 = v174;
      v77 = v56;
      v78 = v61;
    }
    v170 = v78;
    v171 = v77;
    v173 = v76;
    v175 = v75;
    v79 = v72;
    v80 = v57;
    v81 = v74;
    v82 = v73;
    if (self->_rightImageView)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView", v72);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "bounds");
      v82 = CGRectGetMaxX(v215) - (v183 + v185);

      if (-[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType")
        && -[VUIDownloadEntity downloadType](self->_downloadEntity, "downloadType") != 3)
      {
        v82 = v82 + (16.0 - v185) * -0.5;
      }
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "bounds");
      v81 = CGRectGetMidY(v216) + v168 * -0.5;

      v79 = v168;
      v80 = v185;
    }
    v169 = v79;
    v85 = self->_downloadButton;
    if (v85)
    {
      -[VUIDownloadButton frame](v85, "frame");
      v57 = CGRectGetWidth(v217);
      -[VUIDownloadButton frame](self->_downloadButton, "frame");
      v72 = CGRectGetHeight(v218);
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "bounds");
      v73 = CGRectGetMaxX(v219) - (v183 + v57);
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "bounds");
      v74 = CGRectGetMidY(v220) + v72 * -0.5;

    }
    v200 = v73;
    v184 = v81;
    v186 = v82;
    v196 = v74;
    v198 = v72;
    bottomSeparatorView = self->_bottomSeparatorView;
    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "bounds");
    -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", CGRectGetWidth(v221) - v202, 1.79769313e308);
    v165 = v90;
    v92 = v91;

    v222.origin.x = v202;
    v222.origin.y = rect;
    v222.size.width = v13 * 1.77777778;
    v222.size.height = v13;
    v164 = CGRectGetMaxX(v222) + 16.0;
    -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "bounds");
    recta = v92;
    v163 = CGRectGetHeight(v223) - v92;

    v94 = -[VUIDownloadEntityTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    v95 = 0.0;
    if (v94 == 1)
    {
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "bounds");

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v148 = v97;
      v149 = v98;
      v160 = v99;
      v162 = v100;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v152 = v102;
      v153 = v101;
      v182 = v103;
      v151 = v104;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v202 = v105;
      v181 = v106;
      v201 = v107;
      v150 = v108;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v176 = v110;
      v177 = v109;
      v193 = v111;
      v194 = v112;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v170 = v113;
      v171 = v114;
      v173 = v115;
      v175 = v116;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v178 = v117;
      v180 = v118;
      v192 = v119;
      v187 = v120;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v184 = v122;
      v186 = v121;
      v80 = v123;
      v169 = v124;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v198 = v126;
      v200 = v125;
      v196 = v127;
      v129 = v128;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v163 = v131;
      v164 = v130;
      v165 = v132;
      recta = v133;
      v57 = v129;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v135 = v134;
      v137 = v136;
      v138 = v148;
      v95 = v149;
      v140 = v139;
      v142 = v141;
      v143 = v160;
      v144 = v162;
      width = v157;
    }
    else
    {
      v138 = v202;
      v152 = v13;
      v153 = v202;
      v150 = v13;
      v151 = v13 * 1.77777778;
      width = v157;
      v140 = v188;
      v142 = v189;
      v143 = v159;
      v144 = v161;
      v137 = v154;
      v135 = v155;
    }
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v138, v95, v143, v144);
    -[VUIImageView setFrame:](self->_posterImageView, "setFrame:", v153, v182, v151, v152);
    -[VUILibraryEpisodeFrameView setFrame:](self->_episodeImageView, "setFrame:", v202, v181, v201, v150);
    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v177, v176, v193, v194);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v170, v171, v173, v175);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v178, v180, v192, v187);
    -[VUIVideosImageView setFrame:](self->_rightImageView, "setFrame:", v186, v184, v80, v169);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v200, v196, v57, v198);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v164, v163, v165, recta);
    -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v135, v137, v140, v142);
    v39 = v156;
  }
  if (v39 < v13)
    v39 = v13;
  v145 = v39 + 0.0 + v190 * 2.0;

  v146 = width;
  v147 = v145;
  result.height = v147;
  result.width = v146;
  return result;
}

- (void)_configureViewElementsForAX
{
  void *v3;
  uint64_t v4;
  id v5;

  -[VUIDownloadEntityTableViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAXEnabled");

  -[VUIDownloadEntityTableViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (void)_addMetaDataLabelsIfRequired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUITextLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  VUITextLayout *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  VUITextLayout *v36;
  void *v37;
  void *v38;
  void *v39;
  VUITextLayout *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  VUITextLayout *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  VUITextLayout *v54;
  void *v55;
  void *v56;
  void *v57;
  VUITextLayout *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;

  v64 = a3;
  objc_msgSend(v64, "mediaEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v64, "downloadType"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v5;
      objc_msgSend(v15, "rentalExpirationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "downloadExpirationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "availabilityEndDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "state");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIRentalExpirationLabel labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:](VUIRentalExpirationLabel, "labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:", v16, v17, v18, objc_msgSend(v20, "status"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_11;
    }
    objc_msgSend(v64, "duration");
    v11 = (VUITextLayout *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0DC6B40]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transformedValue:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v23, "setTextStyle:", 20);
      -[VUITextLayout setFontWeight:](v23, "setFontWeight:", 0);
      -[VUITextLayout setNumberOfLines:](v23, "setNumberOfLines:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v23, "setColor:", v24);

      -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v22, v23, v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v10);
    objc_msgSend(v64, "releaseYear");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v36 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v36, "setTextStyle:", 20);
      -[VUITextLayout setFontWeight:](v36, "setFontWeight:", 0);
      -[VUITextLayout setNumberOfLines:](v36, "setNumberOfLines:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v36, "setColor:", v37);

      -[VUIDownloadEntityTableViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v14, v36, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIDownloadEntityTableViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", v39);
      if (v11)
      {
        v40 = objc_alloc_init(VUITextLayout);
        -[VUITextLayout setTextStyle:](v40, "setTextStyle:", 21);
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUITextLayout setColor:](v40, "setColor:", v41);

        -[VUITextLayout setNumberOfLines:](v40, "setNumberOfLines:", 1);
        -[VUIDownloadEntityTableViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("·"), v40, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        -[VUIDownloadEntityTableViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", v43);

        goto LABEL_21;
      }
    }
    else
    {
      -[VUIDownloadEntityTableViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
      v39 = 0;
    }
    v43 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v64, "downloadType") == 1)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("NUMBER_OF_EPISODES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "numberOfMediaItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d"), 0, objc_msgSend(v9, "intValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v11, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v11, "setFontWeight:", 0);
    -[VUITextLayout setNumberOfLines:](v11, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v11, "setColor:", v12);

    -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v14);
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend(v64, "downloadType") == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v5;
      objc_msgSend(v26, "rentalExpirationDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "downloadExpirationDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "availabilityEndDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "assetController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "state");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIRentalExpirationLabel labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:](VUIRentalExpirationLabel, "labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:", v27, v28, v29, objc_msgSend(v31, "status"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_11:
        objc_msgSend(v10, "setDelegate:", self);
        -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v10);
        -[VUIDownloadEntityTableViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
        -[VUIDownloadEntityTableViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", 0);
LABEL_22:

        goto LABEL_23;
      }
    }
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:", CFSTR("EPISODE_NUMBER"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "fractionalEpisodeNumber");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v64, "fractionalEpisodeNumber");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v64, "episodeNumber");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        v45 = 0;
        goto LABEL_27;
      }
      objc_msgSend(v64, "episodeNumber");
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v45 = (void *)v34;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v47 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v47, "setTextStyle:", 20);
      -[VUITextLayout setFontWeight:](v47, "setFontWeight:", 0);
      -[VUITextLayout setNumberOfLines:](v47, "setNumberOfLines:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v47, "setColor:", v48);

      -[VUIDownloadEntityTableViewCell metaDataHeaderFirstLabel](self, "metaDataHeaderFirstLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v46, v47, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v50 = 0;
    }
    -[VUIDownloadEntityTableViewCell setMetaDataHeaderFirstLabel:](self, "setMetaDataHeaderFirstLabel:", v50);
    objc_msgSend(v64, "duration");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      v62 = v45;
      objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0DC6B40]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "transformedValue:", v51);
      v63 = v46;
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v54, "setTextStyle:", 20);
      -[VUITextLayout setFontWeight:](v54, "setFontWeight:", 0);
      -[VUITextLayout setNumberOfLines:](v54, "setNumberOfLines:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v54, "setColor:", v55);

      -[VUIDownloadEntityTableViewCell metaDataHeaderSecondLabel](self, "metaDataHeaderSecondLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v53, v54, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v63;
      -[VUIDownloadEntityTableViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", v57);
      if (v63)
      {
        v58 = objc_alloc_init(VUITextLayout);
        -[VUITextLayout setTextStyle:](v58, "setTextStyle:", 21);
        objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUITextLayout setColor:](v58, "setColor:", v59);

        -[VUITextLayout setNumberOfLines:](v58, "setNumberOfLines:", 1);
        -[VUIDownloadEntityTableViewCell dotSeparatorLabel](self, "dotSeparatorLabel");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", CFSTR("·"), v58, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = v63;
      }
      else
      {
        v61 = 0;
      }
      v45 = v62;
    }
    else
    {
      -[VUIDownloadEntityTableViewCell setMetaDataHeaderSecondLabel:](self, "setMetaDataHeaderSecondLabel:", 0);
      v57 = 0;
      v61 = 0;
    }
    -[VUIDownloadEntityTableViewCell setDotSeparatorLabel:](self, "setDotSeparatorLabel:", v61);

    goto LABEL_22;
  }
LABEL_23:

}

- (void)_addDownloadButtonIfRequired:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  VUIDownloadButton *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, int, int);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  objc_msgSend(v4, "assetController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIDownloadEntityTableViewCell downloadButton](self, "downloadButton");
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
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __63__VUIDownloadEntityTableViewCell__addDownloadButtonIfRequired___block_invoke;
      v13 = &unk_1E9F9B1C0;
      objc_copyWeak(&v14, &location);
      -[VUIDownloadButton setDownloadStateChangeHandler:](v7, "setDownloadStateChangeHandler:", &v10);
      -[VUIDownloadEntityTableViewCell contentView](self, "contentView", v10, v11, v12, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v7);

      -[VUIDownloadEntityTableViewCell setDownloadButton:](self, "setDownloadButton:", v7);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

  }
}

void __63__VUIDownloadEntityTableViewCell__addDownloadButtonIfRequired___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
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

- (void)_removeDownloadButtonIfRequired
{
  void *v3;
  id v4;

  -[VUIDownloadEntityTableViewCell downloadButton](self, "downloadButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "removeFromSuperview");
    -[VUIDownloadEntityTableViewCell setDownloadButton:](self, "setDownloadButton:", 0);
    -[VUIDownloadEntityTableViewCell setPreviousDownloadState:](self, "setPreviousDownloadState:", 0);
    v3 = v4;
  }

}

- (id)_episodePlaceholderImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[VUIDownloadEntityTableViewCell contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", objc_msgSend(v3, "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_imageHeightForCurrentSizeClass
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClass");
  result = 54.0;
  if ((unint64_t)(v2 - 4) < 3)
    return 72.0;
  return result;
}

- (double)_verticalPaddingForCurrentSizeClass
{
  uint64_t v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClass");
  result = 8.0;
  if ((unint64_t)(v2 - 4) < 3)
    return 12.0;
  return result;
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
    -[VUITextLayout setTextStyle:](v12, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v12, "setFontWeight:", 0);
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
    -[VUITextLayout setTextStyle:](v12, "setTextStyle:", 20);
    -[VUITextLayout setFontWeight:](v12, "setFontWeight:", 0);
    -[VUITextLayout setNumberOfLines:](v12, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextLayout setColor:](v12, "setColor:", v15);

  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v11, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (VUIDownloadEntityTableViewCellDelegate)delegate
{
  return (VUIDownloadEntityTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
}

- (void)setDownloadButton:(id)a3
{
  objc_storeStrong((id *)&self->_downloadButton, a3);
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUIImageView)posterImageView
{
  return self->_posterImageView;
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

- (VUIVideosImageView)rightImageView
{
  return self->_rightImageView;
}

- (VUILibraryEpisodeFrameView)episodeImageView
{
  return self->_episodeImageView;
}

- (VUIDownloadEntity)downloadEntity
{
  return self->_downloadEntity;
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
  objc_storeStrong((id *)&self->_episodeImageView, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, 0);
  objc_storeStrong((id *)&self->_posterImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
