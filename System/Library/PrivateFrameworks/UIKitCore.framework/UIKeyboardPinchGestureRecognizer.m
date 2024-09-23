@implementation UIKeyboardPinchGestureRecognizer

- (UIKeyboardPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIKeyboardPinchGestureRecognizer *v4;
  uint64_t v5;
  NSMutableSet *activeTouches;
  uint64_t v7;
  NSMutableDictionary *initialTouchPoints;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardPinchGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    activeTouches = v4->_activeTouches;
    v4->_activeTouches = (NSMutableSet *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    initialTouchPoints = v4->_initialTouchPoints;
    v4->_initialTouchPoints = (NSMutableDictionary *)v7;

  }
  return v4;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSMutableDictionary *initialTouchPoints;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "timestamp");
  self->_beginPinchTimestamp = v7;
  -[NSMutableSet unionSet:](self->_activeTouches, "unionSet:", v6);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        -[UIGestureRecognizer view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "locationInView:", v13);
        v15 = v14;
        v17 = v16;

        initialTouchPoints = self->_initialTouchPoints;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v15, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "_touchIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](initialTouchPoints, "setObject:forKey:", v19, v20);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;

  objc_msgSend(a4, "timestamp", a3);
  if (v5 - self->_beginPinchTimestamp >= 0.01)
  {
    if (-[NSMutableSet count](self->_activeTouches, "count") == 2)
      -[UIKeyboardPinchGestureRecognizer interpretTouchesForSplit](self, "interpretTouchesForSplit");
    else
      -[UIGestureRecognizer setState:](self, "setState:", 4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *initialTouchPoints;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        initialTouchPoints = self->_initialTouchPoints;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "_touchIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](initialTouchPoints, "removeObjectForKey:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", v5);
  if (self->_pinchDetected && (unint64_t)-[NSMutableSet count](self->_activeTouches, "count") <= 1)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 3);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
          -[UIKeyboardPinchGestureRecognizer pinchDelegate](self, "pinchDelegate", (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pinchDidConsumeTouch:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *initialTouchPoints;
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
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        initialTouchPoints = self->_initialTouchPoints;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_touchIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](initialTouchPoints, "removeObjectForKey:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", v5);
  if (self->_pinchDetected && !-[NSMutableSet count](self->_activeTouches, "count"))
    -[UIGestureRecognizer setState:](self, "setState:", 3);

}

- (void)reset
{
  objc_super v3;

  self->_pinchDetected = 0;
  self->_beginPinchTimestamp = 0.0;
  -[UIKeyboardPinchGestureRecognizer resetPinchCalculations](self, "resetPinchCalculations");
  -[NSMutableDictionary removeAllObjects](self->_initialTouchPoints, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_activeTouches, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardPinchGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
}

- (void)resetPinchCalculations
{
  self->_initialPinchSeparation = 0.0;
  *(_OWORD *)self->_pinchSeparationValues = 0u;
  *(_OWORD *)&self->_pinchSeparationValues[2] = 0u;
}

- (void)interpretTouchesForSplit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  double v17;
  void *v18;
  void *v19;
  NSMutableDictionary *initialTouchPoints;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v37;
  uint64_t v38;
  void *v39;
  float v40;
  float v41;
  double v42;
  float v43;
  float v44;
  double v45;
  void *v46;
  char v47;
  id v48;

  if (self->_pinchDetected && -[NSMutableSet count](self->_activeTouches, "count") != 2)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    return;
  }
  if ((unint64_t)-[NSMutableSet count](self->_activeTouches, "count") >= 2
    && (unint64_t)-[NSMutableSet count](self->_activeTouches, "count") <= 2)
  {
    -[NSMutableSet allObjects](self->_activeTouches, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet allObjects](self->_activeTouches, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    -[UIGestureRecognizer view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    if (self->_pinchDetected)
      goto LABEL_8;
    initialTouchPoints = self->_initialTouchPoints;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v48, "_touchIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](initialTouchPoints, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "CGPointValue");
    v24 = v23;
    v26 = v25;

    v27 = self->_initialTouchPoints;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "_touchIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v27, "objectForKey:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "CGPointValue");
    v31 = v30;
    v33 = v32;

    v34 = v8 - v24;
    v35 = v13 - v31;
    if (v8 - v24 > 40.0 && v35 > 40.0)
      goto LABEL_28;
    v37 = v34 < -40.0;
    if (v35 >= -40.0)
      v37 = 0;
    if (fabs(v34) < 40.0 || v37 || fabs(v35) < 40.0)
      goto LABEL_28;
    -[UIGestureRecognizer delegate](self, "delegate");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
      goto LABEL_8;
    v39 = (void *)v38;
    v40 = v13 - v8;
    v41 = v15 - v10;
    v42 = hypotf(v40, v41);
    v43 = v31 - v24;
    v44 = v33 - v26;
    v45 = v42 / hypotf(v43, v44);
    -[UIKeyboardPinchGestureRecognizer pinchDelegate](self, "pinchDelegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "pinchCanBeginWithTouches:andScale:", self->_activeTouches, v45);

    if ((v47 & 1) != 0)
    {
LABEL_8:
      for (i = 0; i != 3; ++i)
        self->_pinchSeparationValues[i] = self->_pinchSeparationValues[i + 1];
      v17 = vabdd_f64(v8, v13);
      self->_pinchSeparationValues[3] = v17;
      if (!self->_pinchDetected && self->_initialPinchSeparation < 0.00000011920929)
      {
        self->_pinchDetected = 1;
        self->_initialPinchSeparation = v17;
      }
      -[UIGestureRecognizer delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[UIKeyboardPinchGestureRecognizer pinchDelegate](self, "pinchDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "didDetectPinchWithSeparation:", v17);

      }
    }
    else
    {
      -[UIGestureRecognizer setState:](self, "setState:", 5);
    }
LABEL_28:

  }
}

- (double)finalProgressForInitialProgress:(double)result
{
  double v3;
  double v4;
  int v5;
  uint64_t v6;
  double v7;
  char v8;
  int v9;
  double v10;
  double v12;

  self->_pinchDetected = 0;
  v3 = self->_pinchSeparationValues[0];
  v4 = self->_pinchSeparationValues[3];
  if (vabdd_f64(v3, v4) < 40.0)
  {
LABEL_14:
    v12 = self->_initialPinchSeparation
        + (v4 + v3 + self->_pinchSeparationValues[1] + self->_pinchSeparationValues[2]) * -0.25;
    if (v12 < -40.0)
      result = 1.0;
    if (v12 > 40.0)
      return 0.0;
    return result;
  }
  LOBYTE(v5) = 1;
  v6 = 1;
  v7 = self->_pinchSeparationValues[0];
  v8 = 1;
  LOBYTE(v9) = 1;
  do
  {
    v10 = self->_pinchSeparationValues[v6];
    v9 = v9 & (v10 >= v7);
    v5 = v5 & (v10 <= v7);
    if (v10 == 0.0 || v7 == 0.0)
      v8 = 0;
    ++v6;
    v7 = v10;
  }
  while (v6 != 4);
  if ((v8 & 1) != 0)
  {
    if (((v9 ^ v5) & 1) != 0)
    {
      result = 1.0;
      if ((v5 & 1) != 0)
        return 0.0;
      return result;
    }
    goto LABEL_14;
  }
  return result;
}

- (UIKeyboardPinchGestureRecognizerDelegate)pinchDelegate
{
  return (UIKeyboardPinchGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_pinchDelegate);
}

- (void)setPinchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pinchDelegate, a3);
}

- (BOOL)pinchDetected
{
  return self->_pinchDetected;
}

- (double)initialPinchSeparation
{
  return self->_initialPinchSeparation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pinchDelegate);
  objc_storeStrong((id *)&self->_initialTouchPoints, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end
