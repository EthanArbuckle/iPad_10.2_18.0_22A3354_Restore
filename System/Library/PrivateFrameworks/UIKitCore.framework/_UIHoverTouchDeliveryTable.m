@implementation _UIHoverTouchDeliveryTable

- (_UIHoverTouchDeliveryTable)initWithTouch:(id)a3
{
  id v6;
  _UIHoverTouchDeliveryTable *v7;
  _UIHoverTouchDeliveryTable *v8;
  uint64_t v9;
  NSMutableSet *beginningGestureRecognizers;
  uint64_t v11;
  NSMutableSet *updatingGestureRecognizers;
  uint64_t v13;
  NSMutableSet *exitingGestureRecognizers;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIHoverEvent.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touch"));

  }
  v17.receiver = self;
  v17.super_class = (Class)_UIHoverTouchDeliveryTable;
  v7 = -[_UIHoverTouchDeliveryTable init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_touch, a3);
    v9 = objc_opt_new();
    beginningGestureRecognizers = v8->_beginningGestureRecognizers;
    v8->_beginningGestureRecognizers = (NSMutableSet *)v9;

    v11 = objc_opt_new();
    updatingGestureRecognizers = v8->_updatingGestureRecognizers;
    v8->_updatingGestureRecognizers = (NSMutableSet *)v11;

    v13 = objc_opt_new();
    exitingGestureRecognizers = v8->_exitingGestureRecognizers;
    v8->_exitingGestureRecognizers = (NSMutableSet *)v13;

  }
  return v8;
}

- (int64_t)updateGestureRecognizerForDelivery:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_exitingGestureRecognizers, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_exitingGestureRecognizers, "removeObject:", v4);
    v5 = 7;
  }
  else if ((-[NSMutableSet containsObject:](self->_updatingGestureRecognizers, "containsObject:", v4) & 1) != 0)
  {
    v5 = 6;
  }
  else if (-[NSMutableSet containsObject:](self->_beginningGestureRecognizers, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_beginningGestureRecognizers, "removeObject:", v4);
    -[NSMutableSet addObject:](self->_updatingGestureRecognizers, "addObject:", v4);
    v5 = 5;
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (void)removeGestureRecognizer:(id)a3
{
  NSMutableSet *beginningGestureRecognizers;
  id v5;

  beginningGestureRecognizers = self->_beginningGestureRecognizers;
  v5 = a3;
  -[NSMutableSet removeObject:](beginningGestureRecognizers, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_updatingGestureRecognizers, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_exitingGestureRecognizers, "removeObject:", v5);

}

- (void)_cancelAllGestureRecognizers
{
  void *v3;
  void *v4;
  id v5;

  -[_UIHoverTouchDeliveryTable gestureRecognizers](self, "gestureRecognizers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeAllObjects](self->_beginningGestureRecognizers, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_updatingGestureRecognizers, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_exitingGestureRecognizers, "removeAllObjects");
  v3 = (void *)UIApp;
  objc_msgSend(v5, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cancelGestureRecognizers:", v4);

}

- (void)updateForEvent:(id)a3 forcingHitTest:(BOOL)a4
{
  id v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  char MayVendViews;
  char v11;
  void *v12;
  void *v13;
  UITouchPhase v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  char v28;
  void *v29;
  char v30;
  char v31;
  id *v32;
  id v33;
  void (**v34)(void *, _QWORD);
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  NSMutableSet *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id *v59;
  id WeakRetained;
  id v61;
  int v62;
  uint64_t v63;
  id *v64;
  uint64_t v65;
  id v66;
  NSMutableSet *obj;
  uint64_t v68;
  uint64_t v69;
  _UIHoverTouchDeliveryTable *v70;
  char v71;
  uint64_t v72;
  void *v73;
  id *location;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD aBlock[4];
  id v96;
  _UIHoverTouchDeliveryTable *v97;
  id v98;
  char v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend((id)UIApp, "_isSpringBoard");
  if (_UIEventHIDGetDescendantPointerEvent(objc_msgSend(v6, "_hidEvent")))
  {
    BKSHIDEventGetPointerAttributes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pointerState") == 4;

  }
  else
  {
    v9 = 0;
  }
  if ((_UIApplicationIsExtension() & 1) != 0)
  {
    MayVendViews = 1;
    if (!v7)
    {
LABEL_6:
      v11 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    MayVendViews = _UIApplicationMayVendViews();
    if (!v7)
      goto LABEL_6;
  }
  -[UITouch window](self->_touch, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[UITouch window](self->_touch, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "_constrainsHoverEventHitTesting");

  }
  else
  {
    v11 = 0;
  }

LABEL_12:
  -[UITouch _responder](self->_touch, "_responder");
  v65 = objc_claimAutoreleasedReturnValue();
  v14 = -[UITouch phase](self->_touch, "phase");
  v15 = v14 - 5;
  if ((unint64_t)(v14 - 5) > 1)
  {
    v16 = 0;
  }
  else
  {
    -[UITouch _rehitTestWithEvent:constrainingToCurrentWindow:]((uint64_t)self->_touch, v6, v9 | MayVendViews | v11);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v65;
  v64 = (id *)v16;
  v18 = v65 == v16 || v15 >= 2;
  v19 = 1;
  v70 = self;
  if (v18 && !a4)
  {
    if (-[NSMutableSet count](self->_beginningGestureRecognizers, "count"))
    {
      v19 = 0;
    }
    else
    {
      v19 = -[NSMutableSet count](self->_updatingGestureRecognizers, "count") == 0;
      if (v19)
        goto LABEL_42;
    }
    if (v9 && ((v7 ^ 1) & 1) == 0)
    {
      -[UITouch window](self->_touch, "window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "unionSet:", self->_beginningGestureRecognizers);
        objc_msgSend(v22, "unionSet:", self->_updatingGestureRecognizers);
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v101;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v101 != v26)
                objc_enumerationMutation(v23);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v19 = 0;
                goto LABEL_38;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
            if (v25)
              continue;
            break;
          }
          v19 = 1;
LABEL_38:
          self = v70;
        }
        else
        {
          v19 = 1;
        }

      }
      else
      {
        v19 = 0;
      }
      v17 = (void *)v65;
    }
  }
LABEL_42:
  if (v14 == UITouchPhaseRegionExited)
  {
    -[NSMutableSet unionSet:](self->_exitingGestureRecognizers, "unionSet:", self->_updatingGestureRecognizers);
    -[NSMutableSet removeAllObjects](self->_updatingGestureRecognizers, "removeAllObjects");
    goto LABEL_103;
  }
  v28 = !v19;
  if (v15 > 1)
    v28 = 1;
  if ((v28 & 1) == 0)
  {
    -[UITouch _setResponder:](self->_touch, "_setResponder:", v64);
    -[NSMutableSet removeAllObjects](self->_exitingGestureRecognizers, "removeAllObjects");
    v29 = (void *)objc_opt_new();
    v30 = objc_msgSend(v6, "_isPointerLocked");
    v73 = v29;
    v66 = v6;
    if (v64)
    {
      v31 = v30;
      v32 = v64;
      v71 = v30;
      do
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __60___UIHoverTouchDeliveryTable_updateForEvent_forcingHitTest___block_invoke;
        aBlock[3] = &unk_1E16DEF38;
        v99 = v31;
        v96 = v29;
        v97 = self;
        v33 = v6;
        v98 = v33;
        v34 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
        v91 = 0u;
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        location = v32;
        objc_msgSend(v32, "gestureRecognizers");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v92;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v92 != v38)
                objc_enumerationMutation(v35);
              v34[2](v34, *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * j));
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v91, v108, 16);
          }
          while (v37);
        }

        if (_os_feature_enabled_impl())
        {
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          -[UITabBarControllerSidebar _actualFooterContentConfiguration]((id *)v33);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v88;
            do
            {
              for (k = 0; k != v42; ++k)
              {
                if (*(_QWORD *)v88 != v43)
                  objc_enumerationMutation(v40);
                v45 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * k);
                v83 = 0u;
                v84 = 0u;
                v85 = 0u;
                v86 = 0u;
                objc_msgSend(v45, "_gestureRecognizersForEvent:", v33, v64);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
                if (v47)
                {
                  v48 = v47;
                  v49 = *(_QWORD *)v84;
                  do
                  {
                    for (m = 0; m != v48; ++m)
                    {
                      if (*(_QWORD *)v84 != v49)
                        objc_enumerationMutation(v46);
                      v34[2](v34, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m));
                    }
                    v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
                  }
                  while (v48);
                }

              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v107, 16);
            }
            while (v42);
          }

          v6 = v66;
          self = v70;
          v29 = v73;
          v31 = v71;
        }

        v32 = (id *)(id)objc_msgSend(location, "_parentGestureRecognizerContainer");
      }
      while (v32);
    }
    if (-[NSMutableSet count](self->_beginningGestureRecognizers, "count", v64))
    {
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      obj = self->_beginningGestureRecognizers;
      v69 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v105, 16);
      v51 = 0;
      if (!v69)
        goto LABEL_100;
      v68 = *(_QWORD *)v80;
      while (1)
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v80 != v68)
            objc_enumerationMutation(obj);
          v72 = v52;
          v53 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v52);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v54 = v70->_updatingGestureRecognizers;
          v55 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v75, v104, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v76;
            do
            {
              v58 = 0;
              do
              {
                if (*(_QWORD *)v76 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(id **)(*((_QWORD *)&v75 + 1) + 8 * v58);
                if (objc_msgSend(v29, "containsObject:", v59))
                {
                  if (!objc_msgSend(v59, "canBePreventedByGestureRecognizer:", v53))
                    goto LABEL_93;
                  if (v53)
                  {
                    WeakRetained = objc_loadWeakRetained((id *)(v53 + 48));
                    if (v59)
                      goto LABEL_88;
LABEL_96:
                    v61 = 0;
                  }
                  else
                  {
                    WeakRetained = 0;
                    if (!v59)
                      goto LABEL_96;
LABEL_88:
                    v61 = objc_loadWeakRetained(v59 + 6);
                  }
                  v62 = isDescendantOfContainer(WeakRetained, v61, 0);

                  v29 = v73;
                  if (!v62)
                    goto LABEL_93;
                }
                if (!v51)
                  v51 = (void *)objc_opt_new();
                objc_msgSend(v51, "addObject:", v59);
LABEL_93:
                ++v58;
              }
              while (v56 != v58);
              v63 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v75, v104, 16);
              v56 = v63;
            }
            while (v63);
          }

          v52 = v72 + 1;
        }
        while (v72 + 1 != v69);
        v69 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v105, 16);
        if (!v69)
        {
LABEL_100:

          -[NSMutableSet minusSet:](v70->_updatingGestureRecognizers, "minusSet:", v51);
          -[NSMutableSet unionSet:](v70->_exitingGestureRecognizers, "unionSet:", v51);

          v6 = v66;
          goto LABEL_102;
        }
      }
    }
    -[NSMutableSet unionSet:](self->_exitingGestureRecognizers, "unionSet:", self->_updatingGestureRecognizers);
    -[NSMutableSet minusSet:](self->_exitingGestureRecognizers, "minusSet:", v29);
    -[NSMutableSet minusSet:](self->_updatingGestureRecognizers, "minusSet:", self->_exitingGestureRecognizers);
LABEL_102:
    v17 = (void *)v65;

  }
LABEL_103:

}

- (NSSet)gestureRecognizers
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "unionSet:", self->_beginningGestureRecognizers);
  objc_msgSend(v3, "unionSet:", self->_updatingGestureRecognizers);
  objc_msgSend(v3, "unionSet:", self->_exitingGestureRecognizers);
  return (NSSet *)v3;
}

- (UITouch)touch
{
  return self->_touch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_exitingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_updatingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_beginningGestureRecognizers, 0);
}

@end
