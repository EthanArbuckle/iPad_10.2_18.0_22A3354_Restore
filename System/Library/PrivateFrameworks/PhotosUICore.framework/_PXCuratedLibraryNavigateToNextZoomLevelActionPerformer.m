@implementation _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer

- (_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  return -[_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer initWithActionType:viewModel:layout:hitSpriteReference:](self, "initWithActionType:viewModel:layout:hitSpriteReference:", a3, a4, 0, 0);
}

- (_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 layout:(id)a5 hitSpriteReference:(id)a6
{
  id v11;
  id v12;
  _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *v13;
  _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer;
  v13 = -[PXCuratedLibraryActionPerformer initWithActionType:viewModel:](&v16, sel_initWithActionType_viewModel_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_layout, a5);
    objc_storeStrong((id *)&v14->_hitSpriteReference, a6);
  }

  return v14;
}

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "zoomLevelInDirection:fromZoomLevel:", 1, -[PXCuratedLibraryActionPerformer actionZoomLevel](self, "actionZoomLevel"));

  if (v5)
  {
    -[_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer layout](self, "layout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryActionManager.m"), 570, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.layout.rootLayout"), v12, v13);

      }
    }
    objc_msgSend(v7, "clearLastVisibleAreaAnchoringInformation");
    -[_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer hitSpriteReference](self, "hitSpriteReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastHitSpriteReference:", v8);

    -[PXCuratedLibraryActionPerformer viewModel](self, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85___PXCuratedLibraryNavigateToNextZoomLevelActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v14[4] = v5;
    objc_msgSend(v9, "performChanges:", v14);

    objc_msgSend(v7, "invalidateLastVisibleAreaAnchoringInformation");
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (PXGSpriteReference)hitSpriteReference
{
  return self->_hitSpriteReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitSpriteReference, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
