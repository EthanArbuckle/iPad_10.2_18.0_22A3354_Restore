@implementation MZKeyValueStoreRequest

- (MZKeyValueStoreRequest)initWithTransaction:(id)a3
{
  id v5;
  MZKeyValueStoreRequest *v6;
  MZKeyValueStoreRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MZKeyValueStoreRequest;
  v6 = -[MZKeyValueStoreRequest init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transaction, a3);

  return v7;
}

- (void)start
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest serializer](self, "serializer"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "payload"));

  -[MZKeyValueStoreRequest postData:](self, "postData:", v4);
}

- (void)postData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    v4 = objc_alloc((Class)NSMutableURLRequest);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest transaction](self, "transaction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
    v7 = objc_msgSend(v4, "initWithURL:", v6);

    objc_msgSend(v7, "setHTTPBody:", v10);
    objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    if (-[MZKeyValueStoreRequest shouldAuthenticate](self, "shouldAuthenticate"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
      objc_msgSend(v8, "promptAccountAuthenticationWithDebugReason:forced:", CFSTR("Podcasts Bookkeeper Sync"), 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest delegate](self, "delegate"));
      objc_msgSend(v9, "keyValueStoreOperationOperationDidFinish:", self);

    }
    else
    {
      -[MZKeyValueStoreRequest scheduleStoreURLRequest:](self, "scheduleStoreURLRequest:", v7);
    }
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest delegate](self, "delegate"));
    objc_msgSend(v7, "keyValueStoreOperationOperationDidFinish:", self);
  }

}

- (void)scheduleStoreURLRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest delegate](self, "delegate"));
  objc_msgSend(v5, "keyValueStoreOperation:scheduleURLRequest:", self, v4);

}

- (MZKeyValueStoreSerializer)serializer
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  __objc2_class *v6;
  id v7;
  void *v8;
  MZKeyValueStoreSerializer *v9;
  MZKeyValueStoreSerializer *serializer;

  if (!self->_serializer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest transaction](self, "transaction"));
    v4 = objc_opt_class(MTApnsTransaction);
    isKindOfClass = objc_opt_isKindOfClass(v3, v4);

    if ((isKindOfClass & 1) != 0)
      v6 = MTApnsSerializer;
    else
      v6 = MZKeyValueStoreSerializer;
    v7 = [v6 alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreRequest transaction](self, "transaction"));
    v9 = (MZKeyValueStoreSerializer *)objc_msgSend(v7, "initWithTransaction:", v8);
    serializer = self->_serializer;
    self->_serializer = v9;

  }
  return self->_serializer;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MZKeyValueStoreOperationDelegate)delegate
{
  return (MZKeyValueStoreOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
