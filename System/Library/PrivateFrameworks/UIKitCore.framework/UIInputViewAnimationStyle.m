@implementation UIInputViewAnimationStyle

uint64_t __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048619, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removePropertyAnimators");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimators, 0);
}

BOOL __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)extraOptions
{
  return self->extraOptions;
}

- (double)duration
{
  return self->duration;
}

- (void)cancelInterruptibleAnimations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIInputViewAnimationStyle propertyAnimators](self, "propertyAnimators", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isInterruptible"))
          objc_msgSend(v8, "stopAnimation:", 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[UIInputViewAnimationStyle removePropertyAnimators](self, "removePropertyAnimators");
}

- (BOOL)dontMerge
{
  return self->_dontMerge;
}

- (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4
{
  return +[UIPeripheralHost endPlacementForInputViewSet:windowScene:](UIPeripheralHost, "endPlacementForInputViewSet:windowScene:", a3, a4);
}

+ (id)animationStyleAnimated:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setAnimated:", v5);
  objc_msgSend(v6, "setDuration:", a4);
  objc_msgSend(v6, "setExtraOptions:", 458752);
  return v6;
}

- (void)setExtraOptions:(unint64_t)a3
{
  self->extraOptions = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->animated = a3;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

+ (id)animationStyleDefault
{
  return (id)objc_msgSend(a1, "animationStyleAnimated:duration:", 1, 0.25);
}

- (void)addAnimationToCurrentAnimations:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    -[UIInputViewAnimationStyle propertyAnimators](self, "propertyAnimators");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[UIInputViewAnimationStyle setPropertyAnimators:](self, "setPropertyAnimators:", v5);

    }
    v6 = (-[UIInputViewAnimationStyle extraOptions](self, "extraOptions") >> 16) & 7;
    v7 = [UIViewPropertyAnimator alloc];
    -[UIInputViewAnimationStyle duration](self, "duration");
    v8 = -[UIViewPropertyAnimator initWithDuration:curve:animations:](v7, "initWithDuration:curve:animations:", v6, v10);
    -[UIInputViewAnimationStyle propertyAnimators](self, "propertyAnimators");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    -[UIViewPropertyAnimator startAnimation](v8, "startAnimation");
  }
  else
  {
    v10[2]();
  }

}

+ (id)animationStyleImmediate
{
  return (id)objc_msgSend(a1, "animationStyleAnimated:duration:", 0, 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAnimated:", -[UIInputViewAnimationStyle animated](self, "animated"));
  -[UIInputViewAnimationStyle duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  objc_msgSend(v4, "setExtraOptions:", -[UIInputViewAnimationStyle extraOptions](self, "extraOptions"));
  objc_msgSend(v4, "setInteractivelyCancelled:", -[UIInputViewAnimationStyle interactivelyCancelled](self, "interactivelyCancelled"));
  v4[33] = self->_isLegacy;
  return v4;
}

- (void)setInteractivelyCancelled:(BOOL)a3
{
  self->interactivelyCancelled = a3;
}

- (BOOL)interactivelyCancelled
{
  return self->interactivelyCancelled;
}

- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  _BOOL4 v7;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  void (**v25)(_QWORD);

  v7 = a7;
  v12 = (void (**)(_QWORD))a3;
  v13 = (void (**)(_QWORD))a4;
  v14 = a5;
  v15 = a6;
  if (-[UIInputViewAnimationStyle animated](self, "animated"))
  {
    v16 = -[UIInputViewAnimationStyle extraOptions](self, "extraOptions");
    v17 = 2;
    if (v7)
      v17 = 6;
    v18 = v16 | v17;
    objc_msgSend(v15, "syncToExistingAnimations");
    -[UIInputViewAnimationStyle duration](self, "duration");
    v20 = v19;
    v21 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke;
    v24[3] = &unk_1E16B1BF8;
    v25 = v12;
    v22[0] = v21;
    v22[1] = 3221225472;
    v22[2] = __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2;
    v22[3] = &unk_1E16C5E00;
    v22[4] = self;
    v23 = v14;
    +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", v18, v24, v13, v22, v20, 0.0);

  }
  else
  {
    v12[2](v12);
    if (v13)
      v13[2](v13);
    if (v14)
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    -[UIInputViewAnimationStyle removePropertyAnimators](self, "removePropertyAnimators");
  }

}

- (BOOL)animated
{
  return self->animated;
}

- (void)removePropertyAnimators
{
  id v2;

  -[UIInputViewAnimationStyle propertyAnimators](self, "propertyAnimators");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableArray)propertyAnimators
{
  return self->_propertyAnimators;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  return objc_alloc_init(UIInputViewAnimationControllerBasic);
}

- (void)setForAssertion:(BOOL)a3
{
  self->_forAssertion = a3;
}

- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4 windowScene:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke;
  v38[3] = &unk_1E16B14C0;
  v38[4] = &v39;
  +[UIKeyboardImpl performWithoutFloatingLock:](UIKeyboardImpl, "performWithoutFloatingLock:", v38);
  if (!*((_BYTE *)v40 + 24) && (objc_msgSend(v9, "showsInputViews") & 1) != 0
    || objc_msgSend(v9, "isUndocked"))
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
      || !objc_msgSend(v8, "isInputViewPlaceholder"))
    {
      goto LABEL_15;
    }
    objc_msgSend(v8, "inputView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fallbackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      objc_msgSend(v12, "associatedView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_15;
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "keyboardActive") & 1) == 0)
      {
        objc_msgSend(v8, "inputView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "placeheldView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          if ((objc_msgSend(v8, "isCustomInputView") & 1) != 0
            || (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v21, "isMinimized"),
                v21,
                v23 = 0.0,
                (v22 & 1) == 0))
          {
            +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "intersectionHeightForWindowScene:", 0);
            v23 = v25;

          }
          objc_msgSend(v8, "inputAccessoryView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v8, "inputAccessoryView");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "size");
            v23 = v23 + v28;

          }
          if ((objc_msgSend(v9, "isUndocked") & 1) == 0)
          {
            +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "updatingHeight");

            if ((v30 & 1) == 0)
            {
              +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "remoteKeyboardUndocked");

              if (!v32)
              {
                +[UIInputViewSetPlacementPlaceholder placementWithHeight:](UIInputViewSetPlacementPlaceholder, "placementWithHeight:", v23);
                v16 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
              +[UIKeyboardImpl normalizedPersistentOffset](UIKeyboardImpl, "normalizedPersistentOffset");
              if (v34 != 0.0)
              {
                +[UIInputViewSetPlacementPlaceholderUndocked placementWithHeight:undockedOffset:chromeBuffer:](UIInputViewSetPlacementPlaceholderUndocked, "placementWithHeight:undockedOffset:chromeBuffer:", v23, v33, v34, 92.0, 0.0, 0.0, 0.0);
                v16 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
            }
          }
        }
        goto LABEL_15;
      }
    }

LABEL_15:
    v16 = v9;
    goto LABEL_16;
  }
  if (*((_BYTE *)v40 + 24))
  {
    -[UIInputViewAnimationStyle endPlacementForInputViewSet:windowScene:](self, "endPlacementForInputViewSet:windowScene:", v8, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "isVisible"))
    {
      v16 = v14;
LABEL_16:
      v9 = v16;
LABEL_17:
      v15 = v16;
      goto LABEL_18;
    }
    +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
  }
  else
  {
    v35[0] = v11;
    v35[1] = 3221225472;
    v35[2] = __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke_2;
    v35[3] = &unk_1E16C8F20;
    v35[4] = self;
    v36 = v8;
    v37 = v10;
    +[UIInputViewSetPlacement deactivatedKeyboardPlacementWithCurrentPlacement:](UIInputViewSetPlacement, "deactivatedKeyboardPlacementWithCurrentPlacement:", v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_18:
  _Block_object_dispose(&v39, 8);

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = objc_msgSend(v4, "animated"), v5 == -[UIInputViewAnimationStyle animated](self, "animated"))
    && v4[33] == self->_isLegacy)
  {
    if (-[UIInputViewAnimationStyle animated](self, "animated"))
    {
      objc_msgSend(v4, "duration");
      v7 = v6;
      -[UIInputViewAnimationStyle duration](self, "duration");
      v9 = v7 == v8;
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)legacyAnimationCopy
{
  _BYTE *v2;

  v2 = (_BYTE *)-[UIInputViewAnimationStyle copy](self, "copy");
  v2[33] = 1;
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)UIInputViewAnimationStyle;
  -[UIInputViewAnimationStyle description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; "), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIInputViewAnimationStyle animated](self, "animated");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("animated = %@; "), v6);

  -[UIInputViewAnimationStyle duration](self, "duration");
  objc_msgSend(v5, "appendFormat:", CFSTR("duration = %2g; "), v7);
  -[UIInputViewAnimationStyle force](self, "force");
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("force = %@"), v8);

  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (BOOL)isAnimationCompleted
{
  return 0;
}

- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4
{
  return -[UIInputViewAnimationStyle startPlacementForInputViewSet:currentPlacement:windowScene:](self, "startPlacementForInputViewSet:currentPlacement:windowScene:", a3, a4, 0);
}

- (id)endPlacementForInputViewSet:(id)a3
{
  return -[UIInputViewAnimationStyle endPlacementForInputViewSet:windowScene:](self, "endPlacementForInputViewSet:windowScene:", a3, 0);
}

uint64_t __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endPlacementForInputViewSet:windowScene:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)canDismissWithScrollView
{
  return 1;
}

- (BOOL)canTakeSnapshot
{
  return 0;
}

- (BOOL)force
{
  return self->force;
}

- (void)setForce:(BOOL)a3
{
  self->force = a3;
}

- (void)setDontMerge:(BOOL)a3
{
  self->_dontMerge = a3;
}

- (void)setPropertyAnimators:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAnimators, a3);
}

- (BOOL)forAssertion
{
  return self->_forAssertion;
}

@end
