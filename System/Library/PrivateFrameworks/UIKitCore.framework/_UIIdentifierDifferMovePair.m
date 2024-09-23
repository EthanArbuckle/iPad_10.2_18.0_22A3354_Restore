@implementation _UIIdentifierDifferMovePair

- (_QWORD)initWithFromIndex:(uint64_t)a3 toIndex:
{
  objc_super v5;

  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)_UIIdentifierDifferMovePair;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  unint64_t fromIndex;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v4 = a3;
  if (self)
  {
    fromIndex = self->_fromIndex;
    if (v4)
    {
LABEL_3:
      v6 = v4[1];
      goto LABEL_4;
    }
  }
  else
  {
    fromIndex = 0;
    if (v4)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_4:
  v7 = fromIndex >= v6;
  v8 = fromIndex == v6;
  v9 = -1;
  if (v7)
    v9 = 1;
  if (v8)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _UIIdentifierDifferMovePair *v4;
  BOOL v5;

  v4 = (_UIIdentifierDifferMovePair *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_fromIndex == self->_fromIndex && v4->_toIndex == self->_toIndex;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  result = +[_UIIdentifierDifferMovePair allocWithZone:](_UIIdentifierDifferMovePair, "allocWithZone:", a3);
  if (self)
    v5 = *(_OWORD *)&self->_fromIndex;
  else
    v5 = 0uLL;
  v6 = v5;
  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)_UIIdentifierDifferMovePair;
    result = -[_UIIdentifierDifferMovePair init](&v7, sel_init);
    if (result)
      *(_OWORD *)((char *)result + 8) = v6;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_fromIndex + (self->_toIndex << 32);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; M(%lu -> %lu)>"), v5, self, self->_fromIndex, self->_toIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
