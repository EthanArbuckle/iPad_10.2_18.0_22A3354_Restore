@implementation UIDropInteraction

- (void)willMoveToOwner:(id)a3
{
  id v4;

  -[UIDropInteractionContextImpl setState:](self->_context, "setState:", 0);
  -[UIDropInteraction interactionEffect](self, "interactionEffect");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interaction:didChangeWithContext:", self, self->_context);

}

- (UIDropInteractionEffect)interactionEffect
{
  return self->_interactionEffect;
}

- (void)didMoveToOwner:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UIDropInteraction *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_storeWeak((id *)&self->_owner, v4);
  if (!v4 && WeakRetained)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(WeakRetained, "gestureRecognizers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "delegate");
            v12 = (UIDropInteraction *)objc_claimAutoreleasedReturnValue();

            if (v12 == self)
            {
              objc_msgSend(WeakRetained, "removeGestureRecognizer:", v11);
              objc_msgSend(v11, "sessionDestination");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "activeDragEvent");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "_removeQueriedOwnerForDynamicGesturesIfNeeded:", WeakRetained);

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

- (UIView)view
{
  _UIDropInteractionOwning **p_owner;
  id WeakRetained;
  int IsKindOfUIView;
  id v5;

  p_owner = &self->_owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  IsKindOfUIView = _IsKindOfUIView((uint64_t)WeakRetained);

  if (IsKindOfUIView)
    v5 = objc_loadWeakRetained((id *)p_owner);
  else
    v5 = 0;
  return (UIView *)v5;
}

- (UIDropInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UIDropInteraction *v5;
  UIDropInteraction *v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  objc_super v19;

  v4 = delegate;
  v19.receiver = self;
  v19.super_class = (Class)UIDropInteraction;
  v5 = -[UIDropInteraction init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    _UIValidateAccountBasedDelegateRespondsToSelector(v4, (uint64_t)sel__dropInteraction_dataOwnerForSession_);
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFD | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 4;
    else
      v8 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFB | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 8;
    else
      v9 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFF7 | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 16;
    else
      v10 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFEF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 32;
    else
      v11 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFDF | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFBF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 128;
    else
      v13 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFF7F | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 256;
    else
      v14 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFEFF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 512;
    else
      v15 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFDFF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 1024;
    else
      v16 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFBFF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 2048;
    else
      v17 = 0;
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xF7FF | v17;
  }

  return v6;
}

- (void)setAllowsSimultaneousDropSessions:(BOOL)allowsSimultaneousDropSessions
{
  self->_allowsSimultaneousDropSessions = allowsSimultaneousDropSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_storeStrong((id *)&self->_pasteConfiguration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enteredDropSessionByDraggingSession, 0);
  objc_storeStrong((id *)&self->_activeDragGestureRecognizers, 0);
}

- (void)_setWantsDefaultVisualBehavior:(BOOL)a3
{
  id v4;

  if (self->_wantsDefaultVisualBehavior != a3)
  {
    self->_wantsDefaultVisualBehavior = a3;
    if (a3)
    {
      v4 = (id)objc_opt_new();
      -[UIDropInteraction setInteractionEffect:](self, "setInteractionEffect:", v4);

    }
    else
    {
      -[UIDropInteraction setInteractionEffect:](self, "setInteractionEffect:", 0);
    }
  }
}

- (id)_initWithPasteConfiguration:(id)a3
{
  id v5;
  UIDropInteraction *v6;
  UIDropInteraction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDropInteraction;
  v6 = -[UIDropInteraction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pasteConfiguration, a3);

  return v7;
}

- (id)_dynamicGestureRecognizersForEvent:(id)a3
{
  UIDropInteractionGestureRecognizer *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = -[UIDragGestureRecognizer initWithTarget:action:]([UIDropInteractionGestureRecognizer alloc], "initWithTarget:action:", self, sel__dragDestinationGestureStateChanged_);
  -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", self);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isActive
{
  return -[NSMutableSet count](self->_activeDragGestureRecognizers, "count") != 0;
}

- (UIDropInteractionContextImpl)context
{
  UIDropInteractionContextImpl *context;
  UIDropInteractionContextImpl *v4;
  UIDropInteractionContextImpl *v5;

  context = self->_context;
  if (!context)
  {
    v4 = (UIDropInteractionContextImpl *)objc_opt_new();
    v5 = self->_context;
    self->_context = v4;

    context = self->_context;
  }
  return context;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveDragEvent:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *activeDragGestureRecognizers;
  NSMutableSet *v9;
  NSMutableSet *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (((-[NSMutableSet containsObject:](self->_activeDragGestureRecognizers, "containsObject:", v6) & 1) != 0
     || !-[NSMutableSet count](self->_activeDragGestureRecognizers, "count")
     || -[UIDropInteraction _allowsSimultaneousDragWithEvent:](self, "_allowsSimultaneousDragWithEvent:", v7))
    && -[UIDropInteraction _canHandleDragEvent:](self, "_canHandleDragEvent:", v7))
  {
    activeDragGestureRecognizers = self->_activeDragGestureRecognizers;
    if (!activeDragGestureRecognizers)
    {
      v9 = (NSMutableSet *)objc_opt_new();
      v10 = self->_activeDragGestureRecognizers;
      self->_activeDragGestureRecognizers = v9;

      activeDragGestureRecognizers = self->_activeDragGestureRecognizers;
    }
    -[NSMutableSet addObject:](activeDragGestureRecognizers, "addObject:", v6);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  -[NSMutableSet removeObject:](self->_activeDragGestureRecognizers, "removeObject:", a3);
}

- (void)_dragDestinationGestureStateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int16 delegateImplements;
  uint64_t v31;
  id WeakRetained;
  unint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  UIDropInteraction *v41;
  id v42;
  id v43;
  id v44;
  unsigned __int8 v45[9];

  v4 = a3;
  -[UIDropInteraction delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dropSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDropInteraction owner](self, "owner");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[UIDropInteraction context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setState:", 1);

      -[UIDropInteraction interactionEffect](self, "interactionEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDropInteraction context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "interaction:didChangeWithContext:", self, v9);

      -[UIDropInteraction _dropSessionEntered:withSessionDestination:](self, "_dropSessionEntered:withSessionDestination:", v6, v5);
      if ((*(_WORD *)&self->_delegateImplements & 2) != 0)
        objc_msgSend(v35, "dropInteraction:sessionDidEnter:", self, v6);
      goto LABEL_4;
    case 2:
LABEL_4:
      if ((*(_WORD *)&self->_delegateImplements & 4) == 0)
      {
        -[UIDropInteraction _pasteConfiguration](self, "_pasteConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_21;
        v11 = 0;
        v12 = 0;
        v13 = objc_msgSend(v5, "sourceOperationMask") & 1;
        v14 = 1;
        goto LABEL_20;
      }
      objc_msgSend(v35, "dropInteraction:sessionDidUpdate:", self, v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = v28;
        delegateImplements = (__int16)self->_delegateImplements;
        v31 = objc_msgSend(v28, "operation");
        if (v31 == 3)
        {
          v13 = 16;
        }
        else if (v31 == 2)
        {
          v13 = 1;
        }
        else
        {
          v13 = 0;
          if (v31 == 1)
            v45[0] = 1;
        }
        v11 = objc_msgSend(v29, "isPrecise");
        v14 = objc_msgSend(v29, "prefersFullSizePreview");
        v12 = objc_msgSend(v29, "_preferredBadgeStyle");

        if ((delegateImplements & 0x10) != 0)
        {
LABEL_20:
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v33 = -[UIDropInteraction _validateDragOperation:forSelector:delegate:dropSession:onSession:forbidden:](self, "_validateDragOperation:forSelector:delegate:dropSession:onSession:forbidden:", v13, sel_dropInteraction_sessionDidUpdate_, WeakRetained, v6, v5, v45);

          -[UIDropInteraction _setLastDragOperation:forbidden:precise:prefersFullSizePreview:preferredBadgeStyle:onSession:](self, "_setLastDragOperation:forbidden:precise:prefersFullSizePreview:preferredBadgeStyle:onSession:", v33, v45[0], v11, v14, v12, v5);
        }
      }
LABEL_21:

      return;
    case 3:
      -[UIDropInteraction context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setState:", 3);

      -[UIDropInteraction interactionEffect](self, "interactionEffect");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDropInteraction context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "interaction:didChangeWithContext:", self, v17);

      if (self->_potentialDragOperation)
      {
        v18 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke;
        aBlock[3] = &unk_1E16B6F18;
        v19 = v35;
        v40 = v19;
        v41 = self;
        v20 = v6;
        v42 = v20;
        v21 = v5;
        v43 = v21;
        v22 = v34;
        v44 = v22;
        v23 = _Block_copy(aBlock);
        v36[0] = v18;
        v36[1] = 3221225472;
        v36[2] = __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke_2;
        v36[3] = &unk_1E16B47A8;
        v36[4] = self;
        v37 = v19;
        v38 = v20;
        v24 = _Block_copy(v36);
        objc_msgSend(v21, "requestDropOnOwner:withOperation:perform:completion:", v22, self->_potentialDragOperation, v23, v24);

      }
      goto LABEL_11;
    case 4:
      -[UIDropInteraction context](self, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setState:", 0);

      -[UIDropInteraction interactionEffect](self, "interactionEffect");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDropInteraction context](self, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "interaction:didChangeWithContext:", self, v27);

      if ((*(_WORD *)&self->_delegateImplements & 8) != 0)
        objc_msgSend(v35, "dropInteraction:sessionDidExit:", self, v6);
LABEL_11:
      -[NSMutableSet removeObject:](self->_activeDragGestureRecognizers, "removeObject:", v4);
      goto LABEL_21;
    default:
      goto LABEL_21;
  }
}

void __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke(id *a1)
{
  objc_class *v2;
  void *v3;
  int v4;
  _WORD *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("WKContentView"));

    if (v4)
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dropOnWebContent"));
  }
  objc_msgSend(a1[5], "_prepareItemsInSessionForDrop:", a1[6]);
  v5 = a1[5];
  if ((v5[16] & 0x10) != 0)
  {
    v7 = a1[7];
    v8 = a1[6];
    objc_msgSend(v7, "dropItemProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(v8, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v10)
    {
      v13 = v12;
      for (i = 0; i != v10; ++i)
      {
        if (i < v13)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", i);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_setDropItemProvider:", v15);

        }
      }
    }

    objc_msgSend(a1[4], "dropInteraction:performDrop:", a1[5], a1[6]);
    v17 = a1[6];
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v17, "items");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v22++), "_setDropItemProvider:", 0);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v20);
    }

  }
  else
  {
    objc_msgSend(v5, "_pasteConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(a1[7], "dropItemProviders");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      _UIDragEventPasteItemProvidersForOwner(v23, a1[8]);

    }
  }
}

uint64_t __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke_2(uint64_t result)
{
  if ((*(_WORD *)(*(_QWORD *)(result + 32) + 32) & 0x20) != 0)
    return objc_msgSend(*(id *)(result + 40), "dropInteraction:concludeDrop:");
  return result;
}

- (void)_prepareItemsInSessionForDrop:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "items", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setDestinationVisualTarget:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_windowForSetDownOfDragItem:(id)a3
{
  void *v3;
  void *v4;

  -[UIDropInteraction view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_setDownAnimation:(id)a3 updatedSetDownOfDragItem:(id)a4 preview:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;

  v7 = a5;
  v8 = a4;
  -[UIDropInteraction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dropInteraction:previewForDroppingItem:withDefault:", self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "container");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_window");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13 || (v14 = (void *)v13, v15 = objc_msgSend(v12, "isHiddenOrHasHiddenAncestor"), v14, v15))
    {

      v10 = 0;
    }

  }
  return v10;
}

- (id)_setDownAnimation:(id)a3 prepareForSetDownOfDragItem:(id)a4 visibleDroppedItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  UITargetedDragPreview *v13;
  void *v14;
  void *v15;
  UIDragPreviewParameters *v16;
  void *v17;
  void *v18;
  int v19;
  UIDragPreviewTarget *v20;
  uint64_t v21;
  char v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UIDragPreviewTarget *v33;
  void *v34;
  UITargetedDragPreview *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  unint64_t v42;
  NSObject *v43;
  void *v45;
  UIDragPreviewParameters *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "containerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v10)
    {
      __UIFaultDebugAssertLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_fault_impl(&dword_185066000, v41, OS_LOG_TYPE_FAULT, "droppedItem for draggingItem (%@) is nil", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_35;
    }
  }
  else if (!v10)
  {
    v42 = _setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem____s_category;
    if (!_setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem____s_category)
    {
      v42 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v42, (unint64_t *)&_setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem____s_category);
    }
    v43 = *(NSObject **)(v42 + 8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_ERROR, "droppedItem for draggingItem (%@) is nil", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_35;
  }
  if (!v11)
  {
LABEL_35:
    v13 = 0;
    goto LABEL_36;
  }
  -[UIDropInteraction delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_delegateImplements & 0x80) != 0)
  {
    objc_msgSend(v10, "createSnapshotView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preview");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(UIDragPreviewParameters);
    v46 = v16;

    -[UIDropInteraction view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (v19 = objc_msgSend(v17, "isHiddenOrHasHiddenAncestor"), v18, !v19))
    {
      objc_msgSend(v17, "superview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "center");
      v25 = v24;
      v27 = v26;
      objc_msgSend(v8, "containerView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "convertPoint:fromCoordinateSpace:", v28, v25, v27);
      v30 = v29;
      v32 = v31;

      v33 = [UIDragPreviewTarget alloc];
      objc_msgSend(v17, "superview");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[UIPreviewTarget initWithContainer:center:](v33, "initWithContainer:center:", v34, v30, v32);

      v22 = 1;
    }
    else
    {
      v20 = [UIDragPreviewTarget alloc];
      objc_msgSend(v10, "center");
      v21 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", v49);
      v22 = 0;
    }
    v45 = (void *)v21;
    v35 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v47, v46, v21);
    -[UITargetedPreview _setDefaultPreview:](v35, "_setDefaultPreview:", 1);
    objc_msgSend(v12, "dropInteraction:previewForDroppingItem:withDefault:", self, v11, v35);
    v13 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue();
    if (v13 == v35)
      v36 = v22;
    else
      v36 = 1;
    if ((v36 & 1) == 0)
    {

      v13 = 0;
    }
    if ((*(_WORD *)&self->_delegateImplements & 0x400) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v55 = 0x2020000000;
      v56 = 0;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __86__UIDropInteraction__setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem___block_invoke;
      v50[3] = &unk_1E16C4218;
      p_buf = &buf;
      v51 = v8;
      v52 = v11;
      objc_msgSend(v12, "_dropInteraction:delayedPreviewProviderForDroppingItem:previewProvider:", self, v52, v50);

      _Block_object_dispose(&buf, 8);
    }
    if (v13)
    {
      -[UITargetedPreview target](v13, "target");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "container");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "_window");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39 || (v40 = objc_msgSend(v38, "isHiddenOrHasHiddenAncestor"), v39, v40))
      {

        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

LABEL_36:
  return v13;
}

uint64_t __86__UIDropInteraction__setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "updateTargetedDragPreview:forDragItem:", a2, *(_QWORD *)(result + 40));
  }
  return result;
}

- (void)_setDownAnimation:(id)a3 willAnimateSetDownOfDragItem:(id)a4 withAnimator:(id)a5 preview:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _UIDragAnimatingWrapper *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    -[UIDropInteraction delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_WORD *)&self->_delegateImplements & 0x100) != 0)
    {
      v15 = -[_UIDragAnimatingWrapper initWithPropertyAnimator:]([_UIDragAnimatingWrapper alloc], "initWithPropertyAnimator:", v12);
      objc_msgSend(v14, "dropInteraction:item:willAnimateDropWithAnimator:", self, v11, v15);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v13, "_previewContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (!v15)
        v15 = -[_UIDragAnimatingWrapper initWithPropertyAnimator:]([_UIDragAnimatingWrapper alloc], "initWithPropertyAnimator:", v12);
      objc_msgSend(v13, "_previewContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __89__UIDropInteraction__setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview___block_invoke;
      v18[3] = &unk_1E16B1B50;
      v19 = v10;
      v20 = v11;
      objc_msgSend(v17, "_animateDropAlongsideAnimator:completion:", v15, v18);

    }
  }

}

uint64_t __89__UIDropInteraction__setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewContainerAnimationDidCompleteForDragItem:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_setDownAnimation:(id)a3 shouldDelaySetDownOfDragItem:(id)a4 completion:(id)a5
{
  return 0;
}

- (id)_setDownAnimation:(id)a3 customSpringAnimationBehaviorForSetDownOfDragItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[UIDropInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((*(_WORD *)&self->_delegateImplements & 0x800) != 0)
  {
    objc_msgSend(v6, "_dropInteraction:customSpringAnimationBehaviorForDroppingItem:", self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_canHandleDragEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char CanPasteItemProvidersForOwner;

  v4 = a3;
  -[UIDropInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_delegateImplements & 1) != 0)
  {
    objc_msgSend(v4, "_dropSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CanPasteItemProvidersForOwner = objc_msgSend(v5, "dropInteraction:canHandleSession:", self, v8);
  }
  else
  {
    -[UIDropInteraction _pasteConfiguration](self, "_pasteConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      CanPasteItemProvidersForOwner = 1;
      goto LABEL_7;
    }
    objc_msgSend(v4, "_sessionDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preDropItemProviders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDropInteraction owner](self, "owner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CanPasteItemProvidersForOwner = _UIDragEventCanPasteItemProvidersForOwner(v8, v9);

  }
LABEL_7:

  return CanPasteItemProvidersForOwner;
}

- (unint64_t)_validateDragOperation:(unint64_t)a3 forSelector:(SEL)a4 delegate:(id)a5 dropSession:(id)a6 onSession:(id)a7 forbidden:(BOOL *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  int v31;
  void *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (a3)
  {
    v18 = objc_msgSend(v16, "sourceOperationMask");
    if ((a3 & ~v18) != 0)
    {
      v19 = v18;
      v20 = _MergedGlobals_1019;
      if (!_MergedGlobals_1019)
      {
        v20 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&_MergedGlobals_1019);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v22 = v21;
      NSStringFromSelector(a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412802;
      v32 = v23;
      v33 = 2048;
      v34 = a3;
      v35 = 2048;
      v36 = v19;
      v24 = "Selector %@ returned a _UIDragOperation %lu that is outside of the sourceOperationMask %lu. Using _UIDragOpe"
            "rationNone instead.";
      v25 = v22;
      v26 = 32;
LABEL_15:
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v31, v26);

LABEL_16:
      a3 = 0;
      goto LABEL_17;
    }
    if ((a3 & (a3 - 1)) != 0)
    {
      v28 = qword_1ECD7D7B0;
      if (!qword_1ECD7D7B0)
      {
        v28 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&qword_1ECD7D7B0);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v22 = v29;
      NSStringFromSelector(a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412546;
      v32 = v23;
      v33 = 2048;
      v34 = a3;
      v24 = "Selector  %@ returned a _UIDragOperation %lu that contains more than one operation. Using _UIDragOperationNone instead.";
      v25 = v22;
      v26 = 22;
      goto LABEL_15;
    }
    if (_UIShouldEnforceOpenInRulesInAccountBasedApp()
      && (*(_WORD *)&self->_delegateImplements & 0x200) != 0)
    {
      v27 = objc_msgSend(v14, "_dropInteraction:dataOwnerForSession:", self, v15);
    }
    else
    {
      v27 = 0;
    }
    a3 = objc_msgSend(v17, "actualDragOperationForProposedDragOperation:destinationDataOwner:forbidden:", a3, v27, a8);
  }
LABEL_17:

  return a3;
}

- (unint64_t)_setLastDragOperation:(unint64_t)a3 forbidden:(BOOL)a4 precise:(BOOL)a5 prefersFullSizePreview:(BOOL)a6 preferredBadgeStyle:(int64_t)a7 onSession:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  unint64_t v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v14 = a8;
  v15 = objc_msgSend(v14, "sourceOperationMask") & a3;
  self->_potentialDragOperation = v15;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setOperation:", self->_potentialDragOperation);
  objc_msgSend(v16, "setForbidden:", v11);
  objc_msgSend(v16, "setPrecise:", v10);
  objc_msgSend(v16, "setPrefersFullSizePreview:", v9);
  objc_msgSend(v16, "setPreferredBadgeStyle:", a7);
  objc_msgSend(v14, "takePotentialDrop:", v16);

  return v15;
}

- (void)_dropSessionEntered:(id)a3 withSessionDestination:(id)a4
{
  id v6;
  NSMapTable *enteredDropSessionByDraggingSession;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  enteredDropSessionByDraggingSession = self->_enteredDropSessionByDraggingSession;
  if (!enteredDropSessionByDraggingSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_enteredDropSessionByDraggingSession;
    self->_enteredDropSessionByDraggingSession = v8;

    enteredDropSessionByDraggingSession = self->_enteredDropSessionByDraggingSession;
  }
  -[NSMapTable setObject:forKey:](enteredDropSessionByDraggingSession, "setObject:forKey:", v10, v6);
  objc_msgSend(v6, "enteredDestination:", self);

}

- (void)_sendSessionDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  UIDropInteraction *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIDropInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_enteredDropSessionByDraggingSession, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_enteredDropSessionByDraggingSession, "removeObjectForKey:", v4);
  if (os_variant_has_internal_diagnostics())
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v10 = 138412546;
        v11 = self;
        v12 = 2112;
        v13 = v4;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "dropInteraction (%@) unable to find entered drop session for dragging session (%@)", (uint8_t *)&v10, 0x16u);
      }

    }
  }
  else if (!v6)
  {
    v8 = _sendSessionDidEnd____s_category;
    if (!_sendSessionDidEnd____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_sendSessionDidEnd____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "dropInteraction (%@) unable to find entered drop session for dragging session (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
  if ((*(_WORD *)&self->_delegateImplements & 0x40) != 0)
    objc_msgSend(v5, "dropInteraction:sessionDidEnd:", self, v6);

}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UIDropInteraction");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsSimultaneousDropSessions
{
  return self->_allowsSimultaneousDropSessions;
}

- (_UIDropInteractionOwning)owner
{
  return (_UIDropInteractionOwning *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UIPasteConfiguration)_pasteConfiguration
{
  return self->_pasteConfiguration;
}

- (void)setInteractionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_interactionEffect, a3);
}

- (BOOL)_wantsDefaultVisualBehavior
{
  return self->_wantsDefaultVisualBehavior;
}

@end
