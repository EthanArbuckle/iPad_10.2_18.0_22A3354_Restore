@implementation _UIExclusiveTouchGestureRecognizer

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  unsigned int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  v5 = -[UIGestureRecognizer _shouldReceiveTouch:withEvent:](&v7, sel__shouldReceiveTouch_withEvent_, a3, a4);
  if (v5)
    LOBYTE(v5) = objc_msgSend(a3, "_isPointerTouch") ^ 1;
  return v5;
}

- (void)reset
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  -[UIGestureRecognizer reset](&v5, sel_reset);
  self->_accumulatedMovement = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_achievedMaximumAbsoluteAccumulatedMovement = 0;
  -[UIGestureRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  objc_msgSend(v3, "exclusiveTouchGestureRecognizer:achievedMaximumAbsoluteAccumulatedMovement:timestamp:", self, 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  -[UIGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  _UIExclusiveTouchGestureRecognizer *v21;
  objc_class *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  _UIExclusiveTouchGestureRecognizer *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  -[UIGestureRecognizer touchesEnded:withEvent:](&v33, sel_touchesEnded_withEvent_);
  v27 = self;
  -[UIGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(a4, "allTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
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
        if ((objc_msgSend(v13, "_isPointerTouch") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "containsObject:", v14);

          if (v15)
            objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
    }
    while (v10);
  }

  if (objc_msgSend(a3, "isEqualToSet:", v7))
  {
    -[UIGestureRecognizer setState:](v27, "setState:", 3);
  }
  else
  {
    -[UIGestureRecognizer _allActiveTouches](v27, "_allActiveTouches");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
    {
      v18 = touchesEnded_withEvent____s_category;
      if (!touchesEnded_withEvent____s_category)
      {
        v18 = __UILogCategoryGetNode("UISystemGesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&touchesEnded_withEvent____s_category);
      }
      v19 = *(id *)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (v27)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = v27;
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v23, v21);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v24 = CFSTR("(nil)");
        }
        v25 = v24;
        _UIGestureRecognizerStateString(3uLL);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        v35 = "-[_UIExclusiveTouchGestureRecognizer touchesEnded:withEvent:]";
        v36 = 2112;
        v37 = v24;
        v38 = 2112;
        v39 = v26;
        v40 = 2112;
        v41 = v6;
        v42 = 2112;
        v43 = a3;
        v44 = 2112;
        v45 = v7;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "%s: Potential error in %@: There are no active touches but the gesture has not transitioned to %@: \nallowedTouchTypes: %@; \n"
          "endingTouches: %@; \n"
          "eligibleTouches: %@",
          buf,
          0x3Eu);

      }
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  -[UIGestureRecognizer description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  NSStringFromCGPoint(self->_maximumAbsoluteAccumulatedMovement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("_maximumAbsoluteAccumulatedMovement %@\n"), v5);

  NSStringFromCGPoint(self->_accumulatedMovement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("_accumulatedMovement %@\n"), v6);

  if (self->_achievedMaximumAbsoluteAccumulatedMovement)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("_achievedMaximumAbsoluteAccumulatedMovement %@\n"), v7);
  return v4;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double y;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  -[UIGestureRecognizer touchesMoved:withEvent:](&v31, sel_touchesMoved_withEvent_, a3, a4);
  v7 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[UIGestureRecognizer view](self, "view", (_QWORD)v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "previousLocationInView:", v14);
        v16 = v15;
        v18 = v17;

        -[UIGestureRecognizer view](self, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "locationInView:", v19);
        v21 = v20;
        v23 = v22;

        v7 = v7 + vabdd_f64(v21, v16);
        v6 = v6 + vabdd_f64(v23, v18);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }

  self->_accumulatedMovement.x = self->_accumulatedMovement.x + v7 / (double)(unint64_t)objc_msgSend(v8, "count");
  v24 = self->_accumulatedMovement.y + v6 / (double)(unint64_t)objc_msgSend(v8, "count");
  self->_accumulatedMovement.y = v24;
  if (self->_maximumAbsoluteAccumulatedMovement.x > 0.0
    && self->_accumulatedMovement.x >= self->_maximumAbsoluteAccumulatedMovement.x
    || (y = self->_maximumAbsoluteAccumulatedMovement.y, y > 0.0) && v24 >= y)
  {
    if (!self->_achievedMaximumAbsoluteAccumulatedMovement)
    {
      self->_achievedMaximumAbsoluteAccumulatedMovement = 1;
      -[UIGestureRecognizer delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureRecognizer lastTouchTimestamp](self, "lastTouchTimestamp");
      objc_msgSend(v26, "exclusiveTouchGestureRecognizer:achievedMaximumAbsoluteAccumulatedMovement:timestamp:", self, 1);

    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIExclusiveTouchGestureRecognizer;
  -[UIGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 4);
}

- (CGPoint)maximumAbsoluteAccumulatedMovement
{
  double x;
  double y;
  CGPoint result;

  x = self->_maximumAbsoluteAccumulatedMovement.x;
  y = self->_maximumAbsoluteAccumulatedMovement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMaximumAbsoluteAccumulatedMovement:(CGPoint)a3
{
  self->_maximumAbsoluteAccumulatedMovement = a3;
}

- (BOOL)achievedMaximumAbsoluteAccumulatedMovement
{
  return self->_achievedMaximumAbsoluteAccumulatedMovement;
}

- (CGPoint)accumulatedMovement
{
  double x;
  double y;
  CGPoint result;

  x = self->_accumulatedMovement.x;
  y = self->_accumulatedMovement.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
