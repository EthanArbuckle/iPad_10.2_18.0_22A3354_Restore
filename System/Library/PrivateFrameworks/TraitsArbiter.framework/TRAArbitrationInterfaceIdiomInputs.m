@implementation TRAArbitrationInterfaceIdiomInputs

- (TRAArbitrationInterfaceIdiomInputs)initWithIsPad:(BOOL)a3
{
  TRAArbitrationInterfaceIdiomInputs *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRAArbitrationInterfaceIdiomInputs;
  result = -[TRAArbitrationInterfaceIdiomInputs init](&v5, sel_init);
  if (result)
    result->_isPad = a3;
  return result;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationInterfaceIdiomInputs succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isPad, CFSTR("isPad"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationInterfaceIdiomInputs descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isPad
{
  return self->_isPad;
}

@end
