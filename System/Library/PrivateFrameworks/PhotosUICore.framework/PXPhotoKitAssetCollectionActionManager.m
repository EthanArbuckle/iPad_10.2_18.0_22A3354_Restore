@implementation PXPhotoKitAssetCollectionActionManager

- (PXPhotoKitAssetCollectionActionManager)initWithAssetCollectionReference:(id)a3 displayTitleInfo:(id)a4
{
  PXPhotoKitAssetCollectionActionManager *v4;
  uint64_t v5;
  NSDictionary *performerClassByType;
  uint64_t v7;
  NSMapTable *actionTypeByBarButtonItem;
  objc_super v10;
  _QWORD v11[59];
  _QWORD v12[60];

  v12[59] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PXPhotoKitAssetCollectionActionManager;
  v4 = -[PXAssetCollectionActionManager initWithAssetCollectionReference:displayTitleInfo:](&v10, sel_initWithAssetCollectionReference_displayTitleInfo_, a3, a4);
  if (v4)
  {
    v11[0] = CFSTR("PXAssetCollectionActionTypeCreateMemory");
    v12[0] = objc_opt_class();
    v11[1] = CFSTR("PXAssetCollectionActionTypeToggleFavorite");
    v12[1] = objc_opt_class();
    v11[2] = CFSTR("PXAssetCollectionActionTypeFavorite");
    v12[2] = objc_opt_class();
    v11[3] = CFSTR("PXAssetCollectionActionTypeUnfavorite");
    v12[3] = objc_opt_class();
    v11[4] = CFSTR("PXAssetCollectionActionTypeDeleteMemory");
    v12[4] = objc_opt_class();
    v11[5] = CFSTR("PXAssetCollectionActionTypeRevealInMoment");
    v12[5] = objc_opt_class();
    v11[6] = CFSTR("PXAssetCollectionActionTypeSuggestPeople");
    v12[6] = objc_opt_class();
    v11[7] = CFSTR("PXAssetCollectionActionTypeFavoritePerson");
    v12[7] = objc_opt_class();
    v11[8] = CFSTR("PXAssetCollectionActionTypeCustomizePeopleAlbum");
    v12[8] = objc_opt_class();
    v11[9] = CFSTR("PXAssetCollectionActionTypeCustomizeSocialGroupAlbum");
    v12[9] = objc_opt_class();
    v11[10] = CFSTR("PXAssetCollectionActionTypeRemoveSocialGroupFromHome");
    v12[10] = objc_opt_class();
    v11[11] = CFSTR("PXAssetCollectionActionTypeFileRadar");
    v12[11] = objc_opt_class();
    v11[12] = CFSTR("PXAssetCollectionActionTypeCopyInternalURL");
    v12[12] = objc_opt_class();
    v11[13] = CFSTR("PXAssetCollectionActionTypeBlockMemory");
    v12[13] = objc_opt_class();
    v11[14] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate");
    v12[14] = objc_opt_class();
    v11[15] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval");
    v12[15] = objc_opt_class();
    v11[16] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureHoliday");
    v12[16] = objc_opt_class();
    v11[17] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePlace");
    v12[17] = objc_opt_class();
    v11[18] = CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson");
    v12[18] = objc_opt_class();
    v11[19] = CFSTR("PXAssetCollectionActionTypeSetScreensaver");
    v12[19] = objc_opt_class();
    v11[20] = CFSTR("PXAssetCollectionActionTypeStoryDemo");
    v12[20] = objc_opt_class();
    v11[21] = CFSTR("PXAssetCollectionActionTypePlayMovie");
    v12[21] = objc_opt_class();
    v11[22] = CFSTR("PXAssetCollectionActionTypeTTRForLemonadeCollections");
    v12[22] = objc_opt_class();
    v11[23] = CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer");
    v12[23] = objc_opt_class();
    v11[24] = CFSTR("PXAssetCollectionActionTypeMomentShare");
    v12[24] = objc_opt_class();
    v11[25] = CFSTR("PXAssetCollectionActionTypeShare");
    v12[25] = objc_opt_class();
    v11[26] = CFSTR("PXAssetCollectionActionTypeShowDetails");
    v12[26] = objc_opt_class();
    v11[27] = CFSTR("PXAssetCollectionActionTypeShowInAlbum");
    v12[27] = objc_opt_class();
    v11[28] = CFSTR("PXAssetCollectionActionTypeShowMap");
    v12[28] = objc_opt_class();
    v11[29] = CFSTR("PXAssetCollectionActionTypeTrashMomentShare");
    v12[29] = objc_opt_class();
    v11[30] = CFSTR("PXAssetCollectionActionTypeCopyLink");
    v12[30] = objc_opt_class();
    v11[31] = CFSTR("PXAssetCollectionActionTypeCMMSaveToLibrary");
    v12[31] = objc_opt_class();
    v11[32] = CFSTR("PXAssetCollectionActionTypeAddFrom");
    v12[32] = objc_opt_class();
    v11[33] = CFSTR("PXAssetCollectionActionTypeDropAssets");
    v12[33] = objc_opt_class();
    v11[34] = CFSTR("PXAssetCollectionActionTypeMoveAssets");
    v12[34] = objc_opt_class();
    v11[35] = CFSTR("PXAssetCollectionActionTypeSetSortOrder");
    v12[35] = objc_opt_class();
    v11[36] = CFSTR("PXAssetCollectionActionTypePasteAssets");
    v12[36] = objc_opt_class();
    v11[37] = CFSTR("PXAssetCollectionActionTypeContentSyndicationSaveToLibrary");
    v12[37] = objc_opt_class();
    v11[38] = CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion");
    v12[38] = objc_opt_class();
    v11[39] = CFSTR("PXAssetCollectionActionTypeContentSyndicationRemoveSuggestionNoConfirm");
    v12[39] = objc_opt_class();
    v11[40] = CFSTR("PXAssetCollectionActionTypeDebugCuration");
    v12[40] = objc_opt_class();
    v11[41] = CFSTR("PXAssetCollectionActionTypeRename");
    v12[41] = objc_opt_class();
    v11[42] = CFSTR("PXAssetCollectionActionTypeDelete");
    v12[42] = objc_opt_class();
    v11[43] = CFSTR("PXAssetCollectionActionTypeAddContent");
    v12[43] = objc_opt_class();
    v11[44] = CFSTR("PXAssetCollectionActionTypeManagePeople");
    v12[44] = objc_opt_class();
    v11[45] = CFSTR("PXAssetCollectionActionTypeAddPeople");
    v12[45] = objc_opt_class();
    v11[46] = CFSTR("PXAssetCollectionActionTypePersonInfo");
    v12[46] = objc_opt_class();
    v11[47] = CFSTR("PXAssetCollectionActionTypeGenerativeStory");
    v12[47] = objc_opt_class();
    v11[48] = CFSTR("PXAssetCollectionActionTypeAddPersonToHome");
    v12[48] = objc_opt_class();
    v11[49] = CFSTR("PXAssetCollectionActionTypeConfirmAdditionalPeople");
    v12[49] = objc_opt_class();
    v11[50] = CFSTR("PXAssetCollectionActionTypeImprovePeopleRecognition");
    v12[50] = objc_opt_class();
    v11[51] = CFSTR("PXAssetCollectionActionTypeRemovePersonFromHome");
    v12[51] = objc_opt_class();
    v11[52] = CFSTR("PXAssetCollectionActionTypeBlockPerson");
    v12[52] = objc_opt_class();
    v11[53] = CFSTR("PXAssetCollectionActionTypeRemoveSharingSuggestion");
    v12[53] = objc_opt_class();
    v11[54] = CFSTR("PXAssetCollectionActionTypeMoveToSharedLibrary");
    v12[54] = objc_opt_class();
    v11[55] = CFSTR("PXAssetCollectionActionTypeChangePersonSortOrder");
    v12[55] = objc_opt_class();
    v11[56] = CFSTR("PXAssetCollectionActionTypeCustomize");
    v12[56] = objc_opt_class();
    v11[57] = CFSTR("PXAssetCollectionActionTypeCustomizeMemory");
    v12[57] = objc_opt_class();
    v11[58] = CFSTR("PXAssetCollectionActionTypeMoveOut");
    v12[58] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 59);
    v5 = objc_claimAutoreleasedReturnValue();
    performerClassByType = v4->_performerClassByType;
    v4->_performerClassByType = (NSDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    actionTypeByBarButtonItem = v4->__actionTypeByBarButtonItem;
    v4->__actionTypeByBarButtonItem = (NSMapTable *)v7;

  }
  return v4;
}

- (PXAssetsDataSource)assetsDataSource
{
  void *v2;
  void *v3;

  -[PXAssetCollectionActionManager assetsDataSourceManager](self, "assetsDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetsDataSource *)v3;
}

- (BOOL)canPerformActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v6))
    v8 = -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", v6, v7) != 0;
  else
    v8 = 0;

  return v8;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXPhotoKitAssetCollectionActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return v6 != 0;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PXPhotoKitAssetCollectionActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return objc_msgSend(v6, "isActionDestructive");
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", v6, v8);
  if (v9)
  {
    v10 = (void *)objc_msgSend([v9 alloc], "initWithActionType:assetCollectionReference:parameters:", v6, v8, v7);
    -[PXActionManager performerDelegate](self, "performerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)actionPerformerForActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
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

  v6 = a4;
  v7 = a3;
  v8 = -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", v7, v6);
  objc_msgSend(v6, "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionManager displayTitleInfoForAssetCollection:](self, "displayTitleInfoForAssetCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend([v8 alloc], "initWithActionType:assetCollectionReference:displayTitleInfo:", v7, v6, v10);
  -[PXActionManager performerDelegate](self, "performerDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v12);

  -[PXAssetCollectionActionManager people](self, "people");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPeople:", v13);

  -[PXAssetCollectionActionManager socialGroups](self, "socialGroups");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSocialGroups:", v14);

  -[PXAssetCollectionActionManager dropTargetAssetReference](self, "dropTargetAssetReference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDropTargetAssetReference:", v15);

  -[PXAssetCollectionActionManager dropSession](self, "dropSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDropSession:", v16);

  -[PXAssetCollectionActionManager dragSession](self, "dragSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDragSession:", v17);

  -[PXAssetCollectionActionManager assetsDataSourceManager](self, "assetsDataSourceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAssetsDataSource:", v19);

  -[PXAssetCollectionActionManager assetsFetchResult](self, "assetsFetchResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAssetsFetchResult:", v20);

  return v11;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4 assetCollectionReference:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  -[objc_class localizedTitleForUseCase:assetCollectionReference:withInputs:](-[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", a3, v8), "localizedTitleForUseCase:assetCollectionReference:withInputs:", a4, v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)systemImageNameForActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[objc_class systemImageNameForAssetCollectionReference:withInputs:](-[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", a3, v6), "systemImageNameForAssetCollectionReference:withInputs:", v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)_possiblePerformerClassForActionType:(id)a3 assetCollectionReference:(id)a4
{
  return -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:requireThatPerformerCanPerformAction:](self, "_possiblePerformerClassForActionType:assetCollectionReference:requireThatPerformerCanPerformAction:", a3, a4, 1);
}

- (Class)_possiblePerformerClassForActionType:(id)a3 assetCollectionReference:(id)a4 requireThatPerformerCanPerformAction:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8)
  {
    if (v9)
    {
      -[PXPhotoKitAssetCollectionActionManager performerClassByType](self, "performerClassByType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", v8);

      if (v5
        && !objc_msgSend(v11, "canPerformActionType:onAssetCollectionReference:withInputs:", v8, v10, self))
      {
        v11 = 0;
      }
    }
  }
  v13 = v11;

  return v13;
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  void *v3;
  void *v4;
  void *v5;

  -[PXActionManager performerDelegate](self, "performerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXActionManager performerDelegate](self, "performerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memoryAssetsActionFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (PXMemoryAssetsActionFactory *)v5;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXAlbumActionMenuBuilder primaryActionTypes](PXAlbumActionMenuBuilder, "primaryActionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", v8);

  +[PXAlbumActionMenuBuilder secondaryActionTypes](PXAlbumActionMenuBuilder, "secondaryActionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v10);

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "canShowInternalUI");

  if ((_DWORD)v10)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v12);

    +[PXAlbumActionMenuBuilder internalActionTypes](PXAlbumActionMenuBuilder, "internalActionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v13, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXActionMenu menuWithTitle:childElements:](PXActionMenu, "menuWithTitle:childElements:", CFSTR(" Internal"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  return v5;
}

- (id)menuElementsForActionType:(id)a3 assetCollectionReference:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[objc_class menuElementsForAssetCollectionReference:withInputs:](-[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", a3, v6), "menuElementsForAssetCollectionReference:withInputs:", v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[objc_class createBarButtonItemForAssetCollectionReference:withTarget:action:](-[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:requireThatPerformerCanPerformAction:](self, "_possiblePerformerClassForActionType:assetCollectionReference:requireThatPerformerCanPerformAction:", v4, v5, 0), "createBarButtonItemForAssetCollectionReference:withTarget:action:", v5, self, sel__handleBarButtonItem_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PXPhotoKitAssetCollectionActionManager _actionTypeByBarButtonItem](self, "_actionTypeByBarButtonItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v4, v6);

    }
  }
  else
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "barButtonItemForActionType: \"%@\" requires the action manager to be initialized with an assetCollection", (uint8_t *)&v10, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)standardActionForActionType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PXAssertGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "standardActionForActionType: \"%@\" requires the action manager to be initialized with an assetCollectionReference", (uint8_t *)location, 0xCu);
    }

    goto LABEL_7;
  }
  v6 = -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", v4, v5);
  if (!v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v7 = v6;
  objc_initWeak(location, self);
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PXPhotoKitAssetCollectionActionManager_standardActionForActionType___block_invoke;
  v12[3] = &unk_1E5139028;
  objc_copyWeak(&v14, location);
  v13 = v4;
  -[objc_class createStandardActionForAssetCollectionReference:withInput:handler:](v7, "createStandardActionForAssetCollectionReference:withInput:handler:", v8, self, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(location);
LABEL_8:

  return v9;
}

- (id)activityForActionType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", v4, v5);
    if (v6)
    {
      -[PXPhotoKitAssetCollectionActionManager localizedTitleForActionType:useCase:assetCollectionReference:](self, "localizedTitleForActionType:useCase:assetCollectionReference:", v4, 2, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetCollectionActionManager systemImageNameForActionType:assetCollectionReference:](self, "systemImageNameForActionType:assetCollectionReference:", v4, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class createActivityWithTitle:actionType:actionSystemImageName:](v6, "createActivityWithTitle:actionType:actionSystemImageName:", v7, v4, v8);
      v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
      -[objc_class setActionDelegate:](v6, "setActionDelegate:", self);

    }
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "activityForActionType: \"%@\" requires the action manager to be initialized with an assetCollectionReference", (uint8_t *)&v11, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (void)_handleBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[PXPhotoKitAssetCollectionActionManager _actionTypeByBarButtonItem](self, "_actionTypeByBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetCollectionActionManager _executeActionTypeIfPossible:action:](self, "_executeActionTypeIfPossible:action:", v6, 0);
  }
}

- (void)_executeActionTypeIfPossible:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[PXPhotoKitAssetCollectionActionManager _activePerformer](self, "_activePerformer");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)v8;
    -[PXPhotoKitAssetCollectionActionManager _activePerformer](self, "_activePerformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "state") <= 0xA)
    {

      goto LABEL_8;
    }
    v11 = -[PXAssetCollectionActionManager canPerformActionType:](self, "canPerformActionType:", v6);

    if (!v11)
      goto LABEL_9;
LABEL_6:
    -[PXAssetCollectionActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionManager performerDelegate](self, "performerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v13);

    -[PXAssetCollectionActionManager socialGroups](self, "socialGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSocialGroups:", v14);

    objc_msgSend(v12, "setSendingAction:", v7);
    -[PXPhotoKitAssetCollectionActionManager _setActivePerformer:](self, "_setActivePerformer:", v12);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__PXPhotoKitAssetCollectionActionManager__executeActionTypeIfPossible_action___block_invoke;
    v15[3] = &unk_1E51472F8;
    objc_copyWeak(&v17, &location);
    v9 = v12;
    v16 = v9;
    objc_msgSend(v9, "performActionWithCompletionHandler:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
LABEL_8:

    goto LABEL_9;
  }
  if (-[PXAssetCollectionActionManager canPerformActionType:](self, "canPerformActionType:", v6))
    goto LABEL_6;
LABEL_9:

}

- (void)_handleActionPerformerComplete:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  _BYTE v13[22];
  __int16 v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PXPhotoKitAssetCollectionActionManager _activePerformer](self, "_activePerformer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    if (v9)
    {
      PLUIGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = CFSTR("NO");
        *(_DWORD *)v13 = 138412802;
        *(_QWORD *)&v13[4] = v8;
        *(_WORD *)&v13[12] = 2112;
        if (v6)
          v12 = CFSTR("YES");
        *(_QWORD *)&v13[14] = v12;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Error performing action:%@ success:%@ error:%@", v13, 0x20u);
      }

    }
    -[PXPhotoKitAssetCollectionActionManager _setActivePerformer:](self, "_setActivePerformer:", 0, *(_OWORD *)v13);
  }

}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint8_t v13[16];

  v5 = a4;
  -[PXAssetCollectionActionManager assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "actionType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXPhotoKitAssetCollectionActionManager _possiblePerformerClassForActionType:assetCollectionReference:](self, "_possiblePerformerClassForActionType:assetCollectionReference:", v7, v6);

    objc_msgSend(v5, "actionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[objc_class canPerformActionType:onAssetCollectionReference:withInputs:](v8, "canPerformActionType:onAssetCollectionReference:withInputs:", v9, v6, self);

  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "canPerformWithActivityItems: requires the action manager to be initialized with an assetCollection", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)performActivity:(id)a3
{
  id v4;

  objc_msgSend(a3, "actionType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetCollectionActionManager _executeActionTypeIfPossible:action:](self, "_executeActionTypeIfPossible:action:", v4, 0);

}

- (NSMapTable)_actionTypeByBarButtonItem
{
  return self->__actionTypeByBarButtonItem;
}

- (NSDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (PXAssetCollectionActionPerformer)_activePerformer
{
  return self->__activePerformer;
}

- (void)_setActivePerformer:(id)a3
{
  objc_storeStrong((id *)&self->__activePerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activePerformer, 0);
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_storeStrong((id *)&self->__actionTypeByBarButtonItem, 0);
}

void __78__PXPhotoKitAssetCollectionActionManager__executeActionTypeIfPossible_action___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleActionPerformerComplete:success:error:", *(_QWORD *)(a1 + 32), a2, v6);

}

void __70__PXPhotoKitAssetCollectionActionManager_standardActionForActionType___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_executeActionTypeIfPossible:action:", *(_QWORD *)(a1 + 32), v4);

}

+ (PXPhotoKitAssetCollectionActionManager)actionManagerWithDataSourceManager:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXPhotoKitAssetCollectionActionManager *v8;
  void *v10;

  v5 = a3;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v7, "canContainAssets") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 379, CFSTR("PXPhotoKitAssetCollectionActionManager can only created from an AssetCollection"));

    }
    v8 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v7, 0);
    -[PXAssetCollectionActionManager setAssetsDataSourceManager:](v8, "setAssetsDataSourceManager:", v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
