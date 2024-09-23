@implementation CRLPKCompressedStrokePointArray

- (CRLPKCompressedStrokePointArray)initWithStroke:(id)a3
{
  id v4;
  CRLPKCompressedStrokePointArray *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLPKCompressedStrokePointArray;
  v5 = -[CRLPKCompressedStrokePointArray init](&v7, "init");
  objc_storeWeak((id *)&v5->_stroke, v4);

  return v5;
}

- (unint64_t)count
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  v3 = objc_msgSend(WeakRetained, "_pointsCount");

  return (unint64_t)v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  CRLPKStroke **p_stroke;
  id WeakRetained;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRLPKStrokePoint *v17;
  id v18;
  CRLPKStrokePoint *v19;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;

  p_stroke = &self->_stroke;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  v7 = objc_msgSend(WeakRetained, "_pointsCount");

  if ((unint64_t)v7 <= a3)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AA28);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110658;
      v22 = v8;
      v23 = 2082;
      v24 = "-[CRLPKCompressedStrokePointArray objectAtIndex:]";
      v25 = 2082;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm";
      v27 = 1024;
      v28 = 562;
      v29 = 2080;
      v30 = "-[CRLPKCompressedStrokePointArray objectAtIndex:]";
      v31 = 2048;
      v32 = a3;
      v33 = 2048;
      v34 = -[CRLPKCompressedStrokePointArray count](self, "count");
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d *** %s: index %lu beyond bounds [0 .. %lu]", buf, 0x40u);
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AA48);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray objectAtIndex:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 562, 0, "*** %s: index %lu beyond bounds [0 .. %lu]", "-[CRLPKCompressedStrokePointArray objectAtIndex:]", a3, -[CRLPKCompressedStrokePointArray count](self, "count"));

  }
  v13 = objc_loadWeakRetained((id *)p_stroke);
  v14 = objc_msgSend(v13, "_strokePointAtIndex:", a3);

  v15 = objc_loadWeakRetained((id *)p_stroke);
  v16 = objc_msgSend(v15, "_inflight");

  v17 = [CRLPKStrokePoint alloc];
  v18 = objc_loadWeakRetained((id *)p_stroke);
  v19 = -[CRLPKStrokePoint initWithStroke:strokePoint:inflight:](v17, "initWithStroke:strokePoint:inflight:", v18, v14, v16);

  return v19;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v6 = a3;
  *(_QWORD *)&v8 = objc_opt_class(CRLPKStrokePoint, v7).n128_u64[0];
  if ((objc_msgSend(v6, "isMemberOfClass:", v9, v8) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AA68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F558();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AA88);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray insertObject:atIndex:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 570, 0, "Only CRLPKStrokePoint instances can be added to a stroke's point array");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  objc_msgSend(WeakRetained, "_insertStrokePoint:atIndex:", objc_msgSend(v6, "_strokePoint"), a4);

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  objc_msgSend(WeakRetained, "_removeStrokePointAtIndex:", a3);

}

- (void)addObject:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLPKStrokePoint, v5).n128_u64[0];
  if ((objc_msgSend(v4, "isMemberOfClass:", v7, v6) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AAA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F5D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AAC8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray addObject:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 580, 0, "Only CRLPKStrokePoint instances can be added to a stroke's point array");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  objc_msgSend(WeakRetained, "_addStrokePoint:", objc_msgSend(v4, "_strokePoint"));

}

- (void)removeLastObject
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  objc_msgSend(WeakRetained, "_removeLastStrokePoint");

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v6 = a4;
  *(_QWORD *)&v8 = objc_opt_class(CRLPKStrokePoint, v7).n128_u64[0];
  if ((objc_msgSend(v6, "isMemberOfClass:", v9, v8) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AAE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F658();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AB08);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray replaceObjectAtIndex:withObject:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 590, 0, "Only CRLPKStrokePoint instances can be added to a stroke's point array");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  objc_msgSend(WeakRetained, "_replaceStrokePointAtIndex:withStrokePoint:", a3, objc_msgSend(v6, "_strokePoint"));

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stroke);
}

@end
