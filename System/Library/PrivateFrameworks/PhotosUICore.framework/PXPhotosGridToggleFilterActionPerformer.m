@implementation PXPhotosGridToggleFilterActionPerformer

- (id)menuElement
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXPhotosGridToggleFilterActionPerformer;
  -[PXActionPerformer menuElement](&v11, sel_menuElement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridToggleFilterActionPerformer.m"), 45, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[super menuElement]"), v9, v10);

    }
  }
  -[PXActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (void)finishedUserInteractionTask
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (BOOL)updateToLibraryFilterStateAndFinishTask:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXActionPerformer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  if ((v6 & 1) != 0)
    objc_msgSend(v5, "photosGridActionPerformer:libraryFilterStateChanged:", self, v4);
  -[PXPhotosGridToggleFilterActionPerformer finishedUserInteractionTask](self, "finishedUserInteractionTask");

  return v6 & 1;
}

- (BOOL)updateToContentFilterStateAndFinishTask:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXActionPerformer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();
  if ((v6 & 1) != 0)
    objc_msgSend(v5, "photosGridActionPerformer:contentFilterStateChanged:", self, v4);
  -[PXPhotosGridToggleFilterActionPerformer finishedUserInteractionTask](self, "finishedUserInteractionTask");

  return v6 & 1;
}

+ (BOOL)isLibaryFilterHidden:(int64_t)a3 viewModel:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v5 = a4;
  if (objc_msgSend(v5, "allowsSwitchLibraryAction")
    && (objc_msgSend(v5, "sharedLibraryStatusProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasSharedLibraryOrPreview"),
        v6,
        v7))
  {
    objc_msgSend(v5, "dataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "libraryFilterState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLibraryFilterHiddenTypesForAssetCollection(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (BOOL)isContentFilterHidden:(int64_t)a3 viewModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "libraryFilterState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PXContentFilterHiddenTypesForAssetCollection(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "containsObject:", v11);

  return (char)v9;
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return objc_msgSend(a4, "canFilterContent", a3);
}

@end
