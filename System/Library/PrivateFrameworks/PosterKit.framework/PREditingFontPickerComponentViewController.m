@implementation PREditingFontPickerComponentViewController

+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[6];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(a3, "isEqual:", CFSTR("PRPosterRoleIncomingCall")))
  {
    v15[0] = CFSTR("PRTimeFontIdentifierSFPro");
    v15[1] = CFSTR("PRTimeFontIdentifierSFRounded");
    v15[2] = CFSTR("PRTimeFontIdentifierNewYorkAlpha");
    v15[3] = CFSTR("PRTimeFontIdentifierSFCondensed");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      +[PRIncomingCallFontsProvider timeFontIdentifiersForText:availableFonts:](PRIncomingCallFontsProvider, "timeFontIdentifiersForText:availableFonts:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend(v6, "copy");
    }
    v11 = (void *)v7;

  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v14[0] = CFSTR("PRTimeFontIdentifierSoft");
      v14[1] = CFSTR("PRTimeFontIdentifierRounded");
      v14[2] = CFSTR("PRTimeFontIdentifierStencil");
      v14[3] = CFSTR("PRTimeFontIdentifierNewYork");
      v14[4] = CFSTR("PRTimeFontIdentifierSlab");
      v14[5] = CFSTR("PRTimeFontIdentifierRail");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v14;
      v10 = 6;
    }
    else
    {
      v13[0] = CFSTR("PRTimeFontIdentifierSoft");
      v13[1] = CFSTR("PRTimeFontIdentifierSoftLight");
      v13[2] = CFSTR("PRTimeFontIdentifierRounded");
      v13[3] = CFSTR("PRTimeFontIdentifierStencil");
      v13[4] = CFSTR("PRTimeFontIdentifierNewYork");
      v13[5] = CFSTR("PRTimeFontIdentifierNewYorkHeavy");
      v13[6] = CFSTR("PRTimeFontIdentifierSlab");
      v13[7] = CFSTR("PRTimeFontIdentifierRail");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v13;
      v10 = 8;
    }
    objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)defaultItemsForRole:(id)a3 titleString:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "defaultFontIdentifiersForRole:titleString:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

PREditingFontPickerItem *__78__PREditingFontPickerComponentViewController_defaultItemsForRole_titleString___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PRTimeFontConfiguration *v3;
  PREditingFontPickerItem *v4;

  v2 = a2;
  v3 = -[PRTimeFontConfiguration initWithTimeFontIdentifier:]([PRTimeFontConfiguration alloc], "initWithTimeFontIdentifier:", v2);

  v4 = -[PREditingFontPickerItem initWithFontConfiguration:systemItem:]([PREditingFontPickerItem alloc], "initWithFontConfiguration:systemItem:", v3, 1);
  return v4;
}

- (PREditingFontPickerComponentViewController)initWithItems:(id)a3 selectedItem:(id)a4 role:(id)a5 titleString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PREditingFontPickerComponentViewController *v14;
  uint64_t v15;
  NSArray *items;
  void *v17;
  uint64_t v18;
  NSLocale *locale;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PREditingFontPickerComponentViewController;
  v14 = -[PREditingFontPickerComponentViewController init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    items = v14->_items;
    v14->_items = (NSArray *)v15;

    v17 = v11;
    if (!v11)
    {
      objc_msgSend(v10, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v14->_selectedItem, v17);
    if (!v11)

    objc_storeStrong((id *)&v14->_role, a5);
    objc_storeStrong((id *)&v14->_titleString, a6);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = objc_claimAutoreleasedReturnValue();
    locale = v14->_locale;
    v14->_locale = (NSLocale *)v18;

    v14->_fontSize = 50.0;
  }

  return v14;
}

- (id)contentStringNumberFormatter
{
  void *v3;
  void *v4;

  if (contentStringNumberFormatter___once != -1)
    dispatch_once(&contentStringNumberFormatter___once, &__block_literal_global_28);
  v3 = (void *)contentStringNumberFormatter_numberFormatter;
  -[PREditingFontPickerComponentViewController locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  return (id)contentStringNumberFormatter_numberFormatter;
}

uint64_t __74__PREditingFontPickerComponentViewController_contentStringNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)contentStringNumberFormatter_numberFormatter;
  contentStringNumberFormatter_numberFormatter = (uint64_t)v0;

  return objc_msgSend((id)contentStringNumberFormatter_numberFormatter, "setNumberStyle:", 1);
}

- (id)contentStringForFont:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
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
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  -[PREditingFontPickerComponentViewController role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall"));

  if (v10)
  {
    v11 = (void *)+[PRIncomingCallFontsProvider sampleStringForFont:displayingText:](PRIncomingCallFontsProvider, "sampleStringForFont:displayingText:", v8, self->_titleString);
    v13 = v12;

    v14 = v13;
  }
  else
  {
    -[PREditingFontPickerComponentViewController contentStringNumberFormatter](self, "contentStringNumberFormatter");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", &unk_1E21DCDB8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
  }

  objc_msgSend(v14, "fontWithSize:", self->_fontSize);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E08];
  v26 = *MEMORY[0x1E0DC1138];
  v27[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryWithDictionary:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v7, "localeIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsFromLocaleIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("numbers"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (PRTimeNumberingSystemRequiresLanguageTagging(v22))
  {
    PRTimeNumberingSystemLanguageTag(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CB2CE0]);

  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v18);

  return v24;
}

- (void)loadView
{
  id v3;
  uint64_t v4;
  PRFontWeightSlider *v5;
  UISlider *fontWeightSlider;
  UISlider *v7;
  _BOOL4 v8;
  double v9;
  UISlider *v10;
  double v11;
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
  _QWORD v44[6];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PREditingFontPickerComponentViewController configureFontPickerViewIfNecessary](self, "configureFontPickerViewIfNecessary");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PRFontWeightSlider);
  fontWeightSlider = self->_fontWeightSlider;
  self->_fontWeightSlider = &v5->super;

  -[UISlider addTarget:action:forControlEvents:](self->_fontWeightSlider, "addTarget:action:forControlEvents:", self, sel_fontSliderDidUpdateWeight_, 4096);
  -[UISlider setHidden:](self->_fontWeightSlider, "setHidden:", -[PREditingFontPickerComponentViewController _shouldShowWeightSlider](self, "_shouldShowWeightSlider") ^ 1);
  v7 = self->_fontWeightSlider;
  v8 = -[PREditingFontPickerComponentViewController _shouldShowWeightSlider](self, "_shouldShowWeightSlider");
  v9 = 0.0;
  if (v8)
    v9 = 1.0;
  -[UISlider setAlpha:](v7, "setAlpha:", v9);
  v10 = self->_fontWeightSlider;
  -[PREditingFontPickerComponentViewController fontWeight](self, "fontWeight");
  *(float *)&v11 = v11;
  -[UISlider setValue:](v10, "setValue:", v11);
  -[UISlider setTranslatesAutoresizingMaskIntoConstraints:](self->_fontWeightSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)MEMORY[0x1E0C99DE8];
  v45[0] = self->_fontWeightSlider;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "addSubview:", v4);
    objc_msgSend(v14, "insertObject:atIndex:", v4, 0);
  }
  v41 = v14;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v14);
  objc_msgSend(v15, "setAxis:", 1);
  objc_msgSend(v15, "setAlignment:", 3);
  objc_msgSend(v15, "setSpacing:", 16.0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v15);
  v33 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v15, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v38;
  objc_msgSend(v15, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v35;
  objc_msgSend(v15, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v31;
  objc_msgSend(v15, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  objc_msgSend(v3, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v16;
  -[UISlider widthAnchor](self->_fontWeightSlider, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -72.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v19;
  -[UISlider heightAnchor](self->_fontWeightSlider, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 34.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
  v22 = (void *)v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v23);

  if (v22)
  {
    v24 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v22, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v28);

  }
  -[PREditingFontPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
  -[PREditingFontPickerComponentViewController filterFontViewsByLocale](self, "filterFontViewsByLocale");
  -[PREditingFontPickerComponentViewController setView:](self, "setView:", v42);

}

- (id)configureFontPickerViewIfNecessary
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double largestItemHeight;
  double v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  id obja;
  uint64_t v43;
  void *v44;
  id v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id from;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id location;
  _QWORD v57[5];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PREditingFontPickerComponentViewController items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 1)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_initWeak(&location, self);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[PREditingFontPickerComponentViewController items](self, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v7)
    {
      v43 = *(_QWORD *)v53;
      obj = v6;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v53 != v43)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v9, "fontConfiguration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "effectiveFontForRole:ignoringWeight:", self->_role, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fontWithSize:", self->_fontSize);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[PREditingFontPickerComponentViewController locale](self, "locale");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          largestItemHeight = self->_largestItemHeight;
          objc_msgSend(v14, "size");
          if (largestItemHeight >= v16)
            v17 = largestItemHeight;
          else
            v17 = v16;
          self->_largestItemHeight = v17;
          -[PREditingFontPickerComponentViewController role](self, "role");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_alloc_init(+[PREditingFontPickerCellView fontPickerCellViewClassForRole:](PREditingFontPickerCellView, "fontPickerCellViewClassForRole:", v18));

          objc_msgSend(v19, "configureWithAttributedString:", v14);
          objc_initWeak(&from, v19);
          v20 = (void *)MEMORY[0x1E0DC3428];
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __80__PREditingFontPickerComponentViewController_configureFontPickerViewIfNecessary__block_invoke;
          v48[3] = &unk_1E2185418;
          objc_copyWeak(&v49, &location);
          objc_copyWeak(&v50, &from);
          v48[4] = v9;
          objc_msgSend(v20, "actionWithHandler:", v48);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addAction:forControlEvents:", v21, 0x2000);
          if (BSEqualObjects())
          {
            objc_msgSend(v19, "setSelected:", 1);
            -[PREditingFontPickerComponentViewController setSelectedCellView:](self, "setSelectedCellView:", v19);
          }
          objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v45, "addObject:", v19);

          objc_destroyWeak(&v50);
          objc_destroyWeak(&v49);
          objc_destroyWeak(&from);

        }
        v6 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v7);
    }

    -[PREditingFontPickerComponentViewController setCellViews:](self, "setCellViews:", v45);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v45);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v22);
    objc_msgSend(v23, "setAxis:", 0);
    objc_msgSend(v23, "setAlignment:", 1);
    objc_msgSend(v23, "setSpacing:", 20.0);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = v22;
    v5 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(v5, "setContentInset:", 0.0, 36.0, 0.0, 36.0);
    objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(v5, "setClipsToBounds:", 0);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v23);
    if (objc_msgSend(v23, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      CGAffineTransformMakeRotation(&v47, 3.14159265);
      objc_msgSend(v23, "setTransform:", &v47);
      CGAffineTransformMakeRotation(&v46, 3.14159265);
      objc_msgSend(v5, "setTransform:", &v46);
    }
    v34 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v23, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", obja);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v40;
    objc_msgSend(v23, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v37;
    objc_msgSend(v23, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v24;
    objc_msgSend(v23, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v27;
    objc_msgSend(v23, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v31);

    objc_destroyWeak(&location);
  }
  else
  {
    v5 = 0;
    self->_largestItemHeight = 0.0;
  }
  return v5;
}

void __80__PREditingFontPickerComponentViewController_configureFontPickerViewIfNecessary__block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "selectedItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];

  if (v3 == v4)
  {
    objc_msgSend(a1[4], "fontConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveFontForRole:ignoringWeight:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "pr_variantWeightRange");
    v10 = v9;
    objc_msgSend(a1[4], "fontConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "weight");
    v13 = (v12 - (double)v8) / ((double)v10 - (double)v8);

    objc_msgSend(WeakRetained, "setFontWeight:", v13);
  }
  objc_msgSend(WeakRetained, "setSelectedItem:", a1[4]);
  objc_msgSend(WeakRetained, "selectedCellView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelected:", 0);

  objc_msgSend(WeakRetained, "setSelectedCellView:", v2);
  objc_msgSend(v2, "setSelected:", 1);
  objc_msgSend(WeakRetained, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fontPickerComponentViewController:didSelectItem:", WeakRetained, a1[4]);

  objc_msgSend(WeakRetained, "_updateWeightSliderVisibility");
}

- (void)setFontWeight:(double)a3
{
  if (self->_fontWeight != a3)
  {
    self->_fontWeight = a3;
    *(float *)&a3 = a3;
    -[UISlider setValue:](self->_fontWeightSlider, "setValue:", a3);
  }
}

- (void)fontSliderDidUpdateWeight:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  id WeakRetained;

  v4 = a3;
  objc_msgSend(v4, "value");
  self->_fontWeight = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v4, "value");
  v7 = v6;

  objc_msgSend(WeakRetained, "fontPickerComponentViewController:didChangeFontWeight:", self, v7);
}

- (BOOL)_shouldShowWeightSlider
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[PREditingFontPickerComponentViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[PREditingFontPickerComponentViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fontPickerComponentViewControllerShouldShowWeightSliderForSelectedFont:", self);

  return v6;
}

- (void)_updateWeightSliderVisibility
{
  _BOOL4 v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v3 = -[PREditingFontPickerComponentViewController _shouldShowWeightSlider](self, "_shouldShowWeightSlider");
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke;
  v12[3] = &unk_1E2184468;
  v12[4] = self;
  v13 = v3;
  v5 = (void (**)(_QWORD))MEMORY[0x18D77C604](v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_2;
  v10[3] = &unk_1E2184468;
  v10[4] = self;
  v11 = v3;
  v6 = (void *)MEMORY[0x18D77C604](v10);
  if (v3)
  {
    v5[2](v5);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 0.15, 0.3);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_3;
    v8[3] = &unk_1E2185440;
    v9 = v5;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", v6, v8, 0.15);

  }
}

void __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "fontWeightSlider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", *(_BYTE *)(a1 + 40) == 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontPickerComponentViewControllerDidChangeHeight:", *(_QWORD *)(a1 + 32));

  }
}

void __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "fontWeightSlider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

uint64_t __75__PREditingFontPickerComponentViewController__updateWeightSliderVisibility__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateLayoutForCurrentSize
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *widthCellConstraints;
  NSArray *v22;
  NSArray *heightCellConstraints;
  void *v24;
  double v25;
  double v26;
  void *v27;
  objc_class *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = -[PREditingFontPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[PREditingFontPickerComponentViewController widthCellConstraints](self, "widthCellConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[PREditingFontPickerComponentViewController heightCellConstraints](self, "heightCellConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v7);

  v8 = 52.0;
  if (v3)
    v8 = 50.0;
  self->_fontSize = v8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[PREditingFontPickerComponentViewController cellViews](self, "cellViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v14, "contentFont");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingFontPickerComponentViewController locale](self, "locale");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingFontPickerComponentViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "configureWithAttributedString:", v17);
        objc_msgSend(v14, "setUsingSmallerSizing:", v3);
        objc_msgSend(v14, "widthCellConstraint");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObject:", v18);

        objc_msgSend(v14, "heightCellConstraint");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v19);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v11);
  }

  v20 = (NSArray *)objc_msgSend(v43, "copy");
  widthCellConstraints = self->_widthCellConstraints;
  self->_widthCellConstraints = v20;

  v22 = (NSArray *)objc_msgSend(v42, "copy");
  heightCellConstraints = self->_heightCellConstraints;
  self->_heightCellConstraints = v22;

  if (-[PREditingFontPickerComponentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PREditingFontPickerComponentViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;

    if (self->_configuredViewWidth != v26)
    {
      -[PREditingFontPickerComponentViewController role](self, "role");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = +[PREditingFontPickerCellView fontPickerCellViewClassForRole:](PREditingFontPickerCellView, "fontPickerCellViewClassForRole:", v27);

      -[objc_class defaultCellSizeUsingSmallerSizing:](v28, "defaultCellSizeUsingSmallerSizing:", v3);
      v30 = v26 - v29;
      -[PREditingFontPickerComponentViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constant");
      v33 = v32;
      -[PREditingFontPickerComponentViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constant");
      v36 = v33 - v35;

      if (v30 >= v36)
        v37 = 36.0;
      else
        v37 = v30 * 0.5;
      -[PREditingFontPickerComponentViewController stackViewLeadingConstraint](self, "stackViewLeadingConstraint");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v37 >= 0.0)
        v40 = v37;
      else
        v40 = 0.0;
      objc_msgSend(v38, "setConstant:", v40);

      -[PREditingFontPickerComponentViewController stackViewTrailingConstraint](self, "stackViewTrailingConstraint");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setConstant:", fmin(-v37, 0.0));

      self->_configuredViewWidth = v26;
    }
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PREditingFontPickerComponentViewController;
  -[PREditingFontPickerComponentViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[PREditingFontPickerComponentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 > 375.0)
  {
    LOBYTE(v6) = 0;
    if (-[PREditingFontPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing"))
      goto LABEL_6;
LABEL_5:
    if (self->_configuredViewWidth == v5)
      return;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "userInterfaceIdiom") != 1;

  if (((v6 ^ -[PREditingFontPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing")) & 1) == 0)
    goto LABEL_5;
LABEL_6:
  self->_usingSmallerSizing = v6;
  -[PREditingFontPickerComponentViewController updateLayoutForCurrentSize](self, "updateLayoutForCurrentSize");
}

- (void)setLocale:(id)a3
{
  NSLocale *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (NSLocale *)a3;
  if (self->_locale != v5)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PREditingFontPickerComponentViewController cellViews](self, "cellViews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "contentFont");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController locale](self, "locale");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "configureWithAttributedString:", v14);
          objc_msgSend(v11, "invalidateIntrinsicContentSize");

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[PREditingFontPickerComponentViewController filterFontViewsByLocale](self, "filterFontViewsByLocale");
  }

}

- (void)filterFontViewsByLocale
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  int v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!-[NSString isEqualToString:](self->_role, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall")))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PREditingFontPickerComponentViewController cellViews](self, "cellViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v19 = *(_QWORD *)v21;
      v6 = *MEMORY[0x1E0DC1368];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v21 != v19)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v8, "contentFont");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController locale](self, "locale");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController contentStringForFont:locale:](self, "contentStringForFont:locale:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "string");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "contentFont");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fontDescriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v12, "length"))
          {
            v16 = 0;
            do
            {
              v17 = objc_msgSend(v15, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v16));
              if ((v17 & 1) == 0)
                break;
              ++v16;
            }
            while (v16 < objc_msgSend(v12, "length"));
          }
          else
          {
            v17 = 1;
          }
          objc_msgSend(v8, "setHidden:", v17 ^ 1u);
          if (((v17 ^ 1) & 1) == 0 && !v5)
            v5 = v8;
          if (((v17 | objc_msgSend(v8, "isSelected") ^ 1) & 1) == 0)
            objc_msgSend(v5, "sendActionsForControlEvents:", 0x2000);

        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

  }
}

- (double)estimatedHeight
{
  _BOOL4 v3;
  double v4;
  double largestItemHeight;
  double v6;

  if ((-[PREditingFontPickerComponentViewController isViewLoaded](self, "isViewLoaded") & 1) == 0
    && -[NSArray count](self->_items, "count") >= 2)
  {
    v3 = -[PREditingFontPickerComponentViewController isUsingSmallerSizing](self, "isUsingSmallerSizing");
    v4 = 64.0;
    if (v3)
      v4 = 62.0;
    self->_largestItemHeight = v4;
  }
  largestItemHeight = self->_largestItemHeight;
  if (-[PREditingFontPickerComponentViewController isViewLoaded](self, "isViewLoaded")
    && -[PREditingFontPickerComponentViewController _shouldShowWeightSlider](self, "_shouldShowWeightSlider"))
  {
    if (-[NSArray count](self->_items, "count") > 1)
      largestItemHeight = largestItemHeight + 16.0;
    -[UISlider bounds](self->_fontWeightSlider, "bounds");
    return largestItemHeight + v6;
  }
  return largestItemHeight;
}

- (NSArray)items
{
  return self->_items;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (PREditingFontPickerComponentViewControllerDelegate)delegate
{
  return (PREditingFontPickerComponentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PREditingFontPickerItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItem, a3);
}

- (double)fontWeight
{
  return self->_fontWeight;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (PREditingFontPickerCellView)selectedCellView
{
  return self->_selectedCellView;
}

- (void)setSelectedCellView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCellView, a3);
}

- (NSArray)cellViews
{
  return self->_cellViews;
}

- (void)setCellViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (double)largestItemHeight
{
  return self->_largestItemHeight;
}

- (void)setLargestItemHeight:(double)a3
{
  self->_largestItemHeight = a3;
}

- (UISlider)fontWeightSlider
{
  return self->_fontWeightSlider;
}

- (void)setFontWeightSlider:(id)a3
{
  objc_storeStrong((id *)&self->_fontWeightSlider, a3);
}

- (BOOL)isUsingSmallerSizing
{
  return self->_usingSmallerSizing;
}

- (void)setUsingSmallerSizing:(BOOL)a3
{
  self->_usingSmallerSizing = a3;
}

- (double)configuredViewWidth
{
  return self->_configuredViewWidth;
}

- (void)setConfiguredViewWidth:(double)a3
{
  self->_configuredViewWidth = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSArray)widthCellConstraints
{
  return self->_widthCellConstraints;
}

- (void)setWidthCellConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (NSArray)heightCellConstraints
{
  return self->_heightCellConstraints;
}

- (void)setHeightCellConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  return self->_stackViewLeadingConstraint;
}

- (void)setStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)stackViewTrailingConstraint
{
  return self->_stackViewTrailingConstraint;
}

- (void)setStackViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightCellConstraints, 0);
  objc_storeStrong((id *)&self->_widthCellConstraints, 0);
  objc_storeStrong((id *)&self->_fontWeightSlider, 0);
  objc_storeStrong((id *)&self->_cellViews, 0);
  objc_storeStrong((id *)&self->_selectedCellView, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
