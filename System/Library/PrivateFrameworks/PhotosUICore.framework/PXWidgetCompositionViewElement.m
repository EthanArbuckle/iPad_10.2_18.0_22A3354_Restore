@implementation PXWidgetCompositionViewElement

- (id)contentTilingController
{
  -[PXWidgetCompositionViewElement _loadTilingController](self, "_loadTilingController");
  return -[PXWidgetCompositionViewElement _tilingController](self, "_tilingController");
}

- (void)saveAnchoring
{
  id v3;

  -[PXWidgetCompositionViewElement _layout](self, "_layout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRect");
  PXRectGetCenter();
  -[PXWidgetCompositionViewElement _anchorPoint](self, "_anchorPoint");
  PXPointSubtract();
  -[PXWidgetCompositionViewElement _setAnchorOffset:](self, "_setAnchorOffset:");

}

- (void)_loadTilingController
{
  PXBasicTileAnimator *v3;
  PXBasicTileAnimator *tileAnimator;
  NSMutableSet *v5;
  NSMutableSet *tilesInUse;
  PXWidgetCompositionViewElementLayout *v7;
  PXWidgetCompositionViewElementLayout *layout;
  PXTilingController *v9;
  PXTilingController *tilingController;
  PXTilingController *v11;
  void *v12;

  if (!self->__tilingController)
  {
    -[PXWidgetCompositionViewElement createTileAnimator](self, "createTileAnimator");
    v3 = (PXBasicTileAnimator *)objc_claimAutoreleasedReturnValue();
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    tilesInUse = self->__tilesInUse;
    self->__tilesInUse = v5;

    v7 = objc_alloc_init(PXWidgetCompositionViewElementLayout);
    layout = self->__layout;
    self->__layout = v7;

    v9 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", self->__layout);
    tilingController = self->__tilingController;
    self->__tilingController = v9;

    v11 = self->__tilingController;
    -[PXWidgetCompositionElement scrollViewController](self, "scrollViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTilingController setScrollController:](v11, "setScrollController:", v12);

    -[PXTilingController setTileAnimator:](self->__tilingController, "setTileAnimator:", self->__tileAnimator);
    -[PXTilingController setTileSource:](self->__tilingController, "setTileSource:", self);
    -[PXTilingController setTransitionDelegate:](self->__tilingController, "setTransitionDelegate:", self);
    -[PXTilingController setScrollDelegate:](self->__tilingController, "setScrollDelegate:", self);
  }
}

- (CGPoint)_anchorPoint
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGPoint result;

  -[PXWidgetCompositionViewElement _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentBounds");
  v6 = v5;

  -[PXWidgetCompositionElement widget](self, "widget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || (v8 = objc_msgSend(v7, "contentViewAnchoringType")) == 0)
  {
    -[PXWidgetCompositionElement widget](self, "widget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXWidgetCompositionElement widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:](self, "widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:", v9);

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionViewElement.m"), 79, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  PXRectEdgeValue();
  v11 = v10;

  v12 = v6;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  __int128 v8;
  __int128 v9;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  _QWORD v27[11];

  v7 = a4;
  +[PXWidgetCompositionViewElementLayout viewTileIdentifier](PXWidgetCompositionViewElementLayout, "viewTileIdentifier");
  v8 = *(_OWORD *)&a3->index[5];
  v23 = *(_OWORD *)&a3->index[3];
  v24 = v8;
  v25 = *(_OWORD *)&a3->index[7];
  v26 = a3->index[9];
  v9 = *(_OWORD *)&a3->index[1];
  v21 = *(_OWORD *)&a3->length;
  v22 = v9;
  v10 = (_QWORD)v21 == v27[0];
  if ((_QWORD)v21 && (_QWORD)v21 == v27[0])
  {
    v11 = 1;
    do
    {
      v12 = *((_QWORD *)&v21 + v11);
      v13 = v27[v11];
      v10 = v12 == v13;
      if (v11 >= (unint64_t)v21)
        break;
      ++v11;
    }
    while (v12 == v13);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_OWORD *)&a3->index[5];
    v23 = *(_OWORD *)&a3->index[3];
    v24 = v18;
    v25 = *(_OWORD *)&a3->index[7];
    v26 = a3->index[9];
    v19 = *(_OWORD *)&a3->index[1];
    v21 = *(_OWORD *)&a3->length;
    v22 = v19;
    PXTileIdentifierDescription((unint64_t *)&v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionViewElement.m"), 102, CFSTR("unknown identifier %@"), v20);

    abort();
  }
  -[PXWidgetCompositionViewElement checkOutViewTile](self, "checkOutViewTile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetCompositionViewElement _tilesInUse](self, "_tilesInUse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v14);

  return v14;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v7;
  __int128 v8;
  __int128 v9;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  _QWORD v25[11];

  v7 = a3;
  -[PXWidgetCompositionViewElement setIsCheckingInTile:](self, "setIsCheckingInTile:", 1);
  +[PXWidgetCompositionViewElementLayout viewTileIdentifier](PXWidgetCompositionViewElementLayout, "viewTileIdentifier");
  v8 = *(_OWORD *)&a4->index[5];
  v21 = *(_OWORD *)&a4->index[3];
  v22 = v8;
  v23 = *(_OWORD *)&a4->index[7];
  v24 = a4->index[9];
  v9 = *(_OWORD *)&a4->index[1];
  v19 = *(_OWORD *)&a4->length;
  v20 = v9;
  v10 = (_QWORD)v19 == v25[0];
  if ((_QWORD)v19 && (_QWORD)v19 == v25[0])
  {
    v11 = 1;
    do
    {
      v12 = *((_QWORD *)&v19 + v11);
      v13 = v25[v11];
      v10 = v12 == v13;
      if (v11 >= (unint64_t)v19)
        break;
      ++v11;
    }
    while (v12 == v13);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)&a4->index[5];
    v21 = *(_OWORD *)&a4->index[3];
    v22 = v16;
    v23 = *(_OWORD *)&a4->index[7];
    v24 = a4->index[9];
    v17 = *(_OWORD *)&a4->index[1];
    v19 = *(_OWORD *)&a4->length;
    v20 = v17;
    PXTileIdentifierDescription((unint64_t *)&v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionViewElement.m"), 117, CFSTR("unknown identifier %@"), v18);

    abort();
  }
  -[PXWidgetCompositionViewElement checkInViewTile:](self, "checkInViewTile:", v7);
  -[PXWidgetCompositionViewElement setIsCheckingInTile:](self, "setIsCheckingInTile:", 0);
  -[PXWidgetCompositionViewElement _tilesInUse](self, "_tilesInUse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v7);

}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  return objc_alloc_init(PXTileIdentifierIdentityConverter);
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v5 = a4;
  -[PXWidgetCompositionViewElement _anchorOffset](self, "_anchorOffset");
  if ((PXPointIsNull() & 1) != 0)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[PXWidgetCompositionViewElement _anchorPoint](self, "_anchorPoint");
    PXPointSubtract();
    objc_msgSend(v5, "visibleSize");
    PXRectWithCenterAndSize();
    v6 = v8;
    v7 = v9;
  }

  v10 = v6;
  v11 = v7;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)isCheckingInTile
{
  return self->_isCheckingInTile;
}

- (void)setIsCheckingInTile:(BOOL)a3
{
  self->_isCheckingInTile = a3;
}

- (PXBasicTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXWidgetCompositionViewElementLayout)_layout
{
  return self->__layout;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (CGPoint)_anchorOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__anchorOffset.x;
  y = self->__anchorOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setAnchorOffset:(CGPoint)a3
{
  self->__anchorOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__layout, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
}

- (id)createTileAnimator
{
  return objc_alloc_init(PXWidgetCompositionUIViewElementTileAnimator);
}

- (id)checkOutViewTile
{
  void *v3;
  PXWidgetCompositionUIViewElementTile *v4;
  void *v5;
  void *v6;

  -[PXWidgetCompositionElement widget](self, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXWidgetCompositionUIViewElementTile initWithWidget:]([PXWidgetCompositionUIViewElementTile alloc], "initWithWidget:", v3);
  -[PXWidgetCompositionElement scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWidgetCompositionUIViewElementTile view](v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  return v4;
}

- (void)checkInViewTile:(id)a3
{
  id v3;

  objc_msgSend(a3, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

@end
