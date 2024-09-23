@implementation TransparencyIDSConfigBag

+ (TransparencyIDSConfigBag)sharedInstance
{
  if (qword_10008ABE8 != -1)
    dispatch_once(&qword_10008ABE8, &stru_100071B88);
  return (TransparencyIDSConfigBag *)(id)qword_10008ABF0;
}

- (TransparencyIDSConfigBag)init
{
  TransparencyIDSConfigBag *v2;
  void *v3;
  NSOperationQueue *v4;
  NSOperationQueue *operationQueue;
  TransparencyIDSConfigBag *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransparencyIDSConfigBag;
  v2 = -[TransparencyIDSConfigBag init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](IDSServerBag, "sharedInstance"));
    -[TransparencyIDSConfigBag setBag:](v2, "setBag:", v3);

    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v4;

    v6 = v2;
  }

  return v2;
}

- (BOOL)ktDisable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  if (!_os_feature_enabled_impl("Transparency", "KTEnableKillSwitch"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSConfigBag bag](self, "bag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("kt-min-idv-im")));

  v6 = objc_opt_class(NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = _IDSIDProtocolVersionNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v4, "doubleValue");
    v12 = v10 < v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)kbInfoArticleUrl
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSConfigBag bag](self, "bag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kt-disable-info-url")));

  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

- (void)setKtDisable:(BOOL)a3
{
  self->ktDisable = a3;
}

- (IDSServerBag)bag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
