@implementation UIDragEvent

- (UIDragEvent)initWithDragSessionID:(unsigned int)a3 environment:(id)a4
{
  uint64_t v4;
  id v6;
  _DWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  UIDragEvent *v25;
  objc_super v27;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_isSessionIDValid:", v4))
  {
    v27.receiver = self;
    v27.super_class = (Class)UIDragEvent;
    v7 = -[UIEvent _initWithEnvironment:](&v27, sel__initWithEnvironment_, v6);
    v8 = v7;
    if (v7)
    {
      v7[56] = v4;
      v9 = objc_opt_new();
      v10 = (void *)v8[18];
      v8[18] = v9;

      v11 = objc_opt_new();
      v12 = (void *)v8[19];
      v8[19] = v11;

      v13 = objc_opt_new();
      v14 = (void *)v8[20];
      v8[20] = v13;

      v15 = objc_opt_new();
      v16 = (void *)v8[21];
      v8[21] = v15;

      v17 = objc_opt_new();
      v18 = (void *)v8[22];
      v8[22] = v17;

      v19 = objc_opt_new();
      v20 = (void *)v8[23];
      v8[23] = v19;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v8[24];
      v8[24] = v21;

      v23 = objc_opt_new();
      v24 = (void *)v8[25];
      v8[25] = v23;

    }
    self = v8;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (int64_t)type
{
  return 9;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "unionSet:", self->_beginningGestureRecognizers);
  objc_msgSend(v4, "unionSet:", self->_updatingGestureRecognizers);
  objc_msgSend(v4, "unionSet:", self->_exitingGestureRecognizers);
  objc_msgSend(v4, "unionSet:", self->_endingGestureRecognizers);
  objc_msgSend(v4, "minusSet:", self->_ignoredGestureRecognizers);
  return v4;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  _UIDragEventSample *v5;
  _UIDragEventSample *currentSample;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDragEvent;
  -[UIEvent _setHIDEvent:](&v7, sel__setHIDEvent_);
  if (a3)
  {
    +[_UIDragEventSample sampleFromHIDEvent:](_UIDragEventSample, "sampleFromHIDEvent:", a3);
    v5 = (_UIDragEventSample *)objc_claimAutoreleasedReturnValue();
    currentSample = self->_currentSample;
    self->_currentSample = v5;

    -[UIDragEvent _updateFromCurrentSample](self, "_updateFromCurrentSample");
  }
}

- (id)_allWindows
{
  void *v2;
  void *v3;

  -[_UIDragEventSample window](self->_currentSample, "window");
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

- (CGPoint)locationInView:(id)a3
{
  _UIDragEventSample *currentSample;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  currentSample = self->_currentSample;
  v5 = a3;
  -[_UIDragEventSample locationInWindow](currentSample, "locationInWindow");
  v7 = v6;
  v9 = v8;
  -[_UIDragEventSample window](self->_currentSample, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toView:", v5, v7, v9);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)locationInSceneReferenceSpace
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  -[_UIDragEventSample locationInWindow](self->_currentSample, "locationInWindow");
  v4 = v3;
  v6 = v5;
  -[_UIDragEventSample window](self->_currentSample, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_convertPointToSceneReferenceSpace:", v4, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)isFromAccessibilitySession
{
  return -[_UIInternalDraggingSessionDestination isAccessibilitySession](self->_sessionDestination, "isAccessibilitySession");
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = 160;
  if (-[NSMutableSet containsObject:](self->_exitingGestureRecognizers, "containsObject:", v4))
  {
    objc_msgSend(v4, "_componentsCancelled:withEvent:", 0, self);
  }
  else
  {
    if (-[NSMutableSet containsObject:](self->_updatingGestureRecognizers, "containsObject:", v4))
    {
      objc_msgSend(v4, "_componentsChanged:withEvent:", 0, self);
      goto LABEL_8;
    }
    if (-[NSMutableSet containsObject:](self->_beginningGestureRecognizers, "containsObject:", v4))
    {
      objc_msgSend(v4, "_componentsBegan:withEvent:", 0, self);
      -[NSMutableSet removeObject:](self->_beginningGestureRecognizers, "removeObject:", v4);
      -[NSMutableSet addObject:](self->_updatingGestureRecognizers, "addObject:", v4);
      goto LABEL_8;
    }
    v5 = 168;
    if (!-[NSMutableSet containsObject:](self->_endingGestureRecognizers, "containsObject:", v4))
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "_componentsEnded:withEvent:", 0, self);
  }
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v5), "removeObject:", v4);
LABEL_8:
  v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)_shouldSendEvent
{
  return -[_UIInternalDraggingSessionDestination shouldDragEventBeSentToGestureRecognizers](self->_sessionDestination, "shouldDragEventBeSentToGestureRecognizers")|| self->_dragFailed;
}

- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3
{
  return !-[UIDragEvent _shouldSendEvent](self, "_shouldSendEvent", a3);
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  NSMutableSet *beginningGestureRecognizers;
  id v6;

  beginningGestureRecognizers = self->_beginningGestureRecognizers;
  v6 = a3;
  -[NSMutableSet removeObject:](beginningGestureRecognizers, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_updatingGestureRecognizers, "removeObject:", v6);

}

- (void)_ignoreGestureRecognizer:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[UIDragEvent _gestureRecognizersForWindow:](self, "_gestureRecognizersForWindow:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if (v5)
    -[NSMutableSet addObject:](self->_ignoredGestureRecognizers, "addObject:", v6);

}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  id v4;
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        -[UIDragEvent _ignoreGestureRecognizer:](self, "_ignoreGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_removeQueriedOwnerForDynamicGesturesIfNeeded:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable containsObject:](self->_ownersQueriedForDynamicGestures, "containsObject:"))
    -[NSHashTable removeObject:](self->_ownersQueriedForDynamicGestures, "removeObject:", v4);

}

- (UIView)_hitTestedView
{
  return self->_eventView;
}

- (UIWindow)eventWindow
{
  return -[_UIDragEventSample window](self->_currentSample, "window");
}

- (BOOL)isPolicyDriven
{
  return -[_UIDragEventSample isPolicyDriven](self->_currentSample, "isPolicyDriven");
}

- (BOOL)hasActiveGestureRecognizers
{
  return -[NSMutableSet count](self->_beginningGestureRecognizers, "count")
      || -[NSMutableSet count](self->_updatingGestureRecognizers, "count")
      || -[NSMutableSet count](self->_exitingGestureRecognizers, "count") != 0;
}

- (_UIDropSessionImpl)_dropSession
{
  return -[_UIInternalDraggingSessionDestination dropSession](self->_sessionDestination, "dropSession");
}

- (void)_updateFromCurrentSample
{
  void *v3;
  void *v4;
  void *v5;
  _UIInternalDraggingSessionSource *v6;
  _UIInternalDraggingSessionSource *sessionSource;
  _UIInternalDraggingSessionDestination *v8;
  _UIInternalDraggingSessionDestination *sessionDestination;
  _BOOL4 v10;
  _UIInternalDraggingSessionSource *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  -[_UIDragEventSample isDragEnd](self->_currentSample, "isDragEnd");
  if ((-[_UIDragEventSample isApplicationEnter](self->_currentSample, "isApplicationEnter")
     || -[_UIDragEventSample isApplicationWithin](self->_currentSample, "isApplicationWithin")
     || -[_UIDragEventSample isPolicyDriven](self->_currentSample, "isPolicyDriven"))
    && !self->_dragFailed)
  {
    -[_UIDragEventSample isApplicationEnter](self->_currentSample, "isApplicationEnter");
    -[_UIDragEventSample window](self->_currentSample, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_dragManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "hasPendingSessionRequests") & 1) != 0)
    {
      objc_initWeak(&location, self);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __39__UIDragEvent__updateFromCurrentSample__block_invoke;
      v15 = &unk_1E16B3F40;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v5, "performAfterCompletingPendingSessionRequests:", &v12);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      if (!self->_sessionSource)
      {
        objc_msgSend(v5, "sessionSourceWithIdentifier:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
        v6 = (_UIInternalDraggingSessionSource *)objc_claimAutoreleasedReturnValue();
        sessionSource = self->_sessionSource;
        self->_sessionSource = v6;

        -[_UIInternalDraggingSessionSource setDragEvent:](self->_sessionSource, "setDragEvent:", self);
      }
      if (!self->_sessionDestination)
      {
        objc_msgSend(v5, "dragDestinationWithEvent:", self);
        v8 = (_UIInternalDraggingSessionDestination *)objc_claimAutoreleasedReturnValue();
        sessionDestination = self->_sessionDestination;
        self->_sessionDestination = v8;

      }
    }

  }
  -[_UIInternalDraggingSessionSource setDragEvent:](self->_sessionSource, "setDragEvent:", self, v12, v13, v14, v15);
  -[_UIInternalDraggingSessionSource updateCentroidFromDragEvent](self->_sessionSource, "updateCentroidFromDragEvent");
  v10 = -[_UIDragEventSample isApplicationExit](self->_currentSample, "isApplicationExit");
  v11 = self->_sessionSource;
  if (v10)
  {
    -[_UIInternalDraggingSessionSource dragDidExitApp](v11, "dragDidExitApp");
    -[_UIInternalDraggingSessionDestination dragDidExitApp](self->_sessionDestination, "dragDidExitApp");
  }
  else
  {
    -[_UIInternalDraggingSessionSource dragIsInsideApp](v11, "dragIsInsideApp");
  }
  if (-[UIDragEvent _shouldSendEvent](self, "_shouldSendEvent"))
  {
    -[_UIInternalDraggingSessionDestination updateCentroidFromDragEvent](self->_sessionDestination, "updateCentroidFromDragEvent");
    -[UIDragEvent _updateGesturesFromCurrentSample](self, "_updateGesturesFromCurrentSample");
  }
}

void __39__UIDragEvent__updateFromCurrentSample__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFromCurrentSample");

}

- (void)_sendIfNeeded
{
  id v3;

  if (!-[_UIDragEventSample hasBeenDelivered](self->_currentSample, "hasBeenDelivered"))
  {
    -[UIDragEvent _updateFromCurrentSample](self, "_updateFromCurrentSample");
    objc_msgSend((id)UIApp, "_gestureEnvironment");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v3, self, 0);

  }
}

- (void)_updateGesturesFromCurrentSample
{
  UIView *v3;
  UIView *eventView;
  NSMutableSet *exitingGestureRecognizers;
  UIView *v6;
  UIDragEvent *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _QWORD *v13;
  id *v14;
  id *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  id *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id *v38;
  id WeakRetained;
  id v40;
  int v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  NSMutableSet *obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id *location;
  UIDragEvent *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[2];
  void (*v66)(void **, void *);
  void *v67;
  UIDragEvent *v68;
  id v69;
  id *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[_UIDragEventSample setHasBeenDelivered:](self->_currentSample, "setHasBeenDelivered:", 1);
  objc_storeStrong((id *)&self->_previousEventView, self->_eventView);
  if (self->_needsHitTestReset)
  {
    v3 = 0;
    self->_needsHitTestReset = 0;
  }
  else
  {
    -[_UIDragEventSample hitTestWithEvent:](self->_currentSample, "hitTestWithEvent:", self);
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  }
  eventView = self->_eventView;
  self->_eventView = v3;

  if (-[_UIDragEventSample isApplicationExit](self->_currentSample, "isApplicationExit") || self->_dragFailed)
  {
    exitingGestureRecognizers = self->_exitingGestureRecognizers;
LABEL_7:
    -[NSMutableSet unionSet:](exitingGestureRecognizers, "unionSet:", self->_updatingGestureRecognizers);
    -[NSMutableSet removeAllObjects](self->_updatingGestureRecognizers, "removeAllObjects");
    return;
  }
  if (-[_UIDragEventSample isDragEnd](self->_currentSample, "isDragEnd"))
  {
    exitingGestureRecognizers = self->_endingGestureRecognizers;
    goto LABEL_7;
  }
  if (self->_eventView == self->_previousEventView)
  {
    -[UIDragEvent _updatingDropGestureRecognizers](self, "_updatingDropGestureRecognizers");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v52, "count"))
    {
      v44 = -[_UIDragEventSample isPolicyDriven](self->_currentSample, "isPolicyDriven");

      if (v44)
        return;
      v52 = (id)objc_opt_new();
      objc_msgSend(v52, "setPrefersFullSizePreview:", 1);
      if (-[_UIInternalDraggingSessionSource dynamicallyUpdatesPrefersFullSizePreviews](self->_sessionSource, "dynamicallyUpdatesPrefersFullSizePreviews"))
      {
        objc_msgSend(v52, "setPrefersFullSizePreview:", -[_UIInternalDraggingSessionSource prefersFullSizePreview](self->_sessionSource, "prefersFullSizePreview"));
      }
      -[_UIInternalDraggingSessionDestination takePotentialDrop:](self->_sessionDestination, "takePotentialDrop:", v52);
    }

    return;
  }
  -[NSMutableSet removeAllObjects](self->_exitingGestureRecognizers, "removeAllObjects");
  v50 = self;
  v51 = (id)objc_opt_new();
  v6 = self->_eventView;
  v7 = self;
  if (v6)
  {
    while (1)
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      location = (id *)&v6->super.super.isa;
      -[UIView gestureRecognizers](v6, "gestureRecognizers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v72 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD **)(*((_QWORD *)&v71 + 1) + 8 * i);
            if (v13)
            {
              if ((v13[1] & 0x100000000000) != 0)
              {
                if (objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "isEnabled"))
                {
                  if (objc_msgSend(v13, "state") <= 2)
                  {
                    objc_msgSend(v51, "addObject:", v13);
                    if ((-[NSMutableSet containsObject:](v7->_updatingGestureRecognizers, "containsObject:", v13) & 1) == 0
                      && (-[NSMutableSet containsObject:](v7->_ignoredGestureRecognizers, "containsObject:", v13) & 1) == 0
                      && -[UIGestureRecognizer _internalShouldReceiveEvent:]((uint64_t)v13, v7))
                    {
                      -[NSMutableSet addObject:](v7->_beginningGestureRecognizers, "addObject:", v13);
                    }
                  }
                }
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
        }
        while (v10);
      }

      v14 = location;
      if (!_IsKindOfUIView((uint64_t)location))
        goto LABEL_48;
      v15 = location;
      if (!-[NSHashTable containsObject:](v7->_ownersQueriedForDynamicGestures, "containsObject:", v15))
        break;
LABEL_47:

LABEL_48:
      v6 = (UIView *)(id)objc_msgSend(v14, "_parentGestureRecognizerContainer");
      if (!v6)
        goto LABEL_49;
    }
    -[NSHashTable addObject:](v7->_ownersQueriedForDynamicGestures, "addObject:", v15);
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v66 = __47__UIDragEvent__updateGesturesFromCurrentSample__block_invoke;
    v67 = &unk_1E16DF470;
    v68 = v7;
    v70 = v15;
    v69 = v51;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(v15, "interactions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v62 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_opt_class();
            v19 |= objc_opt_isKindOfClass();
            objc_msgSend(v22, "_dynamicGestureRecognizersForEvent:", v50);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v66((void **)v65, v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
      }
      while (v18);

      v14 = location;
      v7 = v50;
      if ((v19 & 1) != 0)
        goto LABEL_46;
    }
    else
    {

    }
    v24 = v15;
    _UIDragEventPasteConfigurationForOwner(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = v15;
      objc_msgSend(v24, "_dynamicDropInteraction");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        v27 = -[UIDropInteraction _initWithPasteConfiguration:]([UIDropInteraction alloc], "_initWithPasteConfiguration:", v25);
        objc_msgSend(v24, "_setDynamicDropInteraction:", v27);
        objc_msgSend(v27, "_setWantsDefaultVisualBehavior:", 0);
        objc_msgSend(v27, "setAllowsSimultaneousDropSessions:", 1);
        objc_msgSend(v27, "didMoveToOwner:", v24);
      }
      -[NSMutableSet addObject:](v7->_dynamicInteractions, "addObject:", v27);
      objc_msgSend(v27, "_dynamicGestureRecognizersForEvent:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v66((void **)v65, v28);

      v15 = v26;
    }

LABEL_46:
    goto LABEL_47;
  }
LABEL_49:
  v29 = v51;
  if (-[NSMutableSet count](v7->_beginningGestureRecognizers, "count"))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v7->_beginningGestureRecognizers;
    v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    v30 = 0;
    if (!v47)
      goto LABEL_77;
    v46 = *(_QWORD *)v58;
    while (1)
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v58 != v46)
          objc_enumerationMutation(obj);
        v48 = v31;
        v32 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v31);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v33 = v7->_updatingGestureRecognizers;
        v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v54;
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v54 != v36)
                objc_enumerationMutation(v33);
              v38 = *(id **)(*((_QWORD *)&v53 + 1) + 8 * v37);
              if (objc_msgSend(v29, "containsObject:", v38))
              {
                if ((-[NSMutableSet containsObject:](v7->_ignoredGestureRecognizers, "containsObject:", v38) & 1) != 0
                  || !objc_msgSend(v38, "canBePreventedByGestureRecognizer:", v32))
                {
                  goto LABEL_70;
                }
                if (v32)
                {
                  WeakRetained = objc_loadWeakRetained((id *)(v32 + 48));
                  if (v38)
                    goto LABEL_65;
LABEL_73:
                  v40 = 0;
                }
                else
                {
                  WeakRetained = 0;
                  if (!v38)
                    goto LABEL_73;
LABEL_65:
                  v40 = objc_loadWeakRetained(v38 + 6);
                }
                v41 = isDescendantOfContainer(WeakRetained, v40, 0);

                v7 = v50;
                v29 = v51;
                if (!v41)
                  goto LABEL_70;
              }
              if (!v30)
                v30 = (void *)objc_opt_new();
              objc_msgSend(v30, "addObject:", v38);
LABEL_70:
              ++v37;
            }
            while (v35 != v37);
            v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
            v35 = v42;
          }
          while (v42);
        }

        v31 = v48 + 1;
      }
      while (v48 + 1 != v47);
      v47 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
      if (!v47)
      {
LABEL_77:

        -[NSMutableSet minusSet:](v7->_updatingGestureRecognizers, "minusSet:", v30);
        -[NSMutableSet unionSet:](v7->_exitingGestureRecognizers, "unionSet:", v30);

        goto LABEL_81;
      }
    }
  }
  -[NSMutableSet unionSet:](v7->_exitingGestureRecognizers, "unionSet:", v7->_updatingGestureRecognizers);
  -[NSMutableSet minusSet:](v7->_exitingGestureRecognizers, "minusSet:", v51);
  -[NSMutableSet minusSet:](v7->_updatingGestureRecognizers, "minusSet:", v7->_exitingGestureRecognizers);
LABEL_81:
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7->_ignoredGestureRecognizers);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "minusSet:", v29);
  -[NSMutableSet minusSet:](v7->_ignoredGestureRecognizers, "minusSet:", v43);

}

void __47__UIDragEvent__updateGesturesFromCurrentSample__block_invoke(void **a1, void *a2)
{
  id v3;
  uint64_t v4;
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
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (v8)
          *(_QWORD *)(v8 + 8) |= 0x400000000000uLL;
        objc_msgSend(*((id *)a1[4] + 23), "addObject:", v8);
        objc_msgSend(a1[6], "addGestureRecognizer:", v8);
        objc_msgSend(a1[5], "addObject:", v8);
        if (-[UIGestureRecognizer _internalShouldReceiveEvent:](v8, a1[4]))
          objc_msgSend(*((id *)a1[4] + 18), "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_updatingDropGestureRecognizers
{
  NSMutableSet *updatingGestureRecognizers;
  void *v3;
  void *v4;

  updatingGestureRecognizers = self->_updatingGestureRecognizers;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_459);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filteredSetUsingPredicate:](updatingGestureRecognizers, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __46__UIDragEvent__updatingDropGestureRecognizers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSSet)_dynamicGestureRecognizers
{
  return (NSSet *)self->_dynamicGestureRecognizers;
}

- (BOOL)_isReadyForReset
{
  if (-[_UIDragEventSample isApplicationExit](self->_currentSample, "isApplicationExit")
    || -[_UIDragEventSample isDragEnd](self->_currentSample, "isDragEnd"))
  {
    return 1;
  }
  if (self->_dragFailed)
    return self->_dragFailedCallback == 0;
  return 0;
}

- (void)_wasDeliveredToGestureRecognizers
{
  id *WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  UIDragEvent *v9;
  int v10;
  void (**dragFailedCallback)(void);
  id v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  UIDragEvent *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[_UIDragEventSample isDragEnd](self->_currentSample, "isDragEnd"))
  {
    if (-[_UIInternalDraggingSessionDestination didRequestDropToBePerformed](self->_sessionDestination, "didRequestDropToBePerformed"))
    {
      -[_UIInternalDraggingSessionDestination sawDragEndEvent](self->_sessionDestination, "sawDragEndEvent");
      objc_msgSend((id)objc_opt_class(), "_invalidateSessionID:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      WeakRetained = (id *)objc_loadWeakRetained((id *)&self->super._eventEnvironment);
      -[UIEventEnvironment _dragEvents](WeakRetained);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v25 != v7)
              objc_enumerationMutation(v4);
            v9 = *(UIDragEvent **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (v9 != self)
            {
              v10 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dragSessionID");
              if (v10 == -[UIDragEvent dragSessionID](self, "dragSessionID"))
                -[UIDragEvent _ignoreDragEnd](v9, "_ignoreDragEnd");
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v6);
      }
LABEL_13:

      goto LABEL_15;
    }
    if (!self->_ignoreDragEnd
      && (!-[_UIDragEventSample isPolicyDriven](self->_currentSample, "isPolicyDriven")
       || !-[_UIDragEventSample isApplicationExit](self->_currentSample, "isApplicationExit")))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = (id *)objc_loadWeakRetained((id *)&self->super._eventEnvironment);
      -[UIEventEnvironment _dragEvents](v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
LABEL_23:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v4);
          v18 = *(UIDragEvent **)(*((_QWORD *)&v20 + 1) + 8 * v17);
          if (v18 != self)
          {
            v19 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "dragSessionID", (_QWORD)v20);
            if (v19 == -[UIDragEvent dragSessionID](self, "dragSessionID")
              && !-[_UIDragEventSample isDragEnd](v18->_currentSample, "isDragEnd"))
            {
              goto LABEL_13;
            }
          }
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v15)
              goto LABEL_23;
            break;
          }
        }
      }

      -[_UIInternalDraggingSessionDestination sawDragEndEvent](self->_sessionDestination, "sawDragEndEvent");
      objc_msgSend((id)objc_opt_class(), "_invalidateSessionID:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
    }
  }
LABEL_15:
  if (self->_dragFailed)
  {
    dragFailedCallback = (void (**)(void))self->_dragFailedCallback;
    if (dragFailedCallback)
    {
      dragFailedCallback[2]();
      v12 = self->_dragFailedCallback;
      self->_dragFailedCallback = 0;

    }
  }
}

- (void)_ignoreDragEnd
{
  self->_ignoreDragEnd = 1;
}

- (void)_dragFailedWithCallback:(id)a3
{
  id v5;
  void *v6;
  id dragFailedCallback;
  void *v8;
  _QWORD block[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragEvent.m"), 789, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callback != nil"));

  }
  self->_dragFailed = 1;
  v6 = _Block_copy(v5);
  dragFailedCallback = self->_dragFailedCallback;
  self->_dragFailedCallback = v6;

  objc_msgSend((id)objc_opt_class(), "_invalidateSessionID:", -[UIDragEvent dragSessionID](self, "dragSessionID"));
  -[_UIDragEventSample setHasBeenDelivered:](self->_currentSample, "setHasBeenDelivered:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__UIDragEvent__dragFailedWithCallback___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __39__UIDragEvent__dragFailedWithCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_sendIfNeeded");
  if (objc_msgSend(*(id *)(a1 + 32), "_isReadyForReset"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 96));
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v4 = 0;
      WeakRetained = 0;
    }
    v5 = WeakRetained;
    -[UIEventEnvironment _removeDragEvent:]((uint64_t)WeakRetained, v4);

  }
}

- (unsigned)_touchRoutingPolicyContextID
{
  uint64_t v3;

  v3 = -[_UIDragEventSample windowServerHitTestContextID](self->_currentSample, "windowServerHitTestContextID");
  if (-[_UIInternalDraggingSessionSource touchRoutingPolicyContainsContextIDToAlwaysSend:](self->_sessionSource, "touchRoutingPolicyContainsContextIDToAlwaysSend:", v3))
  {
    return v3;
  }
  else
  {
    return 0;
  }
}

- (unsigned)_windowServerHitTestContextID
{
  return -[_UIDragEventSample windowServerHitTestContextID](self->_currentSample, "windowServerHitTestContextID");
}

+ (void)_invalidateSessionID:(unsigned int)a3
{
  int v3;

  if (a3)
  {
    v3 = _MergedGlobals_31_1[0];
    _MergedGlobals_31_1[_MergedGlobals_31_1[0] + 1] = a3;
    _MergedGlobals_31_1[0] = (v3 + 1) % 0xAu;
  }
}

+ (BOOL)_isSessionIDValid:(unsigned int)a3
{
  uint64_t v3;
  int v4;

  if (!a3)
    return 0;
  v3 = 1u;
  do
  {
    v4 = _MergedGlobals_31_1[v3];
    if (!v4)
      break;
    if (v4 == a3)
      return 0;
    ++v3;
  }
  while (v3 != 11);
  return 1;
}

- (void)_setNeedsHitTestReset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIDragEvent _updatingDropGestureRecognizers](self, "_updatingDropGestureRecognizers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((-[UIGestureRecognizer _internalShouldReceiveEvent:](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7), self) & 1) != 0)
        {

          return;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v5)
        continue;
      break;
    }
  }

  self->_needsHitTestReset = 1;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDragEvent _reset](self, "_reset");
  v3.receiver = self;
  v3.super_class = (Class)UIDragEvent;
  -[UIEvent dealloc](&v3, sel_dealloc);
}

- (void)_reset
{
  UIView *previousEventView;
  UIView *eventView;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  previousEventView = self->_previousEventView;
  self->_previousEventView = 0;

  eventView = self->_eventView;
  self->_eventView = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_dynamicGestureRecognizers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
          WeakRetained = objc_loadWeakRetained((id *)(v10 + 48));
        else
          WeakRetained = 0;
        objc_msgSend(WeakRetained, "removeGestureRecognizer:", v10, (_QWORD)v13);

        ++v9;
      }
      while (v7 != v9);
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v12;
    }
    while (v12);
  }

  -[NSMutableSet removeAllObjects](self->_dynamicGestureRecognizers, "removeAllObjects");
  -[NSHashTable removeAllObjects](self->_ownersQueriedForDynamicGestures, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_dynamicInteractions, "removeAllObjects");
}

- (unsigned)dragSessionID
{
  return self->_dragSessionID;
}

- (_UIInternalDraggingSessionDestination)_sessionDestination
{
  return self->_sessionDestination;
}

- (_UIInternalDraggingSessionSource)_sessionSource
{
  return self->_sessionSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionSource, 0);
  objc_storeStrong((id *)&self->_sessionDestination, 0);
  objc_storeStrong(&self->_dragFailedCallback, 0);
  objc_storeStrong((id *)&self->_dynamicInteractions, 0);
  objc_storeStrong((id *)&self->_ownersQueriedForDynamicGestures, 0);
  objc_storeStrong((id *)&self->_dynamicGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_ignoredGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_endingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_exitingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_updatingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_beginningGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_eventView, 0);
  objc_storeStrong((id *)&self->_previousEventView, 0);
  objc_storeStrong((id *)&self->_currentSample, 0);
}

@end
