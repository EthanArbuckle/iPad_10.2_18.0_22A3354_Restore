@implementation PXCuratedLibraryToggleVideoFilterActionPerformer

- (PXCuratedLibraryToggleVideoFilterActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleVideoFilterActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionToggleVideoFilter"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleVideosFilter");
  return CFSTR("PXActivityTypeToggleVideosFilter");
}

- (id)activitySystemImageName
{
  return CFSTR("video");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 8);

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  if (a3 == 1)
  {
    -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allPhotosContentFilterState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryToggleVideoFilterActionPerformer.m"), 42, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.viewModel.allPhotosContentFilterState"), v12, v13);

      }
    }
    if (objc_msgSend(v6, "video"))
      v7 = CFSTR("DISABLE_VIDEOS_FILTER_SHORTCUT");
    else
      v7 = CFSTR("ENABLE_VIDEOS_FILTER_SHORTCUT");
    PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXContentFilterTitleForItemTag(8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)performUserInteractionTask
{
  id v3;

  -[PXCuratedLibraryToggleFilterActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVideo:", objc_msgSend(v3, "video") ^ 1);
  -[PXCuratedLibraryToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v3);

}

@end
