@implementation PGMeaningfulEventPartOfDayTrait

- (PGMeaningfulEventPartOfDayTrait)initWithPartOfDay:(unint64_t)a3
{
  return -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:forbiddenPartOfDay:](self, "initWithPartOfDay:forbiddenPartOfDay:", a3, 1);
}

- (PGMeaningfulEventPartOfDayTrait)initWithPartOfDay:(unint64_t)a3 forbiddenPartOfDay:(unint64_t)a4
{
  PGMeaningfulEventPartOfDayTrait *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGMeaningfulEventPartOfDayTrait;
  result = -[PGMeaningfulEventTrait init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_forbiddenValue = a4;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_value != 1;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  unint64_t value;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  value = self->_value;
  v5 = a3;
  +[PGGraphPartOfDayNode stringValueForPartOfDay:](PGGraphPartOfDayNode, "stringValueForPartOfDay:", value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGMeaningfulEventPartOfDayTrait;
  -[PGMeaningfulEventTrait debugDescriptionWithMomentNode:](&v11, sel_debugDescriptionWithMomentNode_, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)value
{
  return self->_value;
}

- (unint64_t)forbiddenValue
{
  return self->_forbiddenValue;
}

@end
