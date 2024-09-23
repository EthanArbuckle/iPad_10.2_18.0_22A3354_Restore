@implementation PXStoryDiagnosticHUDLayout

- (PXStoryDiagnosticHUDLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDiagnosticHUDLayout.m"), 57, CFSTR("%s is not available as initializer"), "-[PXStoryDiagnosticHUDLayout init]");

  abort();
}

- (PXStoryDiagnosticHUDLayout)initWithDataSource:(id)a3
{
  id v5;
  PXStoryDiagnosticHUDLayout *v6;
  PXStoryDiagnosticHUDLayout *v7;
  void *v8;
  uint64_t v9;
  NSTimer *timer;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSAttributedString *badgeText;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryDiagnosticHUDLayout;
  v6 = -[PXGLayout init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    -[PXStoryDiagnosticHUDDataSource HUDObservable](v7->_dataSource, "HUDObservable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", v7, DataSourceObservationContext);

    objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", v7, sel__invalidateContent, 0, 1, 1.0);
    v9 = objc_claimAutoreleasedReturnValue();
    timer = v7->_timer;
    v7->_timer = (NSTimer *)v9;

    v7->_HUDTextSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", &__block_literal_global_17883);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "allowsShowcase") && (objc_msgSend(v11, "disableShowcaseBadge") & 1) == 0)
    {
      v7->_badgeSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", &__block_literal_global_8);
      v12 = objc_alloc(MEMORY[0x1E0CB3498]);
      v20[0] = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v13;
      v20[1] = *MEMORY[0x1E0DC1138];
      objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 26.0, *MEMORY[0x1E0DC1418]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "initWithString:attributes:", CFSTR(" * Showcase Mode * "), v15);
      badgeText = v7->_badgeText;
      v7->_badgeText = (NSAttributedString *)v16;

    }
    else
    {
      v7->_badgeSpriteIndex = -1;
    }
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXStoryDiagnosticHUDLayout _invalidateModel](v7, "_invalidateModel");
    -[PXStoryDiagnosticHUDLayout _invalidateContent](v7, "_invalidateContent");

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryDiagnosticHUDLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (void)setModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *model;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  model = self->_model;
  if (model != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](model, "unregisterChangeObserver:context:", self, ModelObservationContext_17848);
    objc_storeStrong((id *)&self->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_model, "registerChangeObserver:context:", self, ModelObservationContext_17848);
    -[PXStoryDiagnosticHUDLayout _invalidateControllers](self, "_invalidateControllers");
    -[PXStoryDiagnosticHUDLayout _invalidateContent](self, "_invalidateContent");
    v5 = v7;
  }

}

- (void)setRelatedController:(id)a3
{
  PXStoryRelatedController *v5;
  PXStoryRelatedController *v6;

  v5 = (PXStoryRelatedController *)a3;
  if (self->_relatedController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_relatedController, a3);
    -[PXStoryRelatedController registerChangeObserver:context:](self->_relatedController, "registerChangeObserver:context:", self, RelatedControllerObservationContext);
    v5 = v6;
  }

}

- (void)setAnimationController:(id)a3
{
  PXStoryAnimationController *v5;
  PXStoryAnimationController *animationController;
  PXStoryAnimationController *v7;

  v5 = (PXStoryAnimationController *)a3;
  animationController = self->_animationController;
  if (animationController != v5)
  {
    v7 = v5;
    -[PXStoryAnimationController unregisterChangeObserver:context:](animationController, "unregisterChangeObserver:context:", self, AnimationControllerObservationContext);
    objc_storeStrong((id *)&self->_animationController, a3);
    -[PXStoryAnimationController registerChangeObserver:context:](self->_animationController, "registerChangeObserver:context:", self, AnimationControllerObservationContext);
    -[PXStoryDiagnosticHUDLayout _invalidateContent](self, "_invalidateContent");
    v5 = v7;
  }

}

- (void)_enumerateDiagnosticHUDContentProvidersUsingBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t, _BYTE *);
  void *v5;
  unint64_t v6;
  void *v7;
  char v8;

  v4 = (void (**)(id, void *, unint64_t, _BYTE *))a3;
  -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v8 = 0;
  do
  {
    objc_msgSend(v5, "diagnosticHUDContentProviderForType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v4[2](v4, v7, v6, &v8);

    if (v6 > 0x12)
      break;
    ++v6;
  }
  while (!v8);

}

- (void)entityManagerDidChange
{
  void *v3;
  PXGLoadingStatusComponent *v4;
  PXGLoadingStatusComponent *loadingStatusComponent;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PXStoryDiagnosticHUDLayout;
  -[PXGLayout entityManagerDidChange](&v10, sel_entityManagerDidChange);
  -[PXGLayout entityManager](self, "entityManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingStatus");
  v4 = (PXGLoadingStatusComponent *)objc_claimAutoreleasedReturnValue();
  loadingStatusComponent = self->_loadingStatusComponent;
  self->_loadingStatusComponent = v4;

  -[PXGLayout entityManager](self, "entityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout entityManager](self, "entityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadingStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerObserver:forComponents:", self, v9);

}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryDiagnosticHUDLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PXStoryDiagnosticHUDLayout _invalidateContent](self, "_invalidateContent");
}

- (BOOL)_shouldDisplayContentForHUDType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x11;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryDiagnosticHUDLayout.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryDiagnosticHUDLayout _updateModel](self, "_updateModel");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout update]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryDiagnosticHUDLayout.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryDiagnosticHUDLayout _updateControllers](self, "_updateControllers");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXStoryDiagnosticHUDLayout.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryDiagnosticHUDLayout _updateContent](self, "_updateContent");
      v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryDiagnosticHUDLayout.m"), 197, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXStoryDiagnosticHUDLayout;
  -[PXGLayout update](&v15, sel_update);
}

- (void)_invalidateModel
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
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout _invalidateModel]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryDiagnosticHUDLayout.m"), 202, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateModel
{
  void *v3;
  id v4;

  -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HUDStoryModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDiagnosticHUDLayout setModel:](self, "setModel:", v3);

}

- (void)_invalidateControllers
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
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout _invalidateControllers]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryDiagnosticHUDLayout.m"), 210, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateControllers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryDiagnosticHUDLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "HUDRelatedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDiagnosticHUDLayout setRelatedController:](self, "setRelatedController:", v4);

  objc_msgSend(v3, "animationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDiagnosticHUDLayout setAnimationController:](self, "setAnimationController:", v5);

}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (-[PXGLoadingStatusComponent stateForEntity:](self->_loadingStatusComponent, "stateForEntity:", -[PXGLayout entityForSpriteAtIndex:](self, "entityForSpriteAtIndex:", self->_HUDTextSpriteIndex)) == 1)
  {
    self->_hasPendingContentUpdate = 1;
    return;
  }
  ++self->_contentVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryDiagnosticHUDLayout _invalidateContent]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXStoryDiagnosticHUDLayout.m"), 228, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContent
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[9];

  -[PXStoryDiagnosticHUDLayout _updateHUDText](self, "_updateHUDText");
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout setContentSize:](self, "setContentSize:");
  -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v13, "isHUDVisible");
  if (v3)
    LOBYTE(v3) = -[PXStoryDiagnosticHUDLayout _shouldDisplayContentForHUDType:](self, "_shouldDisplayContentForHUDType:", objc_msgSend(v13, "diagnosticHUDType"));
  self->_wantsHUDContentVisible = v3;
  PXRectWithOriginAndSize();
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__PXStoryDiagnosticHUDLayout__updateContent__block_invoke;
  v14[3] = &unk_1E513AEF0;
  v14[4] = self;
  v14[5] = v5;
  v14[6] = v7;
  v14[7] = v9;
  v14[8] = v11;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v12 << 32, v14);

}

- (void)_updateHUDText
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "diagnosticHUDType");
  v5 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 0x10
    || (v6 = v4,
        objc_msgSend(v3, "diagnosticHUDContentProviderForType:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PXGLayout contentSize](self, "contentSize"),
        objc_msgSend(v7, "diagnosticTextForHUDType:displaySize:", v6),
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v8 = &stru_1E5149688;
  }
  v27 = *MEMORY[0x1E0DC1140];
  v9 = v27;
  objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v28 = *MEMORY[0x1E0DC1138];
  v11 = v28;
  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 14.0, *MEMORY[0x1E0DC1418]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v27, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v11;
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1420]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3778]);
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v5 > 0x12)
    v19 = CFSTR("None");
  else
    v19 = off_1E5136070[v5];
  v20 = v19;
  v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@\n\n"), v20);
  v22 = (void *)objc_msgSend(v17, "initWithString:attributes:", v21, v13);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v16);
  objc_msgSend(v22, "appendAttributedString:", v23);
  v24 = (void *)objc_msgSend(v22, "copy");
  -[PXStoryDiagnosticHUDLayout setHUDText:](self, "setHUDText:", v24);

}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_HUDTextSpriteIndex == a3)
  {
    -[PXStoryDiagnosticHUDLayout HUDText](self, "HUDText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_badgeSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDiagnosticHUDLayout.m"), 302, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXStoryDiagnosticHUDLayout badgeText](self, "badgeText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_HUDTextSpriteIndex == a3)
  {
    -[PXStoryDiagnosticHUDLayout HUDText](self, "HUDText");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_badgeSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDiagnosticHUDLayout.m"), 319, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXStoryDiagnosticHUDLayout badgeText](self, "badgeText");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (void)entityManager:(id)a3 componentDidChange:(id)a4
{
  id v6;
  id v7;
  _BOOL4 hasPendingContentUpdate;
  $738B17BD11CC339B30296C0EA03CEC2B v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "loadingStatus");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    hasPendingContentUpdate = self->_hasPendingContentUpdate;

    if (hasPendingContentUpdate)
    {
      v9.var0 = -[PXGLayout entityForSpriteAtIndex:](self, "entityForSpriteAtIndex:", self->_HUDTextSpriteIndex);
      objc_msgSend(v11, "loadingStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9.var0) = objc_msgSend(v10, "stateForEntity:", v9.var0);

      if ((LOBYTE(v9.var0) - 2) <= 2u)
      {
        -[PXStoryDiagnosticHUDLayout _invalidateContent](self, "_invalidateContent");
        self->_hasPendingContentUpdate = 0;
      }
    }
  }
  else
  {

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v9 = a3;
  v15 = v9;
  if ((void *)DataSourceObservationContext == a5)
  {
    -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "HUDStoryModelChangeDescriptor") & a4) != 0)
      -[PXStoryDiagnosticHUDLayout _invalidateModel](self, "_invalidateModel");
    if ((objc_msgSend(v11, "HUDContentChangeDescriptor") & a4) != 0)
      -[PXStoryDiagnosticHUDLayout _invalidateContent](self, "_invalidateContent");

    goto LABEL_14;
  }
  if ((void *)ModelObservationContext_17848 != a5)
  {
    if ((void *)RelatedControllerObservationContext != a5 && AnimationControllerObservationContext != (_QWORD)a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDiagnosticHUDLayout.m"), 356, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    goto LABEL_8;
  }
  if ((a4 & 0x1E01) != 0)
  {
    -[PXStoryDiagnosticHUDLayout dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isHUDVisible");

    v9 = v15;
    if (v13)
    {
LABEL_8:
      -[PXStoryDiagnosticHUDLayout _invalidateContent](self, "_invalidateContent");
LABEL_14:
      v9 = v15;
    }
  }

}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (NSAttributedString)HUDText
{
  return self->_HUDText;
}

- (void)setHUDText:(id)a3
{
  objc_storeStrong((id *)&self->_HUDText, a3);
}

- (NSAttributedString)badgeText
{
  return self->_badgeText;
}

- (PXStoryDiagnosticHUDDataSource)dataSource
{
  return self->_dataSource;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (PXStoryRelatedController)relatedController
{
  return self->_relatedController;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryAnimationController)animationController
{
  return self->_animationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_relatedController, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_storeStrong((id *)&self->_HUDText, 0);
  objc_storeStrong((id *)&self->_loadingStatusComponent, 0);
}

void __44__PXStoryDiagnosticHUDLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  float v19;
  CGFloat MidX;
  CGFloat MidY;
  __int128 v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat Height;
  float64x2_t v27;
  uint64_t v28;
  float v29;
  unsigned int *v30;
  float32x2_t v31;
  double v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  float64x2_t v43;
  __int128 v44;
  CGFloat v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v9 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 884);
  PXInsetRectWithValueForEdges();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 32), "referenceDepth");
  v19 = v18;
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  MidX = CGRectGetMidX(v46);
  v47.origin.x = v11;
  v47.origin.y = v13;
  v47.size.width = v15;
  v47.size.height = v17;
  MidY = CGRectGetMidY(v47);
  v48.origin.x = v11;
  v48.origin.y = v13;
  v48.size.width = v15;
  v48.size.height = v17;
  *(double *)&v22 = CGRectGetWidth(v48);
  v44 = v22;
  *(CGFloat *)&v22 = v11;
  v23 = v13;
  v24 = v15;
  v25 = v17;
  Height = CGRectGetHeight(*(CGRect *)&v22);
  *(_QWORD *)&v27.f64[0] = v44;
  v27.f64[1] = Height;
  *(CGFloat *)v9 = MidX;
  *(CGFloat *)(v9 + 8) = MidY;
  *(double *)(v9 + 16) = v19;
  *(float32x2_t *)(v9 + 24) = vcvt_f32_f64(v27);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = 1.0;
  if (!*(_BYTE *)(v28 + 894))
    v29 = 0.0;
  *(float *)(a4 + 160 * *(unsigned int *)(v28 + 884)) = v29;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 884) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 892);
  v30 = *(unsigned int **)(a1 + 32);
  v31 = *(float32x2_t *)(a3 + 32 * v30[221] + 24);
  objc_msgSend(v30, "displayScale", v44);
  *(float *)&v32 = v32;
  *(float32x2_t *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 884) + 8) = vmul_n_f32(v31, *(float *)&v32);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 888) != -1)
  {
    PXPointDenormalize();
    PXRectWithCenterAndSize();
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    v36 = v49.size.height;
    v37 = *(_QWORD *)(a1 + 32);
    v38 = a3 + 32 * *(unsigned int *)(v37 + 888);
    v39 = *(double *)(a3 + 32 * *(unsigned int *)(v37 + 884) + 16) + 10.0;
    v40 = CGRectGetMidX(v49);
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = v36;
    v41 = CGRectGetMidY(v50);
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = v36;
    v45 = CGRectGetWidth(v51);
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = v36;
    v42 = CGRectGetHeight(v52);
    v43.f64[0] = v45;
    v43.f64[1] = v42;
    *(CGFloat *)v38 = v40;
    *(CGFloat *)(v38 + 8) = v41;
    *(double *)(v38 + 16) = v39;
    *(float32x2_t *)(v38 + 24) = vcvt_f32_f64(v43);
  }
}

__n128 __49__PXStoryDiagnosticHUDLayout_initWithDataSource___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  uint64_t v10;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v7;
  result = *(__n128 *)off_1E50B83A0;
  v9 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v9;
  v10 = *(_QWORD *)(a3 + 32);
  *(_BYTE *)(v10 + 1) = 3;
  *(_BYTE *)(v10 + 34) = 2;
  return result;
}

__n128 __49__PXStoryDiagnosticHUDLayout_initWithDataSource___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  uint64_t v10;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v7;
  result = *(__n128 *)off_1E50B83A0;
  v9 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v9;
  v10 = *(_QWORD *)(a3 + 32);
  *(_BYTE *)(v10 + 1) = 3;
  *(_BYTE *)(v10 + 34) = 2;
  return result;
}

@end
