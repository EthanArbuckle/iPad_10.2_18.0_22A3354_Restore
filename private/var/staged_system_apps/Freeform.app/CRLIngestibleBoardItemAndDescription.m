@implementation CRLIngestibleBoardItemAndDescription

+ (CRLIngestibleBoardItemAndDescription)ingestibleBoardItemAndDescriptionWithBoardItem:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithBoardItem:description:", v7, v6);

  return (CRLIngestibleBoardItemAndDescription *)v8;
}

+ (CRLIngestibleBoardItemAndDescription)ingestibleBoardItemAndDescriptionWithBoardItems:(id)a3 descriptions:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D4C0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v19 = v9;
      *(_DWORD *)buf = 67110402;
      v21 = v8;
      v22 = 2082;
      v23 = "+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:]";
      v24 = 2082;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m";
      v26 = 1024;
      v27 = 27;
      v28 = 2048;
      v29 = objc_msgSend(v5, "count");
      v30 = 2048;
      v31 = objc_msgSend(v6, "count");
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Must provide the same number of drawables (%lu) and descriptions (%lu).", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D4E0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:descriptions:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 27, 0, "Must provide the same number of drawables (%lu) and descriptions (%lu).", objc_msgSend(v5, "count"), objc_msgSend(v6, "count"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v14));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItem:description:](CRLIngestibleBoardItemAndDescription, "ingestibleBoardItemAndDescriptionWithBoardItem:description:", v15, v16));

      objc_msgSend(v13, "addObject:", v17);
      ++v14;
    }
    while (v14 < (unint64_t)objc_msgSend(v5, "count"));
  }

  return (CRLIngestibleBoardItemAndDescription *)v13;
}

- (CRLIngestibleBoardItemAndDescription)initWithBoardItem:(id)a3 description:(id)a4
{
  id v7;
  id v8;
  CRLIngestibleBoardItemAndDescription *v9;
  CRLIngestibleBoardItemAndDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLIngestibleBoardItemAndDescription;
  v9 = -[CRLIngestibleBoardItemAndDescription init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_boardItem, a3);
    objc_storeStrong((id *)&v10->_ingestibleDescription, a4);
  }

  return v10;
}

- (CRLIngestibleBoardItemAndDescription)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123D500);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLIngestibleBoardItemAndDescription init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m";
    v17 = 1024;
    v18 = 46;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123D520);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLIngestibleBoardItemAndDescription init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLIngestibleBoardItemAndDescription.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 46, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLIngestibleBoardItemAndDescription init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (_TtC8Freeform12CRLBoardItem)boardItem
{
  return self->_boardItem;
}

- (NSDictionary)ingestibleDescription
{
  return self->_ingestibleDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestibleDescription, 0);
  objc_storeStrong((id *)&self->_boardItem, 0);
}

@end
