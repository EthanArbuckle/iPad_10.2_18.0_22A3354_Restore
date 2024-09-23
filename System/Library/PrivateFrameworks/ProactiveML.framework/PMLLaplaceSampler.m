@implementation PMLLaplaceSampler

- (PMLLaplaceSampler)initWithMagnitude:(float)a3 seed:(unint64_t)a4
{
  PMLLaplaceSampler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PMLLaplaceSampler;
  v5 = -[PMLLaplaceSampler init](&v7, sel_init);
  if (v5)
  {
    _PASRngSeed64();
    v5->_magnitude = a3;
  }
  return v5;
}

- (PMLLaplaceSampler)initWithMagnitude:(float)a3
{
  PMLLaplaceSampler *v4;
  PMLLaplaceSampler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PMLLaplaceSampler;
  v4 = -[PMLLaplaceSampler init](&v7, sel_init);
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
  double v7;
  float v8;

  magnitude = self->_magnitude;
  v3 = self->_rng.s[0];
  v4 = self->_rng.s[1];
  v5 = v4 + v3;
  v6 = v4 ^ v3;
  self->_rng.s[0] = __ROR8__(v3, 9) ^ (v6 << 14) ^ v6;
  self->_rng.s[1] = __ROR8__(v6, 28);
  v7 = COERCE_DOUBLE((v5 >> 12) | 0x3FF0000000000000) + -1.0 + -0.5;
  v8 = v7;
  LODWORD(v3) = v8 > 0.0;
  LODWORD(v6) = v8 < 0.0;
  return log(fabs(v7) * -2.0 + 1.0) * (double)((int)v3 - (int)v6) * magnitude;
}

@end
