@implementation PCMatrix44Double

- (PCMatrix44Double)initWithPCMatrix:(const void *)a3
{
  PCMatrix44Double *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PCMatrix44Double;
  result = -[PCMatrix44Double init](&v11, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3;
    v6 = *((_OWORD *)a3 + 1);
    v7 = *((_OWORD *)a3 + 2);
    *(_OWORD *)&result->_m[1][2] = *((_OWORD *)a3 + 3);
    *(_OWORD *)&result->_m[1][0] = v7;
    *(_OWORD *)&result->_m[0][2] = v6;
    *(_OWORD *)&result->_m[0][0] = v5;
    v8 = *((_OWORD *)a3 + 4);
    v9 = *((_OWORD *)a3 + 5);
    v10 = *((_OWORD *)a3 + 6);
    *(_OWORD *)&result->_m[3][2] = *((_OWORD *)a3 + 7);
    *(_OWORD *)&result->_m[3][0] = v10;
    *(_OWORD *)&result->_m[2][2] = v9;
    *(_OWORD *)&result->_m[2][0] = v8;
    result->_pcMatrix = result->_m;
  }
  return result;
}

- (PCMatrix44Double)init
{
  PCMatrix44Double *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCMatrix44Double;
  result = -[PCMatrix44Double init](&v3, sel_init);
  if (result)
  {
    result->_m[0][0] = 1.0;
    result->_m[2][2] = 1.0;
    result->_m[1][1] = 1.0;
    *(_OWORD *)&result->_m[0][1] = 0u;
    *(_OWORD *)&result->_m[0][3] = 0u;
    *(_OWORD *)&result->_m[1][2] = 0u;
    *(_OWORD *)&result->_m[2][0] = 0u;
    *(_OWORD *)&result->_m[2][3] = 0u;
    *(_OWORD *)&result->_m[3][1] = 0u;
    result->_m[3][3] = 1.0;
    result->_pcMatrix = result->_m;
  }
  return result;
}

- (PCMatrix44Double)initWithDoubles:(double)a3[16] external:(BOOL)a4
{
  PCMatrix44Double *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PCMatrix44Double;
  result = -[PCMatrix44Double init](&v12, sel_init, a3, a4);
  if (result)
  {
    result->_m[0][0] = 1.0;
    result->_m[2][2] = 1.0;
    result->_m[1][1] = 1.0;
    *(_OWORD *)&result->_m[0][1] = 0u;
    *(_OWORD *)&result->_m[0][3] = 0u;
    *(_OWORD *)&result->_m[1][2] = 0u;
    *(_OWORD *)&result->_m[2][0] = 0u;
    *(_OWORD *)&result->_m[2][3] = 0u;
    *(_OWORD *)&result->_m[3][1] = 0u;
    result->_m[3][3] = 1.0;
    result->_pcMatrix = result->_m;
    v6 = *(_OWORD *)a3;
    v7 = *((_OWORD *)a3 + 1);
    v8 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&result->_m[1][0] = *((_OWORD *)a3 + 2);
    *(_OWORD *)&result->_m[1][2] = v8;
    *(_OWORD *)&result->_m[0][0] = v6;
    *(_OWORD *)&result->_m[0][2] = v7;
    v9 = *((_OWORD *)a3 + 4);
    v10 = *((_OWORD *)a3 + 5);
    v11 = *((_OWORD *)a3 + 7);
    *(_OWORD *)&result->_m[3][0] = *((_OWORD *)a3 + 6);
    *(_OWORD *)&result->_m[3][2] = v11;
    *(_OWORD *)&result->_m[2][0] = v9;
    *(_OWORD *)&result->_m[2][2] = v10;
  }
  return result;
}

- (PCMatrix44Double)initWithDoubles:(double)a3[16]
{
  return -[PCMatrix44Double initWithDoubles:external:](self, "initWithDoubles:external:", a3, 0);
}

- (PCMatrix44Double)initWithArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v5 = 0;
  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  do
  {
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v5, v8, v9, v10, v11, v12, v13, v14, v15), "doubleValue");
    *((_QWORD *)&v8 + v5++) = v6;
  }
  while (v5 != 16);
  return -[PCMatrix44Double initWithDoubles:](self, "initWithDoubles:", &v8);
}

+ (uint64_t)matrixWithSIMDFloat4x4:(double)a3
{
  return objc_msgSend([a1 alloc], "initWithSIMDFloat4x4:", a2, a3, a4, a5);
}

+ (uint64_t)matrixWithSIMDDouble4x4:(_OWORD *)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[8];

  v4 = [a1 alloc];
  v5 = a3[5];
  v10[4] = a3[4];
  v10[5] = v5;
  v6 = a3[7];
  v10[6] = a3[6];
  v10[7] = v6;
  v7 = a3[1];
  v10[0] = *a3;
  v10[1] = v7;
  v8 = a3[3];
  v10[2] = a3[2];
  v10[3] = v8;
  return objc_msgSend(v4, "initWithSIMDDouble4x4:", v10);
}

- (void)initWithSIMDFloat4x4:(double)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a1, "init");
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setSIMDFloat4x4:", a2, a3, a4, a5);
  return v6;
}

- (void)initWithSIMDDouble4x4:(_OWORD *)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[8];

  v4 = (void *)objc_msgSend(a1, "init");
  v5 = v4;
  if (v4)
  {
    v6 = a3[5];
    v11[4] = a3[4];
    v11[5] = v6;
    v7 = a3[7];
    v11[6] = a3[6];
    v11[7] = v7;
    v8 = a3[1];
    v11[0] = *a3;
    v11[1] = v8;
    v9 = a3[3];
    v11[2] = a3[2];
    v11[3] = v9;
    objc_msgSend(v4, "setSIMDDouble4x4:", v11);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMatrix44Double)initWithCoder:(id)a3
{
  PCMatrix44Double *result;
  uint64_t v5;

  v5 = 0;
  result = (PCMatrix44Double *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("bytes"), &v5);
  if (result)
    return -[PCMatrix44Double initWithDoubles:external:](self, "initWithDoubles:external:", result, 1);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  _OWORD v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  -[PCMatrix44Double getDoubles:](self, "getDoubles:", v4);
  objc_msgSend(a3, "encodeBytes:length:forKey:", v4, 128, CFSTR("bytes"));
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PCMatrix44Double;
  -[PCMatrix44Double dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPCMatrix:", self->_pcMatrix);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;
  BOOL v6;
  char *pcMatrix;
  uint64_t v8;
  uint64_t i;
  BOOL v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = 0;
  v6 = 0;
  pcMatrix = (char *)self->_pcMatrix;
  v8 = *((_QWORD *)a3 + 17);
  while (2)
  {
    for (i = 0; i != 32; i += 8)
    {
      if (vabdd_f64(*(double *)&pcMatrix[i], *(double *)(v8 + i)) >= 0.0000001)
        return v6;
    }
    v6 = v5 > 2;
    v8 += 32;
    pcMatrix += 32;
    v10 = 1;
    if (++v5 != 4)
      continue;
    break;
  }
  return v10;
}

- (BOOL)isEqualToPCMatrix44Double:(id)a3
{
  unint64_t v3;
  BOOL v4;
  char *pcMatrix;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v3 = 0;
    v4 = 0;
    pcMatrix = (char *)self->_pcMatrix;
    v6 = *((_QWORD *)a3 + 17);
LABEL_3:
    v7 = 0;
    while (vabdd_f64(*(double *)&pcMatrix[v7], *(double *)(v6 + v7)) < 0.0000001)
    {
      v7 += 8;
      if (v7 == 32)
      {
        v4 = v3 > 2;
        v6 += 32;
        pcMatrix += 32;
        if (++v3 != 4)
          goto LABEL_3;
        return 1;
      }
    }
  }
  else
  {
    return 0;
  }
  return v4;
}

- (unint64_t)hash
{
  _OWORD v3[8];
  unsigned __int8 md[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, sizeof(v3));
  -[PCMatrix44Double getDoubles:](self, "getDoubles:", v3);
  CC_MD5(v3, 0x80u, md);
  return *(_QWORD *)md;
}

- (id)description
{
  void *v2;
  uint64_t i;
  const char *v4;
  _OWORD v6[7];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  -[PCMatrix44Double getDoubles:](self, "getDoubles:", v6);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("(\n"));
  for (i = 0; i != 15; ++i)
  {
    if ((~(_BYTE)i & 3) != 0)
      v4 = "";
    else
      v4 = "\n";
    objc_msgSend(v2, "appendFormat:", CFSTR("%f,%s"), *((_QWORD *)v6 + i), v4);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("%f\n)"), *((_QWORD *)&v7 + 1));
  return v2;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>%@"), NSStringFromClass(v4), self, -[PCMatrix44Double description](self, "description"));
}

- (id)compactDescription
{
  id v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  -[PCMatrix44Double getDoubles:](self, "getDoubles:", &v4);
  v2 = objc_alloc(MEMORY[0x1E0CB37A0]);
  return (id)objc_msgSend(v2, "initWithFormat:", CFSTR("( %f,%f,%f,%f,,%f,%f,%f,%f,,%f,%f,%f,%f,,%f,%f,%f,%f)"), v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)extendedDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (self)
    -[PCMatrix44Double transformInfo](self, "transformInfo");
  v14 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  return (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("translation:\n\tx: %@\n\ty: %@\n\tz: %@\nscale:\n\tx: %@\n\ty: %@\n\tz: %@\nrotation:\n\tx: %.2f° (%@)\n\ty: %.2f° (%@)\n\tz: %.2f° (%@)\nshear:\n\tx: %@\n\ty: %@\nmatrix:\n\t%@"), v13, v12, v3, v4, v5, v6, 0.0 * 180.0 / 3.14159265, v7, 0.0 * 180.0 / 3.14159265, v8, 0.0 * 180.0 / 3.14159265, v9, v10, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0), objc_msgSend(-[PCMatrix44Double description](self, "description"),
                 "stringByReplacingOccurrencesOfString:withString:",
                 CFSTR("\n"),
                 CFSTR("\n\t")));
}

- (void)pcMatrix
{
  return self->_pcMatrix;
}

- (double)doubleValueAtRow:(unsigned int)a3 col:(unsigned int)a4
{
  return *((double *)self->_pcMatrix + 4 * (int)a3 + (int)a4);
}

- (void)setDoubleValue:(double)a3 atRow:(unsigned int)a4 col:(unsigned int)a5
{
  *((double *)self->_pcMatrix + 4 * (int)a4 + (int)a5) = a3;
}

- (void)getDoubles:(double)a3[16]
{
  __int128 *pcMatrix;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  pcMatrix = (__int128 *)self->_pcMatrix;
  v4 = *pcMatrix;
  v5 = pcMatrix[1];
  v6 = pcMatrix[3];
  *((_OWORD *)a3 + 2) = pcMatrix[2];
  *((_OWORD *)a3 + 3) = v6;
  *(_OWORD *)a3 = v4;
  *((_OWORD *)a3 + 1) = v5;
  v7 = pcMatrix[4];
  v8 = pcMatrix[5];
  v9 = pcMatrix[7];
  *((_OWORD *)a3 + 6) = pcMatrix[6];
  *((_OWORD *)a3 + 7) = v9;
  *((_OWORD *)a3 + 4) = v7;
  *((_OWORD *)a3 + 5) = v8;
}

- (void)setDoubles:(double)a3[16]
{
  _OWORD *pcMatrix;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  pcMatrix = self->_pcMatrix;
  v4 = *(_OWORD *)a3;
  v5 = *((_OWORD *)a3 + 1);
  v6 = *((_OWORD *)a3 + 3);
  pcMatrix[2] = *((_OWORD *)a3 + 2);
  pcMatrix[3] = v6;
  *pcMatrix = v4;
  pcMatrix[1] = v5;
  v7 = *((_OWORD *)a3 + 4);
  v8 = *((_OWORD *)a3 + 5);
  v9 = *((_OWORD *)a3 + 7);
  pcMatrix[6] = *((_OWORD *)a3 + 6);
  pcMatrix[7] = v9;
  pcMatrix[4] = v7;
  pcMatrix[5] = v8;
}

- (id)array
{
  double *pcMatrix;
  void *v4;
  uint64_t i;
  double v6;
  void *v7;
  id v8;
  uint64_t j;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[PCMatrix44Double array]::onceToken != -1)
    dispatch_once(&-[PCMatrix44Double array]::onceToken, &__block_literal_global_55);
  pcMatrix = (double *)self->_pcMatrix;
  if (PCMatrix44Tmpl<double>::isIdentity(pcMatrix) && pcMatrix[15] == 1.0)
    return (id)-[PCMatrix44Double array]::sIdentityArray;
  for (i = 0; i != 16; ++i)
  {
    v6 = pcMatrix[i];
    if (v6 == 0.0)
    {
      v7 = (void *)-[PCMatrix44Double array]::sNSNumberZero;
LABEL_13:
      v8 = v7;
      goto LABEL_14;
    }
    if (v6 == 1.0)
    {
      v7 = (void *)-[PCMatrix44Double array]::sNSNumberOne;
      goto LABEL_13;
    }
    if (v6 == -1.0)
    {
      v7 = (void *)-[PCMatrix44Double array]::sNSNumberNeg1;
      goto LABEL_13;
    }
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", pcMatrix[i]);
LABEL_14:
    *(_QWORD *)&v11[i * 8] = v8;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 16);
  for (j = 0; j != 128; j += 8)

  return v4;
}

uint64_t __25__PCMatrix44Double_array__block_invoke()
{
  id v0;
  uint64_t result;

  -[PCMatrix44Double array]::sNSNumberOne = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 1.0);
  -[PCMatrix44Double array]::sNSNumberZero = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 0.0);
  -[PCMatrix44Double array]::sNSNumberNeg1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", -1.0);
  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  result = objc_msgSend(v0, "initWithObjects:", -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberOne, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberOne, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberZero, -[PCMatrix44Double array]::sNSNumberOne, 0);
  -[PCMatrix44Double array]::sIdentityArray = result;
  return result;
}

- (double)SIMDFloat4x4
{
  uint64_t v1;
  int32x4_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  double result;

  v1 = *(_QWORD *)(a1 + 136);
  v2 = *(int32x4_t *)v1;
  *(float32x2_t *)v2.i8 = vcvt_f32_f64(*(float64x2_t *)v1);
  v3 = *(float64x2_t *)(v1 + 32);
  *(float32x2_t *)&v3.f64[0] = vcvt_f32_f64(v3);
  v4 = *(float64x2_t *)(v1 + 64);
  *(float32x2_t *)&v4.f64[0] = vcvt_f32_f64(v4);
  v5 = *(float64x2_t *)(v1 + 96);
  *(float32x2_t *)&v5.f64[0] = vcvt_f32_f64(v5);
  *(_QWORD *)&result = vzip1q_s32(vzip1q_s32(v2, (int32x4_t)v4), vzip1q_s32((int32x4_t)v3, (int32x4_t)v5)).u64[0];
  return result;
}

- (double)setSIMDFloat4x4:(int8x16_t)a3
{
  uint64_t v5;
  int8x8_t v6;
  float32x2_t v7;
  float32x2_t v8;
  int32x2_t v9;
  int32x2_t v10;
  double result;

  v5 = *(_QWORD *)(a1 + 136);
  *(double *)v5 = *(float *)a2.i32;
  *(double *)(v5 + 8) = *(float *)a3.i32;
  *(double *)(v5 + 16) = *(float *)a4.i32;
  v6 = (int8x8_t)vextq_s8(a2, a2, 8uLL).u64[0];
  v7 = (float32x2_t)vext_s8(*(int8x8_t *)a5.i8, v6, 4uLL);
  v8.i32[0] = vextq_s8(a5, a5, 8uLL).u32[0];
  a5.i32[1] = a2.i32[1];
  *(float64x2_t *)(v5 + 24) = vcvtq_f64_f32(*(float32x2_t *)a5.i8);
  *(float64x2_t *)(v5 + 40) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a3.i8, *(int32x2_t *)a4.i8));
  *(float64x2_t *)(v5 + 56) = vcvtq_f64_f32(v7);
  v9 = (int32x2_t)vextq_s8(a4, a4, 8uLL).u64[0];
  v10 = (int32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  *(float64x2_t *)(v5 + 72) = vcvtq_f64_f32((float32x2_t)vzip1_s32(v10, v9));
  v8.i32[1] = v6.i32[1];
  *(float64x2_t *)(v5 + 88) = vcvtq_f64_f32(v8);
  *(float64x2_t *)(v5 + 104) = vcvtq_f64_f32((float32x2_t)vzip2_s32(v10, v9));
  result = *(float *)&a5.i32[3];
  *(double *)(v5 + 120) = *(float *)&a5.i32[3];
  return result;
}

- (__n128)SIMDDouble4x4
{
  unint64_t *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;

  v2 = *(unint64_t **)(a1 + 136);
  result.n128_u64[0] = *v2;
  *(_QWORD *)&v3 = v2[1];
  *(_QWORD *)&v4 = v2[2];
  *(_QWORD *)&v5 = v2[3];
  *(_QWORD *)&v6 = v2[8];
  *(_QWORD *)&v7 = v2[9];
  *(_QWORD *)&v8 = v2[10];
  *(_QWORD *)&v9 = v2[11];
  result.n128_u64[1] = v2[4];
  *((_QWORD *)&v6 + 1) = v2[12];
  *((_QWORD *)&v3 + 1) = v2[5];
  *((_QWORD *)&v7 + 1) = v2[13];
  *((_QWORD *)&v4 + 1) = v2[6];
  *((_QWORD *)&v8 + 1) = v2[14];
  *((_QWORD *)&v5 + 1) = v2[7];
  *((_QWORD *)&v9 + 1) = v2[15];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v7;
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 80) = v8;
  *(_OWORD *)(a2 + 96) = v5;
  *(_OWORD *)(a2 + 112) = v9;
  return result;
}

- (double)setSIMDDouble4x4:(uint64_t)a3
{
  uint64_t v3;
  double result;

  v3 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)v3 = *(_QWORD *)a3;
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(a3 + 64);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(a3 + 96);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(a3 + 72);
  *(_QWORD *)(v3 + 56) = *(_QWORD *)(a3 + 104);
  *(_QWORD *)(v3 + 64) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(v3 + 72) = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(a3 + 80);
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(a3 + 112);
  *(_QWORD *)(v3 + 96) = *(_QWORD *)(a3 + 24);
  *(_QWORD *)(v3 + 104) = *(_QWORD *)(a3 + 56);
  *(_QWORD *)(v3 + 112) = *(_QWORD *)(a3 + 88);
  result = *(double *)(a3 + 120);
  *(double *)(v3 + 120) = result;
  return result;
}

- (BOOL)isIdentity
{
  return PCMatrix44Tmpl<double>::isIdentity((double *)self->_pcMatrix);
}

- (void)makeIdentity
{
  char *pcMatrix;

  pcMatrix = (char *)self->_pcMatrix;
  *((_QWORD *)pcMatrix + 15) = 0x3FF0000000000000;
  *((_QWORD *)pcMatrix + 10) = 0x3FF0000000000000;
  *((_QWORD *)pcMatrix + 5) = 0x3FF0000000000000;
  *(_QWORD *)pcMatrix = 0x3FF0000000000000;
  *(_OWORD *)(pcMatrix + 8) = 0u;
  *(_OWORD *)(pcMatrix + 24) = 0u;
  *((_OWORD *)pcMatrix + 3) = 0u;
  *((_OWORD *)pcMatrix + 4) = 0u;
  *(_OWORD *)(pcMatrix + 88) = 0u;
  *(_OWORD *)(pcMatrix + 104) = 0u;
}

- (void)leftTranslateX:(double)a3 translateY:(double)a4 translateZ:(double)a5
{
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)self->_pcMatrix, *(float64x2_t *)&a3, a4, a5);
}

- (void)rightTranslateX:(double)a3 translateY:(double)a4 translateZ:(double)a5
{
  PCMatrix44Tmpl<double>::rightTranslate((double *)self->_pcMatrix, a3, a4, a5);
}

- (void)leftScaleX:(double)a3 scaleY:(double)a4 scaleZ:(double)a5
{
  PCMatrix44Tmpl<double>::leftScale((float64x2_t *)self->_pcMatrix, a3, a4, a5);
}

- (void)rightScaleX:(double)a3 scaleY:(double)a4 scaleZ:(double)a5
{
  PCMatrix44Tmpl<double>::rightScale((double *)self->_pcMatrix, a3, a4, a5);
}

- (void)leftShearX:(double)a3 shearY:(double)a4
{
  PCMatrix44Tmpl<double>::leftShear((double *)self->_pcMatrix, a3, a4);
}

- (void)rightShearX:(double)a3 shearY:(double)a4
{
  PCMatrix44Tmpl<double>::rightShear((float64x2_t *)self->_pcMatrix, a3, a4);
}

- (void)leftRotate:(double)a3 axis:(int)a4
{
  PCMatrix44Tmpl<double>::leftRotate((double *)self->_pcMatrix, a4, a3);
}

- (void)rightRotate:(double)a3 axis:(int)a4
{
  PCMatrix44Tmpl<double>::rightRotate((double *)self->_pcMatrix, a4, a3);
}

- (BOOL)invert
{
  return PCMatrix44Tmpl<double>::invert((double *)self->_pcMatrix, (double *)self->_pcMatrix, 0.0);
}

- (void)transpose
{
  PCMatrix44Tmpl<double>::transpose((uint64_t)self->_pcMatrix);
}

- (BOOL)invert2D
{
  return PCMatrix44Tmpl<double>::planarInverseZ((uint64_t)self->_pcMatrix, (double *)self->_pcMatrix, 0.0);
}

- (CGRect)transformRect:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect v7;
  CGRect result;

  v7 = a3;
  PCMatrix44Tmpl<double>::transformRect<double>((double *)self->_pcMatrix, &v7.origin.x, (uint64_t)&v7);
  y = v7.origin.y;
  x = v7.origin.x;
  height = v7.size.height;
  width = v7.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  double *pcMatrix;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  pcMatrix = (double *)self->_pcMatrix;
  v4 = pcMatrix[15] + a3.x * pcMatrix[12] + a3.y * pcMatrix[13];
  v5 = (pcMatrix[3] + a3.x * *pcMatrix + a3.y * pcMatrix[1]) / v4;
  v6 = (pcMatrix[7] + a3.x * pcMatrix[4] + a3.y * pcMatrix[5]) / v4;
  v7 = v5;
  result.y = v6;
  result.x = v7;
  return result;
}

- ($360FFE100060A5171365411B823D6A0E)transformInfo
{
  $360FFE100060A5171365411B823D6A0E *result;
  _OWORD v10[3];
  int v11;
  __int128 v12;
  _BYTE v13[24];

  memset(v10, 0, sizeof(v10));
  v11 = 4;
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  result = ($360FFE100060A5171365411B823D6A0E *)PCMatrix44Tmpl<double>::getTransformation((__int128 *)self->_pcMatrix, (uint64_t)v10);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var6 = _Q0;
  retstr->var8 = 1.0;
  if ((_DWORD)result)
  {
    *(_OWORD *)&retstr->var0 = v10[0];
    retstr->var2 = *(double *)&v10[1];
    *(_OWORD *)&retstr->var3 = v12;
    retstr->var5 = *(double *)v13;
    *(_OWORD *)&retstr->var6 = *(_OWORD *)((char *)&v10[1] + 8);
    retstr->var8 = *((double *)&v10[2] + 1);
    *(_OWORD *)&retstr->var9 = *(_OWORD *)&v13[8];
  }
  return result;
}

- (void)scaleSizeX:(double)a3 sizeY:(double)a4 sizeZ:(double)a5 scaledSizeX:(double *)a6 scaledSizeY:(double *)a7 scaledSizeZ:(double *)a8
{
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v17 = 4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  PCMatrix44Tmpl<double>::getTransformation((__int128 *)self->_pcMatrix, (uint64_t)&v14);
  if (a6)
    *a6 = *((double *)&v15 + 1) * a3;
  if (a7)
    *a7 = *(double *)&v16 * a4;
  if (a8)
    *a8 = *((double *)&v16 + 1) * a5;
}

- (void)leftMult:(id)a3
{
  PCMatrix44Tmpl<double>::leftMult((uint64_t)self->_pcMatrix, (double *)objc_msgSend(a3, "pcMatrix"));
}

- (void)rightMult:(id)a3
{
  PCMatrix44Tmpl<double>::rightMult((uint64_t)self->_pcMatrix, (double *)objc_msgSend(a3, "pcMatrix"));
}

- (void)leftFlipAboutY:(double)a3
{
  -[PCMatrix44Double leftTranslateX:translateY:translateZ:](self, "leftTranslateX:translateY:translateZ:", 0.0, -a3, 0.0);
  -[PCMatrix44Double leftScaleX:scaleY:scaleZ:](self, "leftScaleX:scaleY:scaleZ:", 1.0, -1.0, 1.0);
  -[PCMatrix44Double leftTranslateX:translateY:translateZ:](self, "leftTranslateX:translateY:translateZ:", 0.0, a3, 0.0);
}

- (id)newTransformTo:(id)a3
{
  void *v6;

  if (!a3 || -[PCMatrix44Double isEqual:](self, "isEqual:"))
    return (id)objc_opt_new();
  v6 = (void *)-[PCMatrix44Double copy](self, "copy");
  objc_msgSend(v6, "invert");
  objc_msgSend(v6, "leftMult:", a3);
  return v6;
}

- (id)newPlanarTransformTo:(id)a3
{
  void *v6;

  if (!a3 || -[PCMatrix44Double isEqual:](self, "isEqual:"))
    return (id)objc_opt_new();
  v6 = (void *)-[PCMatrix44Double copy](self, "copy");
  objc_msgSend(v6, "invert2D");
  objc_msgSend(v6, "leftMult:", a3);
  return v6;
}

@end
