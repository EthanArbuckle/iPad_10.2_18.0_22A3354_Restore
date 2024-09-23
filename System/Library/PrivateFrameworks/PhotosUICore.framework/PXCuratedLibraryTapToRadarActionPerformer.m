@implementation PXCuratedLibraryTapToRadarActionPerformer

- (PXCuratedLibraryTapToRadarActionPerformer)initWithViewModel:(id)a3 assetCollectionReference:(id)a4 diagnosticLayout:(id)a5
{
  id v8;
  PXCuratedLibraryTapToRadarActionPerformer *v9;
  PXCuratedLibraryTapToRadarActionPerformer *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryTapToRadarActionPerformer;
  v9 = -[PXCuratedLibraryAssetCollectionActionPerformer initWithActionType:viewModel:assetCollectionReference:](&v12, sel_initWithActionType_viewModel_assetCollectionReference_, CFSTR("PXCuratedLibraryActionTapToRadar"), a3, a4);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_layoutForDiagnosticDescription, v8);

  return v10;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeFileRadar");
  return CFSTR("PXActivityTypeFileRadar");
}

- (id)activitySystemImageName
{
  return CFSTR("ant");
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryTapToRadarActionPerformer activityType](self, "activityType");
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  PXHighlightDiagnosticsViewController *v6;
  void *v7;
  PXHighlightDiagnosticsViewController *v8;
  _QWORD v9[5];
  PXHighlightDiagnosticsViewController *v10;

  -[PXCuratedLibraryTapToRadarActionPerformer layoutForDiagnosticDescription](self, "layoutForDiagnosticDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[PXHighlightDiagnosticsViewController initWithHighlight:]([PXHighlightDiagnosticsViewController alloc], "initWithHighlight:", v5);
    objc_msgSend(v3, "diagnosticDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedAssetCollectionDiagnosticsViewController setHostLayoutDiagnosticDescription:](v6, "setHostLayoutDiagnosticDescription:", v7);

    -[PXCuratedAssetCollectionDiagnosticsViewController setShouldPresentTapToRadar:](v6, "setShouldPresentTapToRadar:", 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PXCuratedLibraryTapToRadarActionPerformer_performUserInteractionTask__block_invoke;
    v9[3] = &unk_1E5148D08;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

- (PXGLayout)layoutForDiagnosticDescription
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layoutForDiagnosticDescription);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutForDiagnosticDescription);
}

uint64_t __71__PXCuratedLibraryTapToRadarActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
