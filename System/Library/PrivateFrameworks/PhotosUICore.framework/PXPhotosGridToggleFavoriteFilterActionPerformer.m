@implementation PXPhotosGridToggleFavoriteFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PXPhotosGridToggleFavoriteFilterActionPerformer;
  if (objc_msgSendSuper2(&v9, sel_canPerformActionType_withViewModel_, a3, v6))
    v7 = !+[PXPhotosGridToggleFilterActionPerformer isContentFilterHidden:viewModel:](PXPhotosGridToggleFilterActionPerformer, "isContentFilterHidden:viewModel:", 10, v6);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleFavoritesFilter");
  return CFSTR("PXActivityTypeToggleFavoritesFilter");
}

- (id)activitySystemImageName
{
  return CFSTR("heart");
}

- (int64_t)menuElementState
{
  void *v2;
  int64_t v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentFilterActive:", 10);

  return v3;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentFilterState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "favorite"))
      v5 = CFSTR("DISABLE_FAVORITES_FILTER_SHORTCUT");
    else
      v5 = CFSTR("ENABLE_FAVORITES_FILTER_SHORTCUT");
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXContentFilterTitleForItemTag(10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)performUserInteractionTask
{
  id v3;

  -[PXPhotosGridActionPerformer currentContentFilterState](self, "currentContentFilterState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFavorite:", objc_msgSend(v3, "favorite") ^ 1);
  -[PXPhotosGridToggleFilterActionPerformer updateToContentFilterStateAndFinishTask:](self, "updateToContentFilterStateAndFinishTask:", v3);

}

@end
