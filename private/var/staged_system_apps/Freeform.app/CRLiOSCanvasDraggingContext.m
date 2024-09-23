@implementation CRLiOSCanvasDraggingContext

- (CRLiOSCanvasDraggingContext)initWithSourceObject:(id)a3
{
  id v4;
  CRLiOSCanvasDraggingContext *v5;
  CRLiOSCanvasDraggingContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasDraggingContext;
  v5 = -[CRLiOSCanvasDraggingContext init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_sourceObject, v4);

  return v6;
}

- (CRLiOSCanvasDraggingContext)init
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
    dispatch_once(&qword_10147E370, &stru_101260530);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLiOSCanvasDraggingContext init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDraggingContext.m";
    v17 = 1024;
    v18 = 34;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101260550);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDraggingContext init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDraggingContext.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 34, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSCanvasDraggingContext init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)draggingEnteredWithOperation:(unint64_t)a3 targetInteractiveCanvasController:(id)a4
{
  id *p_sourceObject;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id WeakRetained;

  p_sourceObject = &self->_sourceObject;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(p_sourceObject);
  v13 = sub_100221DDC(WeakRetained, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v14, "draggingEnteredWithOperation:targetInteractiveCanvasController:", a3, v6);

}

- (void)draggingUpdatedWithOperation:(unint64_t)a3 targetInteractiveCanvasController:(id)a4
{
  id *p_sourceObject;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id WeakRetained;

  p_sourceObject = &self->_sourceObject;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(p_sourceObject);
  v13 = sub_100221DDC(WeakRetained, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v14, "draggingUpdatedWithOperation:targetInteractiveCanvasController:", a3, v6);

}

- (void)draggingExited
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_sourceObject);
  v8 = sub_100221DDC(WeakRetained, 1, v2, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "draggingExited");

}

- (BOOL)draggingWantsForcedUpdate
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  WeakRetained = objc_loadWeakRetained(&self->_sourceObject);
  v9 = sub_100221DDC(WeakRetained, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "draggingWantsForcedUpdate");

  return v11;
}

- (id)modelContainer
{
  return objc_loadWeakRetained(&self->modelContainer);
}

- (void)setModelContainer:(id)a3
{
  objc_storeWeak(&self->modelContainer, a3);
}

- (id)sourceObject
{
  return objc_loadWeakRetained(&self->_sourceObject);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_sourceObject);
  objc_destroyWeak(&self->modelContainer);
}

@end
