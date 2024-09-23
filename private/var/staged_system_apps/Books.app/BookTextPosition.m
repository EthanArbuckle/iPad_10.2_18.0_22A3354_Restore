@implementation BookTextPosition

+ (id)textPositionWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  double v11;

  v6 = a6;
  v8 = a4;
  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = a5;
  return objc_msgSend(v10, "initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", a3, v8, v6, v11);
}

+ (id)textPositionWithCharIndex:(unint64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCharIndex:", a3);
}

- (BookTextPosition)initWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  BookTextPosition *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BookTextPosition;
  result = -[BookTextPosition init](&v11, "init");
  if (result)
  {
    result->_charIndex = a3;
    result->_eolAffinity = a4;
    result->_preferredPosition = a5;
    result->_isPreferredStart = a6;
  }
  return result;
}

- (BookTextPosition)initWithCharIndex:(unint64_t)a3
{
  double v3;

  LODWORD(v3) = 2143289344;
  return -[BookTextPosition initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](self, "initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", a3, 0, 1, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  *(float *)&v5 = self->_preferredPosition;
  return objc_msgSend(v4, "initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", self->_charIndex, self->_eolAffinity, self->_isPreferredStart, v5);
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t charIndex;
  int eolAffinity;
  int64_t v12;
  char v14;

  v4 = a3;
  v14 = 0;
  v5 = objc_opt_class(BookTextPosition);
  v6 = __IMAccessibilityCastAsClass(v5, v4, 1, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v14)
    abort();
  v8 = v7;
  v9 = objc_msgSend(v7, "charIndex");
  charIndex = self->_charIndex;
  if ((id)charIndex == v9)
  {
    eolAffinity = self->_eolAffinity;
    if (eolAffinity == objc_msgSend(v8, "endOfLineAffinity"))
    {
      v12 = 0;
    }
    else if (self->_eolAffinity)
    {
      v12 = 1;
    }
    else
    {
      v12 = -1;
    }
  }
  else if (charIndex > (unint64_t)v9)
  {
    v12 = 1;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v10;

  v4 = a3;
  v10 = 0;
  v5 = objc_opt_class(BookTextPosition);
  v6 = __IMAccessibilityCastAsClass(v5, v4, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = v7 && self->_charIndex == *(_QWORD *)(v7 + 8) && self->_eolAffinity == *(unsigned __int8 *)(v7 + 16);

  return v8;
}

- (int)distanceFromPosition:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int charIndex;
  int v10;
  char v12;

  v4 = a3;
  v12 = 0;
  v5 = objc_opt_class(BookTextPosition);
  v6 = __IMAccessibilityCastAsClass(v5, v4, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v12)
    abort();
  v8 = v7;
  charIndex = self->_charIndex;
  v10 = charIndex - objc_msgSend(v7, "charIndex");

  return v10;
}

- (unint64_t)charIndex
{
  return self->_charIndex;
}

- (BOOL)endOfLineAffinity
{
  return self->_eolAffinity;
}

- (float)preferredPosition
{
  return self->_preferredPosition;
}

- (BOOL)isPreferredStart
{
  return self->_isPreferredStart;
}

@end
