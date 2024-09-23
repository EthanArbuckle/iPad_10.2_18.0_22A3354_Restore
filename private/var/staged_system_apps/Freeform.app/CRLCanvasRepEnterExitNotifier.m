@implementation CRLCanvasRepEnterExitNotifier

- (CRLCanvasRepEnterExitNotifier)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLCanvasRepEnterExitNotifier *v5;
  CRLCanvasRepEnterExitNotifier *v6;
  NSMutableSet *v7;
  NSMutableSet *currentlyHitReps;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLCanvasRepEnterExitNotifier;
  v5 = -[CRLCanvasRepEnterExitNotifier init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentlyHitReps = v6->_currentlyHitReps;
    v6->_currentlyHitReps = v7;

  }
  return v6;
}

- (void)cursorEnteredAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredKnobsAtPoint:withPlatformObject:](self, "p_updateEnteredKnobsAtPoint:withPlatformObject:", v7, x, y);
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredRepsAtPoint:withPlatformObject:](self, "p_updateEnteredRepsAtPoint:withPlatformObject:", v7, x, y);

}

- (void)updateEnteredExitedRepStateAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v7;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredKnobsAtPoint:withPlatformObject:](self, "p_updateEnteredKnobsAtPoint:withPlatformObject:", v7, x, y);
  -[CRLCanvasRepEnterExitNotifier p_updateEnteredRepsAtPoint:withPlatformObject:](self, "p_updateEnteredRepsAtPoint:withPlatformObject:", v7, x, y);

}

- (void)cursorExitedAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v7;
  CRLCanvasKnob *overKnob;
  NSMutableSet *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  self->_currentlyExiting = 1;
  -[CRLCanvasKnob cursorExitedKnobAtPoint:withPlatformObject:](self->_overKnob, "cursorExitedKnobAtPoint:withPlatformObject:", v7, x, y);
  overKnob = self->_overKnob;
  self->_overKnob = 0;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_currentlyHitReps;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "cursorExitedAtPoint:withPlatformObject:", v7, x, y, (_QWORD)v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[NSMutableSet removeAllObjects](self->_currentlyHitReps, "removeAllObjects");
  self->_currentlyExiting = 0;

}

- (void)p_updateEnteredKnobsAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  CRLCanvasKnob *v9;
  id v10;
  CRLCanvasKnob *v11;
  CRLCanvasKnob **p_overKnob;
  CRLCanvasKnob *overKnob;
  id v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_currentlyExiting)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v14 = 0;
    v9 = (CRLCanvasKnob *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hitKnobAtPoint:inputType:returningRep:", 0, &v14, x, y));
    v10 = v14;

    overKnob = self->_overKnob;
    p_overKnob = &self->_overKnob;
    v11 = overKnob;
    if (v9 == overKnob)
    {
      -[CRLCanvasKnob cursorMovedAtPoint:withPlatformObject:](v9, "cursorMovedAtPoint:withPlatformObject:", v7, x, y);
      goto LABEL_10;
    }
    if (v9 && v11)
    {
      if (-[CRLCanvasKnob transferCursorInsideStateIfDesiredFromKnob:](v9, "transferCursorInsideStateIfDesiredFromKnob:"))
      {
LABEL_8:
        objc_storeStrong((id *)p_overKnob, v9);
LABEL_10:

        goto LABEL_11;
      }
      v11 = *p_overKnob;
    }
    -[CRLCanvasKnob cursorExitedKnobAtPoint:withPlatformObject:](v11, "cursorExitedKnobAtPoint:withPlatformObject:", v7, x, y);
    -[CRLCanvasKnob cursorEnteredKnobAtPoint:withPlatformObject:](v9, "cursorEnteredKnobAtPoint:withPlatformObject:", v7, x, y);
    goto LABEL_8;
  }
LABEL_11:

}

- (void)p_updateEnteredRepsAtPoint:(CGPoint)a3 withPlatformObject:(id)a4
{
  double y;
  double x;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableSet *currentlyHitReps;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_currentlyExiting)
  {
    v8 = self->_currentlyHitReps;
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentlyHitReps = self->_currentlyHitReps;
    self->_currentlyHitReps = v9;

    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hitRep:withPrecision:", 1, x, y));

    v13 = v12;
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      do
      {
        -[NSMutableSet addObject:](self->_currentlyHitReps, "addObject:", v15);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parentRep"));

        v15 = (void *)v16;
      }
      while (v16);
    }
    v17 = -[NSMutableSet mutableCopy](v8, "mutableCopy");
    objc_msgSend(v17, "minusSet:", self->_currentlyHitReps);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v22), "cursorExitedAtPoint:withPlatformObject:", v7, x, y);
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v20);
    }

    v23 = -[NSMutableSet mutableCopy](self->_currentlyHitReps, "mutableCopy");
    objc_msgSend(v23, "minusSet:", v8);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v28), "cursorEnteredAtPoint:withPlatformObject:", v7, x, y);
          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v26);
    }

    if (v14)
    {
      if (-[NSMutableSet containsObject:](v8, "containsObject:", v14))
        objc_msgSend(v14, "cursorMovedAtPoint:withPlatformObject:", v7, x, y);
      v29 = -[NSMutableSet mutableCopy](self->_currentlyHitReps, "mutableCopy");
      objc_msgSend(v29, "removeObject:", v14);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v36;
        do
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v36 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v34), "cursorMovedAtPoint:withPlatformObject:", v7, x, y, (_QWORD)v35);
            v34 = (char *)v34 + 1;
          }
          while (v32 != v34);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        }
        while (v32);
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overKnob, 0);
  objc_storeStrong((id *)&self->_currentlyHitReps, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
