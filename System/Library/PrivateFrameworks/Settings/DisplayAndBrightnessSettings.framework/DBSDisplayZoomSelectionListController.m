@implementation DBSDisplayZoomSelectionListController

- (void)viewDidLoad
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DBSDisplayZoomSelectionListController;
  -[DBSDisplayZoomSelectionListController viewDidLoad](&v16, sel_viewDidLoad);
  if (DBSReverseZoomEnabled())
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sf_isiPad");

    if (v4)
    {
      -[DBSDisplayZoomSelectionListController table](self, "table");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setTopPadding:", 0.0);

      -[DBSDisplayZoomSelectionListController table](self, "table");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setBottomPadding:", 0.0);

      -[DBSDisplayZoomSelectionListController table](self, "table");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBounces:", 0);

    }
  }
  v8 = objc_alloc(MEMORY[0x24BEBD410]);
  DBS_LocalizedStringForMagnify(CFSTR("DONE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, self, sel_userDidTapDone_);
  -[DBSDisplayZoomSelectionListController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v12, "sf_isiPad");

  if ((_DWORD)v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_userDidTapCancel_);
    -[DBSDisplayZoomSelectionListController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  }
  -[DBSDisplayZoomSelectionListController updateNavigationButtonStateWithCurrentState](self, "updateNavigationButtonStateWithCurrentState");
  DBS_LocalizedStringForMagnify(CFSTR("DISPLAY_ZOOM"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomSelectionListController setTitle:](self, "setTitle:", v15);

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
  v16.super_class = (Class)DBSDisplayZoomSelectionListController;
  -[DBSDisplayZoomSelectionListController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display/MAGNIFY"));
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
    v14 = (void *)objc_msgSend(v10, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("DISPLAY_ZOOM"), 0, CFSTR("Magnify"), v11, v13);

    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayZoomSelectionListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v14, v15, v4);

  }
}

- (void)updateNavigationButtonStateWithCurrentState
{
  void *v3;
  id v4;

  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDisplayZoomMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSDisplayZoomSelectionListController _updateNavigationButtonStateWithNewOption:](self, "_updateNavigationButtonStateWithNewOption:", objc_msgSend(v3, "displayZoomOption"));

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((DBSReverseZoomEnabled() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIdentifier:", CFSTR("DISPLAY_ZOOM_SECTION"));
      DBS_LocalizedStringForMagnify(CFSTR("DISPLAY_ZOOM"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setName:", v7);

      objc_msgSend(v5, "addObject:", v6);
    }
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", CFSTR("DISPLAY_ZOOM_SELECTION"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v5, "addObject:", v8);
    v9 = (objc_class *)objc_msgSend(v5, "copy");
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DBSDisplayZoomSelectionListController;
  -[DBSDisplayZoomSelectionListController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "setSelectionStyle:", 0);
    objc_msgSend(v5, "configureView");
  }
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel_startAnimation, 0, 2.0);

}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel_stopAnimation, 0, 0.0);

}

- (CGSize)preferredContentSize
{
  void *v2;
  char v3;
  double v4;
  double v5;
  CGSize result;

  if (DBSReverseZoomEnabled()
    && (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "sf_isiPad"),
        v2,
        (v3 & 1) != 0))
  {
    v4 = 262.0;
    v5 = 600.0;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (id)confirmationDictForCurrentSelectedScale
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DBS_LocalizedStringForMagnify(CFSTR("CONFIRMATION_PROMPT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BE75988]);

  DBS_LocalizedStringForMagnify(CFSTR("CONFIRMATION_CANCEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BE75970]);

  v6 = -[DBSDisplayZoomSelectionListController selectedDisplayZoomOption](self, "selectedDisplayZoomOption");
  if (v6 <= 3)
  {
    v7 = off_24F0262A8[v6];
    DBS_LocalizedStringForMagnify(off_24F026288[v6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x24BE75990]);

    DBS_LocalizedStringForMagnify(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BE75980]);

  }
  return v3;
}

- (void)userDidTapDone:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x24BE754D0]);
  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDisplayZoomMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "displayZoomOption");

  if (-[DBSDisplayZoomSelectionListController selectedDisplayZoomOption](self, "selectedDisplayZoomOption") == v6)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sf_isiPad");

    -[DBSDisplayZoomSelectionListController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      v12 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);
  }
  else
  {
    -[DBSDisplayZoomSelectionListController confirmationDictForCurrentSelectedScale](self, "confirmationDictForCurrentSelectedScale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupWithDictionary:", v10);
    objc_msgSend(v13, "setTarget:", self);
    objc_msgSend(v13, "setConfirmationAction:", sel__userDidConfirmDisplayZoomModeWithSpecifier_);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSDisplayZoomSelectionListController showConfirmationViewForSpecifier:useAlert:](self, "showConfirmationViewForSpecifier:useAlert:", v13, objc_msgSend(v11, "sf_isiPad"));

  }
}

- (void)userDidTapCancel:(id)a3
{
  id v3;

  -[DBSDisplayZoomSelectionListController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_updateNavigationButtonStateWithNewOption:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDisplayZoomMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayZoomOption");

  -[DBSDisplayZoomSelectionListController setSelectedDisplayZoomOption:](self, "setSelectedDisplayZoomOption:", a3);
}

- (void)_userDidConfirmDisplayZoomModeWithSpecifier:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[DBSDisplayZoomSelectionListController selectedDisplayZoomOption](self, "selectedDisplayZoomOption", a3);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("display-zoom-change-%@"), v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE04758], "sharedAggregateDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addValue:forKey:", 1, v13);

  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayZoomModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DBSStringForDisplayZoomOption(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=DISPLAY&path=MAGNIFY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayZoomMode:withRelaunchURL:", v10, v12);

}

- (void)displayZoomTableViewCell:(id)a3 userDidTapOnDisplayZoomOption:(unint64_t)a4
{
  -[DBSDisplayZoomSelectionListController _updateNavigationButtonStateWithNewOption:](self, "_updateNavigationButtonStateWithNewOption:", a4);
}

- (id)supportedDisplayZoomOptions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayZoomModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__DBSDisplayZoomSelectionListController_supportedDisplayZoomOptions__block_invoke;
  v7[3] = &unk_24F026240;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __68__DBSDisplayZoomSelectionListController_supportedDisplayZoomOptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a3, "displayZoomOption"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (DBSDisplayZoomSelectionControllerDelegate)delegate
{
  return (DBSDisplayZoomSelectionControllerDelegate *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (unint64_t)selectedDisplayZoomOption
{
  return self->_selectedDisplayZoomOption;
}

- (void)setSelectedDisplayZoomOption:(unint64_t)a3
{
  self->_selectedDisplayZoomOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
