@implementation RMDMersenneTwisterRandomSource

- (RMDMersenneTwisterRandomSource)init
{
  id v4;
  uint64_t bytes;

  bytes = 0;
  if (SecRandomCopyBytes(0, 8uLL, &bytes))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("failed to generate secure random bytes"), MEMORY[0x1E0C9AA70]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return -[RMDMersenneTwisterRandomSource initWithSeed:](self, "initWithSeed:", bytes);
}

- (RMDMersenneTwisterRandomSource)initWithSeed:(unint64_t)a3
{
  RMDMersenneTwisterRandomSource *v4;
  RMDMersenneTwisterRandomSource *v5;
  uint64_t i;
  _QWORD __src[313];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RMDMersenneTwisterRandomSource;
  v4 = -[RMDRandomSource init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_seed = a3;
    __src[0] = a3;
    for (i = 1; i != 312; ++i)
    {
      a3 = i + 0x5851F42D4C957F2DLL * (a3 ^ (a3 >> 62));
      __src[i] = a3;
    }
    __src[312] = 0;
    memcpy(&v4->_engine, __src, sizeof(v4->_engine));
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSeed:", self->_seed);
  memcpy((void *)(v4 + 16), &self->_engine, 0x9C8uLL);
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RMDMersenneTwisterRandomSource;
  -[RMDRandomSource encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (unint64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(unint64_t)a3
{
  uint64_t i;

  self->_seed = a3;
  self->_engine.__x_[0] = a3;
  for (i = 1; i != 312; ++i)
  {
    a3 = i + 0x5851F42D4C957F2DLL * (a3 ^ (a3 >> 62));
    self->_engine.__x_[i] = a3;
  }
  self->_engine.__i_ = 0;
}

- (unint64_t)nextBits:(int)a3
{
  return std::mersenne_twister_engine<unsigned long long,64ul,312ul,156ul,31ul,13043109905998158313ull,29ul,6148914691236517205ull,17ul,8202884508482404352ull,37ul,18444473444759240704ull,43ul,6364136223846793005ull>::operator()((std::mersenne_twister_engine<unsigned long long, 64, 312, 156, 31, 13043109905998158313, 29, 6148914691236517205, 17, 8202884508482404352, 37, 18444473444759240704, 43, 6364136223846793005> *)&self->_engine) >> -(char)a3;
}

- (int64_t)nextInt
{
  return (int)-[RMDMersenneTwisterRandomSource nextBits:](self, "nextBits:", 32);
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  unint64_t v5;
  unint64_t result;
  unsigned int v7;

  v5 = a3 - 1;
  if ((a3 & (a3 - 1)) == 0)
    return (-[RMDMersenneTwisterRandomSource nextBits:](self, "nextBits:", 32) * a3) >> 32;
  do
  {
    v7 = -[RMDMersenneTwisterRandomSource nextBits:](self, "nextBits:", 32);
    result = v7 % a3;
  }
  while (v5 + v7 < result);
  return result;
}

- (float)nextUniform
{
  return (float)-[RMDMersenneTwisterRandomSource nextBits:](self, "nextBits:", 24) / 16777000.0;
}

- (BOOL)nextBool
{
  return -[RMDMersenneTwisterRandomSource nextBits:](self, "nextBits:", 1) != 0;
}

- (id).cxx_construct
{
  unint64_t v2;
  uint64_t i;

  v2 = 5489;
  *((_QWORD *)self + 2) = 5489;
  for (i = 1; i != 312; ++i)
  {
    v2 = i + 0x5851F42D4C957F2DLL * (v2 ^ (v2 >> 62));
    *((_QWORD *)self + i + 2) = v2;
  }
  *((_QWORD *)self + 314) = 0;
  return self;
}

@end
