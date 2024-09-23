@implementation UIWebTouchEventsGestureRecognizer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    do
      _incrementingTouchIdentifier = arc4random();
    while ((_incrementingTouchIdentifier + 1) < 2);
  }
}

- (UIWebTouchEventsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 touchDelegate:(id)a5
{
  id v8;
  id v9;
  UIWebTouchEventsGestureRecognizer *v10;
  UIWebTouchEventsGestureRecognizer *v11;
  uint64_t v12;
  NSMapTable *activeTouchesByIdentifier;
  UIWebTouchEventsGestureRecognizer *v14;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)UIWebTouchEventsGestureRecognizer;
  v10 = -[UIGestureRecognizer initWithTarget:action:](&v16, sel_initWithTarget_action_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_touchTarget, v8);
    v11->_touchAction = a4;
    objc_storeWeak((id *)&v11->_webTouchDelegate, v9);
    v11->_wasExplicitlyCancelled = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    activeTouchesByIdentifier = v11->_activeTouchesByIdentifier;
    v11->_activeTouchesByIdentifier = (NSMapTable *)v12;

    v11->_lastTouchEvent.touchPoints = 0;
    v11->_lastTouchEvent.touchPointCount = 0;
    -[UIWebTouchEventsGestureRecognizer reset](v11, "reset");
    v14 = v11;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_lastTouchEvent.touchPoints);
  v3.receiver = self;
  v3.super_class = (Class)UIWebTouchEventsGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  CGPoint v2;

  self->_passedHitTest = 0;
  self->_defaultPrevented = 0;
  self->_dispatchingTouchEvents = 0;
  self->_wasExplicitlyCancelled = 0;
  self->_originalGestureDistance = NAN;
  self->_originalGestureAngle = NAN;
  self->_isPotentialTap = 0;
  self->_lastTouchEvent.type = 0;
  self->_lastTouchEvent.timestamp = 0.0;
  v2 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_lastTouchEvent.locationInScreenCoordinates = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_lastTouchEvent.locationInDocumentCoordinates = v2;
  *(int64x2_t *)&self->_lastTouchEvent.scale = vdupq_n_s64(0x7FF8000000000000uLL);
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  self->_lastTouchEvent.isPotentialTap = 0;
}

- (void)cancel
{
  UIGestureRecognizerState v3;
  uint64_t v4;

  if (self && (*(_QWORD *)&self->super._gestureFlags & 0x200000000) != 0)
  {
    self->_wasExplicitlyCancelled = 0;
    v3 = -[UIGestureRecognizer state](self, "state");
    if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
    {
      v4 = qword_186685B00[v3];
      self->_wasExplicitlyCancelled = 1;
      -[UIGestureRecognizer setState:](self, "setState:", v4);
    }
  }
}

- (void)_updateTapStateWithTouches:(id)a3
{
  unsigned __int16 *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v4 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (v4[118] >> 1) & 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  self->_lastTouchEvent.isPotentialTap = v5;
  self->_isPotentialTap = v5;

}

- (void)_updateTapStateWithTouches:(id)a3 type:(int)a4
{
  id v6;
  id v7;

  v6 = a3;
  switch(a4)
  {
    case 0:
      goto LABEL_3;
    case 1:
    case 2:
      if (self->_isPotentialTap)
      {
LABEL_3:
        v7 = v6;
        -[UIWebTouchEventsGestureRecognizer _updateTapStateWithTouches:](self, "_updateTapStateWithTouches:", v6);
        v6 = v7;
      }
      break;
    case 3:
      self->_lastTouchEvent.isPotentialTap = 0;
      self->_isPotentialTap = 0;
      break;
    default:
      break;
  }

}

- (void)_recordTouches:(id)a3 type:(int)a4
{
  id v6;
  _UIWebTouchEvent *p_lastTouchEvent;
  double *v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CFTimeInterval v15;
  double v16;
  id v17;
  uint64_t v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  int v28;
  int v29;
  _UIWebTouchEvent *v30;
  _UIWebTouchPoint *touchPoints;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  _DWORD *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  unint64_t v63;
  double v64;
  int v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  float v77;
  float v78;
  float v79;
  float v80;
  unint64_t v81;
  uint64_t v82;
  id obj;
  double v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_lastTouchEvent = &self->_lastTouchEvent;
  v86 = a4;
  self->_lastTouchEvent.type = a4;
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  v8 = (double *)MEMORY[0x1E0C9D538];
  self->_dispatchingTouchEvents = 1;
  v9 = objc_msgSend(v6, "count");
  v10 = v9;
  if (v9 != self->_lastTouchEvent.touchPointCount)
  {
    self->_lastTouchEvent.touchPointCount = v9;
    self->_lastTouchEvent.touchPoints = (_UIWebTouchPoint *)reallocf(self->_lastTouchEvent.touchPoints, 88 * v9);
  }
  v12 = *v8;
  v11 = v8[1];
  objc_msgSend(v6, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = CACurrentMediaTime() - v14;
  v16 = *MEMORY[0x1E0C9ADF8];
  self->_lastTouchEvent.timestamp = v16 + CFAbsoluteTimeGetCurrent() - v15;

  -[NSMapTable removeAllObjects](self->_activeTouchesByIdentifier, "removeAllObjects");
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v17 = v6;
  v87 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
  if (!v87)
  {

    v23 = v12;
    v22 = v11;
    v21 = v11;
    v20 = v12;
    v75 = v11;
    v76 = v12;
    goto LABEL_53;
  }
  v18 = 0;
  v19 = 0;
  v81 = v10;
  v85 = *(_QWORD *)v97;
  v90 = v12;
  v91 = v11;
  v20 = v12;
  v21 = v11;
  v92 = v12;
  v93 = v11;
  v22 = v11;
  v23 = v12;
  v94 = v12;
  v95 = v11;
  obj = v17;
  do
  {
    v24 = 0;
    v82 = v18;
    v25 = 88 * v18 + 80;
    do
    {
      if (*(_QWORD *)v97 != v85)
        objc_enumerationMutation(obj);
      v26 = *(_QWORD **)(*((_QWORD *)&v96 + 1) + 8 * v24);
      objc_getAssociatedObject(v26, &_associatedTouchIdentifierKey);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "_isPointerTouch");
      v88 = v20;
      v89 = v21;
      if (v86 || !v28)
      {
        if (v27)
          goto LABEL_16;
      }
      else
      {

      }
      if (_incrementingTouchIdentifier == -2)
        v29 = 1;
      else
        v29 = _incrementingTouchIdentifier + 1;
      _incrementingTouchIdentifier = v29;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v26, &_associatedTouchIdentifierKey, v27, (void *)1);
LABEL_16:
      -[NSMapTable setObject:forKey:](self->_activeTouchesByIdentifier, "setObject:forKey:", v26, v27);
      v30 = p_lastTouchEvent;
      touchPoints = p_lastTouchEvent->touchPoints;
      v32 = (double *)((char *)touchPoints + v25);
      objc_msgSend(v26, "locationInView:", 0);
      v34 = v33;
      v36 = v35;
      *(v32 - 10) = v33;
      *(v32 - 9) = v35;
      -[UIGestureRecognizer view](self, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "convertPoint:fromView:", 0, v34, v36);
      v39 = v38;
      v41 = v40;

      *(v32 - 8) = v39;
      *(v32 - 7) = v41;
      *((_DWORD *)v32 - 12) = objc_msgSend(v27, "unsignedIntValue");
      *((_QWORD *)v32 - 5) = objc_msgSend(v26, "phase");
      objc_msgSend(v26, "majorRadius");
      *((_QWORD *)v32 - 4) = v42;
      objc_msgSend(v26, "maximumPossibleForce");
      v43 = 0.0;
      if (v44 > 0.0)
      {
        objc_msgSend(v26, "force");
        v84 = v23;
        v45 = v22;
        v46 = v12;
        v47 = v11;
        v49 = v48;
        objc_msgSend(v26, "maximumPossibleForce");
        v43 = v49 / v50;
        v11 = v47;
        v12 = v46;
        v22 = v45;
        v23 = v84;
      }
      *(v32 - 3) = v43;
      if (objc_msgSend(v26, "type") == 2)
      {
        *(_DWORD *)((char *)touchPoints + v25) = 1;
        objc_msgSend(v26, "altitudeAngle");
        *(_QWORD *)((char *)touchPoints + v25 - 16) = v51;
        if (v26)
        {
          v52 = v26[47];
          goto LABEL_23;
        }
      }
      else
      {
        v53 = (_DWORD *)((char *)touchPoints + v25);
        *v53 = 0;
        *((_QWORD *)v53 - 2) = 0;
      }
      v52 = 0;
LABEL_23:
      p_lastTouchEvent = v30;
      v55 = v94;
      v54 = v95;
      v57 = v90;
      v56 = v91;
      v59 = v92;
      v58 = v93;
      v60 = v92 + v34;
      v61 = v93 + v36;
      *(_QWORD *)((char *)touchPoints + v25 - 8) = v52;
      if (v19 == 1)
        v62 = v41;
      else
        v62 = v22;
      v63 = *((_QWORD *)v32 - 5) - 3;
      if (v19 == 1)
        v64 = v39;
      else
        v64 = v23;
      if (v19)
        v65 = v19 + 1;
      else
        v65 = 1;
      if (v19)
      {
        v66 = v95;
      }
      else
      {
        v62 = v22;
        v64 = v23;
        v66 = v41;
      }
      if (v19)
        v67 = v94;
      else
        v67 = v39;
      v68 = v90 + v34;
      v69 = v91 + v36;
      v20 = v88;
      v21 = v89;
      if (v63 <= 1)
      {
        v57 = v68;
        v56 = v69;
      }
      v90 = v57;
      v91 = v56;
      if (v63 > 1)
      {
        v11 = v11 + v41;
        v12 = v12 + v39;
      }
      else
      {
        v20 = v88 + v39;
        v21 = v89 + v41;
      }
      if (v63 > 1)
      {
        v58 = v61;
        v59 = v60;
      }
      v92 = v59;
      v93 = v58;
      if (v63 > 1)
      {
        v19 = v65;
        v22 = v62;
        v23 = v64;
        v54 = v66;
        v55 = v67;
      }
      v94 = v55;
      v95 = v54;

      ++v24;
      v25 += 88;
    }
    while (v87 != v24);
    v17 = obj;
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v100, 16);
    v18 = v82 + v24;
    v87 = v70;
  }
  while (v70);

  if (v19)
  {
    v71 = v92 / (double)v19;
    v72 = v93 / (double)v19;
    v73 = v12 / (double)v19;
    v74 = v11 / (double)v19;
    v12 = v94;
    v11 = v95;
    goto LABEL_54;
  }
  v10 = v81;
  v12 = v94;
  v11 = v95;
  v76 = v90;
  v75 = v91;
LABEL_53:
  v19 = 0;
  v71 = v76 / (double)v10;
  v72 = v75 / (double)v10;
  v73 = v20 / (double)v10;
  v74 = v21 / (double)v10;
LABEL_54:
  p_lastTouchEvent->scale = 0.0;
  p_lastTouchEvent->locationInScreenCoordinates.x = v71;
  p_lastTouchEvent->locationInScreenCoordinates.y = v72;
  p_lastTouchEvent->locationInDocumentCoordinates.x = v73;
  p_lastTouchEvent->locationInDocumentCoordinates.y = v74;
  p_lastTouchEvent->rotation = 0.0;
  if (v19 >= 2)
  {
    v77 = (v23 - v12) * (v23 - v12) + (v22 - v11) * (v22 - v11);
    p_lastTouchEvent->scale = sqrtf(v77) / self->_originalGestureDistance;
    v78 = v23 - v12;
    v79 = v22 - v11;
    v80 = atan2f(v78, v79) * 180.0 * 0.318309886;
    p_lastTouchEvent->rotation = self->_originalGestureAngle - v80;
    p_lastTouchEvent->inJavaScriptGesture = 1;
  }
  -[UIWebTouchEventsGestureRecognizer _updateTapStateWithTouches:type:](self, "_updateTapStateWithTouches:type:", v17, v86);

}

- (void)performAction
{
  const char *touchAction;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_touchTarget);
  touchAction = self->_touchAction;
  if (dyld_program_sdk_at_least())
    objc_msgSend(WeakRetained, touchAction, self);
  else
    objc_msgSend(WeakRetained, sel_performSelector_withObject_, touchAction, self);

}

- (void)_processTouches:(id)a3 withEvent:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = *(_QWORD *)&a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v15, "phase") != 2)
        {
          v16 = objc_msgSend(v15, "phase");
          if ((uint64_t)v12 <= v16)
            v12 = v16;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
    if (v12 > 4)
      v17 = 1;
    else
      v17 = dword_186685B18[v12];
  }
  else
  {
    v17 = 0;
  }
  if (v17 == (_DWORD)v5)
  {
    -[UIWebTouchEventsGestureRecognizer _recordTouches:type:](self, "_recordTouches:type:", v8, v5);
    -[UIWebTouchEventsGestureRecognizer performAction](self, "performAction");
    if (self->_defaultPrevented)
    {
      if (-[UIGestureRecognizer state](self, "state"))
        v18 = 2;
      else
        v18 = 1;
      -[UIGestureRecognizer setState:](self, "setState:", v18);
    }
    if (v5 >= 2)
    {
      -[UIGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
        {
          v21 = 5;
          goto LABEL_29;
        }
        if ((_DWORD)v5 == 2)
        {
          v21 = 3;
          goto LABEL_29;
        }
        if ((_DWORD)v5 == 3)
        {
          v21 = 4;
LABEL_29:
          -[UIGestureRecognizer setState:](self, "setState:", v21);
        }
      }
    }
  }

}

- (void)_resetGestureRecognizer
{
  uint64_t touchPointCount;
  _QWORD *v4;
  objc_super v5;

  if (self->_wasExplicitlyCancelled && self->_lastTouchEvent.type <= 1u)
  {
    self->_lastTouchEvent.type = 3;
    touchPointCount = self->_lastTouchEvent.touchPointCount;
    if ((_DWORD)touchPointCount)
    {
      v4 = (_QWORD *)((char *)self->_lastTouchEvent.touchPoints + 40);
      do
      {
        *v4 = 4;
        v4 += 11;
        --touchPointCount;
      }
      while (touchPointCount);
    }
    -[UIWebTouchEventsGestureRecognizer performAction](self, "performAction");
  }
  self->_wasExplicitlyCancelled = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIWebTouchEventsGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v5, sel__resetGestureRecognizer);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "touchesForGestureRecognizer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_webTouchDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(WeakRetained, "shouldIgnoreWebTouch"))
    goto LABEL_9;
  if (!self->_passedHitTest)
  {
    if (((objc_opt_respondsToSelector() & 1) == 0
       || (objc_msgSend(WeakRetained, "gestureRecognizer:shouldIgnoreWebTouchWithEvent:", self, v7) & 1) == 0)
      && (objc_msgSend(WeakRetained, "isAnyTouchOverActiveArea:", v5) & 1) != 0)
    {
      self->_passedHitTest = 1;
      goto LABEL_4;
    }
LABEL_9:
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_10;
  }
LABEL_4:
  -[UIWebTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", v5, v7, 0);
LABEL_10:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "touchesForGestureRecognizer:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWebTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", v6, v5, 1);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "touchesForGestureRecognizer:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWebTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", v6, v5, 2);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "touchesForGestureRecognizer:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIWebTouchEventsGestureRecognizer _processTouches:withEvent:type:](self, "_processTouches:withEvent:type:", v6, v5, 3);

}

- (const)lastTouchEvent
{
  return &self->_lastTouchEvent;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (int)type
{
  return self->_lastTouchEvent.type;
}

- (CGPoint)locationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchEvent.locationInDocumentCoordinates.x;
  y = self->_lastTouchEvent.locationInDocumentCoordinates.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSMutableArray)touchLocations
{
  _UIWebTouchEvent *p_lastTouchEvent;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  p_lastTouchEvent = &self->_lastTouchEvent;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_lastTouchEvent.touchPointCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (p_lastTouchEvent->touchPointCount)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", *(double *)((char *)p_lastTouchEvent->touchPoints + v4 + 16), *(double *)((char *)p_lastTouchEvent->touchPoints + v4 + 24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v5;
      v4 += 88;
    }
    while (v5 < p_lastTouchEvent->touchPointCount);
  }
  return (NSMutableArray *)v3;
}

- (NSMutableArray)touchIdentifiers
{
  _UIWebTouchEvent *p_lastTouchEvent;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  p_lastTouchEvent = &self->_lastTouchEvent;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_lastTouchEvent.touchPointCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (p_lastTouchEvent->touchPointCount)
  {
    v4 = 0;
    v5 = 32;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)p_lastTouchEvent->touchPoints + v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
      v5 += 88;
    }
    while (v4 < p_lastTouchEvent->touchPointCount);
  }
  return (NSMutableArray *)v3;
}

- (NSMutableArray)touchPhases
{
  _UIWebTouchEvent *p_lastTouchEvent;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  p_lastTouchEvent = &self->_lastTouchEvent;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_lastTouchEvent.touchPointCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (p_lastTouchEvent->touchPointCount)
  {
    v4 = 0;
    v5 = 40;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)p_lastTouchEvent->touchPoints + v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
      v5 += 88;
    }
    while (v4 < p_lastTouchEvent->touchPointCount);
  }
  return (NSMutableArray *)v3;
}

- (BOOL)inJavaScriptGesture
{
  return self->_lastTouchEvent.inJavaScriptGesture;
}

- (double)scale
{
  return self->_lastTouchEvent.scale;
}

- (double)rotation
{
  return self->_lastTouchEvent.rotation;
}

- (BOOL)isDefaultPrevented
{
  return self->_defaultPrevented;
}

- (void)setDefaultPrevented:(BOOL)a3
{
  self->_defaultPrevented = a3;
}

- (BOOL)isDispatchingTouchEvents
{
  return self->_dispatchingTouchEvents;
}

- (NSMapTable)activeTouchesByIdentifier
{
  return self->_activeTouchesByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouchesByIdentifier, 0);
  objc_destroyWeak((id *)&self->_webTouchDelegate);
  objc_destroyWeak(&self->_touchTarget);
}

@end
