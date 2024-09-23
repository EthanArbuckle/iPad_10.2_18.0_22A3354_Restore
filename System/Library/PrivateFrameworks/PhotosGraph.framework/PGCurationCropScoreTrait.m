@implementation PGCurationCropScoreTrait

- (PGCurationCropScoreTrait)initWithMinimumSquareCropScore:(double)a3
{
  PGCurationCropScoreTrait *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGCurationCropScoreTrait;
  result = -[PGCurationTrait init](&v5, sel_init);
  if (result)
    result->_minimumSquareCropScore = a3;
  return result;
}

- (BOOL)isActive
{
  return 1;
}

- (double)minimumSquareCropScore
{
  return self->_minimumSquareCropScore;
}

- (void)setMinimumSquareCropScore:(double)a3
{
  self->_minimumSquareCropScore = a3;
}

@end
