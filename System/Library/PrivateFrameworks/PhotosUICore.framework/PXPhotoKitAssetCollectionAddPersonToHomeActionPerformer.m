@implementation PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "people");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PXPeopleUtilities isPersonHiddenFromPeopleHome:](PXPeopleUtilities, "isPersonHiddenFromPeopleHome:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeAddPersonToHome"), a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;

  v9 = a4;
  v10 = a5;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer.m"), 62, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v12 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "people");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer.m"), 45, CFSTR("Person is nil"));

    }
    objc_msgSend(v13, "px_localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "px_peoplePetsHomeVisibility");

    if (objc_msgSend(v13, "px_isHuman"))
    {
      v17 = v16 | 1;
    }
    else if (objc_msgSend(v13, "px_isPet"))
    {
      v17 = v16 | 2;
    }
    else
    {
      v17 = v16;
    }
    if (objc_msgSend(v14, "length"))
      PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleAddToHomeTitleNamed"));
    else
      PXLocalizedStringForPersonOrPetAndVisibility(v13, 0, CFSTR("PXPeopleAddToHomeTitleNoName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringForPeoplePetsHomeTitle(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("rectangle.stack.badge.plus");
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
  PXChangePeopleTypeAction *v14;
  void *v15;
  PXChangePeopleTypeAction *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
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

    if (+[PXPeopleUtilities shouldShowBootstrapForPerson:](PXPeopleUtilities, "shouldShowBootstrapForPerson:", v6))
    {
      +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v6, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "processName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/PXDisplay Adoption/PhotoKit/Actions/Asset Collection Action Performers/People/PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer.m"), "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v10, v11, "-[PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer performUserInteractionTask]", 80);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCallerInfo:", v12);

      +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[PXActionPerformer presentViewController:](self, "presentViewController:", v13);
        -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

LABEL_7:
        return;
      }

    }
    objc_initWeak(&location, self);
    v14 = [PXChangePeopleTypeAction alloc];
    v21[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXChangePeopleTypeAction initWithPeople:type:](v14, "initWithPeople:type:", v15, 0);

    -[PXActionPerformer undoManager](self, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer_performUserInteractionTask__block_invoke;
    v18[3] = &unk_1E5144F70;
    objc_copyWeak(&v19, &location);
    -[PXAction executeWithUndoManager:completionHandler:](v16, "executeWithUndoManager:completionHandler:", v17, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
}

void __85__PXPhotoKitAssetCollectionAddPersonToHomeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
