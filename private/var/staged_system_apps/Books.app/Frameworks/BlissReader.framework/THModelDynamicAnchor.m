@implementation THModelDynamicAnchor

- (THModelDynamicAnchor)initWithContentNode:(id)a3 startElementId:(id)a4 startPattern:(id)a5 startOccurrence:(unint64_t)a6 startRange:(_NSRange)a7 endElementId:(id)a8 endPattern:(id)a9 endOccurrence:(unint64_t)a10 endRange:(_NSRange)a11
{
  NSUInteger length;
  NSUInteger location;
  THModelDynamicAnchor *v16;
  THModelDynamicAnchor *v17;
  objc_super v19;

  length = a7.length;
  location = a7.location;
  v19.receiver = self;
  v19.super_class = (Class)THModelDynamicAnchor;
  v16 = -[THModelBoundAnchor initWithContentNode:](&v19, "initWithContentNode:", a3);
  v17 = v16;
  if (v16)
  {
    -[THModelDynamicAnchor setStartElementId:](v16, "setStartElementId:", a4);
    -[THModelDynamicAnchor setStartPattern:](v17, "setStartPattern:", a5);
    -[THModelDynamicAnchor setStartOccurrence:](v17, "setStartOccurrence:", a6);
    -[THModelDynamicAnchor setStartRange:](v17, "setStartRange:", location, length);
    -[THModelDynamicAnchor setEndElementId:](v17, "setEndElementId:", a8);
    -[THModelDynamicAnchor setEndPattern:](v17, "setEndPattern:", a9);
    -[THModelDynamicAnchor setEndOccurrence:](v17, "setEndOccurrence:", a10);
    -[THModelDynamicAnchor setEndRange:](v17, "setEndRange:", a11.location, a11.length);
  }
  return v17;
}

- (THModelDynamicAnchor)initWithContentNode:(id)a3 startXPointer:(id)a4 endXPointer:(id)a5
{
  if (!self)
    return -[THModelDynamicAnchor initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:](self, "initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:", a3, (unsigned __int128)0, 0, (unsigned __int128)0, 0, 0, 0);
  -[THModelDynamicAnchor p_anchorPointFromXPointer:](self, "p_anchorPointFromXPointer:", a4);
  -[THModelDynamicAnchor p_anchorPointFromXPointer:](self, "p_anchorPointFromXPointer:", a5);
  return -[THModelDynamicAnchor initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:](self, "initWithContentNode:startElementId:startPattern:startOccurrence:startRange:endElementId:endPattern:endOccurrence:endRange:", a3, (unsigned __int128)0, 0, (unsigned __int128)0, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THModelDynamicAnchor setEndPattern:](self, "setEndPattern:", 0);
  -[THModelDynamicAnchor setEndElementId:](self, "setEndElementId:", 0);
  -[THModelDynamicAnchor setStartPattern:](self, "setStartPattern:", 0);
  -[THModelDynamicAnchor setStartElementId:](self, "setStartElementId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THModelDynamicAnchor;
  -[THModelBoundAnchor dealloc](&v3, "dealloc");
}

- ($DC674FFF4DF76ED3041042B2389D4EF7)p_anchorPointFromXPointer:(SEL)a3
{
  id v5;
  $DC674FFF4DF76ED3041042B2389D4EF7 *result;

  retstr->var0 = &stru_43D7D8;
  retstr->var1 = &stru_43D7D8;
  *(_OWORD *)&retstr->var2 = xmmword_313EF0;
  retstr->var3.length = 0;
  v5 = objc_msgSend(objc_msgSend(a4, "substringWithRange:", 9, (char *)objc_msgSend(a4, "length") - 10), "componentsSeparatedByString:", CFSTR(","));
  result = ($DC674FFF4DF76ED3041042B2389D4EF7 *)objc_msgSend(v5, "count");
  if (result == ($DC674FFF4DF76ED3041042B2389D4EF7 *)((char *)&dword_4 + 1))
  {
    retstr->var0 = objc_msgSend(v5, "objectAtIndex:", 0);
    retstr->var1 = objc_msgSend(v5, "objectAtIndex:", 1);
    retstr->var2 = (unint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 2), "integerValue");
    retstr->var3.location = (NSUInteger)objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 3), "integerValue");
    result = ($DC674FFF4DF76ED3041042B2389D4EF7 *)objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 4), "integerValue");
    retstr->var3.length = (NSUInteger)result;
  }
  return result;
}

- (NSString)startElementId
{
  return self->mStartElementId;
}

- (void)setStartElementId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)startPattern
{
  return self->mStartPattern;
}

- (void)setStartPattern:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)startOccurrence
{
  return self->mStartOccurrence;
}

- (void)setStartOccurrence:(unint64_t)a3
{
  self->mStartOccurrence = a3;
}

- (_NSRange)startRange
{
  _NSRange *p_mStartRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_mStartRange = &self->mStartRange;
  location = self->mStartRange.location;
  length = p_mStartRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  self->mStartRange = a3;
}

- (NSString)endElementId
{
  return self->mEndElementId;
}

- (void)setEndElementId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)endPattern
{
  return self->mEndPattern;
}

- (void)setEndPattern:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unint64_t)endOccurrence
{
  return self->mEndOccurrence;
}

- (void)setEndOccurrence:(unint64_t)a3
{
  self->mEndOccurrence = a3;
}

- (_NSRange)endRange
{
  _NSRange *p_mEndRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_mEndRange = &self->mEndRange;
  location = self->mEndRange.location;
  length = p_mEndRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEndRange:(_NSRange)a3
{
  self->mEndRange = a3;
}

@end
