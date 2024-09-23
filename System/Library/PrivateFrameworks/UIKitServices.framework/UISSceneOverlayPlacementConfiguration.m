@implementation UISSceneOverlayPlacementConfiguration

+ (unint64_t)placementType
{
  return 6;
}

- (UISSceneOverlayPlacementConfiguration)initWithTargetSceneIdentity:(id)a3
{
  id v5;
  UISSceneOverlayPlacementConfiguration *v6;
  UISSceneOverlayPlacementConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  v6 = -[UISScenePlacementConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_targetSceneIdentity, a3);

  return v7;
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
  v9.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  if (-[UISScenePlacementConfiguration isEqual:](&v9, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "targetSceneIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISSceneOverlayPlacementConfiguration targetSceneIdentity](self, "targetSceneIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISSceneOverlayPlacementConfiguration)initWithCoder:(id)a3
{
  id v4;
  UISSceneOverlayPlacementConfiguration *v5;
  uint64_t v6;
  FBSSceneIdentityToken *targetSceneIdentity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  v5 = -[UISScenePlacementConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTargetSceneIdentityKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetSceneIdentity = v5->_targetSceneIdentity;
    v5->_targetSceneIdentity = (FBSSceneIdentityToken *)v6;

    if (!v5->_targetSceneIdentity)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UISSceneOverlayPlacementConfiguration targetSceneIdentity](self, "targetSceneIdentity", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kTargetSceneIdentityKey"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISSceneOverlayPlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  UISSceneOverlayPlacementConfiguration *v5;
  uint64_t v6;
  FBSSceneIdentityToken *targetSceneIdentity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  v5 = -[UISScenePlacementConfiguration initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTargetSceneIdentityKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetSceneIdentity = v5->_targetSceneIdentity;
    v5->_targetSceneIdentity = (FBSSceneIdentityToken *)v6;

    if (!v5->_targetSceneIdentity)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[UISSceneOverlayPlacementConfiguration targetSceneIdentity](self, "targetSceneIdentity", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kTargetSceneIdentityKey"));

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UISSceneOverlayPlacementConfiguration *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UISSceneOverlayPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__UISSceneOverlayPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2CAF5B8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E2CB0240, v4, v9);

  v7 = v6;
  return v7;
}

void __79__UISSceneOverlayPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "targetSceneIdentity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("targetSceneIdentity"));

}

- (FBSSceneIdentityToken)targetSceneIdentity
{
  return self->_targetSceneIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneIdentity, 0);
}

@end
