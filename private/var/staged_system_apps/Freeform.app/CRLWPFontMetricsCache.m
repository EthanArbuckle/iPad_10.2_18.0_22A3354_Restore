@implementation CRLWPFontMetricsCache

+ (id)sharedCache
{
  if (qword_101415080 != -1)
    dispatch_once(&qword_101415080, &stru_1012454C8);
  return (id)qword_101415088;
}

- (CRLWPFontMetricsCache)init
{
  CRLWPFontMetricsCache *v2;
  CRLWPFontMetricsCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPFontMetricsCache;
  v2 = -[CRLWPFontMetricsCache init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_maxCacheSize = 32;
    pthread_rwlock_init(&v2->_lock, 0);
  }
  return v3;
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *begin_node;
  CRLWPFontMetricsCache *left;
  CRLWPFontMetricsCache *v5;
  BOOL v6;
  objc_super v7;

  pthread_rwlock_destroy(&self->_lock);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)self->_fontHashToInfoMap.__tree_.__begin_node_;
  if (begin_node != &self->_fontHashToInfoMap.__tree_.__pair1_)
  {
    do
    {
      CFRelease(begin_node[18].__value_.__left_);
      left = (CRLWPFontMetricsCache *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v5 = left;
          left = (CRLWPFontMetricsCache *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v5 = (CRLWPFontMetricsCache *)begin_node[2].__value_.__left_;
          v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)v5;
    }
    while (v5 != (CRLWPFontMetricsCache *)&self->_fontHashToInfoMap.__tree_.__pair1_);
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLWPFontMetricsCache;
  -[CRLWPFontMetricsCache dealloc](&v7, "dealloc");
}

- (CRLWPFontHeightInfo)fontHeightInfoForFont:(SEL)a3
{
  uint64_t v5;

  v5 = 0;
  return -[CRLWPFontMetricsCache p_fontHeightInfoForFont:outWidths:](self, "p_fontHeightInfoForFont:outWidths:", a4, &v5);
}

- (CRLWPFontHeightInfo)p_fontHeightInfoForFont:(SEL)a3 outWidths:(__CTFont *)a4
{
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  CRLWPFontHeightInfo *result;
  double Size;
  CGFloat Leading;
  double ascent;
  double descent;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  char v27;
  char v28;
  _BYTE v29[32];
  _BYTE v30[24];

  *retstr = *(CRLWPFontHeightInfo *)byte_100EED860;
  if (!a4)
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012454E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0DF18(v9);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245508);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEB414(v11, (uint64_t)v30, v9);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontMetricsCache p_fontHeightInfoForFont:outWidths:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontMetricsCache.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 54, 0, "invalid nil value for '%{public}s'", "font");

  }
  pthread_rwlock_rdlock(&self->_lock);
  v28 = 0;
  v14 = -[CRLWPFontMetricsCache p_findEntryForFont:outHeightInfo:outWidths:outCollision:](self, "p_findEntryForFont:outHeightInfo:outWidths:outCollision:", a4, retstr, a5, &v28);
  result = (CRLWPFontHeightInfo *)pthread_rwlock_unlock(&self->_lock);
  if ((v14 & 1) == 0)
  {
    Size = sub_1001B200C(a4);
    retstr->ascent = CTFontGetAscent(a4);
    retstr->descent = CTFontGetDescent(a4);
    retstr->capHeight = CTFontGetCapHeight(a4);
    retstr->xHeight = CTFontGetXHeight(a4);
    retstr->underlinePosition = CTFontGetUnderlinePosition(a4);
    retstr->underlineThickness = CTFontGetUnderlineThickness(a4);
    Leading = CTFontGetLeading(a4);
    ascent = retstr->ascent;
    descent = retstr->descent;
    if (ascent == 0.0 && descent == 0.0 && Leading == 0.0)
    {
      v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245528);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0DE98();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245548);
      v21 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DEB414(v22, (uint64_t)v29, v20);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontMetricsCache p_fontHeightInfoForFont:outWidths:]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontMetricsCache.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 78, 0, "Bad metrics for font %{public}@", a4);

      Size = CTFontGetSize(a4);
      descent = Size * 0.5;
      retstr->descent = Size * 0.5;
      retstr->ascent = Size * 0.5;
      ascent = Size * 0.5;
    }
    if (retstr->capHeight <= 0.0)
      retstr->capHeight = ascent;
    retstr->leadingAbove = Size - ascent - descent - Leading;
    retstr->leadingBelow = Leading;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CTFont description](a4, "description"));
    -[CRLWPFontMetricsCache validateFontHeightInfo:description:](self, "validateFontHeightInfo:description:", retstr, v25);

    if (!v28)
    {
      pthread_rwlock_wrlock(&self->_lock);
      v26 = -[CRLWPFontMetricsCache p_findEntryForFont:outHeightInfo:outWidths:outCollision:](self, "p_findEntryForFont:outHeightInfo:outWidths:outCollision:", a4, retstr, a5, &v28);
      if (v28)
        v27 = 1;
      else
        v27 = v26;
      if ((v27 & 1) == 0)
        -[CRLWPFontMetricsCache p_addEntryForFont:heightInfo:widths:](self, "p_addEntryForFont:heightInfo:widths:", a4, retstr, *a5);
      return (CRLWPFontHeightInfo *)pthread_rwlock_unlock(&self->_lock);
    }
  }
  return result;
}

- (unint64_t)supportedFractionalWidthsForFont:(__CTFont *)a3
{
  unint64_t v4;

  v4 = 0;
  -[CRLWPFontMetricsCache p_fontHeightInfoForFont:outWidths:](self, "p_fontHeightInfoForFont:outWidths:", a3, &v4);
  return v4;
}

- (void)validateFontHeightInfo:(const CRLWPFontHeightInfo *)a3 description:(id)a4
{

}

- (BOOL)p_findEntryForFont:(__CTFont *)a3 outHeightInfo:(CRLWPFontHeightInfo *)a4 outWidths:(unint64_t *)a5 outCollision:(BOOL *)a6
{
  CFHashCode v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *v15;
  CFHashCode v16;
  BOOL v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> **v18;
  int v19;
  __CTFont *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v11 = CFHash(a3);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)self->_fontHashToInfoMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_fontHashToInfoMap.__tree_.__pair1_;
  v12 = left;
  if (!left)
    goto LABEL_12;
  v15 = p_pair1;
  do
  {
    v16 = (CFHashCode)v12[4].__value_.__left_;
    v17 = v16 >= v11;
    if (v16 >= v11)
      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> **)v12;
    else
      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> **)&v12[1];
    if (v17)
      v15 = v12;
    v12 = *v18;
  }
  while (*v18);
  if (v15 != p_pair1 && (void *)v11 >= v15[4].__value_.__left_)
  {
    *a6 = 0;
    v20 = (__CTFont *)v15[18].__value_.__left_;
    if (v20 == a3 || (v19 = CFEqual(v20, a3)) != 0)
    {
      v21 = *(_OWORD *)&v15[7].__value_.__left_;
      *(_OWORD *)&a4->spaceBefore = *(_OWORD *)&v15[5].__value_.__left_;
      *(_OWORD *)&a4->ascent = v21;
      v22 = *(_OWORD *)&v15[9].__value_.__left_;
      v23 = *(_OWORD *)&v15[11].__value_.__left_;
      v24 = *(_OWORD *)&v15[15].__value_.__left_;
      *(_OWORD *)&a4->verticalHeight = *(_OWORD *)&v15[13].__value_.__left_;
      *(_OWORD *)&a4->underlinePosition = v24;
      *(_OWORD *)&a4->descent = v22;
      *(_OWORD *)&a4->leadingBelow = v23;
      *a5 = (unint64_t)v15[17].__value_.__left_;
      LOBYTE(v19) = 1;
    }
    else
    {
      *a6 = 1;
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v19) = 0;
    *a6 = 0;
  }
  return v19;
}

- (void)p_addEntryForFont:(__CTFont *)a3 heightInfo:(const CRLWPFontHeightInfo *)a4 widths:(unint64_t)a5
{
  CFHashCode v9;
  _QWORD *v10;
  _QWORD *next;
  unint64_t v12;
  uint64_t **v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  unsigned int maxCacheSize;
  unsigned int v20;
  uint64_t **v21;
  uint64_t *prev;
  uint64_t v23;
  CFHashCode v24;
  unint64_t *v25;

  v9 = CFHash(a3);
  v24 = v9;
  v10 = operator new(0x18uLL);
  next = self->_fontHashList.__end_.__next_;
  *v10 = &self->_fontHashList;
  v10[1] = next;
  v10[2] = v9;
  *next = v10;
  v12 = self->_fontHashList.__size_alloc_.__value_ + 1;
  self->_fontHashList.__end_.__next_ = v10;
  self->_fontHashList.__size_alloc_.__value_ = v12;
  v25 = &v24;
  v13 = sub_1002190F8((uint64_t **)&self->_fontHashToInfoMap, &v24, (uint64_t)&unk_100EEC1A0, &v25);
  v14 = *(_OWORD *)&a4->spaceBefore;
  *(_OWORD *)(v13 + 7) = *(_OWORD *)&a4->ascent;
  *(_OWORD *)(v13 + 5) = v14;
  v15 = *(_OWORD *)&a4->descent;
  v16 = *(_OWORD *)&a4->leadingBelow;
  v17 = *(_OWORD *)&a4->verticalHeight;
  *(_OWORD *)(v13 + 15) = *(_OWORD *)&a4->underlinePosition;
  *(_OWORD *)(v13 + 13) = v17;
  *(_OWORD *)(v13 + 11) = v16;
  *(_OWORD *)(v13 + 9) = v15;
  v25 = &v24;
  sub_1002190F8((uint64_t **)&self->_fontHashToInfoMap, &v24, (uint64_t)&unk_100EEC1A0, &v25)[17] = (uint64_t *)a5;
  v18 = (uint64_t *)CFRetain(a3);
  v25 = &v24;
  sub_1002190F8((uint64_t **)&self->_fontHashToInfoMap, &v24, (uint64_t)&unk_100EEC1A0, &v25)[18] = v18;
  maxCacheSize = self->_maxCacheSize;
  v20 = self->_cacheSize + 1;
  self->_cacheSize = v20;
  if (v20 > maxCacheSize)
  {
    v25 = (unint64_t *)((char *)self->_fontHashList.__end_.__prev_ + 16);
    v21 = sub_1002190F8((uint64_t **)&self->_fontHashToInfoMap, v25, (uint64_t)&unk_100EEC1A0, &v25);
    CFRelease(v21[18]);
    sub_1002191D4((uint64_t)&self->_fontHashToInfoMap, (unint64_t *)self->_fontHashList.__end_.__prev_ + 2);
    prev = (uint64_t *)self->_fontHashList.__end_.__prev_;
    v23 = *prev;
    *(_QWORD *)(v23 + 8) = prev[1];
    *(_QWORD *)prev[1] = v23;
    --self->_fontHashList.__size_alloc_.__value_;
    operator delete(prev);
    --self->_cacheSize;
  }
}

- (void).cxx_destruct
{
  sub_10001CE40((uint64_t)&self->_fontHashToInfoMap, (_QWORD *)self->_fontHashToInfoMap.__tree_.__pair1_.__value_.__left_);
  sub_100219098(&self->_fontHashList.__end_.__prev_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = (char *)self + 8;
  *((_QWORD *)self + 2) = (char *)self + 8;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

@end
