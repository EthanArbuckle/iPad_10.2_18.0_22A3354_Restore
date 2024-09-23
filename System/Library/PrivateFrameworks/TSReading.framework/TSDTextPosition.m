@implementation TSDTextPosition

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
  return (id)objc_msgSend(v10, "initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", a3, v8, v6, v11);
}

+ (id)textPositionWithCharIndex:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCharIndex:", a3);
}

- (TSDTextPosition)initWithCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 preferredPosition:(float)a5 isPreferredStart:(BOOL)a6
{
  TSDTextPosition *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDTextPosition;
  result = -[TSDTextPosition init](&v11, sel_init);
  if (result)
  {
    result->_charIndex = a3;
    result->_eolAffinity = a4;
    result->_preferredPosition = a5;
    result->_isPreferredStart = a6;
  }
  return result;
}

- (TSDTextPosition)initWithCharIndex:(unint64_t)a3
{
  double v3;

  LODWORD(v3) = 2143289344;
  return -[TSDTextPosition initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](self, "initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", a3, 0, 1, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->_preferredPosition;
  return (id)objc_msgSend(v4, "initWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", self->_charIndex, self->_eolAffinity, self->_isPreferredStart, v5);
}

- (int64_t)compare:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t charIndex;
  int eolAffinity;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextPosition compare:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextPosition.m"), 66, CFSTR("bad text position"));
  }
  v7 = objc_msgSend(v4, "charIndex");
  charIndex = self->_charIndex;
  if (charIndex == v7)
  {
    eolAffinity = self->_eolAffinity;
    if (eolAffinity == objc_msgSend(v4, "endOfLineAffinity"))
    {
      return 0;
    }
    else if (self->_eolAffinity)
    {
      return 1;
    }
    else
    {
      return -1;
    }
  }
  else if (charIndex > v7)
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
    LOBYTE(v4) = self->_charIndex == *(_QWORD *)(v4 + 8) && self->_eolAffinity == *(unsigned __int8 *)(v4 + 16);
  return v4;
}

- (int)distanceFromPosition:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int charIndex;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextPosition distanceFromPosition:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextPosition.m"), 107, CFSTR("bad text position"));
  }
  charIndex = self->_charIndex;
  return charIndex - objc_msgSend(v4, "charIndex");
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
