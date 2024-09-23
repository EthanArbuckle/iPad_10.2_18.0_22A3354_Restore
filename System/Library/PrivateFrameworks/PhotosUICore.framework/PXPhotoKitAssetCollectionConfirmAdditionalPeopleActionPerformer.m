@implementation PXPhotoKitAssetCollectionConfirmAdditionalPeopleActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  void *v5;
  BOOL v6;

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
  v6 = objc_msgSend(v5, "count") == 1;

  return v6;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeConfirmAdditionalPeople"), a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;

  v9 = a4;
  v10 = a5;
  if (a3 - 1 >= 2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionConfirmAdditionalPeopleActionPerformer.m"), 53, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v11 = 0;
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmAdditionalPhotosActionTitle"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("rectangle.stack.badge.person.crop");
}

- (void)performUserInteractionTask
{
  void *v3;
  PXPeopleSplitConfirmationViewController *v4;
  void *v5;
  id v6;

  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v4 = -[PXPeopleSplitConfirmationViewController initWithPerson:]([PXPeopleSplitConfirmationViewController alloc], "initWithPerson:", v6);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
    -[PXActionPerformer presentViewController:](self, "presentViewController:", v5);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

  }
}

@end
