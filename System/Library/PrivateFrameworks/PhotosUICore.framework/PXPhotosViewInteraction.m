@implementation PXPhotosViewInteraction

- (PXPhotosViewInteraction)initWithViewModel:(id)a3
{
  id v5;
  PXPhotosViewInteraction *v6;
  PXPhotosViewInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosViewInteraction;
  v6 = -[PXPhotosViewInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewModel, a3);

  return v7;
}

- (void)setZoomablePhotosInteraction:(id)a3
{
  PXZoomablePhotosInteraction *v5;
  void *v6;
  PXZoomablePhotosInteraction *v7;
  char v8;
  PXZoomablePhotosInteraction *v9;

  v9 = (PXZoomablePhotosInteraction *)a3;
  v5 = self->_zoomablePhotosInteraction;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_4;
  v7 = v5;
  v8 = -[PXZoomablePhotosInteraction isEqual:](v5, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    -[PXZoomablePhotosInteraction setDelegate:](self->_zoomablePhotosInteraction, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_zoomablePhotosInteraction, a3);
    -[PXZoomablePhotosInteraction setDelegate:](v9, "setDelegate:", self);
    -[PXGInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosInteraction setView:](v9, "setView:", v6);
LABEL_4:

  }
}

- (id)assetHitTestResultAtPoint:(CGPoint)a3 coordinateSpace:(id)a4
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[PXGInteraction view](self, "view", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hitTestResultsAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXFind();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)assetReferenceAtLocation:(CGPoint)a3 withPadding:(UIEdgeInsets)a4 inCoordinateSpace:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double y;
  double x;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  y = a3.y;
  x = a3.x;
  v12 = a5;
  -[PXGInteraction view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertPoint:fromCoordinateSpace:", v12, x, y);
  v15 = v14;
  v17 = v16;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__190896;
  v27 = __Block_byref_object_dispose__190897;
  v28 = 0;
  -[PXGInteraction view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hitTestResultsAtPoint:padding:passingTest:", 0, v15, v17, top, left, bottom, right);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__PXPhotosViewInteraction_assetReferenceAtLocation_withPadding_inCoordinateSpace___block_invoke;
  v22[3] = &unk_1E5133CA0;
  v22[4] = &v23;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v22);

  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 fallbackMediaProvider:(id)a5 shouldSnapshot:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a3;
  -[PXGInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGInteraction layout](self, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PXRegionOfInterestForAssetReference(v11, v12, v10, (uint64_t *)a4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)zoomablePhotosInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)zoomablePhotosInteractionWillBegin:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[PXPhotosViewInteraction viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSourceManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areAllSectionsConsideredAccurate");

  if ((v5 & 1) == 0)
    objc_msgSend(v6, "performChanges:", &__block_literal_global_3_190895);

}

- (id)zoomablePhotosInteraction:(id)a3 assetReferenceAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  -[PXGInteraction view](self, "view", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosViewInteraction assetHitTestResultAtPoint:coordinateSpace:](self, "assetHitTestResultAtPoint:coordinateSpace:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosViewInteractionDelegate)delegate
{
  return (PXPhotosViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXPhotosContentController)contentController
{
  return (PXPhotosContentController *)objc_loadWeakRetained((id *)&self->_contentController);
}

- (void)setContentController:(id)a3
{
  objc_storeWeak((id *)&self->_contentController, a3);
}

- (PXZoomablePhotosInteraction)zoomablePhotosInteraction
{
  return self->_zoomablePhotosInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomablePhotosInteraction, 0);
  objc_destroyWeak((id *)&self->_contentController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __62__PXPhotosViewInteraction_zoomablePhotosInteractionWillBegin___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceAccurateAllSectionsIfNeeded");
}

void __82__PXPhotosViewInteraction_assetReferenceAtLocation_withPadding_inCoordinateSpace___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  __CFString *v6;
  __CFString *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("PXPhotosLayoutHitTestIdentifierAsset");
  if (v6 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
  {

  }
  else
  {
    v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

    v9 = v13;
    if (!v8)
      goto LABEL_6;
  }
  objc_msgSend(v13, "userData");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v9 = v13;
  *a4 = 1;
LABEL_6:

}

uint64_t __69__PXPhotosViewInteraction_assetHitTestResultAtPoint_coordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("PXPhotosLayoutHitTestIdentifierAsset"))
    v4 = 1;
  else
    v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("PXPhotosLayoutHitTestIdentifierAsset"));

  return v4;
}

+ (PXPhotosViewInteraction)interactionWithViewModel:(id)a3
{
  id v3;
  PXPhotosViewUIInteraction *v4;

  v3 = a3;
  v4 = -[PXPhotosViewInteraction initWithViewModel:]([PXPhotosViewUIInteraction alloc], "initWithViewModel:", v3);

  return (PXPhotosViewInteraction *)v4;
}

@end
