@implementation UIKBKeyViewAnimatorMonolith

- (UIKBKeyViewAnimatorMonolith)init
{
  UIKBKeyViewAnimatorMonolith *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *selectedKeyTimestamps;
  NSMutableDictionary *v5;
  NSMutableDictionary *transitionCompletions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBKeyViewAnimatorMonolith;
  v2 = -[UIKBKeyViewAnimatorMonolith init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    selectedKeyTimestamps = v2->_selectedKeyTimestamps;
    v2->_selectedKeyTimestamps = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transitionCompletions = v2->_transitionCompletions;
    v2->_transitionCompletions = v5;

  }
  return v2;
}

- (Class)keyViewClassForKey:(id)a3 renderTraits:(id)a4 screenTraits:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  objc_class *v13;
  objc_class *v14;
  void *v16;
  int v17;
  objc_class *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "representedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Recent-Inputs"));

  if (!v12)
  {
    if (objc_msgSend(v8, "interactionType") == 3)
    {
      objc_msgSend(v10, "isLinear");
    }
    else if (objc_msgSend(v8, "interactionType") != 39)
    {
      if ((objc_msgSend(v9, "blurBlending") & 1) != 0
        || (objc_msgSend(v9, "variantTraits"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "blurBlending"),
            v16,
            v17))
      {
        objc_msgSend(v9, "variantTraits");

      }
      else
      {
        v18 = -[UIKBKeyViewAnimator _keyViewClassForSpecialtyKey:screenTraits:](self, "_keyViewClassForSpecialtyKey:screenTraits:", v8, v10);
        if (v18)
        {
          v13 = v18;
          goto LABEL_3;
        }
      }
    }
  }
  objc_opt_class();
  v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v14 = v13;

  return v14;
}

- (unint64_t)controlStateForKeyState:(int)a3
{
  uint64_t v3;

  v3 = 8;
  if (a3 == 12)
    v3 = 9;
  if ((a3 & 0xC) == 0)
    v3 = 0;
  return v3 | (2 * (a3 & 1u)) | (a3 >> 4) & 1;
}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSMutableDictionary *transitionCompletions;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(a3, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v14 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKBKeyViewAnimatorMonolith.m"), 120, CFSTR("this should be a keyView!"));

    }
    objc_msgSend(v14, "key", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    transitionCompletions = self->_transitionCompletions;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](transitionCompletions, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v10, "removeAllObjects");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__UIKBKeyViewAnimatorMonolith_floatingContentView_didFinishTransitioningToState___block_invoke;
    v16[3] = &unk_1E16D3A50;
    v17 = v11;
    v12 = v11;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

    v6 = v15;
  }

}

void __81__UIKBKeyViewAnimatorMonolith_floatingContentView_didFinishTransitioningToState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void (**v5)(id, BOOL);

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v5[2](v5, objc_msgSend(v4, "count") - 1 == a3);

}

- (int64_t)_transitionFromState:(int)a3 toState:(int)a4
{
  int64_t result;
  int v5;

  result = 0;
  v5 = a4 | (a3 << 8);
  if (v5 > 1025)
  {
    if (v5 > 2051)
    {
      if (v5 != 2052 && v5 != 4098 && v5 != 5122)
        return result;
    }
    else if (v5 != 1026)
    {
      if (v5 == 1032)
        return 1;
      if (v5 != 2050)
        return result;
    }
    return 2;
  }
  if ((v5 - 513) <= 0x13)
  {
    if (((1 << (a4 - 1)) & 0x88088) != 0)
      return 1;
    if (v5 == 513)
      return 2;
  }
  if (v5 == 258)
    return 1;
  return result;
}

- (void)addTransitionCompletion:(id)a3 forKeyName:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableDictionary objectForKey:](self->_transitionCompletions, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_transitionCompletions, "setObject:forKey:", v7, v9);
  }
  v8 = _Block_copy(v6);
  objc_msgSend(v7, "addObject:", v8);

}

- (void)transitionFloatingKeyView:(id)a3 toState:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  NSMutableDictionary *transitionCompletions;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  UIKBKeyViewAnimatorMonolith *v28;
  id v29;
  id v30;
  int v31;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = -[UIKBKeyViewAnimatorMonolith controlStateForKeyState:](self, "controlStateForKeyState:", v6);
  objc_msgSend(v8, "floatingContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transitionCompletions = self->_transitionCompletions;
  objc_msgSend(v8, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](transitionCompletions, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "controlState") != v10)
  {
    if (objc_msgSend(v15, "count"))
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __76__UIKBKeyViewAnimatorMonolith_transitionFloatingKeyView_toState_completion___block_invoke;
      v27 = &unk_1E16D3A78;
      v28 = self;
      v18 = v8;
      v31 = v6;
      v29 = v18;
      v30 = v9;
      v9 = v9;
      v19 = _Block_copy(&v24);
      objc_msgSend(v18, "key", v24, v25, v26, v27, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyViewAnimatorMonolith addTransitionCompletion:forKeyName:](self, "addTransitionCompletion:forKeyName:", v19, v21);

    }
    else
    {
      if (!v9)
        v9 = &__block_literal_global_319;
      objc_msgSend(v8, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyViewAnimatorMonolith addTransitionCompletion:forKeyName:](self, "addTransitionCompletion:forKeyName:", v9, v23);

      objc_msgSend(v11, "setFloatingContentDelegate:", self);
      objc_msgSend(v11, "setControlState:animated:", v10, 1);
      -[UIKBKeyViewAnimatorMonolith animateFloatingKeyView:toControlState:](self, "animateFloatingKeyView:toControlState:", v8, v10);
    }
    goto LABEL_11;
  }
  if (v9)
  {
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v8, "key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBKeyViewAnimatorMonolith addTransitionCompletion:forKeyName:](self, "addTransitionCompletion:forKeyName:", v9, v17);

    }
    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
LABEL_11:

  }
}

uint64_t __76__UIKBKeyViewAnimatorMonolith_transitionFloatingKeyView_toState_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionFloatingKeyView:toState:completion:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)animateFloatingKeyView:(id)a3 toControlState:(unint64_t)a4
{
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  CATransform3D v54;
  _OWORD v55[8];
  CATransform3D v56;
  CATransform3D v57;
  _OWORD v58[8];
  CATransform3D v59;
  CATransform3D v60;

  v5 = a3;
  objc_msgSend(v5, "floatingContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v60, 0, sizeof(v60));
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v53 = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  if (a4 == 8)
  {
    *(_OWORD *)&v59.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v59.m33 = v7;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v59.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v59.m43 = v15;
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v59.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v59.m13 = v16;
    v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v59.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v59.m23 = v17;
    v14 = 1.0;
    CATransform3DScale(&v60, &v59, 1.1, 1.1, 1.0);
    objc_msgSend(v6, "focusAnimationConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "focusingBaseDuration");
    v13 = v19;

  }
  else
  {
    *(_OWORD *)&v60.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v60.m33 = v7;
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v60.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v60.m43 = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v60.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v60.m13 = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v60.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v60.m23 = v10;
    objc_msgSend(v6, "focusAnimationConfiguration");
    if (a4 == 9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "focusingBaseDuration");
      v13 = v12;

      v14 = 1.0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unfocusingBaseDuration");
      v13 = v21;

      v14 = 0.0;
    }
  }
  objc_msgSend(v5, "layerForRenderFlags:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "animationForKey:", CFSTR("transform"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "animationForKey:", CFSTR("opacity"));
  v24 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v23;
  if (v23)
    objc_msgSend(v22, "removeAnimationForKey:", CFSTR("transform"));
  if (v24)
    objc_msgSend(v22, "removeAnimationForKey:", CFSTR("opacity"));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v25, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v25, "setDuration:", v13);
  v27 = (void *)MEMORY[0x1E0CB3B18];
  if (v22)
    objc_msgSend(v22, "transform");
  else
    memset(v58, 0, sizeof(v58));
  objc_msgSend(v27, "valueWithCATransform3D:", v58);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFromValue:", v28);

  v59 = v60;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v59);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setToValue:", v29);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFillMode:", v26);
  objc_msgSend(v30, "setDuration:", v13);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v22, "opacity");
  objc_msgSend(v31, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFromValue:", v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setToValue:", v33);

  v57 = v60;
  objc_msgSend(v22, "setTransform:", &v57);
  objc_msgSend(v5, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v35 = v14;
  objc_msgSend(v34, "setOpacity:", v35);

  if (v13 > 0.0)
  {
    objc_msgSend(v22, "addAnimation:forKey:", v25, CFSTR("transform"));
    objc_msgSend(v5, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addAnimation:forKey:", v30, CFSTR("opacity"));

  }
  objc_msgSend(v5, "layerForRenderFlags:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "animationForKey:", CFSTR("transform"));
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "animationForKey:", CFSTR("opacity"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v38;
  if (v38)
    objc_msgSend(v37, "removeAnimationForKey:", CFSTR("transform"), v38);
  if (v39)
    objc_msgSend(v37, "removeAnimationForKey:", CFSTR("opacity"));
  v51 = (void *)v24;
  v59 = v60;
  if (objc_msgSend(v5, "imageOrientationForLayer:", v37, v49) == 1)
  {
    v56 = v59;
    CATransform3DScale(&v59, &v56, 1.0, -1.0, 1.0);
  }
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFillMode:", v26);
  objc_msgSend(v40, "setDuration:", v13);
  v41 = (void *)MEMORY[0x1E0CB3B18];
  if (v37)
    objc_msgSend(v37, "transform");
  else
    memset(v55, 0, sizeof(v55));
  objc_msgSend(v41, "valueWithCATransform3D:", v55);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFromValue:", v42);

  v56 = v59;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v56);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setToValue:", v43);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFillMode:", v26);
  objc_msgSend(v44, "setDuration:", v13);
  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v37, "opacity");
  objc_msgSend(v45, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFromValue:", v46);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setToValue:", v47);

  v54 = v59;
  objc_msgSend(v37, "setTransform:", &v54);
  *(float *)&v48 = v14;
  objc_msgSend(v37, "setOpacity:", v48);
  if (v13 > 0.0)
  {
    objc_msgSend(v37, "addAnimation:forKey:", v40, CFSTR("transform"));
    objc_msgSend(v37, "addAnimation:forKey:", v44, CFSTR("opacity"));
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (BOOL)shouldAssertCurrentKeyState:(id)a3
{
  return objc_msgSend(a3, "state") == 8;
}

- (BOOL)shouldTransitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  unsigned __int8 v10;
  int v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "interactionType") == 3)
  {
    v10 = (_DWORD)v6 == 0;
  }
  else
  {
    v11 = objc_msgSend(v9, "variantType");
    if ((_DWORD)v5 == 16 && (_DWORD)v6 == 4 && v11)
    {
      v10 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UIKBKeyViewAnimatorMonolith;
      v10 = -[UIKBKeyViewAnimator shouldTransitionKeyView:fromState:toState:](&v13, sel_shouldTransitionKeyView_fromState_toState_, v8, v6, v5);
    }
  }

  return v10;
}

- (void)transitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void (**v11)(id, BOOL);
  void *v12;
  NSMutableDictionary *selectedKeyTimestamps;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  NSMutableDictionary *transitionCompletions;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  id v25;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void (**)(id, BOOL))a6;
  objc_msgSend(v10, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  selectedKeyTimestamps = self->_selectedKeyTimestamps;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](selectedKeyTimestamps, "setObject:forKey:", v15, v16);

  objc_msgSend(v10, "renderConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v17, "lightKeyboard");

  if ((_DWORD)v15)
    v18 = 0.06;
  else
    v18 = 0.0;
  transitionCompletions = self->_transitionCompletions;
  objc_msgSend(v12, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](transitionCompletions, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v10;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v25, "floatingContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "focusAnimationConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFocusingBaseDuration:", v18);

    -[UIKBKeyViewAnimatorMonolith transitionFloatingKeyView:toState:completion:](self, "transitionFloatingKeyView:toState:completion:", v25, v7, v11);
  }
  else if (objc_msgSend(v12, "interactionType") == 10
         || -[UIKBKeyViewAnimatorMonolith _transitionFromState:toState:](self, "_transitionFromState:toState:", v8, v7) != 1)
  {
    if (v11)
      v11[2](v11, objc_msgSend(v21, "count") == 0);
  }
  else
  {
    -[UIKBKeyViewAnimator _fadeInKeyView:duration:completion:](self, "_fadeInKeyView:duration:completion:", v25, v11, v18);
  }

}

- (void)transitionOutKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void (**v11)(id, BOOL);
  void *v12;
  NSMutableDictionary *selectedKeyTimestamps;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  NSMutableDictionary *transitionCompletions;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  id v30;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (void (**)(id, BOOL))a6;
  objc_msgSend(v10, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  selectedKeyTimestamps = self->_selectedKeyTimestamps;
  objc_msgSend(v12, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](selectedKeyTimestamps, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v18 - v17;
  v20 = fmax(v19 * 0.5 + (1.0 - v19) * 0.2, 0.2);
  if (v20 > 0.5)
    v20 = 0.5;
  if (v19 >= 3.0)
    v21 = 0.2;
  else
    v21 = v20;
  objc_msgSend(v10, "renderConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "lightKeyboard");

  if (!v23)
    v21 = 0.0;
  transitionCompletions = self->_transitionCompletions;
  objc_msgSend(v12, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](transitionCompletions, "objectForKey:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v10;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v30, "floatingContentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "focusAnimationConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setUnfocusingBaseDuration:", v21);

    -[UIKBKeyViewAnimatorMonolith transitionFloatingKeyView:toState:completion:](self, "transitionFloatingKeyView:toState:completion:", v30, v7, v11);
  }
  else if (objc_msgSend(v12, "interactionType") == 10
         || -[UIKBKeyViewAnimatorMonolith _transitionFromState:toState:](self, "_transitionFromState:toState:", v8, v7) != 2)
  {
    if (v11)
      v11[2](v11, objc_msgSend(v26, "count") == 0);
  }
  else
  {
    -[UIKBKeyViewAnimator _fadeOutKeyView:duration:completion:](self, "_fadeOutKeyView:duration:completion:", v30, v11, v21);
  }

}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_selectedKeyTimestamps, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_transitionCompletions, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionCompletions, 0);
  objc_storeStrong((id *)&self->_selectedKeyTimestamps, 0);
}

@end
