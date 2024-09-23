@implementation PXCuratedLibraryToggleAspectFitActionPerformer

- (PXCuratedLibraryToggleAspectFitActionPerformer)initWithViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleAspectFitActionPerformer;
  return -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v4, sel_initWithActionType_viewModel_, CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit"), a3);
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleAspectFit");
  return CFSTR("PXActivityTypeToggleAspectFit");
}

- (id)activitySystemImageName
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomablePhotosViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "aspectFit"))
    v4 = CFSTR("rectangle.arrowtriangle.2.outward");
  else
    v4 = CFSTR("rectangle.arrowtriangle.2.inward");
  v5 = v4;

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryToggleAspectFitActionPerformer activityType](self, "activityType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryToggleAspectFitActionPerformer.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  return 1;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
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

- (void)performActionWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  _QWORD v6[5];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PXCuratedLibraryToggleAspectFitActionPerformer_performActionWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5143468;
  v6[4] = self;
  objc_msgSend(v5, "performChanges:", v6);

  if (v4)
    v4[2](v4, 1, 0);

}

void __85__PXCuratedLibraryToggleAspectFitActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v6, "aspectFitContent") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserWantsAspectFitContent:", v5);

}

@end
