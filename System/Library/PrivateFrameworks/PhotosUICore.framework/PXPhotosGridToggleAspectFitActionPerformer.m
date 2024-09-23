@implementation PXPhotosGridToggleAspectFitActionPerformer

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleAspectFit");
  return CFSTR("PXActivityTypeToggleAspectFit");
}

- (id)activitySystemImageName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "aspectFitContent"))
    v3 = CFSTR("rectangle.arrowtriangle.2.outward");
  else
    v3 = CFSTR("rectangle.arrowtriangle.2.inward");
  v4 = v3;

  return v4;
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
  v10.super_class = (Class)PXPhotosGridToggleAspectFitActionPerformer;
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
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridToggleAspectFitActionPerformer.m"), 33, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[super menuElement]"), v8, v9);

    }
  }
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "aspectFitContent");

  if (a3 - 1 >= 2)
  {
    if (a3)
    {
      v9 = 0;
      return v9;
    }
    v6 = CFSTR("PXLibraryAllPhotosToggleFullFrames");
    v7 = CFSTR("PXLibraryAllPhotosToggleSquares");
  }
  else
  {
    v6 = CFSTR("PXLibraryAllPhotosToggleFullFramesActionTitle");
    v7 = CFSTR("PXLibraryAllPhotosToggleSquaresActionTitle");
  }
  if (v5)
    v8 = (__CFString *)v7;
  else
    v8 = (__CFString *)v6;
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (id)barButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PXPhotosGridToggleAspectFitActionPerformer localizedTitleForUseCase:](self, "localizedTitleForUseCase:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 0, v6, a4);

  return v8;
}

- (void)performUserInteractionTask
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PXPhotosGridToggleAspectFitActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E513BB30;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performChanges:", v5);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

void __72__PXPhotosGridToggleAspectFitActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "aspectFitContent") ^ 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserWantsAspectFitContent:", v5);

}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  if (objc_msgSend(v4, "supportsAspectRatioToggle"))
  {
    objc_msgSend(v4, "currentDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsAnyItems");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
