@implementation PXStoryLayout

- (PXStoryLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryLayout.m"), 99, CFSTR("%s is not available as initializer"), "-[PXStoryLayout init]");

  abort();
}

- (PXStoryLayout)initWithModel:(id)a3
{
  id v5;
  PXStoryLayout *v6;
  PXStoryLayout *v7;
  id *p_model;
  unint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  char v16;
  PXStoryScrollLayout *v17;
  PXStoryScrollLayout *scrollLayout;
  uint64_t v19;
  char v20;
  PXStoryThumbnailChromeLayout *v21;
  PXStoryThumbnailChromeLayout *thumbnailChromeLayout;
  uint64_t v23;
  char v24;
  char v25;
  PXStoryFullsizeLayout *v26;
  uint64_t v27;
  id *v28;
  void *v29;
  PXGLayout *v30;
  PXGLayout *fullsizeLayout;
  uint64_t v32;
  PXStoryFadeOverlayLayout *v33;
  PXStoryFadeOverlayLayout *fadeOverlayLayout;
  char v36;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PXStoryLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(*p_model, "registerChangeObserver:context:", v7, ModelObservationContext_211784);
    v9 = objc_msgSend(v5, "options");
    objc_msgSend(v5, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isExportPreview");
    v36 = objc_msgSend(v10, "isPresentedForAirPlay");
    v12 = objc_msgSend(v5, "viewMode");
    if (objc_msgSend(v10, "options") & 0x400 | v9 & 1)
      v13 = 1;
    else
      v13 = v12 == 3;
    v14 = !v13;
    if ((v9 & 1) != 0 || (objc_msgSend(v5, "isAsync") & 1) != 0)
      LODWORD(v15) = 0;
    else
      v15 = (v9 >> 1) & 1;
    v16 = objc_msgSend(v10, "shouldFadeToBlackAtEnd");
    v17 = -[PXStoryScrollLayout initWithModel:]([PXStoryScrollLayout alloc], "initWithModel:", *p_model);
    scrollLayout = v7->_scrollLayout;
    v7->_scrollLayout = v17;

    if (v14)
      v19 = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_scrollLayout);
    else
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    v20 = v16 | v9;
    v7->_scrollLayoutIndex = v19;
    if ((_DWORD)v15)
    {
      v21 = -[PXStoryThumbnailChromeLayout initWithModel:]([PXStoryThumbnailChromeLayout alloc], "initWithModel:", v5);
      thumbnailChromeLayout = v7->_thumbnailChromeLayout;
      v7->_thumbnailChromeLayout = v21;

      v23 = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_thumbnailChromeLayout);
    }
    else
    {
      v23 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v24 = v20 | v36 | v11;
    v7->_thumbnailChromeLayoutIndex = v23;
    if (v12 == 3)
      v25 = 1;
    else
      v25 = v11;
    if ((v25 & 1) != 0 || objc_msgSend(v5, "isAsync"))
    {
      v26 = -[PXStoryFullsizeLayout initWithModel:]([PXStoryFullsizeLayout alloc], "initWithModel:", *p_model);
      v27 = 1112;
    }
    else
    {
      v26 = -[PXStoryStyleSwitchingFullsizeLayout initWithModel:]([PXStoryStyleSwitchingFullsizeLayout alloc], "initWithModel:", *p_model);
      v27 = 1104;
    }
    v28 = (id *)((char *)&v7->super.super.super.super.isa + v27);
    v29 = *(Class *)((char *)&v7->super.super.super.super.isa + v27);
    *v28 = v26;

    v30 = (PXGLayout *)*v28;
    fullsizeLayout = v7->_fullsizeLayout;
    v7->_fullsizeLayout = v30;

    v7->_fullsizeLayoutIndex = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_fullsizeLayout);
    v32 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v24 & 1) != 0)
    {
      v33 = -[PXStoryFadeOverlayLayout initWithModel:]([PXStoryFadeOverlayLayout alloc], "initWithModel:", *p_model);
      fadeOverlayLayout = v7->_fadeOverlayLayout;
      v7->_fadeOverlayLayout = v33;

      v32 = -[PXGLayout addSublayout:](v7, "addSublayout:", v7->_fadeOverlayLayout);
    }
    v7->_fadeOverlayLayoutIndex = v32;
    v7->_diagnosticOverlayLayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[PXStoryLayout _invalidateContent](v7, "_invalidateContent");
    v7->_shadowSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", 0);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXStoryLayout _invalidateShadow](v7, "_invalidateShadow");
    -[PXStoryLayout _invalidateAXGroupRole](v7, "_invalidateAXGroupRole");

  }
  return v7;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
}

- (unint64_t)contentChangeTrend
{
  return 4;
}

- (unsigned)representingSpriteIndex
{
  return self->_shadowSpriteIndex;
}

- (int64_t)scrollableAxis
{
  return 2;
}

- (void)setShadow:(id)a3
{
  NSShadow *v4;
  char v5;
  NSShadow *v6;
  NSShadow *shadow;
  NSShadow *v8;

  v8 = (NSShadow *)a3;
  v4 = self->_shadow;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSShadow isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSShadow *)-[NSShadow copy](v8, "copy");
      shadow = self->_shadow;
      self->_shadow = v6;

      -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setFullsizeContentPlacementOverride:(id)a3
{
  PXGItemPlacement *v5;
  PXGItemPlacement *v6;
  PXGItemPlacement *v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  PXGItemPlacement *v11;

  v5 = (PXGItemPlacement *)a3;
  v6 = self->_fullsizeContentPlacementOverride;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXGItemPlacement isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fullsizeContentPlacementOverride, a3);
      -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
      if (v5)
      {
        -[PXStoryLayout model](self, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __53__PXStoryLayout_setFullsizeContentPlacementOverride___block_invoke;
        v10[3] = &unk_1E5142E50;
        v11 = v5;
        objc_msgSend(v9, "performChanges:", v10);

      }
    }
  }

}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (id)itemReference
{
  void *v2;
  void *v3;

  -[PXStoryLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PXStoryLayout *v7;
  PXStoryLayout *v8;

  v4 = a3;
  -[PXStoryLayout itemReference](self, "itemReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    v7 = self;
  else
    v7 = -[PXGOtherItemPlacementController initWithOriginalItemPlacementController:originalItemReference:]([PXGOtherItemPlacementController alloc], "initWithOriginalItemPlacementController:originalItemReference:", self, v5);
  v8 = v7;

  return v8;
}

- (PXStoryFullsizeLayout)currentFullsizePlayerLayout
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PXStoryLayout thumbnailFullsizeLayout](self, "thumbnailFullsizeLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PXStoryLayout styleSwitchingFullsizeLayout](self, "styleSwitchingFullsizeLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dominantFullsizePlayerLayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (PXStoryFullsizeLayout *)v5;
}

- (void)setDiagnosticOverlayLayout:(id)a3
{
  PXGLayout *v5;
  char v6;
  PXGLayout *v7;
  int64_t v8;
  PXGLayout *v9;

  v9 = (PXGLayout *)a3;
  v5 = self->_diagnosticOverlayLayout;
  if (v5 == v9)
  {

LABEL_10:
    v7 = v9;
    goto LABEL_11;
  }
  v6 = -[PXGLayout isEqual:](v9, "isEqual:", v5);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (self->_diagnosticOverlayLayoutIndex != 0x7FFFFFFFFFFFFFFFLL)
      -[PXGLayout removeSublayoutAtIndex:](self, "removeSublayoutAtIndex:");
    objc_storeStrong((id *)&self->_diagnosticOverlayLayout, a3);
    if (self->_diagnosticOverlayLayout)
      v8 = -[PXGLayout addSublayout:](self, "addSublayout:");
    else
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    self->_diagnosticOverlayLayoutIndex = v8;
    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  void *v2;
  void *v3;
  char v4;

  -[PXStoryLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "thumbnailChromeShowsPlayButton");

  return v4;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryLayout;
  -[PXGCompositeLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryLayout.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryLayout.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryLayout _updateShadow](self, "_updateShadow");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout update]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryLayout.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v5 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXStoryLayout.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v6 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryLayout _updateAXGroupRole](self, "_updateAXGroupRole");
      v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryLayout.m"), 310, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXStoryLayout;
  -[PXGCompositeLayout update](&v15, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryLayout;
  -[PXGCompositeLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryLayout.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateShadow
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout _invalidateShadow]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryLayout.m"), 320, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateShadow
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryLayout model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailShadow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryLayout setShadow:](self, "setShadow:", v4);

}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryLayout.m"), 328, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContent
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double (**v22)(_QWORD, double);
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double (**v35)(_QWORD, double);
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  _QWORD v69[13];
  id v70;
  double v71;
  uint64_t v72;
  _QWORD aBlock[9];

  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:");
  PXRectWithOriginAndSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXStoryLayout model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModeTransition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryLayout model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "viewMode");

  switch(v15)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryLayout.m"), 342, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
    case 4:
      v16 = 1.0;
      goto LABEL_4;
    case 2:
      v65 = 0.0;
      v17 = (double)objc_msgSend(v13, "hasSourceOrDestinationViewMode:", 1);
      break;
    case 3:
    case 5:
      v16 = 0.0;
LABEL_4:
      v65 = v16;
      v17 = 1.0;
      break;
    default:
      v65 = 0.0;
      v17 = 0.0;
      break;
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pressedScale");
  v20 = v19;

  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__PXStoryLayout__updateContent__block_invoke;
  aBlock[3] = &__block_descriptor_72_e39__CGRect__CGPoint_dd__CGSize_dd__16__0d8l;
  aBlock[4] = v20;
  *(double *)&aBlock[5] = v5;
  v64 = v5;
  v67 = v9;
  v68 = v7;
  *(double *)&aBlock[6] = v7;
  *(double *)&aBlock[7] = v9;
  v66 = v11;
  *(double *)&aBlock[8] = v11;
  v22 = (double (**)(_QWORD, double))_Block_copy(aBlock);
  -[PXStoryLayout model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pressAnimationInfo");
  v25 = v24;
  v27 = v26;

  v28 = v22[2](v22, v25);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  self->_presentedContentFrame.origin.x = v28;
  self->_presentedContentFrame.origin.y = v29;
  self->_presentedContentFrame.size.width = v31;
  self->_presentedContentFrame.size.height = v33;
  v69[9] = v21;
  v69[10] = 3221225472;
  v69[11] = __31__PXStoryLayout__updateContent__block_invoke_2;
  v69[12] = &unk_1E5136DF8;
  v70 = v22;
  v71 = v25;
  v72 = v27;
  v35 = v22;
  PXRectFunctionDerivative();
  self->_presentedContentFrameVelocity.origin.x = v36;
  self->_presentedContentFrameVelocity.origin.y = v37;
  self->_presentedContentFrameVelocity.size.width = v38;
  self->_presentedContentFrameVelocity.size.height = v39;
  -[PXStoryLayout fullsizeContentPlacementOverride](self, "fullsizeContentPlacementOverride");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    objc_msgSend(v40, "alpha");
    v17 = v17 * v42;
    objc_msgSend(v41, "rectInLayout:velocity:", self, 0);
    v28 = v43;
    v30 = v44;
    v32 = v45;
    v47 = v46;
    v48 = 0.9;
  }
  else
  {
    v47 = v34;
    v48 = 0.3;
  }
  -[PXGLayout alpha](self, "alpha");
  v50 = v17 * v49;
  -[PXStoryLayout fullsizeLayout](self, "fullsizeLayout");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAlpha:", v50);

  -[PXStoryLayout relativeZPositionAboveLegibilityGradients](self, "relativeZPositionAboveLegibilityGradients");
  v53 = (v52 - v48) / 0.1;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v55 = v53 / v54;
  -[PXStoryLayout styleSwitchingFullsizeLayout](self, "styleSwitchingFullsizeLayout");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setRelativeZPositionAboveLegibilityGradients:", v55);

  -[PXGLayout alpha](self, "alpha");
  v58 = v65 * v57;
  -[PXStoryLayout scrollLayout](self, "scrollLayout");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setAlpha:", v58);

  -[PXGLayout alpha](self, "alpha");
  v61 = v60;
  -[PXStoryLayout thumbnailChromeLayout](self, "thumbnailChromeLayout");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setAlpha:", v61);

  -[PXStoryLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryLayout fullsizeLayoutIndex](self, "fullsizeLayoutIndex"), v28, v30, v32, v47, v48, 0.1);
  -[PXStoryLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryLayout scrollLayoutIndex](self, "scrollLayoutIndex"), v64, v68, v67, v66, 0.2, 0.1);
  -[PXStoryLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryLayout fadeOverlayLayoutIndex](self, "fadeOverlayLayoutIndex"), v28, v30, v32, v47, v48 + 0.1, 0.1);
  -[PXStoryLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryLayout thumbnailChromeLayoutIndex](self, "thumbnailChromeLayoutIndex"), v28, v30, v32, v47, 0.4, 0.1);
  if (-[PXStoryLayout diagnosticOverlayLayoutIndex](self, "diagnosticOverlayLayoutIndex") != 0x7FFFFFFFFFFFFFFFLL)
    -[PXStoryLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", -[PXStoryLayout diagnosticOverlayLayoutIndex](self, "diagnosticOverlayLayoutIndex"), v64, v68, v67, v66, v48 + 0.2, 0.1);
  v69[0] = v21;
  v69[1] = 3221225472;
  v69[2] = __31__PXStoryLayout__updateContent__block_invoke_3;
  v69[3] = &unk_1E513AEF0;
  v69[4] = self;
  *(double *)&v69[5] = v28;
  *(double *)&v69[6] = v30;
  *(double *)&v69[7] = v32;
  *(double *)&v69[8] = v47;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32, v69);

}

- (void)_invalidateAXGroupRole
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryLayout _invalidateAXGroupRole]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryLayout.m"), 440, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAXGroupRole
{
  void *v3;
  _BOOL8 v4;
  id v5;

  -[PXStoryLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode") != 4;

  -[PXGLayout axGroup](self, "axGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAxRole:", v4);

}

- (void)_setFrame:(CGRect)a3 relativeZPosition:(double)a4 depth:(double)a5 forSublayoutAtIndex:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;

  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    -[PXGLayout referenceDepth](self, "referenceDepth");
    v15 = v14;
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", a6, x, y, width, height);
    -[PXGAbsoluteCompositeLayout setZPosition:forSublayoutAtIndex:](self, "setZPosition:forSublayoutAtIndex:", a6, -(a4 * v15));
    -[PXGAbsoluteCompositeLayout setReferenceDepth:forSublayoutAtIndex:](self, "setReferenceDepth:forSublayoutAtIndex:", a6, v15 * a5);
  }
}

- (void)hostingControllerProposedReferenceSize:(id)a3
{
  id v4;

  v4 = a3;
  -[PXGLayout referenceSize](self, "referenceSize");
  if ((PXSizeIsEmpty() & 1) != 0)
  {
    -[PXStoryLayout setPendingSizeChange:](self, "setPendingSizeChange:", 0);
    objc_msgSend(v4, "accept");
  }
  else
  {
    -[PXStoryLayout setPendingSizeChange:](self, "setPendingSizeChange:", v4);
  }

}

- (void)hostingControllerCanceledPreviouslyProposedReferenceSize
{
  -[PXStoryLayout setPendingSizeChange:](self, "setPendingSizeChange:", 0);
}

- (void)hostingControllerDidChangeReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  void *v7;
  _QWORD v8[6];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryLayout;
  -[PXGLayout hostingControllerDidChangeReferenceSize:](&v9, sel_hostingControllerDidChangeReferenceSize_);
  -[PXStoryLayout model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PXStoryLayout_hostingControllerDidChangeReferenceSize___block_invoke;
    v8[3] = &__block_descriptor_48_e49_v16__0___PXStoryMutableExtendedTraitCollection__8l;
    *(CGFloat *)&v8[4] = width;
    *(CGFloat *)&v8[5] = height;
    objc_msgSend(v7, "performChanges:", v8);
  }

}

- (void)_acceptAnyPendingSizeChange
{
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  -[PXStoryLayout pendingSizeChange](self, "pendingSizeChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryLayout setPendingSizeChange:](self, "setPendingSizeChange:", 0);
    objc_msgSend(v3, "willAccept");
    -[PXGLayout layoutQueue](self, "layoutQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PXStoryLayout__acceptAnyPendingSizeChange__block_invoke;
    block[3] = &unk_1E5149198;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a4;
  if (-[PXStoryLayout shadowSpriteIndex](self, "shadowSpriteIndex") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryLayout.m"), 510, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXStoryLayout shadow](self, "shadow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v13;

  v7 = a4;
  if (-[PXStoryLayout shadowSpriteIndex](self, "shadowSpriteIndex") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryLayout.m"), 518, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXStoryLayout model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thumbnailCornerRadius");
  v11 = v10;

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ModelObservationContext_211784 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryLayout.m"), 539, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 0x10000) != 0)
    -[PXStoryLayout _invalidateAXGroupRole](self, "_invalidateAXGroupRole");
  if ((a4 & 0x2000) != 0)
    -[PXStoryLayout _invalidateShadow](self, "_invalidateShadow");
  if ((a4 & 0x8000000000410000) != 0)
    -[PXStoryLayout _invalidateContent](self, "_invalidateContent");
  if ((a4 & 0x20) != 0)
    -[PXStoryLayout _acceptAnyPendingSizeChange](self, "_acceptAnyPendingSizeChange");

}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  PXGItemPlacement *v10;
  PXGItemPlacement *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXStoryLayout itemReference](self, "itemReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v10 = [PXGItemPlacement alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PXStoryLayout_placementInContext_forItemReference___block_invoke;
    v14[3] = &unk_1E5136E40;
    v14[4] = self;
    v15 = v7;
    v11 = -[PXGItemPlacement initWithContext:configuration:](v10, "initWithContext:configuration:", v6, v14);

  }
  else
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "unexpected itemReference %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXStoryLayout itemReference](self, "itemReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    if (objc_msgSend(v6, "hasGeometry"))
      v10 = v6;
    else
      v10 = 0;
    -[PXStoryLayout setFullsizeContentPlacementOverride:](self, "setFullsizeContentPlacementOverride:", v10);
    -[PXGLayout setDetailedPlacementOverride:forItemReference:](self, "setDetailedPlacementOverride:forItemReference:", v6, v7);
    -[PXStoryLayout accessoryItemPlacementLayout](self, "accessoryItemPlacementLayout");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setDetailedPlacementOverride:forItemReference:](v11, "setDetailedPlacementOverride:forItemReference:", v6, v7);
  }
  else
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "unexpected itemReference %@", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)enumerateSublayoutsForDetailedPlacement:(id)a3 ofItemWithReference:(id)a4 usingBlock:(id)a5
{
  void (**v7)(id, void *, id);
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = (void (**)(id, void *, id))a5;
  -[PXStoryLayout itemReference](self, "itemReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v12, "isEqual:", v8);

  if (v9)
  {
    -[PXStoryLayout currentFullsizePlayerLayout](self, "currentFullsizePlayerLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10, v12);

    -[PXStoryLayout thumbnailChromeLayout](self, "thumbnailChromeLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v7[2](v7, v11, v12);

  }
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryLayout currentFullsizePlayerLayout](self, "currentFullsizePlayerLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

}

- (id)diagnosticsItemProvidersInRect:(CGRect)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryLayout model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PXDiagnosticsItemProvider providerWithItem:identifier:](PXDiagnosticsItemProvider, "providerWithItem:identifier:", v6, CFSTR("PXDiagnosticsItemIdentifierAssetCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PXDiagnosticsItemProvider providerWithItem:identifier:](PXDiagnosticsItemProvider, "providerWithItem:identifier:", v6, CFSTR("PXDiagnosticsItemIdentifierMemory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryStyleSwitchingFullsizeLayout)styleSwitchingFullsizeLayout
{
  return self->_styleSwitchingFullsizeLayout;
}

- (PXStoryFullsizeLayout)thumbnailFullsizeLayout
{
  return self->_thumbnailFullsizeLayout;
}

- (PXGLayout)fullsizeLayout
{
  return self->_fullsizeLayout;
}

- (PXStoryFadeOverlayLayout)fadeOverlayLayout
{
  return self->_fadeOverlayLayout;
}

- (PXStoryScrollLayout)scrollLayout
{
  return self->_scrollLayout;
}

- (PXStoryThumbnailChromeLayout)thumbnailChromeLayout
{
  return self->_thumbnailChromeLayout;
}

- (int64_t)fullsizeLayoutIndex
{
  return self->_fullsizeLayoutIndex;
}

- (int64_t)scrollLayoutIndex
{
  return self->_scrollLayoutIndex;
}

- (int64_t)thumbnailChromeLayoutIndex
{
  return self->_thumbnailChromeLayoutIndex;
}

- (int64_t)fadeOverlayLayoutIndex
{
  return self->_fadeOverlayLayoutIndex;
}

- (int64_t)diagnosticOverlayLayoutIndex
{
  return self->_diagnosticOverlayLayoutIndex;
}

- (unsigned)shadowSpriteIndex
{
  return self->_shadowSpriteIndex;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (PXGHostingControllerProposedSize)pendingSizeChange
{
  return self->_pendingSizeChange;
}

- (void)setPendingSizeChange:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSizeChange, a3);
}

- (PXGItemPlacement)fullsizeContentPlacementOverride
{
  return self->_fullsizeContentPlacementOverride;
}

- (PXGLayout)accessoryItemPlacementLayout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_accessoryItemPlacementLayout);
}

- (void)setAccessoryItemPlacementLayout:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryItemPlacementLayout, a3);
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (PXGLayout)diagnosticOverlayLayout
{
  return self->_diagnosticOverlayLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticOverlayLayout, 0);
  objc_destroyWeak((id *)&self->_accessoryItemPlacementLayout);
  objc_storeStrong((id *)&self->_fullsizeContentPlacementOverride, 0);
  objc_storeStrong((id *)&self->_pendingSizeChange, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_thumbnailChromeLayout, 0);
  objc_storeStrong((id *)&self->_scrollLayout, 0);
  objc_storeStrong((id *)&self->_fadeOverlayLayout, 0);
  objc_storeStrong((id *)&self->_fullsizeLayout, 0);
  objc_storeStrong((id *)&self->_thumbnailFullsizeLayout, 0);
  objc_storeStrong((id *)&self->_styleSwitchingFullsizeLayout, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

void __53__PXStoryLayout_placementInContext_forItemReference___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  id v12;

  v3 = a2;
  v4 = *(double **)(a1 + 32);
  v12 = v3;
  objc_msgSend(v3, "setRect:velocity:inLayout:", v4[128], v4[129], v4[130], v4[131], v4[132], v4[133], v4[134], v4[135]);
  objc_msgSend(*(id *)(a1 + 32), "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleDisplayAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayedAsset:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "getDetailedPresentedPlacement:forItemReference:", v12, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "accessoryItemPlacementLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getDetailedPresentedPlacement:forItemReference:", v12, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "options");
  LODWORD(v11) = 0;
  if ((v10 & 2) == 0)
    *(float *)&v11 = 1.0;
  objc_msgSend(v12, "setSoundVolume:", v11);

}

uint64_t __44__PXStoryLayout__acceptAnyPendingSizeChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accept");
}

uint64_t __57__PXStoryLayout_hostingControllerDidChangeReferenceSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutReferenceSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __31__PXStoryLayout__updateContent__block_invoke()
{
  PXFloatByLinearlyInterpolatingFloats();
  PXRectGetCenter();
  PXSizeScale();
  return PXRectWithCenterAndSize();
}

uint64_t __31__PXStoryLayout__updateContent__block_invoke_2(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40) + a2 * *(double *)(a1 + 48));
}

void __31__PXStoryLayout__updateContent__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v9;
  void *v10;
  void *v11;

  v9 = objc_msgSend(*(id *)(a1 + 32), "shadowSpriteIndex");
  objc_msgSend(*(id *)(a1 + 32), "shadow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    PXGConfigureShadowSprite((float32x2_t *)(a3 + 32 * v9), a4 + 160 * v9, a5 + 40 * v9, v10, *(void **)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
    v10 = v11;
  }
  else
  {
    *(_DWORD *)(a4 + 160 * v9) = 0;
  }

}

void __53__PXStoryLayout_setFullsizeContentPlacementOverride___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "soundVolume");
  objc_msgSend(v3, "setVolumeDuringViewControllerTransition:");

}

@end
