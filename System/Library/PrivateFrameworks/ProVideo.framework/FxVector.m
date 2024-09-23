@implementation FxVector

+ (id)vectorWithValues:(const double *)a3 count:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValues:count:", a3, a4);
}

- (FxVector)initWithCIVector:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t i;
  uint64_t v9;
  FxVector *v10;

  v5 = objc_msgSend(a3, "count");
  v6 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  if (v6)
  {
    v7 = v6;
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(a3, "valueAtIndex:", i);
        v7[i] = v9;
      }
    }
    v10 = -[FxVector initWithValues:count:](self, "initWithValues:count:", v7, v5);
    free(v7);
    return v10;
  }
  else
  {

    return 0;
  }
}

+ (id)vectorWithCIVector:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCIVector:", a3);
}

+ (id)vectorWithX:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithX:", a3);
}

+ (id)vectorWithX:(double)a3 Y:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithX:Y:", a3, a4);
}

+ (id)vectorWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithX:Y:Z:", a3, a4, a5);
}

+ (id)vectorWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithX:Y:Z:W:", a3, a4, a5, a6);
}

+ (id)vectorWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", a3);
}

- (FxVector)init
{
  return -[FxVector initWithValues:count:](self, "initWithValues:count:", 0, 0);
}

- (FxVector)initWithX:(double)a3
{
  double v4;

  v4 = a3;
  return -[FxVector initWithValues:count:](self, "initWithValues:count:", &v4, 1);
}

- (FxVector)initWithX:(double)a3 Y:(double)a4
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  *(double *)v5 = a3;
  *(double *)&v5[1] = a4;
  return -[FxVector initWithValues:count:](self, "initWithValues:count:", v5, 2);
}

- (FxVector)initWithX:(double)a3 Y:(double)a4 Z:(double)a5
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  *(double *)v6 = a3;
  *(double *)&v6[1] = a4;
  *(double *)&v6[2] = a5;
  return -[FxVector initWithValues:count:](self, "initWithValues:count:", v6, 3);
}

- (FxVector)initWithX:(double)a3 Y:(double)a4 Z:(double)a5 W:(double)a6
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  *(double *)v7 = a3;
  *(double *)&v7[1] = a4;
  *(double *)&v7[2] = a5;
  *(double *)&v7[3] = a6;
  return -[FxVector initWithValues:count:](self, "initWithValues:count:", v7, 4);
}

- (FxVector)initWithValues:(const double *)a3 count:(unint64_t)a4
{
  FxVector *v6;
  FxVector *v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FxVector;
  v6 = -[FxVector init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_count = a4;
    if (a4 > 4)
    {
      v9 = (double *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
      v7->_u.ptr = v9;
      if (v9)
      {
        v10 = 0;
        do
        {
          v7->_u.ptr[v10] = a3[v10];
          ++v10;
        }
        while (a4 != v10);
      }
      else
      {

        return 0;
      }
    }
    else
    {
      if (!a4)
        goto LABEL_7;
      v8 = 0;
      do
      {
        v6->_u.vec[v8] = a3[v8];
        ++v8;
      }
      while (a4 != v8);
      if (a4 <= 3)
LABEL_7:
        bzero(&v6->_u.vec[a4], 32 - 8 * a4);
    }
  }
  return v7;
}

- (FxVector)initWithString:(id)a3
{
  const char *v4;
  const char *v5;
  double v6;
  char *v7;
  double v8;
  uint64_t v9;
  int v10;
  double *v11;
  double *v12;
  double *v13;
  unsigned int v14;
  BOOL v15;
  FxVector *v17;
  char *v18;
  _BYTE v19[256];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  if (!v4)
    return -[FxVector init](self, "init");
  v18 = 0;
  if (*v4 == 91)
    v5 = v4 + 1;
  else
    v5 = v4;
  v6 = strtod(v5, &v18);
  v7 = v18;
  if (v18 == v5)
    return -[FxVector initWithValues:count:](self, "initWithValues:count:", v19, 0, v6);
  v8 = v6;
  v9 = 0;
  v10 = 32;
  v11 = (double *)v19;
  while (v9 != v10)
  {
    v13 = v11;
LABEL_13:
    v14 = v9 + 1;
    v13[v9] = v8;
    v8 = strtod(v7, &v18);
    ++v9;
    v15 = v18 == v7;
    v7 = v18;
    if (v15)
      goto LABEL_19;
  }
  v12 = (double *)malloc_type_malloc(16 * v10, 0x31FFBBE5uLL);
  if (v12)
  {
    v13 = v12;
    memcpy(v12, v11, 8 * v10);
    if (v11 != (double *)v19)
      free(v11);
    v10 *= 2;
    v7 = v18;
    v11 = v13;
    goto LABEL_13;
  }
  v13 = v11;
  v14 = v9;
LABEL_19:
  v17 = -[FxVector initWithValues:count:](self, "initWithValues:count:", v13, v14, v18);
  if (v13 != (double *)v19)
    free(v13);
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_count >= 5)
    free(self->_u.ptr);
  v3.receiver = self;
  v3.super_class = (Class)FxVector;
  -[FxVector dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t count;
  FxVector *v5;
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *ptr;

  count = self->_count;
  v5 = +[FxVector allocWithZone:](FxVector, "allocWithZone:", a3);
  if (count > 4)
    ptr = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)self->_u.ptr;
  else
    ptr = &self->_u;
  return -[FxVector initWithValues:count:](v5, "initWithValues:count:", ptr, self->_count);
}

- (FxVector)initWithCoder:(id)a3
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t i;
  void *v8;
  float v9;
  _BYTE v11[512];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("CICount")))
  {
    LODWORD(v5) = objc_msgSend(a3, "decodeIntForKey:", CFSTR("CICount"));
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("FxVector")) & 1) == 0)
    {
      v5 = (int)v5;
      if (v5 >= 0x41)
      {
        v6 = malloc_type_malloc(8 * (int)v5, 0x100004000313F17uLL);
        if (!v6)
        {

          return 0;
        }
      }
      else
      {
        v6 = v11;
      }
      if (!(_DWORD)v5)
      {
        v5 = 0;
        return -[FxVector initWithValues:count:](self, "initWithValues:count:", v6, v5);
      }
LABEL_9:
      for (i = 0; i != v5; ++i)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CI_%ld"), i);
        objc_msgSend(a3, "decodeFloatForKey:", v8);
        *(double *)&v6[8 * i] = v9;

      }
      return -[FxVector initWithValues:count:](self, "initWithValues:count:", v6, v5);
    }
  }
  else if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("FxVector")) & 1) == 0)
  {
    v6 = v11;
    v5 = 4;
    goto LABEL_9;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  void *v6;
  double v7;

  objc_msgSend(a3, "encodeInt:forKey:", LODWORD(self->_count), CFSTR("CICount"));
  if (self->_count >= 5)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CI_%ld"), v5);
      v7 = self->_u.ptr[v5];
      *(float *)&v7 = v7;
      objc_msgSend(a3, "encodeFloat:forKey:", v6, v7);

      ++v5;
    }
    while (v5 < self->_count);
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (double)valueAtIndex:(unint64_t)a3
{
  unint64_t count;
  double result;
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *p_u;
  double *v6;

  count = self->_count;
  result = 0.0;
  if (count > a3)
  {
    p_u = &self->_u;
    if (count > 4)
      v6 = &p_u->ptr[a3];
    else
      v6 = &p_u->vec[a3];
    return *v6;
  }
  return result;
}

- (double)X
{
  $88552A8D2734CBBEDCC5ADBDCF1D9580 *p_u;

  p_u = &self->_u;
  if (self->_count >= 5)
    p_u = ($88552A8D2734CBBEDCC5ADBDCF1D9580 *)p_u->ptr;
  return p_u->vec[0];
}

- (double)Y
{
  double *v2;

  if (self->_count > 4)
    v2 = self->_u.ptr + 1;
  else
    v2 = &self->_u.vec[1];
  return *v2;
}

- (double)Z
{
  double *v2;

  if (self->_count > 4)
    v2 = self->_u.ptr + 2;
  else
    v2 = &self->_u.vec[2];
  return *v2;
}

- (double)W
{
  double *v2;

  if (self->_count > 4)
    v2 = self->_u.ptr + 3;
  else
    v2 = &self->_u.vec[3];
  return *v2;
}

- (id)ciVector
{
  return 0;
}

@end
