@implementation UISSceneProminentPlacementConfiguration

+ (unint64_t)placementType
{
  return 2;
}

- (UISSceneProminentPlacementConfiguration)init
{
  UISSceneProminentPlacementConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISSceneProminentPlacementConfiguration;
  result = -[UISScenePlacementConfiguration init](&v3, sel_init);
  if (result)
    result->_prefersLargeSize = 0;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISSceneProminentPlacementConfiguration;
  if (-[UISScenePlacementConfiguration isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = objc_msgSend(v4, "prefersLargeSize");
    v6 = v5 ^ -[UISSceneProminentPlacementConfiguration prefersLargeSize](self, "prefersLargeSize") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISSceneProminentPlacementConfiguration)initWithCoder:(id)a3
{
  id v4;
  UISSceneProminentPlacementConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISSceneProminentPlacementConfiguration;
  v5 = -[UISScenePlacementConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_prefersLargeSize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPrefersLargeSizeKey"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISSceneProminentPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneProminentPlacementConfiguration prefersLargeSize](self, "prefersLargeSize", v5.receiver, v5.super_class), CFSTR("kPrefersLargeSizeKey"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISSceneProminentPlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  UISSceneProminentPlacementConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISSceneProminentPlacementConfiguration;
  v5 = -[UISScenePlacementConfiguration initWithBSXPCCoder:](&v7, sel_initWithBSXPCCoder_, v4);
  if (v5)
    v5->_prefersLargeSize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPrefersLargeSizeKey"));

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISSceneProminentPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneProminentPlacementConfiguration prefersLargeSize](self, "prefersLargeSize", v5.receiver, v5.super_class), CFSTR("kPrefersLargeSizeKey"));

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UISSceneProminentPlacementConfiguration *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UISSceneProminentPlacementConfiguration;
  v4 = a3;
  -[UISScenePlacementConfiguration descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__UISSceneProminentPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E2CAF5B8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E2CB0240, v4, v9);

  v7 = v6;
  return v7;
}

id __81__UISSceneProminentPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "prefersLargeSize"), CFSTR("prefersLargeSize"));
}

- (BOOL)prefersLargeSize
{
  return self->_prefersLargeSize;
}

- (void)setPrefersLargeSize:(BOOL)a3
{
  self->_prefersLargeSize = a3;
}

@end
