@implementation CRLWPSearch

- (CRLWPSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 storage:(id)a6 range:(_NSRange)a7 searchCanvasDelegate:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CRLWPSearch *v24;
  CRLWPSearch *v25;
  uint64_t v26;
  NSString *searchedString;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  objc_super v32;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if (v14)
  {
    if (v16)
      goto LABEL_22;
    goto LABEL_13;
  }
  v29 = location;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  v31 = length;
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123DB18);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E01690();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123DB38);
  v18 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE8358(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearch initWithString:options:hitBlock:storage:range:searchCanvasDelegate:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearch.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 26, 0, "invalid nil value for '%{public}s'", "string");

  location = v29;
  length = v31;
  if (!v16)
  {
LABEL_13:
    v30 = location;
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DB58);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E015F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123DB78);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSearch initWithString:options:hitBlock:storage:range:searchCanvasDelegate:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSearch.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 27, 0, "invalid nil value for '%{public}s'", "storage");

    location = v30;
  }
LABEL_22:
  v32.receiver = self;
  v32.super_class = (Class)CRLWPSearch;
  v24 = -[CRLSearch initWithString:options:hitBlock:](&v32, "initWithString:options:hitBlock:", v14, a4, v15);
  v25 = v24;
  if (v24)
  {
    v24->_range.location = location;
    v24->_range.length = length;
    objc_storeWeak((id *)&v24->_storage, v16);
    v25->_storageChangeCount = (unint64_t)objc_msgSend(v16, "changeCount");
    objc_storeStrong((id *)&v25->_searchCanvasDelegate, a8);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
    searchedString = v25->_searchedString;
    v25->_searchedString = (NSString *)v26;

  }
  return v25;
}

- (BOOL)isComplete
{
  uint64_t v2;

  -[CRLWPSearch range](self, "range");
  return v2 == 0;
}

- (void)foundHitWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *);

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearch searchCanvasDelegate](self, "searchCanvasDelegate"));
  if ((objc_opt_respondsToSelector(v6, "wpSelectionClassForStorage:") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearch searchCanvasDelegate](self, "searchCanvasDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearch storage](self, "storage"));
    v10 = objc_msgSend(v8, "wpSelectionClassForStorage:", v9);

  }
  else
  {
    objc_opt_class(CRLWPSelection, v7);
    v10 = v11;
  }

  v16 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(-[CRLSearch hitBlock](self, "hitBlock"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearch storage](self, "storage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionWithRange:", location, length));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSearch searchCanvasDelegate](self, "searchCanvasDelegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSearchReference searchReferenceWithStorage:selection:searchCanvasDelegate:](CRLWPSearchReference, "searchReferenceWithStorage:selection:searchCanvasDelegate:", v12, v13, v14));
  v16[2](v16, v15);

}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)searchedString
{
  return self->_searchedString;
}

- (unint64_t)storageChangeCount
{
  return self->_storageChangeCount;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return (_TtC8Freeform12CRLWPStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (CRLSearchCanvasDelegate)searchCanvasDelegate
{
  return self->_searchCanvasDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCanvasDelegate, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_storeStrong((id *)&self->_searchedString, 0);
}

@end
