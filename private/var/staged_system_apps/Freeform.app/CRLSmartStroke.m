@implementation CRLSmartStroke

- (NSString)strokeName
{
  return self->mStrokeName;
}

- (void)i_setStrokeName:(id)a3
{
  objc_storeStrong((id *)&self->mStrokeName, a3);
}

- (void)i_setDeprecatedPatternOffsetDistance:(double)a3
{
  self->mDeprecatedPatternOffsetDistance = a3;
}

+ (Class)classForName:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  __objc2_class **v7;
  void *v8;
  unsigned __int8 v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v18;
  _QWORD v19[6];

  v3 = a3;
  v19[0] = CFSTR("Chalk2");
  v19[1] = CFSTR("Dry Brush");
  v19[2] = CFSTR("Feathered Brush");
  v19[3] = CFSTR("Pen");
  v19[4] = CFSTR("Pencil");
  v19[5] = CFSTR("Crayon");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 6));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v7 = off_1012297E8;
  }
  else
  {
    v18 = CFSTR("Calligraphy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v9 = objc_msgSend(v8, "containsObject:", v3);

    if ((v9 & 1) != 0)
    {
      v7 = off_1012297F0;
    }
    else
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243D30);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0B694((uint64_t)v3, v10, v11);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101243D50);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLSmartStroke classForName:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 64, 0, "Unable to find Smart Stroke class for name: %@", v3);

      v7 = off_1012299E0;
    }
  }
  objc_opt_class(*v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return (Class)v16;
}

+ (CRLSmartStroke)strokeWithName:(id)a3 color:(id)a4 width:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  Class v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class(a1, v10);
  v12 = [v11 alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  v14 = objc_msgSend(v12, "initWithName:color:width:cap:join:pattern:miterLimit:", v8, v9, 0, 0, v13, a5, 4.0);

  return (CRLSmartStroke *)v14;
}

- (CRLSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8 miterLimit:(double)a9
{
  id v16;
  id v17;
  id v18;
  CRLSmartStroke *v19;
  NSString *v20;
  NSString *mStrokeName;
  objc_super v23;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CRLSmartStroke;
  v19 = -[CRLStroke initWithColor:width:cap:join:pattern:miterLimit:](&v23, "initWithColor:width:cap:join:pattern:miterLimit:", v17, a6, a7, v18, a5, a9);
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(v16, "copy");
    mStrokeName = v19->mStrokeName;
    v19->mStrokeName = v20;

  }
  return v19;
}

- (CRLSmartStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8
{
  return -[CRLSmartStroke initWithName:color:width:cap:join:pattern:miterLimit:](self, "initWithName:color:width:cap:join:pattern:miterLimit:", a3, a4, a6, a7, a8, a5, 4.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  Class v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  Class v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101243D70);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(CRLSmartStroke, v6);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 67110402;
    v23 = v4;
    v24 = 2082;
    v25 = "-[CRLSmartStroke copyWithZone:]";
    v26 = 2082;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm";
    v28 = 1024;
    v29 = 103;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v21;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@ is an abstract superclass. Subclasses must inherit %@", buf, 0x36u);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101243D90);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSmartStroke copyWithZone:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm"));
  objc_opt_class(CRLSmartStroke, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 103, 0, "%@ is an abstract superclass. Subclasses must inherit %@", v13, v15);

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  Class v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  Class v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101243DB0);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(CRLSmartStroke, v6);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 67110402;
    v23 = v4;
    v24 = 2082;
    v25 = "-[CRLSmartStroke mutableCopyWithZone:]";
    v26 = 2082;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm";
    v28 = 1024;
    v29 = 108;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v21;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@ is an abstract superclass. Subclasses must inherit %@", buf, 0x36u);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101243DD0);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSmartStroke mutableCopyWithZone:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSmartStroke.mm"));
  objc_opt_class(CRLSmartStroke, v10);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 108, 0, "%@ is an abstract superclass. Subclasses must inherit %@", v13, v15);

  return 0;
}

- (BOOL)canApplyDirectlyToRepRenderable
{
  return !-[CRLStroke shouldRender](self, "shouldRender");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class(CRLSmartStroke, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "strokeName")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStroke strokeName](self, "strokeName")),
        v12 = objc_msgSend(v10, "isEqualToString:", v11),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLSmartStroke;
    v13 = -[CRLStroke isEqual:](&v15, "isEqual:", v9);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)canDrawWithOtherStroke:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class(CRLSmartStroke, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
    v9 = -[CRLSmartStroke isEqual:](self, "isEqual:", v8);
  else
    v9 = 0;

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLSmartStroke;
  v3 = -[CRLStroke hash](&v5, "hash");
  return -[NSString hash](self->mStrokeName, "hash") ^ v3;
}

- (BOOL)shouldAntialiasDefeat
{
  return 0;
}

- (double)deprecatedPatternOffsetDistance
{
  return self->mDeprecatedPatternOffsetDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStrokeName, 0);
}

@end
