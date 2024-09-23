@implementation _UISheetPresentationInteraction

- (void)willMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UISheetPresentationInteraction view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 && v7 != v4)
  {
    -[_UISheetPresentationInteraction _panGestureRecognizer](self, "_panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v6);

    v5 = v7;
  }

}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UISheetPresentationInteraction setView:](self, "setView:", v5);
  if (v5)
  {
    -[_UISheetPresentationInteraction _panGestureRecognizer](self, "_panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v4);

  }
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;

  panGestureRecognizer = self->__panGestureRecognizer;
  if (!panGestureRecognizer)
  {
    v4 = objc_alloc_init(UIPanGestureRecognizer);
    v5 = self->__panGestureRecognizer;
    self->__panGestureRecognizer = v4;

    -[UIPanGestureRecognizer _setCanPanHorizontally:](self->__panGestureRecognizer, "_setCanPanHorizontally:", 0);
    -[UIGestureRecognizer addTarget:action:](self->__panGestureRecognizer, "addTarget:action:", self, sel__handlePan_);
    panGestureRecognizer = self->__panGestureRecognizer;
  }
  return panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer **p_panGestureRecognizer;
  void *v7;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v9;

  v5 = (UIPanGestureRecognizer *)a3;
  p_panGestureRecognizer = &self->__panGestureRecognizer;
  if (self->__panGestureRecognizer != v5)
  {
    v9 = v5;
    -[_UISheetPresentationInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    panGestureRecognizer = self->__panGestureRecognizer;
    if (panGestureRecognizer)
    {
      -[UIGestureRecognizer removeTarget:action:](panGestureRecognizer, "removeTarget:action:", self, sel__handlePan_);
      objc_msgSend(v7, "removeGestureRecognizer:", self->__panGestureRecognizer);
    }
    objc_storeStrong((id *)&self->__panGestureRecognizer, a3);
    if (*p_panGestureRecognizer)
    {
      -[UIGestureRecognizer addTarget:action:](*p_panGestureRecognizer, "addTarget:action:", self, sel__handlePan_);
      objc_msgSend(v7, "addGestureRecognizer:", self->__panGestureRecognizer);
    }

    v5 = v9;
  }

}

- (void)_handlePan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _UISheetPresentationInteraction *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[_UISheetPresentationInteraction _delegate](self, "_delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sheetPresentationInteractionPresentingViewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sheetPresentationInteractionPresentedViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "_sheetPresentationInteractionWillStartPresentationTransition:", self);
      objc_msgSend(v9, "_setPresentsWithGesture:", 1);
      objc_msgSend(v9, "_sheetInteraction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerPanGestureRecognizer:", v4);

      objc_msgSend(v4, "removeTarget:action:", self, sel__handlePan_);
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46___UISheetPresentationInteraction__handlePan___block_invoke;
      v18[3] = &unk_1E16B3F40;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v9, "set_presentationTransitionWillBegin:", v18);
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __46___UISheetPresentationInteraction__handlePan___block_invoke_2;
      v13[3] = &unk_1E16B51E8;
      v12 = v9;
      v14 = v12;
      v15 = v4;
      v16 = self;
      v17 = v5;
      objc_msgSend(v12, "_startInteractiveTransitionWithProgress:fromViewController:completion:", v6, v13, 0.0);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }

}

- (_UISheetPresentationInteractionDelegate)_delegate
{
  return (_UISheetPresentationInteractionDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
}

@end
