@implementation _UIWindowScenePreservedPlacement

+ (unint64_t)_placementType
{
  return 3;
}

- (_UIWindowScenePreservedPlacement)init
{
  _UIWindowScenePreservedPlacement *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowScenePreservedPlacement;
  result = -[UIWindowScenePlacement _init](&v3, sel__init);
  if (result)
    result->_keepInBackground = 0;
  return result;
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC5C18]);
  objc_msgSend(v4, "setKeepInBackground:", -[_UIWindowScenePreservedPlacement keepInBackground](self, "keepInBackground"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWindowScenePreservedPlacement;
  v4 = -[UIWindowScenePlacement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setKeepInBackground:", -[_UIWindowScenePreservedPlacement keepInBackground](self, "keepInBackground"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowScenePreservedPlacement;
  if (-[UIWindowScenePlacement isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[_UIWindowScenePreservedPlacement keepInBackground](self, "keepInBackground");
    v6 = v5 ^ objc_msgSend(v4, "keepInBackground") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_preserveLayout
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _UIWindowScenePreservedPlacement *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIWindowScenePreservedPlacement;
  v4 = a3;
  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74___UIWindowScenePreservedPlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

  v7 = v6;
  return v7;
}

- (BOOL)keepInBackground
{
  return self->_keepInBackground;
}

- (void)setKeepInBackground:(BOOL)a3
{
  self->_keepInBackground = a3;
}

@end
