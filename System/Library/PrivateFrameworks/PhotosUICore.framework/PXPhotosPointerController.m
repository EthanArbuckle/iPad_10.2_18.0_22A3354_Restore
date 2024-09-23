@implementation PXPhotosPointerController

- (PXPhotosPointerController)initWithContentView:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PXPhotosPointerController *v9;
  PXPhotosPointerController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosPointerController;
  v9 = -[PXPhotosPointerController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_contentView, a3);
    -[PXPhotosPointerController _setupWithContentView:](v10, "_setupWithContentView:", v7);
    +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addDeferredKeyObserver:", v10);

  }
  return v10;
}

- (void)_setupWithContentView:(id)a3
{
  void *v4;
  int v5;
  UIPointerInteraction *v6;
  UIPointerInteraction *pointerInteraction;
  id v8;

  v8 = a3;
  +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableCuratedLibraryEffects");

  if (v5)
  {
    v6 = (UIPointerInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", self);
    objc_msgSend(v8, "addInteraction:", v6);
    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = v6;

  }
}

- (void)invalidate
{
  id v2;

  -[PXPhotosPointerController pointerInteraction](self, "pointerInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  -[PXPhotosPointerController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosPointerController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointerController:regionOfInterestForCursorAtLocation:inCoordinateSpace:", self, v13, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "location");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v8, "coordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointerController:identifierForRegionAtLocation:inCoordinateSpace:", self, v19, v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0DC3B28];
    objc_msgSend(v14, "rectInCoordinateSpace:", v8);
    objc_msgSend(v21, "regionWithRect:identifier:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(a4, "rect", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXPhotosPointerController contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosPointerController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pointerController:willEnterRegionWithRect:inCoordinateSpace:", self, v15, v7, v9, v11, v13);

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(a4, "rect", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXPhotosPointerController contentView](self, "contentView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosPointerController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pointerController:didExitRegionWithRect:inCoordinateSpace:", self, v15, v7, v9, v11, v13);

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosPointerController.m"), 101, CFSTR("Unexpected settings observer instance: %@"), v8);

  }
  -[PXPhotosPointerController invalidate](self, "invalidate");

}

- (UIView)contentView
{
  return self->_contentView;
}

- (PXPhotosPointerControllerDelegate)delegate
{
  return (PXPhotosPointerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
