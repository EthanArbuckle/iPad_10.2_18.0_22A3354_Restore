@implementation PFXHtmlDocMediaState

- (PFXHtmlDocMediaState)initWithStorage:(id)a3 readerState:(id)a4 defaultParagraphStyleIdentifier:(id)a5
{
  PFXHtmlDocMediaState *v8;
  PFXHtmlDocMediaState *v9;
  TSSStylesheet *v10;
  char *begin;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PFXHtmlDocMediaState;
  v8 = -[PFXHtmlDocMediaState init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    v8->mReaderState = (PFXHtmlReaderState *)a4;
    v8->mStyleCache = objc_alloc_init(PFSStyleCache);
    v9->mPageCache = objc_alloc_init(PFSPageCache);
    v9->mLoadedStylesheetEntries = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9->mBodyStorage = (TSWPStorage *)a3;
    v10 = (TSSStylesheet *)objc_msgSend(a3, "stylesheet");
    v9->mStylesheet = v10;
    v9->mDefaultNoneListStyle = (TSWPListStyle *)-[TSSStylesheet defaultListStyle](v10, "defaultListStyle");
    v9->mObjectContext = (TSPObjectContext *)objc_msgSend(a3, "context");
    if (a5)
      v9->mDefaultParagraphStyle = (TSWPParagraphStyle *)-[TSSStylesheet styleWithIdentifier:](v9->mStylesheet, "styleWithIdentifier:", a5);
    begin = (char *)v9->mListTextIndents.__begin_;
    v13 = 0;
    sub_1D6818((uint64_t)&v9->mListTextIndents, begin, 9uLL, (char *)&v13);
    v9->mListLevel = -1;
    v9->mDrawableAttachmentCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mDrawableAnchorCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v9;
}

- (void)dealloc
{
  id *i;
  id *j;
  id *k;
  objc_super v6;

  for (i = (id *)self->mCharacterStyleCache.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  for (j = (id *)self->mParagraphStyleCache.__table_.__p1_.__value_.__next_; j; j = (id *)*j)

  for (k = (id *)self->mDisplayValueCache.__table_.__p1_.__value_.__next_; k; k = (id *)*k)
  v6.receiver = self;
  v6.super_class = (Class)PFXHtmlDocMediaState;
  -[PFXHtmlDocMediaState dealloc](&v6, "dealloc");
}

- (id)temporaryTableCellStorage
{
  id result;
  id v4;
  id v5;
  TSSStylesheet *mStylesheet;
  TSWPParagraphStyle *mDefaultParagraphStyle;
  TSWPListStyle *mDefaultNoneListStyle;

  result = self->mTemporaryTableCellStorage;
  if (!result)
  {
    v4 = objc_alloc((Class)TSWPStorage);
    v5 = +[THTemporaryObjectContext context](THTemporaryObjectContext, "context");
    mStylesheet = self->mStylesheet;
    mDefaultParagraphStyle = self->mDefaultParagraphStyle;
    if (!mDefaultParagraphStyle)
      mDefaultParagraphStyle = (TSWPParagraphStyle *)-[TSSStylesheet defaultParagraphStyle](self->mStylesheet, "defaultParagraphStyle");
    mDefaultNoneListStyle = self->mDefaultNoneListStyle;
    if (!mDefaultNoneListStyle)
      mDefaultNoneListStyle = (TSWPListStyle *)-[TSSStylesheet defaultListStyle](self->mStylesheet, "defaultListStyle");
    result = objc_msgSend(v4, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v5, 0, 3, mStylesheet, mDefaultParagraphStyle, mDefaultNoneListStyle, 0, 0);
    self->mTemporaryTableCellStorage = (TSWPStorage *)result;
  }
  return result;
}

- (void)addStylesheetProperties:(id)a3
{
  -[PFSStyleCache addEntriesFromDictionary:](self->mStyleCache, "addEntriesFromDictionary:", a3);
}

- (void)addStylesheetProperties:(id)a3 forEntry:(id)a4
{
  -[NSMutableSet addObject:](self->mLoadedStylesheetEntries, "addObject:", a4);
  -[PFXHtmlDocMediaState addStylesheetProperties:](self, "addStylesheetProperties:", a3);
}

- (BOOL)loadedDocumentSelectorsForEntry:(id)a3
{
  return -[NSMutableSet containsObject:](self->mLoadedStylesheetEntries, "containsObject:", a3);
}

- (int64_t)listLevel
{
  if (self->mListLevel <= 9)
    return self->mListLevel;
  else
    return 8;
}

- (double)listIndentForLevel:(int64_t)a3
{
  double result;
  double *begin;

  result = 0.0;
  if ((a3 & 0x8000000000000000) == 0)
  {
    begin = self->mListTextIndents.__begin_;
    if (self->mListTextIndents.__end_ - begin > a3)
      return begin[a3];
  }
  return result;
}

- (void)setListIndent:(double)a3 forLevel:(int64_t)a4
{
  double *begin;

  if ((a4 & 0x8000000000000000) == 0)
  {
    begin = self->mListTextIndents.__begin_;
    if (self->mListTextIndents.__end_ - begin > a4)
      begin[a4] = a3;
  }
}

- (void)startListOrdered:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  ++self->mListLevel;
  self->mInList = 1;
  sub_1D7334(&self->mListOrdered.c.__map_.__first_, &v3);
}

- (void)stopList
{
  unint64_t value;
  int64_t mListLevel;

  value = self->mListOrdered.c.__size_.__value_;
  if (value)
  {
    self->mListOrdered.c.__size_.__value_ = value - 1;
    sub_1D76CC(&self->mListOrdered.c.__map_.__first_, 1);
  }
  mListLevel = self->mListLevel;
  self->mListLevel = mListLevel - 1;
  self->mInList = mListLevel > 0;
}

- (BOOL)orderedList
{
  unint64_t value;

  value = self->mListOrdered.c.__size_.__value_;
  return value
      && self->mInList
      && (*(BOOL **)((char *)self->mListOrdered.c.__map_.__begin_
                   + (((value + self->mListOrdered.c.__start_ - 1) >> 9) & 0x7FFFFFFFFFFFF8)))[(value
                                                                                                + self->mListOrdered.c.__start_
                                                                                                - 1) & 0xFFF];
}

- (void)addPageStartIndex
{
  id v3;
  unint64_t v4;
  unint64_t *end;
  unint64_t *value;
  unint64_t *v7;
  unint64_t *begin;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;

  v3 = -[TSWPStorage length](self->mBodyStorage, "length");
  v4 = (unint64_t)v3;
  end = self->mPageStartIndices.__end_;
  value = self->mPageStartIndices.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->mPageStartIndices.__begin_;
    v9 = end - begin;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_36C30();
    v10 = (char *)value - (char *)begin;
    v11 = ((char *)value - (char *)begin) >> 2;
    if (v11 <= v9 + 1)
      v11 = v9 + 1;
    if (v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
    {
      v13 = (char *)sub_3CC38((uint64_t)&self->mPageStartIndices.__end_cap_, v12);
      begin = self->mPageStartIndices.__begin_;
      end = self->mPageStartIndices.__end_;
    }
    else
    {
      v13 = 0;
    }
    v14 = (unint64_t *)&v13[8 * v9];
    v15 = (unint64_t *)&v13[8 * v12];
    *v14 = v4;
    v7 = v14 + 1;
    while (end != begin)
    {
      v16 = *--end;
      *--v14 = v16;
    }
    self->mPageStartIndices.__begin_ = v14;
    self->mPageStartIndices.__end_ = v7;
    self->mPageStartIndices.__end_cap_.__value_ = v15;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = (unint64_t)v3;
    v7 = end + 1;
  }
  self->mPageStartIndices.__end_ = v7;
}

- (vector<unsigned)pageStartIndices
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)sub_1D7738(retstr, self->mPageStartIndices.__begin_, (uint64_t)self->mPageStartIndices.__end_, self->mPageStartIndices.__end_- self->mPageStartIndices.__begin_);
}

- (BOOL)hasHints
{
  return 0;
}

- (unint64_t)nextHintLocation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)nextHintShapeRef
{
  return 0;
}

- (id)hintsData
{
  return 0;
}

- (unint64_t)lastHintLocation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)cacheCharacterPosition:(unint64_t)a3 forDrawableAnchorId:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mDrawableAnchorCache, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3), a4);
}

- (unint64_t)characterPositionForDrawableAnchorId:(id)a3
{
  id v3;

  v3 = -[NSMutableDictionary objectForKey:](self->mDrawableAnchorCache, "objectForKey:", a3);
  if (v3)
    return (unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)displayValueForStyleSelector:(id)a3
{
  unordered_map<unsigned long, NSNumber *, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, NSNumber *>>> *p_mDisplayValueCache;
  id result;
  id v5;

  if (!a3)
    return 0;
  p_mDisplayValueCache = &self->mDisplayValueCache;
  v5 = objc_msgSend(a3, "hash");
  result = sub_1D37A4(p_mDisplayValueCache, (unint64_t *)&v5);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (void)setDisplayValue:(BOOL)a3 forStyleSelector:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id *v8;

  if (a4)
  {
    v4 = a3;
    v7 = objc_msgSend(a4, "hash");
    v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", v4);
    v8 = &v7;
    sub_1D77F0((uint64_t)&self->mDisplayValueCache, (unint64_t *)&v7, (uint64_t)&std::piecewise_construct, &v8)[3] = v6;
  }
}

- (int)whitespaceValueForStyleSelector:(id)a3
{
  unordered_map<unsigned long, PFXWhitespaceType, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, PFXWhitespaceType>>> *p_mWhitespaceValueCache;
  _QWORD *v4;
  id v6;

  if (!a3)
    return 5;
  p_mWhitespaceValueCache = &self->mWhitespaceValueCache;
  v6 = objc_msgSend(a3, "hash");
  v4 = sub_1D37A4(p_mWhitespaceValueCache, (unint64_t *)&v6);
  if (v4)
    return *((_DWORD *)v4 + 6);
  else
    return 5;
}

- (void)setWhitespaceValue:(int)a3 forStyleSelector:(id)a4
{
  id v6;
  id *v7;

  if (a4)
  {
    v6 = objc_msgSend(a4, "hash");
    v7 = &v6;
    *((_DWORD *)sub_1D7A0C((uint64_t)&self->mWhitespaceValueCache, (unint64_t *)&v6, (uint64_t)&std::piecewise_construct, &v7)+ 6) = a3;
  }
}

- (id)sourceDrawableInfoForIdentifier:(id)a3
{
  if (a3)
    return (id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[NSMutableDictionary objectForKey:](self->mSourceDrawableInfoForIdentifier, "objectForKey:"));
  else
    return 0;
}

- (void)setSourceDrawableInfo:(id)a3 forIdentifier:(id)a4
{
  NSMutableDictionary *mSourceDrawableInfoForIdentifier;

  if (a3 && a4 && objc_msgSend(a4, "length"))
  {
    mSourceDrawableInfoForIdentifier = self->mSourceDrawableInfoForIdentifier;
    if (!mSourceDrawableInfoForIdentifier)
    {
      mSourceDrawableInfoForIdentifier = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->mSourceDrawableInfoForIdentifier = mSourceDrawableInfoForIdentifier;
    }
    -[NSMutableDictionary setObject:forKey:](mSourceDrawableInfoForIdentifier, "setObject:forKey:", a3, a4);
  }
}

- (PFXHtmlReaderState)readerState
{
  return self->mReaderState;
}

- (PFSStyleCache)styleCache
{
  return self->mStyleCache;
}

- (PFSPageCache)pageCache
{
  return self->mPageCache;
}

- (TSPObjectContext)objectContext
{
  return self->mObjectContext;
}

- (TSWPStorage)bodyStorage
{
  return self->mBodyStorage;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (TSWPParagraphStyle)defaultParagraphStyle
{
  return self->mDefaultParagraphStyle;
}

- (TSWPListStyle)defaultNoneListStyle
{
  return self->mDefaultNoneListStyle;
}

- (int64_t)listStart
{
  return self->mListStart;
}

- (void)setListStart:(int64_t)a3
{
  self->mListStart = a3;
}

- (BOOL)inList
{
  return self->mInList;
}

- (NSMutableDictionary)drawableAttachmentCache
{
  return self->mDrawableAttachmentCache;
}

- (void).cxx_destruct
{
  unint64_t *begin;
  double *v4;

  begin = self->mPageStartIndices.__begin_;
  if (begin)
  {
    self->mPageStartIndices.__end_ = begin;
    operator delete(begin);
  }
  sub_1D71DC(&self->mListOrdered.c.__map_.__first_);
  v4 = self->mListTextIndents.__begin_;
  if (v4)
  {
    self->mListTextIndents.__end_ = v4;
    operator delete(v4);
  }
  sub_1D3DA8((uint64_t)&self->mWhitespaceValueCache);
  sub_1D3DA8((uint64_t)&self->mDisplayValueCache);
  sub_1D3DA8((uint64_t)&self->mParagraphStyleCache);
  sub_1D3DA8((uint64_t)&self->mCharacterStyleCache);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  return self;
}

- (id)characterStyleForStyleSelector:(id)a3
{
  unordered_map<unsigned long, TSSStyle *, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, TSSStyle *>>> *p_mCharacterStyleCache;
  id result;
  id v5;

  if (!a3)
    return 0;
  p_mCharacterStyleCache = &self->mCharacterStyleCache;
  v5 = objc_msgSend(a3, "hash");
  result = sub_1D37A4(p_mCharacterStyleCache, (unint64_t *)&v5);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (void)setCharacterStyle:(id)a3 forStyleSelector:(id)a4
{
  id v6;
  id v7;
  id *v8;

  if (a4)
  {
    v7 = objc_msgSend(a4, "hash");
    v6 = a3;
    v8 = &v7;
    sub_1D77F0((uint64_t)&self->mCharacterStyleCache, (unint64_t *)&v7, (uint64_t)&std::piecewise_construct, &v8)[3] = v6;
  }
}

- (id)paragraphStyleForStyleSelector:(id)a3
{
  unordered_map<unsigned long, TSSStyle *, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, TSSStyle *>>> *p_mParagraphStyleCache;
  id result;
  id v5;

  if (!a3)
    return 0;
  p_mParagraphStyleCache = &self->mParagraphStyleCache;
  v5 = objc_msgSend(a3, "hash");
  result = sub_1D37A4(p_mParagraphStyleCache, (unint64_t *)&v5);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (void)setParagraphStyle:(id)a3 forStyleSelector:(id)a4
{
  id v6;
  id v7;
  id *v8;

  if (a4)
  {
    v7 = objc_msgSend(a4, "hash");
    v6 = a3;
    v8 = &v7;
    sub_1D77F0((uint64_t)&self->mParagraphStyleCache, (unint64_t *)&v7, (uint64_t)&std::piecewise_construct, &v8)[3] = v6;
  }
}

@end
