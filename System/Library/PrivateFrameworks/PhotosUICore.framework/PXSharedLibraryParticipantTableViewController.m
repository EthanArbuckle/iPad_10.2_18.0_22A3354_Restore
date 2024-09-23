@implementation PXSharedLibraryParticipantTableViewController

- (PXSharedLibraryParticipantTableViewController)initWithDataSourceManager:(id)a3
{
  id v6;
  PXSharedLibraryParticipantTableViewController *v7;
  PXSharedLibraryParticipantTableViewController *v8;
  uint64_t v9;
  PXSharedLibraryParticipantDataSource *dataSource;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceManager"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryParticipantTableViewController;
  v7 = -[PXSharedLibraryParticipantTableViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_interactionEnabled = 1;
    objc_msgSend(v6, "dataSource");
    v9 = objc_claimAutoreleasedReturnValue();
    dataSource = v8->_dataSource;
    v8->_dataSource = (PXSharedLibraryParticipantDataSource *)v9;

    objc_storeStrong((id *)&v8->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v8->_dataSourceManager, "registerChangeObserver:context:", v8, PXSharedLibraryParticipantDataSourceManagerObservationContext);
  }

  return v8;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v5 = (id)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXSharedLibraryParticipantTableViewCellReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXSharedLibraryParticipantAddTableViewCellReuseIdentifier"));
  objc_msgSend(v5, "setScrollEnabled:", 0);
  objc_msgSend(v5, "setSectionHeaderHeight:", 0.0);
  objc_msgSend(v5, "setSectionFooterHeight:", 15.0);
  objc_msgSend(v5, "_setTopPadding:", 0.0);
  -[PXSharedLibraryParticipantTableViewController setView:](self, "setView:", v5);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
  objc_msgSend(v5, "addInteraction:", v4);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantTableViewController;
  -[PXSharedLibraryParticipantTableViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PXSharedLibraryParticipantTableViewController _updateRowHeight](self, "_updateRowHeight");
  -[PXSharedLibraryParticipantTableViewController _updateTableViewHeight](self, "_updateTableViewHeight");
}

- (void)setInteractionEnabled:(BOOL)a3
{
  if (self->_interactionEnabled != a3)
  {
    self->_interactionEnabled = a3;
    -[PXSharedLibraryParticipantTableViewController _updateAddButton](self, "_updateAddButton");
  }
}

- (BOOL)canAddParticipants
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PXSharedLibraryParticipantTableViewController isInteractionEnabled](self, "isInteractionEnabled");
  if (v3)
  {
    -[PXSharedLibraryParticipantTableViewController dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canAddParticipants");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_updateRowHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  PXScaledValueForTextStyleWithSymbolicTraits();
  v4 = v3;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v6 = v5;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v8 = ceil(v4 + v6 + v7);
  -[PXSharedLibraryParticipantTableViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowHeight");
  if (v9 != v8)
    objc_msgSend(v10, "setRowHeight:", v8);

}

- (void)_updateTableViewHeight
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[PXSharedLibraryParticipantTableViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v10, "numberOfRowsInSection:", 0);
  v4 = objc_msgSend(v10, "numberOfRowsInSection:", 1) + v3;
  objc_msgSend(v10, "rowHeight");
  v6 = fmax(v5, 0.0);
  objc_msgSend(v10, "sectionFooterHeight");
  v8 = v7 + v6 * (double)v4;
  if (self->_tableViewHeight != v8)
  {
    self->_tableViewHeight = v8;
    -[PXSharedLibraryParticipantTableViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sharedLibraryParticipantTableViewControllerDidChangeHeight:", self);

  }
}

- (void)_updateAddButton
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 5);

}

- (void)_handleAddRecipient
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[PXSharedLibraryParticipantTableViewController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_AddPeople_Title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_SearchLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participantAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibraryParticipantTableViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 5 - objc_msgSend(v7, "numberOfParticipants");

  +[PXPhotoRecipientViewController recipientPickerViewControllerWithTitle:doneLabel:toLabel:usedAddresses:maxRecipients:delegate:](PXPhotoRecipientViewController, "recipientPickerViewControllerWithTitle:doneLabel:toLabel:usedAddresses:maxRecipients:delegate:", v3, 0, v4, v6, v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:forSharedLibraryParticipantTableViewController:", v9, 1, self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  if (a4 == 1)
  {
    v8 = 1;
  }
  else if (a4)
  {
    v8 = 0;
  }
  else
  {
    -[PXSharedLibraryParticipantTableViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfParticipants");

  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;

  v7 = a3;
  v8 = a4;
  -[PXSharedLibraryParticipantTableViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "section");
  if (v10 == 1)
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXSharedLibraryParticipantAddTableViewCellReuseIdentifier"), v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        v15 = -[PXSharedLibraryParticipantTableViewController canAddParticipants](self, "canAddParticipants");
        objc_msgSend(v11, "addButton");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setEnabled:", v15);

        objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("PXSharedLibraryParticipantAddTableViewCell"));
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 195, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v24, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 195, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v24);
    }

    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 201, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXSharedLibraryParticipantTableViewCellReuseIdentifier"), v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 186, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("cell"), v21);
LABEL_13:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 186, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("cell"), v21, v26);

    goto LABEL_13;
  }
LABEL_5:
  objc_msgSend(v11, "cellModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemAtIndex:", objc_msgSend(v8, "row"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_screenScale");
  objc_msgSend(v12, "configureForParticipant:displayScale:isRTL:", v13, objc_msgSend(v7, "px_hasRightToLeftLayoutDirection"), v14);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("PXSharedLibraryParticipantTableViewCell"));

LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v17);

  return v11;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 1
      && -[PXSharedLibraryParticipantTableViewController canAddParticipants](self, "canAddParticipants");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == 1)
  {
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
    if (-[PXSharedLibraryParticipantTableViewController canAddParticipants](self, "canAddParticipants"))
      -[PXSharedLibraryParticipantTableViewController _handleAddRecipient](self, "_handleAddRecipient");
  }

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3))
    return 0;
  else
    return -[PXSharedLibraryParticipantTableViewController isInteractionEnabled](self, "isInteractionEnabled");
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  if (a4 == 1)
  {
    -[PXSharedLibraryParticipantTableViewController dataSourceManager](self, "dataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __96__PXSharedLibraryParticipantTableViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v9[3] = &unk_1E5144C98;
    v10 = v7;
    objc_msgSend(v8, "performChanges:", v9);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[8];
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryParticipantDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 302, CFSTR("Invalid observation context in %s"), "-[PXSharedLibraryParticipantTableViewController observable:didChange:context:]");

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    -[PXSharedLibraryParticipantTableViewController dataSourceManager](self, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryParticipantTableViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeDetailsFromDataSource:toDataSource:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemChangesInSection:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "hasMoves"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantTableViewController+iOS.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemChanges.hasMoves == NO"));

    }
    -[PXSharedLibraryParticipantTableViewController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v16;
    if (objc_msgSend(v15, "hasIncrementalChanges"))
    {
      objc_msgSend(v15, "insertedIndexes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v10;
      objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v34, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removedIndexes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v33, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "changedIndexes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v32, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __78__PXSharedLibraryParticipantTableViewController_observable_didChange_context___block_invoke;
      v38[3] = &unk_1E51318D8;
      v38[4] = self;
      v39 = v13;
      v20 = v16;
      v21 = v12;
      v22 = v11;
      v23 = v14;
      v24 = v20;
      v40 = v20;
      v41 = v17;
      v42 = v18;
      v25 = v18;
      v26 = v17;
      objc_msgSend(v24, "performBatchUpdates:completion:", v38, 0);
      v27 = v24;
      v14 = v23;
      v11 = v22;
      v12 = v21;
      objc_msgSend(v27, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 5);

      v10 = v35;
    }
    else if (objc_msgSend(v15, "hasAnyChanges"))
    {
      -[PXSharedLibraryParticipantTableViewController setDataSource:](self, "setDataSource:", v13);
      objc_msgSend(v16, "reloadData");
    }
    else
    {
      PXAssertGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "PXSharedLibraryParticipantDataSource change notification without changes", buf, 2u);
      }

    }
    v29 = objc_msgSend(v12, "canAddParticipants");
    if (v29 != objc_msgSend(v13, "canAddParticipants"))
      -[PXSharedLibraryParticipantTableViewController _updateAddButton](self, "_updateAddButton");

  }
}

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXSharedLibraryUIParticipant *v15;
  NSObject *p_super;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(v11, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "emailAddressString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "phoneNumberString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          v15 = -[PXSharedLibraryUIParticipant initWithEmailAddress:contact:]([PXSharedLibraryUIParticipant alloc], "initWithEmailAddress:contact:", v13, v12);
LABEL_10:
          p_super = &v15->super;
          objc_msgSend(v5, "addObject:", v15);
          goto LABEL_11;
        }
        if (objc_msgSend(v14, "length"))
        {
          v15 = -[PXSharedLibraryUIParticipant initWithPhoneNumber:contact:]([PXSharedLibraryUIParticipant alloc], "initWithPhoneNumber:contact:", v14, v12);
          goto LABEL_10;
        }
        PLSharedLibraryGetLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v11;
          v30 = 2112;
          v31 = v12;
          _os_log_impl(&dword_1A6789000, p_super, OS_LOG_TYPE_ERROR, "No invite address string for recipient: %@ contact: %@", buf, 0x16u);
        }
LABEL_11:

        ++v10;
      }
      while (v8 != v10);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      v8 = v17;
    }
    while (v17);
  }

  -[PXSharedLibraryParticipantTableViewController dataSourceManager](self, "dataSourceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__PXSharedLibraryParticipantTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke;
  v22[3] = &unk_1E5144C98;
  v23 = v5;
  v19 = v5;
  objc_msgSend(v18, "performChanges:", v22);

  -[PXSharedLibraryParticipantTableViewController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dismissPresentedViewControllerAnimated:forSharedLibraryParticipantTableViewController:", 1, self);

}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
  id v4;

  -[PXSharedLibraryParticipantTableViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissPresentedViewControllerAnimated:forSharedLibraryParticipantTableViewController:", 1, self);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[PXSharedLibraryParticipantTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForRowAtPoint:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && -[PXSharedLibraryParticipantTableViewController isInteractionEnabled](self, "isInteractionEnabled")
    && !objc_msgSend(v9, "section"))
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC36B8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v14[3] = &unk_1E5121D70;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    objc_msgSend(v13, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &__block_literal_global_75285, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  -[PXSharedLibraryParticipantTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v6, "indexPathForRowAtPoint:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v12);

  return v13;
}

- (PXSharedLibraryParticipantDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (double)tableViewHeight
{
  return self->_tableViewHeight;
}

- (BOOL)isInteractionEnabled
{
  return self->_interactionEnabled;
}

- (PXSharedLibraryParticipantTableViewControllerDelegate)delegate
{
  return (PXSharedLibraryParticipantTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXSharedLibraryParticipantDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

id __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_Delete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.minus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v15 = &unk_1E5139028;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC39D0];
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:children:", &stru_1E5149688, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  return v10;
}

uint64_t __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

void __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
  v4[3] = &unk_1E5144C98;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "performChanges:", v4);

}

void __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "removeParticipantAtIndex:", objc_msgSend(v2, "row"));

}

uint64_t __104__PXSharedLibraryParticipantTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addParticipants:", *(_QWORD *)(a1 + 32));
}

uint64_t __78__PXSharedLibraryParticipantTableViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "insertRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 56), 4);
  return objc_msgSend(*(id *)(a1 + 48), "deleteRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 64), 3);
}

void __96__PXSharedLibraryParticipantTableViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "removeParticipantAtIndex:", objc_msgSend(v2, "row"));

}

@end
