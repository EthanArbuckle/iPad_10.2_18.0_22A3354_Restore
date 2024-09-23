@implementation PGMeaningfulEventLocationMobilityTrait

- (PGMeaningfulEventLocationMobilityTrait)initWithMobility:(unint64_t)a3
{
  PGMeaningfulEventLocationMobilityTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventLocationMobilityTrait;
  result = -[PGMeaningfulEventTrait init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)isActive
{
  return self->_value != 0;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  unint64_t value;
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  value = self->_value;
  v5 = a3;
  if (value > 4)
    v6 = 0;
  else
    v6 = off_1E8427E50[value];
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)PGMeaningfulEventLocationMobilityTrait;
  -[PGMeaningfulEventTrait debugDescriptionWithMomentNode:](&v12, sel_debugDescriptionWithMomentNode_, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)value
{
  return self->_value;
}

@end
