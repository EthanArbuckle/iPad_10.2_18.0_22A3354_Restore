@implementation CRLPasteboardCopyAssistant

- (CRLPasteboardCopyAssistant)initWithPasteboard:(id)a3 sourceContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLPasteboardCopyAssistant *v12;
  CRLPasteboardCopyAssistant *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247638);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10D38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247658);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardCopyAssistant initWithPasteboard:sourceContext:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardCopyAssistant.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 19, 0, "invalid nil value for '%{public}s'", "pasteboard");

  }
  v15.receiver = self;
  v15.super_class = (Class)CRLPasteboardCopyAssistant;
  v12 = -[CRLPasteboardWriteAssistant initWithContext:](&v15, "initWithContext:", v8);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_pasteboard, a3);

  return v13;
}

- (void)loadData
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_didAttemptToCopy)
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLPasteboardCopyAssistant;
    -[CRLPasteboardWriteAssistant loadData](&v5, "loadData");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10DE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247698);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardCopyAssistant loadData]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardCopyAssistant.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 32, 0, "Didn't attempt to copy before trying to load native data.");

  }
}

- (void)copyToPasteboard
{
  -[CRLPasteboardCopyAssistant copyToPasteboardIsSmartCopy:](self, "copyToPasteboardIsSmartCopy:", 0);
}

- (void)copyToPasteboardIsSmartCopy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  CRLPasteboard *pasteboard;
  void *v9;
  CRLPasteboardCopyAssistant *v10;

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012476B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10E68();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012476D8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardCopyAssistant copyToPasteboardIsSmartCopy:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardCopyAssistant.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 41, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLPasteboard clearContents](self->_pasteboard, "clearContents");
  pasteboard = self->_pasteboard;
  v10 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[CRLPasteboard addItems:isSmartCopy:](pasteboard, "addItems:isSmartCopy:", v9, v3);

  self->_didAttemptToCopy = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboard, 0);
}

@end
