@implementation PXCuratedLibraryActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXCuratedLibraryActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  id v7;
  PXCuratedLibraryActionPerformer *v8;
  PXCuratedLibraryActionPerformer *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryActionPerformer;
  v8 = -[PXActionPerformer initWithActionType:](&v11, sel_initWithActionType_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a4);
    v9->_actionZoomLevel = objc_msgSend(v7, "zoomLevel");
  }

  return v9;
}

- (PXCuratedLibraryActionPerformer)initWithActionType:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 450, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryActionPerformer initWithActionType:]");

  abort();
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[PXActionPerformer actionType](self, "actionType", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PXCuratedLibraryActionTitle(v4, v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityType
{
  void *v4;
  __CFString **v5;
  __CFString *v6;
  void *v8;

  -[PXActionPerformer actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn")) & 1) != 0)
  {
    v5 = PXActivityTypeZoomIn;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomOut")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 466, CFSTR("Unknown action type \"%@\"), v4);

      abort();
    }
    v5 = PXActivityTypeZoomOut;
  }
  v6 = *v5;

  return v6;
}

- (id)activitySystemImageName
{
  void *v4;
  void *v5;
  char v6;
  const __CFString *v7;
  void *v8;
  char v9;
  void *v11;

  -[PXActionPerformer actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer actionType](self, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn"));

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("plus.magnifyingglass");
  }
  else
  {
    -[PXActionPerformer actionType](self, "actionType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomOut"));

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 478, CFSTR("Unknown action type \"%@\"), v4);

      abort();
    }
    v7 = CFSTR("minus.magnifyingglass");
  }

  return (id)v7;
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryActionPerformer activityType](self, "activityType");
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXStringEqualToString(activity.activityType, self.activityType)"));
LABEL_5:

  }
  return 1;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  objc_super v20;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer actionType](self, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PXCuratedLibraryActionEnterSelectMode"));

  if (v7)
  {
    v8 = &__block_literal_global_339;
    goto LABEL_5;
  }
  -[PXActionPerformer actionType](self, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PXCuratedLibraryActionCancelSelectMode"));

  if (v10)
  {
    v8 = &__block_literal_global_340;
    goto LABEL_5;
  }
  -[PXActionPerformer actionType](self, "actionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn"));

  if (v12)
  {
    objc_msgSend(v5, "zoomablePhotosViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = &__block_literal_global_342;
    goto LABEL_12;
  }
  -[PXActionPerformer actionType](self, "actionType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomOut"));

  if (v17)
  {
    objc_msgSend(v5, "zoomablePhotosViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = &__block_literal_global_343;
LABEL_12:
    objc_msgSend(v13, "performChanges:", v15);

    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  -[PXActionPerformer actionType](self, "actionType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("PXCuratedLibraryActionShowSidebar"));

  if (!v19)
  {
    v20.receiver = self;
    v20.super_class = (Class)PXCuratedLibraryActionPerformer;
    -[PXActionPerformer performActionWithCompletionHandler:](&v20, sel_performActionWithCompletionHandler_, v4);
    goto LABEL_7;
  }
  v8 = &__block_literal_global_344_95016;
LABEL_5:
  objc_msgSend(v5, "performChanges:", v8);
  if (v4)
LABEL_6:
    v4[2](v4, 1, 0);
LABEL_7:

}

- (BOOL)keepMenuPresented
{
  void *v2;
  char v3;

  -[PXActionPerformer actionType](self, "actionType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomIn")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("PXCuratedLibraryActionAllPhotosZoomOut"));

  return v3;
}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)actionZoomLevel
{
  return self->_actionZoomLevel;
}

uint64_t __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsSidebarVisible:", 1);
}

void __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "zoomState");
    v4 = *((_QWORD *)&v7 + 1) + 1;
  }
  else
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v4 = 1;
    v5 = 0u;
    v6 = 0u;
  }
  objc_msgSend(v3, "zoomToColumnIndex:withAnchorAssetReference:animated:", v4, 0, 1, v5, v6, v7, v8, v9, v10, v11);

}

void __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "zoomState");
    v4 = *((_QWORD *)&v7 + 1) - 1;
  }
  else
  {
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v4 = -1;
    v5 = 0u;
    v6 = 0u;
  }
  objc_msgSend(v3, "zoomToColumnIndex:withAnchorAssetReference:animated:", v4, 0, 1, v5, v6, v7, v8, v9, v10, v11);

}

uint64_t __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 0);
}

uint64_t __70__PXCuratedLibraryActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsSelecting:", 1);
}

@end
