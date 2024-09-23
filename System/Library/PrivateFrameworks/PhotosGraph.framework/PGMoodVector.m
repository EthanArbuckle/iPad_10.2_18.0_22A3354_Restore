@implementation PGMoodVector

- (PGMoodVector)init
{
  PGMoodVector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGMoodVector;
  result = -[PGMoodVector init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_vector[8] = 0u;
    *(_OWORD *)&result->_vector[6] = 0u;
    *(_OWORD *)&result->_vector[4] = 0u;
    *(_OWORD *)&result->_vector[2] = 0u;
    *(_OWORD *)result->_vector = 0u;
  }
  return result;
}

- (PGMoodVector)initWithArray:(id)a3
{
  id v4;
  PGMoodVector *v5;
  unint64_t v6;
  void *v7;
  double v8;

  v4 = a3;
  v5 = -[PGMoodVector init](self, "init");
  if (v5 && objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v5->_vector[v6] = v8;

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)self->_vector;
  v5 = *(_OWORD *)&self->_vector[4];
  v6 = *(_OWORD *)&self->_vector[6];
  v7 = *(_OWORD *)&self->_vector[8];
  *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_vector[2];
  *(_OWORD *)((char *)result + 72) = v7;
  *(_OWORD *)((char *)result + 56) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint8x8_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a3 > 0x3FF || (v3 = (uint8x8_t)vcnt_s8((int8x8_t)a3), v3.i16[0] = vaddlv_u8(v3), v3.i32[0] != 1))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Index %lu is out of bounds [0..%lu]"), a3, 1023);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v8);
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_vector[__clz(__rbit32(a3))]);
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  unsigned int v4;
  uint8x8_t v5;
  double v7;

  if (a4 <= 0x3FF)
  {
    v4 = a4;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.i32[0] == 1)
    {
      objc_msgSend(a3, "doubleValue");
      self->_vector[__clz(__rbit32(v4))] = v7;
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  return a3 && memcmp(self->_vector, (char *)a3 + 8, 0x50uLL) == 0;
}

- (double)valueForMood:(unint64_t)a3
{
  double result;
  uint8x8_t v4;

  result = 9.22337204e18;
  if (a3 <= 0x3FF)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1)
      return self->_vector[__clz(__rbit32(a3))];
  }
  return result;
}

- (void)setValue:(double)a3 forMood:(unint64_t)a4
{
  uint8x8_t v4;

  if (a4 <= 0x3FF)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1)
      self->_vector[__clz(__rbit32(a4))] = a3;
  }
}

- (void)addValue:(double)a3 forMood:(unint64_t)a4
{
  uint8x8_t v4;
  double *v5;

  if (a4 <= 0x3FF)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1)
    {
      v5 = (double *)(&self->super.isa + __clz(__rbit32(a4)));
      v5[1] = v5[1] + a3;
    }
  }
}

- (void)addValue:(double)a3 forMoods:(unint64_t)a4
{
  uint64_t i;

  for (i = 0; i != 10; ++i)
  {
    if (((1 << i) & a4) != 0)
      self->_vector[i] = self->_vector[i] + a3;
  }
}

- (void)multiplyByWeight:(double)a3 forMood:(unint64_t)a4
{
  uint8x8_t v4;
  double *v5;

  if (a4 <= 0x3FF)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.i32[0] == 1)
    {
      v5 = (double *)(&self->super.isa + __clz(__rbit32(a4)));
      v5[1] = v5[1] * a3;
    }
  }
}

- (void)addMoodVector:(id)a3
{
  uint64_t i;

  if (a3)
  {
    for (i = 8; i != 88; i += 8)
      *(double *)((char *)&self->super.isa + i) = *(double *)((char *)a3 + i)
                                                + *(double *)((char *)&self->super.isa + i);
  }
}

- (void)substractMoodVector:(id)a3
{
  uint64_t i;

  if (a3)
  {
    for (i = 8; i != 88; i += 8)
      *(double *)((char *)&self->super.isa + i) = *(double *)((char *)&self->super.isa + i)
                                                - *(double *)((char *)a3 + i);
  }
}

- (void)multiplyMoodVector:(id)a3
{
  uint64_t i;

  if (a3)
  {
    for (i = 8; i != 88; i += 8)
      *(double *)((char *)&self->super.isa + i) = *(double *)((char *)a3 + i)
                                                * *(double *)((char *)&self->super.isa + i);
  }
}

- (void)multiplyByWeight:(double)a3
{
  uint64_t i;

  for (i = 8; i != 88; i += 16)
    *(float64x2_t *)((char *)&self->super.isa + i) = vmulq_n_f64(*(float64x2_t *)((char *)&self->super.isa + i), a3);
}

- (void)filterWithMoods:(unint64_t)a3
{
  uint64_t i;

  for (i = 0; i != 10; ++i)
  {
    if (((1 << i) & a3) == 0)
      self->_vector[i] = 0.0;
  }
}

- (void)normalize
{
  double v2;
  double v3;
  uint64_t i;
  double v5;
  double v6;
  float64x2_t v7;
  float64x2_t v8;
  uint64_t v9;
  float64x2_t v15;

  v2 = -1.79769313e308;
  v3 = 1.79769313e308;
  for (i = 8; i != 88; i += 8)
  {
    v5 = *(double *)((char *)&self->super.isa + i);
    if (v5 < v3)
      v3 = *(double *)((char *)&self->super.isa + i);
    if (v5 > v2)
      v2 = *(double *)((char *)&self->super.isa + i);
  }
  v6 = v2 - v3;
  if (v6 != 0.0)
  {
    v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v3, 0);
    v8 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v6, 0);
    v9 = 8;
    __asm { FMOV            V2.2D, #1.0 }
    do
    {
      v15 = vdivq_f64(vsubq_f64(*(float64x2_t *)((char *)&self->super.isa + v9), v7), v8);
      *(int8x16_t *)((char *)&self->super.isa + v9) = vbslq_s8((int8x16_t)vcgtq_f64(v15, _Q2), (int8x16_t)_Q2, vbicq_s8((int8x16_t)v15, (int8x16_t)vcltzq_f64(v15)));
      v9 += 16;
    }
    while (v9 != 88);
  }
}

- (unint64_t)moodsWithThreshold:(double)a3
{
  float64x2_t v3;
  int32x2_t v4;
  int8x16_t v5;
  uint64_t i;
  uint32x2_t v7;
  int8x16_t v8;

  v3 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0);
  v4 = (int32x2_t)0x100000000;
  v5 = 0uLL;
  for (i = 8; i != 88; i += 16)
  {
    v7 = vshl_u32((uint32x2_t)0x100000001, (uint32x2_t)v4);
    v8.i64[0] = v7.u32[0];
    v8.i64[1] = v7.u32[1];
    v5 = vorrq_s8(vandq_s8(v8, (int8x16_t)vcgeq_f64(*(float64x2_t *)((char *)&self->super.isa + i), v3)), v5);
    v4 = vadd_s32(v4, (int32x2_t)0x200000002);
  }
  return (unint64_t)vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL));
}

- (void)enumerateWithBlock:(id)a3
{
  uint64_t v4;
  double *vector;

  if (a3)
  {
    v4 = 0;
    vector = self->_vector;
    do
    {
      (*((void (**)(id, _QWORD, double))a3 + 2))(a3, (1 << v4), vector[v4]);
      ++v4;
    }
    while (v4 != 10);
  }
}

- (unint64_t)weightedRandomMoodWithSeed:(unint64_t)a3
{
  int v3;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  unsigned __int16 v12[3];

  v3 = a3;
  -[PGMoodVector sum](self, "sum");
  if (v5 == 0.0)
    return 0;
  v6 = v5;
  v12[0] = 13070;
  *(_DWORD *)&v12[1] = v3;
  v7 = erand48(v12);
  v8 = 0;
  v9 = v6 * v7;
  v10 = 0.0;
  while (1)
  {
    v10 = v10 + self->_vector[v8];
    if (v10 >= v9)
      break;
    if (++v8 == 10)
      return 0;
  }
  return (1 << v8);
}

- (double)sum
{
  double result;
  uint64_t i;

  result = 0.0;
  for (i = 8; i != 88; i += 8)
    result = result + *(double *)((char *)&self->super.isa + i);
  return result;
}

- (id)moodArray
{
  void *v3;
  uint64_t i;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 8; i != 88; i += 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)((char *)&self->super.isa + i));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 8; i != 88; i += 8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)((char *)&self->super.isa + i));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "length");
    if (v7 >= 4)
      v8 = 4;
    else
      v8 = v7;
    objc_msgSend(v6, "substringToIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@]"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
