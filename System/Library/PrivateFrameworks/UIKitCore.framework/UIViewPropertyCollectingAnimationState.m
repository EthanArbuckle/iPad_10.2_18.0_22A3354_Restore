@implementation UIViewPropertyCollectingAnimationState

- (UIViewPropertyCollectingAnimationState)init
{
  UIViewPropertyCollectingAnimationState *v2;
  uint64_t v3;
  _UICompoundObjectMap *capturedProperties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIViewPropertyCollectingAnimationState;
  v2 = -[UIViewAnimationState init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    capturedProperties = v2->_capturedProperties;
    v2->_capturedProperties = (_UICompoundObjectMap *)v3;

    v2->super._disallowInheritance = 1;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capturedProperties, 0);
}

- (_UICompoundObjectMap)capturedProperties
{
  return self->_capturedProperties;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _UICompoundObjectMap *capturedProperties;
  void *v17;
  void *v18;
  UIViewBlockBasedCAAction *v19;
  id v20;
  id v21;
  UIViewBlockBasedCAAction *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[UIViewInProcessAnimationState isKeySupported:](UIViewInProcessAnimationState, "isKeySupported:", v9))
  {
    -[UIView animationInfoCreateIfNecessary:](v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "isPartOfHigherOrderProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v9);

    objc_msgSend(v8, "valueForKeyPath:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIViewPropertyInfo viewPropertyInfoWithValue:previousValue:](_UIViewPropertyInfo, "viewPropertyInfoWithValue:previousValue:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    capturedProperties = self->_capturedProperties;
    objc_msgSend(v8, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICompoundObjectMap setValue:forObject:andProperty:](capturedProperties, "setValue:forObject:andProperty:", v15, v17, v9);

    -[UIViewAnimationState actionForLayer:forKey:forView:](self->super._nextState, "actionForLayer:forKey:forView:", v8, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [UIViewBlockBasedCAAction alloc];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__UIViewPropertyCollectingAnimationState_actionForLayer_forKey_forView___block_invoke;
    v24[3] = &unk_1E16E9FC8;
    v25 = v8;
    v26 = v15;
    v27 = v18;
    v20 = v18;
    v21 = v15;
    v22 = -[UIViewBlockBasedCAAction initWithActionBlock:](v19, "initWithActionBlock:", v24);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (+[UIViewInProcessAnimationState isKeySupported:](UIViewInProcessAnimationState, "isKeySupported:", v4))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewPropertyCollectingAnimationState;
    v5 = -[UIViewAnimationState shouldAnimatePropertyWithKey:](&v7, sel_shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

void __72__UIViewPropertyCollectingAnimationState_actionForLayer_forKey_forView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInterpolatedValue interpolatedWrapperForValue:key:](UIInterpolatedValue, "interpolatedWrapperForValue:key:", v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:", v10);

  v11 = *(void **)(a1 + 48);
  if (v11)
    objc_msgSend(v11, "runActionForKey:object:arguments:", v12, v7, v8);

}

- (BOOL)_runsAlongsideAnimations
{
  return 0;
}

- (void)setCapturedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_capturedProperties, a3);
}

@end
