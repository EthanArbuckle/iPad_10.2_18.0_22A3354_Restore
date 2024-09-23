@implementation _MFMessageContentRequestRetryRegistry

+ (id)sharedRegistry
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001076E4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9F10 != -1)
    dispatch_once(&qword_1005A9F10, block);
  return (id)qword_1005A9F08;
}

- (_MFMessageContentRequestRetryRegistry)init
{
  _MFMessageContentRequestRetryRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MFMessageContentRequestRetryRegistry;
  v2 = -[_MFMessageContentRequestRetryRegistry init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    storage = v2->_storage;
    v2->_storage = v3;

  }
  return v2;
}

- (void)logRetryForContentRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = sub_100107878(a3);
  v9 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (v9)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMessageContentRequestRetryRegistry storage](self, "storage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v6, "unsignedIntegerValue") + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMessageContentRequestRetryRegistry storage](self, "storage"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
}

- (void)removeContentRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = sub_100107878(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMessageContentRequestRetryRegistry storage](self, "storage"));
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (unint64_t)numberOfRetryForContentRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = sub_100107878(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMessageContentRequestRetryRegistry storage](self, "storage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
    v8 = (unint64_t)objc_msgSend(v7, "unsignedIntegerValue");

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
