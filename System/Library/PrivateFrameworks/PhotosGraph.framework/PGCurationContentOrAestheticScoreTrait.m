@implementation PGCurationContentOrAestheticScoreTrait

- (PGCurationContentOrAestheticScoreTrait)initWithMinimumContentScore:(double)a3 minimumAestheticScore:(double)a4
{
  PGCurationContentOrAestheticScoreTrait *v6;
  PGCurationContentOrAestheticScoreTrait *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGCurationContentOrAestheticScoreTrait;
  v6 = -[PGCurationTrait init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PGCurationTrait setMinimumScore:](v6, "setMinimumScore:", a3);
    v7->_minimumAestheticScore = a4;
  }
  return v7;
}

- (BOOL)isActive
{
  return 1;
}

- (double)minimumAestheticScore
{
  return self->_minimumAestheticScore;
}

- (void)setMinimumAestheticScore:(double)a3
{
  self->_minimumAestheticScore = a3;
}

@end
