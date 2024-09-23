@implementation PREditingFontAndContentStylePickerViewController

- (PREditingFontAndContentStylePickerViewController)initWithComponents:(unint64_t)a3 role:(id)a4 titleString:(id)a5
{
  id v8;
  id v9;
  PREditingFontAndContentStylePickerViewController *v10;
  PREditingFontAndContentStylePickerViewController *v11;
  uint64_t v12;
  NSString *role;
  uint64_t v14;
  NSString *titleString;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PREditingFontAndContentStylePickerViewController;
  v10 = -[PREditingFontAndContentStylePickerViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    v10->_components = a3;
    v10->_contentsLuminance = 0.5;
    v12 = objc_msgSend(v8, "copy");
    role = v11->_role;
    v11->_role = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    titleString = v11->_titleString;
    v11->_titleString = (NSString *)v14;

  }
  return v11;
}

- (PREditingFontAndContentStylePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PREditingFontAndContentStylePickerViewController initWithComponents:role:titleString:](self, "initWithComponents:role:titleString:", 31, CFSTR("PRPosterRoleLockScreen"), 0);
}

- (void)loadComponentViewControllersIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  _BOOL4 v25;
  int v26;
  PREditingFontPickerComponentViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  void *v36;
  void *v37;
  PRTitleAlignmentBarButtonItem *v38;
  PRTitleAlignmentBarButtonItem *titleAlignmentBarItem;
  void *v40;
  PREditingTitleLayoutPickerComponentViewController *v41;
  PREditingContentStylePickerComponentViewController *v42;
  PREditorNumberingSystemPickerController *v43;
  void *v44;
  PREditorNumberingSystemPickerController *v45;
  PREditorNumberingSystemPickerController *numberingSystemController;
  PREditorNumberingSystemPickerController *v47;
  void *v48;
  void *v49;
  PREditorNumberingSystemViewController *v50;
  id v51;
  void *v52;
  UIBarButtonItem *v53;
  UIBarButtonItem *numberSystemBarItem;
  PREditorNumberingSystemViewController *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  PREditingFontAndContentStylePickerViewController *v75;

  if (!self->_hasLoadedComponentViewControllers)
  {
    v3 = -[PREditingFontAndContentStylePickerViewController components](self, "components");
    -[PREditingFontAndContentStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
    v4 = objc_claimAutoreleasedReturnValue();
    v64 = (id)v4;
    if (v4)
    {
      -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:forRole:](self->_titleStyleConfiguration, "effectiveTimeFontWithExtensionBundleURL:forRole:", v4, self->_role);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    -[PREditingFontAndContentStylePickerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 1) != 0)
    {
      +[PREditingFontPickerComponentViewController defaultItemsForRole:titleString:](PREditingFontPickerComponentViewController, "defaultItemsForRole:titleString:", self->_role, self->_titleString);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](self->_role, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall"))
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "additionalFontConfigurationsForFontAndContentStylePickerViewController:", self);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[PREditingFontAndContentStylePickerViewController setAdditionalFontConfigurations:](self, "setAdditionalFontConfigurations:", v9);
          objc_msgSend(v9, "bs_map:", &__block_literal_global_24);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
          v11 = v6;
          v12 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v12;
          v6 = v11;
        }

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = v5;
        v14 = MEMORY[0x1E0C809B0];
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2;
        v73[3] = &unk_1E21841D0;
        v74 = v6;
        v75 = self;
        objc_msgSend(v8, "bs_filter:", v73);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = v8;
        v13 = v5;
        v14 = MEMORY[0x1E0C809B0];
      }
      -[PRPosterTitleStyleConfiguration timeFontConfiguration](self->_titleStyleConfiguration, "timeFontConfiguration", 984);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeFontConfigurationWithExtensionBundleURL:", v64);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "customFont");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = v6;
      v61 = v17;
      if (v18)
      {
        objc_msgSend(v17, "customFont");
        v71[0] = v14;
        v71[1] = 3221225472;
        v71[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3;
        v71[3] = &unk_1E21841F8;
        v72 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v72;
        v20 = v15;
        objc_msgSend(v15, "bs_firstObjectPassingTest:", v71);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v13;
      }
      else
      {
        v59 = v13;
        v68[0] = v14;
        v68[1] = 3221225472;
        v68[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4;
        v68[3] = &unk_1E21841D0;
        v22 = v17;
        v69 = v22;
        v23 = v16;
        v70 = v23;
        v20 = v15;
        objc_msgSend(v15, "bs_firstObjectPassingTest:", v68);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          v65[0] = v14;
          v65[1] = 3221225472;
          v65[2] = __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5;
          v65[3] = &unk_1E21841D0;
          v66 = v22;
          v67 = v23;
          objc_msgSend(v15, "bs_firstObjectPassingTest:", v65);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v19 = v69;
        v5 = v59;
      }

      v24 = objc_msgSend(v20, "count");
      v25 = -[PREditingFontAndContentStylePickerViewController _shouldShowWeightSliderForSelectedFont](self, "_shouldShowWeightSliderForSelectedFont");
      v26 = v24 > 1 || v25;
      v62 = v26;
      if (v26 == 1)
      {
        v58 = v16;
        v60 = v5;
        v27 = -[PREditingFontPickerComponentViewController initWithItems:selectedItem:role:titleString:]([PREditingFontPickerComponentViewController alloc], "initWithItems:selectedItem:role:titleString:", v20, v21, self->_role, self->_titleString);
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v57), "timeFontConfiguration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingFontAndContentStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeFontConfigurationWithExtensionBundleURL:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "effectiveFontForRole:ignoringWeight:", self->_role, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "pr_variantWeightRange");
        v34 = v33;
        objc_msgSend(v30, "weight");
        -[PREditingFontPickerComponentViewController setFontWeight:](v27, "setFontWeight:", (v35 - (double)v32) / ((double)v34 - (double)v32));
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v57), "timeNumberingSystem");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          -[PREditingFontAndContentStylePickerViewController localeWithNumberingSystem:](self, "localeWithNumberingSystem:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PREditingFontPickerComponentViewController setLocale:](v27, "setLocale:", v37);

        }
        -[PREditingFontPickerComponentViewController setDelegate:](v27, "setDelegate:", self);
        -[PREditingFontAndContentStylePickerViewController setFontPickerController:](self, "setFontPickerController:", v27);

        v16 = v58;
        v5 = v60;
      }

      v6 = v63;
      v7 = v62;
      if ((v3 & 0x10) == 0)
      {
LABEL_30:
        if ((v3 & 8) != 0)
        {
          +[PREditingTitleLayoutPickerComponentViewController defaultTitleLayoutsForRole:](PREditingTitleLayoutPickerComponentViewController, "defaultTitleLayoutsForRole:", self->_role);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[PREditingTitleLayoutPickerComponentViewController initWithTitleLayouts:selectedLayout:]([PREditingTitleLayoutPickerComponentViewController alloc], "initWithTitleLayouts:selectedLayout:", v40, -[PRPosterTitleStyleConfiguration preferredTitleLayout](self->_titleStyleConfiguration, "preferredTitleLayout"));
          -[PREditingTitleLayoutPickerComponentViewController setDelegate:](v41, "setDelegate:", self);
          -[PREditingFontAndContentStylePickerViewController setTitleLayoutPickerController:](self, "setTitleLayoutPickerController:", v41);

          if ((v3 & 4) == 0)
          {
LABEL_32:
            if ((v3 & 2) == 0)
              goto LABEL_40;
            goto LABEL_36;
          }
        }
        else if ((v3 & 4) == 0)
        {
          goto LABEL_32;
        }
        v42 = -[PREditingContentStylePickerComponentViewController initWithConfiguration:]([PREditingContentStylePickerComponentViewController alloc], "initWithConfiguration:", self->_contentStylePickerConfiguration);
        -[PREditingContentStylePickerComponentViewController setDelegate:](v42, "setDelegate:", self);
        -[PREditingContentStylePickerComponentViewController setContentsLuminance:](v42, "setContentsLuminance:", self->_contentsLuminance);
        -[PREditingFontAndContentStylePickerViewController setContentStylePickerController:](self, "setContentStylePickerController:", v42);

        if ((v3 & 2) == 0)
        {
LABEL_40:
          self->_hasLoadedComponentViewControllers = 1;

          return;
        }
LABEL_36:
        if ((v3 >> 2) & 1 | v7 & 1)
        {
          v43 = [PREditorNumberingSystemPickerController alloc];
          -[PRPosterTitleStyleConfiguration effectiveTimeNumberingSystem](self->_titleStyleConfiguration, "effectiveTimeNumberingSystem");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[PREditorNumberingSystemPickerController initWithSelectedNumberingSystem:selectedFont:](v43, "initWithSelectedNumberingSystem:selectedFont:", v44, v5);

          -[PREditorNumberingSystemPickerController setDelegate:](v45, "setDelegate:", self);
          numberingSystemController = self->_numberingSystemController;
          self->_numberingSystemController = v45;
          v47 = v45;

          v48 = (void *)MEMORY[0x1E0DC3870];
          objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "systemImageNamed:withConfiguration:", CFSTR("globe"), v49);
          v50 = (PREditorNumberingSystemViewController *)objc_claimAutoreleasedReturnValue();

          v51 = objc_alloc(MEMORY[0x1E0DC34F0]);
          -[PREditorNumberingSystemPickerController menu](v47, "menu");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (UIBarButtonItem *)objc_msgSend(v51, "initWithImage:menu:", v50, v52);

          numberSystemBarItem = self->_numberSystemBarItem;
          self->_numberSystemBarItem = v53;

        }
        else
        {
          v55 = [PREditorNumberingSystemViewController alloc];
          -[PRPosterTitleStyleConfiguration effectiveTimeNumberingSystem](self->_titleStyleConfiguration, "effectiveTimeNumberingSystem");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = -[PREditorNumberingSystemViewController initWithSelectedNumberingSystem:selectedFont:](v55, "initWithSelectedNumberingSystem:selectedFont:", v56, v5);

          -[PREditorNumberingSystemViewController setDelegate:](v50, "setDelegate:", self);
          -[PREditingFontAndContentStylePickerViewController setNumberingSystemViewController:](self, "setNumberingSystemViewController:", v50);
        }

        goto LABEL_40;
      }
    }
    else
    {
      v7 = 0;
      if ((v3 & 0x10) == 0)
        goto LABEL_30;
    }
    v38 = -[PRTitleAlignmentBarButtonItem initWithTitleAlignment:target:action:]([PRTitleAlignmentBarButtonItem alloc], "initWithTitleAlignment:target:action:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self->_titleStyleConfiguration, "preferredTitleAlignment"), self, sel_didPressTitleAlignmentBarButtonItem_);
    titleAlignmentBarItem = self->_titleAlignmentBarItem;
    self->_titleAlignmentBarItem = v38;

    goto LABEL_30;
  }
}

PREditingFontPickerItem *__88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PREditingFontPickerItem *v3;

  v2 = a2;
  v3 = -[PREditingFontPickerItem initWithFontConfiguration:systemItem:]([PREditingFontPickerItem alloc], "initWithFontConfiguration:systemItem:", v2, 0);

  return v3;
}

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_2(uint64_t a1, void *a2)
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
    v7 = objc_msgSend(v5, "fontAndContentStylePickerViewController:shouldShowFontConfiguration:", v4, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_3(uint64_t a1, void *a2)
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

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_4(uint64_t a1, void *a2)
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

uint64_t __88__PREditingFontAndContentStylePickerViewController_loadComponentViewControllersIfNeeded__block_invoke_5(uint64_t a1, void *a2)
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
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PREditingFontAndContentStylePickerViewController;
  -[PREditingFontAndContentStylePickerViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  -[PREditingFontAndContentStylePickerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[PREditingFontAndContentStylePickerViewController rootStackView](self, "rootStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v3, "setPreferredContentSize:", v9, v6 + v8 + -15.0);

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
  PREditingFontPickerComponentViewController *fontPickerController;
  void *v12;
  unint64_t v13;
  int v14;
  int v15;
  unint64_t components;
  void *v17;
  UIBarButtonItem *numberSystemBarItem;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t k;
  void *v57;
  id v58;
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
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id obja;
  id obj;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  _BYTE v112[128];
  _QWORD v113[7];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  -[PREditingFontAndContentStylePickerViewController loadComponentViewControllersIfNeeded](self, "loadComponentViewControllersIfNeeded");
  -[PREditingFontAndContentStylePickerViewController navigationController](self, "navigationController");
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
  v10 = -[PREditingFontAndContentStylePickerViewController components](self, "components");
  if ((v10 & 1) != 0 && (fontPickerController = self->_fontPickerController) != 0)
  {
    -[PREditingFontPickerComponentViewController items](fontPickerController, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 < 2)
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      objc_msgSend(v9, "addObject:", self->_fontPickerController);
      v14 = 0;
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
    v14 = 1;
  }
  components = self->_components;
  if ((components & 0x10) != 0)
  {
    objc_msgSend(v5, "setLeftBarButtonItem:", self->_titleAlignmentBarItem);
    components = self->_components;
  }
  if ((components & 8) != 0 && self->_titleLayoutPickerController)
    objc_msgSend(v9, "addObject:");
  if (((v14 | v15) & 1) == 0)
    objc_msgSend(v9, "addObject:", self->_fontPickerController);
  if ((v10 & 2) != 0)
  {
    if (self->_numberingSystemViewController)
      objc_msgSend(v9, "addObject:");
    else
      objc_msgSend(v5, "setLeftBarButtonItem:", self->_numberSystemBarItem);
  }
  if ((v10 & 4) != 0)
    objc_msgSend(v9, "addObject:", self->_contentStylePickerController);
  -[PREditingContentStylePickerComponentViewController colorWell](self->_contentStylePickerController, "colorWell");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    numberSystemBarItem = self->_numberSystemBarItem;

    if (!numberSystemBarItem)
    {
      -[PREditingContentStylePickerComponentViewController colorWellView](self->_contentStylePickerController, "colorWellView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "colorWell");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v19);
      objc_msgSend(v5, "setLeftBarButtonItem:", v21);

    }
  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v108 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    }
    while (v25);
  }

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v22);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v30 = v23;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v104 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        -[PREditingFontAndContentStylePickerViewController addChildViewController:](self, "addChildViewController:", v35);
        objc_msgSend(v35, "didMoveToParentViewController:", self);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
    }
    while (v32);
  }
  v82 = v22;
  v78 = v5;

  objc_msgSend(v29, "setAxis:", 1);
  objc_msgSend(v29, "setSpacing:", 48.0);
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PREditingFontAndContentStylePickerViewController setRootStackView:](self, "setRootStackView:", v29);
  v36 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v36, "initWithEffect:", v37);

  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v39 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v39, "addSubview:", v38);
  objc_msgSend(v39, "addSubview:", v29);
  -[PREditingFontAndContentStylePickerViewController setView:](self, "setView:", v39);
  v74 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v29, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safeAreaLayoutGuide");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:", v93);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v91;
  objc_msgSend(v29, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safeAreaLayoutGuide");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "trailingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v85);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v113[1] = obja;
  v80 = v29;
  objc_msgSend(v29, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "safeAreaLayoutGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v73, 7.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v72;
  objc_msgSend(v38, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v69;
  objc_msgSend(v38, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v81 = v30;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v41;
  objc_msgSend(v38, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v44;
  v77 = v38;
  objc_msgSend(v38, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v39;
  objc_msgSend(v39, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 7);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "activateConstraints:", v48);

  if (objc_msgSend(v81, "count") == 1)
  {
    objc_msgSend(v81, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndContentStylePickerViewController numberingSystemViewController](self, "numberingSystemViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49 == v50)
    {
      objc_msgSend(v80, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "safeAreaLayoutGuide");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "setActive:", 1);
    }
  }
  if ((unint64_t)objc_msgSend(v82, "count") < 2)
  {
    v55 = 0;
  }
  else
  {
    objc_msgSend(v82, "subarrayWithRange:", 1, objc_msgSend(v82, "count") - 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v55;
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
  if (v88)
  {
    v86 = *(_QWORD *)v100;
    do
    {
      for (k = 0; k != v88; ++k)
      {
        if (*(_QWORD *)v100 != v86)
          objc_enumerationMutation(obj);
        v57 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * k);
        v58 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setBackgroundColor:", v59);

        objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v57, "addSubview:", v58);
        v90 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v58, "heightAnchor");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "constraintEqualToConstant:", 1.0);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = v96;
        objc_msgSend(v58, "leadingAnchor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "leadingAnchor");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "constraintEqualToAnchor:", v92);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v111[1] = v60;
        objc_msgSend(v58, "trailingAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "trailingAnchor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintEqualToAnchor:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v111[2] = v63;
        objc_msgSend(v58, "bottomAnchor");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "topAnchor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, -24.0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v111[3] = v66;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 4);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "activateConstraints:", v67);

      }
      v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
    }
    while (v88);
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
  v10.super_class = (Class)PREditingFontAndContentStylePickerViewController;
  v4 = a3;
  -[PREditingFontAndContentStylePickerViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v10.receiver, v10.super_class);

  -[PREditingFontAndContentStylePickerViewController traitCollection](self, "traitCollection");
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

  -[PREditingFontAndContentStylePickerViewController loadComponentViewControllersIfNeeded](self, "loadComponentViewControllersIfNeeded");
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
  v6 = self->_contentStylePickerController != 0;
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
    -[PREditingContentStylePickerComponentViewController estimatedHeight](self->_contentStylePickerController, "estimatedHeight");
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
    -[PREditingFontAndContentStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
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
  if (-[PREditingFontAndContentStylePickerViewController isViewLoaded](self, "isViewLoaded"))
    -[PREditingContentStylePickerComponentViewController setContentsLuminance:](self->_contentStylePickerController, "setContentsLuminance:", a3);
}

- (void)_closeButtonTapped:(id)a3
{
  -[PREditingFontAndContentStylePickerViewController _signalDelegateDidFinish](self, "_signalDelegateDidFinish", a3);
  -[PREditingFontAndContentStylePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_signalDelegateDidFinish
{
  id v3;

  -[PREditingFontAndContentStylePickerViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "fontAndContentStylePickerViewControllerDidFinish:", self);

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

  -[PREditingFontAndContentStylePickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PREditingFontAndContentStylePickerViewController desiredDetent](self, "desiredDetent");
    objc_msgSend(v4, "fontAndContentStylePickerViewController:didUpdateDesiredDetent:", self);
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
  void (**v12)(_QWORD, _QWORD);
  double v13;
  PREditingFontAndContentStylePickerSelectionChange *v14;
  void *v15;
  id v16;

  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self->_titleStyleConfiguration, "timeFontConfiguration", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndContentStylePickerViewController extensionBundleURL](self, "extensionBundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeFontConfigurationWithExtensionBundleURL:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "effectiveFontForRole:ignoringWeight:", self->_role, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pr_variantWeightRange");
  v11 = v10;
  -[PREditingFontAndContentStylePickerViewController changeHandler](self, "changeHandler");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (double)v11 * a4 + (1.0 - a4) * (double)v9;
    v14 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndContentStylePickerSelectionChange setFontWeight:](v14, "setFontWeight:", v15);

    ((void (**)(_QWORD, PREditingFontAndContentStylePickerSelectionChange *))v12)[2](v12, v14);
  }

}

- (void)fontPickerComponentViewController:(id)a3 didSelectItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __CFString *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  id v24;
  PREditingFontAndContentStylePickerSelectionChange *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v6, "fontConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectiveFontForRole:", self->_role);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditorNumberingSystemPickerController setFont:](self->_numberingSystemController, "setFont:", v8);
  -[PREditorNumberingSystemPickerController menu](self->_numberingSystemController, "menu");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setMenu:](self->_numberSystemBarItem, "setMenu:", v9);
  -[PREditingFontAndContentStylePickerViewController changeHandler](self, "changeHandler");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PREditingFontAndContentStylePickerViewController additionalFontConfigurations](self, "additionalFontConfigurations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    objc_msgSend(v6, "fontConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeFontIdentifier");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((v13 & 1) != 0 || v15 == CFSTR("PRTimeFontIdentifierRail"))
    {
      objc_msgSend(v6, "fontConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "weight");
      v20 = v22;

    }
    else
    {
      v16 = objc_msgSend(v8, "pr_variantWeightRange");
      v18 = v17;
      objc_msgSend(v28, "fontWeight");
      v20 = v19 * (double)v18 + (1.0 - v19) * (double)v16;
    }
    if (v13)
      v23 = v8;
    else
      v23 = 0;
    v24 = v23;
    v25 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    -[PREditingFontAndContentStylePickerSelectionChange setTimeFontIdentifier:](v25, "setTimeFontIdentifier:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndContentStylePickerSelectionChange setFontWeight:](v25, "setFontWeight:", v26);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isSystemItem"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndContentStylePickerSelectionChange setSystemItem:](v25, "setSystemItem:", v27);

    -[PREditingFontAndContentStylePickerSelectionChange setCustomFont:](v25, "setCustomFont:", v24);
    ((void (**)(_QWORD, PREditingFontAndContentStylePickerSelectionChange *))v10)[2](v10, v25);

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
  void (**v23)(id, PREditingFontAndContentStylePickerSelectionChange *);
  PREditingFontAndContentStylePickerSelectionChange *v24;
  void *v25;
  void (**v26)(id, PREditingFontAndContentStylePickerSelectionChange *);

  v5 = a4;
  v7 = +[PRIncomingCallMetricsProvider maxVerticalTextLength](PRIncomingCallMetricsProvider, "maxVerticalTextLength", a3, a4, a5);
  if (PRPosterTitleLayoutIsVertical(v5))
  {
    -[PREditingFontAndContentStylePickerViewController titleString](self, "titleString");
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
      -[PREditingFontAndContentStylePickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

      v5 = 0;
    }
  }
  -[PREditingFontAndContentStylePickerViewController titleLayoutPickerController](self, "titleLayoutPickerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSelectedTitleLayout:", v5);

  -[PREditingFontAndContentStylePickerViewController changeHandler](self, "changeHandler");
  v23 = (void (**)(id, PREditingFontAndContentStylePickerSelectionChange *))objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v26 = v23;
    v24 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndContentStylePickerSelectionChange setPreferredTitleLayout:](v24, "setPreferredTitleLayout:", v25);

    v26[2](v26, v24);
    v23 = v26;
  }

}

- (void)numberingSystemPickerController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "displayLocale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndContentStylePickerViewController numberingSystemWasChanged:locale:](self, "numberingSystemWasChanged:locale:", v6, v7);

}

- (void)numberingSystemViewController:(id)a3 didSelectNumberingSystem:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "displayLocale");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingFontAndContentStylePickerViewController numberingSystemWasChanged:locale:](self, "numberingSystemWasChanged:locale:", v6, v7);

}

- (void)numberingSystemWasChanged:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PREditorNumberingSystemPickerController *numberingSystemController;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  PREditingFontAndContentStylePickerSelectionChange *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PREditingFontAndContentStylePickerViewController fontPickerController](self, "fontPickerController");
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
  -[PREditingFontAndContentStylePickerViewController changeHandler](self, "changeHandler");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    -[PREditingFontAndContentStylePickerSelectionChange setNumberingSystem:](v12, "setNumberingSystem:", v13);
    ((void (**)(_QWORD, PREditingFontAndContentStylePickerSelectionChange *))v11)[2](v11, v12);

  }
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
  PREditingFontAndContentStylePickerSelectionChange *v5;
  void *v6;
  void (**v7)(id, PREditingFontAndContentStylePickerSelectionChange *);

  v4 = -[PRTitleAlignmentBarButtonItem toggle](self->_titleAlignmentBarItem, "toggle", a3);
  -[PREditingFontAndContentStylePickerViewController changeHandler](self, "changeHandler");
  v7 = (void (**)(id, PREditingFontAndContentStylePickerSelectionChange *))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingFontAndContentStylePickerSelectionChange setPreferredTitleAlignment:](v5, "setPreferredTitleAlignment:", v6);

    v7[2](v7, v5);
  }

}

- (void)contentStylePickerComponentViewController:(id)a3 didSelectStyle:(id)a4 isSuggestedStyle:(BOOL)a5 userSelected:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  PREditingFontAndContentStylePickerSelectionChange *v11;
  void *v12;
  id v13;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  if (v6)
  {
    v13 = v9;
    -[PREditingFontAndContentStylePickerViewController changeHandler](self, "changeHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc_init(PREditingFontAndContentStylePickerSelectionChange);
      -[PREditingFontAndContentStylePickerSelectionChange setContentStyle:](v11, "setContentStyle:", v13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingFontAndContentStylePickerSelectionChange setSuggestedContentStyle:](v11, "setSuggestedContentStyle:", v12);

      ((void (**)(_QWORD, PREditingFontAndContentStylePickerSelectionChange *))v10)[2](v10, v11);
    }

    v9 = v13;
  }

}

- (void)contentStylePickerComponentViewControllerDidChangeHeight:(id)a3
{
  id v4;

  -[PREditingFontAndContentStylePickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PREditingFontAndContentStylePickerViewController desiredDetent](self, "desiredDetent");
    objc_msgSend(v4, "fontAndContentStylePickerViewController:didUpdateDesiredDetent:", self);
  }

}

- (id)contentStylePickerComponentViewController:(id)a3 coordinatorForStyle:(id)a4 isSuggested:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  -[PREditingFontAndContentStylePickerViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "fontAndContentStylePickerViewController:coordinatorForStyle:isSuggested:", self, v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)components
{
  return self->_components;
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_titleStyleConfiguration, a3);
}

- (PREditorContentStylePickerConfiguration)contentStylePickerConfiguration
{
  return self->_contentStylePickerConfiguration;
}

- (void)setContentStylePickerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contentStylePickerConfiguration, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (PREditingFontAndContentStylePickerViewControllerDelegate)delegate
{
  return (PREditingFontAndContentStylePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSString)role
{
  return self->_role;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
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

- (PREditingContentStylePickerComponentViewController)contentStylePickerController
{
  return self->_contentStylePickerController;
}

- (void)setContentStylePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_contentStylePickerController, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFontConfigurations, 0);
  objc_storeStrong((id *)&self->_numberingSystemViewController, 0);
  objc_storeStrong((id *)&self->_contentStylePickerController, 0);
  objc_storeStrong((id *)&self->_titleLayoutPickerController, 0);
  objc_storeStrong((id *)&self->_fontPickerController, 0);
  objc_storeStrong((id *)&self->_titleAlignmentBarItem, 0);
  objc_storeStrong((id *)&self->_numberingSystemController, 0);
  objc_storeStrong((id *)&self->_numberSystemBarItem, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_extensionBundleURL, 0);
  objc_storeStrong((id *)&self->_contentStylePickerConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
}

@end
