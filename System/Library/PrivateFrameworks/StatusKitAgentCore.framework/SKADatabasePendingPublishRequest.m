@implementation SKADatabasePendingPublishRequest

- (SKADatabasePendingPublishRequest)initWithCoreDataPendingPublishRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SKADatabasePendingPublishRequest *v10;

  v4 = a3;
  objc_msgSend(v4, "statusTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "retryCount");

  v10 = -[SKADatabasePendingPublishRequest initWithStatusTypeIdentifier:dateCreated:payloadData:statusUniqueIdentifier:retryCount:](self, "initWithStatusTypeIdentifier:dateCreated:payloadData:statusUniqueIdentifier:retryCount:", v5, v6, v7, v8, v9);
  return v10;
}

- (SKADatabasePendingPublishRequest)initWithStatusTypeIdentifier:(id)a3 dateCreated:(id)a4 payloadData:(id)a5 statusUniqueIdentifier:(id)a6 retryCount:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SKADatabasePendingPublishRequest *v16;
  uint64_t v17;
  NSString *statusTypeIdentifier;
  uint64_t v19;
  NSDate *dateCreated;
  uint64_t v21;
  NSString *statusUniqueIdentifier;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SKADatabasePendingPublishRequest;
  v16 = -[SKADatabasePendingPublishRequest init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    statusTypeIdentifier = v16->_statusTypeIdentifier;
    v16->_statusTypeIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    dateCreated = v16->_dateCreated;
    v16->_dateCreated = (NSDate *)v19;

    objc_storeStrong((id *)&v16->_payloadData, a5);
    v21 = objc_msgSend(v15, "copy");
    statusUniqueIdentifier = v16->_statusUniqueIdentifier;
    v16->_statusUniqueIdentifier = (NSString *)v21;

    v16->_retryCount = a7;
  }

  return v16;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (NSString)statusUniqueIdentifier
{
  return self->_statusUniqueIdentifier;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
}

@end
