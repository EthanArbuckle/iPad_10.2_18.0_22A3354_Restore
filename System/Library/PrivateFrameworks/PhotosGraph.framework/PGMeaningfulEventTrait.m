@implementation PGMeaningfulEventTrait

- (PGMeaningfulEventTrait)init
{
  PGMeaningfulEventTrait *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGMeaningfulEventTrait;
  result = -[PGMeaningfulEventTrait init](&v3, sel_init);
  if (result)
    result->_minimumScore = 0.0;
  return result;
}

- (BOOL)isMatchingRequired
{
  return self->_minimumScore != 0.0 && -[PGMeaningfulEventTrait isActive](self, "isActive");
}

- (BOOL)isActive
{
  return 0;
}

- (id)debugDescription
{
  return -[PGMeaningfulEventTrait debugDescriptionWithMomentNode:](self, "debugDescriptionWithMomentNode:", 0);
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)minimumScore
{
  return self->_minimumScore;
}

- (void)setMinimumScore:(double)a3
{
  self->_minimumScore = a3;
}

@end
