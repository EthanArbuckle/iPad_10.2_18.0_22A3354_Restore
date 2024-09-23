@implementation PXPhotoKitRenamePersonActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  return PXLocalizedStringForPersonOrPetAndVisibility(a3, 0, CFSTR("PXPeopleTagWithNewName"));
}

+ (id)systemImageNameForPerson:(id)a3
{
  return CFSTR("pencil");
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  PXPhotoKitRenamePersonActionPerformer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  PXPhotoKitRenamePersonActionPerformer *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v4, 1);
    v5 = (PXPhotoKitRenamePersonActionPerformer *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/PXDisplay Adoption/PhotoKit/Actions/Asset Collection Action Performers/People/PXPhotoKitRenamePersonActionPerformer.m"), "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v8, v9, "-[PXPhotoKitRenamePersonActionPerformer performUserInteractionTask]", 42);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitRenamePersonActionPerformer setCallerInfo:](v5, "setCallerInfo:", v10);

    -[PXPhotoKitRenamePersonActionPerformer setSourcePerson:](v5, "setSourcePerson:", v4);
    +[PXPeopleUtilities bootstrapViewControllerForContext:delegate:](PXPeopleUtilities, "bootstrapViewControllerForContext:delegate:", v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
      -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __67__PXPhotoKitRenamePersonActionPerformer_performUserInteractionTask__block_invoke;
      v16[3] = &unk_1E5149198;
      v16[4] = self;
      objc_msgSend(v13, "presentViewController:animated:completionHandler:", v12, 1, v16);

    }
    else
    {
      PLUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Unable to get a bootstrap view controller for %@", buf, 0xCu);
      }

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "No person available for %@", buf, 0xCu);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

uint64_t __67__PXPhotoKitRenamePersonActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
