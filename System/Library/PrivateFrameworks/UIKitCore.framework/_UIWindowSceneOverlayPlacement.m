@implementation _UIWindowSceneOverlayPlacement

+ (unint64_t)_placementType
{
  return 6;
}

- (_UIWindowSceneOverlayPlacement)initWithTargetSceneIdentity:(id)a3
{
  id v5;
  id *v6;
  _UIWindowSceneOverlayPlacement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOverlayPlacement;
  v6 = -[UIWindowScenePlacement _init](&v9, sel__init);
  v7 = (_UIWindowSceneOverlayPlacement *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

+ (id)placementOverlayingWindowScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "_FBSScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTargetSceneIdentity:", v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneOverlayPlacement;
  v4 = -[UIWindowScenePlacement copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[_UIWindowSceneOverlayPlacement targetSceneIdentity](self, "targetSceneIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTargetSceneIdentity:", v6);

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
  v9.super_class = (Class)_UIWindowSceneOverlayPlacement;
  if (-[UIWindowScenePlacement isEqual:](&v9, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "targetSceneIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowSceneOverlayPlacement targetSceneIdentity](self, "targetSceneIdentity");
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
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0DC5C10]);
  -[_UIWindowSceneOverlayPlacement targetSceneIdentity](self, "targetSceneIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTargetSceneIdentity:", v5);

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
  _UIWindowSceneOverlayPlacement *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneOverlayPlacement;
  v4 = a3;
  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72___UIWindowSceneOverlayPlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

  v7 = v6;
  return v7;
}

- (FBSSceneIdentityToken)targetSceneIdentity
{
  return self->_targetSceneIdentity;
}

- (void)setTargetSceneIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_targetSceneIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneIdentity, 0);
}

@end
