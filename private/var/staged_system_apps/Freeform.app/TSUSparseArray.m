@implementation TSUSparseArray

+ (id)array
{
  uint64_t v2;

  v2 = objc_opt_class(a1, a2);
  return (id)objc_opt_new(v2);
}

- (void)dealloc
{
  tsuSaPage *topPage;
  objc_super v4;

  topPage = self->_topPage;
  if (topPage)
  {
    (*((void (**)(tsuSaPage *, SEL))topPage->var0 + 1))(topPage, a2);
    self->_topPage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUSparseArray;
  -[TSUSparseArray dealloc](&v4, "dealloc");
}

- (id)description
{
  double v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1001BABFC;
  v12 = sub_1001BAC0C;
  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>:"), v3, v4, self));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BAC14;
  v7[3] = &unk_101241610;
  v7[4] = &v8;
  -[TSUSparseArray foreach:](self, "foreach:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (unint64_t)maxIndexForCurrentDepth
{
  unsigned int depth;
  char v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  depth = self->_depth;
  if (!depth)
    return 0;
  v3 = 8 * depth;
  if (8 * depth >= 0x21)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241630);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E075C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241650);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DEB414(v6, (uint64_t)&v10, v4);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUSparseArray maxIndexForCurrentDepth]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSparseArray.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 301, 0, "Not expecting a shiftedDepth larger than 32");

  }
  return ~(-1 << v3);
}

- (id)objectForKey:(unint64_t)a3
{
  uint64_t depth;
  unint64_t v6;
  uint64_t v8;
  char *v9;
  tsuSaPage *topPage;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  depth = self->_depth;
  if (!(_DWORD)depth)
    return 0;
  v6 = -[TSUSparseArray maxIndexForCurrentDepth](self, "maxIndexForCurrentDepth");
  if (v6 < a3)
    return 0;
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - v8;
  topPage = self->_topPage;
  v11 = depth;
  do
  {
    v12 = a3;
    a3 >>= 8;
    *(_QWORD *)&v9[8 * --v11] = v12;
  }
  while (v11);
  v13 = (depth - 1);
  if ((_DWORD)depth == 1)
  {
    v13 = 0;
    return topPage[*(_QWORD *)&v9[8 * v13] + 1].var0;
  }
  else
  {
    v14 = (depth - 1);
    v15 = (uint64_t *)v9;
    while (1)
    {
      v16 = *v15++;
      topPage = (tsuSaPage *)topPage[v16 + 1].var0;
      if (!topPage)
        break;
      if (!--v14)
        return topPage[*(_QWORD *)&v9[8 * v13] + 1].var0;
    }
    return 0;
  }
}

- (void)increaseDepth
{
  unsigned int depth;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  depth = self->_depth;
  if (depth)
  {
    if (depth >= 4)
    {
      v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241670);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E07644();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241690);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DEB414(v5, (uint64_t)&v8, v3);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUSparseArray increaseDepth]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSparseArray.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 335, 0, "TSUSparseArray - getting too deep");

    }
    operator new();
  }
  operator new();
}

- (void)setObject:(id)a3 forKey:(unint64_t)a4
{
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int depth;
  uint64_t v10;
  uint64_t v11;
  tsuSaPage *topPage;
  unint64_t v13;
  unint64_t v14;
  id v15;

  v15 = a3;
  while (1)
  {
    v6 = -[TSUSparseArray maxIndexForCurrentDepth](self, "maxIndexForCurrentDepth", v15);
    if (v6 >= a4)
    {
      if (self->_depth)
        break;
    }
    -[TSUSparseArray increaseDepth](self, "increaseDepth");
  }
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - v7;
  depth = self->_depth;
  if (depth)
  {
    v10 = self->_depth;
    do
    {
      v11 = a4;
      a4 >>= 8;
      *(_QWORD *)&v8[8 * --v10] = v11;
    }
    while (v10);
    topPage = self->_topPage;
    if (depth == 1)
    {
      v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    topPage = self->_topPage;
  }
  v14 = 0;
  do
  {
    topPage = (tsuSaPage *)topPage[*(_QWORD *)&v8[8 * v14] + 1].var0;
    if (!topPage)
    {
      if (v14 == depth - 2)
        operator new();
      operator new();
    }
    ++v14;
    v13 = depth - 1;
  }
  while (v14 < v13);
LABEL_17:
  self->_nonNilCount += (int)sub_1001BB440((uint64_t)topPage, v15, *(_QWORD *)&v8[8 * v13]);

}

- (BOOL)hasObjectForKey:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSUSparseArray objectForKey:](self, "objectForKey:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)removeObjectForKey:(unint64_t)a3
{
  -[TSUSparseArray setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (void)foreach:(id)a3
{
  id v4;
  tsuSaPage *topPage;
  char v6;

  v4 = a3;
  topPage = self->_topPage;
  if (topPage)
  {
    v6 = 0;
    (*((void (**)(tsuSaPage *, id, _QWORD, char *))topPage->var0 + 5))(topPage, v4, 0, &v6);
  }

}

- (void)addObjectsFromArray:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001BB584;
  v3[3] = &unk_1012416B8;
  v3[4] = self;
  objc_msgSend(a3, "foreach:", v3);
}

- (void)clear
{
  tsuSaPage *topPage;

  topPage = self->_topPage;
  if (topPage)
  {
    (*((void (**)(tsuSaPage *, SEL))topPage->var0 + 1))(topPage, a2);
    self->_topPage = 0;
    self->_depth = 0;
  }
}

- (unint64_t)count
{
  return self->_nonNilCount;
}

- (unint64_t)minKey
{
  tsuSaPage *topPage;

  topPage = self->_topPage;
  if (topPage)
    return (*((uint64_t (**)(tsuSaPage *, _QWORD))topPage->var0 + 2))(topPage, 0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)maxKey
{
  tsuSaPage *topPage;

  topPage = self->_topPage;
  if (topPage)
    return (*((uint64_t (**)(tsuSaPage *, _QWORD))topPage->var0 + 3))(topPage, 0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSIndexSet)populatedKeys
{
  tsuSaPage *topPage;
  uint64_t v3;
  void *v4;

  topPage = self->_topPage;
  if (topPage)
  {
    v3 = (*((uint64_t (**)(tsuSaPage *, _QWORD))topPage->var0 + 4))(topPage, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSet](NSIndexSet, "indexSet"));
  }
  return (NSIndexSet *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSUSparseArray *v4;
  tsuSaPage *topPage;

  v4 = objc_opt_new(TSUSparseArray);
  v4->_depth = self->_depth;
  topPage = self->_topPage;
  v4->_nonNilCount = self->_nonNilCount;
  if (topPage)
    topPage = (tsuSaPage *)(*((uint64_t (**)(tsuSaPage *))topPage->var0 + 6))(topPage);
  v4->_topPage = topPage;
  return v4;
}

@end
