@implementation _IntArray2D

+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  return -[_IntArray2D initWithISize:jSize:]([_IntArray2D alloc], "initWithISize:jSize:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_arrayData);
  v3.receiver = self;
  v3.super_class = (Class)_IntArray2D;
  -[_IntArray2D dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  unint64_t jSize;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 3 * self->_iSize + 3 + (3 * self->_iSize + 3) * self->_jSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  jSize = self->_jSize;
  if (jSize)
  {
    if (self->_iSize + 1 <= jSize + 1)
      v5 = jSize + 1;
    else
      v5 = self->_iSize + 1;
    v6 = 0;
    v7 = (uint64_t)(log10((double)v5) + 1.0);
    do
    {
      if (self->_iSize)
      {
        v8 = 0;
        do
          objc_msgSend(v3, "appendFormat:", CFSTR("%0*ld "), v7, -[_IntArray2D ::](self, "::", v8++, v6));
        while (v8 < self->_iSize);
      }
      objc_msgSend(v3, "appendString:", CFSTR("\n"));
      ++v6;
    }
    while (v6 < self->_jSize);
  }
  return v3;
}

- (_IntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  _IntArray2D *v7;
  _IntArray2D *v8;
  int64_t *v9;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_IntArray2D;
  v7 = -[_IntArray2D init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_iSize = a3;
    v7->_jSize = a4;
    v9 = (int64_t *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
    v8->_arrayData = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("_IntArray2D.m"), 52, CFSTR("IntArray2D : Not enough memory to allocate an array with size:%lu x %lu"), a3, a4);

    }
  }
  return v8;
}

- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  return self->_iSize > a3 && self->_jSize > a4;
}

- (void)assertBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  id v8;

  if (self->_shouldBoundsCheck && !-[_IntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IntArray2D.m"), 73, CFSTR("IntArray2D : Out of bounds with indices:%lu %lu on array size:%lu %lu"), a3, a4, self->_iSize, self->_jSize);

  }
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4
{
  -[_IntArray2D assertBoundsForIIndex:jIndex:](self, "assertBoundsForIIndex:jIndex:");
  return self->_arrayData[a3 + self->_iSize * a4];
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5
{
  if (-[_IntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:"))
    return -[_IntArray2D ::](self, "::", a3, a4);
  else
    return a5;
}

- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5
{
  -[_IntArray2D assertBoundsForIIndex:jIndex:](self, "assertBoundsForIIndex:jIndex:");
  self->_arrayData[a3 + self->_iSize * a4] = a5;
}

- (unint64_t)iSize
{
  return self->_iSize;
}

- (unint64_t)jSize
{
  return self->_jSize;
}

- (BOOL)shouldBoundsCheck
{
  return self->_shouldBoundsCheck;
}

- (void)setShouldBoundsCheck:(BOOL)a3
{
  self->_shouldBoundsCheck = a3;
}

@end
