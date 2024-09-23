@implementation PXPeoplePickerConfigurationController

- (id)_pickerViewController:(id)a3 pickerConfiguration:(id)a4
{
  id v7;
  id v8;
  PXPeoplePickerConfigurationController *v9;
  void *v10;

  type metadata accessor for LemonadePickerViewControllerFactory();
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = (void *)static LemonadePickerViewControllerFactory.pickerViewController(_:pickerConfiguration:delegate:)((uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)&protocol witness table for PXPeoplePickerConfigurationController);

  return v10;
}

+ (id)lemonadePeopleConfigurationFromPersonIdentifiers:(id)a3 preselectedLocalIdentifiers:(id)a4 disabledLocalIdentifiers:(id)a5 selectionLimit:(int64_t)a6 compactMode:(BOOL)a7 transparentBackground:(BOOL)a8 prompt:(id)a9 wantsPets:(BOOL)a10
{
  unsigned int v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v10 = a8;
  v13 = sub_1A7AE3A10();
  v14 = sub_1A7AE3A10();
  v15 = sub_1A7AE3A10();
  v16 = sub_1A7AE3764();
  v18 = sub_1A696E1DC(v13, v14, v15, a6, a7, v10, v16, v17, a10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

- (PXPeoplePickerConfigurationController)initWithPeopleConfigurations:(id)a3 selectionLimit:(int64_t)a4 wantsPets:(BOOL)a5 configControllerHandler:(id)a6 photoLibrary:(id)a7
{
  id v13;
  id v14;
  id v15;
  PXPeoplePickerConfigurationController *v16;
  uint64_t v17;
  NSArray *peopleConfigurations;
  NSMutableArray *v19;
  NSMutableArray *viewControllers;
  NSMutableOrderedSet *v21;
  NSMutableOrderedSet *mutableAddedObjectIDs;
  NSMutableArray *v23;
  NSMutableArray *mutableAddedLocalIdentifiers;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v13, "count"))
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configControllerHandler"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peopleConfigurations.count > 0"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)PXPeoplePickerConfigurationController;
  v16 = -[PXPeoplePickerConfigurationController init](&v29, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v13, "copy");
    peopleConfigurations = v16->_peopleConfigurations;
    v16->_peopleConfigurations = (NSArray *)v17;

    objc_storeWeak((id *)&v16->_configControllerHandler, v14);
    v16->_selectionLimit = a4;
    v16->_wantsPets = a5;
    objc_storeStrong((id *)&v16->_photoLibrary, a7);
    v16->_currentPeopleConfigIndex = -1;
    v16->_currentViewControllerIndex = -1;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    viewControllers = v16->_viewControllers;
    v16->_viewControllers = v19;

    v21 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    mutableAddedObjectIDs = v16->_mutableAddedObjectIDs;
    v16->_mutableAddedObjectIDs = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableAddedLocalIdentifiers = v16->_mutableAddedLocalIdentifiers;
    v16->_mutableAddedLocalIdentifiers = v23;

  }
  return v16;
}

- (NSOrderedSet)addedObjectIDs
{
  void *v2;
  void *v3;

  -[PXPeoplePickerConfigurationController mutableAddedObjectIDs](self, "mutableAddedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSOrderedSet *)v3;
}

- (BOOL)hasContent
{
  void *v2;
  BOOL v3;

  -[PXPeoplePickerConfigurationController peopleConfigurations](self, "peopleConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)currentViewController
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PXPeoplePickerConfigurationController currentViewControllerIndex](self, "currentViewControllerIndex");
  -[PXPeoplePickerConfigurationController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 0x8000000000000000) != 0 || v3 >= objc_msgSend(v4, "count"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)incrementViewControllersForPerson:(id)a3
{
  id v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char isKindOfClass;
  SEL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PXPeopleBootstrapSummaryViewController *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PXPeopleSuggestionDataSource *v36;
  void *v37;
  PXPeopleBootstrapConfirmationViewController *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  int64_t v51;
  _BOOL8 v52;
  _BOOL8 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  _BOOL8 v63;
  _BOOL8 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v73;
  objc_class *v74;
  void *v75;
  objc_class *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *v83;
  PXPeoplePickerViewController *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  unint64_t v89;
  const char *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  void *v94;

  v5 = a3;
  v6 = -[PXPeoplePickerConfigurationController currentViewControllerIndex](self, "currentViewControllerIndex") + 1;
  v7 = -[PXPeoplePickerConfigurationController currentPeopleConfigIndex](self, "currentPeopleConfigIndex");
  -[PXPeoplePickerConfigurationController viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerConfigurationController peopleConfigurations](self, "peopleConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7)
  {
    v28 = objc_msgSend(v9, "count");
    if (v5)
    {
      if (v28 == 1)
      {
        v90 = a2;
        objc_msgSend(v10, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "allowsEditingCollection") & 1) != 0)
        {
          v94 = v10;
          v87 = v8;
          +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v5, 3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setWantsNaming:", 0);
          v31 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "processName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/Photo Picker/People Picker/iOS/PXPeoplePickerConfigurationController.m"), "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v33, v34, "-[PXPeoplePickerConfigurationController incrementViewControllersForPerson:]", 104);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setCallerInfo:", v35);

          -[PXPeoplePickerConfigurationController setContext:](self, "setContext:", v30);
          v36 = -[PXPeopleSuggestionDataSource initWithFlowType:]([PXPeopleSuggestionDataSource alloc], "initWithFlowType:", 1);
          -[PXPeopleSuggestionDataSource setSuggestionFetchType:](v36, "setSuggestionFetchType:", 0);
          -[PXPeopleSuggestionDataSource fetchAndCacheMergeCandidatesForPerson:](v36, "fetchAndCacheMergeCandidatesForPerson:", v5);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "count"))
          {
            v38 = -[PXPeopleBootstrapConfirmationViewController initWithContext:dataSource:]([PXPeopleBootstrapConfirmationViewController alloc], "initWithContext:dataSource:", v30, v36);
            -[PXPeopleBootstrapConfirmationViewController setActionDelegate:](v38, "setActionDelegate:", self);
            -[PXPeopleBootstrapConfirmationViewController setUseLowMemoryMode:](v38, "setUseLowMemoryMode:", 1);
            -[PXPeopleBootstrapConfirmationViewController setConfigControllerDelegate:](v38, "setConfigControllerDelegate:", self);
            objc_msgSend(v87, "addObject:", v38);
            -[PXPeoplePickerConfigurationController setCurrentViewControllerIndex:](self, "setCurrentViewControllerIndex:", v6);
            v23 = v38;
            -[PXPeoplePickerConfigurationController setButtonType:](self, "setButtonType:", 2);

          }
          else
          {
            v23 = 0;
          }

          v8 = v87;
          a2 = v90;
          v10 = v94;
          if (v23)
            goto LABEL_42;
        }
        else
        {

          a2 = v90;
        }
      }
    }
  }
  v11 = v7 + 1;
  if (v6 == objc_msgSend(v8, "count"))
  {
    -[PXPeoplePickerConfigurationController currentViewController](self, "currentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v14 = a2;
      v89 = v11;
      v92 = v10;
      v15 = v8;
      v16 = v5;
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_6;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (objc_class *)objc_opt_class();
        NSStringFromClass(v76);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "px_descriptionForAssertionMessage");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v14, self, CFSTR("PXPeoplePickerConfigurationController.m"), 123, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("person"), v75, v77);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (objc_class *)objc_opt_class();
        NSStringFromClass(v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", v14, self, CFSTR("PXPeoplePickerConfigurationController.m"), 123, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("person"), v75);
      }

LABEL_6:
      +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v16, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWantsNaming:", 0);
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "processName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/Photo Picker/People Picker/iOS/PXPeoplePickerConfigurationController.m"), "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v20, v21, "-[PXPeoplePickerConfigurationController incrementViewControllersForPerson:]", 126);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCallerInfo:", v22);

      v23 = -[PXPeopleBootstrapSummaryViewController initWithContext:]([PXPeopleBootstrapSummaryViewController alloc], "initWithContext:", v17);
      -[PXPeopleBootstrapSummaryViewController setUseLowMemoryMode:](v23, "setUseLowMemoryMode:", 1);
      -[PXPeopleBootstrapSummaryViewController setConfigControllerDelegate:](v23, "setConfigControllerDelegate:", self);
      v8 = v15;
      objc_msgSend(v15, "addObject:", v23);
      -[PXPeoplePickerConfigurationController setCurrentViewControllerIndex:](self, "setCurrentViewControllerIndex:", v6);
      v11 = v89;
      if (v89 == objc_msgSend(v92, "count"))
        v24 = 2;
      else
        v24 = 1;
      -[PXPeoplePickerConfigurationController setButtonType:](self, "setButtonType:", v24);

      v10 = v92;
      if (v23)
        goto LABEL_42;
    }
  }
  if (v11 >= objc_msgSend(v10, "count"))
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeoplePickerConfigurationController preselectedIdentifiers](self, "preselectedIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v10;
    if (objc_msgSend(v26, "count"))
    {
      v27 = v26;
    }
    else
    {
      objc_msgSend(v25, "suggestedIdentifiers");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v39 = v27;
    objc_msgSend(v25, "disabledIdentifiers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "mutableCopy");
    v42 = v41;
    v85 = v26;
    if (v41)
      v43 = v41;
    else
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = v43;
    v91 = v11;
    v86 = v5;

    -[PXPeoplePickerConfigurationController mutableAddedLocalIdentifiers](self, "mutableAddedLocalIdentifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObjectsFromArray:", v45);

    v46 = v44;
    v88 = v39;
    if (_os_feature_enabled_impl())
    {
      -[PXPeoplePickerConfigurationController identifiers](self, "identifiers");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (v47)
        v49 = v47;
      else
        v49 = MEMORY[0x1E0C9AA60];
      if (v39)
        v50 = v39;
      else
        v50 = (id)MEMORY[0x1E0C9AA60];
      v51 = -[PXPeoplePickerConfigurationController selectionLimit](self, "selectionLimit");
      v52 = -[PXPeoplePickerConfigurationController compactMode](self, "compactMode");
      v53 = -[PXPeoplePickerConfigurationController transparentBackground](self, "transparentBackground");
      v83 = v25;
      objc_msgSend(v25, "purpose");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v78) = -[PXPeoplePickerConfigurationController wantsPets](self, "wantsPets");
      v81 = v46;
      +[PXPeoplePickerConfigurationController lemonadePeopleConfigurationFromPersonIdentifiers:preselectedLocalIdentifiers:disabledLocalIdentifiers:selectionLimit:compactMode:transparentBackground:prompt:wantsPets:](PXPeoplePickerConfigurationController, "lemonadePeopleConfigurationFromPersonIdentifiers:preselectedLocalIdentifiers:disabledLocalIdentifiers:selectionLimit:compactMode:transparentBackground:prompt:wantsPets:", v49, v50, v46, v51, v52, v53, v54, v78);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPeoplePickerConfigurationController photoLibrary](self, "photoLibrary");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeoplePickerConfigurationController _pickerViewController:pickerConfiguration:](self, "_pickerViewController:pickerConfiguration:", v56, v55);
      v23 = (PXPeopleBootstrapSummaryViewController *)objc_claimAutoreleasedReturnValue();
      if (self->_wantsPets)
      {
        +[PXPeopleUtilities locKeyForPersonOrPet:withVisibility:key:](PXPeopleUtilities, "locKeyForPersonOrPet:withVisibility:key:", 0, objc_msgSend(v56, "px_peoplePetsHomeVisibility"), CFSTR("PICKER_PEOPLE_TITLE"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v57, CFSTR("PhotosUICore"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PXLocalizedStringFromTable(CFSTR("PICKER_PEOPLE_TITLE__People"), CFSTR("PhotosUICore"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v70 = v85;
      v5 = v86;
      v71 = v91;
      -[PXPeopleBootstrapSummaryViewController setTitle:](v23, "setTitle:", v58);

      v46 = v81;
      v25 = v83;
      v69 = v88;
    }
    else
    {
      v84 = [PXPeoplePickerViewController alloc];
      -[PXPeoplePickerConfigurationController identifiers](self, "identifiers");
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v59;
      v61 = (id)MEMORY[0x1E0C9AA60];
      if (v59)
        v62 = v59;
      else
        v62 = MEMORY[0x1E0C9AA60];
      if (v39)
        v61 = v39;
      v80 = v61;
      v82 = v62;
      v63 = -[PXPeoplePickerConfigurationController compactMode](self, "compactMode");
      v64 = -[PXPeoplePickerConfigurationController transparentBackground](self, "transparentBackground");
      objc_msgSend(v25, "purpose");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeoplePickerConfigurationController selectionCoordinator](self, "selectionCoordinator");
      v66 = v8;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPeoplePickerConfigurationController photoLibrary](self, "photoLibrary");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v79) = -[PXPeoplePickerConfigurationController wantsPets](self, "wantsPets");
      v23 = -[PXPeoplePickerViewController initWithPersonIdentifiers:selectedLocalIdentifiers:disabledLocalIdentifiers:compactMode:transparentBackground:prompt:selectionCoordinator:library:wantsPets:](v84, "initWithPersonIdentifiers:selectedLocalIdentifiers:disabledLocalIdentifiers:compactMode:transparentBackground:prompt:selectionCoordinator:library:wantsPets:", v82, v80, v46, v63, v64, v65, v67, v68, v79);

      v8 = v66;
      v69 = v88;
      -[PXPeopleBootstrapSummaryViewController setPeoplePickerActionHandler:](v23, "setPeoplePickerActionHandler:", self);
      -[PXPeopleBootstrapSummaryViewController setConfigControllerDelegate:](v23, "setConfigControllerDelegate:", self);
      v70 = v85;
      v5 = v86;
      v71 = v91;
    }
    objc_msgSend(v8, "addObject:", v23);
    -[PXPeoplePickerConfigurationController setCurrentPeopleConfigIndex:](self, "setCurrentPeopleConfigIndex:", v71);
    -[PXPeoplePickerConfigurationController setButtonType:](self, "setButtonType:", 0);

    v10 = v93;
  }
LABEL_42:

  return v23;
}

- (void)decrementViewControllers
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[PXPeoplePickerConfigurationController currentViewControllerIndex](self, "currentViewControllerIndex");
  v4 = v3 - 1;
  if (v3 < 1)
    return;
  v5 = v3;
  -[PXPeoplePickerConfigurationController viewControllers](self, "viewControllers");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeoplePickerConfigurationController setCurrentViewControllerIndex:](self, "setCurrentViewControllerIndex:", v4);
  objc_msgSend(v12, "removeLastObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXPeoplePickerConfigurationController setCurrentPeopleConfigIndex:](self, "setCurrentPeopleConfigIndex:", -[PXPeoplePickerConfigurationController currentPeopleConfigIndex](self, "currentPeopleConfigIndex") - 1);
LABEL_6:
    -[PXPeoplePickerConfigurationController mutableAddedObjectIDs](self, "mutableAddedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeoplePickerConfigurationController mutableAddedObjectIDs](self, "mutableAddedObjectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v9);

    -[PXPeoplePickerConfigurationController mutableAddedLocalIdentifiers](self, "mutableAddedLocalIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeLastObject");

    goto LABEL_7;
  }
  if (!v4)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v12, "objectAtIndexedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "deselectAllPeople");

}

- (void)didAdvanceWithSender:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  -[PXPeoplePickerConfigurationController currentViewController](self, "currentViewController", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "performSelector:", sel_willTransitionToNextInFlow);
  -[PXPeoplePickerConfigurationController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sourcePerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        +[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:](PXPeopleBootstrap, "performBootstrapWithSourcePerson:context:synchronous:completion:", v7, v6, 0, 0);

        goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 230, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v11, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 230, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v11);
    }

    goto LABEL_6;
  }
LABEL_7:
  -[PXPeoplePickerConfigurationController configControllerHandler](self, "configControllerHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "peopleConfigurationController:didFinishWithCurrentViewController:selectedPerson:", self, v14, 0);

}

- (void)requestAdvanceToNextInFlow
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;

  -[PXPeoplePickerConfigurationController peopleConfigurations](self, "peopleConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.peopleConfigurations.count == 1"));

  }
  -[PXPeoplePickerConfigurationController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.viewControllers.count == 2"));

  }
  -[PXPeoplePickerConfigurationController currentViewController](self, "currentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 251, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.currentViewController"), v17, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 251, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.currentViewController"), v17);
  }

LABEL_7:
  -[PXPeoplePickerConfigurationController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourcePerson");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 254, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("context.sourcePerson"), v20);
LABEL_15:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 254, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("context.sourcePerson"), v20, v24);

    goto LABEL_15;
  }
LABEL_9:
  objc_initWeak(&location, self);
  objc_msgSend(v8, "willTransitionToNextInFlow");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__PXPeoplePickerConfigurationController_requestAdvanceToNextInFlow__block_invoke;
  v25[3] = &unk_1E512AFC0;
  objc_copyWeak(&v28, &location);
  v11 = v8;
  v26 = v11;
  v12 = v9;
  v27 = v12;
  +[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:](PXPeopleBootstrap, "performBootstrapWithSourcePerson:context:synchronous:completion:", v10, v12, 0, v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)viewControllerWillBePopped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeoplePickerConfigurationController decrementViewControllers](self, "decrementViewControllers");
  -[PXPeoplePickerConfigurationController configControllerHandler](self, "configControllerHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peopleConfigurationController:didPopViewController:", self, v4);

}

- (void)peoplePicker:(id)a3 didTapItem:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  if (-[PXPeoplePickerConfigurationController shouldActLikeSingleSelectPicker](self, "shouldActLikeSingleSelectPicker"))
  {
    if (v15)
    {
      if (v7)
      {
LABEL_4:
        -[PXPeoplePickerConfigurationController mutableAddedLocalIdentifiers](self, "mutableAddedLocalIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        -[PXPeoplePickerConfigurationController mutableAddedObjectIDs](self, "mutableAddedObjectIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        -[PXPeoplePickerConfigurationController configControllerHandler](self, "configControllerHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "peopleConfigurationController:didFinishWithCurrentViewController:selectedPerson:", self, v15, v7);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peoplePicker"));

      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

    goto LABEL_4;
  }
LABEL_5:

}

- (PXPeoplePickerConfigurationController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeoplePickerConfigurationController.m"), 294, CFSTR("%s is not available as initializer"), "-[PXPeoplePickerConfigurationController init]");

  abort();
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)compactMode
{
  return self->_compactMode;
}

- (void)setCompactMode:(BOOL)a3
{
  self->_compactMode = a3;
}

- (BOOL)transparentBackground
{
  return self->_transparentBackground;
}

- (void)setTransparentBackground:(BOOL)a3
{
  self->_transparentBackground = a3;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)preselectedIdentifiers
{
  return self->_preselectedIdentifiers;
}

- (void)setPreselectedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (void)setSelectionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionCoordinator, a3);
}

- (BOOL)shouldActLikeSingleSelectPicker
{
  return self->_shouldActLikeSingleSelectPicker;
}

- (void)setShouldActLikeSingleSelectPicker:(BOOL)a3
{
  self->_shouldActLikeSingleSelectPicker = a3;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (NSArray)peopleConfigurations
{
  return self->_peopleConfigurations;
}

- (PXPeoplePickerConfigurationControllerHandler)configControllerHandler
{
  return (PXPeoplePickerConfigurationControllerHandler *)objc_loadWeakRetained((id *)&self->_configControllerHandler);
}

- (BOOL)wantsPets
{
  return self->_wantsPets;
}

- (int64_t)selectionLimit
{
  return self->_selectionLimit;
}

- (int64_t)currentPeopleConfigIndex
{
  return self->_currentPeopleConfigIndex;
}

- (void)setCurrentPeopleConfigIndex:(int64_t)a3
{
  self->_currentPeopleConfigIndex = a3;
}

- (int64_t)currentViewControllerIndex
{
  return self->_currentViewControllerIndex;
}

- (void)setCurrentViewControllerIndex:(int64_t)a3
{
  self->_currentViewControllerIndex = a3;
}

- (NSMutableArray)viewControllers
{
  return self->_viewControllers;
}

- (NSMutableOrderedSet)mutableAddedObjectIDs
{
  return self->_mutableAddedObjectIDs;
}

- (NSMutableArray)mutableAddedLocalIdentifiers
{
  return self->_mutableAddedLocalIdentifiers;
}

- (PXPeopleBootstrapContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PXPeoplePickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mutableAddedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutableAddedObjectIDs, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_configControllerHandler);
  objc_storeStrong((id *)&self->_peopleConfigurations, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_preselectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __67__PXPeoplePickerConfigurationController_requestAdvanceToNextInFlow__block_invoke(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "configControllerHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "peopleConfigurationController:didFinishWithCurrentViewController:selectedPerson:", v7, *(_QWORD *)(a1 + 32), 0);

  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failure bootstrapping with context: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeoplePickerConfigurationController.m"), 298, CFSTR("%s is not available as initializer"), "+[PXPeoplePickerConfigurationController new]");

  abort();
}

@end
