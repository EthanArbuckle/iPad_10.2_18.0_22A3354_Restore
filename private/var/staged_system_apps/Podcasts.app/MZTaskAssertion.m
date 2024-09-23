@implementation MZTaskAssertion

- (MZTaskAssertion)initWithExpirationHandler:(id)a3 debugInfo:(id)a4
{
  id v6;
  id v7;
  MZTaskAssertion *v8;
  id v9;
  id expireHandler;
  NSString *v11;
  NSString *debugInfo;
  MZProcessAssertion *v13;
  id *v14;
  MZProcessAssertion *v15;
  id v16;
  _QWORD v18[4];
  id *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MZTaskAssertion;
  v8 = -[MZTaskAssertion init](&v20, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    expireHandler = v8->_expireHandler;
    v8->_expireHandler = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    debugInfo = v8->_debugInfo;
    v8->_debugInfo = v11;

    v13 = [MZProcessAssertion alloc];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B10B4;
    v18[3] = &unk_1004A6200;
    v14 = v8;
    v19 = v14;
    v15 = -[MZProcessAssertion initWithExpirationBlock:debugDescription:](v13, "initWithExpirationBlock:debugDescription:", v18, v8->_debugInfo);
    v16 = v14[3];
    v14[3] = v15;

    objc_msgSend(v14[3], "identifier");
  }

  return v8;
}

+ (id)newBackgroundTaskWithExpirationHandler:(id)a3 debugInfo:(id)a4
{
  id v5;
  id v6;
  MZTaskAssertion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MZTaskAssertion initWithExpirationHandler:debugInfo:]([MZTaskAssertion alloc], "initWithExpirationHandler:debugInfo:", v6, v5);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MZTaskAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MZTaskAssertion;
  -[MZTaskAssertion dealloc](&v3, "dealloc");
}

- (void)performExpirationHandler
{
  uint64_t v3;
  NSObject *v4;
  void (**expireHandler)(void);
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  MZTaskAssertion *v9;

  v3 = _MTLogCategoryAsyncTask(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background time expired. App will sleep soon. Assertion: %@", buf, 0xCu);
  }

  expireHandler = (void (**)(void))self->_expireHandler;
  if (expireHandler)
  {
    if (self->_processAssertion)
    {
      expireHandler[2]();
      v6 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B1268;
      block[3] = &unk_1004A6200;
      block[4] = self;
      dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)invalidate
{
  MZProcessAssertion *processAssertion;
  MZProcessAssertion *v4;
  id expireHandler;

  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    -[MZProcessAssertion identifier](processAssertion, "identifier");
    -[MZProcessAssertion invalidate](self->_processAssertion, "invalidate");
    v4 = self->_processAssertion;
    self->_processAssertion = 0;

  }
  expireHandler = self->_expireHandler;
  self->_expireHandler = 0;

}

- (id)description
{
  MZProcessAssertion *processAssertion;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  processAssertion = self->_processAssertion;
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)v6;
  v8 = CFSTR("YES");
  if (!processAssertion)
    v8 = CFSTR("NO ");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p; held=%@; info='%@', underlying assertion = %@>"),
                   v6,
                   self,
                   v8,
                   self->_debugInfo,
                   self->_processAssertion));

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong(&self->_expireHandler, 0);
}

@end
