@implementation PXPhotoKitAssetCollectionFavoritePersonActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PXPeopleUtilities isPersonHiddenFromPeopleHome:](PXPeopleUtilities, "isPersonHiddenFromPeopleHome:", v3);

  return !v4;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v3 = a3;
  objc_msgSend(v3, "px_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(v3, "type");
  if (v5)
  {
    if (v6 == 1)
      v7 = CFSTR("PXPeopleUnfavoriteThisPersonNamed");
    else
      v7 = CFSTR("PXPeopleFavoriteThisPersonNamed");
    PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v6 == 1)
      v10 = CFSTR("PXPeopleUnfavoriteThisPersonNoName");
    else
      v10 = CFSTR("PXPeopleFavoriteThisPersonNoName");
    PXLocalizedStringForPersonOrPetAndVisibility(v3, 0, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)systemImageNameForPerson:(id)a3
{
  if (objc_msgSend(a3, "type") == 1)
    return CFSTR("heart.slash");
  else
    return CFSTR("heart");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "people");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count") == 1)
    v7 = objc_msgSend(a1, "canPerformOn:", v6);
  else
    v7 = 0;

  return v7;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeFavoritePerson"), a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "people");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionFavoritePersonActionPerformer.m"), 75, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(a1, "localizedTitleForPerson:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "people", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "systemImageNameForPerson:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  PXChangePeopleTypeAction *v15;
  void *v16;
  PXChangePeopleTypeAction *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities personWithLocalIdentifier:](PXPeopleUtilities, "personWithLocalIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[PXPeopleUtilities shouldShowBootstrapForPerson:](PXPeopleUtilities, "shouldShowBootstrapForPerson:", v6)&& objc_msgSend(v6, "type") != 1)
    {
      +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "processName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/PXDisplay Adoption/PhotoKit/Actions/Asset Collection Action Performers/People/PXPhotoKitAssetCollectionFavoritePersonActionPerformer.m"), "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v10, v11, "-[PXPhotoKitAssetCollectionFavoritePersonActionPerformer performUserInteractionTask]", 94);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCallerInfo:", v12);

      +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[PXActionPerformer presentViewController:](self, "presentViewController:", v13);
        -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

LABEL_8:
        return;
      }

    }
    objc_initWeak(&location, self);
    v14 = objc_msgSend(v6, "type") != 1;
    v15 = [PXChangePeopleTypeAction alloc];
    v22[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXChangePeopleTypeAction initWithPeople:type:](v15, "initWithPeople:type:", v16, v14);

    -[PXActionPerformer undoManager](self, "undoManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__PXPhotoKitAssetCollectionFavoritePersonActionPerformer_performUserInteractionTask__block_invoke;
    v19[3] = &unk_1E5144F70;
    objc_copyWeak(&v20, &location);
    -[PXAction executeWithUndoManager:completionHandler:](v17, "executeWithUndoManager:completionHandler:", v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
}

void __84__PXPhotoKitAssetCollectionFavoritePersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, v5);

}

@end
