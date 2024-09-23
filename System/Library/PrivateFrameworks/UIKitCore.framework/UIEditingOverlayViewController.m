@implementation UIEditingOverlayViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIEditingOverlayViewController;
  -[UIViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEditingOverlayGestureView *v18;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[UIViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }

  v18 = -[UIView initWithFrame:]([UIEditingOverlayGestureView alloc], "initWithFrame:", v7, v9, v11, v13);
  -[UIView setAutoresizingMask:](v18, "setAutoresizingMask:", 18);
  -[UIViewController setView:](self, "setView:", v18);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateEditingOverlayContainer
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isTextEffectsWindow");

  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "actualSceneBounds");
  else
    objc_msgSend(v7, "_sceneBounds");
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[UIViewController view](self, "view", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "interactions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v23, "conformsToProtocol:", &unk_1EDFCD588))
          objc_msgSend(v23, "editingOverlayContainerDidChangeToSceneBounds:", v13, v14, v15, v16);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
  }

}

- (void)_addInteractions
{
  UIUndoGestureInteraction *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (UIUndoGestureInteraction *)objc_claimAutoreleasedReturnValue();
  if (-[UIUndoGestureInteraction userInterfaceIdiom](v3, "userInterfaceIdiom") != 3)
  {
    -[UIEditingOverlayViewController undoInteraction](self, "undoInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_5;
    v3 = objc_alloc_init(UIUndoGestureInteraction);
    -[UIEditingOverlayViewController setUndoInteraction:](self, "setUndoInteraction:", v3);
  }

LABEL_5:
  -[UIEditingOverlayViewController undoInteraction](self, "undoInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditingOverlayViewController undoInteraction](self, "undoInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInteraction:", v7);

  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_supportsPencil");

  if (v9)
  {
    +[_UIActionWhenIdle actionWhenIdleWithTarget:selector:object:](_UIActionWhenIdle, "actionWhenIdleWithTarget:selector:object:", self, sel__addPencilTextInputInteraction, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UIEditingOverlayViewController setAddPencilTextInputInteractionAction:](self, "setAddPencilTextInputInteractionAction:", v10);

  }
}

- (UIUndoGestureInteraction)undoInteraction
{
  return self->_undoInteraction;
}

- (void)setUndoInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_undoInteraction, a3);
}

- (void)_addPencilTextInputInteraction
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIKeyboardSuppressionPencilPolicyDelegate *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  -[UIEditingOverlayViewController addPencilTextInputInteractionAction](self, "addPencilTextInputInteractionAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIEditingOverlayViewController setAddPencilTextInputInteractionAction:](self, "setAddPencilTextInputInteractionAction:", 0);
  -[UIEditingOverlayViewController pencilTextInputInteraction](self, "pencilTextInputInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)_MergedGlobals_7_11;
    v17 = _MergedGlobals_7_11;
    if (!_MergedGlobals_7_11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getPKTextInputInteractionClass_block_invoke_0;
      v13[3] = &unk_1E16B14C0;
      v13[4] = &v14;
      __getPKTextInputInteractionClass_block_invoke_0((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    v7 = objc_alloc_init(v6);
    -[UIEditingOverlayViewController setPencilTextInputInteraction:](self, "setPencilTextInputInteraction:", v7);

  }
  -[UIEditingOverlayViewController pencilTextInputInteraction](self, "pencilTextInputInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditingOverlayViewController pencilTextInputInteraction](self, "pencilTextInputInteraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addInteraction:", v10);

  }
  +[UIKeyboard suppressionPolicyDelegate](UIKeyboard, "suppressionPolicyDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(_UIKeyboardSuppressionPencilPolicyDelegate);
    +[UIKeyboard setSuppressionPolicyDelegate:](UIKeyboard, "setSuppressionPolicyDelegate:", v12);

  }
}

- (void)_removeInteractions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UIEditingOverlayViewController undoInteraction](self, "undoInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIEditingOverlayViewController undoInteraction](self, "undoInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInteraction:", v5);

  }
  -[UIEditingOverlayViewController addPencilTextInputInteractionAction](self, "addPencilTextInputInteractionAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[UIEditingOverlayViewController setAddPencilTextInputInteractionAction:](self, "setAddPencilTextInputInteractionAction:", 0);
  -[UIEditingOverlayViewController pencilTextInputInteraction](self, "pencilTextInputInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIEditingOverlayViewController pencilTextInputInteraction](self, "pencilTextInputInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeInteraction:", v8);

  }
}

- (_UIActionWhenIdle)addPencilTextInputInteractionAction
{
  return self->_addPencilTextInputInteractionAction;
}

- (void)setAddPencilTextInputInteractionAction:(id)a3
{
  objc_storeStrong((id *)&self->_addPencilTextInputInteractionAction, a3);
}

- (UIInteraction)pencilTextInputInteraction
{
  return self->_pencilTextInputInteraction;
}

- (void)setPencilTextInputInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pencilTextInputInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilTextInputInteraction, 0);
  objc_storeStrong((id *)&self->_addPencilTextInputInteractionAction, 0);
  objc_storeStrong((id *)&self->_undoInteraction, 0);
}

@end
