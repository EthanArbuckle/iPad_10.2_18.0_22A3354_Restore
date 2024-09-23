@implementation PGCurationTrait

- (PGCurationTrait)init
{
  PGCurationTrait *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGCurationTrait;
  result = -[PGCurationTrait init](&v3, sel_init);
  if (result)
    result->_minimumScore = 0.0;
  return result;
}

- (BOOL)isMatchingRequired
{
  return self->_minimumScore != 0.0 && -[PGCurationTrait isActive](self, "isActive");
}

- (BOOL)isActive
{
  return 0;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
