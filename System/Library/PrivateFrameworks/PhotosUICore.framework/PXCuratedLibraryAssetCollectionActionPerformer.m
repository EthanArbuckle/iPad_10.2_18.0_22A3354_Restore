@implementation PXCuratedLibraryAssetCollectionActionPerformer

- (PXCuratedLibraryAssetCollectionActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 assetCollectionReference:(id)a5
{
  id v9;
  PXCuratedLibraryAssetCollectionActionPerformer *v10;
  PXCuratedLibraryAssetCollectionActionPerformer *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryAssetCollectionActionPerformer;
  v10 = -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v13, sel_initWithActionType_viewModel_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_assetCollectionReference, a5);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
}

- (PXCuratedLibraryAssetCollectionActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetCollectionActionPerformer.m"), 48, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryAssetCollectionActionPerformer initWithActionType:viewModel:]");

  abort();
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[PXActionPerformer actionType](self, "actionType", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PXCuratedLibraryActionTitle(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXCuratedLibraryAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer actionType](self, "actionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PXCuratedLibraryActionSelectAllToggle"));

  if (!v8)
  {

LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)PXCuratedLibraryAssetCollectionActionPerformer;
    -[PXCuratedLibraryActionPerformer performActionWithCompletionHandler:](&v9, sel_performActionWithCompletionHandler_, v4);
    goto LABEL_7;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__PXCuratedLibraryAssetCollectionActionPerformer_performActionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5143468;
  v11 = v5;
  objc_msgSend(v6, "performChanges:", v10);

  if (v4)
    v4[2](v4, 1, 0);
LABEL_7:

}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

uint64_t __85__PXCuratedLibraryAssetCollectionActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleSelectionForAssetCollectionReference:", *(_QWORD *)(a1 + 32));
}

@end
