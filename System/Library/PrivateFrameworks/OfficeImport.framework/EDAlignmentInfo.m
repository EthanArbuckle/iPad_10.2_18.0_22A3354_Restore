@implementation EDAlignmentInfo

+ (id)alignmentInfo
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDAlignmentInfo)init
{
  EDAlignmentInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDAlignmentInfo;
  result = -[EDAlignmentInfo init](&v3, sel_init);
  if (result)
  {
    *(_DWORD *)&result->mHorizontalAlignOverridden = 0;
    *(_QWORD *)&result->mHorizontalAlignment = 0x200000000;
    result->mDoNotModify = 0;
    *(_QWORD *)&result->mIndent = 0;
    result->mTextWrapped = 0;
  }
  return result;
}

- (void)setHorizontalAlignment:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mHorizontalAlignOverridden = 1;
    self->mHorizontalAlignment = a3;
  }
}

- (void)setVerticalAlignment:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mVerticalAlignOverridden = 1;
    self->mVerticalAlignment = a3;
  }
}

- (void)setIndent:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mIndentOverridden = 1;
    self->mIndent = a3;
  }
}

- (void)setTextWrapped:(BOOL)a3
{
  if (!self->mDoNotModify)
  {
    self->mTextWrappedOveridden = 1;
    self->mTextWrapped = a3;
  }
}

- (void)setTextRotation:(int)a3
{
  if (!self->mDoNotModify)
    self->mTextRotation = a3;
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (BOOL)isEqual:(id)a3
{
  EDAlignmentInfo *v4;
  EDAlignmentInfo *v5;
  BOOL v6;

  v4 = (EDAlignmentInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDAlignmentInfo isEqualToAlignmentInfo:](self, "isEqualToAlignmentInfo:", v5);

  return v6;
}

- (BOOL)isEqualToAlignmentInfo:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = self->mHorizontalAlignOverridden == *((unsigned __int8 *)v4 + 25)
    && self->mHorizontalAlignment == v4[2]
    && self->mVerticalAlignOverridden == *((unsigned __int8 *)v4 + 26)
    && self->mVerticalAlignment == v4[3]
    && self->mIndentOverridden == *((unsigned __int8 *)v4 + 27)
    && self->mIndent == v4[4]
    && self->mTextWrappedOveridden == *((unsigned __int8 *)v4 + 28)
    && self->mTextWrapped == *((unsigned __int8 *)v4 + 24)
    && self->mTextRotation == v4[5];

  return v5;
}

- (BOOL)isVerticalAlignOverridden
{
  return self->mVerticalAlignOverridden;
}

- (int)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (BOOL)isHorizontalAlignOverridden
{
  return self->mHorizontalAlignOverridden;
}

- (int)horizontalAlignment
{
  return self->mHorizontalAlignment;
}

- (int)indent
{
  return self->mIndent;
}

- (BOOL)isTextWrapped
{
  return self->mTextWrapped;
}

- (int)textRotation
{
  return self->mTextRotation;
}

- (BOOL)isTextWrappedOverridden
{
  return self->mTextWrappedOveridden;
}

- (BOOL)isIndentOverridden
{
  return self->mIndentOverridden;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->mHorizontalAlignment;
    *((_DWORD *)v4 + 4) = self->mIndent;
    *((_DWORD *)v4 + 5) = self->mTextRotation;
    *((_BYTE *)v4 + 24) = self->mTextWrapped;
    *((_BYTE *)v4 + 25) = self->mHorizontalAlignOverridden;
    *((_BYTE *)v4 + 26) = self->mVerticalAlignOverridden;
    *((_BYTE *)v4 + 27) = self->mIndentOverridden;
    *((_BYTE *)v4 + 28) = self->mTextWrappedOveridden;
    *((_BYTE *)v4 + 29) = 0;
    v6 = v4;
  }

  return v5;
}

- (unint64_t)hash
{
  return (self->mVerticalAlignment << 8) + (self->mHorizontalAlignment << 16) + (self->mTextRotation ^ self->mIndent);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDAlignmentInfo;
  -[EDAlignmentInfo description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
