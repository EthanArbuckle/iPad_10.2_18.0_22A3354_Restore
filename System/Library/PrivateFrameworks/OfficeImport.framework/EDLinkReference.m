@implementation EDLinkReference

+ (id)linkReferenceWithLinkIndex:(unint64_t)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLinkIndex:firstSheetIndex:lastSheetIndex:", a3, a4, a5);
}

- (EDLinkReference)initWithLinkIndex:(unint64_t)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5
{
  EDLinkReference *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDLinkReference;
  result = -[EDLinkReference init](&v9, sel_init);
  if (result)
  {
    result->mLinkIndex = a3;
    result->mFirstSheetIndex = a4;
    result->mLastSheetIndex = a5;
  }
  return result;
}

- (unint64_t)linkIndex
{
  return self->mLinkIndex;
}

- (unint64_t)firstSheetIndex
{
  return self->mFirstSheetIndex;
}

- (unint64_t)lastSheetIndex
{
  return self->mLastSheetIndex;
}

- (BOOL)isWorkbookLevelReference
{
  return self->mFirstSheetIndex == -2 && self->mLastSheetIndex == -2;
}

- (BOOL)isEqual:(id)a3
{
  EDLinkReference *v4;
  EDLinkReference *v5;
  BOOL v6;

  v4 = (EDLinkReference *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDLinkReference isEqualToLinkReference:](self, "isEqualToLinkReference:", v5);

  return v6;
}

- (BOOL)isEqualToLinkReference:(id)a3
{
  char *v4;
  BOOL v5;

  v4 = (char *)a3;
  v5 = *(_OWORD *)&self->mLinkIndex == *(_OWORD *)(v4 + 8) && self->mLastSheetIndex == *((_QWORD *)v4 + 3);

  return v5;
}

- (EDLinkReference)init
{
  EDLinkReference *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDLinkReference;
  result = -[EDLinkReference init](&v3, sel_init);
  if (result)
  {
    result->mFirstSheetIndex = -1;
    result->mLastSheetIndex = -1;
    result->mLinkIndex = -1;
  }
  return result;
}

- (void)setFirstSheetIndex:(unint64_t)a3
{
  self->mFirstSheetIndex = a3;
}

- (void)setLastSheetIndex:(unint64_t)a3
{
  self->mLastSheetIndex = a3;
}

- (void)setLinkIndex:(unint64_t)a3
{
  self->mLinkIndex = a3;
}

- (unint64_t)hash
{
  return (self->mFirstSheetIndex << 8) + (self->mLinkIndex << 16) + self->mLastSheetIndex;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDLinkReference;
  -[EDLinkReference description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
