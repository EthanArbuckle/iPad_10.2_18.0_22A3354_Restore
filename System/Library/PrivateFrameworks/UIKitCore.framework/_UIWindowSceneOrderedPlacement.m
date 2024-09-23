@implementation _UIWindowSceneOrderedPlacement

+ (unint64_t)_placementType
{
  return 7;
}

- (id)_initWithConfiguration:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOrderedPlacement;
  v6 = -[UIWindowScenePlacement _init](&v9, sel__init);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

+ (id)orderedPlacementAbove:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0DC5C08];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "_persistenceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithOrder:relativeScenePersistenceIdentifer:", 0, v7);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConfiguration:", v8);

  return v9;
}

+ (id)orderedPlacementBelow:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0DC5C08];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "_persistenceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithOrder:relativeScenePersistenceIdentifer:", 1, v7);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithConfiguration:", v8);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneOrderedPlacement;
  v4 = -[UIWindowScenePlacement copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[_UIWindowSceneOrderedPlacement config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setConfig:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOrderedPlacement;
  if (-[UIWindowScenePlacement isEqual:](&v9, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowSceneOrderedPlacement config](self, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_createConfigurationWithError:(id *)a3
{
  return self->_config;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _UIWindowSceneOrderedPlacement *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneOrderedPlacement;
  v4 = a3;
  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72___UIWindowSceneOrderedPlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

  v7 = v6;
  return v7;
}

- (UISScenePlacementConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
