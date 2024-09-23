@implementation SBRootDodgingLayerModifier

- (void)setDelegate:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootDodgingLayerModifier;
  -[SBChainableModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
  {
    if (!self->_hasPerformedInitialSetup)
    {
      self->_hasPerformedInitialSetup = 1;
      -[SBRootDodgingLayerModifier _setup](self, "_setup");
    }
  }
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootDodgingLayerModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_hasPerformedInitialSetup)
    {
      self->_hasPerformedInitialSetup = 1;
      -[SBRootDodgingLayerModifier _setup](self, "_setup");
    }
  }
}

- (void)_setup
{
  void *v3;
  SBFloorDodgingLayerModifier *v4;

  -[SBRootDodgingLayerModifier _floorModifier](self, "_floorModifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc_init(SBFloorDodgingLayerModifier);
    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v4, 1, CFSTR("Floor Modifier"));

    v3 = 0;
  }

}

- (id)handleInsertionEvent:(id)a3
{
  id v4;
  void *v5;
  SBInsertionDodgingModifier *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBInsertionDodgingModifier *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBRootDodgingLayerModifier;
  v4 = a3;
  -[SBDodgingModifier handleInsertionEvent:](&v18, sel_handleInsertionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SBInsertionDodgingModifier alloc];
  objc_msgSend(v4, "identifier", v18.receiver, v18.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "size");
  v13 = v12;
  v15 = v14;

  v16 = -[SBInsertionDodgingModifier initWithIdentifier:initialCenter:initialSize:](v6, "initWithIdentifier:initialCenter:initialSize:", v7, v9, v11, v13, v15);
  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v16, 0, 0);

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  SBRemovalDodgingModifier *v6;
  void *v7;
  SBRemovalDodgingModifier *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRootDodgingLayerModifier;
  v4 = a3;
  -[SBDodgingModifier handleRemovalEvent:](&v10, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SBRemovalDodgingModifier alloc];
  objc_msgSend(v4, "identifier", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBRemovalDodgingModifier initWithIdentifier:](v6, "initWithIdentifier:", v7);
  -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 0, 0);

  return v5;
}

- (id)handleRotationEvent:(id)a3
{
  id v4;
  void *v5;
  SBRotationDodgingModifier *v6;
  void *v7;
  SBRotationDodgingModifier *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBRootDodgingLayerModifier;
  -[SBDodgingModifier handleRotationEvent:](&v10, sel_handleRotationEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "phase"))
  {
    v6 = [SBRotationDodgingModifier alloc];
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBRotationDodgingModifier initWithIdentifier:fromOrientation:toOrientation:](v6, "initWithIdentifier:fromOrientation:toOrientation:", v7, objc_msgSend(v4, "fromOrientation"), objc_msgSend(v4, "toOrientation"));

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v8, 0, 0);
  }

  return v5;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBInteractivePreferenceChangeDodgingModifier *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  SBPreferenceChangeDodgingModifier *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBRootDodgingLayerModifier;
  -[SBDodgingModifier handlePreferenceChangeEvent:](&v14, sel_handlePreferenceChangeEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "style");
  if (!objc_msgSend(v4, "phase") && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    if (v6 == 1)
    {
      v7 = [SBInteractivePreferenceChangeDodgingModifier alloc];
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBInteractivePreferenceChangeDodgingModifier initWithIdentifier:](v7, "initWithIdentifier:", v8);
    }
    else
    {
      v10 = v6 == 2;
      v11 = [SBPreferenceChangeDodgingModifier alloc];
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBPreferenceChangeDodgingModifier initWithIdentifier:animated:](v11, "initWithIdentifier:animated:", v8, v10);
    }
    v12 = (void *)v9;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v12, 0, 0);
  }

  return v5;
}

- (id)_floorModifier
{
  return -[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Floor Modifier"));
}

- (BOOL)hasPerformedInitialSetup
{
  return self->_hasPerformedInitialSetup;
}

- (void)setHasPerformedInitialSetup:(BOOL)a3
{
  self->_hasPerformedInitialSetup = a3;
}

@end
