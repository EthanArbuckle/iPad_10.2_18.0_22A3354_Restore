@implementation PXPhotoKitPersonActionManager

- (PXPhotoKitPersonActionManager)initWithPeople:(id)a3
{
  id v4;
  PXPhotoKitPersonActionManager *v5;
  void *v6;
  PHPhotoLibrary *v7;
  void *v8;
  uint64_t v9;
  PHFetchResult *people;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v12;
  uint64_t v13;
  NSDictionary *performerClassByType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *personActionTypeByGenericType;
  objc_super v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitPersonActionManager;
  v5 = -[PXPhotoKitPersonActionManager init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v7 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v4, "copy");
    +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:photoLibrary:](PXPeopleUtilities, "peopleFetchResultFromFastEnumeration:photoLibrary:", v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    people = v5->_people;
    v5->_people = (PHFetchResult *)v9;

    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = v7;
    v12 = v7;

    v23[0] = CFSTR("PXPhotoKitPersonActionTypeFavorite");
    v24[0] = objc_opt_class();
    v23[1] = CFSTR("PXPhotoKitPersonActionTypeCustomize");
    v24[1] = objc_opt_class();
    v23[2] = CFSTR("PXPhotoKitPersonActionTypeBlock");
    v24[2] = objc_opt_class();
    v23[3] = CFSTR("PXPhotoKitPersonActionTypeRemove");
    v24[3] = objc_opt_class();
    v23[4] = CFSTR("PXPhotoKitPersonActionTypeMerge");
    v24[4] = objc_opt_class();
    v23[5] = CFSTR("PXPhotoKitPersonActionTypeMove");
    v24[5] = objc_opt_class();
    v23[6] = CFSTR("PXPhotoKitPersonActionTypeCopyInternalURL");
    v24[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
    v13 = objc_claimAutoreleasedReturnValue();
    performerClassByType = v5->_performerClassByType;
    v5->_performerClassByType = (NSDictionary *)v13;

    v15 = *(_QWORD *)off_1E50B7D70;
    v21[0] = *(_QWORD *)off_1E50B7D50;
    v21[1] = v15;
    v22[0] = CFSTR("PXPhotoKitPersonActionTypeFavorite");
    v22[1] = CFSTR("PXPhotoKitPersonActionTypeRemove");
    v16 = *(_QWORD *)off_1E50B7D40;
    v21[2] = *(_QWORD *)off_1E50B7D58;
    v21[3] = v16;
    v22[2] = CFSTR("PXPhotoKitPersonActionTypeMerge");
    v22[3] = CFSTR("PXPhotoKitPersonActionTypeAddContent");
    v21[4] = *(_QWORD *)off_1E50B7D68;
    v22[4] = CFSTR("PXPhotoKitPersonActionTypeMove");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v17 = objc_claimAutoreleasedReturnValue();
    personActionTypeByGenericType = v5->_personActionTypeByGenericType;
    v5->_personActionTypeByGenericType = (NSDictionary *)v17;

  }
  return v5;
}

- (PXPhotoKitPersonActionManager)initWithPerson:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PXPhotoKitPersonActionManager *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXPhotoKitPersonActionManager initWithPeople:](self, "initWithPeople:", v6, v9, v10);
  return v7;
}

- (PXPhotoKitPersonActionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 76, CFSTR("%s is not available as initializer"), "-[PXPhotoKitPersonActionManager init]");

  abort();
}

- (Class)_validatedPerformerClassForActionType:(id)a3 checkIfCanPerformAction:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  objc_class *v12;
  void *v14;
  void *v15;

  v4 = a4;
  v7 = a3;
  if (!v7)
    goto LABEL_7;
  -[PXPhotoKitPersonActionManager performerClassByType](self, "performerClassByType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v7);

  if ((objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[performerClass isSubclassOfClass:PXAssetCollectionActionPerformer.class]"));

  }
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9B0C08) & 1) != 0)
  {
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[performerClass conformsToProtocol:@protocol(PXPhotoKitPersonActionPerformer)]"));

    if (!v4)
      goto LABEL_8;
  }
  -[PXPhotoKitPersonActionManager people](self, "people");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "canPerformOn:", v10);

  if (!v11)
LABEL_7:
    v9 = 0;
LABEL_8:
  v12 = v9;

  return v12;
}

- (id)actionPerformerForActionType:(id)a3
{
  return -[PXPhotoKitPersonActionManager _actionPerformerForActionType:checkIfCanPerformAction:](self, "_actionPerformerForActionType:checkIfCanPerformAction:", a3, 1);
}

- (id)_actionPerformerForActionType:(id)a3 checkIfCanPerformAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  void *v13;
  PXDisplayTitleInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  _OWORD v19[2];

  v4 = a4;
  v6 = a3;
  v7 = -[PXPhotoKitPersonActionManager _validatedPerformerClassForActionType:checkIfCanPerformAction:](self, "_validatedPerformerClassForActionType:checkIfCanPerformAction:", v6, v4);
  v8 = (void *)MEMORY[0x1E0CD13B8];
  -[PXPhotoKitPersonActionManager photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc((Class)off_1E50B1668);
  v12 = *((_OWORD *)off_1E50B8778 + 1);
  v19[0] = *(_OWORD *)off_1E50B8778;
  v19[1] = v12;
  v13 = (void *)objc_msgSend(v11, "initWithAssetCollection:keyAssetReference:indexPath:", v10, 0, v19);
  v14 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:]([PXDisplayTitleInfo alloc], "initWithAssetCollection:useVerboseSmartDescription:", v10, 0);
  v15 = (void *)objc_msgSend([v7 alloc], "initWithActionType:assetCollectionReference:displayTitleInfo:", v6, v13, v14);

  -[PXActionManager performerDelegate](self, "performerDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v16);

  -[PXPhotoKitPersonActionManager people](self, "people");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPeople:", v17);

  return v15;
}

- (id)actionTypeForGenericType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitPersonActionManager personActionTypeByGenericType](self, "personActionTypeByGenericType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  objc_class *v43;
  void *v44;
  objc_class *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  SEL v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXPhotoKitPersonActionTypeMove")))
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PXPhotoKitPersonActionTypeAddContent")))
    {
      -[PXPhotoKitPersonActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v7);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_14:
        -[PXPhotoKitPersonActionManager people](self, "people");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fetchedObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXPhotoKitPersonActionManager _actionPerformerForActionType:checkIfCanPerformAction:](self, "_actionPerformerForActionType:checkIfCanPerformAction:", CFSTR("PXPhotoKitPersonActionTypeMerge"), 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[PXPhotoKitPersonActionManager photoLibrary](self, "photoLibrary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXPeopleUtilities peopleFetchResultFromFastEnumeration:photoLibrary:](PXPeopleUtilities, "peopleFetchResultFromFastEnumeration:photoLibrary:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPeople:", v22);

LABEL_32:
        v16 = v16;
        v27 = v16;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_descriptionForAssertionMessage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 162, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("parameters[PXActionParameterKeyContent]"), v40, v44);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 162, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("parameters[PXActionParameterKeyContent]"), v40);
    }

    goto LABEL_14;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 120, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("parameters[PXActionParameterKeySourceObjects]"), v31);
LABEL_36:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 120, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("parameters[PXActionParameterKeySourceObjects]"), v31, v33);

    goto LABEL_36;
  }
LABEL_4:
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitPersonActionManager.m"), 121, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("parameters[PXActionParameterKeyTargetObject]"), v36, v37);

    }
  }
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v12);

  if (!v14)
  {
    v52 = a2;
    if (v10)
    {
      v23 = objc_msgSend(v11, "type");
      if (v23 == objc_msgSend(v10, "type"))
      {
        v24 = objc_msgSend(v11, "manualOrder");
        if (v24 >= objc_msgSend(v10, "manualOrder"))
          v25 = 0;
        else
          v25 = -1;
      }
      else
      {
        v25 = 0;
      }
      v54 = objc_msgSend(v10, "manualOrder") + v25;
      v53 = objc_msgSend(v10, "type");
    }
    else
    {
      +[PXPeopleUtilities lastManuallySortedPersonInSectionOfType:](PXPeopleUtilities, "lastManuallySortedPersonInSectionOfType:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        +[PXPeopleUtilities lastManuallySortedPersonInSectionOfType:](PXPeopleUtilities, "lastManuallySortedPersonInSectionOfType:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", v52, self, CFSTR("PXPhotoKitPersonActionManager.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastPerson"));

        }
      }
      v54 = objc_msgSend(v26, "manualOrder") + 1;
      v53 = objc_msgSend(v26, "type");

    }
    -[PXPhotoKitPersonActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", v7);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_29:
        objc_msgSend(v16, "setSourcePeople:", v9);
        objc_msgSend(v16, "setDestinationManualOrder:", v54);
        objc_msgSend(v16, "setDestinationType:", v53);
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_descriptionForAssertionMessage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v46;
      v51 = (void *)v46;
      v41 = v50;
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", v52, self, CFSTR("PXPhotoKitPersonActionManager.m"), 156, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self actionPerformerForActionType:actionType]"), v48, v49);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v52, self, CFSTR("PXPhotoKitPersonActionManager.m"), 156, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self actionPerformerForActionType:actionType]"), v51);
    }

    goto LABEL_29;
  }
  PLUIGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v12;
    _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Not performing person reorder because the source and target people are the same: %@", buf, 0xCu);
  }

  v16 = 0;
LABEL_30:

  if ((v14 & 1) == 0)
    goto LABEL_32;
  v27 = 0;
LABEL_33:

  return v27;
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[PXPhotoKitPersonActionManager _validatedPerformerClassForActionType:checkIfCanPerformAction:](self, "_validatedPerformerClassForActionType:checkIfCanPerformAction:", a3, 0);
  -[PXPhotoKitPersonActionManager people](self, "people");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class localizedTitleForPerson:](v5, "localizedTitleForPerson:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)systemImageNameForActionType:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[PXPhotoKitPersonActionManager _validatedPerformerClassForActionType:checkIfCanPerformAction:](self, "_validatedPerformerClassForActionType:checkIfCanPerformAction:", a3, 0);
  -[PXPhotoKitPersonActionManager people](self, "people");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class systemImageNameForPerson:](v4, "systemImageNameForPerson:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  return -[objc_class isActionDestructive](-[PXPhotoKitPersonActionManager _validatedPerformerClassForActionType:checkIfCanPerformAction:](self, "_validatedPerformerClassForActionType:checkIfCanPerformAction:", a3, 0), "isActionDestructive");
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4))
    v5 = -[PXPhotoKitPersonActionManager _validatedPerformerClassForActionType:checkIfCanPerformAction:](self, "_validatedPerformerClassForActionType:checkIfCanPerformAction:", v4, 1) != 0;
  else
    v5 = 0;

  return v5;
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
  const __CFString *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("PXPhotoKitPersonActionTypeFavorite");
  v19[1] = CFSTR("PXPhotoKitPersonActionTypeCustomize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", v8);

  v18[0] = CFSTR("PXPhotoKitPersonActionTypeBlock");
  v18[1] = CFSTR("PXPhotoKitPersonActionTypeRemove");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
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

    v17 = CFSTR("PXPhotoKitPersonActionTypeCopyInternalURL");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v13, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXActionMenu menuWithTitle:childElements:](PXActionMenu, "menuWithTitle:childElements:", CFSTR(" Internal"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  return v5;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (NSDictionary)personActionTypeByGenericType
{
  return self->_personActionTypeByGenericType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personActionTypeByGenericType, 0);
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

@end
