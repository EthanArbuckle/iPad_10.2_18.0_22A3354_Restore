@implementation PXWidgetCompositionUIViewElementTile

- (PXWidgetCompositionUIViewElementTile)initWithWidget:(id)a3
{
  id v5;
  PXWidgetCompositionUIViewElementTile *v6;
  PXWidgetCompositionUIViewElementTile *v7;
  UIView *v8;
  UIView *containerView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXWidgetCompositionUIViewElementTile;
  v6 = -[PXWidgetCompositionUIViewElementTile init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_widget, a3);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v7->__containerView;
    v7->__containerView = v8;

  }
  return v7;
}

- (void)_embedContentView
{
  void *v3;
  void *v4;
  id object;

  if (!-[PXWidgetCompositionUIViewElementTile _didEmbedContentView](self, "_didEmbedContentView"))
  {
    -[PXWidgetCompositionUIViewElementTile widget](self, "widget");
    object = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(object, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, (const void *)PXWidgetDidLoadContentViewAssociationKey, MEMORY[0x1E0C9AAB0], (void *)1);
    -[PXWidgetCompositionUIViewElementTile _containerView](self, "_containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");
    objc_msgSend(v3, "setAutoresizingMask:", 18);
    objc_msgSend(v4, "addSubview:", v3);
    -[PXWidgetCompositionUIViewElementTile _setDidEmbedContentView:](self, "_setDidEmbedContentView:", 1);

  }
}

- (id)_willAnimateTileToGeometry:(PXTileGeometry *)a3 withOptions:(id)a4
{
  id v6;
  _PXWidgetCompositionUIViewElementTileTransitionContext *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  double v12;
  double v13;

  v6 = a4;
  v7 = objc_alloc_init(_PXWidgetCompositionUIViewElementTileTransitionContext);
  -[_PXWidgetCompositionUIViewElementTileTransitionContext setAnimationOptions:](v7, "setAnimationOptions:", v6);

  -[PXWidgetCompositionUIViewElementTile _setCurrentTransitionContext:](self, "_setCurrentTransitionContext:", v7);
  -[PXWidgetCompositionUIViewElementTile widget](self, "widget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v8, (const void *)PXWidgetDidLoadContentViewAssociationKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "contentView");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bounds");
    if (a3->size.width != v13 || a3->size.height != v12)
      objc_msgSend(v8, "contentViewWillTransitionToSize:withTransitionCoordinator:", self);

  }
  return v7;
}

- (void)_didAnimateTileWithContext:(id)a3
{
  -[PXWidgetCompositionUIViewElementTile _setCurrentTransitionContext:](self, "_setCurrentTransitionContext:", 0);
}

- (void)_didCompleteTileAnimationWithContext:(id)a3
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "alongsideAnimationCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "alongsideAnimationCompletion");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  void *v5;
  void (**v6)(void);
  id v7;

  -[PXWidgetCompositionUIViewElementTile _embedContentView](self, "_embedContentView", a3, a4);
  -[PXWidgetCompositionUIViewElementTile _currentTransitionContext](self, "_currentTransitionContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alongsideAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "alongsideAnimation");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (PXBasicTileAnimationOptions)animationOptions
{
  void *v4;
  void *v5;
  void *v7;

  -[PXWidgetCompositionUIViewElementTile _currentTransitionContext](self, "_currentTransitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionUIViewElementTile.m"), 108, CFSTR("missing transition context"));

  }
  objc_msgSend(v4, "animationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXBasicTileAnimationOptions *)v5;
}

- (void)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  -[PXWidgetCompositionUIViewElementTile _currentTransitionContext](self, "_currentTransitionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXWidgetCompositionUIViewElementTile.m"), 116, CFSTR("missing transition context"));

  }
  v10 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    objc_msgSend(v9, "alongsideAnimation");
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke;
    v17[3] = &unk_1E513F8E8;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v11 = v18;
    objc_msgSend(v9, "setAlongsideAnimation:", v17);

  }
  if (v8)
  {
    objc_msgSend(v9, "alongsideAnimationCompletion");
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke_2;
    v14[3] = &unk_1E513F8E8;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    v12 = v15;
    objc_msgSend(v9, "setAlongsideAnimationCompletion:", v14);

  }
}

- (PXWidget)widget
{
  return self->_widget;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (BOOL)_didEmbedContentView
{
  return self->__didEmbedContentView;
}

- (void)_setDidEmbedContentView:(BOOL)a3
{
  self->__didEmbedContentView = a3;
}

- (_PXWidgetCompositionUIViewElementTileTransitionContext)_currentTransitionContext
{
  return self->__currentTransitionContext;
}

- (void)_setCurrentTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->__currentTransitionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentTransitionContext, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

uint64_t __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __78__PXWidgetCompositionUIViewElementTile_animateAlongsideTransition_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
