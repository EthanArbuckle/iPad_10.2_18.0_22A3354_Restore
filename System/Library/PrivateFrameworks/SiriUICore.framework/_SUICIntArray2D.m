@implementation _SUICIntArray2D

+ (id)arrayWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  return -[_SUICIntArray2D initWithISize:jSize:]([_SUICIntArray2D alloc], "initWithISize:jSize:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_arrayData);
  v3.receiver = self;
  v3.super_class = (Class)_SUICIntArray2D;
  -[_SUICIntArray2D dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return &stru_1E4A55AD0;
}

- (_SUICIntArray2D)initWithISize:(unint64_t)a3 jSize:(unint64_t)a4
{
  _SUICIntArray2D *v6;
  _SUICIntArray2D *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SUICIntArray2D;
  v6 = -[_SUICIntArray2D init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_iSize = a3;
    v6->_jSize = a4;
    v6->_arrayData = (int64_t *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
  }
  return v7;
}

- (BOOL)inBoundsForIIndex:(unint64_t)a3 jIndex:(unint64_t)a4
{
  return self->_iSize > a3 && self->_jSize > a4;
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4
{
  -[_SUICIntArray2D assertBoundsForIIndex:jIndex:](self, "assertBoundsForIIndex:jIndex:");
  return self->_arrayData[a3 + self->_iSize * a4];
}

- (int64_t):(unint64_t)a3 :(unint64_t)a4 outOfBoundsReturnValue:(int64_t)a5
{
  if (-[_SUICIntArray2D inBoundsForIIndex:jIndex:](self, "inBoundsForIIndex:jIndex:"))
    return -[_SUICIntArray2D ::](self, "::", a3, a4);
  else
    return a5;
}

- (void):(unint64_t)a3 :(unint64_t)a4 newValue:(int64_t)a5
{
  -[_SUICIntArray2D assertBoundsForIIndex:jIndex:](self, "assertBoundsForIIndex:jIndex:");
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
