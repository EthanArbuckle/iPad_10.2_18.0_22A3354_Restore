@implementation PXPhotosGridZoomOutActionPerformer

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeZoomOut");
  return CFSTR("PXActivityTypeZoomOut");
}

- (id)activitySystemImageName
{
  return CFSTR("minus.magnifyingglass");
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
  v10.super_class = (Class)PXPhotosGridZoomOutActionPerformer;
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
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridZoomOutActionPerformer.m"), 35, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[super menuElement]"), v8, v9);

    }
  }
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXLibraryAllPhotosZoomOut"), CFSTR("PhotosUICore"));
}

- (void)performUserInteractionTask
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomStep");
  v5 = (uint64_t)(v4 + 1.0);
  if (v5 < 0 || objc_msgSend(v3, "numberOfZoomSteps") <= v5)
  {
    PLGridZeroGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Action tried to zoom out, but that's no longer possible.", v8, 2u);
    }

    v6 = 0;
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PXPhotosGridZoomOutActionPerformer_performUserInteractionTask__block_invoke;
    v9[3] = &__block_descriptor_40_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v9[4] = v5;
    objc_msgSend(v3, "performChanges:", v9);
    v6 = 1;
  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v6, 0);

}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

uint64_t __64__PXPhotosGridZoomOutActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomStep:isInteractive:shouldAnimate:anchorAssetReference:", 0, 1, 0, (double)*(uint64_t *)(a1 + 32));
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4;
  void *v5;
  int v6;
  double v7;
  BOOL v8;

  v4 = a4;
  if (objc_msgSend(v4, "supportsZooming")
    && (objc_msgSend(v4, "currentDataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsAnyItems"),
        v5,
        v6))
  {
    objc_msgSend(v4, "zoomStep");
    v8 = v7 + 1.0 < (double)objc_msgSend(v4, "numberOfZoomSteps");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
