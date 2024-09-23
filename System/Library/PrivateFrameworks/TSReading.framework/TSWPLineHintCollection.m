@implementation TSWPLineHintCollection

- (void)dealloc
{
  TSWPLineHintCollection *mContainingCollection;
  objc_super v4;

  mContainingCollection = self->mContainingCollection;
  if (mContainingCollection)

  else
    free(self->mHints);
  v4.receiver = self;
  v4.super_class = (Class)TSWPLineHintCollection;
  -[TSWPLineHintCollection dealloc](&v4, sel_dealloc);
}

- (const)hints
{
  return self->mHints;
}

- (TSWPLineHintCollection)initWithContainingCollection:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPLineHintCollection *v8;
  objc_super v10;

  length = a4.length;
  location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)TSWPLineHintCollection;
  v8 = -[TSPObject initWithContext:](&v10, sel_initWithContext_, a5);
  if (v8)
  {
    v8->mContainingCollection = (TSWPLineHintCollection *)a3;
    v8->mHints = ($3F8F9197BE0E1D7EB0532A081E49366E *)(objc_msgSend(a3, "hints") + 56 * location);
    v8->mHintsCount = length;
    v8->mHasColumnIndices = objc_msgSend(a3, "hasColumnIndices");
  }
  return v8;
}

- (BOOL)checkSubCollectionRange:(_NSRange)a3
{
  NSUInteger v3;
  unint64_t mHintsCount;
  $3F8F9197BE0E1D7EB0532A081E49366E *mHints;
  NSUInteger v6;
  int *p_var2;
  char v8;

  v3 = a3.location + a3.length;
  mHintsCount = self->mHintsCount;
  if (a3.location + a3.length > mHintsCount)
    return 0;
  mHints = self->mHints;
  if ((mHints[a3.location].var2 & 1) == 0)
    return 0;
  v6 = v3 <= a3.location + 1 ? a3.location + 1 : a3.location + a3.length;
  p_var2 = &mHints[a3.location + 1].var2;
  while (++a3.location < v3)
  {
    v8 = *(_BYTE *)p_var2;
    p_var2 += 14;
    if ((v8 & 1) != 0)
      return 0;
  }
  return v6 >= mHintsCount || (mHints[v6].var2 & 1) != 0;
}

- (id)newSubCollectionWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (-[TSWPLineHintCollection checkSubCollectionRange:](self, "checkSubCollectionRange:"))
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContainingCollection:range:context:", self, location, length, -[TSPObject context](self, "context"));
  else
    return 0;
}

- (unint64_t)p_columnIndexForHintIndex:(unint64_t)a3
{
  if (self->mHintsCount <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return SHIBYTE(self->mHints[a3].var2);
}

- (_NSRange)hintRangeForColumnIndex:(unint64_t)a3 frameBounds:(CGRect)a4 charIndex:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  const $3F8F9197BE0E1D7EB0532A081E49366E *v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  CGSize *p_size;
  NSUInteger v18;
  NSUInteger v19;
  unint64_t v20;
  int *p_var2;
  NSUInteger v22;
  char v23;
  double v24;
  _NSRange result;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!-[TSWPLineHintCollection valid](self, "valid"))
  {
LABEL_12:
    v18 = 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  v12 = -[TSWPLineHintCollection hints](self, "hints");
  v13 = -[TSWPLineHintCollection hintsCount](self, "hintsCount");
  v14 = v13;
  if (self->mHasColumnIndices)
  {
    if (v13)
    {
      v15 = 0;
      while (1)
      {
        v16 = -[TSWPLineHintCollection p_columnIndexForHintIndex:](self, "p_columnIndexForHintIndex:", v15);
        if (v16 >= a3)
          break;
        if (v14 == ++v15)
          goto LABEL_12;
      }
      v20 = v16;
      goto LABEL_15;
    }
  }
  else if (v13)
  {
    v15 = 0;
    p_size = &v12->var0.size;
    while (*(_QWORD *)&p_size[1].width < a5)
    {
      ++v15;
      p_size = (CGSize *)((char *)p_size + 56);
      if (v13 == v15)
        goto LABEL_12;
    }
    v24 = TSDCenterOfRect(p_size[-1].width, p_size[-1].height, p_size->width, p_size->height);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (v24 >= CGRectGetMinX(v26)
      && (v27.origin.x = x, v27.origin.y = y,
                            v27.size.width = width,
                            v27.size.height = height,
                            v24 <= CGRectGetMaxX(v27)))
    {
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      v20 = a3;
    }
    else
    {
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = v15;
    }
    goto LABEL_16;
  }
  v15 = 0;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
  v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_16:
  v18 = 0;
  if (v20 == a3 && v15 < v14)
  {
    p_var2 = &v12[v15 + 1].var2;
    v22 = v15;
    while (v14 - 1 != v22)
    {
      ++v22;
      v23 = *(_BYTE *)p_var2;
      p_var2 += 14;
      if ((v23 & 4) != 0)
        goto LABEL_23;
    }
    v22 = v14;
LABEL_23:
    v18 = v22 - v15;
    v19 = v15;
  }
LABEL_29:
  result.length = v18;
  result.location = v19;
  return result;
}

- (_NSRange)hintRangeForLineStartingAtHintIndex:(unint64_t)a3
{
  const $3F8F9197BE0E1D7EB0532A081E49366E *v5;
  unint64_t v6;
  unint64_t v7;
  int *p_var2;
  unint64_t v9;
  NSUInteger v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  _NSRange result;

  if (!-[TSWPLineHintCollection valid](self, "valid"))
    goto LABEL_10;
  v5 = -[TSWPLineHintCollection hints](self, "hints");
  v6 = -[TSWPLineHintCollection hintsCount](self, "hintsCount");
  v7 = v6;
  if (v6 <= a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPLineHintCollection hintRangeForLineStartingAtHintIndex:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLineHintCollection.mm"), 182, CFSTR("invalid hint index %lu (count = %lu)"), a3, v7);
LABEL_10:
    v10 = 0;
    a3 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  p_var2 = &v5[a3].var2;
  v9 = a3;
  while (v9 <= a3 || (*(_BYTE *)p_var2 & 8) == 0)
  {
    ++v9;
    p_var2 += 14;
    if (v6 == v9)
    {
      v9 = v6;
      break;
    }
  }
  v10 = v9 - a3;
LABEL_11:
  v13 = a3;
  result.length = v10;
  result.location = v13;
  return result;
}

- (id)descriptionWithStorage:(id)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  $3F8F9197BE0E1D7EB0532A081E49366E *v10;
  NSRange v11;
  NSUInteger location;
  const __CFString *v13;
  $3F8F9197BE0E1D7EB0532A081E49366E *v14;
  NSString *v15;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", -[TSWPLineHintCollection description](self, "description"));
  objc_msgSend(v5, "appendFormat:", CFSTR(" valid=%d hintsCounts=%lu"), self->mValid, self->mHintsCount);
  v6 = objc_msgSend(a3, "length");
  if (self->mHintsCount)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = &self->mHints[v8];
      location = v10->var1.location;
      v11.length = v10->var1.length;
      if (v11.length + location <= v7)
      {
        v13 = (const __CFString *)objc_msgSend(a3, "substringWithRange:");
        v14 = &self->mHints[v8];
        location = v14->var1.location;
        v11.length = v14->var1.length;
      }
      else
      {
        v13 = CFSTR("<invalid>");
      }
      v11.location = location;
      v15 = NSStringFromRange(v11);
      objc_msgSend(v5, "appendFormat:", CFSTR("\n- [%lu] %p %p %@ %@ - '%@'"), v9++, self, a3, v15, NSStringFromCGRect(self->mHints[v8++].var0), v13);
    }
    while (v9 < self->mHintsCount);
  }
  return v5;
}

- (unint64_t)hintsCount
{
  return self->mHintsCount;
}

- (BOOL)valid
{
  return self->mValid;
}

- (BOOL)hasColumnIndices
{
  return self->mHasColumnIndices;
}

@end
