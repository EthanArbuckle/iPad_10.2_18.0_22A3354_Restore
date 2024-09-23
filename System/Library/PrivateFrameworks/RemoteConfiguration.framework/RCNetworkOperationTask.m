@implementation RCNetworkOperationTask

- (RCNetworkOperationTask)initWithIdentifier:(id)a3
{
  id v5;
  RCNetworkOperationTask *v6;
  RCNetworkOperationTask *v7;
  NSMutableData *v8;
  NSMutableData *dataStore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCNetworkOperationTask;
  v6 = -[RCNetworkOperationTask init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    dataStore = v7->_dataStore;
    v7->_dataStore = v8;

  }
  return v7;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[RCNetworkOperationTask dataStore](self, "dataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSData *)v3;
}

- (void)receiveData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCNetworkOperationTask dataStore](self, "dataStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpResponse:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponse, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableData)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
