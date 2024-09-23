@implementation PGCurationPartOfDayTrait

- (PGCurationPartOfDayTrait)initWithPartOfDay:(unint64_t)a3
{
  PGCurationPartOfDayTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGCurationPartOfDayTrait;
  result = -[PGCurationTrait init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)isActive
{
  return self->_value != 1;
}

- (id)niceDescription
{
  return +[PGGraphPartOfDayNode stringValueForPartOfDay:](PGGraphPartOfDayNode, "stringValueForPartOfDay:", self->_value);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  +[PGGraphPartOfDayNode stringValueForPartOfDay:](PGGraphPartOfDayNode, "stringValueForPartOfDay:", self->_value);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGCurationPartOfDayTrait;
  -[PGCurationTrait debugDescription](&v8, sel_debugDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)value
{
  return self->_value;
}

@end
