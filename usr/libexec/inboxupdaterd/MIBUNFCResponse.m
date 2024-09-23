@implementation MIBUNFCResponse

- (MIBUNFCResponse)init
{
  MIBUNFCResponse *v2;
  MIBUNFCResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUNFCResponse;
  v2 = -[MIBUNFCResponse init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUNFCResponse setRejected:](v2, "setRejected:", 0);
    -[MIBUNFCResponse setError:](v3, "setError:", 0);
  }
  return v3;
}

- (MIBUNFCResponse)initWithResponsePayload:(id)a3
{
  id v4;
  MIBUNFCResponse *v5;
  MIBUNFCResponse *v6;
  MIBUNFCResponse *v7;

  v4 = a3;
  v5 = -[MIBUNFCResponse init](self, "init");
  v6 = v5;
  if (v5 && !-[MIBUNFCResponse _deserialize:](v5, "_deserialize:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (id)serialize
{
  MIBUSerializer *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v8;

  v3 = objc_opt_new(MIBUSerializer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCResponse error](self, "error"));
  v5 = -[MIBUSerializer serializeResponseError:](v3, "serializeResponseError:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057A40);
    v8 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D2A8(v8, self);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  BOOL v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v5, "deserialize"));
  if (!v6)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057A60);
    v11 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D34C(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_14;
  }
  v27 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v27);
  v8 = v27;
  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057A80);
    v19 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D37C(v19, v20, v21, v22, v23, v24, v25, v26);

LABEL_14:
    v9 = 0;
    goto LABEL_4;
  }
  -[MIBUNFCResponse setError:](self, "setError:", v8);

  v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)rejected
{
  return self->_rejected;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
