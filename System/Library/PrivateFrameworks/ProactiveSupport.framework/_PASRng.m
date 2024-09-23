@implementation _PASRng

- (_PASRng)init
{
  _PASRng *v2;
  _PASRng *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PASRng;
  v2 = -[_PASRng init](&v5, sel_init);
  v3 = v2;
  if (v2)
    arc4random_buf(&v2->_state, 0x10uLL);
  return v3;
}

- (_PASRng)initWithSeed:(unint64_t)a3
{
  _PASRng *result;
  unint64_t v5;
  unint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PASRng;
  result = -[_PASRng init](&v7, sel_init);
  if (result)
  {
    v5 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * ((a3 | 1) ^ (a3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * ((a3 | 1) ^ (a3 >> 30))) >> 27));
    v6 = 0x63660277528772BBLL
       * ((0x3CD0EB9D47532DFBLL * ((a3 | 1) ^ (a3 >> 29))) ^ ((0x3CD0EB9D47532DFBLL * ((a3 | 1) ^ (a3 >> 29))) >> 26));
    result->_state.s[0] = v5 ^ (v5 >> 31);
    result->_state.s[1] = v6 ^ (v6 >> 33);
  }
  return result;
}

- (unint64_t)next
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = self->_state.s[0];
  v3 = self->_state.s[1];
  v4 = v3 + v2;
  v5 = v3 ^ v2;
  self->_state.s[0] = __ROR8__(v2, 9) ^ (v5 << 14) ^ v5;
  self->_state.s[1] = __ROR8__(v5, 28);
  return v4;
}

- (float)nextFloat
{
  unint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;

  v2 = self->_state.s[0];
  v3 = self->_state.s[1];
  v4 = v3 + v2;
  v5 = v3 ^ v2;
  self->_state.s[0] = __ROR8__(v2, 9) ^ (v5 << 14) ^ v5;
  self->_state.s[1] = __ROR8__(v5, 28);
  return COERCE_FLOAT((v4 >> 9) | 0x3F800000) + -1.0;
}

- (double)nextDouble
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = self->_state.s[0];
  v3 = self->_state.s[1];
  v4 = v3 + v2;
  v5 = v3 ^ v2;
  self->_state.s[0] = __ROR8__(v2, 9) ^ (v5 << 14) ^ v5;
  self->_state.s[1] = __ROR8__(v5, 28);
  return COERCE_DOUBLE((v4 >> 12) | 0x3FF0000000000000) + -1.0;
}

@end
