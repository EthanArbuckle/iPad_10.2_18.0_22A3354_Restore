@implementation PREditingFontAndColorPickerViewController

- (PREditingFontAndColorPickerViewController)initWithComponents:(unint64_t)a3 role:(id)a4 titleString:(id)a5
{
  id v9;
  id v10;
  PREditingFontAndColorPickerViewController *v11;
  PREditingFontAndColorPickerViewController *v12;
  uint64_t v13;
  NSString *titleString;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PREditingFontAndColorPickerViewController;
  v11 = -[PREditingFontAndColorPickerViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    v11->_components = a3;
    v11->_contentsLuminance = 0.5;
    objc_storeStrong((id *)&v11->_role, a4);
    v13 = objc_msgSend(v10, "copy");
    titleString = v12->_titleString;
    v12->_titleString = (NSString *)v13;

  }
  return v12;
}

- (PREditingFontAndColorPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PREditingFontAndColorPickerViewController initWithComponents:role:titleString:](self, "initWithComponents:role:titleString:", 31, CFSTR("PRPosterRoleLockScreen"), 0);
}

- (void)loadComponentViewControllersIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  PREditingFontPickerComponentViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  void *v31;
  void *v32;
  PRPosterTitleStyleConfiguration *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  PRTitleAlignmentBarButtonItem *v44;
  PRPosterTitleStyleConfiguration *v45;
  void *v46;
  PRTitleAlignmentBarButtonItem *v47;
  PRTitleAlignmentBarButtonItem *titleAlignmentBarItem;
  PRTitleAlignmentBarButtonItem *v49;
  void *v50;
  void *v51;
  PREditingTitleLayoutPickerComponentViewController *v52;
  PRPosterTitleStyleConfiguration *titleStyleConfiguration;
  void *v54;
  PREditingTitleLayoutPickerComponentViewController *v55;
  PREditingColorPickerComponentViewController *v56;
  PREditorNumberingSystemPickerController *v57;
  void *v58;
  PREditorNumberingSystemPickerController *v59;
  PREditorNumberingSystemPickerController *numberingSystemController;
  PREditorNumberingSystemPickerController *v61;
  void *v62;
  void *v63;
  PREditorNumberingSystemViewController *v64;
  id v65;
  void *v66;
  UIBarButtonItem *v67;
  UIBarButtonItem *numberSystemBarItem;
  PREditorNumberingSystemViewController *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  BOOL v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  PREditingFontAndColorPickerViewController *v86;

  if (!self->_hasLoadedComponentViewControllers)
  {
    v3 = -[PREditingFontAndColorPickerViewController components](self, "components");
    -[PREditingFontAndColorPickerViewController extensionBundleURL](self, "extensionBundleURL");
    v4 = objc_claimAutoreleasedReturnValue();
    v75 = (id)v4;
    if (v4)
    {
      -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:forRole:](self->_titleStyleConfiguration, "effectiveTimeFontWithExtensionBundleURL:forRole:", v4, self->_role);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[PREditingFontAndColorPickerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 1) != 0)
    {
      +[PREditingFontPickerComponentViewController defaultItemsForRole:titleString:](PREditingFontPickerComponentViewController, "defaultItemsForRole:titleString:", self->_role, self->_titleString);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v5;
      if (!-[NSString isEqualToString:](self->_role, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall"))
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "additionalFontConfigurationsForFontAndColorPickerViewController:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[PREditingFontAndColorPickerViewController setAdditionalFontConfigurations:](self, "setAdditionalFontConfigurations:", v8);
          objc_msgSend(v8, "bs_map:", &__block_literal_global_12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v10;
        }

      }
      v11 = objc_opt_respondsToSelector();
      v12 = MEMORY[0x1E0C809B0];
      if ((v11 & 1) != 0)
      {
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2;
        v84[3] = &unk_1E21841D0;
        v85 = v6;
        v86 = self;
        objc_msgSend(v7, "bs_filter:", v84);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v13;
      }
      -[PRPosterTitleStyleConfiguration timeFontConfiguration](self->_titleStyleConfiguration, "timeFontConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeFontConfigurationWithExtensionBundleURL:", v75);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "customFont");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v71 = v14;
      v72 = v6;
      if (v16)
      {
        objc_msgSend(v15, "customFont");
        v82[0] = v12;
        v82[1] = 3221225472;
        v82[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3;
        v82[3] = &unk_1E21841F8;
        v83 = (id)objc_claimAutoreleasedReturnValue();
        v17 = v83;
        objc_msgSend(v7, "bs_firstObjectPassingTest:", v82);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v73;
      }
      else
      {
        v79[0] = v12;
        v79[1] = 3221225472;
        v79[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4;
        v79[3] = &unk_1E21841D0;
        v19 = v15;
        v80 = v19;
        v20 = v14;
        v81 = v20;
        objc_msgSend(v7, "bs_firstObjectPassingTest:", v79);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          v76[0] = v12;
          v76[1] = 3221225472;
          v76[2] = __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5;
          v76[3] = &unk_1E21841D0;
          v77 = v19;
          v78 = v20;
          objc_msgSend(v7, "bs_firstObjectPassingTest:", v76);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v17 = v80;
        v5 = v73;
      }

      v21 = objc_msgSend(v7, "count");
      v74 = v21 != 0;
      if (v21)
      {
        v22 = -[PREditingFontPickerComponentViewController initWithItems:selectedItem:role:titleString:]([PREditingFontPickerComponentViewController alloc], "initWithItems:selectedItem:role:titleString:", v7, v18, self->_role, self->_titleString);
        -[PRPosterTitleStyleConfiguration timeFontConfiguration](self->_titleStyleConfiguration, "timeFontConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingFontAndColorPickerViewController extensionBundleURL](self, "extensionBundleURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeFontConfigurationWithExtensionBundleURL:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "effectiveFontForRole:ignoringWeight:", self->_role, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "pr_variantWeightRange");
        v29 = v28;
        objc_msgSend(v25, "weight");
        -[PREditingFontPickerComponentViewController setFontWeight:](v22, "setFontWeight:", (v30 - (double)v27) / ((double)v29 - (double)v27));
        -[PRPosterTitleStyleConfiguration timeNumberingSystem](self->_titleStyleConfiguration, "timeNumberingSystem");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          -[PREditingFontAndColorPickerViewController localeWithNumberingSystem:](self, "localeWithNumberingSystem:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController setLocale:](v22, "setLocale:", v32);

        }
        -[PREditingFontPickerComponentViewController setDelegate:](v22, "setDelegate:", self);
        -[PREditingFontAndColorPickerViewController setFontPickerController:](self, "setFontPickerController:", v22);

        v5 = v73;
        v14 = v71;
      }

      v6 = v72;
      if ((v3 & 0x10) == 0)
      {
LABEL_26:
        if ((v3 & 8) != 0)
        {
          +[PREditingTitleLayoutPickerComponentViewController defaultTitleLayoutsForRole:](PREditingTitleLayoutPickerComponentViewController, "defaultTitleLayoutsForRole:", self->_role);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = [PREditingTitleLayoutPickerComponentViewController alloc];
          titleStyleConfiguration = self->_titleStyleConfiguration;
          -[PREditingFontAndColorPickerViewController titleString](self, "titleString");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[PREditingTitleLayoutPickerComponentViewController initWithTitleLayouts:selectedLayout:](v52, "initWithTitleLayouts:selectedLayout:", v51, -[PRPosterTitleStyleConfiguration effectiveTitleLayoutForText:](titleStyleConfiguration, "effectiveTitleLayoutForText:", v54));

          -[PREditingTitleLayoutPickerComponentViewController setDelegate:](v55, "setDelegate:", self);
          -[PREditingFontAndColorPickerViewController setTitleLayoutPickerController:](self, "setTitleLayoutPickerController:", v55);

          if ((v3 & 4) == 0)
          {
LABEL_28:
            if ((v3 & 2) == 0)
              goto LABEL_36;
            goto LABEL_32;
          }
        }
        else if ((v3 & 4) == 0)
        {
          goto LABEL_28;
        }
        v56 = -[PREditingColorPickerComponentViewController initWithConfiguration:variationStore:]([PREditingColorPickerComponentViewController alloc], "initWithConfiguration:variationStore:", self->_colorPickerConfiguration, self->_colorVariationStore);
        -[PREditingColorPickerComponentViewController setDelegate:](v56, "setDelegate:", self);
        -[PREditingColorPickerComponentViewController setContentsLuminance:](v56, "setContentsLuminance:", self->_contentsLuminance);
        -[PREditingFontAndColorPickerViewController setColorPickerController:](self, "setColorPickerController:", v56);

        if ((v3 & 2) == 0)
        {
LABEL_36:
          self->_hasLoadedComponentViewControllers = 1;

          return;
        }
LABEL_32:
        if ((v3 >> 2) & 1 | v74)
        {
          v57 = [PREditorNumberingSystemPickerController alloc];
          -[PRPosterTitleStyleConfiguration effectiveTimeNumberingSystem](self->_titleStyleConfiguration, "effectiveTimeNumberingSystem");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[PREditorNumberingSystemPickerController initWithSelectedNumberingSystem:selectedFont:](v57, "initWithSelectedNumberingSystem:selectedFont:", v58, v5);

          -[PREditorNumberingSystemPickerController setDelegate:](v59, "setDelegate:", self);
          numberingSystemController = self->_numberingSystemController;
          self->_numberingSystemController = v59;
          v61 = v59;

          v62 = (void *)MEMORY[0x1E0DC3870];
          objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "systemImageNamed:withConfiguration:", CFSTR("globe"), v63);
          v64 = (PREditorNumberingSystemViewController *)objc_claimAutoreleasedReturnValue();

          v65 = objc_alloc(MEMORY[0x1E0DC34F0]);
          -[PREditorNumberingSystemPickerController menu](v61, "menu");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (UIBarButtonItem *)objc_msgSend(v65, "initWithImage:menu:", v64, v66);

          numberSystemBarItem = self->_numberSystemBarItem;
          self->_numberSystemBarItem = v67;

        }
        else
        {
          v69 = [PREditorNumberingSystemViewController alloc];
          -[PRPosterTitleStyleConfiguration effectiveTimeNumberingSystem](self->_titleStyleConfiguration, "effectiveTimeNumberingSystem");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = -[PREditorNumberingSystemViewController initWithSelectedNumberingSystem:selectedFont:](v69, "initWithSelectedNumberingSystem:selectedFont:", v70, v5);

          -[PREditorNumberingSystemViewController setDelegate:](v64, "setDelegate:", self);
          -[PREditingFontAndColorPickerViewController setNumberingSystemViewController:](self, "setNumberingSystemViewController:", v64);
        }

        goto LABEL_36;
      }
    }
    else
    {
      v74 = 0;
      if ((v3 & 0x10) == 0)
        goto LABEL_26;
    }
    v33 = self->_titleStyleConfiguration;
    -[PREditingFontAndColorPickerViewController titleString](self, "titleString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PRPosterTitleStyleConfiguration effectiveTitleLayoutForText:](v33, "effectiveTitleLayoutForText:", v34);

    -[PREditingFontAndColorPickerViewController fontPickerController](self, "fontPickerController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "selectedItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "fontConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "effectiveFontForRole:", self->_role);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[PREditingFontAndColorPickerViewController titleString](self, "titleString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRIncomingCallFontsProvider idealEmphasizedFontSizeForName:usingLayout:](PRIncomingCallFontsProvider, "idealEmphasizedFontSizeForName:usingLayout:", v40, v35);
    v42 = v41;

    objc_msgSend(v39, "fontWithSize:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = [PRTitleAlignmentBarButtonItem alloc];
    v45 = self->_titleStyleConfiguration;
    -[PREditingFontAndColorPickerViewController titleString](self, "titleString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[PRTitleAlignmentBarButtonItem initWithTitleAlignment:target:action:](v44, "initWithTitleAlignment:target:action:", -[PRPosterTitleStyleConfiguration effectiveTitleAlignmentForText:withFont:](v45, "effectiveTitleAlignmentForText:withFont:", v46, v43), self, sel_didPressTitleAlignmentBarButtonItem_);
    titleAlignmentBarItem = self->_titleAlignmentBarItem;
    self->_titleAlignmentBarItem = v47;

    v49 = self->_titleAlignmentBarItem;
    -[PREditingFontAndColorPickerViewController titleString](self, "titleString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRTitleAlignmentBarButtonItem setEnabled:](v49, "setEnabled:", +[PRIncomingCallMetricsProvider canApplyKashidaToText:withFont:](PRIncomingCallMetricsProvider, "canApplyKashidaToText:withFont:", v50, v43));

    goto LABEL_26;
  }
}

PREditingFontPickerItem *__81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PREditingFontPickerItem *v3;

  v2 = a2;
  v3 = -[PREditingFontPickerItem initWithFontConfiguration:systemItem:]([PREditingFontPickerItem alloc], "initWithFontConfiguration:systemItem:", v2, 0);

  return v3;
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "isSystemItem"))
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "fontConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fontAndColorPickerViewController:shouldShowFontConfiguration:", v4, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "fontConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  return v7;
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;

  v3 = a2;
  objc_msgSend(v3, "fontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  objc_msgSend(v3, "isSystemItem");
  objc_msgSend(*(id *)(a1 + 40), "isSystemItem");
  return v5 & BSFloatEqualToFloat();
}

uint64_t __81__PREditingFontAndColorPickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a2;
  objc_msgSend(v3, "fontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeFontIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeFontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  objc_msgSend(v3, "isSystemItem");
  objc_msgSend(*(id *)(a1 + 40), "isSystemItem");
  return v7 & BSFloatEqualToFloat();
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditingFontAndColorPickerViewController;
  -[PREditingFontAndColorPickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PREditingFontAndColorPickerViewController updatePopoverContentSize](self, "updatePopoverContentSize");
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PUIColorWell *colorWell;
  id v16;
  PUIColorWellView *colorWellView;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
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
  uint64_t k;
  void *v48;
  id v49;
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
  id obja;
  id obj;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  _BYTE v102[128];
  _QWORD v103[7];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  -[PREditingFontAndColorPickerViewController loadComponentViewControllersIfNeeded](self, "loadComponentViewControllersIfNeeded");
  -[PREditingFontAndColorPickerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setManualScrollEdgeAppearanceProgress:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__closeButtonTapped_);
    objc_msgSend(v5, "setRightBarButtonItem:", v8);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = -[PREditingFontAndColorPickerViewController components](self, "components");
  if ((self->_components & 8) != 0 && self->_titleLayoutPickerController)
    objc_msgSend(v9, "addObject:");
  if ((v10 & 1) != 0 && self->_fontPickerController)
    objc_msgSend(v9, "addObject:");
  if ((self->_components & 0x10) == 0)
  {
    if ((v10 & 2) == 0)
      goto LABEL_11;
LABEL_33:
    if (self->_numberingSystemViewController)
    {
      objc_msgSend(v9, "addObject:");
      if ((v10 & 4) == 0)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(v5, "setLeftBarButtonItem:", self->_numberSystemBarItem);
      if ((v10 & 4) == 0)
        goto LABEL_13;
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "setLeftBarButtonItem:", self->_titleAlignmentBarItem);
  if ((v10 & 2) != 0)
    goto LABEL_33;
LABEL_11:
  if ((v10 & 4) != 0)
LABEL_12:
    objc_msgSend(v9, "addObject:", self->_colorPickerController);
LABEL_13:
  if (-[PREditorColorPickerConfiguration colorWellDisplayMode](self->_colorPickerConfiguration, "colorWellDisplayMode") == 2
    && !self->_numberSystemBarItem)
  {
    v11 = objc_alloc(MEMORY[0x1E0D7FCB8]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v12, "colorWell");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_colorWellDidUpdateColor_, 4096);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v12);
    objc_msgSend(v5, "setLeftBarButtonItem:", v14);
    colorWell = self->_colorWell;
    self->_colorWell = (PUIColorWell *)v13;
    v16 = v13;

    colorWellView = self->_colorWellView;
    self->_colorWellView = (PUIColorWellView *)v12;

  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v98 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v18, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v21);
  }

  v72 = v18;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v18);
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v26 = v19;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v94;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v94 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
        -[PREditingFontAndColorPickerViewController addChildViewController:](self, "addChildViewController:", v31);
        objc_msgSend(v31, "didMoveToParentViewController:", self);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    }
    while (v28);
  }
  v71 = v5;
  v69 = v26;

  objc_msgSend(v25, "setAxis:", 1);
  objc_msgSend(v25, "setSpacing:", 48.0);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditingFontAndColorPickerViewController setRootStackView:](self, "setRootStackView:", v25);
  v32 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithEffect:", v33);

  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v35 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v35, "addSubview:", v34);
  objc_msgSend(v35, "addSubview:", v25);
  -[PREditingFontAndColorPickerViewController setView:](self, "setView:", v35);
  v64 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v25, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v81;
  objc_msgSend(v25, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v75);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v103[1] = obja;
  v70 = v25;
  objc_msgSend(v25, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "safeAreaLayoutGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v63, 7.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v62;
  objc_msgSend(v34, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v59;
  objc_msgSend(v34, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v38;
  objc_msgSend(v34, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v41;
  v68 = v34;
  objc_msgSend(v34, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v35;
  objc_msgSend(v35, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 7);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "activateConstraints:", v45);

  if ((unint64_t)objc_msgSend(v72, "count") < 2)
  {
    v46 = 0;
  }
  else
  {
    objc_msgSend(v72, "subarrayWithRange:", 1, objc_msgSend(v72, "count") - 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v46;
  v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
  if (v78)
  {
    v76 = *(_QWORD *)v90;
    do
    {
      for (k = 0; k != v78; ++k)
      {
        if (*(_QWORD *)v90 != v76)
          objc_enumerationMutation(obj);
        v48 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
        v49 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setBackgroundColor:", v50);

        objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v48, "addSubview:", v49);
        v80 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v49, "heightAnchor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "constraintEqualToConstant:", 1.0);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v101[0] = v86;
        objc_msgSend(v49, "leadingAnchor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "leadingAnchor");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "constraintEqualToAnchor:", v82);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v101[1] = v51;
        objc_msgSend(v49, "trailingAnchor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "trailingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "constraintEqualToAnchor:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v101[2] = v54;
        objc_msgSend(v49, "bottomAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "topAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, -24.0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v101[3] = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 4);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "activateConstraints:", v58);

      }
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
    }
    while (v78);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  UIBarButtonItem *numberSystemBarItem;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PREditingFontAndColorPickerViewController;
  v4 = a3;
  -[PREditingFontAndColorPickerViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  -[PREditingFontAndColorPickerViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    numberSystemBarItem = self->_numberSystemBarItem;
    -[PREditorNumberingSystemPickerController menu](self->_numberingSystemController, "menu");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setMenu:](numberSystemBarItem, "setMenu:", v9);

  }
}

- (double)desiredDetent
{
  unint64_t components;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  PREditorNumberingSystemViewController *numberingSystemViewController;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double result;
  double v15;

  -[PREditingFontAndColorPickerViewController loadComponentViewControllersIfNeeded](self, "loadComponentViewControllersIfNeeded");
  components = self->_components;
  if ((components & 1) == 0)
  {
    v4 = 0;
    if ((components & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((components & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v4 = self->_fontPickerController != 0;
  if ((components & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = self->_titleLayoutPickerController != 0;
  if ((components & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = self->_colorPickerController != 0;
LABEL_8:
  v7 = 0.0;
  if ((components & 2) != 0 && (numberingSystemViewController = self->_numberingSystemViewController) != 0)
  {
    -[PREditorNumberingSystemViewController estimatedHeight](numberingSystemViewController, "estimatedHeight");
    v7 = v9 + 0.0;
    v10 = 1;
    if (!v4)
      goto LABEL_16;
  }
  else
  {
    v10 = 0;
    if (!v4)
      goto LABEL_16;
  }
  -[PREditingFontPickerComponentViewController estimatedHeight](self->_fontPickerController, "estimatedHeight");
  v12 = v7 + v11;
  ++v10;
  if (v6)
    v7 = v12 + 48.0;
  else
    v7 = v12;
LABEL_16:
  if (v5)
  {
    -[PREditingTitleLayoutPickerComponentViewController estimatedHeight](self->_titleLayoutPickerController, "estimatedHeight");
    v7 = v7 + v15;
    v10 = 1;
    if (v6)
      goto LABEL_18;
  }
  else if (v6)
  {
LABEL_18:
    -[PREditingColorPickerComponentViewController estimatedHeight](self->_colorPickerController, "estimatedHeight");
    return v7 + v13 + 84.0;
  }
  result = v7 + 84.0;
  if (!v10)
    return 100.0;
  return result;
}

- (BOOL)_shouldShowWeightSliderForSelectedFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  if (_os_feature_enabled_impl())
  {
    -[PRPosterTitleStyleConfiguration timeFontConfiguration](self->_titleStyleConfiguration, "timeFontConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndColorPickerViewController extensionBundleURL](self, "extensionBundleURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeFontConfigurationWithExtensionBundleURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "isSystemItem"))
    {
      objc_msgSend(v5, "timeFontIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", CFSTR("PRTimeFontIdentifierRail")) ^ 1;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
  if (-[PREditingFontAndColorPickerViewController isViewLoaded](self, "isViewLoaded"))
    -[PREditingColorPickerComponentViewController setContentsLuminance:](self->_colorPickerController, "setContentsLuminance:", a3);
}

- (void)_closeButtonTapped:(id)a3
{
  -[PREditingFontAndColorPickerViewController _signalDelegateDidFinish](self, "_signalDelegateDidFinish", a3);
  -[PREditingFontAndColorPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_signalDelegateDidFinish
{
  id v3;

  -[PREditingFontAndColorPickerViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "fontAndColorPickerViewControllerDidFinish:", self);

}

- (id)localeWithNumberingSystem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("numbers"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fontPickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4;

  -[PREditingFontAndColorPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PREditingFontAndColorPickerViewController desiredDetent](self, "desiredDetent");
    objc_msgSend(v4, "fontAndColorPickerViewController:didUpdateDesiredDetent:", self);
  }

}

- (void)fontPickerComponentViewController:(id)a3 didChangeFontWeight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;

  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self->_titleStyleConfiguration, "timeFontConfiguration", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndColorPickerViewController extensionBundleURL](self, "extensionBundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeFontConfigurationWithExtensionBundleURL:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "effectiveFontForRole:ignoringWeight:", self->_role, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pr_variantWeightRange");
  v11 = v10;
  -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v11 * a4 + (1.0 - a4) * (double)v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD))v12)[2](v12, 0, 0, 0, v13, 0, 0, 0, 0);

  }
}

- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __CFString *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v6 = a4;
  objc_msgSend(v6, "fontConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectiveFontForRole:", self->_role);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorNumberingSystemPickerController setFont:](self->_numberingSystemController, "setFont:", v8);
  -[PREditorNumberingSystemPickerController menu](self->_numberingSystemController, "menu");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setMenu:](self->_numberSystemBarItem, "setMenu:", v9);
  objc_msgSend(v6, "fontConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectiveFontForRole:ignoringWeight:", self->_role, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[PREditingFontAndColorPickerViewController additionalFontConfigurations](self, "additionalFontConfigurations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    objc_msgSend(v6, "fontConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeFontIdentifier");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((v15 & 1) != 0 || v17 == CFSTR("PRTimeFontIdentifierRail"))
    {
      objc_msgSend(v6, "fontConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "weight");
      v22 = v24;

    }
    else
    {
      v18 = objc_msgSend(v11, "pr_variantWeightRange");
      v20 = v19;
      objc_msgSend(v30, "fontWeight");
      v22 = v21 * (double)v20 + (1.0 - v21) * (double)v18;
    }
    if (v15)
      v25 = v8;
    else
      v25 = 0;
    v26 = (void *)MEMORY[0x1E0CB37E8];
    v27 = v25;
    objc_msgSend(v26, "numberWithDouble:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isSystemItem"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, __CFString *, _QWORD, _QWORD, void *, void *, id, _QWORD, _QWORD))v12)[2](v12, v17, 0, 0, v28, v29, v27, 0, 0);

  }
}

- (void)titleLayoutPickerComponentViewController:(id)a3 didSelectTitleLayout:(unint64_t)a4 userSelected:(BOOL)a5
{
  unint64_t v5;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
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
  id v26;

  v5 = a4;
  v7 = +[PRIncomingCallMetricsProvider maxVerticalTextLength](PRIncomingCallMetricsProvider, "maxVerticalTextLength", a3, a4, a5);
  if (PRPosterTitleLayoutIsVertical(v5))
  {
    -[PREditingFontAndColorPickerViewController titleString](self, "titleString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 > v7)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      PRBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANNOT_CHANGE_LAYOUT_EXPLANATION"), &stru_1E2186E08, CFSTR("PosterKit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v12, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3450];
      PRBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANNOT_CHANGE_LAYOUT"), &stru_1E2186E08, CFSTR("PosterKit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v13, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0DC3448];
      PRBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANNOT_CHANGE_LAYOUT_DISMISS_ACTION"), &stru_1E2186E08, CFSTR("PosterKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addAction:", v21);
      -[PREditingFontAndColorPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

      v5 = 0;
    }
  }
  -[PREditingFontAndColorPickerViewController titleLayoutPickerController](self, "titleLayoutPickerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PREditingFontAndColorPickerViewController titleLayoutPickerController](self, "titleLayoutPickerController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSelectedTitleLayout:", v5);

  }
  -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v26 = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v26 + 2))(v26, 0, 0, v25, 0, 0, 0, 0, 0);

    v24 = v26;
  }

}

- (void)numberingSystemPickerController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "displayLocale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndColorPickerViewController numberingSystemWasChanged:locale:](self, "numberingSystemWasChanged:locale:", v6, v7);

}

- (void)numberingSystemViewController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "displayLocale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndColorPickerViewController numberingSystemWasChanged:locale:](self, "numberingSystemWasChanged:locale:", v6, v7);

}

- (void)numberingSystemWasChanged:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PREditorNumberingSystemPickerController *numberingSystemController;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PREditingFontAndColorPickerViewController fontPickerController](self, "fontPickerController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "setLocale:", v6);
  numberingSystemController = self->_numberingSystemController;
  if (numberingSystemController)
  {
    -[PREditorNumberingSystemPickerController menu](numberingSystemController, "menu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setMenu:](self->_numberSystemBarItem, "setMenu:", v10);

  }
  -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id, _QWORD))(v11 + 16))(v11, 0, 0, 0, 0, 0, 0, v13, 0);

}

+ (id)defaultFontIdentifiersForRole:(id)a3
{
  return (id)objc_msgSend(a1, "defaultFontIdentifiersForRole:titleString:", a3, 0);
}

+ (id)defaultFontIdentifiersForRole:(id)a3 titleString:(id)a4
{
  return +[PREditingFontPickerComponentViewController defaultFontIdentifiersForRole:titleString:](PREditingFontPickerComponentViewController, "defaultFontIdentifiersForRole:titleString:", a3, a4);
}

- (void)didPressTitleAlignmentBarButtonItem:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v4 = -[PRTitleAlignmentBarButtonItem toggle](self->_titleAlignmentBarItem, "toggle", a3);
  -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, v5, 0, 0, 0, 0, 0, 0);

  }
}

- (void)updatePopoverContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  -[PREditingFontAndColorPickerViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[PREditingFontAndColorPickerViewController rootStackView](self, "rootStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v8, "setPreferredContentSize:", 370.0, v5 + v7 + -15.0);

}

- (void)colorPickerComponentViewController:(id)a3 didSelectColorItem:(id)a4 userSelected:(BOOL)a5
{
  _BOOL4 v5;
  PUIColorWell *colorWell;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a4;
  if (objc_msgSend(v12, "isFromUIKitColorPicker"))
  {
    colorWell = self->_colorWell;
    if (colorWell)
    {
      objc_msgSend(v12, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUIColorWell setSelectedColor:](colorWell, "setSelectedColor:", v9);

    }
  }
  if (v5)
  {
    -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))(v10 + 16))(v10, 0, 0, 0, 0, 0, 0, 0, v12);

  }
}

- (void)colorPickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4;

  -[PREditingFontAndColorPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PREditingFontAndColorPickerViewController desiredDetent](self, "desiredDetent");
    objc_msgSend(v4, "fontAndColorPickerViewController:didUpdateDesiredDetent:", self);
  }

}

- (void)colorWellDidUpdateColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRPosterColor *v7;
  PREditorColorPickerConstantColor *v8;
  PREditingColorItem *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PREditingFontAndColorPickerViewController colorWell](self, "colorWell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateIntrinsicContentSize");

  -[PREditingFontAndColorPickerViewController colorWellView](self, "colorWellView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  objc_msgSend(v4, "selectedColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v12);
  v8 = -[PREditorColorPickerConstantColor initWithColor:initialVariation:]([PREditorColorPickerConstantColor alloc], "initWithColor:initialVariation:", v7, 0.0);
  v9 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v8, -[PREditorColorPickerConfiguration context](self->_colorPickerConfiguration, "context"), 0.0);
  -[PREditingColorItem setFromUIKitColorPicker:](v9, "setFromUIKitColorPicker:", 1);
  -[PREditingColorPickerComponentViewController updateForColorWellSelectedItem:](self->_colorPickerController, "updateForColorWellSelectedItem:", v9);
  -[PREditingFontAndColorPickerViewController changeHandler](self, "changeHandler");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, PREditingColorItem *))(v10 + 16))(v10, 0, 0, 0, 0, 0, 0, 0, v9);

}

- (unint64_t)components
{
  return self->_components;
}

- (PREditingColorVariationStore)colorVariationStore
{
  return self->_colorVariationStore;
}

- (void)setColorVariationStore:(id)a3
{
  objc_storeStrong((id *)&self->_colorVariationStore, a3);
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_titleStyleConfiguration, a3);
}

- (PREditorColorPickerConfiguration)colorPickerConfiguration
{
  return self->_colorPickerConfiguration;
}

- (void)setColorPickerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerConfiguration, a3);
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (NSURL)extensionBundleURL
{
  return self->_extensionBundleURL;
}

- (void)setExtensionBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (PREditingFontAndColorPickerViewControllerDelegate)delegate
{
  return (PREditingFontAndColorPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (PREditingColorPickerComponentViewController)colorPickerController
{
  return self->_colorPickerController;
}

- (void)setColorPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_colorPickerController, a3);
}

- (PUIColorWellView)colorWellView
{
  return self->_colorWellView;
}

- (void)setColorWellView:(id)a3
{
  objc_storeStrong((id *)&self->_colorWellView, a3);
}

- (PUIColorWell)colorWell
{
  return self->_colorWell;
}

- (void)setColorWell:(id)a3
{
  objc_storeStrong((id *)&self->_colorWell, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (BOOL)hasLoadedComponentViewControllers
{
  return self->_hasLoadedComponentViewControllers;
}

- (void)setHasLoadedComponentViewControllers:(BOOL)a3
{
  self->_hasLoadedComponentViewControllers = a3;
}

- (UIStackView)rootStackView
{
  return self->_rootStackView;
}

- (void)setRootStackView:(id)a3
{
  objc_storeStrong((id *)&self->_rootStackView, a3);
}

- (UIBarButtonItem)numberSystemBarItem
{
  return self->_numberSystemBarItem;
}

- (void)setNumberSystemBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_numberSystemBarItem, a3);
}

- (PREditorNumberingSystemPickerController)numberingSystemController
{
  return self->_numberingSystemController;
}

- (void)setNumberingSystemController:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystemController, a3);
}

- (PRTitleAlignmentBarButtonItem)titleAlignmentBarItem
{
  return self->_titleAlignmentBarItem;
}

- (void)setTitleAlignmentBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_titleAlignmentBarItem, a3);
}

- (PREditingFontPickerComponentViewController)fontPickerController
{
  return self->_fontPickerController;
}

- (void)setFontPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_fontPickerController, a3);
}

- (PREditingTitleLayoutPickerComponentViewController)titleLayoutPickerController
{
  return self->_titleLayoutPickerController;
}

- (void)setTitleLayoutPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_titleLayoutPickerController, a3);
}

- (PREditorNumberingSystemViewController)numberingSystemViewController
{
  return self->_numberingSystemViewController;
}

- (void)setNumberingSystemViewController:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystemViewController, a3);
}

- (NSArray)additionalFontConfigurations
{
  return self->_additionalFontConfigurations;
}

- (void)setAdditionalFontConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFontConfigurations, 0);
  objc_storeStrong((id *)&self->_numberingSystemViewController, 0);
  objc_storeStrong((id *)&self->_titleLayoutPickerController, 0);
  objc_storeStrong((id *)&self->_fontPickerController, 0);
  objc_storeStrong((id *)&self->_titleAlignmentBarItem, 0);
  objc_storeStrong((id *)&self->_numberingSystemController, 0);
  objc_storeStrong((id *)&self->_numberSystemBarItem, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_colorWell, 0);
  objc_storeStrong((id *)&self->_colorWellView, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_colorPickerConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_colorVariationStore, 0);
}

@end
