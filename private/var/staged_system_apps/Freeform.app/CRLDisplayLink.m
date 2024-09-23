@implementation CRLDisplayLink

- (id)p_initWithHandler:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  CRLDisplayLink *v8;
  id v9;
  id handler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLDisplayLink;
  v8 = -[CRLDisplayLink init](&v12, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    handler = v8->_handler;
    v8->_handler = v9;

    *(_WORD *)&v8->_paused = 257;
    objc_msgSend(v7, "addLink:", v8);
  }

  return v8;
}

- (CRLDisplayLink)initWithHandler:(id)a3
{
  id v4;
  void *v5;
  CRLDisplayLink *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLDisplayLinkManager sharedManager](CRLDisplayLinkManager, "sharedManager"));
  v6 = -[CRLDisplayLink p_initWithHandler:manager:](self, "p_initWithHandler:manager:", v4, v5);

  return v6;
}

- (id)p_manager
{
  return +[CRLDisplayLinkManager sharedManager](CRLDisplayLinkManager, "sharedManager");
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (self->_valid)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012477E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E11020();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101247808);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDisplayLink setPaused:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDisplayLink.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 71, 0, "Can't pause an invalid display link.");

  if (self->_valid)
  {
LABEL_11:
    if (self->_paused != v3)
    {
      self->_paused = v3;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDisplayLink p_manager](self, "p_manager"));
      objc_msgSend(v8, "updatePausedForLink:", self);

    }
  }
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDisplayLink p_manager](self, "p_manager"));
  objc_msgSend(v3, "removeLink:", self);

  self->_valid = 0;
}

- (void)i_triggerHandlerAtTime:(double)a3 targetTime:(double)a4
{
  (*((void (**)(double, double))self->_handler + 2))(a3, a4);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
