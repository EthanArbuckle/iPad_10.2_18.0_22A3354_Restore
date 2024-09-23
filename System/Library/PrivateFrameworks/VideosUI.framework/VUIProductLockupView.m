@implementation VUIProductLockupView

+ (VUIProductLockupView)productLockupViewWithMedia:(id)a3
{
  id v3;
  VUIProductLockupView *v4;
  VUIProductLockupView *v5;

  v3 = a3;
  v4 = [VUIProductLockupView alloc];
  v5 = -[VUIProductLockupView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[VUIProductLockupView updateWithMediaEntity:](v5, "updateWithMediaEntity:", v3);

  return v5;
}

- (VUIProductLockupView)initWithFrame:(CGRect)a3
{
  VUIProductLockupView *v3;
  VUISeparatorView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  VUISeparatorView *topSeparatorView;
  VUISeparatorView *v11;
  VUISeparatorView *bottomSeparatorView;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VUIProductLockupView;
  v3 = -[VUIProductLockupView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUISeparatorView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[VUISeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    topSeparatorView = v3->_topSeparatorView;
    v3->_topSeparatorView = (VUISeparatorView *)v9;

    -[VUIProductLockupView addSubview:](v3, "addSubview:", v3->_topSeparatorView);
    v11 = -[VUISeparatorView initWithFrame:]([VUISeparatorView alloc], "initWithFrame:", v5, v6, v7, v8);
    bottomSeparatorView = v3->_bottomSeparatorView;
    v3->_bottomSeparatorView = v11;

    -[VUIProductLockupView addSubview:](v3, "addSubview:", v3->_bottomSeparatorView);
    objc_initWeak(&location, v3);
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__VUIProductLockupView_initWithFrame___block_invoke;
    v16[3] = &unk_1E9F99F98;
    objc_copyWeak(&v17, &location);
    v14 = (id)-[VUIProductLockupView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v13, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __38__VUIProductLockupView_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_msgSend(WeakRetained, "descriptionTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_contentDescriptionAttributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDescriptionText:", v9);

  }
  objc_msgSend(WeakRetained, "descriptionTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "contentDescriptionExpanded"))
  {
    objc_msgSend(v10, "setMaximumNumberOfLines:", 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMaximumNumberOfLines:", (int)objc_msgSend(v11, "contentDescriptionNumberOfLinesForTraitCollection:", v12));

  }
}

- (void)updateWithMediaEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  char v24;
  char v25;
  id v26;
  __CFString **v27;
  void *v28;
  VUIProductBadgeResource *v29;
  __CFString **v30;
  VUIProductBadgeResource *v31;
  VUIProductBadgeResource *v32;
  VUILibraryProductLockupLayout *v33;
  void *v34;
  VUILibraryProductLockupLayout *v35;
  void *v36;
  VUIProductBadgeResource *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  VUILibraryProductLockupLayout *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  VUIRoundButton *v50;
  VUIRoundButton *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  VUIRentalExpirationLabel *v59;
  VUIRentalExpirationLabel *expirationLabel;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  VUIMediaTagsViewLayout *v88;
  VUIMediaTagsView *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  VUIMediaTagsView *v94;
  VUIMediaTagsViewHelper *v95;
  void *v96;
  VUIMediaTagsViewLayout *v97;
  VUIMediaTagsView *v98;
  VUIMediaTagsViewHelper *v99;
  void *v100;
  SEL v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;

  v111 = a3;
  objc_msgSend(v111, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v111, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v111, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8 == v9;

    }
  }

  objc_msgSend(v111, "HLSResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v111, "resolution");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v111, "HLSColorCapability");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v111, "colorCapability");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(v111, "HLSAudioCapability");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(v111, "audioCapability");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  v23 = objc_msgSend(v14, "unsignedIntegerValue");
  v108 = v18;
  v24 = objc_msgSend(v18, "unsignedIntegerValue");
  v107 = v22;
  v25 = objc_msgSend(v22, "unsignedIntegerValue");
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v110 = v26;
  if ((unint64_t)(v23 - 1) >= 2)
  {
    v28 = v26;
    if (v23 != 3)
      goto LABEL_21;
    v27 = VUIImageResourceMapMediaBadge4k;
  }
  else
  {
    v27 = VUIImageResourceMapMediaBadgeHD;
  }
  v29 = objc_alloc_init(VUIProductBadgeResource);
  -[VUIProductBadgeResource setName:](v29, "setName:", *v27);
  v28 = v110;
  objc_msgSend(v110, "addObject:", v29);

LABEL_21:
  if (!SSDeviceIsHDRCapable())
    goto LABEL_27;
  if ((v24 & 2) != 0)
  {
    v30 = VUIImageResourceMapMediaBadgeDolbyVision;
  }
  else
  {
    if ((v24 & 1) == 0)
      goto LABEL_27;
    v30 = VUIImageResourceMapMediaBadgeHDR;
  }
  v31 = objc_alloc_init(VUIProductBadgeResource);
  -[VUIProductBadgeResource setName:](v31, "setName:", *v30);
  objc_msgSend(v28, "addObject:", v31);

LABEL_27:
  if ((v25 & 1) != 0)
  {
    v32 = objc_alloc_init(VUIProductBadgeResource);
    -[VUIProductBadgeResource setName:](v32, "setName:", CFSTR("dolby-atmos"));
    objc_msgSend(v28, "addObject:", v32);

  }
  v33 = [VUILibraryProductLockupLayout alloc];
  objc_msgSend(v111, "type");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v14;
  if (v10)
  {
    v35 = -[VUILibraryProductLockupLayout initWithLayoutType:entityType:](v33, "initWithLayoutType:entityType:", 0, v34);
    -[VUIProductLockupView setLayout:](self, "setLayout:", v35);

    objc_msgSend(v111, "contentDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIProductLockupView setContentDescription:](self, "setContentDescription:", v36);

    objc_msgSend(v111, "type");
    v37 = (VUIProductBadgeResource *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (VUIProductBadgeResource *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      objc_msgSend(v111, "extrasURL");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "absoluteString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "length");

      if (!v42)
      {
LABEL_39:
        v51 = [VUIRoundButton alloc];
        v50 = -[VUIRoundButton initWithFrame:](v51, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("button-play"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIRoundButton setButtonImage:](v50, "setButtonImage:", v52);
        v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[VUILibraryProductLockupViewLayout playLabelTextLayout](self->_layout, "playLabelTextLayout");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:", CFSTR("PLAY"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v56, v54, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v53, "addObject:", v57);
        objc_msgSend(v111, "rentalExpirationDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          +[VUIRentalExpirationLabel labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:](VUIRentalExpirationLabel, "labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:", v58, 0, 0, CFSTR("EXPIRATION_IN"));
          v59 = (VUIRentalExpirationLabel *)objc_claimAutoreleasedReturnValue();
          expirationLabel = self->_expirationLabel;
          self->_expirationLabel = v59;

          -[VUIRentalExpirationLabel setDelegate:](self->_expirationLabel, "setDelegate:", self);
          objc_msgSend(v53, "addObject:", self->_expirationLabel);
        }
        v61 = (void *)objc_msgSend(v53, "copy");
        -[VUIRoundButton setTextLabels:](v50, "setTextLabels:", v61);

        -[VUIProductLockupView setLeftButton:](self, "setLeftButton:", v50);
        goto LABEL_42;
      }
      v37 = objc_alloc_init(VUIProductBadgeResource);
      -[VUIProductBadgeResource setName:](v37, "setName:", CFSTR("itunes-extras-badge"));
      -[VUIProductBadgeResource setTemplated:](v37, "setTemplated:", 0);
      objc_msgSend(v28, "addObject:", v37);
    }

    goto LABEL_39;
  }
  v43 = -[VUILibraryProductLockupLayout initWithLayoutType:entityType:](v33, "initWithLayoutType:entityType:", 1, v34);
  -[VUIProductLockupView setLayout:](self, "setLayout:", v43);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v111, "seasonNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localizedStringForKey:", CFSTR("SEASON_%@"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "seasonNumber");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithValidatedFormat:validFormatSpecifiers:error:", v47, CFSTR("%@"), 0, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIProductLockupView setSubtitle:](self, "setSubtitle:", v49);
    }
  }
  objc_msgSend(v111, "contentDescription");
  v50 = (VUIRoundButton *)objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView setContentDescription:](self, "setContentDescription:", v50);
LABEL_42:

  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", objc_msgSend(v62, "userInterfaceStyle"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", v63);
  v64 = objc_claimAutoreleasedReturnValue();

  +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:imageType:](VUIMediaEntityImageLoadParamsFactory, "imageLoadParamsWithMediaEntity:imageType:", v111, 0);
  v65 = objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView coverArtImageView](self, "coverArtImageView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    -[VUIProductLockupView coverArtImageView](self, "coverArtImageView");
    v67 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v67 = objc_alloc_init(MEMORY[0x1E0DC6A20]);
  }
  v68 = v67;

  objc_msgSend(v68, "setUserInteractionEnabled:", 0);
  objc_msgSend(v68, "setPlaceholderImage:", v64);
  -[VUIProductLockupView layout](self, "layout");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "coverArtImageSize");
  v71 = v70;
  v73 = v72;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "scale");
  v76 = v71 * v75;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "scale");
  v79 = v73 * v78;

  +[VUIUtilities imageCornerRadiusWithStyle:](VUIUtilities, "imageCornerRadiusWithStyle:", 0);
  v81 = v80;
  v105 = (void *)v65;
  v106 = (void *)v64;
  if (v65)
  {
    v82 = (void *)MEMORY[0x1E0DC6A08];
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "decoratorWithOutlineColor:outlineWidths:", v83, 1.0, 1.0, 1.0, 1.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(v111, "mediaLibrary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = (void *)objc_msgSend(v85, "initWithObject:imageLoader:groupType:", v65, v86, 0);

    objc_msgSend(v84, "setScaleToSize:", v76, v79);
    objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v81);
    objc_msgSend(v84, "setCornerRadii:");
    objc_msgSend(v87, "setDecorator:", v84);
    objc_msgSend(v68, "setImageProxy:", v87);
    objc_msgSend(v68, "setCornerRadius:", 4.0);
LABEL_47:

    goto LABEL_48;
  }
  v101 = NSSelectorFromString(CFSTR("artworkURL"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_49;
  ((void (*)(id, SEL))objc_msgSend(v111, "methodForSelector:", v101))(v111, v101);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v84, "length"))
  {
    v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A50]), "initWithSrc:size:", v84, v76, v79);
    +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setPlaceholderSrc:", v102);

    objc_msgSend(MEMORY[0x1E0DC69B0], "radiiFromRadius:", v81);
    objc_msgSend(v87, "setBorderRadii:");
    objc_msgSend(v87, "setExtension:", CFSTR("jpeg"));
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_imageBorderColor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setBackgroundColor:", v103);

    objc_msgSend(MEMORY[0x1E0DC6A00], "makeImageViewWithDescriptor:existingView:", v87, v68);
    v104 = objc_claimAutoreleasedReturnValue();

    v68 = (void *)v104;
    goto LABEL_47;
  }
LABEL_48:

LABEL_49:
  -[VUIProductLockupView setCoverArtImageView:](self, "setCoverArtImageView:", v68);
  v88 = -[VUIMediaTagsViewLayout initWithType:]([VUIMediaTagsViewLayout alloc], "initWithType:", 8);
  v89 = [VUIMediaTagsView alloc];
  v90 = *MEMORY[0x1E0C9D648];
  v91 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v92 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v93 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v94 = -[VUIMediaTagsView initWithFrame:layout:](v89, "initWithFrame:layout:", v88, *MEMORY[0x1E0C9D648], v91, v92, v93);
  v95 = -[VUIMediaTagsViewHelper initWithVUIMediaEntity:]([VUIMediaTagsViewHelper alloc], "initWithVUIMediaEntity:", v111);
  -[VUIMediaTagsViewHelper addSeperatorKey:](v95, "addSeperatorKey:", CFSTR("·"));
  -[VUIMediaTagsViewHelper tagsViewDictionary](v95, "tagsViewDictionary");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView updateWithMetadata:](v94, "updateWithMetadata:", v96);

  -[VUIProductLockupView setMediaInfoTagsView:](self, "setMediaInfoTagsView:", v94);
  v97 = -[VUIMediaTagsViewLayout initWithType:]([VUIMediaTagsViewLayout alloc], "initWithType:", 7);
  v98 = -[VUIMediaTagsView initWithFrame:layout:]([VUIMediaTagsView alloc], "initWithFrame:layout:", v97, v90, v91, v92, v93);
  v99 = -[VUIMediaTagsViewHelper initWithVUIMediaEntity:]([VUIMediaTagsViewHelper alloc], "initWithVUIMediaEntity:", v111);
  -[VUIMediaTagsViewHelper addSeperatorKey:](v99, "addSeperatorKey:", CFSTR("·"));
  -[VUIMediaTagsViewHelper tagsViewDictionary](v99, "tagsViewDictionary");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView updateWithMetadata:](v98, "updateWithMetadata:", v100);

  -[VUIProductLockupView setMediaBadgeTagsView:](self, "setMediaBadgeTagsView:", v98);
}

- (void)setCoverArtImageView:(id)a3
{
  VUIImageView *v5;
  VUIImageView *coverArtImageView;
  VUIImageView *v7;

  v5 = (VUIImageView *)a3;
  coverArtImageView = self->_coverArtImageView;
  v7 = v5;
  if (coverArtImageView != v5)
  {
    -[VUIImageView removeFromSuperview](coverArtImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_coverArtImageView, a3);
    if (self->_coverArtImageView)
      -[VUIProductLockupView addSubview:](self, "addSubview:");
  }

}

- (void)setCoverArtImageProxy:(id)a3 placeholderImage:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  VUIImageView *v18;
  VUIImageView *coverArtImageView;
  id v20;

  v7 = a3;
  v8 = a4;
  -[VUIImageView imageProxy](self->_coverArtImageView, "imageProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  v10 = v9;
  if (v10 == v20)
  {

  }
  else
  {
    v11 = v10;
    v12 = v20;
    if (!v20 || (v11 = v10, v12 = v20, !v10))
    {
LABEL_14:

LABEL_15:
LABEL_16:
      -[VUIImageView removeFromSuperview](self->_coverArtImageView, "removeFromSuperview");
      v17 = objc_alloc(MEMORY[0x1E0DC6A20]);
      v18 = (VUIImageView *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      coverArtImageView = self->_coverArtImageView;
      self->_coverArtImageView = v18;

      -[VUIImageProxy cancel](self->_coverArtImageProxy, "cancel");
      objc_storeStrong((id *)&self->_coverArtImageProxy, a3);
      objc_storeStrong((id *)&self->_coverArtPlaceholderImage, a4);
      -[VUIImageView setImageProxy:](self->_coverArtImageView, "setImageProxy:", v20);
      -[VUIImageView setPlaceholderImage:](self->_coverArtImageView, "setPlaceholderImage:", v8);
      -[VUIProductLockupView addSubview:](self, "addSubview:", self->_coverArtImageView);
      goto LABEL_17;
    }
    v13 = objc_msgSend(v20, "isEqual:", v10);

    if (!v13)
      goto LABEL_15;
  }
  -[VUIImageView placeholderImage](self->_coverArtImageView, "placeholderImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v15 = v14;
  if (v15 != v11)
  {
    v12 = v15;
    if (v11 && v15)
    {
      v16 = objc_msgSend(v11, "isEqual:", v15);

      if ((v16 & 1) != 0)
        goto LABEL_17;
      goto LABEL_16;
    }

    goto LABEL_14;
  }

LABEL_17:
}

- (void)setMediaInfoTagsView:(id)a3
{
  VUIMediaTagsView *v5;
  VUIMediaTagsView *mediaInfoTagsView;
  VUIMediaTagsView *v7;

  v5 = (VUIMediaTagsView *)a3;
  mediaInfoTagsView = self->_mediaInfoTagsView;
  v7 = v5;
  if (mediaInfoTagsView != v5)
  {
    -[VUIMediaTagsView removeFromSuperview](mediaInfoTagsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_mediaInfoTagsView, a3);
    if (self->_mediaInfoTagsView)
      -[VUIProductLockupView addSubview:](self, "addSubview:");
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
      -[VUIProductLockupView addSubview:](self, "addSubview:");
  }

}

- (void)setSubtitle:(id)a3
{
  NSString **p_subtitle;
  VUILabel *subtitleLabel;
  VUILibraryProductLockupViewLayout *layout;
  void *v8;
  VUILabel *v9;
  VUILabel *v10;
  id v11;
  CGRect v12;

  p_subtitle = &self->_subtitle;
  v11 = a3;
  if (!-[NSString isEqualToString:](*p_subtitle, "isEqualToString:"))
  {
    -[VUILabel removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = 0;

    objc_storeStrong((id *)&self->_subtitle, a3);
    if (-[NSString length](*p_subtitle, "length"))
    {
      layout = self->_layout;
      -[VUIProductLockupView bounds](self, "bounds");
      -[VUILibraryProductLockupViewLayout subtitleTextLayoutForWindowWidth:](layout, "subtitleTextLayoutForWindowWidth:", CGRectGetWidth(v12));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", *p_subtitle, v8, self->_subtitleLabel);
      v9 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      v10 = self->_subtitleLabel;
      self->_subtitleLabel = v9;

      -[VUIProductLockupView addSubview:](self, "addSubview:", self->_subtitleLabel);
    }
  }

}

- (void)setContentDescription:(id)a3
{
  id v5;
  VUILibraryProductLockupViewLayout *layout;
  void *v7;
  void *v8;
  void *v9;
  FocusableTextView *v10;
  FocusableTextView *descriptionTextView;
  FocusableTextView *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_contentDescription, "isEqualToString:", v5))
  {
    -[FocusableTextView removeFromSuperview](self->_descriptionTextView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentDescription, a3);
    if (-[NSString length](self->_contentDescription, "length"))
    {
      layout = self->_layout;
      -[VUIProductLockupView traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUILibraryProductLockupViewLayout descriptionTextLayoutForTraitCollection:isExpanded:](layout, "descriptionTextLayoutForTraitCollection:isExpanded:", v7, -[VUIProductLockupView contentDescriptionExpanded](self, "contentDescriptionExpanded"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIProductLockupView _contentDescriptionAttributedString](self, "_contentDescriptionAttributedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[FocusableTextView textViewWithAttributedString:textLayout:existingTextView:](FocusableTextView, "textViewWithAttributedString:textLayout:existingTextView:", v9, v8, self->_descriptionTextView);
      v10 = (FocusableTextView *)objc_claimAutoreleasedReturnValue();
      descriptionTextView = self->_descriptionTextView;
      self->_descriptionTextView = v10;

      objc_initWeak(&location, self);
      v12 = self->_descriptionTextView;
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __46__VUIProductLockupView_setContentDescription___block_invoke;
      v16 = &unk_1E9FA1640;
      objc_copyWeak(&v17, &location);
      -[FocusableTextView setSelectionHandler:](v12, "setSelectionHandler:", &v13);
      -[VUIProductLockupView addSubview:](self, "addSubview:", self->_descriptionTextView, v13, v14, v15, v16);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
  }

}

void __46__VUIProductLockupView_setContentDescription___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setContentDescriptionExpanded:", 1);
  objc_msgSend(WeakRetained, "descriptionTextView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMaximumNumberOfLines:", 0);

  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentDescriptionExpanded");

}

- (void)setLeftButton:(id)a3
{
  VUIRoundButton *v5;
  VUIRoundButton *leftButton;
  VUIRoundButton *v7;

  v5 = (VUIRoundButton *)a3;
  leftButton = self->_leftButton;
  v7 = v5;
  if (leftButton != v5)
  {
    -[VUIRoundButton removeFromSuperview](leftButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leftButton, a3);
    if (self->_leftButton)
      -[VUIProductLockupView addSubview:](self, "addSubview:");
  }

}

- (void)setDownloadView:(id)a3
{
  UIView *v5;
  UIView *downloadView;
  UIView *v7;

  v5 = (UIView *)a3;
  downloadView = self->_downloadView;
  v7 = v5;
  if (downloadView != v5)
  {
    -[UIView removeFromSuperview](downloadView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_downloadView, a3);
    if (self->_downloadView)
      -[VUIProductLockupView addSubview:](self, "addSubview:");
  }

}

- (void)layoutSubviews
{
  double Width;
  CGRect v4;
  CGRect v5;

  -[VUIProductLockupView bounds](self, "bounds");
  Width = CGRectGetWidth(v4);
  -[VUIProductLockupView bounds](self, "bounds");
  -[VUIProductLockupView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v5));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIProductLockupView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  objc_msgSend(a3, "sizeToFit");
  -[VUIProductLockupView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSubtitleLabelForWindowWidth:(double)a3
{
  VUILibraryProductLockupViewLayout *layout;
  id v5;
  id v6;
  CGRect v7;

  layout = self->_layout;
  -[VUIProductLockupView bounds](self, "bounds", a3);
  -[VUILibraryProductLockupViewLayout subtitleTextLayoutForWindowWidth:](layout, "subtitleTextLayoutForWindowWidth:", CGRectGetWidth(v7));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", self->_subtitle, v6, self->_subtitleLabel);

}

- (id)_contentDescriptionAttributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[VUIProductLockupView contentDescription](self, "contentDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIProductLockupView _contentDescriptionFont](self, "_contentDescriptionFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIProductLockupView contentDescription](self, "contentDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D46960], "parser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DC1138];
    v8 = *MEMORY[0x1E0DC1140];
    v22[0] = *MEMORY[0x1E0DC1138];
    v22[1] = v8;
    v23[0] = v4;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D46960], "displayDelegateWithDefaultAttributes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v11);
    v19 = 0;
    objc_msgSend(v6, "attributedStringForHTMLString:error:", v5, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3498]);
      v20[1] = v8;
      v21[0] = v4;
      v20[0] = v7;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "initWithString:attributes:", v5, v16);

      v12 = (void *)v17;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (CGSize)_sizeOfDescriptionLabel:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:");
  v6 = v5;
  v8 = v7;
  -[VUIProductLockupView layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "layoutTypeForWindowWidth:", a3))
  {

    goto LABEL_5;
  }
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAXEnabled");

  if (v11)
  {
LABEL_5:
    v17 = a3 - v6;
    goto LABEL_6;
  }
  -[VUIProductLockupView layout](self, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coverArtImageSize");
  v14 = a3 - v13;
  -[VUIProductLockupView layout](self, "layout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "coverArtImageRightMarginForWindowWidth:", a3);
  v17 = v14 - v16 - v8;

LABEL_6:
  -[VUIBaseView sizeThatFits:](self->_descriptionTextView, "sizeThatFits:", v17 - v8, 1.79769313e308);
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)_descriptionTopMarginWithBaselineMargin:(double)a3 otherFont:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a4;
  -[VUIProductLockupView _contentDescriptionFont](self, "_contentDescriptionFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView traitCollection](self, "traitCollection");
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

  -[VUIProductLockupView _contentDescriptionFont](self, "_contentDescriptionFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomMarginWithBaselineMargin:traitCollection:", v6, a3);
  v8 = v7;

  return v8;
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", a3.width);
    v9 = v8;
    v11 = width - (v8 + v10);
    -[VUIBaseView sizeThatFits:](self->_topSeparatorView, "sizeThatFits:", v11, 1.79769313e308);
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v9, 0.0, v12, v13);
    -[VUIBaseView sizeThatFits:](self->_bottomSeparatorView, "sizeThatFits:", v11, 1.79769313e308);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v9, height - v14, v15, v14);
    -[VUIProductLockupView _updateSubtitleLabelForWindowWidth:](self, "_updateSubtitleLabelForWindowWidth:", width);
  }
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAXEnabled");

  if (v17)
  {
    -[VUIProductLockupView _layoutForCategoryAccessibility:metricsOnly:](self, "_layoutForCategoryAccessibility:metricsOnly:", v4, width, height);
  }
  else
  {
    -[VUIProductLockupView layout](self, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "layoutTypeForWindowWidth:", width);

    if (v21)
      -[VUIProductLockupView _layoutForStacked:metricsOnly:](self, "_layoutForStacked:metricsOnly:", v4, width, height);
    else
      -[VUIProductLockupView _layoutForCompact:metricsOnly:](self, "_layoutForCompact:metricsOnly:", v4, width, height);
  }
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  VUILabel *subtitleLabel;
  double v37;
  double v38;
  double v39;
  VUIRoundButton *leftButton;
  double v41;
  UIView *downloadView;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGSize result;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", a3.width, a3.height);
  v8 = v7;
  v10 = v9;
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  v12 = v11;
  -[VUILibraryProductLockupViewLayout coverArtImageSize](self->_layout, "coverArtImageSize");
  v49 = v13;
  v56 = v14;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width - (v8 + v10), 1.79769313e308);
  v47 = v15;
  v17 = v16;
  -[VUIProductLockupView _sizeOfDescriptionLabel:](self, "_sizeOfDescriptionLabel:", width);
  v51 = v18;
  v55 = v19;
  -[UIView sizeThatFits:](self->_downloadView, "sizeThatFits:", width, 1.79769313e308);
  v52 = v20;
  v54 = v21;
  -[VUIRoundButton sizeThatFits:](self->_leftButton, "sizeThatFits:", width, 1.79769313e308);
  v50 = v22;
  v53 = v23;
  -[VUIProductLockupView _contentDescriptionFont](self, "_contentDescriptionFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductLockupViewLayout contentDescriptionTopMarginForWindowWidth:](self->_layout, "contentDescriptionTopMarginForWindowWidth:", width);
  v26 = v25;
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topMarginWithBaselineMargin:traitCollection:", v27, v26);

  -[VUIBaseView sizeThatFits:](self->_mediaInfoTagsView, "sizeThatFits:", width, 1.79769313e308);
  v48 = v28;
  v30 = v29;
  -[VUIBaseView sizeThatFits:](self->_mediaBadgeTagsView, "sizeThatFits:", width, 1.79769313e308);
  v33 = v32;
  if (!a4)
  {
    v34 = v31;
    -[VUIImageView setFrame:](self->_coverArtImageView, "setFrame:", v8, v12, v49, v56);
    v35 = v12 + v56;
    subtitleLabel = self->_subtitleLabel;
    if (subtitleLabel)
    {
      -[VUILabel setFrame:](subtitleLabel, "setFrame:", v8, v35, v47, v17);
      VUIRoundValue();
    }
    else
    {
      +[VUIViewSpacer spacerA](VUIViewSpacer, "spacerA");
    }
    v38 = v35 + v37;
    -[VUIMediaTagsView setFrame:](self->_mediaInfoTagsView, "setFrame:", v8, v38, v48, v30);
    -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", v8, v30 + v38, v34, v33);
    -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", v8, v33 + v30 + v38, v51, v55);
    v39 = v55 + v33 + v30 + v38;
    leftButton = self->_leftButton;
    -[VUILibraryProductLockupViewLayout buttonModuleTopMarginForWindowWidth:](self->_layout, "buttonModuleTopMarginForWindowWidth:", width);
    -[VUIRoundButton setFrame:](leftButton, "setFrame:", v8, v39 + v41, v50, v53);
    downloadView = self->_downloadView;
    -[VUILibraryProductLockupViewLayout buttonModuleTopMarginForWindowWidth:](self->_layout, "buttonModuleTopMarginForWindowWidth:", width);
    -[UIView setFrame:](downloadView, "setFrame:", v8, v53 + v39 + v43, v52, v54);
  }
  if (v17 <= 0.0)
    +[VUIViewSpacer spacerA](VUIViewSpacer, "spacerA");
  VUIRoundValue();
  v45 = v44;
  v46 = width;
  result.height = v45;
  result.width = v46;
  return result;
}

- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MaxY;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  FocusableTextView *descriptionTextView;
  VUIMediaTagsView *mediaBadgeTagsView;
  VUIMediaTagsView *mediaInfoTagsView;
  VUILabel *subtitleLabel;
  UIView *downloadView;
  VUIImageView *coverArtImageView;
  VUIRoundButton *leftButton;
  double v87;
  double v88;
  double v89;
  double v90;
  VUIRoundButton *v91;
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
  double y;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  CGFloat v110;
  CGFloat v111;
  double v112;
  CGFloat v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double rect;
  double v123;
  CGFloat v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  double v131;
  double v132;
  CGSize result;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v4 = a4;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", a3.width, a3.height);
  v8 = v7;
  v10 = v9;
  -[VUILibraryProductLockupViewLayout coverArtImageSize](self->_layout, "coverArtImageSize");
  v12 = v11;
  v132 = v13;
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  v125 = v14;
  -[VUIProductLockupView _sizeOfDescriptionLabel:](self, "_sizeOfDescriptionLabel:", width);
  v118 = v15;
  v128 = v16;
  -[VUILabel font](self->_subtitleLabel, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductLockupViewLayout subtitleTopMarginForWindowWidth:](self->_layout, "subtitleTopMarginForWindowWidth:", width);
  v19 = v18;
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topMarginWithBaselineMargin:traitCollection:", v20, v19);
  v114 = v21;

  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, 1.79769313e308);
  rect = v22;
  v24 = v23;
  -[VUIProductLockupView _contentDescriptionFont](self, "_contentDescriptionFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductLockupViewLayout contentDescriptionTopMarginForWindowWidth:](self->_layout, "contentDescriptionTopMarginForWindowWidth:", width);
  v27 = v26;
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topMarginWithBaselineMargin:traitCollection:", v28, v27);
  v131 = v29;

  -[VUIProductLockupView _contentDescriptionFont](self, "_contentDescriptionFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUILibraryProductLockupViewLayout contentDescriptionBottomMarginForWindowWidth:](self->_layout, "contentDescriptionBottomMarginForWindowWidth:", width);
  v32 = v31;
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomMarginWithBaselineMargin:traitCollection:", v33, v32);
  v127 = v34;

  -[VUIBaseView sizeThatFits:](self->_mediaInfoTagsView, "sizeThatFits:", width, 1.79769313e308);
  v36 = v35;
  v130 = v37;
  -[VUIBaseView sizeThatFits:](self->_mediaBadgeTagsView, "sizeThatFits:", width, 1.79769313e308);
  v116 = v38;
  v129 = v39;
  -[VUILibraryProductLockupViewLayout metadataTopMargin](self->_layout, "metadataTopMargin");
  v41 = v40;
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v42, v41);
  v126 = v43;

  v112 = v10;
  -[VUIRoundButton sizeThatFits:](self->_leftButton, "sizeThatFits:", width - v8 - v10, 1.79769313e308);
  v120 = v44;
  v123 = v45;
  -[UIView sizeThatFits:](self->_downloadView, "sizeThatFits:", width - v8 - v10, 1.79769313e308);
  if (!v4)
  {
    v105 = v46;
    v106 = v36;
    v124 = v8;
    v109 = v47;
    v113 = v24;
    v49 = *MEMORY[0x1E0C9D648];
    v48 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v51 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v50 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[VUIProductLockupView frame](self, "frame");
    v52 = CGRectGetMidX(v134) + v12 * -0.5;
    v135.origin.x = v52;
    v135.origin.y = v125;
    v135.size.width = v12;
    v135.size.height = v132;
    MaxY = CGRectGetMaxY(v135);
    v121 = v50;
    v110 = v48;
    v111 = v49;
    v108 = v12;
    if (self->_subtitleLabel)
    {
      v136.origin.x = v52;
      v136.origin.y = v125;
      v136.size.width = v12;
      v136.size.height = v132;
      v137.origin.y = v114 + CGRectGetMaxY(v136);
      v54 = v124;
      v137.origin.x = v124;
      y = v137.origin.y;
      v137.size.width = rect;
      v137.size.height = v113;
      CGRectGetMaxY(v137);
      v55 = v126;
      VUIRoundValue();
      v57 = v56;
      v102 = v124;
      v103 = v113;
    }
    else
    {
      v55 = v126;
      v57 = v126 + MaxY;
      v103 = v50;
      y = v48;
      rect = v51;
      v102 = v49;
      v54 = v124;
    }
    v58 = v106;
    if (self->_mediaInfoTagsView)
    {
      v138.origin.x = v54;
      v138.origin.y = v57;
      v138.size.width = v106;
      v138.size.height = v130;
      CGRectGetMaxY(v138);
      VUIRoundValue();
      v60 = v59;
      v61 = v54;
      v62 = v130;
      v100 = v106;
      v101 = v130;
      v98 = v54;
      v99 = v57;
      v64 = v110;
      v63 = v111;
    }
    else
    {
      v60 = v55 + v57;
      v61 = v52;
      v57 = v125;
      v58 = v108;
      v62 = v132;
      v100 = v51;
      v101 = v50;
      v64 = v110;
      v63 = v111;
      v98 = v111;
      v99 = v110;
    }
    v115 = v52;
    v65 = v51;
    v66 = v64;
    v67 = v63;
    if (self->_mediaBadgeTagsView)
    {
      v61 = v54;
      v65 = v116;
      v58 = v116;
      v57 = v55 + v60;
      v62 = v129;
      v50 = v129;
      v66 = v55 + v60;
      v67 = v54;
    }
    v95 = v67;
    v96 = v66;
    v97 = v65;
    v107 = v50;
    if (self->_descriptionTextView)
    {
      v68 = v57;
      v69 = v58;
      v70 = v131 + CGRectGetMaxY(*(CGRect *)&v61);
      v62 = v128;
      v121 = v128;
      v58 = v118;
      v117 = v118;
      v71 = v124;
      v72 = v124;
      v61 = v124;
      v57 = v70;
    }
    else
    {
      v117 = v51;
      v70 = v64;
      v72 = v63;
      v71 = v124;
    }
    v73 = v57;
    v74 = v58;
    v75 = v127 + CGRectGetMaxY(*(CGRect *)&v61);
    v76 = -[VUILibraryProductLockupViewLayout downloadButtonPosition](self->_layout, "downloadButtonPosition");
    v77 = v71;
    if (v76 == 5)
    {
      v139.origin.y = v110;
      v139.origin.x = v111;
      v139.size.width = v105;
      v139.size.height = v109;
      v77 = width - v112 - CGRectGetWidth(v139);
    }
    v119 = v77;
    VUIRoundValue();
    v79 = v78;
    if (-[VUIProductLockupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[VUIProductLockupView bounds](self, "bounds");
      descriptionTextView = self->_descriptionTextView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[FocusableTextView setFrame:](descriptionTextView, "setFrame:");
      mediaBadgeTagsView = self->_mediaBadgeTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIMediaTagsView setFrame:](mediaBadgeTagsView, "setFrame:");
      mediaInfoTagsView = self->_mediaInfoTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIMediaTagsView setFrame:](mediaInfoTagsView, "setFrame:");
      subtitleLabel = self->_subtitleLabel;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUILabel setFrame:](subtitleLabel, "setFrame:");
      downloadView = self->_downloadView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[UIView setFrame:](downloadView, "setFrame:");
      coverArtImageView = self->_coverArtImageView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIImageView setFrame:](coverArtImageView, "setFrame:");
      leftButton = self->_leftButton;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v91 = leftButton;
    }
    else
    {
      -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", v72, v70, v117, v121);
      -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", v95, v96, v97, v107);
      -[VUIMediaTagsView setFrame:](self->_mediaInfoTagsView, "setFrame:", v98, v99, v100, v101);
      -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v102, y, rect, v103);
      -[UIView setFrame:](self->_downloadView, "setFrame:", v119, v79, v105, v109);
      -[VUIImageView setFrame:](self->_coverArtImageView, "setFrame:", v115, v125, v108, v132);
      v91 = self->_leftButton;
      v88 = v75;
      v89 = v120;
      v87 = v124;
      v90 = v123;
    }
    -[VUIRoundButton setFrame:](v91, "setFrame:", v87, v88, v89, v90, *(_QWORD *)&v95, *(_QWORD *)&v96, *(_QWORD *)&v97);
  }
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  VUIRoundValue();
  v93 = v92;
  v94 = width;
  result.height = v93;
  result.width = v94;
  return result;
}

- (CGSize)_layoutForStacked:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat MinY;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  VUIRoundButton *leftButton;
  FocusableTextView *descriptionTextView;
  UIView *downloadView;
  VUIImageView *coverArtImageView;
  VUILabel *subtitleLabel;
  VUIMediaTagsView *mediaBadgeTagsView;
  VUIMediaTagsView *mediaInfoTagsView;
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
  CGFloat v109;
  double v110;
  CGFloat v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double rect;
  double recta;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CGSize result;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", a3.width, a3.height);
  v8 = v7;
  v10 = v9;
  +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  v126 = v11;
  -[VUILibraryProductLockupViewLayout coverArtImageSize](self->_layout, "coverArtImageSize");
  v13 = v12;
  v15 = v14;
  -[VUILibraryProductLockupViewLayout coverArtImageRightMarginForWindowWidth:](self->_layout, "coverArtImageRightMarginForWindowWidth:", width);
  v128 = v8;
  v107 = v10;
  v127 = v13;
  v123 = v16;
  v17 = v8 + v10 + v13 + v16;
  -[VUILabel font](self->_subtitleLabel, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topMarginWithBaselineMargin:traitCollection:", v19, 30.0);
  v21 = v20;

  -[VUILabel font](self->_subtitleLabel, "font");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomMarginWithBaselineMargin:traitCollection:", v23, 16.0);
  v110 = v24;

  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width - v17, 1.79769313e308);
  v111 = v25;
  v109 = v26;
  -[VUIProductLockupView _sizeOfDescriptionLabel:](self, "_sizeOfDescriptionLabel:", width);
  v28 = v27;
  v30 = v29;
  -[VUILibraryProductLockupViewLayout contentDescriptionTopMarginForWindowWidth:](self->_layout, "contentDescriptionTopMarginForWindowWidth:", width);
  v32 = v31;
  -[VUILabel font](self->_subtitleLabel, "font");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIProductLockupView _descriptionTopMarginWithBaselineMargin:otherFont:](self, "_descriptionTopMarginWithBaselineMargin:otherFont:", v33, v32);
  v35 = v34;

  -[VUILibraryProductLockupViewLayout contentDescriptionBottomMarginForWindowWidth:](self->_layout, "contentDescriptionBottomMarginForWindowWidth:", width);
  -[VUIProductLockupView _descriptionBottomMarginWithBaselineMargin:](self, "_descriptionBottomMarginWithBaselineMargin:");
  -[VUIBaseView sizeThatFits:](self->_mediaInfoTagsView, "sizeThatFits:", width, 1.79769313e308);
  rect = v36;
  v122 = v37;
  -[VUIBaseView sizeThatFits:](self->_mediaBadgeTagsView, "sizeThatFits:", width, 1.79769313e308);
  v118 = v38;
  v121 = v39;
  -[UIView sizeThatFits:](self->_downloadView, "sizeThatFits:", v17, 1.79769313e308);
  v115 = v40;
  v125 = v41;
  -[VUIRoundButton sizeThatFits:](self->_leftButton, "sizeThatFits:", v17, 1.79769313e308);
  v124 = v43;
  if (!a4)
  {
    v92 = v28;
    v97 = v42;
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v113 = *MEMORY[0x1E0C9D648];
    v46 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v108 = v30;
    v114 = v35;
    v106 = width;
    v116 = v44;
    v117 = v46;
    if (-[VUILibraryProductLockupViewLayout type](self->_layout, "type") == 1)
    {
      v47 = v45;
      v48 = v46;
      v49 = v44;
      v50 = v113;
      v51 = v127;
      if (self->_subtitleLabel)
      {
        v50 = v128;
        v130.origin.x = v128;
        v130.origin.y = v21;
        v48 = v111;
        v130.size.width = v111;
        v45 = v109;
        v130.size.height = v109;
        v126 = v110 + CGRectGetMaxY(v130);
        v49 = v21;
      }
    }
    else
    {
      v47 = v45;
      v48 = v46;
      v49 = v44;
      v50 = v113;
      v51 = v127;
    }
    v98 = v50;
    v99 = v49;
    v100 = v48;
    v101 = v45;
    v131.origin.x = v128;
    v131.origin.y = v126;
    v131.size.width = v51;
    v131.size.height = v15;
    MinY = CGRectGetMinY(v131);
    v53 = v128;
    v54 = v126;
    v55 = v51;
    v56 = v51;
    v57 = v15;
    v112 = v47;
    v58 = v47;
    v60 = v116;
    v59 = v117;
    v61 = v113;
    v62 = v113;
    if (self->_mediaInfoTagsView)
    {
      v63 = v128;
      v64 = v126;
      v65 = v15;
      v53 = v123 + CGRectGetMaxX(*(CGRect *)(&v55 - 2));
      v54 = MinY;
      v59 = rect;
      v56 = rect;
      v58 = v122;
      v57 = v122;
      v60 = MinY;
      v62 = v53;
    }
    recta = v15;
    v104 = v59;
    v105 = v58;
    v102 = v62;
    v103 = v60;
    if (self->_mediaBadgeTagsView)
    {
      v132.size.width = v127;
      v132.origin.x = v128;
      v132.origin.y = v126;
      v132.size.height = v15;
      v66 = v54;
      v67 = v56;
      v68 = v123 + CGRectGetMaxX(v132);
      v133.origin.x = v53;
      v133.origin.y = v66;
      v133.size.width = v67;
      v133.size.height = v57;
      v57 = v121;
      v95 = v68;
      v96 = v121;
      v54 = v114 + CGRectGetMaxY(v133);
      v53 = v68;
      v94 = v54;
      v56 = v118;
    }
    else
    {
      v95 = v113;
      v96 = v112;
      v118 = v117;
      v94 = v116;
    }
    if (self->_descriptionTextView)
    {
      v134.size.width = v127;
      v134.origin.x = v128;
      v134.origin.y = v126;
      v134.size.height = v15;
      v69 = v54;
      v70 = v56;
      v71 = v123 + CGRectGetMaxX(v134);
      v135.origin.x = v53;
      v135.origin.y = v69;
      v135.size.width = v70;
      v135.size.height = v57;
      v57 = v108;
      v112 = v108;
      v113 = v71;
      v54 = v114 + CGRectGetMaxY(v135);
      v56 = v92;
      v117 = v92;
      v53 = v71;
      v93 = v54;
      v72 = v116;
    }
    else
    {
      v72 = v116;
      v93 = v116;
    }
    v136.origin.x = v53;
    v136.origin.y = v54;
    v136.size.width = v56;
    v136.size.height = v57;
    CGRectGetMaxY(v136);
    VUIRoundValue();
    v74 = v73;
    v75 = v72;
    v76 = v61;
    v77 = v61;
    width = v106;
    if (self->_downloadView)
    {
      if (-[VUILibraryProductLockupViewLayout downloadButtonPosition](self->_layout, "downloadButtonPosition") == 5)
      {
        v137.origin.x = v76;
        v137.origin.y = v72;
        v137.size.width = v115;
        v137.size.height = v125;
        v77 = v106 - v107 - CGRectGetWidth(v137);
      }
      else
      {
        v138.origin.x = v128;
        v138.origin.y = v126;
        v138.size.width = v127;
        v138.size.height = recta;
        v77 = v123 + CGRectGetMaxX(v138);
      }
      v75 = v74;
    }
    if (self->_leftButton)
    {
      v139.origin.x = v128;
      v139.origin.y = v126;
      v139.size.width = v127;
      v139.size.height = recta;
      v76 = v123 + CGRectGetMaxX(v139);
      v72 = v74;
    }
    if (-[VUIProductLockupView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[VUIProductLockupView bounds](self, "bounds");
      leftButton = self->_leftButton;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIRoundButton setFrame:](leftButton, "setFrame:");
      descriptionTextView = self->_descriptionTextView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[FocusableTextView setFrame:](descriptionTextView, "setFrame:");
      downloadView = self->_downloadView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[UIView setFrame:](downloadView, "setFrame:");
      coverArtImageView = self->_coverArtImageView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIImageView setFrame:](coverArtImageView, "setFrame:");
      subtitleLabel = self->_subtitleLabel;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUILabel setFrame:](subtitleLabel, "setFrame:");
      mediaBadgeTagsView = self->_mediaBadgeTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      -[VUIMediaTagsView setFrame:](mediaBadgeTagsView, "setFrame:");
      mediaInfoTagsView = self->_mediaInfoTagsView;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
    }
    else
    {
      -[VUIRoundButton setFrame:](self->_leftButton, "setFrame:", v76, v72, v97, v124);
      -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", v113, v93, v117, v112);
      -[UIView setFrame:](self->_downloadView, "setFrame:", v77, v75, v115, v125);
      -[VUIImageView setFrame:](self->_coverArtImageView, "setFrame:", v128, v126, v127, recta);
      -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v98, v99, v100, v101);
      -[VUIMediaTagsView setFrame:](self->_mediaBadgeTagsView, "setFrame:", v95, v94, v118, v96);
      mediaInfoTagsView = self->_mediaInfoTagsView;
      v87 = v104;
      v88 = v105;
      v85 = v102;
      v86 = v103;
    }
    -[VUIMediaTagsView setFrame:](mediaInfoTagsView, "setFrame:", v85, v86, v87, v88);
  }
  if (-[VUILibraryProductLockupViewLayout type](self->_layout, "type") == 1 && self->_subtitleLabel)
  {
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  }
  else
  {
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  }
  if (self->_downloadView || self->_leftButton)
    +[VUIViewSpacer spacerB](VUIViewSpacer, "spacerB");
  VUIRoundValue();
  v90 = v89;
  v91 = width;
  result.height = v90;
  result.width = v91;
  return result;
}

- (id)_contentDescriptionFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CGRect v8;

  v3 = (void *)MEMORY[0x1E0DC3F98];
  -[VUIProductLockupView bounds](self, "bounds");
  v4 = objc_msgSend(v3, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v8));
  -[VUIProductLockupView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentDescriptionFontForSizeClass:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VUILibraryProductLockupViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (VUIImageProxy)coverArtImageProxy
{
  return self->_coverArtImageProxy;
}

- (UIImage)coverArtPlaceholderImage
{
  return self->_coverArtPlaceholderImage;
}

- (VUIRoundButton)leftButton
{
  return self->_leftButton;
}

- (UIView)downloadView
{
  return self->_downloadView;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSNumber)releaseYear
{
  return self->_releaseYear;
}

- (void)setReleaseYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSString)availabilityText
{
  return self->_availabilityText;
}

- (void)setAvailabilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)badgeResources
{
  return self->_badgeResources;
}

- (void)setBadgeResources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (VUIProductLockupViewDelegate)delegate
{
  return (VUIProductLockupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparatorView, a3);
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void)setBottomSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
}

- (VUIImageView)coverArtImageView
{
  return self->_coverArtImageView;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (FocusableTextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
}

- (BOOL)contentDescriptionExpanded
{
  return self->_contentDescriptionExpanded;
}

- (void)setContentDescriptionExpanded:(BOOL)a3
{
  self->_contentDescriptionExpanded = a3;
}

- (BOOL)didSetUpViews
{
  return self->_didSetUpViews;
}

- (void)setDidSetUpViews:(BOOL)a3
{
  self->_didSetUpViews = a3;
}

- (VUIRentalExpirationLabel)expirationLabel
{
  return self->_expirationLabel;
}

- (void)setExpirationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_expirationLabel, a3);
}

- (UIImage)contentRatingImage
{
  return self->_contentRatingImage;
}

- (void)setContentRatingImage:(id)a3
{
  objc_storeStrong((id *)&self->_contentRatingImage, a3);
}

- (VUIMediaTagsView)mediaInfoTagsView
{
  return self->_mediaInfoTagsView;
}

- (VUIMediaTagsView)mediaBadgeTagsView
{
  return self->_mediaBadgeTagsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaBadgeTagsView, 0);
  objc_storeStrong((id *)&self->_mediaInfoTagsView, 0);
  objc_storeStrong((id *)&self->_contentRatingImage, 0);
  objc_storeStrong((id *)&self->_expirationLabel, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_coverArtImageView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeResources, 0);
  objc_storeStrong((id *)&self->_availabilityText, 0);
  objc_storeStrong((id *)&self->_releaseYear, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_downloadView, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_coverArtPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_coverArtImageProxy, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
