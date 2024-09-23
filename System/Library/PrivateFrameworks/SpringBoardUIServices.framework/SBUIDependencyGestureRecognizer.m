@implementation SBUIDependencyGestureRecognizer

- (NSSet)observedControlClasses
{
  NSSet *observedControlClasses;
  NSSet *v4;
  NSSet *v5;

  observedControlClasses = self->_observedControlClasses;
  if (!observedControlClasses)
  {
    v4 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v5 = self->_observedControlClasses;
    self->_observedControlClasses = v4;

    observedControlClasses = self->_observedControlClasses;
  }
  return observedControlClasses;
}

- (void)setObservedControlClasses:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_observedControlClasses, a3);
    if (-[SBUIDependencyGestureRecognizer isEnabled](self, "isEnabled"))
    {
      -[SBUIDependencyGestureRecognizer setEnabled:](self, "setEnabled:", 0);
      -[SBUIDependencyGestureRecognizer setEnabled:](self, "setEnabled:", 1);
    }
  }

}

- (SBUIDependencyGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBUIDependencyGestureRecognizer *v4;
  SBUIDependencyGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIDependencyGestureRecognizer;
  v4 = -[SBUIDependencyGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SBUIDependencyGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[SBUIDependencyGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    v5->_hysteresis = 9.0;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  CGFloat v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBUIDependencyGestureRecognizer;
  v6 = a3;
  -[SBUIDependencyGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, a4);
  v7 = _CentroidOfTouches(v6);
  v9 = v8;

  self->_initialSceneReferenceLocation.x = v7;
  self->_initialSceneReferenceLocation.y = v9;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SBUIDependencyGestureRecognizer;
  -[SBUIDependencyGestureRecognizer touchesMoved:withEvent:](&v34, sel_touchesMoved_withEvent_, v6, v7);
  if (!-[SBUIDependencyGestureRecognizer state](self, "state")
    && -[SBUIDependencyGestureRecognizer _didExceedHysteresisWithTouches:](self, "_didExceedHysteresisWithTouches:", v6))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      v24 = *(_QWORD *)v31;
      while (2)
      {
        v12 = 0;
        v25 = v10;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12), "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0
            && (objc_msgSend(v13, "sbui_wantsPriorityOverTargetOfDependencyGestureRecognizer:", self) & 1) != 0)
          {
LABEL_27:

            v23 = 3;
            goto LABEL_29;
          }
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          -[SBUIDependencyGestureRecognizer observedControlClasses](self, "observedControlClasses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v27;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v27 != v17)
                  objc_enumerationMutation(v14);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {

                  goto LABEL_27;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
              if (v16)
                continue;
              break;
            }
          }

          v19 = objc_opt_class();
          v20 = v13;
          if (v19)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v21 = v20;
            else
              v21 = 0;
          }
          else
          {
            v21 = 0;
          }
          v11 = v24;
          v22 = v21;

          objc_msgSend(v22, "cancelTrackingWithEvent:", v7);
          ++v12;
        }
        while (v12 != v25);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        v23 = 5;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v23 = 5;
    }
LABEL_29:

    -[SBUIDependencyGestureRecognizer setState:](self, "setState:", v23);
  }

}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[SBUIDependencyGestureRecognizer view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
    x = v13;
    y = v14;
  }
  objc_msgSend(v9, "convertPoint:fromView:", 0, x, y);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (BOOL)_didExceedHysteresisWithTouches:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double hysteresis;
  BOOL v18;
  double v19;
  BOOL v20;

  v4 = a3;
  -[SBUIDependencyGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, self->_initialSceneReferenceLocation.x, self->_initialSceneReferenceLocation.y);
  v7 = v6;
  v9 = v8;
  v10 = _CentroidOfTouches(v4);
  v12 = v11;

  -[SBUIDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, v10, v12);
  v14 = v13 - v7;
  v16 = v15 - v9;
  if (v14 < 0.0)
    v14 = -v14;
  hysteresis = self->_hysteresis;
  v18 = v14 > hysteresis;
  v19 = -v16;
  if (v16 >= 0.0)
    v19 = v16;
  v20 = v19 > hysteresis || v18;

  return v20;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedControlClasses, 0);
}

@end
