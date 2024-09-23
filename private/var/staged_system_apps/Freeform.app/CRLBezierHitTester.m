@implementation CRLBezierHitTester

- (CRLBezierHitTester)initWithBucketSize:(double)a3
{
  CRLBezierHitTester *v4;
  CRLBezierHitTester *v5;
  uint64_t v6;
  NSHashTable *allPathTable;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLBezierHitTester;
  v4 = -[CRLBezierHitTester init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_bucketSize = (unint64_t)a3;
    v4->_nextPathIdForInsertion = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    allPathTable = v5->_allPathTable;
    v5->_allPathTable = (NSHashTable *)v6;

  }
  return v5;
}

- (unint64_t)pathCount
{
  return -[NSHashTable count](self->_allPathTable, "count");
}

- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5 crawlingDistance:(double)a6 clippedToRect:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v12;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  _QWORD **v25;
  _QWORD *v26;
  uint64_t v27;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v12 = a4;
  v23 = a5;
  v24 = a3;
  if (a6 > 1.0 && !self->_allowsLargeCrawlingDistances)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D130);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE923C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D150);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 153, 0, "Passing a crawlingDistance greater than the default may cause unexpected problems hit testing with some methods.");

  }
  if (sub_10001C8C0(&self->_allPathMap.__table_.__bucket_list_.__ptr_.__value_, &v23))
  {
    v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D170);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE9180((uint64_t *)&v23, v18, v19);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D190);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 178, 0, "Tried to add a path with pathID that already exists (%lu)", v23);

  }
  else
  {
    sub_10001C974((uint64_t)&self->_allPathMap, &v23, &v23, &v24);
    -[NSHashTable addObject:](self->_allPathTable, "addObject:", v24);
    v26 = 0;
    v27 = 0;
    v25 = &v26;
    sub_10001CE80((uint64_t)&self->_allNonFilledPointInfosForPathMap, (unint64_t *)&v24, &v24, (uint64_t *)&v25);
    sub_10001CE40((uint64_t)&v25, v26);
    v26 = 0;
    v27 = 0;
    v25 = &v26;
    sub_10001CE80((uint64_t)&self->_allFilledPointInfosForPathMap, (unint64_t *)&v24, &v24, (uint64_t *)&v25);
    sub_10001CE40((uint64_t)&v25, v26);
    if (v12)
    {
      self->_hasAtLeastOneFilledPath = 1;
      -[CRLBezierHitTester p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:](self, "p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:", v24, v23, a6, x, y, width, height);
      -[CRLBezierHitTester p_addFilledPathToGrid:withPathId:clippedToRect:](self, "p_addFilledPathToGrid:withPathId:clippedToRect:", v24, v23, x, y, width, height);
    }
    else
    {
      self->_hasAtLeastOneOpenPath = 1;
      -[CRLBezierHitTester p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:](self, "p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:", v24, v23, a6, x, y, width, height);
    }
    if (v23 == self->_nextPathIdForInsertion)
      self->_nextPathIdForInsertion = v23 + 1;
  }

}

- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5 crawlingDistance:(double)a6
{
  -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:](self, "addPath:filled:pathID:crawlingDistance:clippedToRect:", a3, a4, a5, a6, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (void)addPath:(id)a3 filled:(BOOL)a4 crawlingDistance:(double)a5
{
  -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:](self, "addPath:filled:pathID:crawlingDistance:clippedToRect:", a3, a4, self->_nextPathIdForInsertion, a5, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5
{
  -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:](self, "addPath:filled:pathID:crawlingDistance:clippedToRect:", a3, a4, a5, 1.0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (void)addPath:(id)a3 filled:(BOOL)a4 clippedToRect:(CGRect)a5
{
  -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:](self, "addPath:filled:pathID:crawlingDistance:clippedToRect:", a3, a4, self->_nextPathIdForInsertion, 1.0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)addPath:(id)a3 filled:(BOOL)a4
{
  -[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:](self, "addPath:filled:pathID:crawlingDistance:clippedToRect:", a3, a4, self->_nextPathIdForInsertion, 1.0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);
}

- (void)removePath:(id)a3
{
  id v4;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, CRLBezierPath *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, CRLBezierPath *>, void *>>> *p_p1;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  double *v11;
  double v12;
  double v13;
  double bucketSize;
  double v15;
  double v16;
  double *v17;
  double *v18;
  double *v19;
  BOOL v20;
  double v21;
  double v22;
  id *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *next;
  id v28;
  __int128 v29;
  uint64_t v30;

  v4 = a3;
  v28 = v4;
  p_p1 = &self->_allPathMap.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, CRLBezierPath *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, CRLBezierPath *>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      goto LABEL_5;
  }
  while (p_p1[3].__value_.__next_ != v4);
  next = p_p1[2].__value_.__next_;
  if (next == (void *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D1B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE92BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D1D0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester removePath:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 212, 0, "Tried to remove a path that is not in the hit tester.");

    goto LABEL_24;
  }
  *((_QWORD *)&v29 + 1) = 0;
  v30 = 0;
  *(_QWORD *)&v29 = (char *)&v29 + 8;
  v23 = &v28;
  v9 = sub_10001D180((uint64_t)&self->_allNonFilledPointInfosForPathMap, (unint64_t *)&v28, (uint64_t)&unk_100EEC1A0, &v23);
  sub_10001D3D8((uint64_t)&v25, (uint64_t)(v9 + 3));
  v21 = COERCE_DOUBLE(&v28);
  v10 = sub_10001D180((uint64_t)&self->_allFilledPointInfosForPathMap, (unint64_t *)&v28, (uint64_t)&unk_100EEC1A0, (id **)&v21);
  sub_10001D3D8((uint64_t)&v23, (uint64_t)(v10 + 3));
  sub_10001A5FC(&v29, v25, &v26);
  sub_10001A5FC(&v29, v23, &v24);
  v11 = (double *)v29;
  if ((__int128 *)v29 != (__int128 *)((char *)&v29 + 8))
  {
    do
    {
      v12 = v11[4];
      v13 = v11[5];
      v21 = 0.0;
      v22 = 0.0;
      bucketSize = (double)self->_bucketSize;
      v15 = sub_1003C65B0(v12, bucketSize);
      v16 = sub_1003C65B0(v13, bucketSize);
      v21 = v15;
      v22 = v16;
      v17 = sub_10001D940(&self->_pointInfoGridMap.__table_.__bucket_list_.__ptr_.__value_, &v21);
      if (v17)
        sub_10001DA14((uint64_t **)v17 + 4, (uint64_t)(v11 + 4));
      v18 = (double *)*((_QWORD *)v11 + 1);
      if (v18)
      {
        do
        {
          v19 = v18;
          v18 = *(double **)v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          v19 = (double *)*((_QWORD *)v11 + 2);
          v20 = *(_QWORD *)v19 == (_QWORD)v11;
          v11 = v19;
        }
        while (!v20);
      }
      v11 = v19;
    }
    while (v19 != (double *)((char *)&v29 + 8));
  }
  sub_10001DEE4(&self->_allPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&next);
  -[NSHashTable removeObject:](self->_allPathTable, "removeObject:", v28);
  sub_10001E154(&self->_allNonFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v28);
  sub_10001E154(&self->_allFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v28);
  sub_10001CE40((uint64_t)&v23, v24);
  sub_10001CE40((uint64_t)&v25, v26);
  sub_10001CE40((uint64_t)&v29, *((_QWORD **)&v29 + 1));
LABEL_24:

}

- (vector<CRLBezierHitTesterHitInfo,)closestHitsTo:(CRLBezierHitTester *)self withSearchThreshold:(SEL)a3 passingTest:(CGPoint)a4
{
  double y;
  double x;
  id v11;
  uint64_t *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __compressed_pair<CRLBezierHitTesterHitInfo *, std::allocator<CRLBezierHitTesterHitInfo>> *p_var2;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  vector<CRLBezierHitTesterHitInfo, std::allocator<CRLBezierHitTesterHitInfo>> *result;
  id v27;
  _BYTE v28[64];
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t (*v39)(uint64_t);
  _BYTE v40[32];
  uint64_t v41;
  int v42;

  y = a4.y;
  x = a4.x;
  v11 = a6;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x5812000000;
  v38 = sub_10001A974;
  v39 = sub_10001A980;
  memset(v40, 0, sizeof(v40));
  v41 = 0;
  v42 = 1065353216;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001A988;
  v29[3] = &unk_10122D1F8;
  v32 = x;
  v33 = y;
  v34 = a5;
  v27 = v11;
  v30 = v27;
  v31 = &v35;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketNear:withSearchThreshold:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketNear:withSearchThreshold:usingBlock:", v29, x, y, a5);
  v12 = (uint64_t *)v36[8];
  if (v12)
  {
    var1 = 0;
    p_var2 = &retstr->var2;
    do
    {
      *(_OWORD *)v28 = *((_OWORD *)v12 + 1);
      *(_OWORD *)&v28[16] = *((_OWORD *)v12 + 2);
      *(_OWORD *)&v28[32] = *((_OWORD *)v12 + 3);
      *(_OWORD *)&v28[48] = *((_OWORD *)v12 + 4);
      if (var1 >= p_var2->var0)
      {
        var0 = retstr->var0;
        v16 = 0x6DB6DB6DB6DB6DB7 * ((var1 - retstr->var0) >> 3);
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) > 0x492492492492492)
          sub_100007810();
        if (0xDB6DB6DB6DB6DB6ELL * ((p_var2->var0 - var0) >> 3) > v17)
          v17 = 0xDB6DB6DB6DB6DB6ELL * ((p_var2->var0 - var0) >> 3);
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((p_var2->var0 - var0) >> 3)) >= 0x249249249249249)
          v18 = 0x492492492492492;
        else
          v18 = v17;
        if (v18)
        {
          v19 = (char *)sub_10001E5F8((uint64_t)&retstr->var2, v18);
          var0 = retstr->var0;
          var1 = retstr->var1;
        }
        else
        {
          v19 = 0;
        }
        v20 = &v19[56 * v16];
        *(_OWORD *)v20 = *(_OWORD *)&v28[8];
        *((_OWORD *)v20 + 1) = *(_OWORD *)&v28[24];
        *((_OWORD *)v20 + 2) = *(_OWORD *)&v28[40];
        *((_QWORD *)v20 + 6) = *(_QWORD *)&v28[56];
        if (var1 == var0)
        {
          v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[56 * v16];
        }
        else
        {
          v21 = &v19[56 * v16];
          do
          {
            v22 = *(_OWORD *)((char *)var1 - 56);
            v23 = *(_OWORD *)((char *)var1 - 40);
            v24 = *(_OWORD *)((char *)var1 - 24);
            v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v21 - 56);
            *((_QWORD *)v21 - 1) = *((_QWORD *)var1 - 1);
            *(_OWORD *)(v21 - 24) = v24;
            *(_OWORD *)(v21 - 40) = v23;
            *(_OWORD *)(v21 - 56) = v22;
            var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var1 - 56);
            v21 -= 56;
          }
          while (var1 != var0);
        }
        var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 56);
        retstr->var0 = v25;
        retstr->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 56);
        retstr->var2.var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[56 * v18];
        if (var0)
          operator delete(var0);
      }
      else
      {
        *((_QWORD *)var1 + 6) = *(_QWORD *)&v28[56];
        *((_OWORD *)var1 + 1) = *(_OWORD *)&v28[24];
        *((_OWORD *)var1 + 2) = *(_OWORD *)&v28[40];
        *(_OWORD *)var1 = *(_OWORD *)&v28[8];
        var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var1 + 56);
      }
      retstr->var1 = var1;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }

  _Block_object_dispose(&v35, 8);
  sub_10001E288((uint64_t)&v40[8]);

  return result;
}

- (id)wrappedClosestHitsTo:(CGPoint)a3 withSearchThreshold:(double)a4 passingTest:(id)a5
{
  void *v6;
  void *__p[3];

  -[CRLBezierHitTester closestHitsTo:withSearchThreshold:passingTest:](self, "closestHitsTo:withSearchThreshold:passingTest:", a5, a3.x, a3.y, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester p_wrapHitInfos:](self, "p_wrapHitInfos:", __p));
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v6;
}

- (vector<CRLBezierHitTesterHitInfo,)allHitsAlongPath:(CRLBezierHitTester *)self withSearchThreshold:(SEL)a3
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  id v16;
  uint64_t *v17;
  vector<CRLBezierHitTesterHitInfo, std::allocator<CRLBezierHitTesterHitInfo>> *result;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  double v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  __n128 (*v26)(__n128 *, __n128 *);
  void (*v27)(uint64_t);
  void *v28;
  void *__p;
  void *v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v8 = a4;
  if (self->_hasAtLeastOneFilledPath)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D218);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE933C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D238);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester allHitsAlongPath:withSearchThreshold:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 265, 0, "This method was not designed for use with filled paths.");

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x4812000000;
  v26 = sub_10001AF18;
  v27 = sub_10001AF3C;
  v28 = &unk_1010E66AB;
  __p = 0;
  v30 = 0;
  v31 = 0;
  objc_msgSend(v8, "bounds");
  v33 = CGRectInset(v32, -a5, -a5);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001AF54;
  v19[3] = &unk_10122D260;
  v16 = v8;
  v22 = a5;
  v20 = v16;
  v21 = &v23;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketInRect:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketInRect:usingBlock:", v19, x, y, width, height);
  v17 = v24;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  sub_10001E6B0(retstr, (const void *)v17[6], v17[7], 0x6DB6DB6DB6DB6DB7 * ((v17[7] - v17[6]) >> 3));

  _Block_object_dispose(&v23, 8);
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }

  return result;
}

- (id)wrappedAllHitsAlongPath:(id)a3 withSearchThreshold:(double)a4
{
  void *v5;
  void *__p[3];

  -[CRLBezierHitTester allHitsAlongPath:withSearchThreshold:](self, "allHitsAlongPath:withSearchThreshold:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester p_wrapHitInfos:](self, "p_wrapHitInfos:", __p));
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v5;
}

- (BOOL)isAnyPathNearPoint:(CGPoint)a3 withSearchThreshold:(double)a4
{
  char v4;
  _QWORD v6[5];
  CGPoint v7;
  double v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B2E8;
  v6[3] = &unk_10122D288;
  v7 = a3;
  v8 = a4 * a4;
  v6[4] = &v9;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketInRect:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketInRect:usingBlock:", v6, sub_10005FD98(a3.x, a3.y, a4 + a4));
  v4 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)pathsCrossingPath:(id)a3 withSearchThreshold:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CRLBezierHitTester *v12;
  double x;
  double y;
  double width;
  double height;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  CRLBezierHitTester *v24;
  id v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;

  v6 = a3;
  if (self->_allowsLargeCrawlingDistances)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D2A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE93BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122D2C8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 309, 0, "-pathsCrossingPath:withSearchThreshold: does not support large crawling distances.");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  if ((float)((float)((float)self->_bucketSize * 0.5) * 1.4142) <= a4)
    v11 = a4;
  else
    v11 = (float)((float)((float)self->_bucketSize * 0.5) * 1.4142);
  v12 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", (double)self->_bucketSize);
  -[CRLBezierHitTester addPath:filled:](v12, "addPath:filled:", v6, 0);
  objc_msgSend(v6, "bounds");
  v29 = CGRectInset(v28, -v11, -v11);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001B750;
  v22[3] = &unk_10122D2F0;
  v22[4] = self;
  v26 = v11;
  v27 = a4;
  v17 = v10;
  v23 = v17;
  v24 = v12;
  v18 = v6;
  v25 = v18;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketInRect:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketInRect:usingBlock:", v22, x, y, width, height);
  v19 = v25;
  v20 = v17;

  return v20;
}

- (id)pathsWithPercentage:(double)a3 approximatelyInsidePath:(id)a4 requiringPercentForFilledEdges:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  id *i;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *next;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  unordered_map<unsigned long, CRLBezierPath *, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, CRLBezierPath *>>> *p_allPathMap;
  double v23;
  double v24;
  unint64_t *v25;
  _QWORD *v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t *v30;
  unint64_t *v31;
  BOOL v32;
  void *v33;
  id *j;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  CRLBezierHitTester *v44;
  id v45;
  char v46[8];
  _QWORD *v47;
  unint64_t v48;
  id v49;
  unint64_t *v50;
  _QWORD *v51;
  unint64_t v52;
  CGPoint v53;
  CGRect v54;

  v5 = a5;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, self->_allPathMap.__table_.__p2_.__value_);
  v10 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, self->_allPathMap.__table_.__p2_.__value_);
  for (i = (id *)self->_allPathMap.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    v12 = i[3];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &off_1012CBAA0, v12);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &off_1012CBAA0, v12);

  }
  objc_msgSend(v8, "bounds");
  v44 = self;
  next = (double *)self->_pointInfoGridMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v18 = v13;
    v19 = v14;
    v20 = v15;
    v21 = v16;
    p_allPathMap = &self->_allPathMap;
    v45 = v8;
    do
    {
      v23 = next[2];
      v24 = next[3];
      v54.origin.x = v18;
      v54.origin.y = v19;
      v54.size.width = v20;
      v54.size.height = v21;
      v53.x = v23;
      v53.y = v24;
      if (CGRectContainsPoint(v54, v53) && objc_msgSend(v8, "containsPoint:", v23, v24))
      {
        sub_10001D3D8((uint64_t)&v50, (uint64_t)(next + 4));
        v25 = v50;
        if (v50 != (unint64_t *)&v51)
        {
          do
          {
            v26 = sub_10001DF18(p_allPathMap, v25 + 6);
            if (v26)
            {
              v27 = (id)v26[3];
              if (*((_BYTE *)v25 + 64))
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v27));
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "intValue") + 1));
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, v27);
              }
              else
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v27));
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "intValue") + 1));
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, v27);
              }

            }
            v30 = (unint64_t *)v25[1];
            if (v30)
            {
              do
              {
                v31 = v30;
                v30 = (unint64_t *)*v30;
              }
              while (v30);
            }
            else
            {
              do
              {
                v31 = (unint64_t *)v25[2];
                v32 = *v31 == (_QWORD)v25;
                v25 = v31;
              }
              while (!v32);
            }
            v25 = v31;
          }
          while (v31 != (unint64_t *)&v51);
        }
        sub_10001CE40((uint64_t)&v50, v51);
        v8 = v45;
      }
      next = *(double **)next;
    }
    while (next);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  for (j = (id *)v44->_allPathMap.__table_.__p1_.__value_.__next_; j; j = (id *)*j)
  {
    v49 = j[3];
    v35 = sub_10001E188(&v44->_allNonFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v49);
    sub_10001D3D8((uint64_t)&v50, (uint64_t)(v35 + 3));
    v36 = sub_10001E188(&v44->_allFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v49);
    sub_10001D3D8((uint64_t)v46, (uint64_t)(v36 + 3));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v49));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v49));
    v39 = v38;
    if (v52 >= 2)
    {
      if (v48)
      {
        objc_msgSend(v38, "crl_CGFloatValue");
        if (v40 / (double)v48 < a3)
          goto LABEL_30;
        if (v5)
        {
          objc_msgSend(v37, "crl_CGFloatValue");
          if (v41 / (double)v52 < a3)
            goto LABEL_30;
        }
LABEL_29:
        objc_msgSend(v33, "addObject:", v49);
        goto LABEL_30;
      }
      objc_msgSend(v37, "crl_CGFloatValue");
      if (v42 / (double)v52 >= a3)
        goto LABEL_29;
    }
LABEL_30:

    sub_10001CE40((uint64_t)v46, v47);
    sub_10001CE40((uint64_t)&v50, v51);

  }
  return v33;
}

- (id)p_bucketPointValueForPoint:(CGPoint)a3
{
  double y;
  double bucketSize;
  double v5;

  y = a3.y;
  bucketSize = (double)self->_bucketSize;
  v5 = sub_1003C65B0(a3.x, bucketSize);
  return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v5, sub_1003C65B0(y, bucketSize));
}

- (id)p_wrapHitInfos:()vector<CRLBezierHitTesterHitInfo
{
  void *v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  unordered_map<unsigned long, CRLBezierPath *, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, CRLBezierPath *>>> *p_allPathMap;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CRLBezierHitTesterHitInfoWrapper *v12;
  _QWORD *v13;
  CRLBezierHitTesterHitInfoWrapper *v14;
  _OWORD v16[3];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  var0 = a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    p_allPathMap = &self->_allPathMap;
    do
    {
      v9 = *(_OWORD *)var0;
      v10 = *((_OWORD *)var0 + 1);
      v11 = *((_OWORD *)var0 + 2);
      v21 = *((_QWORD *)var0 + 6);
      v19 = v10;
      v20 = v11;
      v18 = v9;
      v12 = [CRLBezierHitTesterHitInfoWrapper alloc];
      v16[0] = v18;
      v16[1] = v19;
      v16[2] = v20;
      v17 = v21;
      v13 = sub_10001DF18(p_allPathMap, (unint64_t *)&v20);
      if (!v13)
        sub_10001E2D0("unordered_map::at: key not found");
      v14 = -[CRLBezierHitTesterHitInfoWrapper initWithHitInfo:hitPath:](v12, "initWithHitInfo:hitPath:", v16, v13[3]);
      objc_msgSend(v5, "addObject:", v14);

      var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var0 + 56);
    }
    while (var0 != var1);
  }
  return v5;
}

- (void)p_addPointInfoStruct:(id *)a3
{
  double y;
  double bucketSize;
  double *v7;
  __int128 v8;
  unordered_map<unsigned long, CRLBezierPath *, std::hash<unsigned long>, std::equal_to<unsigned long>, std::allocator<std::pair<const unsigned long, CRLBezierPath *>>> *p_allPathMap;
  unint64_t *p_var1;
  uint64_t **v11;
  _BYTE v12[8];
  _QWORD *v13;
  CGPoint v14;
  CGPoint var0;
  __int128 v16;
  uint64_t v17;

  y = a3->var0.y;
  bucketSize = (double)self->_bucketSize;
  v14.x = sub_1003C65B0(a3->var0.x, bucketSize);
  v14.y = sub_1003C65B0(y, bucketSize);
  v7 = sub_10001D940(&self->_pointInfoGridMap.__table_.__bucket_list_.__ptr_.__value_, &v14.x);
  if (v7)
  {
    sub_10001E77C((uint64_t **)v7 + 4, (uint64_t)a3, (uint64_t)a3);
  }
  else
  {
    v8 = *(_OWORD *)&a3->var1;
    var0 = a3->var0;
    v16 = v8;
    v17 = *(_QWORD *)&a3->var3;
    sub_10001E804((uint64_t)v12, (uint64_t)&var0, 1);
    var0 = v14;
    sub_10001D3D8((uint64_t)&v16, (uint64_t)v12);
    sub_10001E884((uint64_t)&self->_pointInfoGridMap, &var0.x, (uint64_t)&var0);
    sub_10001CE40((uint64_t)&v16, *((_QWORD **)&v16 + 1));
    sub_10001CE40((uint64_t)v12, v13);
  }
  p_allPathMap = &self->_allPathMap;
  p_var1 = &a3->var1;
  if (a3->var3)
  {
    *(_QWORD *)&var0.x = &a3->var1;
    *(_QWORD *)&var0.x = sub_10001EBA8((uint64_t)p_allPathMap, p_var1, (uint64_t)&unk_100EEC1A0, &var0) + 3;
    v11 = (uint64_t **)sub_10001D180((uint64_t)&self->_allFilledPointInfosForPathMap, *(unint64_t **)&var0.x, (uint64_t)&unk_100EEC1A0, (id **)&var0);
  }
  else
  {
    *(_QWORD *)&var0.x = &a3->var1;
    *(_QWORD *)&var0.x = sub_10001EBA8((uint64_t)p_allPathMap, p_var1, (uint64_t)&unk_100EEC1A0, &var0) + 3;
    v11 = (uint64_t **)sub_10001D180((uint64_t)&self->_allNonFilledPointInfosForPathMap, *(unint64_t **)&var0.x, (uint64_t)&unk_100EEC1A0, (id **)&var0);
  }
  sub_10001E77C(v11 + 3, (uint64_t)a3, (uint64_t)a3);
}

- (void)p_addOpenPathToGrid:(id)a3 withPathId:(unint64_t)a4 crawlingDistance:(double)a5 clippedToRect:(CGRect)a6
{
  _QWORD v6[5];
  CGRect v7;
  unint64_t v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001C140;
  v6[3] = &unk_10122D318;
  v7 = a6;
  v8 = a4;
  v6[4] = self;
  objc_msgSend(a3, "iterateOverPathWithPointDistancePerIteration:usingBlock:", v6, a5);
}

- (void)p_addFilledPathToGrid:(id)a3 withPathId:(unint64_t)a4 clippedToRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CRLBezierHitTester *v19;
  unint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  objc_msgSend(v11, "bounds");
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v22 = CGRectIntersection(v21, v23);
  v12 = v22.origin.x;
  v13 = v22.origin.y;
  v14 = v22.size.width;
  v15 = v22.size.height;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C2BC;
  v17[3] = &unk_10122D340;
  v16 = v11;
  v19 = self;
  v20 = a4;
  v18 = v16;
  -[CRLBezierHitTester p_iterateOverEveryBucketPointInRect:usingBlock:](self, "p_iterateOverEveryBucketPointInRect:usingBlock:", v17, v12, v13, v14, v15);

}

- (void)p_iterateOverEveryBucketPointInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double v10;
  double MaxX;
  double v12;
  double MinY;
  double v14;
  double MaxY;
  double v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t bucketSize;
  uint64_t v20;
  void (**v21)(double, double);
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = (void (**)(double, double))a4;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectIsNull(v22))
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MinX = CGRectGetMinX(v23);
    v10 = sub_1003C65B0(MinX, (double)self->_bucketSize);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MaxX = CGRectGetMaxX(v24);
    v12 = sub_1003C65B0(MaxX, (double)self->_bucketSize);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MinY = CGRectGetMinY(v25);
    v14 = sub_1003C65B0(MinY, (double)self->_bucketSize);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MaxY = CGRectGetMaxY(v26);
    v16 = sub_1003C65B0(MaxY, (double)self->_bucketSize);
    v17 = (uint64_t)v10;
    if ((uint64_t)v10 <= (uint64_t)v12)
    {
      v18 = (uint64_t)v16;
      do
      {
        if ((uint64_t)v14 <= v18)
        {
          v20 = (uint64_t)v14;
          do
          {
            v21[2]((double)v17, (double)v20);
            bucketSize = self->_bucketSize;
            v20 += bucketSize;
          }
          while (v20 <= v18);
        }
        else
        {
          bucketSize = self->_bucketSize;
        }
        v17 += bucketSize;
      }
      while (v17 <= (uint64_t)v12);
    }
  }

}

- (void)p_iterateOverEveryExistingBucketPointInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, _BYTE *, double, double);
  double MinX;
  unint64_t bucketSize;
  double MinY;
  unint64_t v13;
  CGFloat MaxY;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  double *i;
  double v21;
  double v22;
  uint64_t v26;
  unint64_t v27;
  double MaxX;
  char v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void (**)(id, _BYTE *, double, double))a4;
  v29 = 0;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MinX = CGRectGetMinX(v30);
  bucketSize = self->_bucketSize;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  MaxX = CGRectGetMaxX(v31);
  v27 = self->_bucketSize;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MinY = CGRectGetMinY(v32);
  v13 = self->_bucketSize;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MaxY = CGRectGetMaxY(v33);
  v15 = (uint64_t)(floor(MinX / (double)bucketSize) * (double)bucketSize);
  v16 = (uint64_t)(ceil(MaxX / (double)v27) * (double)v27);
  v17 = (uint64_t)(floor(MinY / (double)v13) * (double)v13);
  v18 = self->_bucketSize;
  v19 = (uint64_t)(ceil(MaxY / (double)v18) * (double)v18);
  if ((v19 - v17) / v18 * ((v16 - v15) / v18) <= self->_pointInfoGridMap.__table_.__p2_.__value_)
  {
    if (v16 >= v15)
    {
      while (v19 < v17)
      {
LABEL_22:
        v15 += v18;
        if (v15 > v16)
          goto LABEL_17;
      }
      v26 = v17;
      while (1)
      {
        v9[2](v9, &v29, (double)v15, (double)v26);
        if (v29)
          break;
        v18 = self->_bucketSize;
        v26 += v18;
        if (v26 > v19)
          goto LABEL_22;
      }
    }
  }
  else
  {
    for (i = (double *)self->_pointInfoGridMap.__table_.__p1_.__value_.__next_; i; i = *(double **)i)
    {
      v21 = i[2];
      v22 = i[3];
      if (v21 >= (double)v15 && v21 <= (double)v16 && v22 >= (double)v17 && v22 <= (double)v19)
      {
        ((void (*)(void (**)(id, _BYTE *, double, double), char *))v9[2])(v9, &v29);
        if (v29)
          break;
      }
    }
  }
LABEL_17:

}

- (void)p_iterateOverEveryNonEmptyBucketInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _QWORD v9[4];
  CRLBezierHitTester *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C7A8;
  v9[3] = &unk_10122D368;
  v10 = self;
  v11 = a4;
  v8 = v11;
  -[CRLBezierHitTester p_iterateOverEveryExistingBucketPointInRect:usingBlock:](v10, "p_iterateOverEveryExistingBucketPointInRect:usingBlock:", v9, x, y, width, height);

}

- (void)p_iterateOverEveryNonEmptyBucketNear:(CGPoint)a3 withSearchThreshold:(double)a4 usingBlock:(id)a5
{
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketInRect:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketInRect:usingBlock:", a5, sub_10005FD98(a3.x, a3.y, a4 + a4));
}

- (BOOL)allowsLargeCrawlingDistances
{
  return self->_allowsLargeCrawlingDistances;
}

- (void)setAllowsLargeCrawlingDistances:(BOOL)a3
{
  self->_allowsLargeCrawlingDistances = a3;
}

- (void).cxx_destruct
{
  sub_10001EEDC((uint64_t)&self->_allFilledPointInfosForPathMap);
  sub_10001EEDC((uint64_t)&self->_allNonFilledPointInfosForPathMap);
  sub_10001EE68((uint64_t)&self->_allPathMap);
  objc_storeStrong((id *)&self->_allPathTable, 0);
  sub_10001EDF0((uint64_t)&self->_pointInfoGridMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end
