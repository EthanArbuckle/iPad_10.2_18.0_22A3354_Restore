@implementation PXSharedLibraryAssistantHowToViewController

- (PXSharedLibraryAssistantHowToViewController)initWithLibraryFilterState:(id)a3
{
  id v5;
  void *v6;
  PXSharedLibraryAssistantHowToViewController *v7;
  PXSharedLibraryAssistantHowToViewController *v8;
  objc_super v10;

  v5 = a3;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryReplyAssistant_HowTo_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantHowToViewController;
  v7 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v10, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v6, 0, 0, 1);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_libraryFilterState, a3);

  return v8;
}

- (void)_updateIcon
{
  void *v3;
  id v4;

  PXSharedLibraryCreatePlatterImage(CFSTR("person.2.fill"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantHowToViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:accessibilityLabel:", v4, 0);

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantHowToViewController;
  -[OBTableWelcomeController viewDidLoad](&v10, sel_viewDidLoad);
  -[PXSharedLibraryAssistantHowToViewController _updateIcon](self, "_updateIcon");
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setAllowsSelection:", 0);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Done"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantHowToViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v6);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_continueButtonTapped_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantHowToViewController addKeyCommand:](self, "addKeyCommand:", v9);

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

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantHowToViewController;
  -[PXSharedLibraryAssistantHowToViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryAssistantHowToViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  if (v6 != objc_msgSend(v4, "userInterfaceStyle"))
    -[PXSharedLibraryAssistantHowToViewController _updateIcon](self, "_updateIcon");
  v7 = objc_msgSend(v5, "horizontalSizeClass");
  if (v7 != objc_msgSend(v4, "horizontalSizeClass"))
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadSections:withRowAnimation:", v9, 100);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  const __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PXSharedLibraryHowToPageReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "contentConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundConfiguration");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PXSharedLibraryHowToPageReuseIdentifier"));
    objc_msgSend(v8, "defaultContentConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1420]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    objc_msgSend(v9, "textProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v9, "setImageToTextPadding:", 17.0);
    objc_msgSend(v9, "setTextToSecondaryTextVerticalPadding:", 2.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryTextProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    objc_msgSend(v9, "secondaryTextProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryTextProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColor:", v17);

    objc_msgSend(v9, "secondaryTextProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNumberOfLines:", 0);

    objc_msgSend(v8, "defaultBackgroundConfiguration");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultContentConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "directionalLayoutMargins");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[PXSharedLibraryAssistantHowToViewController traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "horizontalSizeClass");

  if (v31 == 2)
    v32 = 54.0;
  else
    v32 = v29;
  if (v31 == 2)
    v33 = 54.0;
  else
    v33 = v25;
  objc_msgSend(v9, "setDirectionalLayoutMargins:", v23, v33, v27, v32);
  if (objc_msgSend(v6, "section"))
  {
    if (objc_msgSend(v6, "section") == 1)
    {
      v34 = CFSTR("heart.text.square.fill");
      v35 = CFSTR("PXSharedLibraryReplyAssistant_HowTo_Suggestions_Subtitle");
      v36 = CFSTR("PXSharedLibraryReplyAssistant_HowTo_Suggestions_Title");
    }
    else
    {
      if (objc_msgSend(v6, "section") != 2)
      {
        v37 = 0;
        v38 = 0;
        v34 = 0;
        goto LABEL_17;
      }
      v34 = CFSTR("slider.horizontal.3");
      v35 = CFSTR("PXSharedLibraryReplyAssistant_HowTo_Controls_Subtitle");
      v36 = CFSTR("PXSharedLibraryReplyAssistant_HowTo_Controls_Title");
    }
  }
  else
  {
    v34 = CFSTR("photo.on.rectangle");
    v35 = CFSTR("PXSharedLibraryReplyAssistant_HowTo_LibraryView_Subtitle");
    v36 = CFSTR("PXSharedLibraryReplyAssistant_HowTo_LibraryView_Title");
  }
  PXLocalizedSharedLibraryString(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v39 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 22.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "systemImageNamed:withConfiguration:", v34, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setImage:", v41);
  objc_msgSend(v9, "setText:", v37);
  objc_msgSend(v9, "setSecondaryText:", v38);
  objc_msgSend(v8, "setContentConfiguration:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v42);

  objc_msgSend(v8, "setBackgroundConfiguration:", v20);
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 1.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return objc_alloc_init(MEMORY[0x1E0DC3F10]);
}

- (void)continueButtonTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  PXSharedLibraryAssistantHowToViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantHowToViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle completeAssistantForAssistantViewController: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(v4, "completeAssistantForAssistantViewController:", self);
  -[PXSharedLibraryAssistantHowToViewController libraryFilterState](self, "libraryFilterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryNavigateToLibraryViewInSharedLibraryViewMode(0, v6);

}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
}

@end
