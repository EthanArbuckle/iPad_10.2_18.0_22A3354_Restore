@implementation TSWPLineHintCollection

- (TSWPLineHintCollection)initWithApplePubData:(id)a3 context:(id)a4
{
  TSWPLineHintCollection *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  int v16;
  char *v17;
  uint64_t v18;
  double *v19;
  float *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TSWPLineHintCollection;
  v5 = -[TSWPLineHintCollection initWithContext:](&v21, "initWithContext:", a4);
  if (v5)
  {
    v6 = objc_msgSend(a3, "bytes");
    v7 = (char *)objc_msgSend(a3, "length");
    v8 = OBJC_IVAR___TSWPLineHintCollection_mHintsCount;
    v9 = OBJC_IVAR___TSWPLineHintCollection_mHasColumnIndices;
    *(_QWORD *)((char *)v5 + OBJC_IVAR___TSWPLineHintCollection_mHintsCount) = 0;
    if ((unint64_t)v7 < 9
      || *v6 != 73
      || v6[1] != 66
      || v6[2] != 76
      || v6[3] != 70
      || (v10 = v6[4], (v10 & 0xF0) != 0x10)
      || (v11 = v7 - 8,
          v12 = v6[5],
          v13 = (unint64_t)(v7 - 8) / v12,
          (unint64_t)(v7 - 8) % v12))
    {
      v14 = 0;
LABEL_10:
      *((_BYTE *)v5 + v9) = v14;
      *(_QWORD *)((char *)v5 + OBJC_IVAR___TSWPLineHintCollection_mHints) = 0;

      return 0;
    }
    v16 = v10 & 0xF;
    v14 = v16 != 0;
    v17 = (char *)malloc_type_calloc((unint64_t)(v7 - 8) / v12, 0x38uLL, 0x10000405AA1D1E9uLL);
    if (!v17)
      goto LABEL_10;
    if ((unint64_t)v11 >= v12)
    {
      if (v13 <= 1)
        v18 = 1;
      else
        v18 = v13;
      v19 = (double *)(v17 + 24);
      v20 = (float *)(v6 + 12);
      do
      {
        *(v19 - 3) = *(v20 - 1);
        *(v19 - 2) = *v20;
        *(v19 - 1) = v20[1];
        *v19 = v20[2];
        *((float *)v19 + 6) = v20[3];
        v19 += 7;
        v20 = (float *)((char *)v20 + v12);
        --v18;
      }
      while (v18);
    }
    *(_QWORD *)((char *)v5 + v8) = v13;
    *((_BYTE *)v5 + v9) = v16 != 0;
    *(_QWORD *)((char *)v5 + OBJC_IVAR___TSWPLineHintCollection_mHints) = v17;
  }
  return v5;
}

- (id)initForEmptyShapeWithPreviousRange:(_NSRange)a3 context:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPLineHintCollection *v6;
  TSWPLineHintCollection *v7;
  _OWORD *v8;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)TSWPLineHintCollection;
  v6 = -[TSWPLineHintCollection initWithContext:](&v10, "initWithContext:", a4);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)((char *)v6 + OBJC_IVAR___TSWPLineHintCollection_mHintsCount) = 1;
    v8 = malloc_type_calloc(1uLL, 0x38uLL, 0x10000405AA1D1E9uLL);
    *(_QWORD *)((char *)v7 + OBJC_IVAR___TSWPLineHintCollection_mHints) = v8;
    *v8 = 0u;
    v8[1] = 0u;
    *((_QWORD *)v8 + 4) = location + length;
    *((_QWORD *)v8 + 5) = 0;
    *((_DWORD *)v8 + 12) = 0;
    *((_BYTE *)v7 + OBJC_IVAR___TSWPLineHintCollection_mValid) = 1;
  }
  return v7;
}

- (BOOL)applePubUpdateRangesWithLineBreakIndexes:(id)a3 textStorage:(id)a4
{
  char *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  BOOL result;

  v6 = (char *)objc_msgSend(a4, "length");
  v7 = (char *)objc_msgSend(a3, "firstIndex");
  v8 = 0;
  v9 = OBJC_IVAR___TSWPLineHintCollection_mHintsCount;
  v10 = v7 != (char *)0x7FFFFFFFFFFFFFFFLL;
  if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL && *(_QWORD *)((char *)self + OBJC_IVAR___TSWPLineHintCollection_mHintsCount))
  {
    v11 = v7;
    v12 = 0;
    v8 = 0;
    v10 = 1;
    while (1)
    {
      v13 = (char *)objc_msgSend(a3, "indexGreaterThanIndex:", v11);
      if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL || v13 > v6)
        break;
      if (v13 <= v11)
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPLineHintCollection(ApplePubAdditions) applePubUpdateRangesWithLineBreakIndexes:textStorage:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/TSWPLineHintCollection_ApplePubAdditions.m"), 155, CFSTR("shouldn't generate hint for zero-length range line"));
        v10 = 0;
        break;
      }
      v14 = *(_QWORD *)((char *)self + OBJC_IVAR___TSWPLineHintCollection_mHints) + v12;
      *(_QWORD *)(v14 + 32) = v11;
      *(_QWORD *)(v14 + 40) = v13 - v11;
      ++v8;
      v12 += 56;
      v11 = v13;
      if (v8 >= *(_QWORD *)((char *)self + v9))
      {
        v10 = 1;
        break;
      }
    }
  }
  v15 = objc_msgSend(a3, "count");
  v16 = *(_QWORD *)((char *)self + v9);
  if (v8 == v16 && v15 == (id)(v16 + 1))
    result = v10;
  else
    result = 0;
  *((_BYTE *)self + OBJC_IVAR___TSWPLineHintCollection_mValid) = result;
  return result;
}

@end
