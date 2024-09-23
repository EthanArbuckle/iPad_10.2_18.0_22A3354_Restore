@implementation PXSharedLibraryAssistantPeopleViewController

- (void)setupLibraryChangeListening
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceLibraryInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;

  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "px_registerChangeObserver:", self);
}

- (id)peopleInfosToIdentifyInDataSource:(id)a3
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "infosWithoutPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 >= 3)
      v5 = 3;
    else
      v5 = v4;
    objc_msgSend(v3, "subarrayWithRange:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)alertConfigurationForIdentifyingPeopleInfos:(id)a3 action:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  PXAlertConfiguration *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a4;
  PXMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  v8 = CFSTR("MultiplePeople");
  if (v7 == 1)
    v8 = CFSTR("SinglePerson");
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = v8;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("PXSharedLibraryAssistant_PeopleSelection_Alert_IdentifyButton_%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_PeopleSelection_Alert_CancelButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(PXAlertConfiguration);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibraryAssistant_PeopleSelection_Alert_Title_%@"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration setTitle:](v14, "setTitle:", v16);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXSharedLibraryAssistant_PeopleSelection_Alert_Description_%@"), v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedSharedLibraryString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v18, CFSTR("%@"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration setMessage:](v14, "setMessage:", v19, v6);

  -[PXAlertConfiguration addActionWithTitle:style:action:](v14, "addActionWithTitle:style:action:", v12, 0, v4);
  -[PXAlertConfiguration addActionWithTitle:style:action:](v14, "addActionWithTitle:style:action:", v13, 1, 0);

  return v14;
}

- (NSString)textForFooter
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v8;

  -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "localizedSelectedPeopleWithAdditionalPeopleCount:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = v8;
  if (v2)
    objc_msgSend(v2, "shareCounts");
  if (v5 + v4 < 1)
  {
    v6 = &stru_1E5149688;
  }
  else
  {
    PXSharedLibraryAssistantPeopleSelectionFooterTitle(v3, v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (void)updateWithPerson:(id)a3 loneParticipantInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXSharedLibraryIncludedPeopleInfo *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "participant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "infoForPersonUUID:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithParticipant:person:", v9, v14);
    objc_msgSend(v8, "replaceInfo:withInfo:", v6, v13);
    goto LABEL_5;
  }
  objc_msgSend(v11, "participant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v14, "uuid");
    v13 = (PXSharedLibraryIncludedPeopleInfo *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssistantPeopleViewController _fixupStalePersonForUUID:loneParticipantInfo:](self, "_fixupStalePersonForUUID:loneParticipantInfo:", v13, v6);
LABEL_5:

  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PXSharedLibraryAssistantPeopleViewController dataSourceManager](self, "dataSourceManager", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "person");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "changeDetailsForObject:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v12, "uuid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXSharedLibraryAssistantPeopleViewController _fixupStalePersonForUUID:loneParticipantInfo:](self, "_fixupStalePersonForUUID:loneParticipantInfo:", v14, 0);

          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)_fixupStalePersonForUUID:(id)a3 loneParticipantInfo:(id)a4
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
  char v20;
  PXSharedLibraryIncludedPeopleInfo *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  PXSharedLibraryIncludedPeopleInfo *v29;
  id v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SEL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v46 = a3;
  v7 = a4;
  -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController dataSourceManager](self, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceLibraryInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+Internal.m"), 110, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewModel.sourceLibraryInfo"), v34, v36);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+Internal.m"), 110, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewModel.sourceLibraryInfo"), v34);
  }

LABEL_3:
  v40 = a2;
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allPersonUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v46, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v9, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "infosWithoutPeople");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "participant");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v14;
  if ((objc_msgSend(v14, "containsObject:", v46) & 1) != 0
    || (objc_msgSend(v16, "uuid"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v14, "containsObject:", v19),
        v19,
        (v20 & 1) != 0))
  {
    v41 = v12;
    objc_msgSend(v16, "uuid");
    v21 = (PXSharedLibraryIncludedPeopleInfo *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "infoForPersonUUID:", v46);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "infoForPersonUUID:", v21);
    v25 = objc_claimAutoreleasedReturnValue();

    v42 = v10;
    v43 = v8;
    if (v23 | v25)
    {
      if (v23 && !v25)
      {
        v26 = (id)v23;
LABEL_14:
        v27 = v26;
        if (!v7)
        {
          v29 = -[PXSharedLibraryIncludedPeopleInfo initWithPerson:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithPerson:", v16);
          v30 = 0;
          v31 = v27;
          v27 = 0;
LABEL_23:
          objc_msgSend(v9, "replaceInfo:withInfo:", v31, v29);

LABEL_24:
          v10 = v42;
          v8 = v43;
          v12 = v41;
          goto LABEL_25;
        }
        v28 = v7;
        v29 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithParticipant:person:", v45, v16);
        v30 = 0;
        goto LABEL_16;
      }
      if (!v23 && v25)
      {
        v26 = (id)v25;
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", v40, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+Internal.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stalePersonInfo || refreshedPersonInfo"));

    }
    if (!v7)
    {
      if (objc_msgSend(v46, "isEqualToString:", v21))
        v39 = 0;
      else
        v39 = (void *)v23;
      v30 = v39;
      v31 = (id)v25;
      v29 = -[PXSharedLibraryIncludedPeopleInfo initWithPerson:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithPerson:", v16);
      v27 = 0;
      goto LABEL_17;
    }
    v27 = (id)v25;
    if (objc_msgSend(v46, "isEqualToString:", v21))
      v38 = 0;
    else
      v38 = (void *)v23;
    v30 = v38;
    v31 = v7;
    v29 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithParticipant:person:", v45, v16);
    if (!v27)
    {
LABEL_17:
      if (v30)
        objc_msgSend(v9, "removeInfo:", v30);
      if (!v31)
        goto LABEL_24;
      goto LABEL_23;
    }
LABEL_16:
    objc_msgSend(v9, "removeInfo:", v27);
    v31 = v7;
    goto LABEL_17;
  }
  v21 = -[PXSharedLibraryIncludedPeopleInfo initWithParticipant:person:]([PXSharedLibraryIncludedPeopleInfo alloc], "initWithParticipant:person:", v45, v16);
  objc_msgSend(v9, "replaceInfo:withInfo:", v7, v21);
LABEL_25:

}

uint64_t __109__PXSharedLibraryAssistantPeopleViewController_Internal__alertConfigurationForIdentifyingPeopleInfos_action___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (PXSharedLibraryAssistantPeopleViewController)initWithViewModel:(id)a3
{
  id v6;
  void *v7;
  PXSharedLibraryAssistantPeopleViewController *v8;
  PXSharedLibraryAssistantPeopleViewController *v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_PeopleSelection_Title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryAssistantPeopleViewController;
  v8 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v15, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v7, 0, 0, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a3);
    -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](v9->_viewModel, "registerChangeObserver:context:", v9, PXSharedLibraryAssistantViewModelObservationContext_278152);
    objc_msgSend(v6, "sourceLibraryInfo");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    objc_msgSend(v11, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "px_registerChangeObserver:", v9);
  }

  return v9;
}

- (void)viewDidLoad
{
  PXSharedLibraryIncludedPeopleDataSourceManager *v3;
  PXSharedLibraryIncludedPeopleDataSourceManager *dataSourceManager;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITableViewHeaderFooterView *v15;
  UITableViewHeaderFooterView *peopleSectionHeaderView;
  PXSharedLibraryIncludedPeopleTableViewCell *v17;
  PXSharedLibraryIncludedPeopleTableViewCell *peopleCell;
  UITableViewHeaderFooterView *v19;
  UITableViewHeaderFooterView *peopleSectionFooterView;
  UITableViewCell *v21;
  UITableViewCell *buttonCell;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  OBBoldTrayButton *v33;
  OBBoldTrayButton *continueButton;
  OBBoldTrayButton *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)PXSharedLibraryAssistantPeopleViewController;
  -[OBTableWelcomeController viewDidLoad](&v44, sel_viewDidLoad);
  -[PXSharedLibraryAssistantPeopleViewController _updateHeaderDetailText](self, "_updateHeaderDetailText");
  v3 = -[PXSharedLibraryIncludedPeopleDataSourceManager initWithViewModel:]([PXSharedLibraryIncludedPeopleDataSourceManager alloc], "initWithViewModel:", self->_viewModel);
  dataSourceManager = self->_dataSourceManager;
  self->_dataSourceManager = v3;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_dataSourceManager, "registerChangeObserver:context:", self, PXSharedLibraryIncludedPeopleDataSourceManagerObservationContext);
  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setDataSource:", self);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v6);
  objc_msgSend(MEMORY[0x1E0DC39A8], "headerConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_PeopleSelection_PickerDetail"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v12);

  objc_msgSend(v8, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);

  v15 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E0DC3D78]);
  peopleSectionHeaderView = self->_peopleSectionHeaderView;
  self->_peopleSectionHeaderView = v15;

  -[UITableViewHeaderFooterView setContentConfiguration:](self->_peopleSectionHeaderView, "setContentConfiguration:", v8);
  -[UITableViewHeaderFooterView setAutomaticallyUpdatesContentConfiguration:](self->_peopleSectionHeaderView, "setAutomaticallyUpdatesContentConfiguration:", 1);
  v17 = -[PXSharedLibraryIncludedPeopleTableViewCell initWithDataSourceManager:]([PXSharedLibraryIncludedPeopleTableViewCell alloc], "initWithDataSourceManager:", self->_dataSourceManager);
  peopleCell = self->_peopleCell;
  self->_peopleCell = v17;

  v19 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E0DC3D78]);
  peopleSectionFooterView = self->_peopleSectionFooterView;
  self->_peopleSectionFooterView = v19;

  v21 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  buttonCell = self->_buttonCell;
  self->_buttonCell = v21;

  -[UITableViewCell defaultContentConfiguration](self->_buttonCell, "defaultContentConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  -[PXSharedLibraryAssistantPeopleViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "tintColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setColor:", v27);

  objc_msgSend(v23, "textProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAdjustsFontForContentSizeCategory:", 1);

  PXSharedLibraryCellSystemImageNamed(CFSTR("plus"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v30);

  -[UITableViewCell setContentConfiguration:](self->_buttonCell, "setContentConfiguration:", v23);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listPlainCellConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v32);

  -[UITableViewCell setBackgroundConfiguration:](self->_buttonCell, "setBackgroundConfiguration:", v31);
  -[PXSharedLibraryAssistantPeopleViewController _updateButtonCell](self, "_updateButtonCell");
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v33 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v33;

  v35 = self->_continueButton;
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Continue"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v35, "setTitle:forState:", v36, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel_continueButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantPeopleViewController buttonTray](self, "buttonTray");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addButton:", self->_continueButton);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_continueButtonTapped_);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController addKeyCommand:](self, "addKeyCommand:", v38);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_ButtonTitle_Skip"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTitle:forState:", v40, 0);

  objc_msgSend(v39, "addTarget:action:forControlEvents:", self, sel_addLaterButtonTapped_, 0x2000);
  -[PXSharedLibraryAssistantPeopleViewController buttonTray](self, "buttonTray");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addButton:", v39);

  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellBlueTextColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTintColor:", v42);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibraryAssistantPeopleViewController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PXSharedLibraryAssistantPeopleViewController _updateContinueButton](self, "_updateContinueButton");
  -[PXSharedLibraryIncludedPeopleDataSourceManager setViewModelSyncingDisabled:](self->_dataSourceManager, "setViewModelSyncingDisabled:", 0);
}

- (BOOL)_hasPeople
{
  void *v2;
  BOOL v3;

  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalNumberOfItems") > 0;

  return v3;
}

- (BOOL)_isPeopleCellRepresentedAtSection:(int64_t)a3
{
  return !a3 && -[PXSharedLibraryAssistantPeopleViewController _hasPeople](self, "_hasPeople");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[PXSharedLibraryAssistantPeopleViewController _hasPeople](self, "_hasPeople", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  _BOOL4 v5;
  int *v6;

  v5 = -[PXSharedLibraryAssistantPeopleViewController _isPeopleCellRepresentedAtSection:](self, "_isPeopleCellRepresentedAtSection:", objc_msgSend(a4, "section", a3));
  v6 = &OBJC_IVAR___PXSharedLibraryAssistantPeopleViewController__buttonCell;
  if (v5)
    v6 = &OBJC_IVAR___PXSharedLibraryAssistantPeopleViewController__peopleCell;
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + *v6);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
    return 0;
  else
    return self->_peopleSectionHeaderView;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  UITableViewHeaderFooterView *peopleSectionFooterView;

  if (-[PXSharedLibraryAssistantPeopleViewController _isPeopleCellRepresentedAtSection:](self, "_isPeopleCellRepresentedAtSection:", a4))
  {
    peopleSectionFooterView = self->_peopleSectionFooterView;
  }
  else
  {
    peopleSectionFooterView = 0;
  }
  return peopleSectionFooterView;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a3;
  if (-[PXSharedLibraryAssistantPeopleViewController _isPeopleCellRepresentedAtSection:](self, "_isPeopleCellRepresentedAtSection:", objc_msgSend(a4, "section")))
  {
    -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "totalNumberOfItems");

    objc_msgSend(v6, "layoutMargins");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "bounds");
    +[PXSharedLibraryIncludedPeopleTableViewCell heightForWidth:numberOfItems:](PXSharedLibraryIncludedPeopleTableViewCell, "heightForWidth:numberOfItems:", v8, v13 - (v10 + v12));
    v15 = v14;
  }
  else
  {
    v15 = *MEMORY[0x1E0DC53D8];
  }

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  PXSharedLibraryAssistantPeopleViewController *v7;
  PXSharedLibraryAssistantPeopleViewController *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  PXSharedLibraryAssistantPeopleViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceLibraryInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  -[PXSharedLibraryAssistantPeopleViewController photoLibrary](v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2168]), "initWithPhotoLibrary:", v9);
    -[NSObject setSelectionLimit:](v10, "setSelectionLimit:", 0);
    -[NSObject _setSourceType:](v10, "_setSourceType:", 1);
    v11 = objc_alloc_init(MEMORY[0x1E0CD21E8]);
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_AddPeople"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPurpose:", v12);

    objc_msgSend(v11, "setAllowsEditingCollection:", 1);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PXSharedLibraryAssistantViewModel personUUIDs](self->_viewModel, "personUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      PXMap();
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v15;
    }
    objc_msgSend(v11, "setDisabledIdentifiers:", v13);
    -[NSObject _setPeopleConfiguration:](v10, "_setPeopleConfiguration:", v11);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v10);
    objc_msgSend(v16, "setDelegate:", self);
    self->_pickerWasPresentedFromContinueButton = 0;
    -[PXSharedLibraryAssistantPeopleViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      PXAssertGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = self;
        _os_log_error_impl(&dword_1A6789000, v18, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle assistantViewController:presentViewController:animated: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v17, "assistantViewController:presentViewController:animated:", self, v16, 1);

  }
  else
  {
    PLSharedLibraryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Unable to present PHPickerViewController since %@ does not provide a PHPhotoLibrary.", (uint8_t *)&v19, 0xCu);
    }
  }

}

- (void)continueButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  PXPeoplePickerFlowController *v13;
  PXPeopleFlowNavigationController *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  uint8_t buf[4];
  PXSharedLibraryAssistantPeopleViewController *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_pickerWasPresentedFromContinueButton = 1;
  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController peopleInfosToIdentifyInDataSource:](self, "peopleInfosToIdentifyInDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__PXSharedLibraryAssistantPeopleViewController_continueButtonTapped___block_invoke;
    v17[3] = &unk_1E5147280;
    objc_copyWeak(&v19, &location);
    v18 = v6;
    -[PXSharedLibraryAssistantPeopleViewController alertConfigurationForIdentifyingPeopleInfos:action:](self, "alertConfigurationForIdentifyingPeopleInfos:action:", v18, v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStyle:", 0);
    objc_msgSend(v7, "setSourceItem:", v4);
    -[PXSharedLibraryAssistantPeopleViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PXAssertGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = self;
        _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle assistantViewController:presentViewController:animated: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v8, "assistantViewController:presentAlertWithConfiguration:animated:", self, v7, 1);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_pickerWasPresentedFromContinueButton = 0;
    -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PXMap();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v13 = -[PXPeoplePickerFlowController initWithPeople:]([PXPeoplePickerFlowController alloc], "initWithPeople:", v12);
      if (-[PXPeoplePickerFlowController hasNextViewController](v13, "hasNextViewController"))
      {
        -[PXPeoplePickerFlowController setFlowDelegate:](v13, "setFlowDelegate:", self);
        v14 = -[PXPeopleFlowNavigationController initWithFlowController:]([PXPeopleFlowNavigationController alloc], "initWithFlowController:", v13);
        -[PXSharedLibraryAssistantPeopleViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          PXAssertGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v22 = self;
            _os_log_error_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle assistantViewController:presentViewController:animated: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v15, "assistantViewController:presentViewController:animated:", self, v14, 1);

      }
      else
      {
        -[PXSharedLibraryAssistantPeopleViewController completeRulesStep](self, "completeRulesStep");
      }

    }
    else
    {
      -[PXSharedLibraryAssistantPeopleViewController completeRulesStep](self, "completeRulesStep");
    }

  }
}

- (void)addLaterButtonTapped:(id)a3
{
  -[PXSharedLibraryIncludedPeopleDataSourceManager setViewModelSyncingDisabled:](self->_dataSourceManager, "setViewModelSyncingDisabled:", 1);
  -[PXSharedLibraryAssistantPeopleViewController completeRulesStep](self, "completeRulesStep");
}

- (void)completeRulesStep
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  self->_wantsToContinueToNextStep = 1;
  -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[PXSharedLibraryAssistantViewModel suggestedStartDate](self->_viewModel, "suggestedStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
    -[OBBoldTrayButton showsBusyIndicator](self->_continueButton, "showsBusyIndicator");
  else
    -[PXSharedLibraryAssistantPeopleViewController _advanceToNextStep](self, "_advanceToNextStep");
}

- (void)_suggestedStartDateChanged
{
  void *v3;

  -[PXSharedLibraryAssistantViewModel suggestedStartDate](self->_viewModel, "suggestedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (self->_wantsToContinueToNextStep)
    {
      -[OBBoldTrayButton hidesBusyIndicator](self->_continueButton, "hidesBusyIndicator");
      -[PXSharedLibraryAssistantPeopleViewController _advanceToNextStep](self, "_advanceToNextStep");
    }
  }
}

- (void)_advanceToNextStep
{
  void *v3;
  NSObject *v4;
  int v5;
  PXSharedLibraryAssistantPeopleViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_wantsToContinueToNextStep = 0;
  -[PXSharedLibraryAssistantPeopleViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle stepForwardInAssistantForAssistantViewController: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(v3, "stepForwardInAssistantForAssistantViewController:", self);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_278152 == a5)
  {
    if ((v6 & 8) != 0)
    {
      -[PXSharedLibraryAssistantPeopleViewController _updateContinueButton](self, "_updateContinueButton");
      -[PXSharedLibraryAssistantPeopleViewController _updateHeaderDetailText](self, "_updateHeaderDetailText");
      if ((v6 & 0x800) == 0)
      {
LABEL_7:
        if ((v6 & 0x2000) == 0)
          goto LABEL_9;
LABEL_8:
        -[PXSharedLibraryAssistantPeopleViewController _suggestedStartDateChanged](self, "_suggestedStartDateChanged");
        goto LABEL_9;
      }
    }
    else if ((v6 & 0x800) == 0)
    {
      goto LABEL_7;
    }
    -[PXSharedLibraryAssistantPeopleViewController _updateFooterText](self, "_updateFooterText");
    if ((v6 & 0x2000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  if ((void *)PXSharedLibraryIncludedPeopleDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 338, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

    -[PXSharedLibraryAssistantPeopleViewController _updateFooterText](self, "_updateFooterText");
    -[PXSharedLibraryAssistantPeopleViewController _updateButtonCell](self, "_updateButtonCell");
    -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__PXSharedLibraryAssistantPeopleViewController_observable_didChange_context___block_invoke;
    v15[3] = &unk_1E5144D60;
    v16 = v11;
    v13 = v11;
    objc_msgSend(v12, "performChanges:", v15);

  }
LABEL_9:

}

- (void)_updateContinueButton
{
  -[OBBoldTrayButton setEnabled:](self->_continueButton, "setEnabled:", -[PXSharedLibraryAssistantPeopleViewController _hasPeople](self, "_hasPeople"));
}

- (void)_updateHeaderDetailText
{
  void *v3;
  id v4;

  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_PeopleSelection_Subtitle"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetailText:", v4);

}

- (void)_updateButtonCell
{
  __CFString *v3;
  void *v4;
  id v5;

  -[UITableViewCell contentConfiguration](self->_buttonCell, "contentConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXSharedLibraryAssistantPeopleViewController _hasPeople](self, "_hasPeople"))
    v3 = CFSTR("PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_AddOthers");
  else
    v3 = CFSTR("PXSharedLibraryAssistant_PeopleSelection_ButtonTitle_Add");
  PXLocalizedSharedLibraryString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[UITableViewCell setContentConfiguration:](self->_buttonCell, "setContentConfiguration:", v5);
}

- (void)_updateFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC39A8], "footerConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantPeopleViewController textForFooter](self, "textForFooter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  objc_msgSend(v9, "directionalLayoutMargins");
  objc_msgSend(v9, "setDirectionalLayoutMargins:", 7.0);
  objc_msgSend(v9, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

  -[UITableViewHeaderFooterView setContentConfiguration:](self->_peopleSectionFooterView, "setContentConfiguration:", v9);
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  SEL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  PXSharedLibraryAssistantPeopleViewController *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXSharedLibraryAssistantPeopleViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = self;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle assistantViewController:dismissViewControllerAnimated: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v7, "assistantViewController:dismissViewControllerAnimated:", self, 1);
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_pickerWasPresentedFromContinueButton)
  {
    self->_pickerWasPresentedFromContinueButton = 0;
    -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceLibraryInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        v30 = a2;
        v35 = v7;
        v36 = v6;
        v33 = v12;
        objc_msgSend(v12, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "librarySpecificFetchOptions");
        v14 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v14;
        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v10, v14);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v10;
        +[PXSharedLibraryAssistantPeopleViewController _fetchedPeople:sortedByLocalIdentifiers:](PXSharedLibraryAssistantPeopleViewController, "_fetchedPeople:sortedByLocalIdentifiers:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v38;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v38 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v19);
              -[PXSectionedDataSourceManager dataSource](self->_dataSourceManager, "dataSource");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "infosWithoutPeople");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "firstObject");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v23)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v30, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("loneParticipantInfo"));

              }
              -[PXSharedLibraryAssistantPeopleViewController updateWithPerson:loneParticipantInfo:](self, "updateWithPerson:loneParticipantInfo:", v20, v23);

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v17);
        }
        if (objc_msgSend(v15, "count"))
          -[PXSharedLibraryAssistantPeopleViewController completeRulesStep](self, "completeRulesStep");

        v7 = v35;
        v6 = v36;
        v10 = v34;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 388, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.viewModel.sourceLibraryInfo"), v27, v29);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 388, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.viewModel.sourceLibraryInfo"), v27);
    }

    goto LABEL_8;
  }
  if (objc_msgSend(v9, "count"))
    -[PXSharedLibraryIncludedPeopleDataSourceManager addSelectedPersonIdentifiers:](self->_dataSourceManager, "addSelectedPersonIdentifiers:", v10);
LABEL_22:

}

- (void)_presentPickerForInfos:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  PXSharedLibraryAssistantPeopleViewController *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Rules_IdentifyPerson_Named"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = objc_alloc_init(MEMORY[0x1E0CD21E8]);
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PXStringWithValidatedFormat();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPurpose:", v13, v12);

        objc_msgSend(v11, "setAllowsEditingCollection:", 1);
        objc_msgSend(v4, "addObject:", v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }

  -[PXSharedLibraryAssistantPeopleViewController viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceLibraryInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 441, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.viewModel.sourceLibraryInfo"), v24, v26);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantPeopleViewController+iOS.m"), 441, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.viewModel.sourceLibraryInfo"), v24);
  }

LABEL_10:
  v16 = objc_alloc(MEMORY[0x1E0CD2168]);
  objc_msgSend(v15, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithPhotoLibrary:", v17);

  objc_msgSend(v18, "setSelectionLimit:", 0);
  objc_msgSend(v18, "_setSourceType:", 1);
  objc_msgSend(v18, "_setFollowupPeopleConfigurations:", v4);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v18);
  objc_msgSend(v19, "setDelegate:", self);
  -[PXSharedLibraryAssistantPeopleViewController assistantViewControllerDelegate](self, "assistantViewControllerDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    PXAssertGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = self;
      _os_log_error_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "No assistantViewControllerDelegate available to handle assistantViewController:presentViewController:animated: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v20, "assistantViewController:presentViewController:animated:", self, v19, 1);

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

- (PXSharedLibraryIncludedPeopleDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_buttonCell, 0);
  objc_storeStrong((id *)&self->_peopleCell, 0);
  objc_storeStrong((id *)&self->_peopleSectionFooterView, 0);
  objc_storeStrong((id *)&self->_peopleSectionHeaderView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

uint64_t __72__PXSharedLibraryAssistantPeopleViewController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemIdentifier");
}

void __77__PXSharedLibraryAssistantPeopleViewController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "infosWithBothPeopleAndParticipants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInfosWithBothPeopleAndParticipants:", v5);

  objc_msgSend(*(id *)(a1 + 32), "allPersonUUIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonUUIDs:", v6);

}

void __69__PXSharedLibraryAssistantPeopleViewController_continueButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_presentPickerForInfos:", *(_QWORD *)(a1 + 32));

}

uint64_t __69__PXSharedLibraryAssistantPeopleViewController_continueButtonTapped___block_invoke_173(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "person");
}

uint64_t __82__PXSharedLibraryAssistantPeopleViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", a2);
}

+ (id)_fetchedPeople:(id)a3 sortedByLocalIdentifiers:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "localIdentifier", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "keysSortedByValueUsingComparator:", &__block_literal_global_199_278198);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __88__PXSharedLibraryAssistantPeopleViewController__fetchedPeople_sortedByLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
