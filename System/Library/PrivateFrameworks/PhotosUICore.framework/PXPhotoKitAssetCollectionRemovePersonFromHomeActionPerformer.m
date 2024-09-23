@implementation PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer

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
  void *v5;
  void *v6;
  void *v7;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "px_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PXLocalizedStringForPeople(v5, CFSTR("PXPeopleRemoveFromHomeTitleNamed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    PXLocalizedStringForPeople(v5, CFSTR("PXPeopleRemoveFromHomeTitleNoName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)systemImageNameForPerson:(id)a3
{
  return CFSTR("eye.slash");
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
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeRemovePersonFromHome"), a5);
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
  v11 = v10;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer.m"), 64, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v13 = 0;
  }
  else
  {
    PXFirstPersonFromAssetCollectionActionPerformerInput(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedTitleForPerson:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v5;
  void *v6;

  PXFirstPersonFromAssetCollectionActionPerformerInput(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "systemImageNameForPerson:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer_performUserInteractionTask__block_invoke;
  v6[3] = &unk_1E5144F70;
  objc_copyWeak(&v7, &location);
  +[PXPeopleRemovalUtilities presentAlertFor:totalNumberOfPeople:presentationEnvironment:undoManager:sourceItem:completion:](PXPeopleRemovalUtilities, "presentAlertFor:totalNumberOfPeople:presentationEnvironment:undoManager:sourceItem:completion:", v3, 0, v4, v5, 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __90__PXPhotoKitAssetCollectionRemovePersonFromHomeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
