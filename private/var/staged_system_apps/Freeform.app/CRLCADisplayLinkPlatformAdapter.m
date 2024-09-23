@implementation CRLCADisplayLinkPlatformAdapter

- (CRLCADisplayLinkPlatformAdapter)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  CRLCADisplayLinkPlatformAdapter *v7;
  CRLCADisplayLinkPlatformAdapter *v8;
  uint64_t v9;
  CADisplayLink *displayLink;
  CADisplayLink *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLCADisplayLinkPlatformAdapter;
  v7 = -[CRLCADisplayLinkPlatformAdapter init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_action = a4;
    v9 = objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", v8, "p_displayLinkDidTrigger:"));
    displayLink = v8->_displayLink;
    v8->_displayLink = (CADisplayLink *)v9;

    -[CADisplayLink setPaused:](v8->_displayLink, "setPaused:", 1);
    v11 = v8->_displayLink;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[CADisplayLink addToRunLoop:forMode:](v11, "addToRunLoop:forMode:", v12, NSRunLoopCommonModes);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_displayLink)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F7D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E047C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F7F0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 40, 0, "expected nil value for '%{public}s'", "_displayLink");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLCADisplayLinkPlatformAdapter;
  -[CRLCADisplayLinkPlatformAdapter dealloc](&v6, "dealloc");
}

- (void)invalidate
{
  CADisplayLink *displayLink;
  void *v4;
  void *v5;
  void *v6;
  CADisplayLink *v7;

  displayLink = self->_displayLink;
  if (displayLink)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F810);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0486C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F830);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter invalidate]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 44, 0, "Trying to manipulate an invalid display link");

  displayLink = self->_displayLink;
  if (displayLink)
  {
LABEL_11:
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v7 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (BOOL)paused
{
  CADisplayLink *displayLink;
  void *v4;
  void *v5;
  void *v6;

  displayLink = self->_displayLink;
  if (displayLink)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F850);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E048EC();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F870);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter paused]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 54, 0, "Trying to manipulate an invalid display link");

  displayLink = self->_displayLink;
  if (displayLink)
LABEL_11:
    LOBYTE(displayLink) = -[CADisplayLink isPaused](displayLink, "isPaused");
  return (char)displayLink;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  CADisplayLink *displayLink;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  displayLink = self->_displayLink;
  if (displayLink)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F890);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0496C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F8B0);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCADisplayLinkPlatformAdapter setPaused:]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLinkPlatformAdapter.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 63, 0, "Trying to manipulate an invalid display link");

  displayLink = self->_displayLink;
  if (displayLink)
LABEL_11:
    -[CADisplayLink setPaused:](displayLink, "setPaused:", v3);
}

- (void)p_displayLinkDidTrigger:(id)a3
{
  id *p_target;
  id v5;
  const char *action;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;

  p_target = &self->_target;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(p_target);
  action = self->_action;
  objc_msgSend(v5, "timestamp");
  v8 = v7;
  objc_msgSend(v5, "targetTimestamp");
  v10 = v9;

  objc_msgSend(WeakRetained, action, v8, v10);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
