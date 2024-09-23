@implementation PXPhotosRootLayout

- (PXPhotosRootLayout)initWithPhotosLayout:(id)a3 overlayController:(id)a4
{
  id v7;
  id v8;
  PXPhotosRootLayout *v9;
  PXPhotosRootLayout *v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosRootLayout;
  v9 = -[PXGLayout init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photosLayout, a3);
    objc_storeStrong((id *)&v10->_overlayController, a4);
    -[PXGSplitLayout setMode:](v10, "setMode:", 6);
    objc_msgSend(v8, "overlayLayoutProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "overlayLayoutProvider");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGSplitLayout setFirstSublayout:](v10, "setFirstSublayout:", v13);

    }
    -[PXGSplitLayout setSecondSublayout:](v10, "setSecondSublayout:", v10->_photosLayout);
    -[PXGLayout setReferenceDepth:](v10, "setReferenceDepth:", 10.0);
    -[PXGSplitLayout setAdjustSublayoutZPositions:](v10, "setAdjustSublayoutZPositions:", 1);
  }

  return v10;
}

- (PXPhotosLayout)photosLayout
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  -[PXGSplitLayout secondSublayout](self, "secondSublayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 208, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.secondSublayout"), v8);
LABEL_6:

    return (PXPhotosLayout *)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 208, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.secondSublayout"), v8, v10);

    goto LABEL_6;
  }
  return (PXPhotosLayout *)v4;
}

- (int64_t)objectReferenceLookup
{
  if (-[PXPhotosRootLayout _isOverlayVisible](self, "_isOverlayVisible"))
    return 1;
  else
    return 2;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  int64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v5 = -[PXGLayout sublayoutIndexForSpriteIndex:](self, "sublayoutIndexForSpriteIndex:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosRootLayout photosLayout](self, "photosLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v8 = -[PXPhotosRootLayout _isOverlayVisible](self, "_isOverlayVisible");

      if (v8)
        return 0;
    }
    else
    {

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosRootLayout;
  -[PXGLayout hitTestResultForSpriteIndex:](&v10, sel_hitTestResultForSpriteIndex_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isOverlayVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[PXPhotosRootLayout photosLayout](self, "photosLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewOptionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosRootLayout overlayController](self, "overlayController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableLenses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedLensControlItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  return v9;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int64_t v13;

  v7 = objc_retainAutorelease(a3);
  *a5 = v7;
  v8 = v7;
  -[PXPhotosRootLayout overlayController](self, "overlayController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canHandleObjectReference:", v8);

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[PXGSplitLayout firstSublayout](self, "firstSublayout");
  else
    -[PXGSplitLayout secondSublayout](self, "secondSublayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexOfSublayout:", v12);

  return v13;
}

- (void)setPhotosLayout:(id)a3
{
  objc_storeStrong((id *)&self->_photosLayout, a3);
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (void)setOverlayController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_photosLayout, 0);
}

@end
