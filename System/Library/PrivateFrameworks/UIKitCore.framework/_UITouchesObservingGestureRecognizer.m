@implementation _UITouchesObservingGestureRecognizer

- (_UITouchesObservingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UITouchesObservingGestureRecognizer *v4;
  _UITouchesObservingGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITouchesObservingGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer _setAcceptsFailureRequiments:](v5, "_setAcceptsFailureRequiments:", 0);
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  v5 = a4;
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  -[_UITouchesObservingGestureRecognizer _updateTouchesFromEvent:](self, "_updateTouchesFromEvent:", v5);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;

  v5 = a4;
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  -[_UITouchesObservingGestureRecognizer _updateTouchesFromEvent:](self, "_updateTouchesFromEvent:", v5);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a4;
  -[_UITouchesObservingGestureRecognizer _updateTouchesFromEvent:](self, "_updateTouchesFromEvent:", v5);
  v6 = -[_UITouchesObservingGestureRecognizer _allTouchesAreEndedOrCancelled:](self, "_allTouchesAreEndedOrCancelled:", v5);

  if (v6)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a4;
  -[_UITouchesObservingGestureRecognizer _updateTouchesFromEvent:](self, "_updateTouchesFromEvent:", v5);
  v6 = -[_UITouchesObservingGestureRecognizer _allTouchesAreEndedOrCancelled:](self, "_allTouchesAreEndedOrCancelled:", v5);

  if (v6)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)reset
{
  -[_UITouchesObservingGestureRecognizer setTouches:](self, "setTouches:", 0);
}

- (BOOL)_allTouchesAreEndedOrCancelled:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
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
  objc_msgSend(a3, "touchesForGestureRecognizer:", self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "phase") != 3 && objc_msgSend(v8, "phase") != 4)
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (void)_updateTouchesFromEvent:(id)a3
{
  id v4;

  objc_msgSend(a3, "touchesForGestureRecognizer:", self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UITouchesObservingGestureRecognizer setTouches:](self, "setTouches:", v4);

}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)_wantsPartialTouchSequences
{
  return 1;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (NSSet)touches
{
  return self->_touches;
}

- (void)setTouches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
}

@end
