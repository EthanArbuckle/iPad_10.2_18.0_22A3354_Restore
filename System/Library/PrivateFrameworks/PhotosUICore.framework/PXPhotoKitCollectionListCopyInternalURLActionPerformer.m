@implementation PXPhotoKitCollectionListCopyInternalURLActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  void *v3;
  char v4;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canShowInternalUI");

  return v4;
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return CFSTR("Copy URL");
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return CFSTR("link");
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_navigationURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURL:", v5);

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
