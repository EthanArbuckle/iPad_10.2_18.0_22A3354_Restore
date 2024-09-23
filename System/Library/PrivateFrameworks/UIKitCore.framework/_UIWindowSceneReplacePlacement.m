@implementation _UIWindowSceneReplacePlacement

+ (id)placementToReplaceSceneSession:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTargetSceneSession:", v4);

  return v5;
}

- (id)_initWithTargetSceneSession:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneReplacePlacement;
  v5 = -[UIWindowScenePlacement _init](&v9, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "persistentIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

+ (unint64_t)_placementType
{
  return 8;
}

- (id)_createConfigurationWithError:(id *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5C30]), "initWithTargetSceneSessionPersistentIdentifier:", self->_targetSceneSessionPersistentIdentifier);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWindowSceneReplacePlacement;
  v4 = -[UIWindowScenePlacement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setTargetSceneSessionPersistentIdentifier:", self->_targetSceneSessionPersistentIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneReplacePlacement;
  if (-[UIWindowScenePlacement isEqual:](&v8, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "targetSceneSessionPersistentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", self->_targetSceneSessionPersistentIdentifier);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _UIWindowSceneReplacePlacement *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneReplacePlacement;
  v4 = a3;
  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72___UIWindowSceneReplacePlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

  v7 = v6;
  return v7;
}

- (NSString)targetSceneSessionPersistentIdentifier
{
  return self->_targetSceneSessionPersistentIdentifier;
}

- (void)setTargetSceneSessionPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneSessionPersistentIdentifier, 0);
}

@end
