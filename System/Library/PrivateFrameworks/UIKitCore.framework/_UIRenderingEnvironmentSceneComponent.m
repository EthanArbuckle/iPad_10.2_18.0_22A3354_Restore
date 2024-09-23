@implementation _UIRenderingEnvironmentSceneComponent

- (_UIRenderingEnvironmentSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIRenderingEnvironmentSceneComponent *v5;
  _UIRenderingEnvironmentSceneComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRenderingEnvironmentSceneComponent;
  v5 = -[_UIRenderingEnvironmentSceneComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    -[_UIRenderingEnvironmentSceneComponent _invalidateTraitOverrides]((uint64_t)v6);
  }

  return v6;
}

- (void)_invalidateTraitOverrides
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _UIRenderingEnvironmentAttributes *v6;
  void *v7;
  id v8;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "_FBSScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 24);
    if (v8)
    {
      if (v5 && (objc_msgSend(v5, "refersToSameDisplayConfiguration:", v8) & 1) != 0)
        goto LABEL_8;
      v6 = -[_UIRenderingEnvironmentAttributes initWithDisplayConfiguration:]([_UIRenderingEnvironmentAttributes alloc], "initWithDisplayConfiguration:", v8);
      v5 = *(void **)(a1 + 24);
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)(a1 + 24) = v6;

    v7 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

LABEL_8:
  }
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (UITraitCollection)_traitOverrides
{
  _UIRenderingEnvironmentAttributes *currentAttributes;
  UITraitCollection *traitOverrides;
  UITraitCollection *v5;
  UITraitCollection *v6;
  UITraitCollection *v7;

  currentAttributes = self->_currentAttributes;
  if (currentAttributes)
  {
    traitOverrides = self->_traitOverrides;
    if (!traitOverrides)
    {
      +[UITraitCollection traitCollectionWithObject:forTrait:](UITraitCollection, "traitCollectionWithObject:forTrait:", currentAttributes, objc_opt_class());
      v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
      v6 = self->_traitOverrides;
      self->_traitOverrides = v5;

      traitOverrides = self->_traitOverrides;
    }
    v7 = traitOverrides;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRenderingEnvironmentSceneComponent;
  -[_UIRenderingEnvironmentSceneComponent description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v4, "appendFormat:", CFSTR(" scene=%p"), WeakRetained);

  if (self->_currentAttributes)
    objc_msgSend(v4, "appendFormat:", CFSTR(" attributes=%@"), self->_currentAttributes);
  return (NSString *)v4;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAttributes, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
}

@end
