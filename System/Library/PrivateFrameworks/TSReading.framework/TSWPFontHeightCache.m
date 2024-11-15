@implementation TSWPFontHeightCache

+ (id)sharedCache
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)+[TSWPFontHeightCache sharedCache]::sSingletonInstance;
  if (!+[TSWPFontHeightCache sharedCache]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSWPFontHeightCache sharedCache]::sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSWPFontHeightCache sharedCache]::sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPFontHeightCache sharedCache]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontHeightCache.mm"), 34, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSWPFontHeightCache sharedCache]::sSingletonInstance;
  }
  return result;
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)fontHeightInfoForFont:(SEL)a3
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  $8502DCEA08BBBE1AB2005217B3838BBD *result;
  double Size;
  CGFloat Leading;
  double var3;
  double var2;
  void *v15;
  uint64_t v16;
  char v17;

  *retstr = *($8502DCEA08BBBE1AB2005217B3838BBD *)gZeroHeightInfo;
  if (!a4)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontHeightCache fontHeightInfoForFont:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontHeightCache.mm"), 67, CFSTR("invalid nil value for '%s'"), "font");
  }
  pthread_rwlock_rdlock(&self->_lock);
  v17 = 0;
  v9 = -[TSWPFontHeightCache p_findEntryForFont:outHeightInfo:collision:](self, "p_findEntryForFont:outHeightInfo:collision:", a4, retstr, &v17);
  result = ($8502DCEA08BBBE1AB2005217B3838BBD *)pthread_rwlock_unlock(&self->_lock);
  if (!v9)
  {
    pthread_rwlock_wrlock(&self->_lock);
    if (!-[TSWPFontHeightCache p_findEntryForFont:outHeightInfo:collision:](self, "p_findEntryForFont:outHeightInfo:collision:", a4, retstr, &v17))
    {
      Size = TSWPDefaultLineHeightForFont(a4);
      retstr->var2 = CTFontGetAscent(a4);
      retstr->var3 = CTFontGetDescent(a4);
      retstr->var7 = CTFontGetCapHeight(a4);
      Leading = CTFontGetLeading(a4);
      var2 = retstr->var2;
      var3 = retstr->var3;
      if (var2 == 0.0 && var3 == 0.0 && Leading == 0.0)
      {
        v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontHeightCache fontHeightInfoForFont:]");
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontHeightCache.mm"), 95, CFSTR("Bad metrics for font %@"), a4);
        Size = CTFontGetSize(a4);
        var3 = Size * 0.5;
        retstr->var2 = Size * 0.5;
        retstr->var3 = Size * 0.5;
        var2 = Size * 0.5;
      }
      retstr->var4 = Size - var2 - var3 - Leading;
      retstr->var5 = Leading;
      if (!v17)
        -[TSWPFontHeightCache p_addEntryForFont:heightInfo:](self, "p_addEntryForFont:heightInfo:", a4, retstr);
    }
    return ($8502DCEA08BBBE1AB2005217B3838BBD *)pthread_rwlock_unlock(&self->_lock);
  }
  return result;
}

- (BOOL)p_findEntryForFont:(__CTFont *)a3 outHeightInfo:(id *)a4 collision:(BOOL *)a5
{
  void *v9;
  uint64_t v10;
  CFHashCode v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *v15;
  CFHashCode v16;
  BOOL v17;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> **v18;
  int v19;
  __CTFont *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (!a4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFontHeightCache p_findEntryForFont:outHeightInfo:collision:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontHeightCache.mm"), 119, CFSTR("invalid nil value for '%s'"), "heightInfo");
  }
  v11 = CFHash(a3);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *)self->_fontHashToInfoMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_fontHashToInfoMap.__tree_.__pair1_;
  v12 = left;
  if (!left)
    goto LABEL_14;
  v15 = p_pair1;
  do
  {
    v16 = (CFHashCode)v12[4].__value_.__left_;
    v17 = v16 >= v11;
    if (v16 >= v11)
      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> **)v12;
    else
      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> **)&v12[1];
    if (v17)
      v15 = v12;
    v12 = *v18;
  }
  while (*v18);
  if (v15 != p_pair1 && (void *)v11 >= v15[4].__value_.__left_)
  {
    *a5 = 0;
    v20 = (__CTFont *)v15[13].__value_.__left_;
    if (v20 == a3 || (v19 = CFEqual(v20, a3)) != 0)
    {
      v21 = *(_OWORD *)&v15[5].__value_.__left_;
      v22 = *(_OWORD *)&v15[7].__value_.__left_;
      v23 = *(_OWORD *)&v15[11].__value_.__left_;
      *(_OWORD *)&a4->var4 = *(_OWORD *)&v15[9].__value_.__left_;
      *(_OWORD *)&a4->var6 = v23;
      *(_OWORD *)&a4->var0 = v21;
      *(_OWORD *)&a4->var2 = v22;
      LOBYTE(v19) = 1;
    }
    else
    {
      *a5 = 1;
    }
  }
  else
  {
LABEL_14:
    LOBYTE(v19) = 0;
    *a5 = 0;
  }
  return v19;
}

- (TSWPFontHeightCache)init
{
  TSWPFontHeightCache *v2;
  TSWPFontHeightCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPFontHeightCache;
  v2 = -[TSWPFontHeightCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maxCacheSize = 32;
    pthread_rwlock_init(&v2->_lock, 0);
  }
  return v3;
}

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSWPFontHeightCache;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

- (void)p_addEntryForFont:(__CTFont *)a3 heightInfo:(id *)a4
{
  CFHashCode v7;
  _QWORD *v8;
  _QWORD *next;
  unint64_t v10;
  uint64_t **v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t *v15;
  unsigned int maxCacheSize;
  unsigned int v17;
  uint64_t **v18;
  uint64_t *prev;
  uint64_t v20;
  CFHashCode v21;
  unint64_t *v22;

  v7 = CFHash(a3);
  v21 = v7;
  v8 = operator new(0x18uLL);
  next = self->_fontHashList.__end_.__next_;
  *v8 = &self->_fontHashList;
  v8[1] = next;
  v8[2] = v7;
  *next = v8;
  v10 = self->_fontHashList.__size_alloc_.__value_ + 1;
  self->_fontHashList.__end_.__next_ = v8;
  self->_fontHashList.__size_alloc_.__value_ = v10;
  v22 = &v21;
  v11 = std::__tree<std::__value_type<unsigned long,TSWPFontHeightCacheEntry>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,TSWPFontHeightCacheEntry>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,TSWPFontHeightCacheEntry>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->_fontHashToInfoMap, &v21, (uint64_t)&std::piecewise_construct, &v22);
  v12 = *(_OWORD *)&a4->var0;
  v13 = *(_OWORD *)&a4->var2;
  v14 = *(_OWORD *)&a4->var4;
  *(_OWORD *)(v11 + 11) = *(_OWORD *)&a4->var6;
  *(_OWORD *)(v11 + 9) = v14;
  *(_OWORD *)(v11 + 7) = v13;
  *(_OWORD *)(v11 + 5) = v12;
  v15 = (uint64_t *)CFRetain(a3);
  v22 = &v21;
  std::__tree<std::__value_type<unsigned long,TSWPFontHeightCacheEntry>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,TSWPFontHeightCacheEntry>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,TSWPFontHeightCacheEntry>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->_fontHashToInfoMap, &v21, (uint64_t)&std::piecewise_construct, &v22)[13] = v15;
  maxCacheSize = self->_maxCacheSize;
  v17 = self->_cacheSize + 1;
  self->_cacheSize = v17;
  if (v17 > maxCacheSize)
  {
    v22 = (unint64_t *)((char *)self->_fontHashList.__end_.__prev_ + 16);
    v18 = std::__tree<std::__value_type<unsigned long,TSWPFontHeightCacheEntry>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,TSWPFontHeightCacheEntry>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,TSWPFontHeightCacheEntry>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->_fontHashToInfoMap, v22, (uint64_t)&std::piecewise_construct, &v22);
    CFRelease(v18[13]);
    std::__tree<objc_object  {objcproto19TSWPStorageObserver}*>::__erase_unique<objc_object  {objcproto19TSWPStorageObserver}>((uint64_t)&self->_fontHashToInfoMap, (unint64_t *)self->_fontHashList.__end_.__prev_ + 2);
    prev = (uint64_t *)self->_fontHashList.__end_.__prev_;
    v20 = *prev;
    *(_QWORD *)(v20 + 8) = prev[1];
    *(_QWORD *)prev[1] = v20;
    --self->_fontHashList.__size_alloc_.__value_;
    operator delete(prev);
    --self->_cacheSize;
  }
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

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPFontHeightCache allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFontHeightCache.mm"), 34, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *begin_node;
  TSWPFontHeightCache *left;
  TSWPFontHeightCache *v5;
  BOOL v6;
  objc_super v7;

  pthread_rwlock_destroy(&self->_lock);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *)self->_fontHashToInfoMap.__tree_.__begin_node_;
  if (begin_node != &self->_fontHashToInfoMap.__tree_.__pair1_)
  {
    do
    {
      CFRelease(begin_node[13].__value_.__left_);
      left = (TSWPFontHeightCache *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v5 = left;
          left = (TSWPFontHeightCache *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v5 = (TSWPFontHeightCache *)begin_node[2].__value_.__left_;
          v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, TSWPFontHeightCacheEntry>, void *>>> *)v5;
    }
    while (v5 != (TSWPFontHeightCache *)&self->_fontHashToInfoMap.__tree_.__pair1_);
  }
  v7.receiver = self;
  v7.super_class = (Class)TSWPFontHeightCache;
  -[TSWPFontHeightCache dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&self->_fontHashToInfoMap, (_QWORD *)self->_fontHashToInfoMap.__tree_.__pair1_.__value_.__left_);
  std::__list_imp<EQKit::StemStretch::FeatureRange::Span>::clear(&self->_fontHashList.__end_.__prev_);
}

@end
