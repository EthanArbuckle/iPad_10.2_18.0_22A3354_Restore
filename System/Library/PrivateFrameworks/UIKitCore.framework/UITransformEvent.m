@implementation UITransformEvent

- (id)_init
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITransformEvent;
  v2 = -[UIEvent _init](&v5, sel__init);
  v3 = v2;
  if (v2)
    _UITransformEventCommonInit(v2);
  return v3;
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITransformEvent;
  v4 = -[UIEvent _init](&v7, sel__init, a3, a4);
  v5 = v4;
  if (v4)
    _UITransformEventCommonInit(v4);
  return v5;
}

- (void)_reset
{
  self->_scale = 0.0;
  self->_scaleDelta = 0.0;
  self->_rotation = 0.0;
  self->_rotationDelta = 0.0;
  self->_translation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_translationMagDelta = 0.0;
  self->_scalePhase = 0;
  self->_rotationPhase = 0;
  self->_translationPhase = 0;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  BKSHIDEventPointerAttributes *v5;
  BKSHIDEventPointerAttributes *pointerAttributes;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  int v12;
  _BOOL4 v13;
  int v14;
  double v16;
  double v17;
  double v18;
  long double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  if (a3
    && (-[UITransformEvent phase](self, "phase") == 3
     || -[UITransformEvent phase](self, "phase") == 4
     || !-[UITransformEvent phase](self, "phase")))
  {
    -[UITransformEvent _reset](self, "_reset");
  }
  v30.receiver = self;
  v30.super_class = (Class)UITransformEvent;
  -[UIEvent _setHIDEvent:](&v30, sel__setHIDEvent_, a3);
  if (-[UIEvent _hidEvent](self, "_hidEvent"))
  {
    BKSHIDEventGetPointerAttributes();
    v5 = (BKSHIDEventPointerAttributes *)objc_claimAutoreleasedReturnValue();
    pointerAttributes = self->_pointerAttributes;
    self->_pointerAttributes = v5;

    _UIEventHIDUIWindowForHIDEvent();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v7, "_convertPointToSceneReferenceSpace:", _UIEventHIDConvertPointerLocation3DToWindow((uint64_t)a3, v7));
      self->_sceneReferenceLocation.x = v8;
      self->_sceneReferenceLocation.y = v9;
    }
    else
    {
      self->_sceneReferenceLocation = (CGPoint)*MEMORY[0x1E0C9D538];
    }
    v28 = 0;
    v29 = 0;
    v27 = 0;
    _UIEventHIDGetTransformEventComponents((uint64_t)a3, &v29, &v28, &v27);
    if (v29)
    {
      IOHIDEventGetDoubleValue();
      self->_scaleDelta = v10;
      self->_scale = v10 + self->_scale;
      self->_scalePhase = _UIEventHIDTransformPhaseForComponentEvent(v29);
    }
    if (v28)
    {
      IOHIDEventGetDoubleValue();
      self->_rotationDelta = v11;
      self->_rotation = v11 + self->_rotation;
      self->_rotationPhase = _UIEventHIDTransformPhaseForComponentEvent(v28);
    }
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v12 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (v26 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShouldIncludeTranslationHIDEvent))
    {
      v13 = 1;
    }
    else
    {
      do
      {
        v13 = v12 >= v26;
        if (v12 < v26)
          break;
        _UIInternalPreferenceSync(v12, &_UIInternalPreference_ShouldIncludeTranslationHIDEvent, (uint64_t)CFSTR("ShouldIncludeTranslationHIDEvent"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v26 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent;
      }
      while (v12 != _UIInternalPreference_ShouldIncludeTranslationHIDEvent);
    }
    if (byte_1ECD75E4C)
      v14 = 1;
    else
      v14 = v13;
    if (v14 == 1 && v27 != 0)
    {
      IOHIDEventGetDoubleValue();
      v17 = v16;
      IOHIDEventGetDoubleValue();
      v19 = v18;
      v20 = _UIEventHIDGetInterfaceOrientationForEvent((uint64_t)self->super._hidEvent);
      v21 = -v19;
      if (v20 == 2)
        v22 = -v19;
      else
        v22 = v19;
      if (v20 == 2)
        v23 = -v17;
      else
        v23 = v17;
      if (v20 == 3)
        v22 = v17;
      else
        v21 = v23;
      if (v20 == 4)
        v24 = -v17;
      else
        v24 = v22;
      if (v20 != 4)
        v19 = v21;
      self->_translationMagDelta = hypot(v19, v24);
      v25 = v24 + self->_translation.y;
      self->_translation.x = v19 + self->_translation.x;
      self->_translation.y = v25;
      self->_translationPhase = _UIEventHIDTransformPhaseForComponentEvent(v27);
    }

  }
}

- (int64_t)type
{
  return 14;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSMapTable *gestureRecognizersByWindow;
  void *v10;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_gestureRecognizersByWindow, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (-[UITransformEvent phase](self, "phase") == 1)
  {
    -[UITransformEvent _windowServerHitTestWindow](self, "_windowServerHitTestWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UINonComponentEventHitTestGestureRecognizers(self, v8, (uint64_t)v8, self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    v10 = (void *)objc_msgSend(v7, "mutableCopy");
    -[NSMapTable setObject:forKey:](gestureRecognizersByWindow, "setObject:forKey:", v10, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_removeGestureRecognizersFromWindows
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
  -[UITransformEvent _allWindows](self, "_allWindows", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable removeObjectForKey:](self->_gestureRecognizersByWindow, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UITransformEvent _allWindows](self, "_allWindows", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[NSMapTable objectForKey:](self->_gestureRecognizersByWindow, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObject:", v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  objc_msgSend(a3, "_componentsChanged:withEvent:", 0, self);
  return 1;
}

- (id)_allWindows
{
  void *v2;
  void *v3;

  -[UITransformEvent _windowServerHitTestWindow](self, "_windowServerHitTestWindow");
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

- (id)_windowServerHitTestWindow
{
  -[UIEvent _hidEvent](self, "_hidEvent");
  return _UIEventHIDUIWindowForHIDEvent();
}

- (int64_t)weightedDominantComponentForScaleWeight:(double)a3 rotationWeight:(double)a4 translationWeight:(double)a5
{
  double scaleDelta;
  double rotationDelta;
  double translationMagDelta;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t result;
  double v15;
  double v16;

  scaleDelta = self->_scaleDelta;
  rotationDelta = self->_rotationDelta;
  translationMagDelta = self->_translationMagDelta;
  if (translationMagDelta < 0.0)
    translationMagDelta = -translationMagDelta;
  v8 = translationMagDelta * a5;
  if (scaleDelta < 0.0)
    scaleDelta = -scaleDelta;
  v9 = scaleDelta * a3;
  v10 = -rotationDelta;
  if (rotationDelta >= 0.0)
    v10 = self->_rotationDelta;
  v11 = v10 * a4;
  v12 = 1.0;
  if (v9 <= 0.0)
    v13 = 1.0;
  else
    v13 = v9;
  if (v9 != 0.0 && v8 / v13 <= 1.4)
    goto LABEL_16;
  if (v11 > 0.0)
    v12 = v11;
  result = 3;
  if (v11 != 0.0 && v8 / v12 <= 1.4)
  {
LABEL_16:
    v15 = 1.0;
    if (v8 <= 0.0)
      v16 = 1.0;
    else
      v16 = v8;
    if (v8 != 0.0 && v9 / v16 <= 1.4)
      goto LABEL_26;
    if (v11 > 0.0)
      v15 = v11;
    result = 1;
    if (v11 != 0.0 && v9 / v15 <= 1.4)
    {
LABEL_26:
      if (v8 == 0.0 || v11 / v16 > 1.4)
      {
        if (v11 / v13 > 1.4 || v9 == 0.0)
          return 2;
        else
          return 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UITransformEvent _allWindows](self, "_allWindows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "_convertPointFromSceneReferenceSpace:", self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGAffineTransform)transform
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  double rotation;
  __int128 v9;
  __int128 v10;
  CGFloat x;
  __int128 v12;
  CGAffineTransform *result;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[UITransformEvent scale](self, "scale");
  v6 = v5;
  -[UITransformEvent scale](self, "scale");
  CGAffineTransformMakeScale(retstr, v6, v7);
  rotation = self->_rotation;
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v9;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v16, &v15, rotation);
  v10 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  x = self->_translation.x;
  *(CGFloat *)&v10 = self->_translation.y;
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v16, &v15, x, *(CGFloat *)&v10);
  v14 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  return result;
}

- (double)scale
{
  double scale;

  scale = self->_scale;
  if (scale < 0.0)
    scale = 1.0 / (pow(-scale, 1.1) * 1.9 + 1.0) + -1.0;
  return scale + 1.0;
}

- (unint64_t)phase
{
  return _UIEventHIDTransformPhaseForComponentPhases(self->_scalePhase, self->_rotationPhase, self->_translationPhase);
}

- (double)rotation
{
  return self->_rotation;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerAttributes, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersByWindow, 0);
}

@end
