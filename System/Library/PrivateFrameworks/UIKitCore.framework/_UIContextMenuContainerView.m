@implementation _UIContextMenuContainerView

- (BOOL)isTransparentFocusItem
{
  return 0;
}

- (_UIContextMenuContainerView)initWithFrame:(CGRect)a3 allowsBackgroundInteractionAcrossProccesses:(BOOL)a4
{
  _UIContextMenuContainerView *v5;
  _UIContextMenuContainerView *v6;
  void *v7;
  void *v8;
  _UIPassthroughScrollInteraction *v9;
  _UIPassthroughScrollInteraction *passthroughInteraction;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuContainerView;
  v5 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    if (!a4)
    {
      -[UIView traitCollection](v5, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "supportsPassthroughInteraction"))
      {
        v9 = objc_alloc_init(_UIPassthroughScrollInteraction);
        passthroughInteraction = v6->_passthroughInteraction;
        v6->_passthroughInteraction = v9;

        -[_UIPassthroughScrollInteraction setDelegate:](v6->_passthroughInteraction, "setDelegate:", v6);
        -[_UIPassthroughScrollInteraction setRecognizeOnPrimaryButtonDown:](v6->_passthroughInteraction, "setRecognizeOnPrimaryButtonDown:", 1);
        -[_UIPassthroughScrollInteraction setRecognizeOnSecondaryButtonDown:](v6->_passthroughInteraction, "setRecognizeOnSecondaryButtonDown:", 1);
        -[_UIPassthroughScrollInteraction setHitTestsAsOpaque:](v6->_passthroughInteraction, "setHitTestsAsOpaque:", objc_msgSend(v8, "containerViewsHitTestAsOpaque"));
      }
      v11 = objc_msgSend(v8, "containerViewsHitTestAsOpaque");
      -[UIView layer](v6, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHitTestsAsOpaque:", v11);

    }
    -[UIView _setOverrideUserInterfaceRenderingMode:](v6, "_setOverrideUserInterfaceRenderingMode:", 1);
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowSceneWillUpdateEffectiveGeometryNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuContainerView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  void (**v23)(_QWORD, double, double);
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)_UIContextMenuContainerView;
  -[UIView setBounds:](&v26, sel_setBounds_, x, y, width, height);
  -[_UIContextMenuContainerView sizeChangeHandler](self, "sizeChangeHandler");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[UIView bounds](self, "bounds");
    v28.origin.x = v18;
    v28.origin.y = v19;
    v28.size.width = v20;
    v28.size.height = v21;
    v27.origin.x = v9;
    v27.origin.y = v11;
    v27.size.width = v13;
    v27.size.height = v15;
    v22 = CGRectEqualToRect(v27, v28);

    if (!v22)
    {
      -[_UIContextMenuContainerView sizeChangeHandler](self, "sizeChangeHandler");
      v23 = (void (**)(_QWORD, double, double))objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self, "bounds");
      v23[2](v23, v24, v25);

    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  BOOL v22;
  void (**v23)(_QWORD, double, double);
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)_UIContextMenuContainerView;
  -[UIView setFrame:](&v26, sel_setFrame_, x, y, width, height);
  -[_UIContextMenuContainerView sizeChangeHandler](self, "sizeChangeHandler");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[UIView frame](self, "frame");
    v28.origin.x = v18;
    v28.origin.y = v19;
    v28.size.width = v20;
    v28.size.height = v21;
    v27.origin.x = v9;
    v27.origin.y = v11;
    v27.size.width = v13;
    v27.size.height = v15;
    v22 = CGRectEqualToRect(v27, v28);

    if (!v22)
    {
      -[_UIContextMenuContainerView sizeChangeHandler](self, "sizeChangeHandler");
      v23 = (void (**)(_QWORD, double, double))objc_claimAutoreleasedReturnValue();
      -[UIView frame](self, "frame");
      v23[2](v23, v24, v25);

    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuContainerView;
  -[UIView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  if (self->_passthroughInteraction)
    -[UIView removeInteraction:](self, "removeInteraction:");
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuContainerView;
  -[UIView _didMoveFromWindow:toWindow:](&v14, sel__didMoveFromWindow_toWindow_, v6, v7);
  objc_msgSend(v6, "_unregisterScrollToTopView:", self);
  objc_msgSend(v7, "_registerScrollToTopView:", self);
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == 6)
  {
    objc_msgSend(v6, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("UIWindowSceneWillUpdateEffectiveGeometryNotification"), v10);

    }
    objc_msgSend(v7, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__sceneGeometryWillUpdate_, CFSTR("UIWindowSceneWillUpdateEffectiveGeometryNotification"), v12);

    }
  }

}

- (void)_sceneGeometryWillUpdate:(id)a3
{
  -[_UIContextMenuContainerView _attemptDismiss:](self, "_attemptDismiss:", 0);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuContainerView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  if (self->_passthroughInteraction)
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[UIView addInteraction:](self, "addInteraction:", self->_passthroughInteraction);
  }
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  -[_UIContextMenuContainerView _attemptDismiss:](self, "_attemptDismiss:", 0);
  return 1;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  BOOL lastHitTestWasPassedThroughToInteraction;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  -[_UIContextMenuContainerView dismissalHandler](self, "dismissalHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || v10 && ((objc_msgSend(v10, "_modifierFlags") & 0x40000) != 0 || (objc_msgSend(v10, "_buttonMask") & 2) != 0))
  {
    lastHitTestWasPassedThroughToInteraction = 0;
  }
  else
  {
    self->_lastHitTestWasPassedThroughToInteraction = 0;
    objc_msgSend(v9, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:toView:", v13, x, y);
    v15 = v14;
    v17 = v16;

    -[UIView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hitTest:withEvent:", v10, v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    lastHitTestWasPassedThroughToInteraction = self->_lastHitTestWasPassedThroughToInteraction;
  }

  return lastHitTestWasPassedThroughToInteraction;
}

- (void)setPassesBackgroundViewTouchesThrough:(BOOL)a3
{
  if (self->_passesBackgroundViewTouchesThrough != a3)
  {
    -[_UIPassthroughScrollInteraction setEatsTouches:](self->_passthroughInteraction, "setEatsTouches:", !a3);
    self->_passesBackgroundViewTouchesThrough = a3;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIContextMenuContainerView *v8;
  void *v10;
  _UIContextMenuContainerView *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_inPassthroughViewHitTest)
  {
    self->_lastHitTestWasPassedThroughToInteraction = 0;
    v15.receiver = self;
    v15.super_class = (Class)_UIContextMenuContainerView;
    -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
    v8 = (_UIContextMenuContainerView *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuContainerView dismissalHandler](self, "dismissalHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_3;
    if (v8 != self)
    {
      -[_UIContextMenuContainerView contentWrapperView](self, "contentWrapperView");
      v11 = (_UIContextMenuContainerView *)objc_claimAutoreleasedReturnValue();

      if (v8 != v11)
        goto LABEL_19;
    }
    v12 = +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:](_UIPassthroughScrollInteraction, "_shouldEventBePassedThrough:", v7);
    v13 = objc_msgSend(v7, "type");
    v14 = v13;
    if (v12 || v13 == 11)
    {
      if (self->_passesBackgroundViewTouchesThrough)
      {

        if (v14 != 11)
          -[_UIContextMenuContainerView _attemptDismiss:](self, "_attemptDismiss:", 1);
        v8 = 0;
      }
      if (!v12)
      {
LABEL_19:
        if (v8)
          goto LABEL_3;
        goto LABEL_20;
      }
      self->_lastHitTestWasPassedThroughToInteraction = 1;
    }
    else if (!-[_UIContextMenuContainerView allowsDragEventsToPassthrough](self, "allowsDragEventsToPassthrough")
           || objc_msgSend(v7, "type") != 9)
    {
      goto LABEL_19;
    }

LABEL_20:
    if (v7 && ((objc_msgSend(v7, "_modifierFlags") & 0x40000) != 0 || (objc_msgSend(v7, "_buttonMask") & 2) != 0))
      -[_UIPassthroughScrollInteraction __forciblyEndWithReason:](self->_passthroughInteraction, "__forciblyEndWithReason:", 5);
  }
  v8 = 0;
LABEL_3:

  return v8;
}

- (void)_attemptDismiss:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void (**v6)(_QWORD);
  id v7;

  if (!self->_didDismiss)
  {
    v3 = a3;
    -[_UIContextMenuContainerView dismissalHandler](self, "dismissalHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      self->_didDismiss = 1;
      -[_UIContextMenuContainerView dismissalHandler](self, "dismissalHandler");
      v6 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3)
        dispatch_async(MEMORY[0x1E0C80D38], v6);
      else
        v6[2](v6);

    }
  }
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuContainerView;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v7, sel__traitCollectionDidChangeOnSubtreeInternal_);
  -[_UIContextMenuContainerView subtreeTraitPropagationHandler](self, "subtreeTraitPropagationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIContextMenuContainerView subtreeTraitPropagationHandler](self, "subtreeTraitPropagationHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const _UITraitCollectionChangeDescription *))v6)[2](v6, a3);

  }
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t, CGPoint, __n128))a4 + 2))(a4, 1, a3, *(__n128 *)&a3.y);
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (UIView)contentWrapperView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentWrapperView);
}

- (void)setContentWrapperView:(id)a3
{
  objc_storeWeak((id *)&self->_contentWrapperView, a3);
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (id)subtreeTraitPropagationHandler
{
  return self->_subtreeTraitPropagationHandler;
}

- (void)setSubtreeTraitPropagationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (id)sizeChangeHandler
{
  return self->_sizeChangeHandler;
}

- (void)setSizeChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (BOOL)passesBackgroundViewTouchesThrough
{
  return self->_passesBackgroundViewTouchesThrough;
}

- (BOOL)allowsDragEventsToPassthrough
{
  return self->_allowsDragEventsToPassthrough;
}

- (void)setAllowsDragEventsToPassthrough:(BOOL)a3
{
  self->_allowsDragEventsToPassthrough = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sizeChangeHandler, 0);
  objc_storeStrong(&self->_subtreeTraitPropagationHandler, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_destroyWeak((id *)&self->_contentWrapperView);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
}

@end
