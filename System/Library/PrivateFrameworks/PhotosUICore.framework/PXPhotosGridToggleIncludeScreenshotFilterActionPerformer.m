@implementation PXPhotosGridToggleIncludeScreenshotFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleIncludeScreenshotFilterActionPerformer;
  v5 = a4;
  v6 = objc_msgSendSuper2(&v10, sel_canPerformActionType_withViewModel_, a3, v5);
  objc_msgSend(v5, "currentDataSource", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v6 = objc_msgSend(v8, "px_isMediaTypeSmartAlbum") ^ 1;

  return v6;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleIncludeScreenshotsFilter");
  return CFSTR("PXActivityTypeToggleIncludeScreenshotsFilter");
}

- (id)activitySystemImageName
{
  return CFSTR("camera.viewfinder");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 2);

  return v3;
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
    -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentFilterState");
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
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridToggleIncludeScreenshotFilterActionPerformer.m"), 45, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.viewModel.contentFilterState"), v12, v13);

      }
    }
    if (objc_msgSend(v6, "includeScreenshots"))
      v7 = CFSTR("DISABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT");
    else
      v7 = CFSTR("ENABLE_INCLUDE_SCREENSHOTS_FILTER_SHORTCUT");
    PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXContentFilterTitleForItemTag(2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)performUserInteractionTask
{
  id v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeScreenshots:", objc_msgSend(v3, "includeScreenshots") ^ 1);
  -[PXPhotosGridToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v3);

}

@end
