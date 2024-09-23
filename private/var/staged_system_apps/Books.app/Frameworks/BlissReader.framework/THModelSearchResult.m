@implementation THModelSearchResult

+ (unint64_t)stringCompareOptions
{
  return 1;
}

- (THModelSearchResult)initWithTerm:(id)a3 rank:(int)a4 cfi:(id)a5 pageNumber:(unint64_t)a6 displayPageNumber:(id)a7 occurrenceIndex:(unint64_t)a8 context:(id)a9
{
  THModelSearchResult *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THModelSearchResult;
  v15 = -[THModelSearchResult init](&v17, "init");
  if (v15)
  {
    v15->mTerm = (NSString *)objc_msgSend(a3, "copy");
    v15->mRank = a4;
    v15->mCFI = (NSString *)objc_msgSend(a5, "copy");
    v15->mPageNumber = a6;
    v15->mDisplayPageNumber = (NSString *)objc_msgSend(a7, "copy");
    v15->mOccurrenceIndex = a8;
    v15->mContext = (NSString *)objc_msgSend(a9, "copy");
    v15->mOccurenceCount = 1;
  }
  return v15;
}

- (THModelSearchResult)initWithTerm:(id)a3 annotation:(id)a4 pageNumber:(unint64_t)a5 displayPageNumber:(id)a6 occurrenceIndex:(unint64_t)a7 context:(id)a8
{
  THModelSearchResult *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THModelSearchResult;
  v14 = -[THModelSearchResult init](&v16, "init");
  if (v14)
  {
    v14->mTerm = (NSString *)objc_msgSend(a3, "copy");
    v14->mAnnotation = (THAnnotation *)a4;
    v14->mRank = 100;
    v14->mPageNumber = a5;
    v14->mDisplayPageNumber = (NSString *)objc_msgSend(a6, "copy");
    v14->mOccurrenceIndex = a7;
    v14->mContext = (NSString *)objc_msgSend(a8, "copy");
    v14->mOccurenceCount = 1;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THModelSearchResult;
  -[THModelSearchResult dealloc](&v3, "dealloc");
}

- (unint64_t)hash
{
  return (-[NSString hash](self->mTerm, "hash") << 16) | ((unint64_t)LODWORD(self->mPageNumber) << 8) | LOBYTE(self->mOccurrenceIndex);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class(self, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
      return -[THModelSearchResult isEqualToResult:](self, "isEqualToResult:", a3);
  }
  return 0;
}

- (BOOL)isEqualToResult:(id)a3
{
  int mRank;
  id mPageNumber;
  id mOccurrenceIndex;
  unsigned int v8;
  THAnnotation *mAnnotation;

  mRank = self->mRank;
  if (mRank != objc_msgSend(a3, "rank")
    || (mPageNumber = (id)self->mPageNumber, mPageNumber != objc_msgSend(a3, "pageNumber"))
    || (mOccurrenceIndex = (id)self->mOccurrenceIndex, mOccurrenceIndex != objc_msgSend(a3, "occurrenceIndex")))
  {
    LOBYTE(v8) = 0;
    return v8;
  }
  v8 = -[NSString isEqualToString:](self->mTerm, "isEqualToString:", objc_msgSend(a3, "term"));
  if (v8)
  {
    v8 = -[NSString isEqualToString:](self->mCFI, "isEqualToString:", objc_msgSend(a3, "cfi"));
    if (v8)
    {
      mAnnotation = self->mAnnotation;
      if (!mAnnotation)
      {
        if (!objc_msgSend(a3, "annotation"))
        {
LABEL_10:
          LOBYTE(v8) = 1;
          return v8;
        }
        mAnnotation = self->mAnnotation;
      }
      v8 = -[THAnnotation isEqual:](mAnnotation, "isEqual:", objc_msgSend(a3, "annotation"));
      if (v8)
        goto LABEL_10;
    }
  }
  return v8;
}

- (BOOL)isTextResult
{
  int mRank;
  unsigned int v3;
  BOOL v4;

  mRank = self->mRank;
  v3 = mRank - 6;
  v4 = mRank != 100;
  return v3 >= 2 && v4;
}

- (BOOL)isMediaResult
{
  return (self->mRank & 0xFFFFFFFE) == 6;
}

- (BOOL)isNotesResult
{
  return self->mRank == 100;
}

- (_NSRange)contextRangeForResult
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[THModelSearchResult contextRangeForResultWithTrimmedContext:](self, "contextRangeForResultWithTrimmedContext:", self->mContext);
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (_NSRange)contextRangeForResultWithTrimmedContext:(id)a3
{
  _BYTE *v5;
  NSUInteger v6;
  uint64_t v7;
  _NSRange result;

  if (self->mOccurrenceIndex)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v5 = objc_msgSend(a3, "rangeOfString:options:range:", self->mTerm, objc_msgSend((id)objc_opt_class(self), "stringCompareOptions"), &v5[v6], (_BYTE *)objc_msgSend(a3, "length") - &v5[v6]);
      if (v5 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (++v7 >= self->mOccurrenceIndex)
        goto LABEL_10;
    }
  }
  v6 = 0;
  v5 = 0;
LABEL_10:
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{[%p] term='%@' rk=%d pgIdx=%lu dispPgNum=%@ cfi=%@\n%lu-th in '%@'}"), self, -[THModelSearchResult term](self, "term"), -[THModelSearchResult rank](self, "rank"), -[THModelSearchResult pageNumber](self, "pageNumber"), -[THModelSearchResult displayPageNumber](self, "displayPageNumber"), -[THModelSearchResult cfi](self, "cfi"), -[THModelSearchResult occurrenceIndex](self, "occurrenceIndex"), -[THModelSearchResult context](self, "context"));
}

- (NSString)term
{
  return self->mTerm;
}

- (int)rank
{
  return self->mRank;
}

- (NSString)cfi
{
  return self->mCFI;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)pageNumber
{
  return self->mPageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->mPageNumber = a3;
}

- (NSString)displayPageNumber
{
  return self->mDisplayPageNumber;
}

- (void)setDisplayPageNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)occurrenceIndex
{
  return self->mOccurrenceIndex;
}

- (NSString)context
{
  return self->mContext;
}

- (unint64_t)occurenceCount
{
  return self->mOccurenceCount;
}

- (void)setOccurenceCount:(unint64_t)a3
{
  self->mOccurenceCount = a3;
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

@end
