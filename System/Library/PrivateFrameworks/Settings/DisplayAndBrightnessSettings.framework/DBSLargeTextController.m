@implementation DBSLargeTextController

- (DBSLargeTextController)init
{
  DBSLargeTextController *v2;
  uint64_t v3;
  DBSLargeTextSliderListController *sliderListController;
  uint64_t v5;
  DBSLargeTextSliderListController *extendedRangeSliderListController;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DBSLargeTextController;
  v2 = -[DBSLargeTextController init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    sliderListController = v2->_sliderListController;
    v2->_sliderListController = (DBSLargeTextSliderListController *)v3;

    -[DBSLargeTextSliderListController setUsesExtendedRange:](v2->_sliderListController, "setUsesExtendedRange:", 0);
    -[DBSLargeTextSliderListController setShowsResetSliderButton:](v2->_sliderListController, "setShowsResetSliderButton:", v2->_showsResetSliderButton);
    -[DBSLargeTextSliderListController setLargeTextController:](v2->_sliderListController, "setLargeTextController:", v2);
    v5 = objc_opt_new();
    extendedRangeSliderListController = v2->_extendedRangeSliderListController;
    v2->_extendedRangeSliderListController = (DBSLargeTextSliderListController *)v5;

    -[DBSLargeTextSliderListController setUsesExtendedRange:](v2->_extendedRangeSliderListController, "setUsesExtendedRange:", 1);
    -[DBSLargeTextSliderListController setShowsResetSliderButton:](v2->_extendedRangeSliderListController, "setShowsResetSliderButton:", v2->_showsResetSliderButton);
    -[DBSLargeTextSliderListController setLargeTextController:](v2->_extendedRangeSliderListController, "setLargeTextController:", v2);
    v7 = -[DBSLargeTextController readUsesExtendedRange](v2, "readUsesExtendedRange");
    v2->_usesExtendedRange = v7;
    if (v7)
      v8 = 1384;
    else
      v8 = 1376;
    v9 = *(id *)((char *)&v2->super.super.super.super.super.isa + v8);
    -[DBSLargeTextController addChildViewController:](v2, "addChildViewController:", v9);
    -[DBSLargeTextController view](v2, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    objc_msgSend(v9, "didMoveToParentViewController:", v2);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v12, "sf_isiPhone");

    if ((v11 & 1) == 0)
      objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setClipsToBounds:", 1);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextController;
  -[DBSLargeTextController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DBSLargeTextController;
  -[DBSLargeTextController loadView](&v4, sel_loadView);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_sizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

}

- (void)viewDidLayoutSubviews
{
  int *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double MaxY;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double MinY;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  int v54;
  void *v55;
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v56.receiver = self;
  v56.super_class = (Class)DBSLargeTextController;
  -[DBSLargeTextController viewDidLayoutSubviews](&v56, sel_viewDidLayoutSubviews);
  if (self->_usesExtendedRange)
    v3 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v3 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  v4 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  objc_msgSend(v4, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "sf_isiPhone");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentSize");
    v11 = v10;
    v13 = v12;

    v14 = -[DBSLargeTextController interfaceOrientation](self, "interfaceOrientation");
    objc_msgSend(v4, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_bottomPadding");
    v17 = v16;

    v18 = v7;
    if (self->_showsResetSliderButton)
    {
      objc_msgSend(v4, "table");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "numberOfSections");

      if (v20 == 2)
      {
        objc_msgSend(v4, "table");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "cellForRowAtIndexPath:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v23;
      }
    }
    if (v18)
    {
      if (v17 <= 0.0 && (unint64_t)(v14 - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {
        objc_msgSend(v18, "frame");
        MaxY = CGRectGetMaxY(v57);
        objc_msgSend(v4, "table");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "frame");
        v13 = MaxY - CGRectGetMinY(v58);

      }
    }
  }
  else
  {
    -[DBSLargeTextController table](self, "table");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v11 = v28;
    v30 = v29;

    v13 = v30 * 0.55;
    if (!objc_msgSend(v4, "showsLargerSizesHelpText"))
      goto LABEL_18;
    objc_msgSend(v7, "frame");
    MinY = CGRectGetMinY(v59);
    objc_msgSend(v4, "table");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v13 = v13 + MinY - CGRectGetMinY(v60);
  }

LABEL_18:
  objc_msgSend(v4, "table");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;
  v36 = v35;

  objc_msgSend(v4, "table");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v34, v36, v11, v13);

  objc_msgSend(v4, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");

  -[DBSLargeTextController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  CGRectGetHeight(v61);
  PSRoundToPixel();
  v41 = v40;

  objc_msgSend(v4, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", 0.0, v41, v11, v13);

  -[DBSLargeTextController table](self, "table");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "frame");
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  v52 = v51 - v13;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "sf_isiPhone");

  if (!v54)
    v52 = v52 + -20.0;
  -[DBSLargeTextController table](self, "table");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v45, v47, v49, v52);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sf_isiPhone");

    if (v8)
      objc_msgSend(v6, "setProperty:forKey:", CFSTR("DBSLargeTextExplanationView"), *MEMORY[0x24BE75A30]);
    objc_msgSend(v5, "addObject:", v6);
    if (self->_showsExtendedRangeSwitch)
    {
      v9 = (void *)MEMORY[0x24BE75590];
      DBS_LocalizedStringForLargeFontSettings(CFSTR("LARGER_DYNAMIC_TYPE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, sel_setUsesExtendedRange_forSpecifier_, sel_usesExtendedRangeForSpecifier_, 0, 6, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setIdentifier:", CFSTR("LARGER_DYNAMIC_TYPE_SWITCH"));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      objc_msgSend(v5, "addObject:", v11);

    }
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)sizeCategoryDidChange:(id)a3
{
  int *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (self->_usesExtendedRange)
    v4 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v4 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  v5 = *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
  objc_msgSend(v5, "contentSizeCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "selectedCategoryIndex");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[DBSAnalytics logTextSizeEvent:](DBSAnalytics, "logTextSizeEvent:", v9);
  -[DBSLargeTextController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)setShowsExtendedRangeSwitch:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_showsExtendedRangeSwitch = a3;
  -[DBSLargeTextSliderListController setShowsExtendedRangeSwitch:](self->_sliderListController, "setShowsExtendedRangeSwitch:");
  -[DBSLargeTextSliderListController setShowsExtendedRangeSwitch:](self->_extendedRangeSliderListController, "setShowsExtendedRangeSwitch:", v3);
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
    -[DBSLargeTextController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)setUsesExtendedRange:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  if (self->_usesExtendedRange != (_DWORD)v5)
  {
    v6 = v5;
    -[DBSLargeTextController updateSlidersForNewUsesExtendedRangeValue:](self, "updateSlidersForNewUsesExtendedRangeValue:", v5);
    -[DBSLargeTextController saveUsesExtendedRange:](self, "saveUsesExtendedRange:", v6);
  }
}

- (void)updateSlidersForNewUsesExtendedRangeValue:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  void *v6;
  int *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v3 = a3;
  if (self->_usesExtendedRange)
    v5 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v5 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  v22 = *(id *)((char *)&self->super.super.super.super.super.isa + *v5);
  objc_msgSend(v22, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(v22, "removeFromParentViewController");
  objc_msgSend(v22, "didMoveToParentViewController:", 0);
  if (v3)
    v7 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v7 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v7);
  -[DBSLargeTextController addChildViewController:](self, "addChildViewController:", v8);
  -[DBSLargeTextController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(v8, "didMoveToParentViewController:", self);
  objc_msgSend(v8, "setSelectedCategoryIndex:", objc_msgSend(v22, "selectedCategoryIndex"));
  objc_msgSend(v22, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v8, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  -[DBSLargeTextController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNeedsLayout");

  self->_usesExtendedRange = v3;
}

- (id)usesExtendedRangeForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_usesExtendedRange);
}

- (void)setShowsResetSliderButton:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  self->_showsResetSliderButton = a3;
  -[DBSLargeTextSliderListController setShowsResetSliderButton:](self->_sliderListController, "setShowsResetSliderButton:");
  -[DBSLargeTextSliderListController setShowsResetSliderButton:](self->_extendedRangeSliderListController, "setShowsResetSliderButton:", v3);
  if (self->_usesExtendedRange)
    v5 = 1384;
  else
    v5 = 1376;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "reloadSpecifiers");
}

- (void)updateSlider
{
  _BOOL8 v3;
  _BOOL4 usesExtendedRange;
  int *v5;

  v3 = -[DBSLargeTextController readUsesExtendedRange](self, "readUsesExtendedRange");
  usesExtendedRange = self->_usesExtendedRange;
  if (usesExtendedRange != v3)
  {
    -[DBSLargeTextController updateSlidersForNewUsesExtendedRangeValue:](self, "updateSlidersForNewUsesExtendedRangeValue:", v3);
    usesExtendedRange = self->_usesExtendedRange;
  }
  if (usesExtendedRange)
    v5 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v5 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "updateSliderValue");
}

- (id)readPreferredContentSizeCategoryName
{
  const __CFString *v3;
  void *v4;
  int *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = (const __CFString *)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.UIKit"));
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("UIPreferredContentSizeCategoryName"), v3);
  if (self->_usesExtendedRange)
    v5 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v5 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "contentSizeCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
    v8 = v4;
  else
    v8 = (void *)*MEMORY[0x24BEBE0B8];
  v9 = v8;

  return v9;
}

- (void)savePreferredContentSizeCategoryName:(id)a3
{
  int *v4;
  void *v5;
  int v6;
  const void *v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v11;

  v11 = a3;
  if (self->_usesExtendedRange)
    v4 = &OBJC_IVAR___DBSLargeTextController__extendedRangeSliderListController;
  else
    v4 = &OBJC_IVAR___DBSLargeTextController__sliderListController;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v4), "contentSizeCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v11);

  if (v6)
    v7 = v11;
  else
    v7 = (const void *)*MEMORY[0x24BEBE0B8];
  v8 = (const __CFString *)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.UIKit"));
  CFPreferencesSetAppValue(CFSTR("UIPreferredContentSizeCategoryName"), v7, v8);
  v9 = (const __CFString *)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.UIKit"));
  CFPreferencesAppSynchronize(v9);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("ApplePreferredContentSizeCategoryChangedNotification"), 0, 0, 1u);

}

- (BOOL)readUsesExtendedRange
{
  return CFPreferencesGetAppBooleanValue(CFSTR("largeTextUsesExtendedRange"), CFSTR("com.apple.preferences-framework"), 0) != 0;
}

- (void)saveUsesExtendedRange:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("largeTextUsesExtendedRange"), *v3, CFSTR("com.apple.preferences-framework"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.preferences-framework"));
}

- (BOOL)showsExtendedRangeSwitch
{
  return self->_showsExtendedRangeSwitch;
}

- (BOOL)showsResetSliderButton
{
  return self->_showsResetSliderButton;
}

- (BOOL)savesCategoryNameOnlyOnSliderEvent
{
  return self->_savesCategoryNameOnlyOnSliderEvent;
}

- (void)setSavesCategoryNameOnlyOnSliderEvent:(BOOL)a3
{
  self->_savesCategoryNameOnlyOnSliderEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedRangeSliderListController, 0);
  objc_storeStrong((id *)&self->_sliderListController, 0);
}

@end
