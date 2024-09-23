@implementation MIBUSelectResponse

- (MIBUSelectResponse)init
{
  MIBUSelectResponse *v2;
  MIBUSelectResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUSelectResponse;
  v2 = -[MIBUNFCResponse init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MIBUSelectResponse setProtocolVersion:](v2, "setProtocolVersion:", 0);
  return v3;
}

- (id)serialize
{
  MIBUSerializer *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = objc_opt_new(MIBUSerializer);
  if (-[MIBUNFCResponse rejected](self, "rejected"))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSelectResponse protocolVersion](self, "protocolVersion"));
  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v6 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D0B8, v5);

  if ((v6 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057AA0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D3AC();
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCResponse error](self, "error"));
  v8 = -[MIBUSerializer serializeResponseError:](v3, "serializeResponseError:", v7);

  if ((v8 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057AC0);
    v11 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003AD5C(v11, self);
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));
LABEL_5:

  return v9;
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v14;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v5, "deserialize"));
  if (!v6)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057AE0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D3D8();
    goto LABEL_22;
  }
  v14 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v14);
  v8 = v14;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057B00);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D430();
    v11 = 0;
    goto LABEL_23;
  }
  if (v8)
  {
    v11 = 0;
    goto LABEL_6;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005C280));
  if (!v10)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100057B20);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003D404();
LABEL_22:
    v11 = 0;
    v9 = 0;
LABEL_23:
    v12 = 0;
    goto LABEL_7;
  }
  v11 = (void *)v10;
  -[MIBUSelectResponse setProtocolVersion:](self, "setProtocolVersion:", v10);
  v9 = 0;
LABEL_6:
  v12 = 1;
LABEL_7:
  -[MIBUNFCResponse setError:](self, "setError:", v9);

  return v12;
}

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_protocolVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
}

@end
