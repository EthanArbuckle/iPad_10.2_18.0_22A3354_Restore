@implementation PXSharedLibraryLegacyDevicesFallbackViewController

- (PXSharedLibraryLegacyDevicesFallbackViewController)initWithDevices:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXSharedLibraryLegacyDevicesFallbackViewController *v8;
  uint64_t v9;
  NSArray *devices;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevicesFallbackViewController+iOS.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("devices.count"));

  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_LegacyDevices_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_LegacyDevices_Body"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryLegacyDevicesFallbackViewController;
  v8 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v13, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v6, v7, 0, 1);
  if (v8)
  {
    v9 = objc_msgSend(v5, "copy");
    devices = v8->_devices;
    v8->_devices = (NSArray *)v9;

  }
  return v8;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryLegacyDevicesFallbackViewController;
  -[OBTableWelcomeController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setAllowsSelection:", 0);
  objc_msgSend(v4, "setSeparatorStyle:", 0);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_LegacyDevices_ButtonTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 0x2000);
  -[PXSharedLibraryLegacyDevicesFallbackViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v6);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_continueButtonTapped_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryLegacyDevicesFallbackViewController addKeyCommand:](self, "addKeyCommand:", v9);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPreferences_Description_LearnMore_ButtonTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonTapped_, 0x2000);
  -[PXSharedLibraryLegacyDevicesFallbackViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryLegacyDevicesFallbackViewController;
  v4 = a3;
  -[PXSharedLibraryLegacyDevicesFallbackViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryLegacyDevicesFallbackViewController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  v7 = objc_msgSend(v4, "horizontalSizeClass");

  if (v6 != v7)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadSections:withRowAnimation:", v9, 100);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_devices, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  void *v9;
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
  uint64_t v23;
  double v24;
  NSArray *devices;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PXSharedLibraryLegacyDevicesFallbackTableViewCellIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "contentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v9, "backgroundConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevicesFallbackViewController+iOS.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell.contentConfiguration"), v38, v40);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevicesFallbackViewController+iOS.m"), 126, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell.contentConfiguration"), v38);
    }

    goto LABEL_4;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PXSharedLibraryLegacyDevicesFallbackTableViewCellIdentifier"));
  objc_msgSend(v9, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(v10, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(v10, "setImageToTextPadding:", 14.0);
  objc_msgSend(v10, "setTextToSecondaryTextVerticalPadding:", 2.0);
  objc_msgSend(v10, "imageProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaximumSize:", 40.0, 40.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryTextProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(v10, "secondaryTextProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryTextProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColor:", v19);

  objc_msgSend(v10, "secondaryTextProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNumberOfLines:", 0);

  objc_msgSend(v9, "defaultBackgroundConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  -[PXSharedLibraryLegacyDevicesFallbackViewController traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "horizontalSizeClass");

  v24 = 88.0;
  if (v23 != 2)
    v24 = 34.0;
  objc_msgSend(v10, "setDirectionalLayoutMargins:", 0.0, v24, 26.0, v24);
  objc_msgSend(v10, "setAxesPreservingSuperviewLayoutMargins:", 0);
  devices = self->_devices;
  v26 = objc_msgSend(v7, "item");

  -[NSArray objectAtIndexedSubscript:](devices, "objectAtIndexedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v27, "iconData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageWithData:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    PLSharedLibraryGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v27;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevice: Failed to create icon image for legacy device: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "setImage:", v30);
  objc_msgSend(v27, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v32);

  objc_msgSend(v27, "instructions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryText:", v33);

  objc_msgSend(v9, "setContentConfiguration:", v10);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v34);

  objc_msgSend(v9, "setBackgroundConfiguration:", v11);
  return v9;
}

- (void)continueButtonTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryLegacyDevicesFallbackViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[PXSharedLibraryLegacyDevicesFallbackViewController continueButtonTapped:]";
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(v4, "stepForwardInAssistantForAssistantViewController:", self);

}

- (void)learnMoreButtonTapped:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213247?cid=mc-ols-icloud-article_ht213247-photosappui-04262022"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
