@implementation UITextDragAssistant

uint64_t __51__UITextDragAssistant__viewHasOtherDragInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  char isKindOfClass;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  if (WeakRetained == v3)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)installDragInteractionIfNeeded
{
  UIDragInteraction **p_dragInteraction;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  UIDragInteraction *obj;

  p_dragInteraction = &self->_dragInteraction;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dragInteraction);
  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_view);
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE22F10);

    if (!v6)
      return;
    obj = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
    -[UIDragInteraction _setAllowsPointerDragBeforeLiftDelay:](obj, "_setAllowsPointerDragBeforeLiftDelay:", 0);
    objc_storeWeak((id *)p_dragInteraction, obj);
    v7 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v7, "addInteraction:", obj);

    -[UIDragInteraction setEnabled:](obj, "setEnabled:", -[UITextDragAssistant _viewHasOtherDragInteraction](self, "_viewHasOtherDragInteraction") ^ 1);
    WeakRetained = obj;
  }

}

- (void)installDropInteractionIfNeeded
{
  UIDropInteraction **p_dropInteraction;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  UIDropInteraction *v8;

  p_dropInteraction = &self->_dropInteraction;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dropInteraction);
  if (!WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_view);
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDE231D0);

    if (!v6)
      return;
    v8 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
    objc_storeWeak((id *)p_dropInteraction, v8);
    v7 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v7, "addInteraction:", v8);

    WeakRetained = v8;
  }

}

- (BOOL)_dragInteractionShouldBecomeDraggingSourceDelegate:(id)a3
{
  return !-[UITextDragAssistant _viewHasOtherDragInteraction](self, "_viewHasOtherDragInteraction", a3);
}

- (BOOL)_viewHasOtherDragInteraction
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__UITextDragAssistant__viewHasOtherDragInteraction__block_invoke;
  v7[3] = &unk_1E16E4ED8;
  v7[4] = self;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (UITextDragAssistant)initWithView:(id)a3 geometry:(id)a4
{
  id v7;
  id v8;
  UITextDragAssistant *v9;
  UITextDragAssistant *v10;
  uint64_t v11;
  NSMapTable *targetedPreviewProviders;
  uint64_t v13;
  NSMapTable *previewProviders;
  id WeakRetained;
  char v16;
  id v17;
  uint64_t v18;
  UITextDraggableGeometry *geometry;
  id v20;
  id v21;
  int v22;
  int v23;
  void *v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)UITextDragAssistant;
  v9 = -[UITextDragAssistant init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_view, v7);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    targetedPreviewProviders = v10->_targetedPreviewProviders;
    v10->_targetedPreviewProviders = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    previewProviders = v10->_previewProviders;
    v10->_previewProviders = (NSMapTable *)v13;

    if (v8)
      objc_storeStrong((id *)&v10->_geometry, a4);
    if (!v10->_geometry)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v10->_view);
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)&v10->_view);
        objc_msgSend(v17, "_textGeometry");
        v18 = objc_claimAutoreleasedReturnValue();
        geometry = v10->_geometry;
        v10->_geometry = (UITextDraggableGeometry *)v18;

      }
      if (!v10->_geometry)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("UITextDragAssistant.m"), 152, CFSTR("UITextDragAssistant can't be initialized without a geometry"));

      }
    }
    -[UITextDragAssistant _applyOptionsToGeometry](v10, "_applyOptionsToGeometry");
    v20 = objc_loadWeakRetained((id *)&v10->_view);
    v10->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&v10->_flags & 0xFFFFFFFE | objc_msgSend(v20, "conformsToProtocol:", &unk_1EDE21AE0));

    v21 = objc_loadWeakRetained((id *)&v10->_view);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = 0x8000;
    else
      v22 = 0;
    v10->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&v10->_flags & 0xFFFF7FFF | v22);

    if (-[UITextDraggableGeometry conformsToProtocol:](v10->_geometry, "conformsToProtocol:", &unk_1EE02CEA0))v23 = 2;
    else
      v23 = 0;
    v10->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&v10->_flags & 0xFFFFFFFD | v23);
  }

  return v10;
}

- (void)_applyOptionsToGeometry
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_msgSend(WeakRetained, "textDragOptions") & 1;

  -[UITextDraggableGeometry setGeometryOptions:](self->_geometry, "setGeometryOptions:", v4);
}

- (UITextDragAssistant)initWithView:(id)a3
{
  return -[UITextDragAssistant initWithView:geometry:](self, "initWithView:geometry:", a3, 0);
}

- (BOOL)isDragActive
{
  return self->_currentDragSession != 0;
}

- (BOOL)isDropActive
{
  return self->_currentDropSession != 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dropInteraction);
  objc_destroyWeak((id *)&self->_dragInteraction);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_delayedPreviewProvider, 0);
  objc_destroyWeak((id *)&self->_dropPasteSession);
  objc_storeStrong((id *)&self->_dropPasteController, 0);
  objc_storeStrong((id *)&self->_sameViewDropOperationResult, 0);
  objc_storeStrong((id *)&self->_sameViewDropOperation, 0);
  objc_storeStrong((id *)&self->_preDropSelectionRange, 0);
  objc_storeStrong((id *)&self->_currentDropProposal, 0);
  objc_storeStrong((id *)&self->_topmostDropPreview, 0);
  objc_storeStrong((id *)&self->_topmostDropItem, 0);
  objc_storeStrong((id *)&self->_currentDropRange, 0);
  objc_storeStrong((id *)&self->_dropCaret, 0);
  objc_storeStrong((id *)&self->_currentDropSession, 0);
  objc_destroyWeak((id *)&self->_observingStorage);
  objc_storeStrong((id *)&self->_previewProviders, 0);
  objc_storeStrong((id *)&self->_targetedPreviewProviders, 0);
  objc_storeStrong((id *)&self->_movedItemsInView, 0);
  objc_storeStrong((id *)&self->_initialDragSelectedRange, 0);
  objc_storeStrong((id *)&self->_draggedTextRanges, 0);
  objc_storeStrong((id *)&self->_currentDragInteraction, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
}

- (UITextDragAssistant)initWithDraggableOnlyView:(id)a3
{
  return -[UITextDragAssistant initWithView:geometry:](self, "initWithView:geometry:", a3, 0);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  int has_internal_diagnostics;
  UIDragSession *currentDragSession;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  UITextDragRequest *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v45;
  unint64_t v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint8_t buf[16];
  uint8_t v53[16];

  v6 = a3;
  v7 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v53 = 0;
      _os_log_fault_impl(&dword_185066000, v45, OS_LOG_TYPE_FAULT, "text dragging doesn't support beginning a new session", v53, 2u);
    }

  }
  else
  {
    if (!currentDragSession)
      goto LABEL_3;
    v46 = dragInteraction_itemsForBeginningSession____s_category_0;
    if (!dragInteraction_itemsForBeginningSession____s_category_0)
    {
      v46 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v46, (unint64_t *)&dragInteraction_itemsForBeginningSession____s_category_0);
    }
    v47 = *(NSObject **)(v46 + 8);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v47, OS_LOG_TYPE_ERROR, "text dragging doesn't support beginning a new session", buf, 2u);
    }
  }
  if (self->_currentDragSession)
    goto LABEL_12;
LABEL_3:
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dragStartedFromTextContent"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_view);
    v13 = objc_msgSend(v12, "isSelectable");

    if (!v13)
      goto LABEL_12;
  }
  v14 = objc_loadWeakRetained((id *)&self->_view);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_view);
    v17 = objc_msgSend(v16, "_isInteractiveTextSelectionDisabled");

    if ((v17 & 1) != 0)
      goto LABEL_12;
  }
  v18 = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = objc_msgSend(v18, "_shouldObscureInput");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      goto LABEL_14;
    }
    v19 = objc_msgSend(v18, "isSecureTextEntry");
  }
  v20 = v19;

  if ((v20 & 1) != 0)
  {
LABEL_12:
    v21 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_28;
  }
LABEL_14:
  v22 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v22, "textDragDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v7, "locationInView:", v24);
  -[UITextDragAssistant _textRangeForDraggingFromPoint:](self, "_textRangeForDraggingFromPoint:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v7, "locationInView:", v26);
    v28 = v27;
    v30 = v29;

    -[UITextDragAssistant _closestPositionToPoint:](self, "_closestPositionToPoint:", v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v23, "textDraggableView:textRangeForDragFromPosition:defaultRange:session:", v32, v31, v25, v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      v34 = objc_loadWeakRetained((id *)&self->_view);
      v49 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v49, "beginningOfDocument");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v6;
      v35 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v35, "endOfDocument");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "textRangeFromPosition:toPosition:", v48, v36);
      v50 = v31;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_intersectionOfRange:andRange:", v33, v37);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v50;
      v6 = v51;

    }
    else
    {
      v25 = 0;
    }

  }
  if (v25)
  {
    -[UITextDragAssistant _itemsForDraggedRange:](self, "_itemsForDraggedRange:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v38 = -[UITextDragRequest initWithRange:inSession:]([UITextDragRequest alloc], "initWithRange:inSession:", v25, v7);
      -[UITextDragRequest setSuggestedItems:](v38, "setSuggestedItems:", v21);
      v39 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v39, "selectedTextRange");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextDragRequest setSelected:](v38, "setSelected:", objc_msgSend(v40, "isEqual:", v25));

      v41 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v23, "textDraggableView:itemsForDrag:", v41, v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextDragRequest suggestedItems](v38, "suggestedItems");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _UIDragStatisticsLogTextDelegateItems(v43, v42);

      v21 = v42;
    }
    if (objc_msgSend(v21, "count", v48))
    {
      -[UITextDragAssistant _initializeDragSession:withInteraction:](self, "_initializeDragSession:withInteraction:", v7, v6);
      -[UITextDragAssistant _addDraggedTextRangeForItems:defaultRange:](self, "_addDraggedTextRangeForItems:defaultRange:", v21, v25);
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_28:
  return v21;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  UIDragSession *v8;
  void *v9;
  id v10;
  char v11;
  char v12;
  void *v13;
  id WeakRetained;
  void *v15;
  UITextDragRequest *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  y = a5.y;
  x = a5.x;
  v8 = (UIDragSession *)a4;
  if (self->_currentDragSession != v8)
    goto LABEL_2;
  v10 = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "_shouldObscureInput");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      goto LABEL_10;
    }
    v11 = objc_msgSend(v10, "isSecureTextEntry");
  }
  v12 = v11;

  if ((v12 & 1) != 0)
  {
LABEL_2:
    v9 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_20;
  }
LABEL_10:
  -[UITextDragAssistant _textRangeForDraggingFromPoint:](self, "_textRangeForDraggingFromPoint:", x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && !-[UITextDragAssistant _hasDraggedTextRange:](self, "_hasDraggedTextRange:", v13))
  {
    -[UITextDragAssistant _itemsForDraggedRange:](self, "_itemsForDraggedRange:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "textDragDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = -[UITextDragRequest initWithRange:inSession:]([UITextDragRequest alloc], "initWithRange:inSession:", v13, v8);
      -[UITextDragRequest setSuggestedItems:](v16, "setSuggestedItems:", v9);
      v17 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v17, "selectedTextRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextDragRequest setSelected:](v16, "setSelected:", objc_msgSend(v18, "isEqual:", v13));

      v19 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v15, "textDraggableView:itemsForDrag:", v19, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextDragRequest suggestedItems](v16, "suggestedItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _UIDragStatisticsLogTextDelegateItems(v21, v20);

      v9 = v20;
    }
    if (objc_msgSend(v9, "count"))
      -[UITextDragAssistant _addDraggedTextRangeForItems:defaultRange:](self, "_addDraggedTextRangeForItems:defaultRange:", v9, v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_20:
  return v9;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  UIDragSession *v10;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (self->_currentDragSession && objc_msgSend(v8, "containsObject:"))
    v10 = self->_currentDragSession;
  else
    v10 = 0;

  return v10;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  UITextDragSupporting **p_view;
  id WeakRetained;
  id v14;

  v7 = a4;
  v8 = a5;
  -[NSMapTable objectForKey:](self->_targetedPreviewProviders, "objectForKey:", v7);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UITextDragAssistant _containerViewForLiftPreviews](self, "_containerViewForLiftPreviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v9)[2](v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "textDragDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v10, "textDraggableView:dragPreviewForLiftingItem:session:", v14, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v18[3] = &unk_1E16B1B28;
  v12 = v8;
  v19 = v12;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);
  -[UITextDragAssistant _ghostDraggedTextRanges:](self, "_ghostDraggedTextRanges:", 1);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v17[3] = &unk_1E16B42D0;
  v17[4] = self;
  objc_msgSend(v9, "addCompletion:", v17);
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDragDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v15, "textDraggableView:willAnimateLiftWithAnimator:session:", v16, v9, v10);

  }
}

void __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissCurrentMenu");

}

void __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_liftOrDrag:didEndWithOperation:", 1, 0);
  }
  else if (!a2)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) |= 8u;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
    objc_msgSend(WeakRetained, "draggingStarted");

  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  UITextDragSupporting **p_view;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v6 = a4;
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v10, "willGenerateCancelPreview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    -[NSMapTable objectForKey:](self->_targetedPreviewProviders, "objectForKey:", v6);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UITextDragAssistant _containerViewForDropPreviews](self, "_containerViewForDropPreviews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v15, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = 0;
    }
    v16 = objc_loadWeakRetained((id *)p_view);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v18, "didGenerateCancelPreview:", v11);

    }
    if (v12)
    {
      objc_msgSend(v12, "target");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "container");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v20, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      objc_msgSend(v12, "size");
      v30 = v29 / -3.0;
      objc_msgSend(v12, "size");
      v32 = v31 / -3.0;
      v43.origin.x = v22;
      v43.origin.y = v24;
      v43.size.width = v26;
      v43.size.height = v28;
      v44 = CGRectInset(v43, v30, v32);
      x = v44.origin.x;
      y = v44.origin.y;
      width = v44.size.width;
      height = v44.size.height;
      objc_msgSend(v12, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v46.origin.x = v38;
      v46.origin.y = v39;
      v46.size.width = v40;
      v46.size.height = v41;
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      LOBYTE(v20) = CGRectIntersectsRect(v45, v46);

      if ((v20 & 1) == 0)
      {

        v12 = 0;
      }
    }

  }
  return v12;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6;
  $C912E3BC1DC90FDEFCD7C2A8FB71B35A flags;
  id WeakRetained;
  char v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v6 = a5;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
    self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&flags | 0x10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v9 = objc_opt_respondsToSelector();

    v10 = MEMORY[0x1E0C809B0];
    if ((v9 & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
      v12[3] = &unk_1E16B1B28;
      v12[4] = self;
      objc_msgSend(v6, "addAnimations:", v12);
    }
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2;
    v11[3] = &unk_1E16B42D0;
    v11[4] = self;
    objc_msgSend(v6, "addCompletion:", v11);
  }

}

void __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
  objc_msgSend(WeakRetained, "performCancelAnimations");

}

uint64_t __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_restoreResponderIfNeededForOperation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_clearDraggedTextRanges");
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  int has_internal_diagnostics;
  UIDragSession *currentDragSession;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id WeakRetained;
  id v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  $C912E3BC1DC90FDEFCD7C2A8FB71B35A flags;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[8];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      __UIFaultDebugAssertLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "sessionWillBegin without current drag session", buf, 2u);
      }

    }
  }
  else if (!currentDragSession)
  {
    v27 = dragInteraction_sessionWillBegin____s_category;
    if (!dragInteraction_sessionWillBegin____s_category)
    {
      v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&dragInteraction_sessionWillBegin____s_category);
    }
    v28 = *(NSObject **)(v27 + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "sessionWillBegin without current drag session", buf, 2u);
    }
  }
  *(_DWORD *)&self->_flags &= ~0x10u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "items", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_previewProviders, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "setPreviewProvider:", v14);
          -[NSMapTable removeObjectForKey:](self->_previewProviders, "removeObjectForKey:", v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "resignFirstResponder");

  v16 = objc_loadWeakRetained((id *)&self->_view);
  v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EE0300B0);

  if (v17)
  {
    v18 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v18, "cancelInteractionWithLink");

  }
  v19 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v19, "textDragDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v20, "textDraggableView:dragSessionWillBegin:", v21, v5);

  }
  flags = self->_flags;
  self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&flags & 0xFFFEFFFF);
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    v23 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v23, "textStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_storeWeak((id *)&self->_observingStorage, v24);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObserver:selector:name:object:", self, sel__textStorageDidProcessEditing, *(_QWORD *)off_1E16791A8, v24);

    }
  }
  -[UITextDragAssistant _ghostDraggedTextRanges:](self, "_ghostDraggedTextRanges:", 1);

}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  int has_internal_diagnostics;
  UIDragSession *currentDragSession;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "sessionDidMove without current drag session", buf, 2u);
      }

    }
  }
  else if (!currentDragSession)
  {
    v8 = dragInteraction_sessionDidMove____s_category;
    if (!dragInteraction_sessionDidMove____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&dragInteraction_sessionDidMove____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "sessionDidMove without current drag session", v10, 2u);
    }
  }
  *(_DWORD *)&self->_flags &= ~4u;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  int has_internal_diagnostics;
  UIDragSession *currentDragSession;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "session:willEndWithOperation: without current drag session", buf, 2u);
      }

    }
  }
  else if (!currentDragSession)
  {
    v10 = dragInteraction_session_willEndWithOperation____s_category;
    if (!dragInteraction_session_willEndWithOperation____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&dragInteraction_session_willEndWithOperation____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "session:willEndWithOperation: without current drag session", buf, 2u);
    }
  }
  -[UITextDragAssistant _stopObservingTextStorage](self, "_stopObservingTextStorage");
  if (a5 != 3 || self->_sameViewDropOperationResult)
  {
    if (!a5)
      return;
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__UITextDragAssistant_dragInteraction_session_willEndWithOperation___block_invoke;
    v12[3] = &unk_1E16B6F90;
    v12[4] = self;
    -[UITextDragAssistant _forDraggedTextRangesDo:](self, "_forDraggedTextRangesDo:", v12);
  }
  -[UITextDragAssistant _restoreResponderIfNeededForOperation:](self, "_restoreResponderIfNeededForOperation:", a5);
}

void __68__UITextDragAssistant_dragInteraction_session_willEndWithOperation___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 200);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setSelectedTextRange:", v4);

  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
  objc_msgSend(v6, "deleteBackward");

}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v7;
  int has_internal_diagnostics;
  UIDragSession *currentDragSession;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v7 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "session:didEndWithOperation: without current drag session", buf, 2u);
      }

    }
  }
  else if (!currentDragSession)
  {
    v14 = dragInteraction_session_didEndWithOperation____s_category;
    if (!dragInteraction_session_didEndWithOperation____s_category)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&dragInteraction_session_didEndWithOperation____s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "session:didEndWithOperation: without current drag session", v16, 2u);
    }
  }
  -[UITextDragAssistant _stopObservingTextStorage](self, "_stopObservingTextStorage");
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDragDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v11, "textDraggableView:dragSessionDidEnd:withOperation:", v12, v7, a5);

  }
  -[UITextDragAssistant _liftOrDrag:didEndWithOperation:](self, "_liftOrDrag:didEndWithOperation:", 0, a5);

}

- (void)_liftOrDrag:(int64_t)a3 didEndWithOperation:(unint64_t)a4
{
  id WeakRetained;
  UIDragSession *currentDragSession;
  UIDragInteraction *currentDragInteraction;
  id v10;
  id v11;

  -[UITextDragAssistant _clearDraggedTextRanges](self, "_clearDraggedTextRanges");
  if (a4 >= 2 && !self->_sameViewDropOperationResult)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "setSelectedTextRange:", 0);

  }
  -[UITextDragAssistant _restoreResponderIfNeededForOperation:](self, "_restoreResponderIfNeededForOperation:", a4);
  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  currentDragInteraction = self->_currentDragInteraction;
  self->_currentDragInteraction = 0;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v11 = (id)objc_opt_new();
    objc_msgSend(v11, "setDragTearoffOccured:", a3 == 0);
    if (a3 == 1)
      objc_msgSend(v11, "setLocation:", self->_initialDragLocation.x, self->_initialDragLocation.y);
    v10 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v10, "draggingFinished:", v11);

    *(_DWORD *)&self->_flags &= ~8u;
  }
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  id v5;
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v8;
  id v9;

  v5 = a4;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_view);
    LOBYTE(p_view) = objc_msgSend(v8, "_textDraggableView:beginningDragShouldDelayCompetingGestureRecognizer:", v9, v5);
  }
  else
  {
    if (!objc_msgSend(v5, "_isGestureType:", 6))
    {
      LOBYTE(p_view) = 1;
      goto LABEL_8;
    }
    v9 = objc_loadWeakRetained((id *)p_view);
    LODWORD(p_view) = objc_msgSend(v9, "isEditing") ^ 1;
  }

LABEL_8:
  return (char)p_view;
}

- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a4;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "gestureRecognizerShouldDelayLift:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  UITextDragSupporting **p_view;
  id v6;
  id WeakRetained;
  int64_t v8;

  p_view = &self->_view;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v6, "locationInView:", WeakRetained);
  v8 = -[UITextDragAssistant _dataOwnerForSession:atPoint:](self, "_dataOwnerForSession:atPoint:", v6);

  return v8;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return -[UITextDragAssistant _dataOwnerForSession:atPoint:](self, "_dataOwnerForSession:atPoint:", a4, a5.x, a5.y);
}

- (int64_t)_dataOwnerForSession:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v10;
  void *v11;
  UITextDragRequest *v12;
  id v13;
  int64_t v14;
  id v15;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDragDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UITextDragAssistant _textRangeForDraggingFromPoint:](self, "_textRangeForDraggingFromPoint:", x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[UITextDragRequest initWithRange:inSession:]([UITextDragRequest alloc], "initWithRange:inSession:", v11, v7);
      v13 = objc_loadWeakRetained((id *)p_view);
      v14 = objc_msgSend(v10, "_textDraggableView:dataOwnerForDrag:", v13, v12);

    }
    else
    {
      v14 = 0;
    }
    goto LABEL_7;
  }
  v15 = objc_loadWeakRetained((id *)&self->_view);
  v14 = objc_msgSend(v15, "_dragDataOwner");

  if (!v14)
  {
    v11 = objc_loadWeakRetained((id *)p_view);
    v14 = objc_msgSend(v11, "_dataOwnerForCopy");
LABEL_7:

  }
  return v14;
}

- (BOOL)accessibilityCanDrag
{
  void *v2;
  BOOL v3;

  -[UITextDragAssistant _accessibilityDraggableRanges](self, "_accessibilityDraggableRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)notifyTextInteraction
{
  -[UIDragInteraction _cancelLift](self->_currentDragInteraction, "_cancelLift");
}

- (id)_accessibilityDraggableRanges
{
  UITextDragSupporting **p_view;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)p_view);
  v7 = v6;
  if ((v5 & 1) != 0)
    objc_msgSend(v6, "_accessibilityVisibleTextRangeForDrag");
  else
    objc_msgSend(v6, "_fullRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = objc_loadWeakRetained((id *)p_view);
  v11 = objc_msgSend(v10, "isFirstResponder");

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v12, "selectedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if ((objc_msgSend(v13, "isEmpty") & 1) == 0)
      {
        v14 = objc_loadWeakRetained((id *)p_view);
        v15 = objc_msgSend(v14, "_range:containsRange:", v8, v13);

        if (v15)
          objc_msgSend(v9, "addObject:", v13);
      }
    }

  }
  -[UITextDragAssistant geometry](self, "geometry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textRangesForAttachmentsInTextRange:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v17);

  v18 = (void *)objc_msgSend(v9, "copy");
  return v18;
}

- (void)_textStorageDidProcessEditing
{
  -[UITextDragAssistant _clearDraggedTextRanges](self, "_clearDraggedTextRanges");
  -[UITextDragAssistant _stopObservingTextStorage](self, "_stopObservingTextStorage");
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_stopObservingTextStorage
{
  NSTextStorage **p_observingStorage;
  void *v4;
  id WeakRetained;

  p_observingStorage = &self->_observingStorage;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observingStorage);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *(_QWORD *)off_1E16791A8, WeakRetained);

    objc_storeWeak((id *)p_observingStorage, 0);
  }

}

- (id)_textRangeForDraggingFromPoint:(CGPoint)a3
{
  double y;
  double x;
  UITextDragSupporting **p_view;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  y = a3.y;
  x = a3.x;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v8 = objc_msgSend(WeakRetained, "isFirstResponder");

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v9, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if ((objc_msgSend(v10, "isEmpty") & 1) == 0)
      {
        v11 = objc_loadWeakRetained((id *)p_view);
        v12 = UITextRangeContainsPointInViewWithSlop(v11, v10, x, y, 4.0);

        if ((v12 & 1) != 0)
          return v10;
      }
    }

  }
  -[UITextDragAssistant _closestPositionToPoint:](self, "_closestPositionToPoint:", x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v14, "_rangeOfLineEnclosingPosition:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_msgSend(v15, "isEmpty") & 1) == 0)
  {
    -[UITextDragAssistant geometry](self, "geometry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textRangeForAttachmentInTextRange:atPoint:", v15, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_initializeDragSession:(id)a3 withInteraction:(id)a4
{
  id v7;
  id WeakRetained;
  int v9;
  void *v10;
  UITextRange *v11;
  UITextRange *initialDragSelectedRange;
  id v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  int v17;
  UITextDraggableGeometrySameViewDropOperationResult *sameViewDropOperationResult;
  id v19;

  v19 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_currentDragSession, a3);
  objc_storeStrong((id *)&self->_currentDragInteraction, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v9 = objc_msgSend(WeakRetained, "isFirstResponder");

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v10, "selectedTextRange");
    v11 = (UITextRange *)objc_claimAutoreleasedReturnValue();
    initialDragSelectedRange = self->_initialDragSelectedRange;
    self->_initialDragSelectedRange = v11;

  }
  else
  {
    v10 = self->_initialDragSelectedRange;
    self->_initialDragSelectedRange = 0;
  }

  v13 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v19, "locationInView:", v13);
  self->_initialDragLocation.x = v14;
  self->_initialDragLocation.y = v15;

  -[UITextDragAssistant _clearDraggedTextRanges](self, "_clearDraggedTextRanges");
  v16 = objc_loadWeakRetained((id *)&self->_view);
  if (objc_msgSend(v16, "isFirstResponder"))
    v17 = 4;
  else
    v17 = 0;
  self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v17);

  sameViewDropOperationResult = self->_sameViewDropOperationResult;
  self->_sameViewDropOperationResult = 0;

}

- (void)_restoreResponderIfNeededForOperation:(unint64_t)a3
{
  UITextRange *v4;
  id WeakRetained;
  UITextRange *initialDragSelectedRange;
  UITextDragSupporting **p_view;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (a3 <= 1 && (v4 = self->_initialDragSelectedRange) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "setSelectedTextRange:", v4);

    initialDragSelectedRange = self->_initialDragSelectedRange;
    self->_initialDragSelectedRange = 0;

  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    return;
  }
  p_view = &self->_view;
  v8 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_firstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v11, "becomeFirstResponder");

  }
}

- (id)_itemsForDraggedRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  UIDragItem *v13;
  void *v14;
  void *v15;
  NSMapTable *targetedPreviewProviders;
  void *v17;
  void *v18;
  void *v19;
  NSMapTable *previewProviders;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITextDragAssistant geometry](self, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggableObjectsForTextRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v26 = v4;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "itemProvider", v25);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v12);
          objc_msgSend(v11, "range");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDragItem _setDraggedTextRange:](v13, "_setDraggedTextRange:", v14);

          objc_msgSend(v11, "targetedPreviewProvider");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            targetedPreviewProviders = self->_targetedPreviewProviders;
            objc_msgSend(v11, "targetedPreviewProvider");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = _Block_copy(v17);
            -[NSMapTable setObject:forKey:](targetedPreviewProviders, "setObject:forKey:", v18, v13);

          }
          objc_msgSend(v11, "previewProvider");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            previewProviders = self->_previewProviders;
            objc_msgSend(v11, "previewProvider");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = _Block_copy(v21);
            -[NSMapTable setObject:forKey:](previewProviders, "setObject:forKey:", v22, v13);

          }
          objc_msgSend(v28, "addObject:", v13);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }

    v23 = (void *)objc_msgSend(v28, "copy");
    v6 = v25;
    v4 = v26;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (id)_containerViewForLiftPreviews
{
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_loadWeakRetained((id *)p_view);
  v9 = v8;

  return v9;
}

- (id)_containerViewForDropPreviews
{
  return objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)_hasDraggedTextRange:(id)a3
{
  return -[NSArray containsObject:](self->_draggedTextRanges, "containsObject:", a3);
}

- (void)_addDraggedTextRangeForItems:(id)a3 defaultRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *draggedTextRanges;
  NSArray *v19;
  NSArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "_draggedTextRange", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          objc_msgSend(v14, "_setDraggedTextRange:", v7);
        objc_msgSend(v14, "_draggedTextRange");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v14, "_draggedTextRange");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  draggedTextRanges = self->_draggedTextRanges;
  if (draggedTextRanges)
  {
    -[NSArray arrayByAddingObjectsFromArray:](draggedTextRanges, "arrayByAddingObjectsFromArray:", v8);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (NSArray *)objc_msgSend(v8, "copy");
  }
  v20 = self->_draggedTextRanges;
  self->_draggedTextRanges = v19;

}

- (void)_forDraggedTextRangesDo:(id)a3
{
  void (**v4)(id, _QWORD);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_draggedTextRanges;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_clearDraggedTextRanges
{
  NSArray *draggedTextRanges;

  -[UITextDragAssistant _ghostDraggedTextRanges:](self, "_ghostDraggedTextRanges:", 0);
  draggedTextRanges = self->_draggedTextRanges;
  self->_draggedTextRanges = 0;

}

- (void)_ghostDraggedTextRanges:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "removeAllGhostedRanges");
    if (v3)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__UITextDragAssistant__ghostDraggedTextRanges___block_invoke;
      v6[3] = &unk_1E16B6F90;
      v7 = WeakRetained;
      -[UITextDragAssistant _forDraggedTextRangesDo:](self, "_forDraggedTextRangesDo:", v6);

    }
  }
}

uint64_t __47__UITextDragAssistant__ghostDraggedTextRanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addGhostedRange:", a2);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  UIDropSession *v7;
  UIDropSession *v8;
  UIDropSession *currentDropSession;
  BOOL v10;
  void *v11;
  void *v12;
  id WeakRetained;
  int v14;
  id v15;
  int v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int flags;
  unint64_t v28;
  NSObject *v29;
  id v30;
  char v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  int v36;
  id v37;
  unsigned __int8 v38;
  id v39;
  unsigned __int8 v40;
  int v41;
  id v42;
  int v43;
  NSObject *v45;
  __int16 v46[8];
  uint8_t buf[16];

  v6 = a3;
  v7 = (UIDropSession *)a4;
  v8 = v7;
  currentDropSession = self->_currentDropSession;
  if (!currentDropSession)
  {
    -[UIDropSession items](v7, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKeyPath:", CFSTR("itemProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v14 = objc_msgSend(WeakRetained, "canPasteItemProviders:", v12);

    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)&self->_view);
      v16 = objc_msgSend(v15, "canBecomeDropResponder");

      if (v16)
      {
        *(_DWORD *)&self->_flags &= ~0x100u;
        v17 = objc_loadWeakRetained((id *)&self->_view);
        v18 = objc_msgSend(v17, "isEditable");

        if ((v18 & 1) != 0)
          goto LABEL_7;
        v30 = objc_loadWeakRetained((id *)&self->_view);
        v31 = objc_opt_respondsToSelector();

        if ((v31 & 1) != 0)
        {
          v32 = objc_loadWeakRetained((id *)&self->_view);
          objc_msgSend(v32, "textDropDelegate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", 0, v8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_loadWeakRetained((id *)&self->_view);
            v35 = objc_msgSend(v33, "textDroppableView:willBecomeEditableForDrop:", v34, v20);

            if (v35)
            {
              if (v35 == 1)
                v36 = 288;
              else
                v36 = 256;
              self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v36);
              v37 = objc_loadWeakRetained((id *)&self->_view);
              v38 = objc_opt_respondsToSelector();

              v39 = objc_loadWeakRetained((id *)&self->_view);
              v40 = objc_opt_respondsToSelector();

              if ((v40 & v38 & 1) != 0)
                v41 = 64;
              else
                v41 = 0;
              self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v41);
              if ((v40 & v38 & 1) != 0)
              {
                v42 = objc_loadWeakRetained((id *)&self->_view);
                if (objc_msgSend(v42, "isSelectable"))
                  v43 = 128;
                else
                  v43 = 0;
                self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v43);

              }
LABEL_7:
              v19 = objc_loadWeakRetained((id *)&self->_view);
              objc_msgSend(v19, "textDropDelegate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v21 = 512;
                else
                  v21 = 0;
                self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v21);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v22 = 1024;
                else
                  v22 = 0;
                self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v22);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v23 = 2048;
                else
                  v23 = 0;
                self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v23);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v24 = 4096;
                else
                  v24 = 0;
                self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v24);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v25 = 0x2000;
                else
                  v25 = 0;
                self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v25);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v26 = 0x4000;
                else
                  v26 = 0;
                flags = self->_flags;
              }
              else
              {
                v26 = 0;
                flags = *(_DWORD *)&self->_flags & 0xFFFFC1FF;
              }
              self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(flags & 0xFFFFBFFF | v26);
              -[UITextDragAssistant _updateCurrentDropProposalInSession:usingRequest:](self, "_updateCurrentDropProposalInSession:usingRequest:", v8, 0);
              if (-[UIDropProposal operation](self->_currentDropProposal, "operation") == UIDropOperationMove
                || -[UIDropProposal operation](self->_currentDropProposal, "operation") == UIDropOperationCopy)
              {
                v10 = 1;
LABEL_59:

                goto LABEL_50;
              }
LABEL_58:
              v10 = 0;
              goto LABEL_59;
            }
          }
          else
          {
            v20 = 0;
          }

          goto LABEL_58;
        }
      }
    }
    v10 = 0;
LABEL_50:

    goto LABEL_51;
  }
  if (currentDropSession == v7)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v45, OS_LOG_TYPE_FAULT, "canHandleSession with the current session!", buf, 2u);
      }

    }
    else
    {
      v28 = dropInteraction_canHandleSession____s_category;
      if (!dropInteraction_canHandleSession____s_category)
      {
        v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&dropInteraction_canHandleSession____s_category);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v46[0] = 0;
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "canHandleSession with the current session!", (uint8_t *)v46, 2u);
      }
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
LABEL_51:

  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  int has_internal_diagnostics;
  UIDropSession *currentDropSession;
  UITextDragSupporting **p_view;
  id WeakRetained;
  UITextRange *v11;
  UITextRange *preDropSelectionRange;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v6 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (currentDropSession)
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "sessionDidEnter with a current drop session", buf, 2u);
      }

    }
  }
  else if (currentDropSession)
  {
    v18 = dropInteraction_sessionDidEnter____s_category;
    if (!dropInteraction_sessionDidEnter____s_category)
    {
      v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&dropInteraction_sessionDidEnter____s_category);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "sessionDidEnter with a current drop session", v20, 2u);
    }
  }
  *(_DWORD *)&self->_flags &= ~0x20000u;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "selectedTextRange");
  v11 = (UITextRange *)objc_claimAutoreleasedReturnValue();
  preDropSelectionRange = self->_preDropSelectionRange;
  self->_preDropSelectionRange = v11;

  objc_storeStrong((id *)&self->_currentDropSession, a4);
  v13 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v13, "becomeDropResponder");

  v14 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v14, "textDropDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v15, "textDroppableView:dropSessionDidEnter:", v16, v6);

  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  int has_internal_diagnostics;
  UIDropSession *currentDropSession;
  id WeakRetained;
  void *v9;
  $C912E3BC1DC90FDEFCD7C2A8FB71B35A flags;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  UITextDropProposal *v25;
  void *v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  uint8_t v38[16];
  uint8_t buf[16];

  v5 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (!currentDropSession)
    {
      __UIFaultDebugAssertLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "sessionDidUpdate without current drop session", buf, 2u);
      }

    }
  }
  else if (!currentDropSession)
  {
    v36 = dropInteraction_sessionDidUpdate____s_category;
    if (!dropInteraction_sessionDidUpdate____s_category)
    {
      v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v36, (unint64_t *)&dropInteraction_sessionDidUpdate____s_category);
    }
    v37 = *(NSObject **)(v36 + 8);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "sessionDidUpdate without current drop session", v38, 2u);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDropDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", 0, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v9, "textDroppableView:rangeForDrop:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "dropRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
      {
        objc_msgSend(v11, "dropRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v13, "isEqual:", v18);

        if ((v19 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      v20 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v20, "_fullRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_intersectionOfRange:andRange:", v13, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", v22, v5);
      v23 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v22;
LABEL_14:

      v11 = (void *)v23;
    }
  }
  else
  {
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
      v11 = 0;
      goto LABEL_16;
    }
    -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", 0, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v9, "textDroppableView:positionForDrop:", v15, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "dropRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "start");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v17)
      {
        objc_msgSend(v11, "dropRange");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "start");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v13, "isEqual:", v28);

        if ((v29 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      v30 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v30, "textRangeFromPosition:toPosition:", v13, v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_15;
      v32 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v32, "_fullRange");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_intersectionOfRange:andRange:", v31, v33);
      v34 = objc_claimAutoreleasedReturnValue();

      if (!v34)
        goto LABEL_15;
      -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", v34, v5);
      v23 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v34;
      goto LABEL_14;
    }
  }
LABEL_15:

LABEL_16:
  if (-[UITextDragAssistant _updateCurrentDropProposalInSession:usingRequest:](self, "_updateCurrentDropProposalInSession:usingRequest:", v5, v11))
  {
    -[UITextDragAssistant _updateDropCaretToRange:session:](self, "_updateDropCaretToRange:session:", self->_currentDropRange, v5);
  }
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    v24 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v9, "textDroppableView:dropSessionDidUpdate:", v24, v5);

  }
  v25 = self->_currentDropProposal;

  return v25;
}

- (id)_positionInSession:(id)a3
{
  UITextDragSupporting **p_view;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;

  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v5, "locationInView:", WeakRetained);
  v8 = v7;
  v10 = v9;

  return -[UITextDragAssistant _closestPositionToPoint:](self, "_closestPositionToPoint:", v8, v10);
}

- (id)_rangeInSession:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;

  -[UITextDragAssistant _positionInSession:](self, "_positionInSession:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textRangeFromPosition:toPosition:", v4, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_updateCurrentDropProposalInSession:(id)a3 usingRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UITextRange *v10;
  UITextRange *v11;
  UITextRange **p_currentDropRange;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  UITextDropProposal *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  UITextDropProposal *v24;
  UIDragSession *v25;
  id v26;
  uint64_t v27;
  void *v28;
  UIDragSession *v29;
  UITextDropProposal *v30;
  UITextDropProposal *v31;
  UITextDropProposal *currentDropProposal;
  UITextRange *preDropSelectionRange;
  UITextRange *v34;
  UITextRange *v35;
  BOOL v36;
  uint64_t v38;
  id v39;
  id v40;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dropRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[UITextDragAssistant _rangeInSession:](self, "_rangeInSession:", v6);
    v10 = (UITextRange *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  p_currentDropRange = &self->_currentDropRange;
  if (self->_currentDropRange)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    -[UITextRange start](self->_currentDropRange, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextRange start](v11, "start");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "comparePosition:toPosition:", v14, v15))
    {

    }
    else
    {
      v16 = objc_loadWeakRetained((id *)&self->_view);
      -[UITextRange end](*p_currentDropRange, "end");
      v39 = v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextRange end](v11, "end");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v16, "comparePosition:toPosition:", v17, v18);

      v6 = v39;
      if (!v38)
      {
        v36 = 0;
        goto LABEL_29;
      }
    }
  }
  if (!v7)
  {
    -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", v11, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    v21 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v21, "textDropDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v20, "textDroppableView:proposalForDrop:", v22, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (UITextDropProposal *)objc_msgSend(v23, "copy");

      v25 = self->_currentDragSession;
      v40 = v6;
      v26 = v6;
      objc_msgSend(v26, "localDragSession");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        objc_msgSend(v26, "localDragSession");
        v29 = (UIDragSession *)objc_claimAutoreleasedReturnValue();

        v6 = v40;
        if (v29 == v25 && (*((_BYTE *)&self->_flags + 2) & 1) != 0)
        {
          -[UIDropProposal setOperation:](v24, "setOperation:", 2);
          -[UITextDropProposal setUseFastSameViewOperations:](v24, "setUseFastSameViewOperations:", 0);
        }
      }
      else
      {

      }
      currentDropProposal = self->_currentDropProposal;
      self->_currentDropProposal = v24;
      v31 = v24;

    }
    else
    {
      objc_msgSend(v7, "suggestedProposal");
      v30 = (UITextDropProposal *)objc_claimAutoreleasedReturnValue();
      v31 = self->_currentDropProposal;
      self->_currentDropProposal = v30;
    }

  }
  else
  {
    objc_msgSend(v7, "suggestedProposal");
    v19 = (UITextDropProposal *)objc_claimAutoreleasedReturnValue();
    v20 = self->_currentDropProposal;
    self->_currentDropProposal = v19;
  }

  if (-[UITextDropProposal dropAction](self->_currentDropProposal, "dropAction") == UITextDropActionReplaceSelection)
  {
    preDropSelectionRange = self->_preDropSelectionRange;
    if (preDropSelectionRange)
    {
      if (!-[UITextRange isEmpty](preDropSelectionRange, "isEmpty"))
      {
        v35 = self->_preDropSelectionRange;
        goto LABEL_27;
      }
    }
  }
  if (-[UITextDropProposal dropAction](self->_currentDropProposal, "dropAction", v38) == UITextDropActionReplaceAll)
  {
    v34 = (UITextRange *)objc_loadWeakRetained((id *)&self->_view);
    -[UITextRange _fullRange](v34, "_fullRange");
    v35 = (UITextRange *)objc_claimAutoreleasedReturnValue();

    v11 = v34;
LABEL_27:

    v11 = v35;
  }
  objc_storeStrong((id *)p_currentDropRange, v11);
  v36 = 1;
LABEL_29:

  return v36;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5;
  int has_internal_diagnostics;
  UIDropSession *currentDropSession;
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v5 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (!currentDropSession)
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "sessionDidExit without current drop session", buf, 2u);
      }

    }
  }
  else if (!currentDropSession)
  {
    v13 = dropInteraction_sessionDidExit____s_category;
    if (!dropInteraction_sessionDidExit____s_category)
    {
      v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&dropInteraction_sessionDidExit____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "sessionDidExit without current drop session", v15, 2u);
    }
  }
  -[UITextDragAssistant _cleanupDrop](self, "_cleanupDrop");
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDropDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v10, "textDroppableView:dropSessionDidExit:", v11, v5);

  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  int has_internal_diagnostics;
  UIDropSession *currentDropSession;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  id v17;
  UITextDraggableGeometrySameViewDropOperation *sameViewDropOperation;
  UIDragItem *topmostDropItem;
  UITargetedDragPreview *topmostDropPreview;
  id delayedPreviewProvider;
  UIDragSession *v22;
  id v23;
  uint64_t v24;
  void *v25;
  UIDragSession *v26;
  UIDropOperation v27;
  void *v28;
  NSObject *v29;
  unint64_t v30;
  NSObject *v31;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (!currentDropSession)
    {
      __UIFaultDebugAssertLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "performDrop without current drop session", buf, 2u);
      }

    }
  }
  else if (!currentDropSession)
  {
    v30 = _MergedGlobals_1252;
    if (!_MergedGlobals_1252)
    {
      v30 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&_MergedGlobals_1252);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "performDrop without current drop session", buf, 2u);
    }
  }
  v8 = (void *)-[NSArray copy](self->_draggedTextRanges, "copy");
  -[UITextDragAssistant _updateDropCaretToRange:session:](self, "_updateDropCaretToRange:session:", 0, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v10 = objc_msgSend(WeakRetained, "isEditable");

  if ((v10 & 1) == 0)
  {
    if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v11, "setEditable:", 1);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__UITextDragAssistant_dropInteraction_performDrop___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      if (qword_1ECD81AA0 != -1)
        dispatch_once(&qword_1ECD81AA0, block);
    }
  }
  *(_DWORD *)&self->_flags |= 0x20000u;
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dropOnTextContent"));
  v12 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v12, "textDropDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = objc_opt_respondsToSelector();
  else
    v14 = 0;
  if ((v14 & 1 & (-[UITextDropProposal dropPerformer](self->_currentDropProposal, "dropPerformer") != UITextDropPerformerView)) != 0)
    v15 = 0;
  else
    v15 = 0x40000;
  self->_flags = ($C912E3BC1DC90FDEFCD7C2A8FB71B35A)(v15 | *(_DWORD *)&self->_flags & 0xFFFBFFFF);
  if ((v14 & 1) == 0
    || (-[UITextDragAssistant _dropRequestWithRange:suggestedProposal:inSession:](self, "_dropRequestWithRange:suggestedProposal:inSession:", self->_currentDropRange, self->_currentDropProposal, v5), v16 = (void *)objc_claimAutoreleasedReturnValue(), v17 = objc_loadWeakRetained((id *)&self->_view), objc_msgSend(v13, "textDroppableView:willPerformDrop:", v17, v16), v17, v16, (*((_BYTE *)&self->_flags + 2) & 4) != 0))
  {
    sameViewDropOperation = self->_sameViewDropOperation;
    self->_sameViewDropOperation = 0;

    topmostDropItem = self->_topmostDropItem;
    self->_topmostDropItem = 0;

    topmostDropPreview = self->_topmostDropPreview;
    self->_topmostDropPreview = 0;

    delayedPreviewProvider = self->_delayedPreviewProvider;
    self->_delayedPreviewProvider = 0;

    if (-[UITextDropProposal useFastSameViewOperations](self->_currentDropProposal, "useFastSameViewOperations")
      && (*(_BYTE *)&self->_flags & 2) != 0)
    {
      v22 = self->_currentDragSession;
      v23 = v5;
      objc_msgSend(v23, "localDragSession");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        objc_msgSend(v23, "localDragSession");
        v26 = (UIDragSession *)objc_claimAutoreleasedReturnValue();

        if (v26 == v22)
        {
          v27 = -[UIDropProposal operation](self->_currentDropProposal, "operation");
          objc_msgSend(v23, "items");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextDragAssistant _prepareSameViewOperation:forItems:fromRanges:toRange:](self, "_prepareSameViewOperation:forItems:fromRanges:toRange:", v27, v28, v8, self->_currentDropRange);

          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    if (-[UITextDropProposal dropProgressMode](self->_currentDropProposal, "dropProgressMode"))
      objc_msgSend(v5, "setProgressIndicatorStyle:", 0);
    -[UITextDragAssistant _performDropToRange:inSession:](self, "_performDropToRange:inSession:", self->_currentDropRange, v5);
  }
LABEL_25:

}

void __51__UITextDragAssistant_dropInteraction_performDrop___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  id *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_12;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_12)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_12);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 200);
    v5 = v3;
    WeakRetained = objc_loadWeakRetained(v4);
    v7 = 138412290;
    v8 = WeakRetained;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "wanting to performDrop on %@, but view is not editable", (uint8_t *)&v7, 0xCu);

  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  UIDragItem *topmostDropItem;
  UITargetedDragPreview *topmostDropPreview;
  UITextDraggableGeometrySameViewDropOperation *sameViewDropOperation;
  id delayedPreviewProvider;
  id WeakRetained;
  id v10;
  id v11;

  topmostDropItem = self->_topmostDropItem;
  self->_topmostDropItem = 0;

  topmostDropPreview = self->_topmostDropPreview;
  self->_topmostDropPreview = 0;

  sameViewDropOperation = self->_sameViewDropOperation;
  self->_sameViewDropOperation = 0;

  delayedPreviewProvider = self->_delayedPreviewProvider;
  self->_delayedPreviewProvider = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dropPasteSession);
  objc_msgSend(WeakRetained, "animationCompleted");

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v10, "setEditable:", 0);

    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v11, "setSelectable:", (*(_DWORD *)&self->_flags >> 7) & 1);

    }
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  UITextDragSupporting **p_view;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  -[UITextDragAssistant _cleanupDrop](self, "_cleanupDrop");
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "resignDropResponderWithDropPerformed:", (*(_DWORD *)&self->_flags >> 17) & 1);

  v7 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v7, "textDropDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v8, "textDroppableView:dropSessionDidEnd:", v9, v10);

  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UITextDraggableGeometrySameViewDropOperation *sameViewDropOperation;
  UITextDraggableGeometrySameViewDropOperationResult *sameViewDropOperationResult;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_topmostDropPreview)
  {
    -[UITextDragAssistant _previewForIrrelevantItemFromPreview:](self, "_previewForIrrelevantItemFromPreview:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ((*((_BYTE *)&self->_flags + 2) & 4) != 0)
  {
    if (self->_sameViewDropOperation)
    {
      -[UITextDragAssistant _performSameViewOperation:](self, "_performSameViewOperation:");
      sameViewDropOperation = self->_sameViewDropOperation;
      self->_sameViewDropOperation = 0;

      sameViewDropOperationResult = self->_sameViewDropOperationResult;
      if (sameViewDropOperationResult)
      {
        -[UITextDraggableGeometrySameViewDropOperationResult targetedPreviewProvider](sameViewDropOperationResult, "targetedPreviewProvider");
        v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[UITextDragAssistant _containerViewForDropPreviews](self, "_containerViewForDropPreviews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v15, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          goto LABEL_11;
      }
    }
    else
    {
      -[UITextDragAssistant _previewForTopmostItem:](self, "_previewForTopmostItem:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_11;
    }
    -[UITextRange start](self->_currentDropRange, "start");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextDragAssistant _shrinkingPreview:toPosition:](self, "_shrinkingPreview:toPosition:", v10, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v11 = 0;
LABEL_11:
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDropDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v18, "textDroppableView:previewForDroppingAllItemsWithDefault:", v19, v11);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v11;
    v26 = v9;
    v23 = v8;
    v24 = v22;

    v11 = v24;
    v8 = v23;
    v9 = v26;
  }
  objc_storeStrong((id *)&self->_topmostDropPreview, v11);
  objc_storeStrong((id *)&self->_topmostDropItem, a4);

LABEL_17:
  return v11;
}

- (void)_dropInteraction:(id)a3 delayedPreviewProviderForDroppingItem:(id)a4 previewProvider:(id)a5
{
  void *v6;
  id delayedPreviewProvider;

  if (self->_topmostDropItem == a4)
  {
    v6 = _Block_copy(a5);
    delayedPreviewProvider = self->_delayedPreviewProvider;
    self->_delayedPreviewProvider = v6;

  }
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  UIDragItem *topmostDropItem;
  BOOL v6;
  _QWORD v7[5];

  topmostDropItem = self->_topmostDropItem;
  if (topmostDropItem)
    v6 = topmostDropItem == a4;
  else
    v6 = 1;
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__UITextDragAssistant_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v7[3] = &unk_1E16B42D0;
    v7[4] = self;
    objc_msgSend(a5, "addCompletion:", v7, a4);
  }
}

void __72__UITextDragAssistant_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 184));
  objc_msgSend(WeakRetained, "animationCompleted");

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  if (v3)
  {
    objc_msgSend(v3, "resultRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
      objc_msgSend(v5, "textRangeFromPosition:toPosition:", v8, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 200));
      objc_msgSend(v7, "setSelectedTextRange:", v6);

    }
  }
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5;
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  int64_t v11;
  id v12;

  v5 = a4;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "textDropDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_8;
    }
    -[UITextDragAssistant _dropRequestWithRange:inSession:](self, "_dropRequestWithRange:inSession:", 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_view);
    v11 = objc_msgSend(v8, "_textDroppableView:dataOwnerForDrop:", v10, v9);

    goto LABEL_6;
  }
  v12 = objc_loadWeakRetained((id *)&self->_view);
  v11 = objc_msgSend(v12, "_dropDataOwner");

  if (!v11)
  {
    v9 = objc_loadWeakRetained((id *)p_view);
    v11 = objc_msgSend(v9, "_dataOwnerForPaste");
LABEL_6:

  }
LABEL_8:

  return v11;
}

- (id)_dropRequestWithRange:(id)a3 inSession:(id)a4
{
  return -[UITextDragAssistant _dropRequestWithRange:suggestedProposal:inSession:](self, "_dropRequestWithRange:suggestedProposal:inSession:", a3, 0, a4);
}

- (id)_dropRequestWithRange:(id)a3 suggestedProposal:(id)a4 inSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UITextDropRequest *v12;
  UIDragSession *v13;
  id v14;
  void *v15;
  UIDragSession *v16;
  _BOOL8 v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UITextDragAssistant _positionInSession:](self, "_positionInSession:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[UITextDragAssistant _rangeInSession:](self, "_rangeInSession:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[UITextDropRequest initWithPosition:range:inSession:]([UITextDropRequest alloc], "initWithPosition:range:inSession:", v11, v8, v10);
  v13 = self->_currentDragSession;
  v14 = v10;
  objc_msgSend(v14, "localDragSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "localDragSession");
    v16 = (UIDragSession *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == v13;

  }
  else
  {
    v17 = 0;
  }

  -[UITextDropRequest setSameView:](v12, "setSameView:", v17);
  if (v9)
  {
    -[UITextDropRequest setSuggestedProposal:](v12, "setSuggestedProposal:", v9);
  }
  else
  {
    -[UITextDragAssistant _suggestedProposalForRequest:](self, "_suggestedProposalForRequest:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextDropRequest setSuggestedProposal:](v12, "setSuggestedProposal:", v18);

  }
  return v12;
}

- (void)invalidateDropCaret
{
  if (self->_currentDropSession)
    -[UITextDragAssistant _updateDropCaretToRange:session:](self, "_updateDropCaretToRange:session:", self->_currentDropRange);
}

- (void)_updateDropCaretToRange:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  $C912E3BC1DC90FDEFCD7C2A8FB71B35A flags;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _UITextDragCaretView *dropCaret;
  _UITextDragCaretView *v22;
  _UITextDragCaretView *v23;
  id v24;
  _UITextDragCaretView *v25;
  _UITextDragCaretView *v26;
  _QWORD v27[4];
  id v28;
  UITextDragAssistant *v29;
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "interactionAssistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectionDisplayVisible:", 0);

  v10 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v10, "interactionAssistant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivateSelection");

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v18, "textDropDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_loadWeakRetained((id *)&self->_view);
    v13 = objc_msgSend(v19, "textDroppableView:dropSession:willMoveCaretToRange:", v20, v7, v6);

    if ((*(_DWORD *)&self->_flags & 0x4000) != 0)
      goto LABEL_3;
  }
  else
  {
    v13 = 1;
    if ((*(_WORD *)&flags & 0x4000) != 0)
    {
LABEL_3:
      v14 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v14, "textDropDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __55__UITextDragAssistant__updateDropCaretToRange_session___block_invoke;
      v27[3] = &unk_1E16B51E8;
      v28 = v15;
      v29 = self;
      v30 = v7;
      v31 = v6;
      v16 = v15;
      v17 = _Block_copy(v27);

      goto LABEL_6;
    }
  }
  v17 = 0;
LABEL_6:
  dropCaret = self->_dropCaret;
  if (v6)
  {
    if (dropCaret)
    {
      -[_UITextDragCaretView updateToRange:animations:completion:animated:](dropCaret, "updateToRange:animations:completion:animated:", v6, 0, v17, v13);
    }
    else
    {
      v23 = [_UITextDragCaretView alloc];
      v24 = objc_loadWeakRetained((id *)&self->_view);
      v25 = -[_UITextDragCaretView initWithTextInputView:](v23, "initWithTextInputView:", v24);
      v26 = self->_dropCaret;
      self->_dropCaret = v25;

      -[_UITextDragCaretView setRangesExcludeSelection:](self->_dropCaret, "setRangesExcludeSelection:", 0);
      -[_UITextDragCaretView insertAtRange:animations:completion:animated:](self->_dropCaret, "insertAtRange:animations:completion:animated:", v6, 0, v17, v13);
    }
  }
  else
  {
    -[_UITextDragCaretView removeWithAnimations:completion:animated:](dropCaret, "removeWithAnimations:completion:animated:", 0, v17, v13);
    v22 = self->_dropCaret;
    self->_dropCaret = 0;

  }
}

void __55__UITextDragAssistant__updateDropCaretToRange_session___block_invoke(_QWORD *a1)
{
  void *v2;
  id WeakRetained;

  v2 = (void *)a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 200));
  objc_msgSend(v2, "textDroppableView:dropSession:didMoveCaretToRange:", WeakRetained, a1[6], a1[7]);

}

- (id)_suggestedProposalForRequest:(id)a3
{
  id v4;
  $C912E3BC1DC90FDEFCD7C2A8FB71B35A flags;
  UITextRange *currentDropRange;
  UIDragSession *currentDragSession;
  void *v8;
  UIDragSession *v9;
  uint64_t v10;
  void *v11;
  UIDragSession *v12;
  uint64_t v13;
  UITextDropProposal *v14;
  id WeakRetained;
  void *v16;
  double v17;
  CGFloat v18;
  id v19;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  CGRect v28;

  v4 = a3;
  flags = self->_flags;
  currentDropRange = self->_currentDropRange;
  currentDragSession = self->_currentDragSession;
  objc_msgSend(v4, "dropSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = currentDragSession;
  objc_msgSend(v8, "localDragSession");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "localDragSession");
    v12 = (UIDragSession *)objc_claimAutoreleasedReturnValue();

    v13 = 2;
    if (v12 == v9 && (*(_DWORD *)&flags & 0x10000) == 0)
    {
      if (currentDropRange)
      {
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __52__UITextDragAssistant__suggestedProposalForRequest___block_invoke;
        v21[3] = &unk_1E16E4F00;
        v23 = &v24;
        v21[4] = self;
        v22 = v4;
        -[UITextDragAssistant _forDraggedTextRangesDo:](self, "_forDraggedTextRangesDo:", v21);
        if (*((_BYTE *)v25 + 24))
          v13 = 0;
        else
          v13 = 3;

        _Block_object_dispose(&v24, 8);
      }
      else
      {
        v13 = 3;
      }
    }
  }
  else
  {

    v13 = 2;
  }
  v14 = -[UITextDropProposal initWithDropOperation:]([UITextDropProposal alloc], "initWithDropOperation:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "_fontForCaretSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lineHeight");
  v18 = v17 + v17;
  v19 = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v19, "bounds");
  -[UIDropProposal setPrecise:](v14, "setPrecise:", v18 < CGRectGetHeight(v28));

  -[UITextDropProposal setUseFastSameViewOperations:](v14, "setUseFastSameViewOperations:", ((*(_DWORD *)&flags & 0x10000) == 0) & (*(_DWORD *)&self->_flags >> 1));
  return v14;
}

void __52__UITextDragAssistant__suggestedProposalForRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v4;
  id v5;
  void *v6;
  char v7;
  id WeakRetained;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
  }
  else
  {
    v4 = (id *)(*(_QWORD *)(a1 + 32) + 200);
    v5 = a2;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(*(id *)(a1 + 40), "dropRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(WeakRetained, "_range:intersectsRange:", v5, v6);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  }
}

- (void)_cleanupDrop
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  UITextRange *preDropSelectionRange;
  id v10;
  UITextRange *v11;
  UITextDropProposal *currentDropProposal;
  UIDropSession *currentDropSession;
  UITextRange *currentDropRange;

  -[UITextDragAssistant _updateDropCaretToRange:session:](self, "_updateDropCaretToRange:session:", 0, self->_currentDropSession);
  if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "selectedTextRange");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v6, "selectedTextRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_preDropSelectionRange);

      if ((v8 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    preDropSelectionRange = self->_preDropSelectionRange;
    v10 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v10, "setSelectedTextRange:", preDropSelectionRange);

  }
LABEL_7:
  v11 = self->_preDropSelectionRange;
  self->_preDropSelectionRange = 0;

  currentDropProposal = self->_currentDropProposal;
  self->_currentDropProposal = 0;

  currentDropSession = self->_currentDropSession;
  self->_currentDropSession = 0;

  currentDropRange = self->_currentDropRange;
  self->_currentDropRange = 0;

}

- (void)_prepareSameViewOperation:(unint64_t)a3 forItems:(id)a4 fromRanges:(id)a5 toRange:(id)a6
{
  id v9;
  id v10;
  UITextDraggableGeometry *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UITextDraggableGeometrySameViewDropOperation *sameViewDropOperation;
  id v20;
  UITextDraggableGeometrySameViewDropOperationResult *sameViewDropOperationResult;
  id v22;
  _QWORD v23[5];

  v9 = a5;
  v10 = a6;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v11 = self->_geometry;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __77__UITextDragAssistant__prepareSameViewOperation_forItems_fromRanges_toRange___block_invoke;
    v23[3] = &unk_1E16E4D78;
    v23[4] = self;
    objc_msgSend(v9, "sortedArrayUsingComparator:", v23);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[UITextDraggableGeometry attributedStringsForTextRanges:](v11, "attributedStringsForTextRanges:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "pasteDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v14, "textPasteConfigurationSupporting:combineItemAttributedStrings:forRange:", v15, v12, v10);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_loadWeakRetained((id *)&self->_view);
      +[UITextPasteController combineAttributedStrings:addingSeparation:](UITextPasteController, "combineAttributedStrings:addingSeparation:", v12, objc_msgSend(v15, "smartInsertDeleteType") != 1);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;

    if (v17)
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "setOperation:", a3);
      objc_msgSend(v18, "setText:", v17);
      objc_msgSend(v18, "setSourceRanges:", v22);
      objc_msgSend(v18, "setTargetRange:", v10);
    }
    else
    {
      v18 = 0;
    }
    sameViewDropOperation = self->_sameViewDropOperation;
    self->_sameViewDropOperation = (UITextDraggableGeometrySameViewDropOperation *)v18;
    v20 = v18;

    sameViewDropOperationResult = self->_sameViewDropOperationResult;
    self->_sameViewDropOperationResult = 0;

  }
  else
  {
    v22 = v9;
  }

}

uint64_t __77__UITextDragAssistant__prepareSameViewOperation_forItems_fromRanges_toRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (id *)(*(_QWORD *)(a1 + 32) + 200);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(WeakRetained, "comparePosition:toPosition:", v8, v9);
  return v10;
}

- (void)_performSameViewOperation:(id)a3
{
  UITextDragSupporting **p_view;
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  char v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UITextDraggableGeometrySameViewDropOperationResult *v15;
  UITextDraggableGeometrySameViewDropOperationResult *sameViewDropOperationResult;
  id v17;
  char v18;
  id v19;
  id v20;
  UITextDraggableGeometry *v21;

  if (a3 && (*(_DWORD *)&self->_flags & 2) != 0)
  {
    p_view = &self->_view;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "droppingStarted");

    v7 = objc_msgSend(v5, "operation");
    if (v7 == 3
      && (v8 = objc_loadWeakRetained((id *)&self->_view),
          v9 = objc_opt_respondsToSelector(),
          v8,
          (v9 & 1) != 0))
    {
      v10 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v10, "contentOffsetForSameViewDrops");
      v12 = v11;
      v14 = v13;

    }
    else
    {
      v14 = NAN;
      v12 = NAN;
    }
    v21 = self->_geometry;
    -[UITextDraggableGeometry performSameViewDropOperation:](v21, "performSameViewDropOperation:", self->_sameViewDropOperation);
    v15 = (UITextDraggableGeometrySameViewDropOperationResult *)objc_claimAutoreleasedReturnValue();
    sameViewDropOperationResult = self->_sameViewDropOperationResult;
    self->_sameViewDropOperationResult = v15;

    v17 = objc_loadWeakRetained((id *)&self->_view);
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      v19 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v19, "setContentOffsetForSameViewDrops:", v12, v14);

    }
    v20 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v20, "droppingFinished");

  }
}

- (void)_performDropToRange:(id)a3 inSession:(id)a4
{
  id v6;
  UITextPasteController *dropPasteController;
  UITextPasteController *v8;
  id WeakRetained;
  UITextPasteController *v10;
  UITextPasteController *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  dropPasteController = self->_dropPasteController;
  if (!dropPasteController)
  {
    v8 = [UITextPasteController alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v10 = -[UITextPasteController initWithSupportingView:](v8, "initWithSupportingView:", WeakRetained);
    v11 = self->_dropPasteController;
    self->_dropPasteController = v10;

    dropPasteController = self->_dropPasteController;
  }
  objc_msgSend(v6, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextPasteController beginDroppingItems:toSelectedRange:progressSupport:animated:delegate:](dropPasteController, "beginDroppingItems:toSelectedRange:progressSupport:animated:delegate:", v12, v14, self, 1, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_dropPasteSession, v13);

}

- (int64_t)_textPasteRangeBehavior
{
  return 2;
}

- (id)_textPasteSelectableRangeForResult:(id)a3 fromRange:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  UITextDragSupporting **p_view;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a4;
  objc_msgSend(a3, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  if (v8 < 1)
  {
    v22 = 0;
  }
  else
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    while (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v11)))
    {
      if (v9 == ++v11)
      {
        v11 = v9;
        goto LABEL_6;
      }
    }
    do
    {
LABEL_6:
      v12 = v9;
      v13 = v9-- < 1;
    }
    while (!v13 && (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v9)) & 1) != 0);
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v6, "start");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "positionFromPosition:offset:", v16, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v6, "start");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "positionFromPosition:offset:", v19, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v21, "textRangeFromPosition:toPosition:", v17, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v22)
    v23 = v22;
  else
    v23 = v6;
  v24 = v23;

  return v24;
}

- (void)textPasteSessionWillHidePasteResult:(id)a3
{
  id delayedPreviewProvider;
  void (**v5)(void *, void *);
  void *v6;

  delayedPreviewProvider = self->_delayedPreviewProvider;
  if (delayedPreviewProvider && self->_topmostDropItem)
  {
    v5 = (void (**)(void *, void *))_Block_copy(delayedPreviewProvider);
    -[UITextDragAssistant _previewForTopmostItem:](self, "_previewForTopmostItem:", self->_topmostDropItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);

    delayedPreviewProvider = self->_delayedPreviewProvider;
  }
  self->_delayedPreviewProvider = 0;

}

- (void)textPasteSessionDidRevealPasteResult:(id)a3
{
  id delayedPreviewProvider;

  delayedPreviewProvider = self->_delayedPreviewProvider;
  self->_delayedPreviewProvider = 0;

}

- (void)textPasteSessionWillBeginPasting:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "droppingStarted");

}

- (void)textPasteSessionDidEndPasting:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "droppingFinished");

}

- (id)_closestPositionToPoint:(CGPoint)a3
{
  double y;
  double x;
  UITextDragSupporting **p_view;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  p_view = &self->_view;
  v6 = objc_loadWeakRetained((id *)&self->_view);
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v8, x, y);
  objc_msgSend(v6, "closestPositionToPoint:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UITextDraggableGeometry)geometry
{
  -[UITextDragAssistant _applyOptionsToGeometry](self, "_applyOptionsToGeometry");
  return self->_geometry;
}

- (id)_previewForIrrelevantItemFromPreview:(id)a3
{
  id v3;
  void *v4;
  UISnapshotView *v5;
  void *v6;
  UISnapshotView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UITargetedDragPreview *v14;

  v3 = a3;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [UISnapshotView alloc];
  objc_msgSend(v3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v7 = -[UISnapshotView initWithFrame:](v5, "initWithFrame:");

  objc_msgSend(v3, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISnapshotView captureSnapshotOfView:withSnapshotType:](v7, "captureSnapshotOfView:withSnapshotType:", v8, 1);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v3, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(v3, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "visiblePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisiblePath:", v13);

  v14 = -[UITargetedDragPreview initWithView:parameters:target:]([UITargetedDragPreview alloc], "initWithView:parameters:target:", v7, v9, v4);
  return v14;
}

- (id)_previewForTopmostItem:(id)a3
{
  UITextDropPasteSession **p_dropPasteSession;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v23;
  id v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;

  p_dropPasteSession = &self->_dropPasteSession;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dropPasteSession);
  objc_msgSend(WeakRetained, "pasteResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_dropPasteSession);
    objc_msgSend(v7, "positionedPasteResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "position");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v10, "endOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "comparePosition:toPosition:", v9, v11);

    if (v12 == 1)
    {
      v13 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v13, "endOfDocument");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
    if (v9)
    {
      v15 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v15, "beginningOfDocument");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "offsetFromPosition:toPosition:", v16, v9);

    }
    else
    {
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v8, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL || !objc_msgSend(v19, "length"))
    {
      v18 = 0;
    }
    else
    {
      v21 = objc_loadWeakRetained((id *)&self->_view);
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) != 0)
      {
        v23 = objc_msgSend(v20, "mutableCopy");
        v24 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v24, "sanitizeAttributedText:", v23);

        v20 = (void *)v23;
      }
      v25 = objc_loadWeakRetained((id *)&self->_view);
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) != 0)
      {
        v27 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v27, "selectedTextRange");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v29, "textRangeFromPosition:toPosition:", v9, v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v31, "setSelectedTextRange:", v30);

        v32 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v32, "_attributedStringForInsertionOfAttributedString:", v20);
        v33 = objc_claimAutoreleasedReturnValue();

        v34 = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(v34, "setSelectedTextRange:", v28);

        v20 = (void *)v33;
      }
      v35 = objc_msgSend(v20, "length");
      v36 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v36, "_textRangeFromNSRange:", v17, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextDragAssistant geometry](self, "geometry");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextDragAssistant _containerViewForDropPreviews](self, "_containerViewForDropPreviews");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "previewForDroppingTextInRange:toPosition:inContainerView:", v37, v9, v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)_shrinkingPreview:(id)a3 toPosition:(id)a4
{
  id v6;
  UITextDragSupporting **p_view;
  id v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  UIDragPreviewTarget *v31;
  UIDragPreviewTarget *v32;
  id v33;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;

  v6 = a3;
  p_view = &self->_view;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "caretRectForPosition:", v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v37.origin.x = v11;
  v37.origin.y = v13;
  v37.size.width = v15;
  v37.size.height = v17;
  if (CGRectIsNull(v37))
    goto LABEL_7;
  -[UITextDragAssistant _containerViewForDropPreviews](self, "_containerViewForDropPreviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v19, "convertRect:toView:", v18, v11, v13, v15, v17);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  objc_msgSend(v6, "size");
  v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v36.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v36.c = v30;
  *(_OWORD *)&v36.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (v28 > 0.0 && v29 > 0.0)
    CGAffineTransformMakeScale(&v36, v25 / v28, v27 / v29);
  v31 = [UIDragPreviewTarget alloc];
  v35 = v36;
  v32 = -[UIPreviewTarget initWithContainer:center:transform:](v31, "initWithContainer:center:transform:", v18, &v35, v21 + v25 * 0.5, v23 + v27 * 0.5);

  if (!v32)
  {
LABEL_7:
    v33 = v6;
  }
  else
  {
    objc_msgSend(v6, "retargetedPreviewWithTarget:", v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v33;
}

- (UITextDragSupporting)view
{
  return (UITextDragSupporting *)objc_loadWeakRetained((id *)&self->_view);
}

- (UIDragInteraction)dragInteraction
{
  return (UIDragInteraction *)objc_loadWeakRetained((id *)&self->_dragInteraction);
}

- (UIDropInteraction)dropInteraction
{
  return (UIDropInteraction *)objc_loadWeakRetained((id *)&self->_dropInteraction);
}

@end
