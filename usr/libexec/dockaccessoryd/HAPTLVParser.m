@implementation HAPTLVParser

+ (id)parserWithData:(id)a3
{
  id v3;
  HAPTLVParser *v4;

  v3 = a3;
  v4 = -[HAPTLVParser initWithData:]([HAPTLVParser alloc], "initWithData:", v3);

  return v4;
}

- (HAPTLVParser)initWithData:(id)a3
{
  id v5;
  HAPTLVParser *v6;
  HAPTLVParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVParser;
  v6 = -[HAPTLVParser init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tlvData, a3);

  return v7;
}

- (id)parseResponseForData:(unint64_t)a3
{
  char *v5;
  NSUInteger v6;
  int v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  id v22;

  v5 = -[NSData bytes](self->_tlvData, "bytes");
  v6 = -[NSData length](self->_tlvData, "length");
  v15 = 0;
  v16 = 0;
  v7 = TLV8Get(v5, &v5[v6], a3, &v16, &v15, 0);
  if (!v7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v16, v15));
  v8 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, v7, 0);
  v10 = sub_10007CCE4(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = sub_10007CD2C(0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543874;
    v18 = v13;
    v19 = 2048;
    v20 = a3;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse data for TLV: %tu %@", buf, 0x20u);

  }
  return 0;
}

- (id)parseResponseForNumber:(unint64_t)a3
{
  const void *v5;
  uint64_t UInt64;
  int v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  int v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  id v23;

  v17 = 0;
  v5 = -[NSData bytes](self->_tlvData, "bytes");
  UInt64 = TLV8GetUInt64(v5, (char *)-[NSData length](self->_tlvData, "length") + (_QWORD)v5, a3, &v17, 0);
  v7 = v17;
  if (v17)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", UInt64));
    v7 = v17;
    if (v8)
      return v8;
  }
  if (v7)
  {
    v9 = objc_alloc((Class)NSError);
    v10 = objc_msgSend(v9, "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, v17, 0);
    v12 = sub_10007CCE4(0, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_10007CD2C(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      v20 = 2048;
      v21 = a3;
      v22 = 2112;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse number for TLV: %tu %@", buf, 0x20u);

    }
  }
  return v8;
}

- (id)parseResponseForUInt8:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3));
  if (objc_msgSend(v3, "length") == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes")));
  else
    v4 = 0;

  return v4;
}

- (id)parseResponseForUInt16:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3));
  if (objc_msgSend(v3, "length") == (id)2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v3), "bytes")));
  else
    v4 = 0;

  return v4;
}

- (id)parseResponseForString:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3));
  if (v3)
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

- (id)parseResponseForUUID:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3));
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v3), "bytes"));
  else
    v4 = 0;

  return v4;
}

- (id)parseResponseForArray:(unint64_t)a3
{
  char *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;

  v19 = -[NSData bytes](self->_tlvData, "bytes");
  v5 = (char *)-[NSData length](self->_tlvData, "length") + (_QWORD)v19;
  v17 = 0;
  v18 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = TLV8Get(v19, v5, a3, &v18, &v17, &v19);
  if (v7)
  {
    if (v6)
      return v6;
  }
  else
  {
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v18, v17));
      objc_msgSend(v6, "addObject:", v8);

      v9 = TLV8Get(v19, v5, a3, &v18, &v17, &v19);
    }
    while (!v9);
    v7 = v9;
    if (v6)
      return v6;
  }
  v10 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", NSOSStatusErrorDomain, v7, 0);
  v12 = sub_10007CCE4(0, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = sub_10007CD2C(0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543874;
    v21 = v15;
    v22 = 2048;
    v23 = a3;
    v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse array for TLV: %tu %@", buf, 0x20u);

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvData, 0);
}

@end
