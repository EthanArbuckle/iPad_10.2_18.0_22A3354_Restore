@implementation PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer

- (PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionToggleSharedLibraryBadge"), a3);
}

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
  v10.super_class = (Class)PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer;
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
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer.m"), 35, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[super menuElement]"), v8, v9);

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

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSharedLibraryBadgeEnabled");

  return v4;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_ToggleBadge"));
}

- (void)performUserInteractionTask
{
  void *v3;
  id v4;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryFilterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSharedLibraryBadgeEnabled:", objc_msgSend(v4, "isSharedLibraryBadgeEnabled") ^ 1);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

@end
