@implementation CRLPdfTaggerParagraphLevelResolver

- (CRLPdfTaggerParagraphLevelResolver)initWithTagger:(id)a3
{
  id v4;
  CRLPdfTaggerParagraphLevelResolver *v5;
  CRLPdfTaggerParagraphLevelResolver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLPdfTaggerParagraphLevelResolver;
  v5 = -[CRLPdfTaggerParagraphLevelResolver init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_tagger, v4);

  return v6;
}

- (int)tagType
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  Class v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  Class v18;
  NSString *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D900);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 67110146;
    v24 = v3;
    v25 = 2082;
    v26 = "-[CRLPdfTaggerParagraphLevelResolver tagType]";
    v27 = 2082;
    v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm";
    v29 = 1024;
    v30 = 605;
    v31 = 2114;
    v32 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D920);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v24 = v3;
    v25 = 2114;
    v26 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTaggerParagraphLevelResolver tagType]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"));
  objc_opt_class(self, v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 605, 0, "Abstract method not overridden by %{public}@", v16);

  objc_opt_class(self, v17);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v20, "-[CRLPdfTaggerParagraphLevelResolver tagType]"));
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v21, 0));

  objc_exception_throw(v22);
}

- (int)levelOfCurrentParagraph:(id *)a3
{
  unsigned int v4;
  void *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  Class v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;

  v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D940);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v25 = v4;
    v26 = 2082;
    v27 = "-[CRLPdfTaggerParagraphLevelResolver levelOfCurrentParagraph:]";
    v28 = 2082;
    v29 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm";
    v30 = 1024;
    v31 = 610;
    v32 = 2114;
    v33 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D960);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v25 = v4;
    v26 = 2114;
    v27 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTaggerParagraphLevelResolver levelOfCurrentParagraph:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"));
  objc_opt_class(self, v14);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 610, 0, "Abstract method not overridden by %{public}@", v17);

  objc_opt_class(self, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v21, "-[CRLPdfTaggerParagraphLevelResolver levelOfCurrentParagraph:]"));
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v22, 0));

  objc_exception_throw(v23);
}

- (BOOL)paragraphInfo:(id)a3 matchesParagraphInfo:(id)a4 level:(int)a5
{
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  Class v12;
  NSString *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  Class v24;
  NSString *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  unsigned int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;

  v7 = a3;
  v8 = a4;
  v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D980);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    objc_opt_class(self, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 67110146;
    v30 = v9;
    v31 = 2082;
    v32 = "-[CRLPdfTaggerParagraphLevelResolver paragraphInfo:matchesParagraphInfo:level:]";
    v33 = 2082;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm";
    v35 = 1024;
    v36 = 615;
    v37 = 2114;
    v38 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125D9A0);
  v15 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v30 = v9;
    v31 = 2114;
    v32 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTaggerParagraphLevelResolver paragraphInfo:matchesParagraphInfo:level:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"));
  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 615, 0, "Abstract method not overridden by %{public}@", v22);

  objc_opt_class(self, v23);
  v25 = NSStringFromClass(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v26, "-[CRLPdfTaggerParagraphLevelResolver paragraphInfo:matchesParagraphInfo:level:]"));
  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v27, 0));

  objc_exception_throw(v28);
}

- (CRLPdfTagger)tagger
{
  return (CRLPdfTagger *)objc_loadWeakRetained((id *)&self->_tagger);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tagger);
}

@end
