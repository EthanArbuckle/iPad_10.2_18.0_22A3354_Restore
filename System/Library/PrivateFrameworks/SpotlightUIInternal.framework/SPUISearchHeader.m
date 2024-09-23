@implementation SPUISearchHeader

- (SPUISearchHeader)init
{
  SPUISearchHeader *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)SPUISearchHeader;
  v2 = -[SPUISearchHeader init](&v76, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SPUISearchHeader addSubview:](v2, "addSubview:", v3);
    v4 = (void *)objc_opt_new();
    LODWORD(v5) = 1148846080;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v5);
    objc_msgSend(v4, "setDelegate:", v2);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", v2, sel_textDidChange_, 0x20000);
    LODWORD(v6) = 1144766464;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    objc_msgSend(v3, "addSubview:", v4);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setProminence:", 2);
    v8 = (void *)MEMORY[0x24BEBB520];
    v9 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE0B8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v11);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F9D6A70, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v13);

    objc_msgSend(v7, "addTarget:action:", v2, sel_cancelButtonClicked_);
    LODWORD(v14) = 1148846080;
    objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1144750080;
    objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v15);
    objc_msgSend(v3, "addSubview:", v7);
    objc_msgSend(v3, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader bottomPadding](v2, "bottomPadding");
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v19) = 1132068864;
    objc_msgSend(v18, "setPriority:", v19);
    objc_msgSend(v18, "setActive:", 1);
    -[SPUISearchHeader setBottomConstraint:](v2, "setBottomConstraint:", v18);
    LODWORD(v20) = 1132068864;
    objc_msgSend(MEMORY[0x24BE85220], "alignView:toView:withAttribute:priority:", v4, v3, 3, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader setTopConstraint:](v2, "setTopConstraint:", v21);

    v22 = (id)objc_msgSend(MEMORY[0x24BE85220], "alignView:toView:withAttribute:", v4, v7, 10);
    objc_msgSend(MEMORY[0x24BE85220], "alignLeadingView:toTrailingView:", v3, v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader setLeadingConstraint:](v2, "setLeadingConstraint:", v23);

    -[SPUISearchHeader searchBarLeadingPadding](v2, "searchBarLeadingPadding");
    v25 = v24;
    -[SPUISearchHeader leadingConstraint](v2, "leadingConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", v25);

    v27 = (id)objc_msgSend(MEMORY[0x24BE85220], "alignLeadingView:toTrailingView:spacing:", v4, v7, 11.0);
    LODWORD(v28) = 1148829696;
    objc_msgSend(MEMORY[0x24BE85220], "alignLeadingView:toTrailingView:priority:", v7, v3, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader setCancelButtonTrailingConstraint:](v2, "setCancelButtonTrailingConstraint:", v29);

    LODWORD(v30) = 1148829696;
    objc_msgSend(MEMORY[0x24BE85220], "alignLeadingView:toTrailingView:priority:", v4, v3, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader setSearchFieldTrailingConstraint:](v2, "setSearchFieldTrailingConstraint:", v31);

    -[SPUISearchHeader searchBarTrailingPadding](v2, "searchBarTrailingPadding");
    v33 = v32;
    -[SPUISearchHeader searchFieldTrailingConstraint](v2, "searchFieldTrailingConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setConstant:", v33);

    -[SPUISearchHeader searchFieldTrailingConstraint](v2, "searchFieldTrailingConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 0);

    objc_msgSend(MEMORY[0x24BE85220], "constrainViewHeightContainer:", v3);
    v36 = (id)objc_msgSend(MEMORY[0x24BE85220], "alignView:toView:withAttribute:", v3, v2, 9);
    objc_msgSend(v3, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE85210], "idealPlatterWidth");
    objc_msgSend(v37, "constraintLessThanOrEqualToConstant:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setActive:", 1);
    -[SPUISearchHeader setWidthConstraint:](v2, "setWidthConstraint:", v38);
    objc_msgSend(v3, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader widthAnchor](v2, "widthAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:multiplier:", v40, 1.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[SPUISearchHeader setSearchField:](v2, "setSearchField:", v4);
    -[SPUISearchHeader setCancelButton:](v2, "setCancelButton:", v7);
    -[SPUISearchHeader showCancelButton:animated:](v2, "showCancelButton:animated:", 0, 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v2, sel_resignKeyboardForProcessState, *MEMORY[0x24BEBDF98], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v2, sel_tlk_updateWithCurrentAppearance, *MEMORY[0x24BEBDEC0], 0);

    -[SPUISearchHeader searchField](v2, "searchField");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addTarget:action:forControlEvents:", v2, sel_textFieldShouldReturn, 0x80000);

    -[SPUISearchHeader searchField](v2, "searchField");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addTarget:action:forControlEvents:", v2, sel_textFieldDidBeginEditing, 0x10000);

    -[SPUISearchHeader searchField](v2, "searchField");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAllowsCopyingTokens:", 1);

    -[SPUISearchHeader searchField](v2, "searchField");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setPasteDelegate:", v2);

    -[SPUISearchHeader setAccessibilityIgnoresInvertColors:](v2, "setAccessibilityIgnoresInvertColors:", 1);
    -[SPUISearchHeader setOffersCompletions:](v2, "setOffersCompletions:", 1);
    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    {
      -[SPUISearchHeader bounds](v2, "bounds");
      -[SPUISearchHeader systemLayoutSizeFittingSize:](v2, "systemLayoutSizeFittingSize:", v48, 1000.0);
      -[_UINavigationBarTitleView setHeight:](v2, "setHeight:", v49);
    }
    else
    {
      v50 = (void *)objc_opt_new();
      -[SPUISearchHeader setBlurView:](v2, "setBlurView:", v50);

      -[SPUISearchHeader blurView](v2, "blurView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUISearchHeader searchField](v2, "searchField");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertSubview:belowSubview:", v51, v52);

      -[SPUISearchHeader blurView](v2, "blurView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[SPUISearchHeader blurView](v2, "blurView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUISearchHeader searchField](v2, "searchField");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "leadingAnchor");
      v75 = v18;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setActive:", 1);

      -[SPUISearchHeader blurView](v2, "blurView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "trailingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUISearchHeader searchField](v2, "searchField");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "trailingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setActive:", 1);

      -[SPUISearchHeader blurView](v2, "blurView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "topAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUISearchHeader searchField](v2, "searchField");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setActive:", 1);

      -[SPUISearchHeader blurView](v2, "blurView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "bottomAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUISearchHeader searchField](v2, "searchField");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bottomAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setActive:", 1);

      v18 = v75;
    }

  }
  return v2;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 IsReduceTransparencyEnabled;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  double v51;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SPUISearchHeader;
  -[SPUISearchHeader tlk_updateForAppearance:](&v52, sel_tlk_updateForAppearance_, v4);
  -[SPUISearchHeader searchField](self, "searchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundCornerRadius");
  v7 = v6;
  -[SPUISearchHeader blurView](self, "blurView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setContinuousCornerRadius:", v7);

  -[SPUISearchHeader searchField](self, "searchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundCornerRadius");
  v11 = v10;
  -[SPUISearchHeader blurView](self, "blurView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setContinuousCornerRadius:", v11);

  if (-[SPUISearchHeader useClearTokens](self, "useClearTokens"))
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  else
    objc_msgSend(v4, "platterColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader searchField](self, "searchField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTokenBackgroundColor:", v14);

  v16 = -[SPUISearchHeader useClearTokens](self, "useClearTokens");
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[SPUISearchHeader searchField](self, "searchField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setTokenForegroundColor:", v17);

  if (v16)
  v19 = objc_msgSend(v4, "isDark");
  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (IsReduceTransparencyEnabled || (v19 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)*MEMORY[0x24BDE5BD0];
  if (!(_DWORD)v19)
    v22 = 0;
  if (IsReduceTransparencyEnabled)
    v22 = 0;
  v49 = v21;
  if (IsReduceTransparencyEnabled)
    v23 = 0;
  else
    v23 = v21;
  v24 = v22;
  -[SPUISearchHeader searchField](self, "searchField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "blurView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setBackgroundColor:", v23);
  objc_msgSend(v27, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCompositingFilter:", v24);

  objc_msgSend(v4, "primaryColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader searchField](self, "searchField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updateWithPrimaryColor:secondaryColor:isOnDarkBackground:appearance:", v29, v30, v19, v4);

  if (IsReduceTransparencyEnabled)
  {
    -[SPUISearchHeader legibilitySettings](self, "legibilitySettings", v49);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPUISearchHeader searchField](self, "searchField");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "blurView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTintColor:", v33);

    v51 = 0.0;
    objc_msgSend(v33, "getHue:saturation:brightness:alpha:", 0, 0, &v51, 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", dbl_22E0A2A00[v51 > 0.4], 0.3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader searchField](self, "searchField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "tintView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBackgroundColor:", v36);

    -[SPUISearchHeader searchField](self, "searchField");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "tintView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAlpha:", 1.0);

  }
  else
  {
    -[SPUISearchHeader searchField](self, "searchField", v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "blurView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = 0.05;
    if ((_DWORD)v19)
    {
      v46 = 0.1;
    }
    else
    {
      v45 = 0.0;
      v46 = 0.04;
    }
    objc_msgSend(v43, "setAlpha:", v45);

    -[SPUISearchHeader searchField](self, "searchField");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "blurView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTintColor:", 0);

    -[SPUISearchHeader searchField](self, "searchField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "tintView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAlpha:", v46);
  }

}

- (SPUITextField)searchField
{
  return (SPUITextField *)objc_getProperty(self, a2, 672, 1);
}

- (SPUIHeaderBlurView)blurView
{
  return (SPUIHeaderBlurView *)objc_getProperty(self, a2, 640, 1);
}

- (BOOL)useClearTokens
{
  return self->_useClearTokens;
}

- (NSString)currentQuery
{
  void *v2;
  void *v3;

  -[SPUISearchHeader searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SPSearchEntity)searchEntity
{
  return self->_searchEntity;
}

- (void)updateFocusResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[SPUISearchHeader searchField](self, "searchField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateFocusResult:cardSection:focusIsOnFirstResult:", v9, v8, v5);

}

- (void)setWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (void)setTopConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (void)setSearchFieldTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (void)setSearchField:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (void)setOffersCompletions:(BOOL)a3
{
  self->_offersCompletions = a3;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (void)setCancelButtonTrailingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (void)setCancelButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (void)setBottomConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (void)setBlurView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (double)searchBarTrailingPadding
{
  return 0.0;
}

- (double)searchBarLeadingPadding
{
  return 0.0;
}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 600, 1);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPUISearchHeader;
  -[SPUISearchHeader didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SPUISearchHeader tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)setResponderForKeyboardInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPUISearchHeader searchField](self, "searchField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponderForKeyboardInput:", v4);

}

- (void)showCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) != 0
    || objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    v5 = 0;
  }
  -[SPUISearchHeader cancelButtonTrailingConstraint](self, "cancelButtonTrailingConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v5);

  -[SPUISearchHeader searchFieldTrailingConstraint](self, "searchFieldTrailingConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", v5 ^ 1);

  -[SPUISearchHeader tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SPUISearchHeader_showCancelButton_animated___block_invoke;
  v9[3] = &unk_24F9D5E38;
  v9[4] = self;
  v10 = v5;
  objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:animated:", v9, v4);
}

- (NSLayoutConstraint)searchFieldTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 560, 1);
}

- (NSLayoutConstraint)cancelButtonTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 568, 1);
}

- (void)setQueryId:(unint64_t)a3
{
  void *v4;
  id v5;

  -[SPUISearchHeader delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentQueryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryIdent:", a3);

}

- (void)textFieldDidBeginEditing
{
  void *v3;
  id v4;

  -[SPUISearchHeader delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didBeginEditing");

  -[SPUISearchHeader interactionDelegate](self, "interactionDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFocusHeader");

}

- (SPUISearchHeaderDelegate)delegate
{
  return (SPUISearchHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  -[SPUISearchHeader tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SPUIHeaderInteractionDelegate)interactionDelegate
{
  return (SPUIHeaderInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (double)bottomPadding
{
  double result;
  double v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    objc_msgSend(MEMORY[0x24BEB0808], "bottomPaddingToKeyboard");
  }
  else
  {
    v4 = 0.0;
    if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
    {
      -[SPUISearchHeader searchField](self, "searchField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "needsLandscapeHeight"))
        v4 = 7.0;
      else
        v4 = 8.0;

    }
    return v4;
  }
  return result;
}

- (double)topPadding
{
  char v3;
  double result;
  char v5;
  BOOL v6;
  double v7;
  void *v8;
  int v9;

  v3 = objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow");
  result = 0.0;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled", 0.0);
    result = 11.0;
    if ((v5 & 1) == 0)
    {
      if (objc_msgSend(MEMORY[0x24BE85288], "isIpad", 11.0))
      {
        v6 = objc_msgSend(MEMORY[0x24BE85288], "isLargeIpad") == 0;
        result = 8.0;
        v7 = 4.0;
      }
      else
      {
        -[SPUISearchHeader searchField](self, "searchField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "needsLandscapeHeight");

        v6 = v9 == 0;
        result = 4.0;
        v7 = 7.0;
      }
      if (!v6)
        return v7;
    }
  }
  return result;
}

- (BOOL)currentlyPresentingWebEntity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    -[SPUISearchHeader searchField](self, "searchField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tokenBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqual:", v5))
    {
      -[SPUISearchHeader searchField](self, "searchField");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tokens");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    -[SPUISearchHeader searchEntity](self, "searchEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPUITextField webEntityStringForEntity:](SPUITextField, "webEntityStringForEntity:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "length") != 0;
  }

  return v8;
}

uint64_t __46__SPUISearchHeader_showCancelButton_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (UIButton)cancelButton
{
  return (UIButton *)objc_getProperty(self, a2, 552, 1);
}

- (void)focusSearchFieldAndSelectAll:(BOOL)a3 withReason:(unint64_t)a4
{
  -[SPUISearchHeader focusSearchFieldAndBeginDictation:selectAll:withReason:](self, "focusSearchFieldAndBeginDictation:selectAll:withReason:", 0, a3, a4);
}

- (void)focusSearchFieldAndBeginDictation:(BOOL)a3 selectAll:(BOOL)a4 withReason:(unint64_t)a5
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint8_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  _QWORD v28[6];
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  char v32;

  v6 = a4;
  -[SPUISearchHeader searchField](self, "searchField", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateRightView");

  if (v6)
    v9 = 3;
  else
    v9 = 0;
  -[SPUISearchHeader searchField](self, "searchField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextSelectionBehavior:", v9);

  v11 = MEMORY[0x24BEB0818];
  v12 = *(NSObject **)(MEMORY[0x24BEB0818] + 32);
  if (!v12)
  {
    SPUIInitLogging();
    v12 = *(NSObject **)(v11 + 32);
  }
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22E078000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "firstResponder", (const char *)&unk_22E0A3E97, buf, 2u);
  }
  +[SPUISearchHeader logInvokeWithReason:](SPUISearchHeader, "logInvokeWithReason:", a5);
  -[SPUISearchHeader setInvokeReason:](self, "setInvokeReason:", a5);
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x2020000000;
  v32 = 0;
  v13 = objc_msgSend(MEMORY[0x24BEB0808], "pageDotInvokeEnabled") ^ 1;
  if (a5 > 1)
    LOBYTE(v13) = 1;
  if ((v13 & 1) != 0)
  {
    -[SPUISearchHeader searchField](self, "searchField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "becomeFirstResponder");
    v30[24] = v15;

  }
  else
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __75__SPUISearchHeader_focusSearchFieldAndBeginDictation_selectAll_withReason___block_invoke;
    v28[3] = &unk_24F9D6030;
    v28[4] = self;
    v28[5] = buf;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v28);
  }
  if (v30[24])
  {
    v16 = *(NSObject **)(v11 + 32);
    if (!v16)
    {
      SPUIInitLogging();
      v16 = *(NSObject **)(v11 + 32);
    }
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_22E078000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "firstResponder", " enableTelemetry=YES ", v27, 2u);
    }
  }
  else
  {
    v17 = *(NSObject **)(v11 + 16);
    if (!v17)
    {
      SPUIInitLogging();
      v17 = *(NSObject **)(v11 + 16);
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __34__SPUISearchHeader_beginDictation__block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
  -[SPUISearchHeader searchField](self, "searchField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextSelectionBehavior:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "postNotificationName:object:", SPUIBringingUpKB, 0);

  _Block_object_dispose(buf, 8);
}

- (void)setInvokeReason:(unint64_t)a3
{
  self->_invokeReason = a3;
}

+ (void)logInvokeWithReason:(unint64_t)a3
{
  __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 > 5)
    v3 = 0;
  else
    v3 = off_24F9D6160[a3];
  v4 = MEMORY[0x24BEB0818];
  v5 = *(NSObject **)(MEMORY[0x24BEB0818] + 16);
  if (!v5)
  {
    SPUIInitLogging();
    v5 = *(NSObject **)(v4 + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_22E078000, v5, OS_LOG_TYPE_DEFAULT, "invoke reason %@", (uint8_t *)&v6, 0xCu);
  }
}

void __75__SPUISearchHeader_focusSearchFieldAndBeginDictation_selectAll_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEBD700], "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_beginDisablingAnimations");

  objc_msgSend(*(id *)(a1 + 32), "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "becomeFirstResponder");

  objc_msgSend(MEMORY[0x24BEBD700], "activeKeyboardSceneDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endDisablingAnimations");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUISearchHeader;
  -[SPUISearchHeader traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SPUISearchHeader traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SPUISearchHeader tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SPUISearchHeader traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)clearLastSearchedText
{
  -[SPUISearchHeader setLastSearchText:](self, "setLastSearchText:", 0);
  -[SPUISearchHeader setLastSearchEntity:](self, "setLastSearchEntity:", 0);
}

- (UISearchToken)lastSearchToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SPUISearchHeader searchEntity](self, "searchEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    -[SPUISearchHeader searchEntity](self, "searchEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenFromSearchEntity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (UISearchToken *)v7;
}

- (UIResponder)responderForKeyboardInput
{
  void *v2;
  void *v3;

  -[SPUISearchHeader searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responderForKeyboardInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIResponder *)v3;
}

+ (unint64_t)asYouTypeSearchQueryKind
{
  return 2;
}

+ (unint64_t)committedSearchQueryKind
{
  uint64_t v2;

  v2 = SPCommittedScreenMatchingBehavior();
  if ((unint64_t)(v2 - 2) >= 3)
    return 5;
  else
    return 10 - v2;
}

- (void)backButtonPressed
{
  id v2;

  -[SPUISearchHeader delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backButtonPressed");

}

- (void)returnKeyPressed
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  -[SPUISearchHeader searchField](self, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "optOutOfGoButton"))
  {

    goto LABEL_9;
  }
  v4 = -[SPUISearchHeader textFieldShouldReturn](self, "textFieldShouldReturn");

  if (!v4)
  {
LABEL_9:
    -[SPUISearchHeader delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "returnKeyPressed");

    return;
  }
  v5 = MEMORY[0x24BEB0818];
  v6 = *(NSObject **)(MEMORY[0x24BEB0818] + 8);
  if (!v6)
  {
    SPUIInitLogging();
    v6 = *(NSObject **)(v5 + 8);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v6, OS_LOG_TYPE_DEFAULT, "As typed suggestion hit", buf, 2u);
  }
}

- (void)highlightResultAfterUnmarkingText
{
  id v2;

  -[SPUISearchHeader delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightResultAfterUnmarkingText");

}

- (BOOL)optOutOfGoButton
{
  void *v2;
  char v3;

  -[SPUISearchHeader searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optOutOfGoButton");

  return v3;
}

- (void)removeCompletionAndHighlightAsTyped:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SPUISearchHeader delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeCompletionAndHighlightAsTyped:", v3);

}

- (void)setActiveInterfaceOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  if (self->_activeInterfaceOrientation != a3)
  {
    self->_activeInterfaceOrientation = a3;
    -[SPUISearchHeader searchField](self, "searchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActiveInterfaceOrientation:", a3);

    objc_msgSend(MEMORY[0x24BE85210], "idealPlatterWidthForOrientation:", a3);
    v7 = v6;
    -[SPUISearchHeader widthConstraint](self, "widthConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", v7);

    -[SPUISearchHeader topPadding](self, "topPadding");
    v10 = v9;
    -[SPUISearchHeader topConstraint](self, "topConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", v10);

    -[SPUISearchHeader bottomPadding](self, "bottomPadding");
    v13 = v12;
    -[SPUISearchHeader bottomConstraint](self, "bottomConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v13);

    -[SPUISearchHeader searchField](self, "searchField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidateIntrinsicContentSize");

    -[SPUISearchHeader invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)addInputMethodInformationToQueryContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SPUISearchHeader textInputMode](self, "textInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "primaryLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setKeyboardPrimaryLanguage:", v6);

    objc_msgSend(v5, "identifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("dictation")))
    {
      v8 = v13;
      v9 = v7;
    }
    else
    {
      objc_msgSend(v5, "extension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(v5, "normalizedIdentifierLevels");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setKeyboardLanguage:", v12);

        goto LABEL_8;
      }
      v9 = CFSTR("custom");
      v8 = v13;
    }
    objc_msgSend(v8, "setKeyboardLanguage:", v9);
LABEL_8:

  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  -[SPUISearchHeader setWillClear:](self, "setWillClear:", 1);
  return 1;
}

- (unint64_t)queryId
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SPUISearchHeader delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentQueryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryIdent");

  return v4;
}

- (void)textWasCutFromTextField:(id)a3
{
  -[SPUISearchHeader setTextWasCut:](self, "setTextWasCut:", 1);
}

- (void)textDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SPUISearchHeader *v20;
  id v21;
  id v22;

  v4 = a3;
  -[SPUISearchHeader searchField](self, "searchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "ignoreTokensUpdate") & 1) == 0
    && !-[SPUISearchHeader searchTextScheduledForProcessing](self, "searchTextScheduledForProcessing"))
  {
    objc_msgSend(v5, "textIncludingTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 >= 0x3E9)
    {
      objc_msgSend(v5, "textIncludingTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");
      objc_msgSend(v5, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9 - objc_msgSend(v10, "length");

      objc_msgSend(v5, "textualRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 > 0x3E7)
      {
        objc_msgSend(v5, "replaceRange:withText:", v12, &stru_24F9D6A70);
      }
      else
      {
        objc_msgSend(v5, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "substringToIndex:", 1000 - v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "replaceRange:withText:", v12, v14);

      }
    }
    objc_msgSend(v5, "searchText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPUITextField removeDictationCharacterInString:](SPUITextField, "removeDictationCharacterInString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __34__SPUISearchHeader_textDidChange___block_invoke;
    v18[3] = &unk_24F9D60C8;
    v19 = v16;
    v20 = self;
    v21 = v5;
    v22 = v4;
    v17 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v18);

  }
}

uint64_t __34__SPUISearchHeader_textDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastSearchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqualToString:", v3))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 48), "searchEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastSearchEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {

LABEL_4:
    goto LABEL_5;
  }
  v23 = objc_msgSend(*(id *)(a1 + 32), "length");

  if (v23)
    goto LABEL_23;
LABEL_5:
  objc_msgSend(*(id *)(a1 + 40), "setLastSearchText:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "searchEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLastSearchEntity:", v6);

  v7 = *(void **)(a1 + 56);
  if (v7 != *(void **)(a1 + 48))
  {
    v8 = 0;
LABEL_7:
    v9 = 1;
LABEL_8:
    v10 = objc_msgSend((id)objc_opt_class(), "asYouTypeSearchQueryKind");
    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "setOffersCompletions:", 1);
    if (!objc_msgSend(*(id *)(a1 + 40), "offersCompletions"))
      v10 = 9;
    objc_msgSend(*(id *)(a1 + 40), "textInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v13 = 5;
    else
      v13 = 1;
    objc_msgSend(*(id *)(a1 + 40), "searchField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentQueryContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(*(id *)(a1 + 40), "previousQueryID");
    objc_msgSend(MEMORY[0x24BEB0830], "updateQueryContext:withSearchString:showSuggestions:view:", v17, *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v24[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSearchEntities:", v20);

    }
    else
    {
      objc_msgSend(v19, "setSearchEntities:", 0);
    }
    objc_msgSend(v19, "setWhyQuery:", v13);
    objc_msgSend(v19, "setQueryKind:", v10);
    objc_msgSend(*(id *)(a1 + 40), "queryContextDidChange:fromPreviousQueryId:allowZKW:", v19, v18, 1);

    goto LABEL_22;
  }
  objc_msgSend(v7, "searchEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 40), "searchEntity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v21)
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "setSearchEntity:fromSuggestion:", v8, 0);
LABEL_22:
  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");

LABEL_23:
  objc_msgSend(*(id *)(a1 + 40), "updateSearchFieldModel");
  return objc_msgSend(*(id *)(a1 + 40), "setSearchTextScheduledForProcessing:", 0);
}

- (void)textDidChange:(id)a3 whyQuery:(unint64_t)a4 allowZKW:(BOOL)a5 sourcePreference:(unint64_t)a6 searchEntities:(id)a7 queryKind:(unint64_t)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  char v25;
  _BOOL4 v26;
  id v27;

  v26 = a5;
  v13 = a7;
  v14 = a3;
  -[SPUISearchHeader searchEntity](self, "searchEntity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPUITextField webEntityStringForEntity:](SPUITextField, "webEntityStringForEntity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPUITextField removeDictationCharacterInString:](SPUITextField, "removeDictationCharacterInString:", v14);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  -[SPUISearchHeader searchField](self, "searchField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    -[SPUISearchHeader searchField](self, "searchField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchText");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v27;
  }

  if (v16)
    v21 = v16;
  else
    v21 = v20;
  -[SPUISearchHeader currentQueryContextWithString:](self, "currentQueryContextWithString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSearchEntities:", v13);

  objc_msgSend(v22, "setQueryKind:", a8);
  if (objc_msgSend(v27, "length"))
    v23 = a4;
  else
    v23 = 9;
  objc_msgSend(v22, "setWhyQuery:", v23);
  -[SPUISearchHeader currentQuery](self, "currentQuery");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", v20);

  if ((v25 & 1) == 0)
    objc_msgSend(v22, "setSearchString:", v20);
  if (a6 - 1 <= 1)
    objc_msgSend(v22, "setPromoteParsecResults:", 1);
  -[SPUISearchHeader queryContextDidChange:fromPreviousQueryId:allowZKW:](self, "queryContextDidChange:fromPreviousQueryId:allowZKW:", v22, -[SPUISearchHeader previousQueryID](self, "previousQueryID"), v26);

}

- (void)updateSearchFieldModel
{
  SPUICompletionStringModel *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  unint64_t v8;
  void *v9;
  SPUICompletionStringModel *v10;
  void *v11;
  id v12;

  v3 = [SPUICompletionStringModel alloc];
  -[SPUISearchHeader searchField](self, "searchField");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader searchField](self, "searchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;
  v8 = -[SPUISearchHeader queryId](self, "queryId");
  -[SPUISearchHeader searchField](self, "searchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SPUICompletionStringModel initWithTypedString:hasTokens:queryId:hasMarkedText:](v3, "initWithTypedString:hasTokens:queryId:hasMarkedText:", v4, v7, v8, objc_msgSend(v9, "hasMarkedText"));
  -[SPUISearchHeader searchField](self, "searchField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSearchFieldModel:", v10);

}

- (void)textDidChange:(id)a3 whyQuery:(unint64_t)a4 allowZKW:(BOOL)a5 queryKind:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v7 = a5;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  -[SPUISearchHeader searchField](self, "searchField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SPUISearchHeader searchField](self, "searchField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:](self, "textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:", v10, a4, v7, 0, v15, a6);

  }
  else
  {
    -[SPUISearchHeader textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:](self, "textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:", v10, a4, v7, 0, 0, a6);
  }

}

- (void)cancelButtonClicked:(id)a3
{
  id v3;

  -[SPUISearchHeader delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelButtonPressed");

}

- (void)escapeKeyPressed
{
  id v2;

  -[SPUISearchHeader delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelButtonPressed");

}

- (BOOL)textFieldShouldReturn
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SPUISearchHeader searchField](self, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "returnKeyType");

  if (v4 == 1)
  {
    -[SPUISearchHeader setIsReturnKeyPressedInGoMode:](self, "setIsReturnKeyPressedInGoMode:", 1);
    -[SPUISearchHeader delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "returnKeyPressed");

    -[SPUISearchHeader setIsReturnKeyPressedInGoMode:](self, "setIsReturnKeyPressedInGoMode:", 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BE84E10]);
    -[SPUISearchHeader searchField](self, "searchField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithInput:endpoint:", v8, 6);

    +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportFeedback:queryId:", v9, -[SPUISearchHeader queryId](self, "queryId"));

    if ((objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") & 1) == 0)
      -[SPUISearchHeader unfocusSearchFieldWithReason:](self, "unfocusSearchFieldWithReason:", 2);
    -[SPUISearchHeader commitSearch](self, "commitSearch");

  }
  return 1;
}

- (void)triggerSearchForUnlock
{
  void *v3;
  id v4;

  -[SPUISearchHeader searchField](self, "searchField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textIncludingTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v3, 17, 1, objc_msgSend((id)objc_opt_class(), "asYouTypeSearchQueryKind"));

}

- (BOOL)lastQueryKindSupportsOptionKey
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;

  -[SPUISearchHeader delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentQueryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryKind");
  v5 = v4 == objc_msgSend((id)objc_opt_class(), "asYouTypeSearchQueryKind");

  return v5;
}

- (void)commitSearch
{
  void *v3;
  id v4;

  if (!self->_searchEntity)
  {
    -[SPUISearchHeader searchField](self, "searchField");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textIncludingTokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v3, 23, 1, objc_msgSend((id)objc_opt_class(), "committedSearchQueryKind"));

  }
}

- (void)switchToSuggestions
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_msgSend((id)objc_opt_class(), "asYouTypeSearchQueryKind");
  if (!-[SPUISearchHeader offersCompletions](self, "offersCompletions"))
    v3 = 9;
  -[SPUISearchHeader setSearchEntity:](self, "setSearchEntity:", 0);
  -[SPUISearchHeader searchField](self, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v5, 1, 1, v3);

  -[SPUISearchHeader setLastSearchEntity:](self, "setLastSearchEntity:", 0);
  -[SPUISearchHeader searchField](self, "searchField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader setLastSearchText:](self, "setLastSearchText:", v6);

}

- (void)textFieldDidReplaceTokensWithStringEquivalent:(id)a3
{
  -[SPUISearchHeader setOffersCompletions:](self, "setOffersCompletions:", 1);
}

- (void)textFieldDidClear:(id)a3
{
  -[SPUISearchHeader focusSearchFieldAndBeginDictation:selectAll:withReason:](self, "focusSearchFieldAndBeginDictation:selectAll:withReason:", 0, 0, 5);
}

- (id)markedTextArray
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  void *v23;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  -[SPUISearchHeader searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "markedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textInRange:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v2, "beginningOfDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "markedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "textRangeFromPosition:toPosition:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "textInRange:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = &stru_24F9D6A70;
      if (v10)
        v13 = (__CFString *)v10;
      else
        v13 = &stru_24F9D6A70;
      v14 = v13;

      objc_msgSend(v2, "markedTextRange");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "end");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "positionFromPosition:offset:", v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v2, "endOfDocument");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "textRangeFromPosition:toPosition:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "textInRange:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = (__CFString *)v20;
        else
          v22 = &stru_24F9D6A70;
        v12 = v22;

      }
      v25[0] = v14;
      v25[1] = v5;
      v25[2] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)currentQueryContextWithString:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BEB0280];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSearchString:", v5);
  objc_msgSend(v6, "setDeviceAuthenticationState:", objc_msgSend(MEMORY[0x24BEB0840], "deviceAuthenticationStateForView:", self));
  -[SPUISearchHeader markedTextArray](self, "markedTextArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMarkedTextArray:", v7);

  v8 = (void *)MEMORY[0x24BDC24A0];
  objc_msgSend(MEMORY[0x24BDC24A0], "emptySuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v9, v5, MEMORY[0x24BDBD1A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBackingSearchModel:", v10);
  -[SPUISearchHeader addInputMethodInformationToQueryContext:](self, "addInputMethodInformationToQueryContext:", v6);
  -[SPUISearchHeader tlks_scale](self, "tlks_scale");
  objc_msgSend(v6, "setScaleFactor:");
  return v6;
}

- (void)setSearchEntity:(id)a3
{
  -[SPUISearchHeader setSearchEntity:fromSuggestion:](self, "setSearchEntity:fromSuggestion:", a3, 0);
}

+ (id)tokenFromSearchEntity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE85280], "uiImageWithSymbolName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)MEMORY[0x24BEBD930];
  objc_msgSend(v3, "tokenText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tokenWithIcon:text:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRepresentedObject:", v3);
  return v8;
}

- (void)restoreSearchText:(id)a3 searchEntity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SPUISearchHeader setSearchEntity:](self, "setSearchEntity:", v6);
  -[SPUISearchHeader setLastSearchText:](self, "setLastSearchText:", v11);
  -[SPUISearchHeader searchField](self, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateTextRange:", v9);

    -[SPUISearchHeader searchField](self, "searchField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPUISearchHeader tokenFromSearchEntity:](SPUISearchHeader, "tokenFromSearchEntity:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateToken:", v10);

  }
  else
  {
    objc_msgSend(v7, "setText:", v11);
  }

}

- (void)setSearchEntity:(id)a3 fromSuggestion:(BOOL)a4
{
  SPSearchEntity *v6;
  SPSearchEntity *searchEntity;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SPSearchEntity *v18;

  v6 = (SPSearchEntity *)a3;
  searchEntity = self->_searchEntity;
  if (searchEntity != v6)
  {
    v18 = v6;
    v8 = -[SPSearchEntity isEqual:](searchEntity, "isEqual:", v6);
    v6 = v18;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_searchEntity, a3);
      if (v18)
      {
        -[SPSearchEntity tokenText](v18, "tokenText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          -[SPUISearchHeader searchField](self, "searchField");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPSearchEntity searchString](v18, "searchString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "updateTextRange:", v14);
LABEL_10:

          goto LABEL_11;
        }
        -[SPUISearchHeader setOffersCompletions:](self, "setOffersCompletions:", 0);
        -[SPUISearchHeader searchField](self, "searchField");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tokens");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "representedObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v18);

        if ((v11 & 1) == 0)
        {
          objc_msgSend((id)objc_opt_class(), "tokenFromSearchEntity:", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[SPUISearchHeader searchField](self, "searchField");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPSearchEntity searchString](v18, "searchString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "updateTextRange:", v16);

            -[SPUISearchHeader searchField](self, "searchField");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "updateToken:", v14);

          }
          goto LABEL_10;
        }
      }
      else
      {
        -[SPUISearchHeader currentQuery](self, "currentQuery");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUISearchHeader searchField](self, "searchField");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v9);
      }
LABEL_11:

      v6 = v18;
    }
  }

}

- (void)_searchWithSearchEntity:(id)a3 fromSuggestion:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a4)
    v5 = 8;
  else
    v5 = 1;
  -[SPUISearchHeader searchField](self, "searchField", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textIncludingTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v6, v5, 1, 9);

}

- (id)_searchTextField:(id)a3 itemProviderForCopyingToken:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "representedObject", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithItem:typeIdentifier:", v4, CFSTR("com.apple.spotlight.searchEntity"));
  objc_msgSend(v4, "tokenText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObject:visibility:", v6, 0);

  return v5;
}

- (void)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  objc_msgSend(v5, "itemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasItemConformingToTypeIdentifier:", CFSTR("com.apple.spotlight.searchEntity")))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke;
    v8[3] = &unk_24F9D6118;
    v8[4] = self;
    v9 = v5;
    v7 = (id)objc_msgSend(v6, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.spotlight.searchEntity"), v8);

  }
  else
  {
    objc_msgSend(v5, "setDefaultResult");
  }

}

void __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BE85288];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke_2;
  v8[3] = &unk_24F9D60F0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  objc_msgSend(v4, "dispatchMainIfNecessary:", v8);

}

void __72__SPUISearchHeader_textPasteConfigurationSupporting_transformPasteItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), *(_QWORD *)(a1 + 32), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "tokenFromSearchEntity:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertToken:atIndex:", v3, objc_msgSend(v5, "count"));

  objc_msgSend(*(id *)(a1 + 40), "setLastSearchEntity:", v6);
  objc_msgSend(*(id *)(a1 + 40), "commitSearch");
  objc_msgSend(*(id *)(a1 + 48), "setNoResult");

}

- (void)beginDictation
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  -[SPUISearchHeader searchField](self, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateRightView");

  -[SPUISearchHeader searchField](self, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if ((v5 & 1) == 0)
  {
    v6 = MEMORY[0x24BEB0818];
    v7 = *(NSObject **)(MEMORY[0x24BEB0818] + 32);
    if (!v7)
    {
      SPUIInitLogging();
      v7 = *(NSObject **)(v6 + 32);
    }
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22E078000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "firstResponder", (const char *)&unk_22E0A3E97, buf, 2u);
    }
    -[SPUISearchHeader setInvokeReason:](self, "setInvokeReason:", 2);
  }
  objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader searchField](self, "searchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD550], "dictationInputModeOptionsWithInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceMicButtonMicButtonInFirstResponderSearchBar"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__SPUISearchHeader_beginDictation__block_invoke;
  v11[3] = &unk_24F9D5CC8;
  v11[4] = self;
  objc_msgSend(v8, "toggleDictationForResponder:withOption:firstResponderSetupCompletion:", v9, v10, v11);

}

void __34__SPUISearchHeader_beginDictation__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t v21[16];

  objc_msgSend(*(id *)(a1 + 32), "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  if (v3)
  {
    v4 = MEMORY[0x24BEB0818];
    v5 = *(NSObject **)(MEMORY[0x24BEB0818] + 32);
    if (!v5)
    {
      SPUIInitLogging();
      v5 = *(NSObject **)(v4 + 32);
    }
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_22E078000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "firstResponder", " enableTelemetry=YES ", v21, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "searchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "searchField");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (!v19)
        return;
    }
    objc_msgSend(*(id *)(a1 + 32), "searchField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectAll:", 0);

  }
  else
  {
    v8 = MEMORY[0x24BEB0818];
    v9 = *(NSObject **)(MEMORY[0x24BEB0818] + 16);
    if (!v9)
    {
      SPUIInitLogging();
      v9 = *(NSObject **)(v8 + 16);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __34__SPUISearchHeader_beginDictation__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

+ (void)logDismissalWithReason:(unint64_t)a3
{
  __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 > 5)
    v3 = 0;
  else
    v3 = off_24F9D6190[a3];
  v4 = MEMORY[0x24BEB0818];
  v5 = *(NSObject **)(MEMORY[0x24BEB0818] + 16);
  if (!v5)
  {
    SPUIInitLogging();
    v5 = *(NSObject **)(v4 + 16);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_22E078000, v5, OS_LOG_TYPE_DEFAULT, "dismissal reason %@", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[SPUISearchHeader searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)unfocusSearchFieldWithReason:(unint64_t)a3
{
  -[SPUISearchHeader unfocusSearchFieldWithReason:afterCommit:](self, "unfocusSearchFieldWithReason:afterCommit:", a3, 1);
}

- (void)unfocusSearchFieldWithReason:(unint64_t)a3 afterCommit:(BOOL)a4
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[16];

  if (!objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode", a3, a4)
    || (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
  {
    if (a3 || -[SPUISearchHeader invokeReason](self, "invokeReason") != 1)
    {
      if (-[SPUISearchHeader isFirstResponder](self, "isFirstResponder"))
      {
        +[SPUISearchHeader logDismissalWithReason:](SPUISearchHeader, "logDismissalWithReason:", a3);
        -[SPUISearchHeader searchField](self, "searchField");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "resignFirstResponder");

      }
    }
    else
    {
      v6 = *(NSObject **)(MEMORY[0x24BEB0818] + 16);
      if (!v6)
      {
        v7 = MEMORY[0x24BEB0818];
        SPUIInitLogging();
        v6 = *(NSObject **)(v7 + 16);
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E078000, v6, OS_LOG_TYPE_DEFAULT, "ignoring keyboard dismissal since viewDidAppear", buf, 2u);
      }
      -[SPUISearchHeader isFirstResponder](self, "isFirstResponder");
    }
  }
}

- (void)resignKeyboardForProcessState
{
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    -[SPUISearchHeader unfocusSearchFieldWithReason:](self, "unfocusSearchFieldWithReason:", 4);
}

- (void)updateWithCommand:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[SPUISearchHeader setLastSearchText:](self, "setLastSearchText:", 0);
  -[SPUISearchHeader setLastSearchEntity:](self, "setLastSearchEntity:", 0);
  -[SPUISearchHeader setUseClearTokens:](self, "setUseClearTokens:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v14;
    objc_msgSend(v4, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
    {
LABEL_9:

      goto LABEL_10;
    }
    -[SPUISearchHeader searchField](self, "searchField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateToken:", 0);

    objc_msgSend(v4, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader searchField](self, "searchField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(v4, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader setLastSearchText:](self, "setLastSearchText:", v10);

    objc_msgSend(v4, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:](self, "textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:", v11, 8, 1, 2, 0, objc_msgSend((id)objc_opt_class(), "committedSearchQueryKind"));
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "person");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BEB0278];
      objc_msgSend(v4, "contactIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchEntityWithContactIdentifier:fromSuggestion:", v13, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SPUISearchHeader setSearchEntity:fromSuggestion:](self, "setSearchEntity:fromSuggestion:", v11, 1);
    -[SPUISearchHeader _searchWithSearchEntity:fromSuggestion:](self, "_searchWithSearchEntity:fromSuggestion:", v11, 1);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEB0830], "queryContextWithPerformEntityQueryCommand:view:", v14, self);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SPUISearchHeader queryContextDidChange:fromPreviousQueryId:allowZKW:](self, "queryContextDidChange:fromPreviousQueryId:allowZKW:", v4, -[SPUISearchHeader queryId](self, "queryId"), 1);
    goto LABEL_9;
  }
LABEL_10:
  if ((objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") & 1) == 0)
    -[SPUISearchHeader unfocusSearchFieldWithReason:](self, "unfocusSearchFieldWithReason:", 3);

}

- (unint64_t)getClearTriggerEventForQueryContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;

  v4 = a3;
  v5 = -[SPUISearchHeader willClear](self, "willClear");
  -[SPUISearchHeader setWillClear:](self, "setWillClear:", 0);
  v6 = -[SPUISearchHeader textWasCut](self, "textWasCut");
  -[SPUISearchHeader setTextWasCut:](self, "setTextWasCut:", 0);
  objc_msgSend(v4, "searchEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
      v11 = 1;
    else
      v11 = v5;
    if (v11)
      v8 = v10 == 0;
    else
      v8 = 2;
    if (((v11 | v6) & 1) == 0)
    {
      if (objc_msgSend(v4, "whyQuery") == 1)
        v8 = 3;
      else
        v8 = 0;
    }
  }

  return v8;
}

- (void)queryContextDidChange:(id)a3 fromPreviousQueryId:(unint64_t)a4 allowZKW:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t v25[16];

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "searchEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader setSearchEntity:](self, "setSearchEntity:", v10);

  -[SPUISearchHeader searchEntity](self, "searchEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader setUseClearTokens:](self, "setUseClearTokens:", objc_msgSend(v11, "isServerEntitySearch"));

  -[SPUISearchHeader searchEntity](self, "searchEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    -[SPUISearchHeader setOffersCompletions:](self, "setOffersCompletions:", 1);
  v13 = -[SPUISearchHeader getClearTriggerEventForQueryContext:](self, "getClearTriggerEventForQueryContext:", v8);
  objc_msgSend(v8, "searchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length") || !v5)
    goto LABEL_7;
  objc_msgSend(v8, "searchEntities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    +[SPUIFeedbackManager didClearInputWithEvent:withQueryId:](SPUIFeedbackManager, "didClearInputWithEvent:withQueryId:", v13, a4);
    +[SPUISearchModel sharedGeneralInstance](SPUISearchModel, "sharedGeneralInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clear");
LABEL_7:

  }
  kdebug_trace();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.keystroke"), 0, objc_msgSend(v8, "queryIdent"));
  +[SPUIFeedbackManager feedbackListener](SPUIFeedbackManager, "feedbackListener");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reportFeedback:queryId:", v17, objc_msgSend(v8, "queryIdent"));

  SPLogForSPLogCategoryTelemetry();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v8, "queryIdent");
  if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_22E078000, v19, OS_SIGNPOST_EVENT, v21, "keystroke", " enableTelemetry=YES ", v25, 2u);
    }
  }

  objc_msgSend(v8, "setWhyClear:", v13);
  -[SPUISearchHeader markedTextArray](self, "markedTextArray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMarkedTextArray:", v22);

  -[SPUISearchHeader addInputMethodInformationToQueryContext:](self, "addInputMethodInformationToQueryContext:", v8);
  -[SPUISearchHeader searchField](self, "searchField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateRightView");

  -[SPUISearchHeader updateSearchFieldModel](self, "updateSearchFieldModel");
  -[SPUISearchHeader setPreviousQueryID:](self, "setPreviousQueryID:", objc_msgSend(v8, "queryIdent"));
  -[SPUISearchHeader delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "queryContextDidChange:fromSearchHeader:allowZKW:", v8, self, v5);

}

- (void)setUseClearTokens:(BOOL)a3
{
  if (self->_useClearTokens != a3)
  {
    self->_useClearTokens = a3;
    -[SPUISearchHeader tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void)clearSearchFieldWhyQuery:(unint64_t)a3 allowZKW:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  -[SPUISearchHeader searchField](self, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", 0);

  -[SPUISearchHeader searchField](self, "searchField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearAllTokens");

  -[SPUISearchHeader searchField](self, "searchField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textIncludingTokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:queryKind:](self, "textDidChange:whyQuery:allowZKW:queryKind:", v10, a3, v4, objc_msgSend((id)objc_opt_class(), "asYouTypeSearchQueryKind"));

  -[SPUISearchHeader setSearchEntity:](self, "setSearchEntity:", 0);
  -[SPUISearchHeader clearLastSearchedText](self, "clearLastSearchedText");
}

- (BOOL)cancelButtonIsVisible
{
  void *v2;
  char v3;

  -[SPUISearchHeader cancelButtonTrailingConstraint](self, "cancelButtonTrailingConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)searchForSuggestion:(id)a3 isBuildingQuery:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v4 = a4;
  v20 = a3;
  if (objc_msgSend(v20, "type") == 17)
    v6 = 1;
  else
    v6 = 2;
  if (v4)
    v7 = 25;
  else
    v7 = 8;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v10 = 0;
    if (!v4)
      goto LABEL_9;
LABEL_13:
    -[SPUISearchHeader searchField](self, "searchField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "becomeFirstResponder");

    v11 = CFSTR(" ");
    goto LABEL_14;
  }
  objc_msgSend(v20, "searchEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 22;
  if (v4)
    goto LABEL_13;
LABEL_9:
  if ((objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") & 1) == 0)
    -[SPUISearchHeader unfocusSearchFieldWithReason:](self, "unfocusSearchFieldWithReason:", 3);
  v11 = &stru_24F9D6A70;
LABEL_14:
  -[SPUISearchHeader searchField](self, "searchField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateToken:", 0);

  objc_msgSend(v20, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingString:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUISearchHeader searchField](self, "searchField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  v18 = (void *)objc_opt_class();
  if (v4)
    v19 = objc_msgSend(v18, "asYouTypeSearchQueryKind");
  else
    v19 = objc_msgSend(v18, "committedSearchQueryKind");
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:](self, "textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:", v16, v7, 1, v6, v10, v19);

}

- (void)performTestSearchWithQuery:(id)a3 event:(unint64_t)a4 queryKind:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[SPUISearchHeader textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:](self, "textDidChange:whyQuery:allowZKW:sourcePreference:searchEntities:queryKind:", v8, a4, 1, 0, 0, a5);
  -[SPUISearchHeader searchField](self, "searchField");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

}

- (BOOL)completionResultIsPotentiallyPunchout
{
  void *v2;
  char v3;

  -[SPUISearchHeader searchField](self, "searchField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completionResultIsPotentiallyPunchout");

  return v3;
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SPUISearchHeader_performTransition_willBeDisplayed___block_invoke;
  v4[3] = &unk_24F9D6140;
  v5 = a4;
  v4[4] = self;
  v4[5] = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v4);
}

id __54__SPUISearchHeader_performTransition_willBeDisplayed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(unsigned __int8 *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SPUISearchHeader;
  return objc_msgSendSuper2(&v4, sel_performTransition_willBeDisplayed_, v1, v2);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (BOOL)isReturnKeyPressedInGoMode
{
  return self->_isReturnKeyPressedInGoMode;
}

- (void)setIsReturnKeyPressedInGoMode:(BOOL)a3
{
  self->_isReturnKeyPressedInGoMode = a3;
}

- (NSString)lastSearchText
{
  return (NSString *)objc_getProperty(self, a2, 544, 1);
}

- (void)setLastSearchText:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 576, 1);
}

- (NSLayoutConstraint)topConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 584, 1);
}

- (NSLayoutConstraint)bottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 592, 1);
}

- (BOOL)willClear
{
  return self->_willClear;
}

- (void)setWillClear:(BOOL)a3
{
  self->_willClear = a3;
}

- (BOOL)textWasCut
{
  return self->_textWasCut;
}

- (void)setTextWasCut:(BOOL)a3
{
  self->_textWasCut = a3;
}

- (BOOL)searchTextScheduledForProcessing
{
  return self->_searchTextScheduledForProcessing;
}

- (void)setSearchTextScheduledForProcessing:(BOOL)a3
{
  self->_searchTextScheduledForProcessing = a3;
}

- (unint64_t)previousQueryID
{
  return self->_previousQueryID;
}

- (void)setPreviousQueryID:(unint64_t)a3
{
  self->_previousQueryID = a3;
}

- (SPSearchEntity)lastSearchEntity
{
  return (SPSearchEntity *)objc_getProperty(self, a2, 616, 1);
}

- (void)setLastSearchEntity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (SBIconListLayout)iconListLayout
{
  return (SBIconListLayout *)objc_getProperty(self, a2, 624, 1);
}

- (void)setIconListLayout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (unint64_t)invokeReason
{
  return self->_invokeReason;
}

- (unint64_t)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(unint64_t)a3
{
  self->_suggestionID = a3;
}

- (BOOL)offersCompletions
{
  return self->_offersCompletions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_iconListLayout, 0);
  objc_storeStrong((id *)&self->_lastSearchEntity, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_searchFieldTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_lastSearchText, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

void __34__SPUISearchHeader_beginDictation__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E078000, a1, a3, "Failed becomeFirstResponder", a5, a6, a7, a8, 0);
}

@end
