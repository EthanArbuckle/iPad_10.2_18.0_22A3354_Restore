@implementation PXCuratedLibraryToggleFilterActionPerformer

- (PXContentFilterState)currentContentFilterState
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allPhotosContentFilterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryToggleFilterActionPerformer.m"), 30, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.viewModel.allPhotosContentFilterState"), v14, v15);

    }
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:](PXContentFilterState, "defaultAllPhotosFilterStateForPhotoLibrary:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (PXContentFilterState *)v8;
}

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
  v11.super_class = (Class)PXCuratedLibraryToggleFilterActionPerformer;
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
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryToggleFilterActionPerformer.m"), 37, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[super menuElement]"), v9, v10);

    }
  }
  -[PXCuratedLibraryActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  return v4;
}

- (void)finishedUserInteractionTask
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
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
    objc_msgSend(v5, "curatedLibraryActionPerformer:libraryFilterStateChanged:", self, v4);
  -[PXCuratedLibraryToggleFilterActionPerformer finishedUserInteractionTask](self, "finishedUserInteractionTask");

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
    objc_msgSend(v5, "curatedLibraryActionPerformer:contentFilterStateChanged:", self, v4);
  -[PXCuratedLibraryToggleFilterActionPerformer finishedUserInteractionTask](self, "finishedUserInteractionTask");

  return v6 & 1;
}

@end
