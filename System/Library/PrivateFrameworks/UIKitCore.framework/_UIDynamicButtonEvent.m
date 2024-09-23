@implementation _UIDynamicButtonEvent

- (_UIDynamicButtonEvent)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDynamicButtonEvent.m"), 234, CFSTR("%s: init is not allowed on %@"), "-[_UIDynamicButtonEvent init]", objc_opt_class());

  return 0;
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicButtonEvent;
  v2 = -[UIEvent _init](&v10, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[15];
    v2[15] = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[16];
    v2[16] = v5;

    v7 = (void *)v2[17];
    v2[17] = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__windowDidDetachContext_, _UIWindowDidDetachContextNotification, 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__windowDidBecomeHidden_, CFSTR("UIWindowDidBecomeHiddenNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = _UIWindowDidDetachContextNotification;
  v6[1] = CFSTR("UIWindowDidBecomeHiddenNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIDynamicButtonEvent;
  -[UIEvent dealloc](&v5, sel_dealloc);
}

- (int64_t)type
{
  return 16;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_cloneEvent
{
  return 0;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  _UIDynamicButton *v19;
  int v20;
  unint64_t stageTransition;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _UIDynamicButtonDeliveryTable *v25;
  _UIDynamicButtonDeliveryTable *v26;
  uint64_t v27;
  NSMutableSet *beginningGestureRecognizers;
  uint64_t v29;
  NSMutableSet *updatingGestureRecognizers;
  uint64_t v31;
  NSMutableSet *endingGestureRecognizers;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  unint64_t v55;
  _UIDynamicButton *dynamicButtonForDispatch;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  _UIDynamicButton *v63;
  void *v64;
  id v65;
  id obj;
  objc_super v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE buf[132];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)_UIDynamicButtonEvent;
  -[UIEvent _setHIDEvent:](&v67, sel__setHIDEvent_);
  if (a3)
  {
    if (_UIEventHIDIsDynamicButtonEvent((uint64_t)a3))
    {
      if (self)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDynamicButtonEvent.m"), 278, CFSTR("Invalid hidEvent type for %@: %@"), objc_opt_class(), a3);

      if (self)
      {
LABEL_4:
        _UIEventHIDUIWindowForHIDEvent();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[_UIDynamicButtonEvent _processHIDEventFindingDynamicButtonForDispatch:]";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = a3;
              _os_log_fault_impl(&dword_185066000, v61, OS_LOG_TYPE_FAULT, "%s: Received nil window for dispatched HID event: hidEvent: %@", buf, 0x16u);
            }

          }
          else
          {
            v17 = qword_1ECD7A110;
            if (!qword_1ECD7A110)
            {
              v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v17, (unint64_t *)&qword_1ECD7A110);
            }
            v18 = *(NSObject **)(v17 + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[_UIDynamicButtonEvent _processHIDEventFindingDynamicButtonForDispatch:]";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = a3;
              _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "%s: Received nil window for dispatched HID event: hidEvent: %@", buf, 0x16u);
            }
          }
          v19 = 0;
          goto LABEL_86;
        }
        if (_UIEventHIDIsDynamicButtonEvent((uint64_t)a3))
          v7 = 5;
        else
          v7 = 0;
        v8 = _UIDynamicButtonStageFromHIDEvent((uint64_t)a3);
        -[NSMapTable objectForKey:](self->_dynamicButtonsByWindow, "objectForKey:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v69;
LABEL_10:
          v14 = v10;
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v69 != v13)
              objc_enumerationMutation(v14);
            v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v15);
            if (objc_msgSend(v16, "_physicalButton") == v7 && objc_msgSend(v16, "_stage") == v8)
              break;
            if (v12 == ++v15)
            {
              v10 = v14;
              v12 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
              if (v12)
                goto LABEL_10;
              goto LABEL_17;
            }
          }
          v19 = v16;
          v10 = v14;

          if (!v19)
            goto LABEL_26;
          -[_UIDynamicButton _updateWithHIDEvent:]((uint64_t)v19, (uint64_t)a3);
        }
        else
        {
LABEL_17:

LABEL_26:
          +[_UIDynamicButton _dynamicButtonFromHIDEvent:]((uint64_t)_UIDynamicButton, (uint64_t)a3);
          v19 = (_UIDynamicButton *)objc_claimAutoreleasedReturnValue();
          if (!v10)
            v10 = (id)objc_opt_new();
          objc_msgSend(v10, "addObject:", v19);
          -[NSMapTable setObject:forKey:](self->_dynamicButtonsByWindow, "setObject:forKey:", v10, v6);
          if (!v19)
          {
            v20 = 1;
            goto LABEL_35;
          }
        }
        v20 = 0;
        stageTransition = v19->_stageTransition;
        v22 = 3;
        if (stageTransition != 2)
          v22 = 1;
        if (stageTransition == 1)
          v23 = 0;
        else
          v23 = v22;
        v19->_phase = v23;
LABEL_35:
        -[NSMapTable objectForKey:](self->_deliveryTableByDynamicButton, "objectForKey:", v19);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (_UIDynamicButtonDeliveryTable *)v24;
        }
        else
        {
          v25 = [_UIDynamicButtonDeliveryTable alloc];
          if (v25)
          {
            if (v20)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithDynamicButton_, v25, CFSTR("_UIDynamicButtonEvent.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dynamicButton"));

            }
            *(_QWORD *)buf = v25;
            *(_QWORD *)&buf[8] = _UIDynamicButtonDeliveryTable;
            v26 = (_UIDynamicButtonDeliveryTable *)objc_msgSendSuper2((objc_super *)buf, sel_init);
            v25 = v26;
            if (v26)
            {
              objc_storeStrong((id *)&v26->_dynamicButton, v19);
              v27 = objc_opt_new();
              beginningGestureRecognizers = v25->_beginningGestureRecognizers;
              v25->_beginningGestureRecognizers = (NSMutableSet *)v27;

              v29 = objc_opt_new();
              updatingGestureRecognizers = v25->_updatingGestureRecognizers;
              v25->_updatingGestureRecognizers = (NSMutableSet *)v29;

              v31 = objc_opt_new();
              endingGestureRecognizers = v25->_endingGestureRecognizers;
              v25->_endingGestureRecognizers = (NSMutableSet *)v31;

            }
          }
          -[NSMapTable setObject:forKey:](self->_deliveryTableByDynamicButton, "setObject:forKey:", v25, v19);
          if (!v25)
            goto LABEL_82;
        }
        v33 = -[_UIDynamicButton _phase](v25->_dynamicButton, "_phase");
        if (v33)
        {
          if (v33 == 3)
          {
            -[NSMutableSet unionSet:](v25->_endingGestureRecognizers, "unionSet:", v25->_updatingGestureRecognizers);
            -[NSMutableSet removeAllObjects](v25->_updatingGestureRecognizers, "removeAllObjects");
          }
        }
        else
        {
          v65 = v10;
          -[_UIDynamicButton _window](v25->_dynamicButton, "_window");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "_windowHostingScene");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_physicalButtonInteractionArbiter");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
            goto LABEL_60;
          -[_UIPhysicalButtonInteractionArbiter _gestureViewsForWindow:physicalButton:]((uint64_t)v36, (uint64_t)v34, -[_UIDynamicButton _physicalButton](v25->_dynamicButton, "_physicalButton"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v37, "mutableCopy");

          v39 = v6;
          if (qword_1ECD7A140 != -1)
            dispatch_once(&qword_1ECD7A140, &__block_literal_global_154_1);
          if (_MergedGlobals_25_2)
          {
            objc_msgSend(v34, "_responderForKeyEvents");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "__isKindOfUIRemoteViewController"))
            {
              objc_msgSend(v40, "view");
              v41 = objc_claimAutoreleasedReturnValue();

              v40 = (void *)v41;
            }
            if (v40)
            {
              do
              {
                if (_IsKindOfUIView((uint64_t)v40)
                  && (objc_msgSend(v38, "containsObject:", v40) & 1) == 0
                  && -[UIView _isInVisibleHierarchy]((uint64_t)v40))
                {
                  objc_msgSend(v38, "addObject:", v40);
                }
                objc_msgSend(v40, "nextResponder");
                v42 = objc_claimAutoreleasedReturnValue();

                v40 = (void *)v42;
              }
              while (v42);
            }
          }
          v6 = v39;
          if (v38)
          {
            v43 = (void *)objc_msgSend(v38, "copy");

          }
          else
          {
LABEL_60:
            v43 = (void *)objc_opt_new();
          }

          if (objc_msgSend(v43, "count"))
          {
            v63 = v19;
            v64 = v6;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            obj = v43;
            v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v77;
              do
              {
                for (i = 0; i != v45; ++i)
                {
                  if (*(_QWORD *)v77 != v46)
                    objc_enumerationMutation(obj);
                  v48 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                  v72 = 0u;
                  v73 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  objc_msgSend(v48, "gestureRecognizers");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
                  if (v50)
                  {
                    v51 = v50;
                    v52 = *(_QWORD *)v73;
                    do
                    {
                      for (j = 0; j != v51; ++j)
                      {
                        if (*(_QWORD *)v73 != v52)
                          objc_enumerationMutation(v49);
                        v54 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                        if (objc_msgSend(v54, "isEnabled")
                          && objc_msgSend(v54, "state") <= 2
                          && -[UIGestureRecognizer _shouldReceiveDynamicButton:forEvent:]((uint64_t)v54, (uint64_t)v25->_dynamicButton, (uint64_t)self))
                        {
                          -[NSMutableSet addObject:](v25->_beginningGestureRecognizers, "addObject:", v54);
                        }
                      }
                      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
                    }
                    while (v51);
                  }

                }
                v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
              }
              while (v45);
            }

            v6 = v64;
            v10 = v65;
            v19 = v63;
          }
          else
          {

            v10 = v65;
          }
        }
LABEL_82:
        v55 = qword_1ECD7A118;
        if (!qword_1ECD7A118)
        {
          v55 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v55, (unint64_t *)&qword_1ECD7A118);
        }
        if ((*(_BYTE *)v55 & 1) != 0)
        {
          v58 = *(NSObject **)(v55 + 8);
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            v59 = v58;
            -[_UIDynamicButton debugDescription](v19, "debugDescription");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v60;
            _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_ERROR, "Dynamic button for dispatch: %@", buf, 0xCu);

          }
        }

LABEL_86:
LABEL_87:
        dynamicButtonForDispatch = self->_dynamicButtonForDispatch;
        self->_dynamicButtonForDispatch = v19;

        return;
      }
    }
    v19 = 0;
    goto LABEL_87;
  }
}

- (id)_allWindows
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMapTable keyEnumerator](self->_dynamicButtonsByWindow, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dispatchWindows
{
  void *v2;
  void *v3;

  -[_UIDynamicButton _window](self->_dynamicButtonForDispatch, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectForKey:](self->_dynamicButtonsByWindow, "objectForKey:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMapTable objectForKey:](self->_deliveryTableByDynamicButton, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[_UIDynamicButtonDeliveryTable gestureRecognizers](v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UIDynamicButtonEvent *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  _UIDynamicButtonEvent *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = qword_1ECD7A120;
  if (!qword_1ECD7A120)
  {
    v5 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1ECD7A120);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v13 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      objc_msgSend(a3, "_briefDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = self;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Sending dynamic button event to: %@; \n%@",
        (uint8_t *)&v25,
        0x16u);

    }
  }
  -[NSMapTable objectForKey:](self->_deliveryTableByDynamicButton, "objectForKey:", self->_dynamicButtonForDispatch);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(*(id *)(v6 + 24), "containsObject:", a3) & 1) != 0)
    {
      objc_msgSend(*(id *)(v7 + 24), "removeObject:", a3);
      v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      -[_UIDynamicButtonEvent addObject:](v8, "addObject:", *(_QWORD *)(v7 + 32));
      if (v8)
      {
        v9 = qword_1ECD7A138;
        if (!qword_1ECD7A138)
        {
          v9 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&qword_1ECD7A138);
        }
        if ((*(_BYTE *)v9 & 1) != 0)
        {
          v16 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = v16;
            objc_msgSend(a3, "_briefDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412546;
            v26 = v18;
            v27 = 2112;
            v28 = v8;
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsEnded to: %@; \n%@",
              (uint8_t *)&v25,
              0x16u);

          }
        }
        objc_msgSend(a3, "_componentsEnded:withEvent:", v8, self);
LABEL_23:

      }
    }
    else if ((objc_msgSend(*(id *)(v7 + 16), "containsObject:", a3) & 1) != 0)
    {
      v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      -[_UIDynamicButtonEvent addObject:](v8, "addObject:", *(_QWORD *)(v7 + 32));
      if (v8)
      {
        v10 = qword_1ECD7A130;
        if (!qword_1ECD7A130)
        {
          v10 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v10, (unint64_t *)&qword_1ECD7A130);
        }
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          v19 = *(NSObject **)(v10 + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            objc_msgSend(a3, "_briefDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412546;
            v26 = v21;
            v27 = 2112;
            v28 = v8;
            _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsChanged to: %@; \n%@",
              (uint8_t *)&v25,
              0x16u);

          }
        }
        objc_msgSend(a3, "_componentsChanged:withEvent:", v8, self);
        goto LABEL_23;
      }
    }
    else if (objc_msgSend(*(id *)(v7 + 8), "containsObject:", a3))
    {
      objc_msgSend(*(id *)(v7 + 8), "removeObject:", a3);
      objc_msgSend(*(id *)(v7 + 16), "addObject:", a3);
      v8 = (_UIDynamicButtonEvent *)objc_opt_new();
      -[_UIDynamicButtonEvent addObject:](v8, "addObject:", *(_QWORD *)(v7 + 32));
      if (v8)
      {
        v11 = qword_1ECD7A128;
        if (!qword_1ECD7A128)
        {
          v11 = __UILogCategoryGetNode("DynamicButton", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v11, (unint64_t *)&qword_1ECD7A128);
        }
        if ((*(_BYTE *)v11 & 1) != 0)
        {
          v22 = *(NSObject **)(v11 + 8);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = v22;
            objc_msgSend(a3, "_briefDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412546;
            v26 = v24;
            v27 = 2112;
            v28 = v8;
            _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Sending dynamicButtonsBegan to: %@; \n%@",
              (uint8_t *)&v25,
              0x16u);

          }
        }
        objc_msgSend(a3, "_componentsBegan:withEvent:", v8, self);
        goto LABEL_23;
      }
    }
  }

  return 1;
}

- (void)_cleanupAfterDispatch
{
  _UIDynamicButton *dynamicButtonForDispatch;
  void *v4;
  void *v5;
  _UIDynamicButton *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDynamicButtonEvent;
  -[UIEvent _cleanupAfterDispatch](&v7, sel__cleanupAfterDispatch);
  if (-[_UIDynamicButton _phase](self->_dynamicButtonForDispatch, "_phase") > 1)
  {
    -[NSMapTable removeObjectForKey:](self->_deliveryTableByDynamicButton, "removeObjectForKey:", self->_dynamicButtonForDispatch);
    -[_UIDynamicButton _window](self->_dynamicButtonForDispatch, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_dynamicButtonsByWindow, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", self->_dynamicButtonForDispatch);
    if (!objc_msgSend(v5, "count"))
      -[NSMapTable removeObjectForKey:](self->_dynamicButtonsByWindow, "removeObjectForKey:", v4);
    -[UIBackgroundConfiguration _setCustomView:]((uint64_t)self->_dynamicButtonForDispatch, 0);

  }
  else
  {
    dynamicButtonForDispatch = self->_dynamicButtonForDispatch;
    if (dynamicButtonForDispatch)
      dynamicButtonForDispatch->_phase = 2;
  }
  v6 = self->_dynamicButtonForDispatch;
  self->_dynamicButtonForDispatch = 0;

}

- (void)_gestureRecognizerNoLongerNeedsSendEvent:(id)a3
{
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_deliveryTableByDynamicButton;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIDynamicButtonEvent _removeGestureRecognizer:fromComponents:](self, "_removeGestureRecognizer:fromComponents:", a3, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (NSSet)_allDynamicButtons
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_deliveryTableByDynamicButton;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v9;
}

- (id)_componentsForGestureRecognizer:(id)a3
{
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_deliveryTableByDynamicButton;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_deliveryTableByDynamicButton, "objectForKey:", v10);
        v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[_UIDynamicButtonDeliveryTable gestureRecognizers](v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", a3);

        if (v13)
          objc_msgSend(v16, "addObject:", v10);

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v16, "copy");
  return v14;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = 0x1E0CB3000uLL;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "_eventComponentType");
        if (v13 != 2)
        {
          v16 = v13;
          objc_msgSend(*(id *)(v10 + 1160), "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDynamicButtonEvent.m"), 505, CFSTR("Wrong component type for event: %@; component: %lu"),
            self,
            v16);

          v10 = 0x1E0CB3000;
        }
        -[NSMapTable objectForKey:](self->_deliveryTableByDynamicButton, "objectForKey:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (id *)v14;
        if (v14)
        {
          objc_msgSend(*(id *)(v14 + 8), "removeObject:", a3);
          objc_msgSend(v15[2], "removeObject:", a3);
          objc_msgSend(v15[3], "removeObject:", a3);
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (id)_componentsForWindow:(id)a3
{
  void *v3;
  void *v4;

  -[NSMapTable objectForKey:](self->_dynamicButtonsByWindow, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_removeComponents:(int)a3 withCancellation:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = a2;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (!v5)
      goto LABEL_17;
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        if (objc_msgSend(v9, "_eventComponentType") == 2)
        {
          if (!a3)
            goto LABEL_10;
LABEL_9:
          objc_msgSend(a1[16], "objectForKey:", v9);
          v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          -[_UIDynamicButtonDeliveryTable gestureRecognizers](v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_removeGestureRecognizersSendingCancelledEvent:", v11);

          goto LABEL_10;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeComponents_withCancellation_, a1, CFSTR("_UIDynamicButtonEvent.m"), 519, CFSTR("Unexpected component type: %ld"), objc_msgSend(v9, "_eventComponentType"));

        if (a3)
          goto LABEL_9;
LABEL_10:
        objc_msgSend(v9, "_window");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[15], "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObject:", v9);
        if (!objc_msgSend(v13, "count"))
          objc_msgSend(a1[15], "removeObjectForKey:", v12);
        objc_msgSend(a1[16], "removeObjectForKey:", v9);
        -[UIBackgroundConfiguration _setCustomView:]((uint64_t)v9, 0);

        ++v8;
      }
      while (v6 != v8);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v15;
      if (!v15)
      {
LABEL_17:

        return;
      }
    }
  }
}

- (id)_removeComponentsForWindow:(id *)result withCancellation:(uint64_t)a2
{
  id *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    objc_msgSend(result, "_componentsForWindow:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicButtonEvent _removeComponents:withCancellation:](v3, v4, 1);

    return (id *)objc_msgSend(v3[15], "removeObjectForKey:", a2);
  }
  return result;
}

- (void)_removeComponents:(id)a3
{
  -[_UIDynamicButtonEvent _removeComponents:withCancellation:]((id *)&self->super.super.isa, a3, 0);
}

- (void)_cancelComponents:(id)a3
{
  -[_UIDynamicButtonEvent _removeComponents:withCancellation:]((id *)&self->super.super.isa, a3, 1);
}

- (void)_windowDidDetachContext:(id)a3
{
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIDynamicButtonEvent _removeComponentsForWindow:withCancellation:]((id *)&self->super.super.isa, (uint64_t)v5);

    }
  }
  else
  {

  }
}

- (void)_windowDidBecomeHidden:(id)a3
{
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UIDynamicButtonEvent _removeComponentsForWindow:withCancellation:]((id *)&self->super.super.isa, (uint64_t)v5);

    }
  }
  else
  {

  }
}

- (uint64_t)_appendDescriptionToStream:(uint64_t)result
{
  uint64_t v3;
  _QWORD v4[6];

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "appendProem:block:", result, &__block_literal_global_685);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_2;
    v4[3] = &unk_1E16B1B50;
    v4[4] = a2;
    v4[5] = v3;
    return objc_msgSend(a2, "appendBodySectionWithName:block:", 0, v4);
  }
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[6];

  v5 = objc_opt_class();
  v6 = a3;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v12 = v7;

  if (v12)
  {
    -[_UIDynamicButtonEvent _appendDescriptionToStream:]((uint64_t)self, v12);
  }
  else
  {
    v8 = objc_opt_class();
    v9 = v6;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    if (v11)
    {
      -[_UIDynamicButtonEvent _appendDescriptionToBuilder:](self, v11);
    }
    else if (self)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __61___UIDynamicButtonEvent__appendSimpleDescriptionToFormatter___block_invoke;
      v13[3] = &unk_1E16B1B50;
      v13[4] = v9;
      v13[5] = self;
      objc_msgSend(v9, "appendProem:block:", self, v13);
    }

  }
}

- (id)_appendDescriptionToBuilder:(id)result
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke;
    v2[3] = &unk_1E16B1B50;
    v2[4] = a2;
    v2[5] = result;
    return (id)objc_msgSend(a2, "modifyBody:", v2);
  }
  return result;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIDynamicButtonEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDynamicButtonEvent _appendDescriptionToBuilder:](self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIDynamicButtonEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIDynamicButtonEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIDynamicButtonEvent *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[_UIDynamicButtonEvent _appendDescriptionToStream:]((uint64_t)self, v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIDynamicButtonEvent debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicButtonForDispatch, 0);
  objc_storeStrong((id *)&self->_deliveryTableByDynamicButton, 0);
  objc_storeStrong((id *)&self->_dynamicButtonsByWindow, 0);
}

@end
