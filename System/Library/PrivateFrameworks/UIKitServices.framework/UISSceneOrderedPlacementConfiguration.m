@implementation UISSceneOrderedPlacementConfiguration

+ (unint64_t)placementType
{
  return 7;
}

- (UISSceneOrderedPlacementConfiguration)initWithOrder:(int64_t)a3 relativeScenePersistenceIdentifer:(id)a4
{
  id v7;
  UISSceneOrderedPlacementConfiguration *v8;
  UISSceneOrderedPlacementConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v8 = -[UISScenePlacementConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_order = (int64_t *)a3;
    objc_storeStrong((id *)&v8->_relativeScenePersistenceIdentifier, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UISSceneOrderedPlacementConfiguration *v4;
  int64_t *v5;
  void *v6;
  UISSceneOrderedPlacementConfiguration *v7;

  v4 = [UISSceneOrderedPlacementConfiguration alloc];
  v5 = -[UISSceneOrderedPlacementConfiguration order](self, "order");
  -[UISSceneOrderedPlacementConfiguration relativeScenePersistenceIdentifier](self, "relativeScenePersistenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UISSceneOrderedPlacementConfiguration initWithOrder:relativeScenePersistenceIdentifer:](v4, "initWithOrder:relativeScenePersistenceIdentifer:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  if (-[UISScenePlacementConfiguration isEqual:](&v10, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "relativeScenePersistenceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int64_t *)objc_msgSend(v4, "order");
    -[UISSceneOrderedPlacementConfiguration relativeScenePersistenceIdentifier](self, "relativeScenePersistenceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v5))
      v8 = -[UISSceneOrderedPlacementConfiguration order](self, "order") == v6;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISSceneOrderedPlacementConfiguration)initWithCoder:(id)a3
{
  id v4;
  UISSceneOrderedPlacementConfiguration *v5;
  uint64_t v6;
  NSString *relativeScenePersistenceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v5 = -[UISScenePlacementConfiguration initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_order = (int64_t *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kOrderKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRelativeScenePersistenceIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    relativeScenePersistenceIdentifier = v5->_relativeScenePersistenceIdentifier;
    v5->_relativeScenePersistenceIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[UISSceneOrderedPlacementConfiguration order](self, "order", v6.receiver, v6.super_class), CFSTR("kOrderKey"));
  -[UISSceneOrderedPlacementConfiguration relativeScenePersistenceIdentifier](self, "relativeScenePersistenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRelativeScenePersistenceIdentifierKey"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISSceneOrderedPlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  UISSceneOrderedPlacementConfiguration *v5;
  uint64_t v6;
  NSString *relativeScenePersistenceIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v5 = -[UISScenePlacementConfiguration initWithBSXPCCoder:](&v9, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v5->_order = (int64_t *)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kOrderKey"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("kRelativeScenePersistenceIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    relativeScenePersistenceIdentifier = v5->_relativeScenePersistenceIdentifier;
    v5->_relativeScenePersistenceIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[UISSceneOrderedPlacementConfiguration order](self, "order", v6.receiver, v6.super_class), CFSTR("kOrderKey"));
  -[UISSceneOrderedPlacementConfiguration relativeScenePersistenceIdentifier](self, "relativeScenePersistenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRelativeScenePersistenceIdentifierKey"));

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UISSceneOrderedPlacementConfiguration *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__UISSceneOrderedPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2CAF5B8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E2CB0240, v4, v9);

  v7 = v6;
  return v7;
}

id __79__UISSceneOrderedPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "relativeScenePersistenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("relativeScenePersistenceIdentifier"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInt:withName:", objc_msgSend(*(id *)(a1 + 40), "order"), CFSTR("order"));
}

- (int64_t)order
{
  return self->_order;
}

- (NSString)relativeScenePersistenceIdentifier
{
  return self->_relativeScenePersistenceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeScenePersistenceIdentifier, 0);
}

@end
