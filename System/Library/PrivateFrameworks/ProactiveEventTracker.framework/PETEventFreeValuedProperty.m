@implementation PETEventFreeValuedProperty

- (BOOL)isValidValue:(id)a3
{
  return 1;
}

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  return +[PETEventStringValidator sanitizedString:](PETEventStringValidator, "sanitizedString:", a3);
}

- (PETEventFreeValuedProperty)initWithName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PETEventFreeValuedProperty;
  return -[PETEventProperty initWithName:](&v4, sel_initWithName_, a3);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PETEventProperty name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("FreeValued: Name=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)cardinality
{
  return 1;
}

- (id)possibleValues
{
  return 0;
}

- (id)longestValueString
{
  return &stru_1E2A41AA0;
}

@end
