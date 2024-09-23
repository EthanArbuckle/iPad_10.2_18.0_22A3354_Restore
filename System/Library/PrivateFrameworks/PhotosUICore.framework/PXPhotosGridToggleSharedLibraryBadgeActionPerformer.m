@implementation PXPhotosGridToggleSharedLibraryBadgeActionPerformer

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleSharedLibraryBadge");
  return CFSTR("PXActivityTypeToggleSharedLibraryBadge");
}

- (id)activitySystemImageName
{
  return CFSTR("person.2");
}

- (id)menuElement
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPhotosGridToggleSharedLibraryBadgeActionPerformer;
  -[PXActionPerformer menuElement](&v10, sel_menuElement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridToggleSharedLibraryBadgeActionPerformer.m"), 44, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[super menuElement]"), v8, v9);

    }
  }
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (int64_t)menuElementState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedLibraryBadgeEnabled");

  return v4;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_ToggleBadge"));
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryFilterState");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSharedLibraryBadgeEnabled:", objc_msgSend(v5, "isSharedLibraryBadgeEnabled") ^ 1);
  -[PXActionPerformer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "photosGridActionPerformer:libraryFilterStateChanged:", self, v5);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a4;
  objc_msgSend(v4, "sharedLibraryStatusProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSharedLibraryOrPreview");

  if (v6)
  {
    objc_msgSend(v4, "dataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "px_isSharedAlbum") ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

@end
