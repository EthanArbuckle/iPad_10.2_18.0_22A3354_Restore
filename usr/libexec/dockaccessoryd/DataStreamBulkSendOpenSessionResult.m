@implementation DataStreamBulkSendOpenSessionResult

- (DataStreamBulkSendOpenSessionResult)initWithSession:(id)a3 payload:(id)a4
{
  id v7;
  id v8;
  DataStreamBulkSendOpenSessionResult *v9;
  DataStreamBulkSendOpenSessionResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DataStreamBulkSendOpenSessionResult;
  v9 = -[DataStreamBulkSendOpenSessionResult init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[2];

  v3 = objc_alloc((Class)HMFAttributeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendOpenSessionResult session](self, "session"));
  v5 = objc_msgSend(v3, "initWithName:value:", CFSTR("session"), v4);
  v11[0] = v5;
  v6 = objc_alloc((Class)HMFAttributeDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamBulkSendOpenSessionResult payload](self, "payload"));
  v8 = objc_msgSend(v6, "initWithName:value:", CFSTR("payload"), v7);
  v11[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

  return v9;
}

- (DataStreamBulkSendSession)session
{
  return self->_session;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
