@implementation PFIncreasingNumberGenerator

- (PFIncreasingNumberGenerator)init
{
  return -[PFIncreasingNumberGenerator initWithSeed:](self, "initWithSeed:", 0);
}

- (PFIncreasingNumberGenerator)initWithSeed:(unint64_t)a3
{
  PFIncreasingNumberGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFIncreasingNumberGenerator;
  v4 = -[PFIncreasingNumberGenerator init](&v6, sel_init);
  -[PFIncreasingNumberGenerator setSeed:](v4, "setSeed:", a3);
  return v4;
}

- (unint64_t)nextUnsignedIntegerLessThan:(unint64_t)a3
{
  unint64_t seed;

  if (!a3)
    return 0;
  seed = self->_seed;
  self->_seed = seed + 1;
  return seed % a3;
}

- (unint64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(unint64_t)a3
{
  self->_seed = a3;
}

@end
