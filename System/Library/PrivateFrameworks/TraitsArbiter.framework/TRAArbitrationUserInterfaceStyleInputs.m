@implementation TRAArbitrationUserInterfaceStyleInputs

- (BOOL)isEqual:(id)a3
{
  TRAArbitrationUserInterfaceStyleInputs *v4;
  BOOL v5;

  v4 = (TRAArbitrationUserInterfaceStyleInputs *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRAArbitrationUserInterfaceStyleInputs isEqualToUserInterfaceStyleInputs:](self, "isEqualToUserInterfaceStyleInputs:", v4);
  }

  return v5;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (TRAArbitrationUserInterfaceStyleInputs)initWithUserInterfaceStyle:(int64_t)a3
{
  TRAArbitrationUserInterfaceStyleInputs *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRAArbitrationUserInterfaceStyleInputs;
  result = -[TRAArbitrationUserInterfaceStyleInputs init](&v5, sel_init);
  if (result)
    result->_userInterfaceStyle = a3;
  return result;
}

- (BOOL)isEqualToUserInterfaceStyleInputs:(id)a3
{
  TRAArbitrationUserInterfaceStyleInputs *v5;
  int64_t userInterfaceStyle;
  BOOL v7;
  void *v9;

  v5 = (TRAArbitrationUserInterfaceStyleInputs *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 738, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputs == nil || [inputs isKindOfClass:[TRAArbitrationUserInterfaceStyleInputs class]]"));

    }
    if (self == v5)
    {
      v7 = 1;
    }
    else
    {
      userInterfaceStyle = self->_userInterfaceStyle;
      v7 = userInterfaceStyle == -[TRAArbitrationUserInterfaceStyleInputs userInterfaceStyle](v5, "userInterfaceStyle");
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationUserInterfaceStyleInputs succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_userInterfaceStyle, CFSTR("userInterfaceStyle"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationUserInterfaceStyleInputs descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
