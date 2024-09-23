@implementation PXPhotosGridUnfilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PXPhotosGridUnfilterActionPerformer;
  if (objc_msgSendSuper2(&v9, sel_canPerformActionType_withViewModel_, a3, v6))
    v7 = !+[PXPhotosGridToggleFilterActionPerformer isContentFilterHidden:viewModel:](PXPhotosGridToggleFilterActionPerformer, "isContentFilterHidden:viewModel:", 1, v6);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeUnfilter");
  return CFSTR("PXActivityTypeUnfilter");
}

- (id)activitySystemImageName
{
  return CFSTR("square.grid.3x3");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 1);

  return v3;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXContentFilterTitleForItemTag(1);
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:](PXContentFilterState, "defaultFilterStateForContainerCollection:photoLibrary:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosGridToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v8);
}

@end
