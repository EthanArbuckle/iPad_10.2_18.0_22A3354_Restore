@implementation PMLGaussianSampler

- (PMLGaussianSampler)initWithMagnitude:(float)a3 seed:(unint64_t)a4
{
  PMLGaussianSampler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PMLGaussianSampler;
  v5 = -[PMLGaussianSampler init](&v7, sel_init);
  if (v5)
  {
    _PASRngSeed64();
    v5->_magnitude = a3;
  }
  return v5;
}

- (PMLGaussianSampler)initWithMagnitude:(float)a3
{
  PMLGaussianSampler *v4;
  PMLGaussianSampler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PMLGaussianSampler;
  v4 = -[PMLGaussianSampler init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    arc4random_buf(&v4->_rng, 0x10uLL);
    v5->_magnitude = a3;
  }
  return v5;
}

- (float)sample
{
  float magnitude;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;

  magnitude = self->_magnitude;
  v3 = self->_rng.s[0];
  v4 = self->_rng.s[1];
  do
  {
    v5 = v4 + v3;
    v6 = v4 ^ v3;
    v7 = __ROR8__(v3, 9) ^ (v6 << 14) ^ v6;
    v8 = (COERCE_DOUBLE((v5 >> 12) | 0x3FF0000000000000) + -1.0) * 2.0 + -1.0;
    v9 = v7 + __ROR8__(v6, 28);
    v10 = v7 ^ __ROR8__(v6, 28);
    v3 = __ROR8__(v7, 9) ^ (v10 << 14) ^ v10;
    v4 = __ROR8__(v10, 28);
    v11 = (COERCE_DOUBLE((v9 >> 12) | 0x3FF0000000000000) + -1.0) * 2.0 + -1.0;
    v12 = v11 * v11;
    v13 = v12 + v8 * v8;
  }
  while (v13 >= 1.0);
  self->_rng.s[0] = v3;
  self->_rng.s[1] = v4;
  return v8 * sqrt(log(v12 + v8 * v8) * -2.0 / v13) * magnitude;
}

@end
