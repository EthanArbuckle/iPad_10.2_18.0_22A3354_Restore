@implementation CRLWPCTTypesetterCache

- (void)dealloc
{
  objc_super v3;

  -[CRLWPCTTypesetterCache clearCache](self, "clearCache");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPCTTypesetterCache;
  -[CRLWPCTTypesetterCache dealloc](&v3, "dealloc");
}

- (shared_ptr<CRLWPParagraphTypesetter>)cachedTypesetterForParagraphIdentifier:(unint64_t)a3
{
  _QWORD *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *v7;
  unint64_t v8;
  BOOL v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> **v10;
  shared_ptr<CRLWPParagraphTypesetter> result;

  *v3 = 0;
  v3[1] = 0;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  v5 = left;
  if (left)
  {
    v7 = p_pair1;
    do
    {
      v8 = (unint64_t)v5[4].__value_.__left_;
      v9 = v8 >= a3;
      if (v8 >= a3)
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> **)v5;
      else
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> **)&v5[1];
      if (v9)
        v7 = v5;
      v5 = *v10;
    }
    while (*v10);
    if (v7 != p_pair1 && v7[4].__value_.__left_ <= (void *)a3)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *)sub_1001316E4(v3, (uint64_t *)&v7[5]);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (CRLWPParagraphTypesetter *)p_pair1;
  return result;
}

- (void)addTypesetterForParagraphIdentifier:(unint64_t)a3 typesetter:(shared_ptr<CRLWPParagraphTypesetter>)a4
{
  uint64_t *var0;
  uint64_t *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint8_t buf[8];

  v13 = a3;
  if (*(_QWORD *)a4.var0)
  {
    var0 = (uint64_t *)a4.var0;
    *(_QWORD *)buf = &v13;
    v6 = sub_1001951E0((uint64_t **)&self->_typesetters, &v13, (uint64_t)&unk_100EEC1A0, (uint64_t **)buf);
    sub_1001316E4(v6 + 5, var0);
    -[CRLWPCTTypesetterCache p_limitCacheSize:](self, "p_limitCacheSize:", v13);
    if (self->_typesetters.__tree_.__pair3_.__value_ >= 0x41)
    {
      v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F430);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E04194(v7, v8);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F450);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E02830(v10, buf, v7, (os_log_t)v9);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPCTTypesetterCache addTypesetterForParagraphIdentifier:typesetter:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPCTTypesetterCache.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 43, 0, "too many entries in our typesetter cache");

    }
  }
}

- (void)removeTypesetterForParagraphIndex:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *p_pair1;
  _QWORD *left;
  uint64_t **p_typesetters;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;

  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  left = self->_typesetters.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_typesetters = (uint64_t **)&self->_typesetters;
    v6 = (uint64_t *)p_pair1;
    do
    {
      v7 = left[4];
      v8 = v7 >= a3;
      if (v7 >= a3)
        v9 = left;
      else
        v9 = left + 1;
      if (v8)
        v6 = left;
      left = (_QWORD *)*v9;
    }
    while (*v9);
    if (v6 != (uint64_t *)p_pair1 && v6[4] <= a3)
    {
      sub_10001DAF0(p_typesetters, v6);
      sub_100038CC0((uint64_t)(v6 + 5));
      operator delete(v6);
    }
  }
}

- (void)clearCache
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *p_pair1;

  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  sub_100195308((uint64_t)&self->_typesetters, (_QWORD *)self->_typesetters.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

- (void)p_limitCacheSize:(unint64_t)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *p_pair1;
  uint64_t *left;
  uint64_t *v5;
  BOOL v6;
  uint64_t **p_typesetters;

  if (self->_typesetters.__tree_.__pair3_.__value_ >= 0x41)
  {
    p_pair1 = &self->_typesetters.__tree_.__pair1_;
    left = (uint64_t *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      do
      {
        v5 = left;
        left = (uint64_t *)left[1];
      }
      while (left);
    }
    else
    {
      do
      {
        v5 = (uint64_t *)p_pair1[2].__value_.__left_;
        v6 = *v5 == (_QWORD)p_pair1;
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *)v5;
      }
      while (v6);
    }
    p_typesetters = (uint64_t **)&self->_typesetters;
    if (v5[4] == a3)
      v5 = *p_typesetters;
    sub_10001DAF0(p_typesetters, v5);
    sub_100038CC0((uint64_t)(v5 + 5));
    operator delete(v5);
  }
}

- (void).cxx_destruct
{
  sub_100195308((uint64_t)&self->_typesetters, (_QWORD *)self->_typesetters.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
