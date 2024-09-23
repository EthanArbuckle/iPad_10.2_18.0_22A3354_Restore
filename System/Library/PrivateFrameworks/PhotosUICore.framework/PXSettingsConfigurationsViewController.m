@implementation PXSettingsConfigurationsViewController

- (PXSettingsConfigurationsViewController)initWithStyle:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 47, CFSTR("%s is not available as initializer"), "-[PXSettingsConfigurationsViewController initWithStyle:]");

  abort();
}

- (PXSettingsConfigurationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 51, CFSTR("%s is not available as initializer"), "-[PXSettingsConfigurationsViewController initWithNibName:bundle:]");

  abort();
}

- (PXSettingsConfigurationsViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 55, CFSTR("%s is not available as initializer"), "-[PXSettingsConfigurationsViewController initWithCoder:]");

  abort();
}

- (PXSettingsConfigurationsViewController)initWithSettings:(id)a3
{
  id v5;
  PXSettingsConfigurationsViewController *v6;
  PXSettingsConfigurationsViewController *v7;
  PXSettingsConfigurationsSource *v8;
  PXSettingsConfigurationsSource *source;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSettingsConfigurationsViewController;
  v6 = -[PXSettingsConfigurationsViewController initWithStyle:](&v11, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = objc_alloc_init(PXSettingsConfigurationsSource);
    source = v7->_source;
    v7->_source = v8;

    -[PXSettingsConfigurationsSource setObserver:](v7->_source, "setObserver:", v7);
    -[PXSettingsConfigurationsViewController setTitle:](v7, "setTitle:", CFSTR("Configurations"));
    -[PXSettingsConfigurationsViewController _updateAvailableActions](v7, "_updateAvailableActions");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSettingsConfigurationsViewController;
  -[PXSettingsConfigurationsViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PXSettingsConfigurationsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDone_);
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (void)_handleDone:(id)a3
{
  -[PXSettingsConfigurationsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_updateAvailableActions
{
  id v3;

  -[PXSettingsConfigurationsViewController source](self, "source");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfigurationsViewController setAreAllActionsAvailable:](self, "setAreAllActionsAvailable:", objc_msgSend(v3, "numberOfConfigurations") > 0);

}

- (void)setAreAllActionsAvailable:(BOOL)a3
{
  id v5;
  uint64_t i;
  void *v7;
  id v8;

  if (self->_areAllActionsAvailable != a3)
  {
    self->_areAllActionsAvailable = a3;
    if (-[PXSettingsConfigurationsViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[PXSettingsConfigurationsViewController tableView](self, "tableView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = 2; i != 4; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

      }
      if (a3)
        objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", v5, 100);
      else
        objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v5, 100);

    }
  }
}

- (void)_promptNameWithAlertTitle:(id)a3 message:(id)a4 proposedNamed:(id)a5 confirmationButtonTitle:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  PXSettingsConfigurationsViewController *v34;

  v12 = a5;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0DC3450];
  v15 = a6;
  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke;
  v32[3] = &unk_1E51322C0;
  v33 = v12;
  v34 = self;
  v18 = v12;
  objc_msgSend(v16, "addTextFieldWithConfigurationHandler:", v32);
  objc_msgSend(v16, "textFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfigurationsViewController setPromptTextField:](self, "setPromptTextField:", v20);

  v21 = (void *)MEMORY[0x1E0DC3448];
  v30[0] = v17;
  v30[1] = 3221225472;
  v30[2] = __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_2;
  v30[3] = &unk_1E5138AE0;
  v22 = v13;
  v30[4] = self;
  v31 = v22;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v15, 0, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSettingsConfigurationsViewController setPromptConfirmAction:](self, "setPromptConfirmAction:", v23);
  -[PXSettingsConfigurationsViewController promptConfirmAction](self, "promptConfirmAction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v24);

  v25 = (void *)MEMORY[0x1E0DC3448];
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_3;
  v28[3] = &unk_1E5142658;
  v29 = v22;
  v26 = v22;
  objc_msgSend(v25, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v27);

  -[PXSettingsConfigurationsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
}

- (void)_promptedNameDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  -[PXSettingsConfigurationsViewController promptTextField](self, "promptTextField", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;
  -[PXSettingsConfigurationsViewController promptConfirmAction](self, "promptConfirmAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (id)_titleForSettings:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "settingsControllerModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_untitledName
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;

  -[PXSettingsConfigurationsViewController source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "numberOfConfigurations") >= 1)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "configurationAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 < objc_msgSend(v2, "numberOfConfigurations"));
  }
  v7 = CFSTR("Untitled");
  if (objc_msgSend(v3, "containsObject:", CFSTR("Untitled")))
  {
    v8 = CFSTR("Untitled");
    v9 = 2;
    do
    {
      v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Untitled %li"), v9);

      ++v9;
      v8 = v7;
    }
    while ((objc_msgSend(v3, "containsObject:", v7) & 1) != 0);
  }

  return v7;
}

- (void)_shareConfigurations:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[PXSettingsConfiguration sharableStringForConfigurations:](PXSettingsConfiguration, "sharableStringForConfigurations:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D96D28]);
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  -[PXSettingsConfigurationsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  -[PXSettingsConfigurationsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v8, "safeAreaInsets");
  v16 = v15;
  objc_msgSend(v7, "popoverPresentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceView:", v8);

  objc_msgSend(v7, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceRect:", v10, v12, v14, v16);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7;
  void *v8;
  int64_t v9;
  void *v11;

  v7 = a3;
  if (a4 == 1)
  {
    if (-[PXSettingsConfigurationsViewController areAllActionsAvailable](self, "areAllActionsAvailable"))
      v9 = 4;
    else
      v9 = 2;
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 173, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXSettingsConfigurationsViewController source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfConfigurations");

  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 1)
  {
    v15 = objc_msgSend(v7, "item");
    if (v15 <= 3)
    {
      v13 = 0;
      v14 = 0;
      v11 = off_1E5132398[v15];
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    -[PXSettingsConfigurationsViewController source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationAtIndex:", objc_msgSend(v7, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "name");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsConfigurationsViewController _titleForSettings:](self, "_titleForSettings:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 4;
    goto LABEL_7;
  }
  v13 = 0;
  v14 = 0;
  v11 = 0;
LABEL_7:
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("cellReuseIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("cellReuseIdentifier"));
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v17);

  }
  objc_msgSend(v16, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v11);

  objc_msgSend(v16, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v13);

  objc_msgSend(v16, "setAccessoryType:", v14);
  return v16;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a3;
  v8 = a5;
  v9 = objc_msgSend(v8, "section");
  if (v9)
  {
    if (v9 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 228, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  else
  {
    -[PXSettingsConfigurationsViewController source](self, "source", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__PXSettingsConfigurationsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v13[3] = &unk_1E51322E8;
    v14 = v8;
    objc_msgSend(v11, "performChanges:", v13);

  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "section");
  if (v9)
  {
    if (v9 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 242, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  PXSettingsConfigurationsViewController *v39;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 1)
  {
    switch(objc_msgSend(v7, "item"))
    {
      case 0:
        -[PXSettingsConfigurationsViewController settings](self, "settings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[PXSettingsConfigurationsViewController _titleForSettings:](self, "_titleForSettings:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Using current values for the settings ”%@”"), v15);

        -[PXSettingsConfigurationsViewController _untitledName](self, "_untitledName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v37[3] = &unk_1E5145218;
        v38 = v13;
        v39 = self;
        v17 = v13;
        -[PXSettingsConfigurationsViewController _promptNameWithAlertTitle:message:proposedNamed:confirmationButtonTitle:completionHandler:](self, "_promptNameWithAlertTitle:message:proposedNamed:confirmationButtonTitle:completionHandler:", CFSTR("New Configuration"), v10, v16, CFSTR("Create"), v37);

        goto LABEL_19;
      case 1:
        objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[PXSettingsConfiguration configurationsFromSharableString:](PXSettingsConfiguration, "configurationsFromSharableString:", v10);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          v20 = objc_msgSend(v19, "count");
          v21 = (void *)MEMORY[0x1E0CB3940];
          if (v20 == 1)
          {
            objc_msgSend(v19, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("Import configuration ”%@”?"), v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Import %li configurations?"), v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v24, 0, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x1E0DC3448];
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
          v35[3] = &unk_1E51458F8;
          v35[4] = self;
          v36 = v19;
          objc_msgSend(v31, "actionWithTitle:style:handler:", CFSTR("Import"), 0, v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAction:", v32);

          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAction:", v33);

          -[PXSettingsConfigurationsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 1, 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("No valid text in pasteboard"), CFSTR("To import configurations, make sure to first copy the text that you received from the person trying to share configurations with you."), 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addAction:", v29);

          -[PXSettingsConfigurationsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
        }

        goto LABEL_18;
      case 2:
        -[PXSettingsConfigurationsViewController source](self, "source");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v10, "numberOfConfigurations") >= 1)
        {
          v25 = 0;
          do
          {
            objc_msgSend(v10, "configurationAtIndex:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v26);

            ++v25;
          }
          while (v25 < objc_msgSend(v10, "numberOfConfigurations"));
        }
        -[PXSettingsConfigurationsViewController _shareConfigurations:](self, "_shareConfigurations:", v19);
LABEL_18:

        goto LABEL_19;
      case 3:
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Delete All Configurations?"), 0, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
        v34[3] = &unk_1E5144530;
        v34[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Delete All"), 2, v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v27);

        objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v28);

        -[PXSettingsConfigurationsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
        goto LABEL_19;
      default:
        goto LABEL_20;
    }
  }
  if (!v8)
  {
    -[PXSettingsConfigurationsViewController source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationAtIndex:", objc_msgSend(v7, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "archive");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "restoreFromArchiveDictionary:", v12);

LABEL_19:
  }
LABEL_20:
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;

  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSettingsConfigurationsViewController.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == SectionConfigurations"));

  }
  -[PXSettingsConfigurationsViewController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "configurationAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsConfigurationsViewController _titleForSettings:](self, "_titleForSettings:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v16 = (void *)MEMORY[0x1E0DC3448];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke;
  v35[3] = &unk_1E51458F8;
  v35[4] = self;
  v17 = v9;
  v36 = v17;
  objc_msgSend(v16, "actionWithTitle:style:handler:", CFSTR("Share…"), 0, v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18);

  v19 = (void *)MEMORY[0x1E0DC3448];
  v32[0] = v15;
  v32[1] = 3221225472;
  v32[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_2;
  v32[3] = &unk_1E5133F18;
  v32[4] = self;
  v20 = v17;
  v33 = v20;
  v21 = v7;
  v34 = v21;
  objc_msgSend(v19, "actionWithTitle:style:handler:", CFSTR("Update…"), 0, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v22);

  v23 = (void *)MEMORY[0x1E0DC3448];
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_5;
  v29[3] = &unk_1E5133F18;
  v29[4] = self;
  v30 = v20;
  v31 = v21;
  v24 = v21;
  v25 = v20;
  objc_msgSend(v23, "actionWithTitle:style:handler:", CFSTR("Rename…"), 0, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v26);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v27);

  -[PXSettingsConfigurationsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)settingsConfigurationSource:(id)a3 performChanges:(id)a4
{
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a4;
  if (-[PXSettingsConfigurationsViewController isViewLoaded](self, "isViewLoaded")
    && (-[PXSettingsConfigurationsViewController tableView](self, "tableView"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "performBatchUpdates:completion:", v7, 0);

  }
  else
  {
    v7[2]();
  }

}

- (void)settingsConfigurationSource:(id)a3 didChange:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v13 = a4;
  if (-[PXSettingsConfigurationsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXSettingsConfigurationsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hasIncrementalChanges") && !objc_msgSend(v13, "hasMoves"))
    {
      objc_msgSend(v13, "removedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke;
      v18[3] = &unk_1E5148928;
      v9 = v5;
      v19 = v9;
      objc_msgSend(v7, "enumerateIndexesUsingBlock:", v18);

      objc_msgSend(v13, "insertedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_2;
      v16[3] = &unk_1E5148928;
      v11 = v9;
      v17 = v11;
      objc_msgSend(v10, "enumerateIndexesUsingBlock:", v16);

      objc_msgSend(v13, "changedIndexes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_3;
      v14[3] = &unk_1E5148928;
      v15 = v11;
      objc_msgSend(v12, "enumerateIndexesUsingBlock:", v14);

      v6 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadSections:withRowAnimation:", v6, 100);
    }

    -[PXSettingsConfigurationsViewController _updateAvailableActions](self, "_updateAvailableActions");
  }

}

- (PXSettings)settings
{
  return self->_settings;
}

- (PXSettingsConfigurationsSource)source
{
  return self->_source;
}

- (BOOL)areAllActionsAvailable
{
  return self->_areAllActionsAvailable;
}

- (UITextField)promptTextField
{
  return self->_promptTextField;
}

- (void)setPromptTextField:(id)a3
{
  objc_storeStrong((id *)&self->_promptTextField, a3);
}

- (UIAlertAction)promptConfirmAction
{
  return self->_promptConfirmAction;
}

- (void)setPromptConfirmAction:(id)a3
{
  objc_storeStrong((id *)&self->_promptConfirmAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptConfirmAction, 0);
  objc_storeStrong((id *)&self->_promptTextField, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

void __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

void __80__PXSettingsConfigurationsViewController_settingsConfigurationSource_didChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_shareConfigurations:", v2);

}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_2(id *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = a1[4];
  objc_msgSend(a1[5], "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_titleForSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Using current values for the settings ”%@”"), v5);

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Update Configuration"), v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_3;
  v11[3] = &unk_1E51458F8;
  v12 = a1[6];
  v13 = a1[5];
  objc_msgSend(v8, "actionWithTitle:style:handler:", CFSTR("Update"), 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v9);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  objc_msgSend(a1[4], "presentViewController:animated:completion:", v7, 1, 0);
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_6;
  v4[3] = &unk_1E5145218;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_promptNameWithAlertTitle:message:proposedNamed:confirmationButtonTitle:completionHandler:", &stru_1E5149688, 0, v3, CFSTR("Rename"), v4);

}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v4 = a2;
  if (v4)
  {
    v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_7;
    v5[3] = &unk_1E5132378;
    v6 = v3;
    v7 = *(id *)(a1 + 40);
    v8 = v4;
    objc_msgSend(v6, "performChanges:", v5);

  }
}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_7(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "renameConfigurationAtIndex:withName:", objc_msgSend(v3, "indexOfConfiguration:", v4), a1[6]);

}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_4;
  v3[3] = &unk_1E5132350;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "performChanges:", v3);

}

void __93__PXSettingsConfigurationsViewController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "updateConfigurationAtIndex:", objc_msgSend(v2, "indexOfConfiguration:", v3));

}

void __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PXSettingsConfiguration *v4;
  void *v5;
  PXSettingsConfiguration *v6;
  _QWORD v7[4];
  PXSettingsConfiguration *v8;

  if (a2)
  {
    v3 = a2;
    v4 = -[PXSettingsConfiguration initWithName:settings:]([PXSettingsConfiguration alloc], "initWithName:settings:", v3, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v7[3] = &unk_1E51322E8;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "performChanges:", v7);

  }
}

void __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v3[3] = &unk_1E51322E8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performChanges:", v3);

}

void __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "source");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performChanges:", &__block_literal_global_181000);

}

uint64_t __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteAllConfigurations");
}

uint64_t __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "insertConfigurations:atIndex:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __76__PXSettingsConfigurationsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "insertConfiguration:atIndex:", *(_QWORD *)(a1 + 32), 0);
}

void __89__PXSettingsConfigurationsViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "deleteConfigurationAtIndex:", objc_msgSend(v2, "item"));

}

void __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setAutocapitalizationType:", 2);
  objc_msgSend(v4, "setAutocorrectionType:", 0);
  objc_msgSend(v4, "setClearButtonMode:", 3);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 40), sel__promptedNameDidChange_, 0x20000);

}

void __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "promptTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

uint64_t __132__PXSettingsConfigurationsViewController__promptNameWithAlertTitle_message_proposedNamed_confirmationButtonTitle_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
