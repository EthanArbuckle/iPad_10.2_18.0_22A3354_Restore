@implementation PXSharedLibraryAssistantDatePickerViewController

- (PXSharedLibraryAssistantDatePickerViewController)initWithViewModel:(id)a3
{
  id v5;
  void *v6;
  PXSharedLibraryAssistantDatePickerViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_DateSelection_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantDatePickerViewController;
  v7 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v10, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v6, 0, 0, 1);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    -[PXSharedLibraryAssistantViewModel startDate](v7->_viewModel, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PXSharedLibraryAssistantDatePickerViewController setHasCustomDate:](v7, "setHasCustomDate:", 1);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, PXSharedLibraryAssistantDatePickerViewModelObservationContext);
  }

  return v7;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  OBBoldTrayButton *v6;
  OBBoldTrayButton *titleButton;
  OBBoldTrayButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryAssistantDatePickerViewController;
  -[OBTableWelcomeController viewDidLoad](&v15, sel_viewDidLoad);
  -[PXSharedLibraryAssistantDatePickerViewController restorePickerDate](self, "restorePickerDate");
  -[PXSharedLibraryAssistantDatePickerViewController _updateHeaderText](self, "_updateHeaderText");
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  titleButton = self->_titleButton;
  self->_titleButton = v6;

  v8 = self->_titleButton;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Continue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v8, "setTitle:forState:", v9, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_titleButton, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantDatePickerViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", self->_titleButton);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_continueButtonTapped_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantDatePickerViewController addKeyCommand:](self, "addKeyCommand:", v11);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Skip"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:forState:", v13, 0);

  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_skipButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantDatePickerViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v12);

  -[PXSharedLibraryAssistantDatePickerViewController _updateFooterText](self, "_updateFooterText");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_isShowingFullPicker)
    return 2;
  else
    return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "item");
  if (v9 == 1)
  {
    -[PXSharedLibraryAssistantDatePickerViewController _datePickerCellForTableView:](self, "_datePickerCellForTableView:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantDatePickerViewController+iOS.m"), 106, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXSharedLibraryAssistantDatePickerViewController _startDateCellForTableView:](self, "_startDateCellForTableView:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return self->_cachedFooterText;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "row", a3) == 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _BOOL4 isShowingFullPicker;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  v8 = objc_msgSend(v7, "row");

  if (!v8)
  {
    isShowingFullPicker = self->_isShowingFullPicker;
    self->_isShowingFullPicker = !isShowingFullPicker;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (isShowingFullPicker)
    {
      v13 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);
    }
    else
    {
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertRowsAtIndexPaths:withRowAnimation:", v12, 100);
    }

  }
}

- (id)_startDateCellForTableView:(id)a3
{
  UITableViewCell *startDateCell;
  UITableViewCell *v5;
  UITableViewCell *v6;
  void *v7;

  startDateCell = self->_startDateCell;
  if (!startDateCell)
  {
    v5 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, 0);
    v6 = self->_startDateCell;
    self->_startDateCell = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setBackgroundColor:](self->_startDateCell, "setBackgroundColor:", v7);

    -[PXSharedLibraryAssistantDatePickerViewController _updateStartDateCell](self, "_updateStartDateCell");
    startDateCell = self->_startDateCell;
  }
  return startDateCell;
}

- (id)_datePickerCellForTableView:(id)a3
{
  UITableViewCell *datePickerCell;
  UITableViewCell *v5;
  UITableViewCell *v6;
  void *v7;
  UIDatePicker *v8;
  UIDatePicker *datePicker;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  datePickerCell = self->_datePickerCell;
  if (!datePickerCell)
  {
    v5 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
    v6 = self->_datePickerCell;
    self->_datePickerCell = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell setBackgroundColor:](self->_datePickerCell, "setBackgroundColor:", v7);

    v8 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    datePicker = self->_datePicker;
    self->_datePicker = v8;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](self->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker _setCustomFontDesign:](self->_datePicker, "_setCustomFontDesign:", *MEMORY[0x1E0DC13A8]);
    -[UIDatePicker setDatePickerMode:](self->_datePicker, "setDatePickerMode:", 1);
    -[UIDatePicker setPreferredDatePickerStyle:](self->_datePicker, "setPreferredDatePickerStyle:", 3);
    -[PXSharedLibraryAssistantDatePickerViewController pickedDate](self, "pickedDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setDate:](self->_datePicker, "setDate:", v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMaximumDate:](self->_datePicker, "setMaximumDate:", v11);

    -[UIDatePicker addTarget:action:forControlEvents:](self->_datePicker, "addTarget:action:forControlEvents:", self, sel__datePickerDidChange_, 4096);
    -[UITableViewCell contentView](self->_datePickerCell, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_datePicker);
    v22 = (void *)MEMORY[0x1E0CB3718];
    -[UIDatePicker topAnchor](self->_datePicker, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v25;
    -[UIDatePicker leadingAnchor](self->_datePicker, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v21;
    -[UIDatePicker bottomAnchor](self->_datePicker, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    -[UIDatePicker trailingAnchor](self->_datePicker, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v19);

    datePickerCell = self->_datePickerCell;
  }
  return datePickerCell;
}

- (void)_datePickerDidChange:(id)a3
{
  void *v4;

  objc_msgSend(a3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantDatePickerViewController truncateAndSetPickedDate:](self, "truncateAndSetPickedDate:", v4);

  -[PXSharedLibraryAssistantDatePickerViewController setHasCustomDate:](self, "setHasCustomDate:", 1);
  -[PXSharedLibraryAssistantDatePickerViewController _updateStartDateCell](self, "_updateStartDateCell");
  -[PXSharedLibraryAssistantDatePickerViewController _updateFooterText](self, "_updateFooterText");
}

- (void)_updateStartDateCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_DateSelection_PickerDetail"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v3);

  -[PXSharedLibraryAssistantDatePickerViewController pickedDate](self, "pickedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXSharedLibraryAssistantCustomizeRulesExcludingFromStartDate((uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  -[UITableViewCell setContentConfiguration:](self->_startDateCell, "setContentConfiguration:", v8);
}

- (void)_updateFooterText
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __69__PXSharedLibraryAssistantDatePickerViewController__updateFooterText__block_invoke;
  v2[3] = &unk_1E51485B0;
  v2[4] = self;
  -[PXSharedLibraryAssistantDatePickerViewController footerTextWithCompletion:](self, "footerTextWithCompletion:", v2);
}

- (void)_updateHeaderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_DateSelection_Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  -[PXSharedLibraryAssistantDatePickerViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSelectedPeopleWithAdditionalPeopleCount:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedLibraryAssistantDateSelectionSubtitle(v5, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantDatePickerViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v3);

  -[PXSharedLibraryAssistantDatePickerViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDetailText:", v6);

}

- (void)continueButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  -[OBBaseWelcomeController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantDatePickerViewController titleButton](self, "titleButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);
  objc_msgSend(v5, "setEnabled:", 0);
  objc_msgSend(v5, "showsBusyIndicator");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PXSharedLibraryAssistantDatePickerViewController_continueButtonTapped___block_invoke;
  v8[3] = &unk_1E5148D08;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[PXSharedLibraryAssistantDatePickerViewController usePickedDateAndContinueWithCompletionHandler:](self, "usePickedDateAndContinueWithCompletionHandler:", v8);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x2088) != 0 && PXSharedLibraryAssistantDatePickerViewModelObservationContext == (_QWORD)a5)
  {
    -[PXSharedLibraryAssistantDatePickerViewController resetPickerDate](self, "resetPickerDate", a3);
    -[PXSharedLibraryAssistantDatePickerViewController _updateStartDateCell](self, "_updateStartDateCell");
    -[PXSharedLibraryAssistantDatePickerViewController _updateFooterText](self, "_updateFooterText");
    -[PXSharedLibraryAssistantDatePickerViewController _updateHeaderText](self, "_updateHeaderText");
  }
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  return (PXAssistantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->assistantViewControllerDelegate, a3);
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (OBBoldTrayButton)titleButton
{
  return self->_titleButton;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (BOOL)hasCustomDate
{
  return self->_hasCustomDate;
}

- (void)setHasCustomDate:(BOOL)a3
{
  self->_hasCustomDate = a3;
}

- (NSDate)pickedDate
{
  return self->_pickedDate;
}

- (void)setPickedDate:(id)a3
{
  objc_storeStrong((id *)&self->_pickedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickedDate, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_cachedFooterText, 0);
  objc_storeStrong((id *)&self->_countsCell, 0);
  objc_storeStrong((id *)&self->_datePickerCell, 0);
  objc_storeStrong((id *)&self->_startDateCell, 0);
}

uint64_t __73__PXSharedLibraryAssistantDatePickerViewController_continueButtonTapped___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hidesBusyIndicator");
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setHidesBackButton:", 0);
}

void __69__PXSharedLibraryAssistantDatePickerViewController__updateFooterText__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1256), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "reloadData");
}

- (void)footerTextWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  PXSharedLibraryAssistantDatePickerViewController *v15;
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantDatePickerViewController+Internal.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[PXSharedLibraryAssistantDatePickerViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceLibraryInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantDatePickerViewController pickedDate](self, "pickedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PXSharedLibraryAssistantDatePickerViewController_Internal__footerTextWithCompletion___block_invoke;
  v13[3] = &unk_1E513F578;
  v14 = v6;
  v15 = self;
  v16 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "fetchEstimatedAssetsCountsForStartDate:personUUIDs:completion:", v8, v9, v13);

}

- (void)truncateAndSetPickedDate:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantDatePickerViewController+Internal.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_dateTruncatedToCalendarUnit:calendar:", 16, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibraryAssistantDatePickerViewController setPickedDate:](self, "setPickedDate:", v6);
}

- (void)restorePickerDate
{
  void *v3;
  id v4;

  -[PXSharedLibraryAssistantDatePickerViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PXSharedLibraryAssistantDatePickerViewController _resetPickerWithDate:](self, "_resetPickerWithDate:", v4);
  else
    -[PXSharedLibraryAssistantDatePickerViewController resetPickerDate](self, "resetPickerDate");

}

- (void)resetPickerDate
{
  void *v3;
  id v4;

  -[PXSharedLibraryAssistantDatePickerViewController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXSharedLibraryAssistantDatePickerViewController hasCustomDate](self, "hasCustomDate") && v3)
  {
    objc_msgSend(v4, "performChanges:", &__block_literal_global_254591);
    -[PXSharedLibraryAssistantDatePickerViewController _resetPickerWithDate:](self, "_resetPickerWithDate:", v3);
  }

}

- (void)_resetPickerWithDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSharedLibraryAssistantDatePickerViewController truncateAndSetPickedDate:](self, "truncateAndSetPickedDate:", v4);
  -[PXSharedLibraryAssistantDatePickerViewController datePicker](self, "datePicker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v4);

}

- (void)skipPickedDateAndContinue
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __87__PXSharedLibraryAssistantDatePickerViewController_Internal__skipPickedDateAndContinue__block_invoke;
  v2[3] = &unk_1E5149198;
  v2[4] = self;
  -[PXSharedLibraryAssistantDatePickerViewController _updateViewModelForStartDate:completionHandler:](self, "_updateViewModelForStartDate:completionHandler:", 0, v2);
}

- (void)usePickedDateAndContinueWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXSharedLibraryAssistantDatePickerViewController pickedDate](self, "pickedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108__PXSharedLibraryAssistantDatePickerViewController_Internal__usePickedDateAndContinueWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5148CE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PXSharedLibraryAssistantDatePickerViewController _updateViewModelForStartDate:completionHandler:](self, "_updateViewModelForStartDate:completionHandler:", v5, v7);

}

- (void)_updateViewModelForStartDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  -[PXSharedLibraryAssistantDatePickerViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    v11 = 2;
  else
    v11 = 2 * (objc_msgSend(v9, "count") != 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __109__PXSharedLibraryAssistantDatePickerViewController_Internal___updateViewModelForStartDate_completionHandler___block_invoke;
  v13[3] = &unk_1E513F5E0;
  v14 = v6;
  v15 = v11;
  v12 = v6;
  objc_msgSend(v8, "performChanges:shareCountsCompletionHandler:", v13, v7);

}

- (void)_continueAssistant
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryAssistantDatePickerViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[PXSharedLibraryAssistantDatePickerViewController(Internal) _continueAssistant]";
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Missing delegate: %s", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "stepForwardInAssistantForAssistantViewController:", self);

}

void __109__PXSharedLibraryAssistantDatePickerViewController_Internal___updateViewModelForStartDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStartDate:", v3);
  objc_msgSend(v4, "setAutoSharePolicy:", *(_QWORD *)(a1 + 40));

}

uint64_t __108__PXSharedLibraryAssistantDatePickerViewController_Internal__usePickedDateAndContinueWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_continueAssistant");
}

uint64_t __87__PXSharedLibraryAssistantDatePickerViewController_Internal__skipPickedDateAndContinue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueAssistant");
}

uint64_t __77__PXSharedLibraryAssistantDatePickerViewController_Internal__resetPickerDate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStartDate:", 0);
}

void __87__PXSharedLibraryAssistantDatePickerViewController_Internal__footerTextWithCompletion___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)a2 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)a2 + 1) == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)a2 + 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v12 = 0;
    objc_msgSend(*(id *)(a1 + 32), "localizedSelectedPeopleWithAdditionalPeopleCount:", &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    v8 = objc_msgSend(*(id *)(a1 + 40), "hasCustomDate");
    v10 = *a2;
    v11 = *((_QWORD *)a2 + 2);
    PXSharedLibraryAssistantDateSelectionFooter((uint64_t *)&v10, v6, v7, v8 ^ 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
