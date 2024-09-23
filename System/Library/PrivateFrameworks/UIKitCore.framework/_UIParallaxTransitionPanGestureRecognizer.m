@implementation _UIParallaxTransitionPanGestureRecognizer

- (_UIParallaxTransitionPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIParallaxTransitionPanGestureRecognizer *v4;
  _UIParallaxTransitionPanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
  v4 = -[UIScreenEdgePanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v4, "setMaximumNumberOfTouches:", 1);
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v5, "_setRequiresSystemGesturesToFail:", 1);
    -[UIScreenEdgePanGestureRecognizer _setRecognizesWithoutEdge:](v5, "_setRecognizesWithoutEdge:", _isContentBackSwipeEnabled());
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v5, "setAllowedScrollTypesMask:", 2);
  }
  return v5;
}

- (void)reset
{
  objc_super v3;

  -[UIScreenEdgePanGestureRecognizer _resetHystersis](self, "_resetHystersis");
  v3.receiver = self;
  v3.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer reset](&v3, sel_reset);
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 16;
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  int v15;
  int v16;
  BOOL v17;
  _BOOL4 v18;
  BOOL v19;
  objc_super v21;

  v4 = a3;
  if (!objc_msgSend(v4, "type")
    && -[UIScreenEdgePanGestureRecognizer _rootFeatureState](self, "_rootFeatureState") != 2)
  {
    -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self, "_setHysteresis:", 15.0);
    v21.receiver = self;
    v21.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
    v17 = -[UIScreenEdgePanGestureRecognizer _shouldTryToBeginWithEvent:](&v21, sel__shouldTryToBeginWithEvent_, v4);
    goto LABEL_32;
  }
  if (objc_msgSend(v4, "type") == 10)
    v5 = 50.0;
  else
    v5 = 30.0;
  -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self, "_setHysteresis:", v5);
  -[UIGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer translationInView:](self, "translationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = -v8;
  if (v8 >= 0.0)
    v11 = v8;
  v12 = (v5 + -10.0) / 25.0 * v11 + 10.0;
  if (v12 > 25.0)
    v12 = 25.0;
  v13 = -v10;
  if (v10 >= 0.0)
    v13 = v10;
  if (v13 >= v12)
  {
LABEL_29:
    -[UIGestureRecognizer setState:](self, "setState:", 5);
LABEL_30:
    v17 = 0;
    goto LABEL_32;
  }
  v14 = -[UIScreenEdgePanGestureRecognizer edges](self, "edges");
  v15 = (v8 >= v5) & (v14 >> 1);
  if ((v14 & 8) != 0)
    v16 = (v8 >= v5) & (v14 >> 1);
  else
    v16 = 1;
  if (!v16)
    LOBYTE(v15) = v8 <= -v5;
  if ((v15 & 1) == 0)
  {
    v18 = (v14 & 8) == 0 && v8 <= -v5;
    v19 = (v14 & 2) != 0 || v8 < v5;
    if (v19 && !v18)
      goto LABEL_30;
    goto LABEL_29;
  }
  v17 = 1;
LABEL_32:

  return v17;
}

- (BOOL)_needsDynamicDependentRequirementForGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  objc_super v24;

  v4 = a3;
  -[UIGestureRecognizer _activeTouchesEvent](self);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    LOBYTE(v5) = -[UIScreenEdgePanGestureRecognizer _rootFeatureState](self, "_rootFeatureState") != 2;
  if (-[_UIParallaxTransitionPanGestureRecognizer _skipDynamicDependentRequirementOverride](self, "_skipDynamicDependentRequirementOverride")|| (v5 & 1) != 0|| !objc_msgSend(v4, "_isGestureType:", 8))
  {
    v24.receiver = self;
    v24.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
    LOBYTE(v7) = -[UIGestureRecognizer _needsDynamicDependentRequirementForGestureRecognizer:](&v24, sel__needsDynamicDependentRequirementForGestureRecognizer_, v4);
  }
  else
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1)
      goto LABEL_9;
    v23 = _UIInternalPreference_UINavigationBackSwipeAlternate;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UINavigationBackSwipeAlternate)
      goto LABEL_9;
    while (v6 >= v23)
    {
      _UIInternalPreferenceSync(v6, &_UIInternalPreference_UINavigationBackSwipeAlternate, (uint64_t)CFSTR("UINavigationBackSwipeAlternate"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      LODWORD(v7) = 0;
      v23 = _UIInternalPreference_UINavigationBackSwipeAlternate;
      if (v6 == _UIInternalPreference_UINavigationBackSwipeAlternate)
        goto LABEL_10;
    }
    if (!byte_1EDDA7F1C)
LABEL_9:
      LODWORD(v7) = 0;
    else
      v7 = ((unint64_t)-[UIGestureRecognizer modifierFlags](self, "modifierFlags") >> 19) & 1;
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isDecelerating") & 1) != 0 || (objc_msgSend(v10, "_isBouncing") & 1) != 0)
        {
          LOBYTE(v7) = 0;
        }
        else
        {
          v16 = -[UIScreenEdgePanGestureRecognizer edges](self, "edges");
          if (!objc_msgSend(v10, "_canScrollX")
            || (v16 & 2) != 0
            && (objc_msgSend(v10, "contentOffset"), v18 = v17, objc_msgSend(v10, "_minimumContentOffset"), v18 <= v19)
            || (v16 & 8) != 0
            && (objc_msgSend(v10, "contentOffset"), v21 = v20, objc_msgSend(v10, "_maximumContentOffset"), v21 >= v22))
          {
            LOBYTE(v7) = 1;
          }
        }
        goto LABEL_30;
      }
    }
    if ((_DWORD)v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (_UISheetInteractionGestureIsForInteractiveDismiss(v4) & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.UIKit.UIWindowDraggingPan"));

      if (v13)
      {
        -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        LOBYTE(v7) = objc_opt_isKindOfClass();

LABEL_30:
        goto LABEL_16;
      }
      LOBYTE(v7) = 0;
    }
  }
LABEL_16:

  return v7 & 1;
}

- (BOOL)_skipDynamicDependentRequirementOverride
{
  return self->__skipDynamicDependentRequirementOverride;
}

- (void)set_skipDynamicDependentRequirementOverride:(BOOL)a3
{
  self->__skipDynamicDependentRequirementOverride = a3;
}

@end
