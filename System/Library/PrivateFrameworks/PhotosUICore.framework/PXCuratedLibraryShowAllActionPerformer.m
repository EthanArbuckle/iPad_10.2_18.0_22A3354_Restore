@implementation PXCuratedLibraryShowAllActionPerformer

- (void)setLayout:(id)a3
{
  objc_storeWeak((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
}

- (void)performActionWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  PXCuratedLibraryShowAllActionPerformer *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *))a3;
  -[PXCuratedLibraryShowAllActionPerformer layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spriteReferenceForObjectReference:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "zoomLevelInDirection:fromZoomLevel:", 1, -[PXCuratedLibraryActionPerformer actionZoomLevel](self, "actionZoomLevel"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v7)
    {
      v11 = CFSTR("missing showAllButtonSpriteReference");
      goto LABEL_10;
    }
    if ((unint64_t)(v9 - 5) > 0xFFFFFFFFFFFFFFFBLL)
    {
      objc_msgSend(v6, "clearLastVisibleAreaAnchoringInformation");
      objc_msgSend(v6, "setLastHitSpriteReference:", v7);
      -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__PXCuratedLibraryShowAllActionPerformer_performActionWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E5127DD0;
      v18 = v15;
      v19 = v9;
      v16 = v15;
      objc_msgSend(v16, "performChanges:", v17);

      v11 = 0;
      v13 = 0;
      v14 = 1;
      if (!v4)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected nextZoomLevel %li"), v9);
  }
  else
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected libraryLayout %@"), v6);
  }
  if (v10)
    v11 = (__CFString *)v10;
  else
    v11 = CFSTR("unknown reason");
LABEL_10:
  PLCuratedLibraryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "%@ didn't perform because of %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCuratedLibraryErrorDomain"), 1, CFSTR("%@ didn't perform because of %@"), self, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v4)
LABEL_13:
    v4[2](v4, v14, v13);
LABEL_14:

}

- (PXGLayout)layout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

void __77__PXCuratedLibraryShowAllActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 40) == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "zoomablePhotosViewModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performChanges:", &__block_literal_global_112944);

  }
}

uint64_t __77__PXCuratedLibraryShowAllActionPerformer_performActionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetColumns");
}

@end
