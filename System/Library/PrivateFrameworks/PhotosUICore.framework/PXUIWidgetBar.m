@implementation PXUIWidgetBar

- (id)createTileAnimator
{
  return objc_alloc_init(PXBasicUIViewTileAnimator);
}

- (id)checkOutTileWithKind:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v10;

  if (a3 == 1)
  {
    -[PXUIWidgetBar _viewTile](self, "_viewTile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIWidgetBar.m"), 35, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v4 = 0;
  }
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PXWidgetBar scrollViewController](self, "scrollViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v5);

  }
  return v4;
}

- (void)checkInTile:(id)a3
{
  id v3;

  objc_msgSend(a3, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (PXUIWidgetBarViewTile)_viewTile
{
  PXUIWidgetBarViewTile *viewTile;
  PXUIWidgetBarViewTile *v4;
  PXUIWidgetBarViewTile *v5;

  viewTile = self->__viewTile;
  if (!viewTile)
  {
    v4 = objc_alloc_init(PXUIWidgetBarViewTile);
    v5 = self->__viewTile;
    self->__viewTile = v4;

    viewTile = self->__viewTile;
  }
  return viewTile;
}

- (void)updateView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXUIWidgetBar;
  -[PXWidgetBar updateView](&v5, sel_updateView);
  -[PXWidgetBar view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIWidgetBar _viewTile](self, "_viewTile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setView:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewTile, 0);
}

@end
