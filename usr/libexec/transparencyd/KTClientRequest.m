@implementation KTClientRequest

- (KTClientRequest)initWithType:(unint64_t)a3 application:(id)a4 uri:(id)a5 accountKey:(id)a6 serverLoggableDatas:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  KTClientRequest *v16;
  KTClientRequest *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)KTClientRequest;
  v16 = -[KTClientRequest init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    -[KTClientRequest setType:](v16, "setType:", a3);
    -[KTClientRequest setApplication:](v17, "setApplication:", v12);
    -[KTClientRequest setUri:](v17, "setUri:", v13);
    -[KTClientRequest setAccountKey:](v17, "setAccountKey:", v14);
    -[KTClientRequest setServerLoggableDatas:](v17, "setServerLoggableDatas:", v15);
  }

  return v17;
}

- (id)addValidateRequest:(id)a3 dataStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_100178234;
  v29 = sub_100178244;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100178234;
  v23 = sub_100178244;
  v24 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017824C;
  v14[3] = &unk_10024A6C8;
  v14[4] = self;
  v17 = &v25;
  v9 = a4;
  v15 = v9;
  v18 = &v19;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v14);
  if (a5)
  {
    v11 = (void *)v20[5];
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
  v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUri:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)serverLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)clientLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSData)queryRequest
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueryRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)queryResponse
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueryResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResponse, 0);
  objc_storeStrong((id *)&self->_queryRequest, 0);
  objc_storeStrong((id *)&self->_clientLoggableDatas, 0);
  objc_storeStrong((id *)&self->_serverLoggableDatas, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
