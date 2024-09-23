@implementation TUIDragController

+ (id)sharedInstance
{
  if (qword_2CB788 != -1)
    dispatch_once(&qword_2CB788, &stru_241FD8);
  return (id)qword_2CB780;
}

- (TUIDragController)init
{
  TUIDragController *v2;
  TUIDragController *v3;
  NSMutableArray *v4;
  NSMutableArray *observers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIDragController;
  v2 = -[TUIDragController init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new(NSMutableArray);
    observers = v3->_observers;
    v3->_observers = v4;

  }
  return v3;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableArray addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_setAlpha:(double)a3 forSessionDragItems:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(_TUIDragPreviewInfo);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_privateLocalContext"));
        v13 = TUIDynamicCast(v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
        objc_msgSend(v15, "setAlpha:", a3);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)_updateDraggingState:(BOOL)a3
{
  self->_isDragging = a3;
}

- (id)dragInteractionWithActionHandlerDelegate:(id)a3 dragDelegate:(id)a4
{
  id v6;
  id v7;
  _TUIDragInteraction *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_TUIDragInteraction initWithDelegate:]([_TUIDragInteraction alloc], "initWithDelegate:", self);
  -[_TUIDragInteraction setActionHandlerDelegate:](v8, "setActionHandlerDelegate:", v7);

  -[_TUIDragInteraction setDragDelegate:](v8, "setDragDelegate:", v6);
  return v8;
}

- (void)_notifyObserversWithSession:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  v5 = -[NSMutableArray copy](self->_observers, "copy");
  os_unfair_lock_unlock(&self->_accessLock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "dragController:dragSessionDidEnd:", self, v4, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_notifyDelegateOfViewDraggingStateForSession:(id)a3 interaction:(id)a4 dropOperation:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(_TUIDragInteraction);
  v24 = v8;
  v10 = TUIDynamicCast(v9, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "actionHandlerDelegate"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v18 = objc_opt_class(_TUIDragPreviewInfo);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_privateLocalContext"));
        v20 = TUIDynamicCast(v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        LODWORD(v19) = self->_isDragging;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
        if ((_DWORD)v19)
          objc_msgSend(v11, "didBeginDraggingView:", v22);
        else
          objc_msgSend(v11, "didEndDraggingView:", v22);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "didEndDragSession:dropOperation:", v26, a5);
}

- (BOOL)_dragSession:(id)a3 containsView:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class(_TUIDragPreviewInfo);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_privateLocalContext"));
        v13 = TUIDynamicCast(v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
        if (v15 == v5)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v6, "locationInView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDragController dragInteraction:itemsForAddingToSession:withTouchAtPoint:](self, "dragInteraction:itemsForAddingToSession:withTouchAtPoint:", v7, v6));

  return v9;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIColor *dragBackgroundColor;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;

  v7 = a4;
  v8 = a3;
  v9 = objc_opt_class(_TUIDragPreviewInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_privateLocalContext"));
  v11 = TUIDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v14 = objc_opt_class(TUIReusableBaseView);
  v15 = TUIPlatformAncestorOfClass(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "feedControllerHost"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "hostingContainerView"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));
  objc_msgSend(v13, "center");
  objc_msgSend(v19, "convertPoint:toView:", v18);
  v21 = v20;
  v23 = v22;

  dragBackgroundColor = self->_dragBackgroundColor;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "traitCollection"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](dragBackgroundColor, "resolvedColorWithTraitCollection:", v26));

  v28 = sub_124CEC(v7, v18, v27, v21, v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  return v29;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[TUIDragController _updateDraggingState:](self, "_updateDraggingState:", 1, a4);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  -[TUIDragController _notifyObserversWithSession:](self, "_notifyObserversWithSession:", v8);
  -[TUIDragController _updateDraggingState:](self, "_updateDraggingState:", 0);
  -[TUIDragController _setAlpha:forSessionDragItems:](self, "_setAlpha:forSessionDragItems:", v8, 1.0);
  -[TUIDragController _notifyDelegateOfViewDraggingStateForSession:interaction:dropOperation:](self, "_notifyDelegateOfViewDraggingStateForSession:interaction:dropOperation:", v8, v9, a5);

}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _TUIDragTriggerInfo *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _TUIDragTriggerInfo *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  _TUIDragPreviewInfo *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  TUIDragController *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hitTest:withEvent:", 0, x, y));

  v13 = objc_opt_class(TUIReusableBaseView);
  v14 = TUIPlatformAncestorOfClassAndProtocol(v12, v13, &OBJC_PROTOCOL___TUIReusableRenderView);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (v15)
  {
    v16 = (void *)v15;
    v51 = self;
    v52 = v12;
    v53 = v10;
    v54 = v9;
    while (1)
    {
      v17 = v16;
      v18 = objc_opt_class(TUILayoutAttributes);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutAttributes"));

      v20 = TUIDynamicCast(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      v22 = objc_opt_class(TUIRenderModelInteractive);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "renderModel"));
      v24 = TUIDynamicCast(v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

      v26 = v25;
      v27 = sub_125930(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (v28)
      {
        v29 = [_TUIDragTriggerInfo alloc];
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "actionHandler"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "actionObject"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "behavior"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "arguments"));
        v34 = -[_TUIDragTriggerInfo initWithActionObject:behavior:arguments:](v29, "initWithActionObject:behavior:arguments:", v31, v32, v33);

      }
      else
      {
        v34 = 0;
      }

      v35 = objc_claimAutoreleasedReturnValue(-[_TUIDragTriggerInfo behavior](v34, "behavior"));
      if (v35)
        break;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
      v37 = objc_opt_class(TUIReusableBaseView);
      v38 = TUIPlatformAncestorOfClassAndProtocol(v36, v37, &OBJC_PROTOCOL___TUIReusableRenderView);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v38);

      if (!v16)
      {
        v17 = 0;
        v39 = 0;
        v40 = 0;
        goto LABEL_15;
      }
    }
    v41 = (void *)v35;
    v10 = v53;
    if (-[TUIDragController _dragSession:containsView:](v51, "_dragSession:containsView:", v53, v17))
    {

      v39 = 0;
      v40 = 0;
      v9 = v54;
      goto LABEL_16;
    }
    v42 = objc_opt_class(_TUIDragInteraction);
    v43 = TUIDynamicCast(v42, v54);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "actionHandlerDelegate"));

    objc_msgSend(v45, "didBeginDraggingView:", v17);
    v40 = -[_TUIDragPreviewInfo initWithDragInfo:view:]([_TUIDragPreviewInfo alloc], "initWithDragInfo:view:", v34, v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDragTriggerInfo actionObject](v34, "actionObject"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDragTriggerInfo behavior](v34, "behavior"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDragTriggerInfo arguments](v34, "arguments"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dragItemForObject:withName:arguments:", v46, v47, v48));

    objc_msgSend(v49, "_setPrivateLocalContext:", v40);
    if (v49)
    {
      v55 = v49;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));

    }
    else
    {
      v39 = 0;
    }
LABEL_15:
    v10 = v53;
    v9 = v54;
LABEL_16:
    v12 = v52;
  }
  else
  {
    v17 = 0;
    v39 = 0;
    v40 = 0;
  }

  return v39;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double x;
  double v23;
  double y;
  UIColor *dragBackgroundColor;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(_TUIDragInteraction);
  v10 = TUIDynamicCast(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dragDelegate"));
  v13 = (char *)objc_msgSend(v12, "layoutDirection");

  if (v13 == (_BYTE *)&dword_0 + 2)
  {
    v14 = objc_opt_class(_TUIDragPreviewInfo);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_privateLocalContext"));
    v16 = TUIDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "superview"));
    objc_msgSend(v18, "center");
    objc_msgSend(v20, "convertPoint:toView:", v19);
    x = v21;
    y = v23;

  }
  else
  {
    v19 = 0;
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  dragBackgroundColor = self->_dragBackgroundColor;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "traitCollection"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor resolvedColorWithTraitCollection:](dragBackgroundColor, "resolvedColorWithTraitCollection:", v27));

  v29 = sub_124CEC(v8, v19, v28, x, y);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  return v30;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[TUIDragController _updateDraggingState:](self, "_updateDraggingState:", 1);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1255B8;
  v13[3] = &unk_242000;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "addCompletion:", v13);

}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class(_TUIDragPreviewInfo);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_privateLocalContext"));

  v12 = TUIDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v15 = objc_opt_class(_TUIDragInteraction);
  v16 = TUIDynamicCast(v15, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dragDelegate"));
  if (objc_msgSend(v18, "layoutDirection") == (char *)&dword_0 + 2)
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  else
    v19 = 0;

  objc_msgSend(v19, "setUserInteractionEnabled:", 0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_12578C;
  v22[3] = &unk_240F98;
  v23 = v14;
  v24 = v19;
  v20 = v19;
  v21 = v14;
  objc_msgSend(v7, "addCompletion:", v22);

}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  -[TUIDragController _updateDraggingState:](self, "_updateDraggingState:", 0);
}

- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;

  v8 = kUINSUserActivityInternalType;
  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v5, v8);

  return v6;
}

+ (BOOL)viewSupportsDrag:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v3 = a3;
  v4 = objc_opt_class(TUILayoutAttributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutAttributes"));

  v6 = TUIDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_opt_class(TUIRenderModelInteractive);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderModel"));
  v10 = TUIDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = sub_125930(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  LOBYTE(v9) = v13 != 0;

  return (char)v9;
}

- (UIColor)dragBackgroundColor
{
  return self->_dragBackgroundColor;
}

- (void)setDragBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_dragBackgroundColor, a3);
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragBackgroundColor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
