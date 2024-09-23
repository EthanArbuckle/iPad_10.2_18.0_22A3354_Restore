@implementation PGMeaningfulEventNumberTrait

- (PGMeaningfulEventNumberTrait)initWithNumberValue:(double)a3
{
  PGMeaningfulEventNumberTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventNumberTrait;
  result = -[PGMeaningfulEventTrait init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)isActive
{
  return self->_value != 0.0;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGMeaningfulEventNumberTrait;
  -[PGMeaningfulEventTrait debugDescriptionWithMomentNode:](&v8, sel_debugDescriptionWithMomentNode_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %.2f"), v5, *(_QWORD *)&self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)value
{
  return self->_value;
}

@end
