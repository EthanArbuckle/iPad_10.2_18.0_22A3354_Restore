@implementation DBSLargeTextSliderListController

- (id)initUsingExtendedRange:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DBSLargeTextSliderListController;
  result = -[DBSLargeTextSliderListController init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 1386) = a3;
  return result;
}

- (void)loadView
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DBSLargeTextSliderListController;
  -[DBSLargeTextSliderListController loadView](&v13, sel_loadView);
  v3 = (void *)objc_opt_new();
  -[DBSLargeTextSliderListController setAppearanceProvider:](self, "setAppearanceProvider:", v3);

  v4 = objc_alloc(MEMORY[0x24BDBCE30]);
  v5 = *MEMORY[0x24BEBE090];
  v6 = (void *)objc_msgSend(v4, "initWithObjects:", *MEMORY[0x24BEBE0A8], *MEMORY[0x24BEBE0D0], *MEMORY[0x24BEBE0C0], *MEMORY[0x24BEBE0B8], *MEMORY[0x24BEBE0A0], *MEMORY[0x24BEBE098], *MEMORY[0x24BEBE090], *MEMORY[0x24BEBE078], *MEMORY[0x24BEBE070], *MEMORY[0x24BEBE068], *MEMORY[0x24BEBE060], *MEMORY[0x24BEBE058], 0);
  -[DBSLargeTextSliderListController setContentSizeCategories:](self, "setContentSizeCategories:", v6);

  -[DBSLargeTextSliderListController updateSliderValue](self, "updateSliderValue");
  -[DBSLargeTextSliderListController contentSizeCategories](self, "contentSizeCategories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v5);

  v9 = !-[DBSLargeTextSliderListController showsExtendedRangeSwitch](self, "showsExtendedRangeSwitch")
    && !-[DBSLargeTextSliderListController usesExtendedRange](self, "usesExtendedRange")
    && -[DBSLargeTextSliderListController selectedCategoryIndex](self, "selectedCategoryIndex") == v8;
  -[DBSLargeTextSliderListController setShowsLargerSizesHelpText:](self, "setShowsLargerSizesHelpText:", v9);
  -[DBSLargeTextSliderListController table](self, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScrollEnabled:", 0);

  -[DBSLargeTextSliderListController table](self, "table");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setTopPadding:", 0.0);

  -[DBSLargeTextSliderListController table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setDisableReuseQueuePurgeOnTextSizeChanges:", 1);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DBSLargeTextSliderListController;
  -[DBSLargeTextSliderListController viewSafeAreaInsetsDidChange](&v11, sel_viewSafeAreaInsetsDidChange);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "sf_isiPhone") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[DBSLargeTextSliderListController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;

  if (v6 <= 0.0)
  {
LABEL_5:
    -[DBSLargeTextSliderListController table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setBottomPadding:", 0.0);
    goto LABEL_6;
  }
  -[DBSLargeTextSliderListController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;
  -[DBSLargeTextSliderListController table](self, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setBottomPadding:", v9);

LABEL_6:
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextSliderListController;
  -[DBSLargeTextSliderListController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  self->_viewIsDisappearing = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)DBSLargeTextSliderListController;
  -[DBSLargeTextSliderListController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display/TEXT_SIZE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("DISPLAY_AND_BRIGHTNESS"), 0, CFSTR("Display"), v6, v8);

    v10 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("TEXT_SIZE"), 0, CFSTR("Display"), v11, v13);

    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSLargeTextSliderListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v14, v15, v4);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextSliderListController;
  -[DBSLargeTextSliderListController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_viewIsDisappearing = 1;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  PSSpecifier *v6;
  PSSpecifier *sliderGroupSpecifier;
  _BOOL4 v8;
  PSSpecifier *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _BOOL4 showsResetSliderButton;
  PSSpecifier *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!self->_sliderGroupSpecifier)
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    sliderGroupSpecifier = self->_sliderGroupSpecifier;
    self->_sliderGroupSpecifier = v6;

  }
  v8 = -[DBSLargeTextSliderListController showsLargerSizesHelpText](self, "showsLargerSizesHelpText");
  v9 = self->_sliderGroupSpecifier;
  if (v8)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v11, *MEMORY[0x24BE75AA0]);

  }
  else
  {
    -[PSSpecifier removePropertyForKey:](self->_sliderGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75AA0]);
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "sf_isiPhone") & 1) != 0)
  {

  }
  else
  {
    showsResetSliderButton = self->_showsResetSliderButton;

    if (!showsResetSliderButton)
    {
      v14 = self->_sliderGroupSpecifier;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setProperty:forKey:](v14, "setProperty:forKey:", v16, *MEMORY[0x24BE75A30]);

      goto LABEL_12;
    }
  }
  -[PSSpecifier removePropertyForKey:](self->_sliderGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75A30]);
LABEL_12:
  objc_msgSend(v5, "addObject:", self->_sliderGroupSpecifier);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setDynamicTypeValue_forSpecifier_, sel_getDynamicTypeValueForSpecifier_, 0, 5, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIdentifier:", CFSTR("DYNAMIC_TYPE_SLIDER"));
  objc_msgSend(v17, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v18 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v17, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C80]);
  objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75C88]);
  objc_msgSend(v17, "setProperty:forKey:", &unk_24F02FA20, *MEMORY[0x24BE759B0]);
  objc_msgSend(v17, "setProperty:forKey:", &unk_24F02FC08, *MEMORY[0x24BE75D10]);
  -[DBSLargeTextSliderListController contentSizeCategories](self, "contentSizeCategories");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[DBSLargeTextSliderListController usesExtendedRange](self, "usesExtendedRange");
  v21 = (_QWORD *)MEMORY[0x24BEBE058];
  if (!v20)
    v21 = (_QWORD *)MEMORY[0x24BEBE090];
  v22 = objc_msgSend(v19, "indexOfObject:", *v21);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProperty:forKey:", v23, *MEMORY[0x24BE759A8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DBSLargeTextSliderListController usesExtendedRange](self, "usesExtendedRange"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProperty:forKey:", v24, CFSTR("largeTextUsesExtendedRange"));

  objc_msgSend(v5, "addObject:", v17);
  if (self->_showsResetSliderButton)
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);
    v26 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForLargeFontSettings(CFSTR("RESET_BUTTON_TEXT"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, 0, 13, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setButtonAction:", sel_resetSliderValue);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_24F02FA38, *MEMORY[0x24BE75860]);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v5, "addObject:", v28);

  }
  v29 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

- (void)setSelectedCategoryIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  id v7;

  if (!-[DBSLargeTextSliderListController usesExtendedRange](self, "usesExtendedRange"))
  {
    -[DBSLargeTextSliderListController contentSizeCategories](self, "contentSizeCategories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", *MEMORY[0x24BEBE090]);

    if (v6 < a3)
      a3 = v6;
  }
  self->_selectedCategoryIndex = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSLargeTextSliderListController setDynamicTypeValue:forSpecifier:](self, "setDynamicTypeValue:forSpecifier:", v7, 0);

}

- (void)setUsesExtendedRange:(BOOL)a3
{
  self->_usesExtendedRange = a3;
}

- (void)setDynamicTypeValue:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  _BOOL8 v13;
  _BOOL4 v14;
  PSSpecifier *sliderGroupSpecifier;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  DBSLargeTextSliderListController *v20;

  v6 = a3;
  v7 = a4;
  if (!self->_viewIsDisappearing)
  {
    v8 = objc_msgSend(v6, "integerValue");
    if (v8 != -[DBSLargeTextSliderListController selectedCategoryIndex](self, "selectedCategoryIndex")
      || !v7 && *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    {
      -[DBSLargeTextSliderListController contentSizeCategories](self, "contentSizeCategories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", *MEMORY[0x24BEBE090]);

      v11 = -[DBSLargeTextSliderListController showsLargerSizesHelpText](self, "showsLargerSizesHelpText");
      self->_selectedCategoryIndex = objc_msgSend(v6, "integerValue");
      -[DBSLargeTextSliderListController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsLayout");

      v13 = !-[DBSLargeTextSliderListController showsExtendedRangeSwitch](self, "showsExtendedRangeSwitch")
         && !-[DBSLargeTextSliderListController usesExtendedRange](self, "usesExtendedRange")
         && -[DBSLargeTextSliderListController selectedCategoryIndex](self, "selectedCategoryIndex") == v10;
      -[DBSLargeTextSliderListController setShowsLargerSizesHelpText:](self, "setShowsLargerSizesHelpText:", v13);
      if (v11 != -[DBSLargeTextSliderListController showsLargerSizesHelpText](self, "showsLargerSizesHelpText"))
      {
        v14 = -[DBSLargeTextSliderListController showsLargerSizesHelpText](self, "showsLargerSizesHelpText");
        sliderGroupSpecifier = self->_sliderGroupSpecifier;
        if (v14)
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSpecifier setProperty:forKey:](sliderGroupSpecifier, "setProperty:forKey:", v17, *MEMORY[0x24BE75AA0]);

        }
        else
        {
          -[PSSpecifier removePropertyForKey:](self->_sliderGroupSpecifier, "removePropertyForKey:", *MEMORY[0x24BE75AA0]);
        }
      }
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __69__DBSLargeTextSliderListController_setDynamicTypeValue_forSpecifier___block_invoke;
      v18[3] = &unk_24F025DA8;
      v19 = v7;
      v20 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v18);

    }
  }

}

void __69__DBSLargeTextSliderListController_setDynamicTypeValue_forSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32)
    || (objc_msgSend(*(id *)(a1 + 40), "largeTextController"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "savesCategoryNameOnlyOnSliderEvent"),
        v2,
        (v3 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "contentSizeCategories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "selectedCategoryIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "largeTextController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "savePreferredContentSizeCategoryName:", v5);

  }
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_6);
}

void __69__DBSLargeTextSliderListController_setDynamicTypeValue_forSpecifier___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("DidPostContentSizeChanged"), 0);

}

- (id)getDynamicTypeValueForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[DBSLargeTextSliderListController largeTextController](self, "largeTextController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readPreferredContentSizeCategoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  if (v5)
  {
    -[DBSLargeTextSliderListController contentSizeCategories](self, "contentSizeCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "indexOfObject:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DBSLargeTextSliderListController selectedCategoryIndex](self, "selectedCategoryIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)updateSliderValue
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[DBSLargeTextSliderListController largeTextController](self, "largeTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readPreferredContentSizeCategoryName");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[DBSLargeTextSliderListController contentSizeCategories](self, "contentSizeCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v5 = v6;
  else
    v5 = (id)*MEMORY[0x24BEBE0B8];
  -[DBSLargeTextSliderListController setSelectedCategoryIndex:](self, "setSelectedCategoryIndex:", objc_msgSend(v4, "indexOfObject:", v5));

}

- (void)resetSliderValue
{
  void *v3;

  -[DBSLargeTextSliderListController largeTextController](self, "largeTextController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetContentSizeCategoryName");

  -[DBSLargeTextSliderListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (NSArray)contentSizeCategories
{
  return self->_contentSizeCategories;
}

- (void)setContentSizeCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (int64_t)selectedCategoryIndex
{
  return self->_selectedCategoryIndex;
}

- (BOOL)showsExtendedRangeSwitch
{
  return self->_showsExtendedRangeSwitch;
}

- (void)setShowsExtendedRangeSwitch:(BOOL)a3
{
  self->_showsExtendedRangeSwitch = a3;
}

- (BOOL)usesExtendedRange
{
  return self->_usesExtendedRange;
}

- (BOOL)showsLargerSizesHelpText
{
  return self->_showsLargerSizesHelpText;
}

- (void)setShowsLargerSizesHelpText:(BOOL)a3
{
  self->_showsLargerSizesHelpText = a3;
}

- (BOOL)showsResetSliderButton
{
  return self->_showsResetSliderButton;
}

- (void)setShowsResetSliderButton:(BOOL)a3
{
  self->_showsResetSliderButton = a3;
}

- (DBSLargeTextController)largeTextController
{
  return (DBSLargeTextController *)objc_loadWeakRetained((id *)&self->_largeTextController);
}

- (void)setLargeTextController:(id)a3
{
  objc_storeWeak((id *)&self->_largeTextController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_largeTextController);
  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
  objc_storeStrong((id *)&self->_sliderGroupSpecifier, 0);
}

@end
