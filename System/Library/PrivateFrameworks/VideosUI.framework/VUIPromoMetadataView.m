@implementation VUIPromoMetadataView

- (VUIPromoMetadataView)init
{
  VUIPromoMetadataView *v2;
  VUIPromoMetadataView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIPromoMetadataView;
  v2 = -[VUIPromoMetadataView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VUIPromoMetadataView _configureLayout](v2, "_configureLayout");
    -[VUIPromoMetadataView setAddToUpNextSymbolName:](v3, "setAddToUpNextSymbolName:", CFSTR("plus"));
    -[VUIPromoMetadataView setAddedToUpNextSymbolName:](v3, "setAddedToUpNextSymbolName:", CFSTR("checkmark"));
    -[VUIPromoMetadataView vui_setOverrideUserInterfaceStyle:](v3, "vui_setOverrideUserInterfaceStyle:", 2);
  }
  return v3;
}

- (void)updateWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  VUIContentMetadata *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;

  v4 = a3;
  -[VUIPromoMetadataView setSkipInfo:](self, "setSkipInfo:", v4);
  v48 = v4;
  objc_msgSend(v4, "promoInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataView setOnlySkipButtonAvailable:](self, "setOnlySkipButtonAvailable:", 1);
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNetworkReachable");

  if (v7)
  {
    objc_msgSend(v5, "titleImageURLString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      -[VUIPromoMetadataView titleImageView](self, "titleImageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        v11 = objc_alloc(MEMORY[0x1E0DC6A20]);
        v10 = (id)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      }
      v12 = v10;

      objc_msgSend(v5, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessibilityLabel:", v13);

      objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("TitleImage"));
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __39__VUIPromoMetadataView_updateWithInfo___block_invoke;
      v49[3] = &unk_1E9F9BAC8;
      v50 = v12;
      v14 = v12;
      objc_msgSend(v5, "getTitleImageUsingCompletionHandler:", v49);
      objc_msgSend(v5, "expectedImageSize");
      -[VUIPromoMetadataView setExpectedImageSize:](self, "setExpectedImageSize:");
      -[VUIPromoMetadataView titleImageView](self, "titleImageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPromoMetadataView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v14, v15);

      -[VUIPromoMetadataView setTitleImageView:](self, "setTitleImageView:", v14);
      -[VUIPromoMetadataView setOnlySkipButtonAvailable:](self, "setOnlySkipButtonAvailable:", 0);

    }
    else
    {
      -[VUIPromoMetadataView setTitleImageView:](self, "setTitleImageView:", 0);
    }
    v16 = (void *)objc_opt_new();
    objc_msgSend(v5, "genre");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("genreName"));
    objc_msgSend(v5, "movieRuntime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "doubleValue");
      if (v20 != 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("duration"));

      }
    }
    objc_msgSend(v5, "ratingDisplayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ratingSystem");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v22 && v23)
    {
      objc_msgSend(v16, "setObject:forKey:", v22, CFSTR("ratingName"));
      objc_msgSend(v16, "setObject:forKey:", v24, CFSTR("ratingSystem"));
    }
    if (objc_msgSend(v16, "count"))
    {
      v25 = -[VUIContentMetadata initWithDictionary:]([VUIContentMetadata alloc], "initWithDictionary:", v16);
      v46 = v7;
      -[VUIPromoMetadataView mediaTagsViewLayout](self, "mediaTagsViewLayout");
      v45 = v16;
      v26 = v22;
      v27 = v19;
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPromoMetadataView mediaTagsView](self, "mediaTagsView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaTagsView tagsViewWithMetadata:layout:existingView:](VUIMediaTagsView, "tagsViewWithMetadata:layout:existingView:", v25, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v28;
      v19 = v27;
      v22 = v26;
      v16 = v45;
      objc_msgSend(v31, "setAccessibilityIdentifier:", CFSTR("MediaTags"));
      -[VUIPromoMetadataView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v31, 0);
      -[VUIPromoMetadataView setMediaTagsView:](self, "setMediaTagsView:", v31);
      -[VUIPromoMetadataView setOnlySkipButtonAvailable:](self, "setOnlySkipButtonAvailable:", 0);

      v7 = v46;
    }
    else
    {
      -[VUIPromoMetadataView mediaTagsView](self, "mediaTagsView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "removeFromSuperview");

      -[VUIPromoMetadataView setMediaTagsView:](self, "setMediaTagsView:", 0);
    }

  }
  objc_msgSend(v5, "addToUpNextLabelString");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33
    && ((v34 = (void *)v33,
         objc_msgSend(v5, "addedToUpNextLabelString"),
         (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      ? (v36 = v7)
      : (v36 = 0),
        v35,
        v34,
        v36 == 1))
  {
    -[VUIPromoMetadataView _createUpNextButtonWithPromoInfo:](self, "_createUpNextButtonWithPromoInfo:", v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAccessibilityIdentifier:", CFSTR("UpNextButton"));
    -[VUIPromoMetadataView upNextButton](self, "upNextButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPromoMetadataView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v37, v38);

    -[VUIPromoMetadataView setUpNextButton:](self, "setUpNextButton:", v37);
    -[VUIPromoMetadataView _createComputationOnlyButton](self, "_createComputationOnlyButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPromoMetadataView setComputationOnlyButton:](self, "setComputationOnlyButton:", v39);

    -[VUIPromoMetadataView setOnlySkipButtonAvailable:](self, "setOnlySkipButtonAvailable:", 0);
  }
  else
  {
    -[VUIPromoMetadataView setUpNextButton:](self, "setUpNextButton:", 0);
    -[VUIPromoMetadataView setComputationOnlyButton:](self, "setComputationOnlyButton:", 0);
  }
  objc_msgSend(v48, "localizedTitle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "length"))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:", CFSTR("SKIP_INTRO"));
    v42 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v42;
  }
  -[VUIPromoMetadataView _createSkipButtonWithTitle:](self, "_createSkipButtonWithTitle:", v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAccessibilityIdentifier:", CFSTR("SkipButton"));
  -[VUIPromoMetadataView skipButton](self, "skipButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v43, v44);

  -[VUIPromoMetadataView setSkipButton:](self, "setSkipButton:", v43);
}

uint64_t __39__VUIPromoMetadataView_updateWithInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", a2);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
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
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
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
  void *v86;
  void *v87;
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
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[VUIPromoMetadataView onlySkipButtonAvailable](self, "onlySkipButtonAvailable"))
  {
    -[VUIPromoMetadataView skipButton](self, "skipButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_sizeThatFits:", width, height);
    v10 = v9;
    v12 = v11;

    if (!a4)
    {
      -[VUIPromoMetadataView skipButton](self, "skipButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0.0;
      v16 = 0.0;
      v17 = v10;
      v18 = v12;
LABEL_30:
      objc_msgSend(v13, "setFrame:", v15, v16, v17, v18);

      v10 = *MEMORY[0x1E0C9D820];
      v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  -[VUIPromoMetadataView expectedImageSize](self, "expectedImageSize");
  v99 = v19;
  v95 = v20;
  -[VUIPromoMetadataView mediaTagsView](self, "mediaTagsView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "vui_sizeThatFits:", width, 0.0);
  v101 = v22;
  v97 = v23;

  -[VUIPromoMetadataView skipButton](self, "skipButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "vui_sizeThatFits:", width, height);
  v26 = v25;
  v28 = v27;

  -[VUIPromoMetadataView upNextButton](self, "upNextButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "vui_sizeThatFits:", width, height);
  v31 = v30;
  v33 = v32;

  -[VUIPromoMetadataView computationOnlyButton](self, "computationOnlyButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "vui_sizeThatFits:", width, height);
  v36 = v35;

  if (v31 >= v26)
    v37 = v31;
  else
    v37 = v26;
  if (v37 >= v36)
    v36 = v37;
  -[VUIPromoMetadataView upNextButtonRightMargin](self, "upNextButtonRightMargin");
  v39 = v38 + v36 * 2.0;
  -[VUIPromoMetadataView maxButtonWidth](self, "maxButtonWidth");
  v41 = v40;
  -[VUIPromoMetadataView upNextButtonRightMargin](self, "upNextButtonRightMargin");
  v43 = v42;
  -[VUIPromoMetadataView minButtonWidth](self, "minButtonWidth");
  v45 = v44;
  -[VUIPromoMetadataView upNextButtonRightMargin](self, "upNextButtonRightMargin");
  v47 = v46 + v45 * 2.0;
  if (v39 >= v47)
  {
    v47 = v43 + v41 * 2.0;
    if (v39 <= v47)
    {
      v54 = v101;
      goto LABEL_15;
    }
    -[VUIPromoMetadataView maxButtonWidth](self, "maxButtonWidth");
  }
  else
  {
    -[VUIPromoMetadataView minButtonWidth](self, "minButtonWidth");
  }
  v49 = v48;
  -[VUIPromoMetadataView skipButton](self, "skipButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "vui_sizeThatFits:", v49, 0.0);
  v28 = v51;

  -[VUIPromoMetadataView upNextButton](self, "upNextButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "vui_sizeThatFits:", v49, 0.0);
  v33 = v53;
  v54 = v101;

  v39 = v47;
LABEL_15:
  if (v28 >= v33)
    v55 = v28;
  else
    v55 = v33;
  -[VUIPromoMetadataView defaultButtonHeight](self, "defaultButtonHeight");
  if (v55 >= v56)
    v57 = v55;
  else
    v57 = v56;
  -[VUIPromoMetadataView imageViewBottomMargin](self, "imageViewBottomMargin");
  v59 = v58;
  -[VUIPromoMetadataView mediaTagsViewBottomMargin](self, "mediaTagsViewBottomMargin");
  if (v39 >= v54)
    v61 = v39;
  else
    v61 = v54;
  if (v61 >= v99)
    v10 = v61;
  else
    v10 = v99;
  if (!a4)
  {
    -[VUIPromoMetadataView vuiIsRTL](self, "vuiIsRTL");
    -[VUIPromoMetadataView imageViewBottomMargin](self, "imageViewBottomMargin");
    -[VUIPromoMetadataView mediaTagsViewBottomMargin](self, "mediaTagsViewBottomMargin");
    -[VUIPromoMetadataView upNextButtonRightMargin](self, "upNextButtonRightMargin");
    -[VUIPromoMetadataView bounds](self, "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v100 = v62;
    v94 = v64;
    v96 = v63;
    v93 = v65;
    -[VUIPromoMetadataView bounds](self, "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v102 = v66;
    v98 = v67;
    v91 = v69;
    v92 = v68;
    -[VUIPromoMetadataView bounds](self, "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;
    -[VUIPromoMetadataView bounds](self, "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v79 = v78;
    v81 = v80;
    v83 = v82;
    v85 = v84;
    -[VUIPromoMetadataView titleImageView](self, "titleImageView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setFrame:", v100, v96, v94, v93);

    -[VUIPromoMetadataView mediaTagsView](self, "mediaTagsView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setFrame:", v102, v98, v92, v91);

    -[VUIPromoMetadataView upNextButton](self, "upNextButton");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setFrame:", v71, v73, v75, v77);

    -[VUIPromoMetadataView skipButton](self, "skipButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v79;
    v16 = v81;
    v17 = v83;
    v18 = v85;
    goto LABEL_30;
  }
  v12 = v60 + v97 + v95 + v59 + v57;
LABEL_31:
  v89 = v10;
  v90 = v12;
  result.height = v90;
  result.width = v89;
  return result;
}

- (id)_createSkipButtonWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VUIButton *v7;
  VUIButton *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  -[VUIPromoMetadataView skipButton](self, "skipButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = -[VUIButton initWithType:interfaceStyle:]([VUIButton alloc], "initWithType:interfaceStyle:", 0, 0);
  v8 = v7;

  -[VUIPromoMetadataView _configureBasicLayoutForButton:](self, "_configureBasicLayoutForButton:", v8);
  -[VUIPromoMetadataView buttonTextLayout](self, "buttonTextLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v4, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VUIPromoMetadataView onlySkipButtonAvailable](self, "onlySkipButtonAvailable"))
    objc_msgSend(v10, "setPadding:", 14.0, 50.0, 14.0, 50.0);
  -[VUIButton setTextContentView:](v8, "setTextContentView:", v10);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__VUIPromoMetadataView__createSkipButtonWithTitle___block_invoke;
  v12[3] = &unk_1E9F990E0;
  objc_copyWeak(&v13, &location);
  -[VUIButton setSelectActionHandler:](v8, "setSelectActionHandler:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __51__VUIPromoMetadataView__createSkipButtonWithTitle___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_skipButtonTapped:", v3);

}

- (id)_createUpNextButtonWithPromoInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  VUIUpNextButton *v9;
  VUIUpNextButton *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "addToUpNextLabelString");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedToUpNextLabelString");
  v6 = objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataView addToUpNextSymbolName](self, "addToUpNextSymbolName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataView addedToUpNextSymbolName](self, "addedToUpNextSymbolName");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "isAddedToUpNext");
  -[VUIPromoMetadataView upNextButton](self, "upNextButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[VUIUpNextButton initWithType:interfaceStyle:]([VUIUpNextButton alloc], "initWithType:interfaceStyle:", 0, 0);
  v10 = v9;

  -[VUIUpNextButton properties](v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPromoMetadataView buttonTextLayout](self, "buttonTextLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v5;
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v5, v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();

  -[VUIPromoMetadataView buttonTextLayout](self, "buttonTextLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v6;
  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v6, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removedStateView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v13;
  objc_msgSend(v17, "setLabel:", v13);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v36, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  objc_msgSend(v17, "setImage:", v18);

  objc_msgSend(v11, "addedStateView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLabel:", v15);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v35, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v20);

  objc_msgSend(v11, "setCanonicalID:", v34);
  objc_msgSend(v11, "setIsWatchListed:", v33);
  objc_msgSend(v11, "setDismissOnSelect:", 0);
  v21 = objc_alloc(MEMORY[0x1E0DC6A58]);
  if (v33)
    v22 = v35;
  else
    v22 = v36;
  v23 = (void *)objc_msgSend(v21, "initWithSymbol:size:symbolConfiguration:", v22, v16, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(MEMORY[0x1E0DC6A00], "makeImageViewWithResourceDescriptor:existingView:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentImageView:", v24);
  -[VUIPromoMetadataView _configureBasicLayoutForButton:](self, "_configureBasicLayoutForButton:", v10);
  objc_msgSend(v11, "setDelegate:", v10);
  objc_msgSend(v11, "updateButtonContentView");
  objc_initWeak(location, self);
  v25 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke;
  v40[3] = &unk_1E9F990E0;
  objc_copyWeak(&v41, location);
  -[VUIButton setSelectActionHandler:](v10, "setSelectActionHandler:", v40);
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke_2;
  v37[3] = &unk_1E9FA0680;
  objc_copyWeak(&v39, location);
  v26 = v4;
  v38 = v26;
  -[VUIUpNextButton setStateDidChangeHandler:](v10, "setStateDidChangeHandler:", v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(location);

  return v10;
}

void __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_upNextButtonTapped:", v3);
  objc_msgSend(v3, "selectButtonAction:", CFSTR("select"));

}

void __57__VUIPromoMetadataView__createUpNextButtonWithPromoInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsAddedToUpNext:", objc_msgSend(v6, "isWatchListed"));
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_configureLayout
{
  VUIMediaTagsViewLayout *v3;
  void *v4;
  id v5;

  v3 = -[VUIMediaTagsViewLayout initWithType:]([VUIMediaTagsViewLayout alloc], "initWithType:", 18);
  -[VUIPromoMetadataView setMediaTagsViewLayout:](self, "setMediaTagsViewLayout:", v3);

  v5 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

  objc_msgSend(v5, "setTextStyle:", 6);
  objc_msgSend(v5, "setFontWeight:", 10);
  objc_msgSend(v5, "setAlignment:", 1);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setLineBreakMode:", 1);
  -[VUIPromoMetadataView setButtonTextLayout:](self, "setButtonTextLayout:", v5);
  -[VUIPromoMetadataView setMaxButtonWidth:](self, "setMaxButtonWidth:", 140.0);
  -[VUIPromoMetadataView setMinButtonWidth:](self, "setMinButtonWidth:", 110.0);
  -[VUIPromoMetadataView setImageViewBottomMargin:](self, "setImageViewBottomMargin:", 14.0);
  -[VUIPromoMetadataView setMediaTagsViewBottomMargin:](self, "setMediaTagsViewBottomMargin:", 14.0);
  -[VUIPromoMetadataView setUpNextButtonRightMargin:](self, "setUpNextButtonRightMargin:", 12.0);
  -[VUIPromoMetadataView setDefaultButtonHeight:](self, "setDefaultButtonHeight:", 40.0);

}

- (void)_configureBasicLayoutForButton:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setButtonShape:", 0);
  objc_msgSend(v6, "setCornerRadius:", 8.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  objc_msgSend(v6, "setPadding:", 0.0, 16.0, 0.0, 16.0);
}

- (id)_createComputationOnlyButton
{
  void *v3;
  void *v4;
  VUIButton *v5;
  VUIButton *v6;
  VUIButton *v7;
  VUIButton *v8;
  void *v9;
  void *v10;
  void *v11;

  -[VUIPromoMetadataView skipInfo](self, "skipInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promoInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPromoMetadataView computationOnlyButton](self, "computationOnlyButton");
  v5 = (VUIButton *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (v5)
      v7 = v5;
    else
      v7 = -[VUIButton initWithType:interfaceStyle:]([VUIButton alloc], "initWithType:interfaceStyle:", 0, 0);
    v8 = v7;

    -[VUIPromoMetadataView _configureBasicLayoutForButton:](self, "_configureBasicLayoutForButton:", v8);
    if ((objc_msgSend(v4, "isAddedToUpNext") & 1) != 0)
      objc_msgSend(v4, "addToUpNextLabelString");
    else
      objc_msgSend(v4, "addedToUpNextLabelString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPromoMetadataView buttonTextLayout](self, "buttonTextLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIButton setTextContentView:](v8, "setTextContentView:", v11);
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_skipButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIPromoMetadataView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "skipButtonTapped:", v4);

}

- (void)_upNextButtonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VUIPromoMetadataView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upNextButtonTapped:", v4);

}

- (VUIPromoMetadataViewDelegate)delegate
{
  return (VUIPromoMetadataViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVPMediaItemSkipInfo)skipInfo
{
  return self->_skipInfo;
}

- (void)setSkipInfo:(id)a3
{
  objc_storeStrong((id *)&self->_skipInfo, a3);
}

- (VUIImageView)titleImageView
{
  return self->_titleImageView;
}

- (void)setTitleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_titleImageView, a3);
}

- (VUIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (VUIUpNextButton)upNextButton
{
  return self->_upNextButton;
}

- (void)setUpNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_upNextButton, a3);
}

- (VUIMediaTagsView)mediaTagsView
{
  return self->_mediaTagsView;
}

- (void)setMediaTagsView:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTagsView, a3);
}

- (BOOL)onlySkipButtonAvailable
{
  return self->_onlySkipButtonAvailable;
}

- (void)setOnlySkipButtonAvailable:(BOOL)a3
{
  self->_onlySkipButtonAvailable = a3;
}

- (NSString)addToUpNextSymbolName
{
  return self->_addToUpNextSymbolName;
}

- (void)setAddToUpNextSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_addToUpNextSymbolName, a3);
}

- (NSString)addedToUpNextSymbolName
{
  return self->_addedToUpNextSymbolName;
}

- (void)setAddedToUpNextSymbolName:(id)a3
{
  objc_storeStrong((id *)&self->_addedToUpNextSymbolName, a3);
}

- (VUIMediaTagsViewLayout)mediaTagsViewLayout
{
  return self->_mediaTagsViewLayout;
}

- (void)setMediaTagsViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTagsViewLayout, a3);
}

- (VUITextLayout)buttonTextLayout
{
  return self->_buttonTextLayout;
}

- (void)setButtonTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_buttonTextLayout, a3);
}

- (CGSize)expectedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expectedImageSize.width;
  height = self->_expectedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  self->_expectedImageSize = a3;
}

- (double)imageViewBottomMargin
{
  return self->_imageViewBottomMargin;
}

- (void)setImageViewBottomMargin:(double)a3
{
  self->_imageViewBottomMargin = a3;
}

- (double)mediaTagsViewBottomMargin
{
  return self->_mediaTagsViewBottomMargin;
}

- (void)setMediaTagsViewBottomMargin:(double)a3
{
  self->_mediaTagsViewBottomMargin = a3;
}

- (double)upNextButtonRightMargin
{
  return self->_upNextButtonRightMargin;
}

- (void)setUpNextButtonRightMargin:(double)a3
{
  self->_upNextButtonRightMargin = a3;
}

- (double)defaultButtonHeight
{
  return self->_defaultButtonHeight;
}

- (void)setDefaultButtonHeight:(double)a3
{
  self->_defaultButtonHeight = a3;
}

- (double)maxButtonWidth
{
  return self->_maxButtonWidth;
}

- (void)setMaxButtonWidth:(double)a3
{
  self->_maxButtonWidth = a3;
}

- (double)minButtonWidth
{
  return self->_minButtonWidth;
}

- (void)setMinButtonWidth:(double)a3
{
  self->_minButtonWidth = a3;
}

- (VUIButton)computationOnlyButton
{
  return self->_computationOnlyButton;
}

- (void)setComputationOnlyButton:(id)a3
{
  objc_storeStrong((id *)&self->_computationOnlyButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computationOnlyButton, 0);
  objc_storeStrong((id *)&self->_buttonTextLayout, 0);
  objc_storeStrong((id *)&self->_mediaTagsViewLayout, 0);
  objc_storeStrong((id *)&self->_addedToUpNextSymbolName, 0);
  objc_storeStrong((id *)&self->_addToUpNextSymbolName, 0);
  objc_storeStrong((id *)&self->_mediaTagsView, 0);
  objc_storeStrong((id *)&self->_upNextButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_skipInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
