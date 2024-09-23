@implementation HAPBTLERequest

- (HAPBTLERequest)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (id)_initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  int v10;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  const char *v22;
  id v23;
  __CFString *v24;
  id v25;
  __CFString *v26;
  HAPBTLERequest *v27;
  HAPBTLERequest *v29;
  uint64_t v30;
  HAPService *service;
  NSData *v32;
  NSData *body;
  HAPBTLETransactionIdentifier *v34;
  HAPBTLETransactionIdentifier *v35;
  HAPBTLETransactionIdentifier *identifier;
  objc_super v37;
  uint8_t buf[4];
  void *v39;

  v10 = a4;
  v13 = a3;
  v14 = a5;
  v16 = v14;
  if (v10)
  {
    if (a7 <= 0.0)
    {
      v25 = sub_10007CCE4(0, v15);
      v19 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v26 = sub_10007CD2C(0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138543362;
        v39 = v21;
        v22 = "%{public}@[HAPBTLERequest] A timeout > 0 is required";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    if ((unint64_t)objc_msgSend(v14, "length") >= 0x10000)
    {
      v18 = sub_10007CCE4(0, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = sub_10007CD2C(0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138543362;
        v39 = v21;
        v22 = "%{public}@[HAPBTLERequest] The body length must not exceed 64KB";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    v37.receiver = self;
    v37.super_class = (Class)HAPBTLERequest;
    v29 = -[HAPBTLERequest init](&v37, "init");
    if (v29)
    {
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "service"));
      service = v29->_service;
      v29->_service = (HAPService *)v30;

      objc_storeStrong((id *)&v29->_characteristic, a3);
      v29->_type = v10;
      v32 = (NSData *)objc_msgSend(v16, "copy");
      body = v29->_body;
      v29->_body = v32;

      v29->_encrypted = a6;
      v29->_timeoutInterval = a7;
      if (v10 != 255)
      {
        v34 = (HAPBTLETransactionIdentifier *)objc_claimAutoreleasedReturnValue(+[HAPBTLETransactionIdentifier randomTransactionIdentifier](HAPBTLETransactionIdentifier, "randomTransactionIdentifier"));
LABEL_18:
        identifier = v29->_identifier;
        v29->_identifier = v34;

        goto LABEL_19;
      }
      if ((unint64_t)objc_msgSend(v16, "length") >= 2)
      {
        buf[0] = 0;
        objc_msgSend(v16, "getBytes:range:", buf, 1, 1);
        v35 = [HAPBTLETransactionIdentifier alloc];
        v34 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v35, "initWithUnsignedCharValue:", buf[0]);
        goto LABEL_18;
      }
    }
LABEL_19:
    self = v29;
    v27 = self;
    goto LABEL_12;
  }
  v23 = sub_10007CCE4(0, v15);
  v19 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v24 = sub_10007CD2C(0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138543362;
    v39 = v21;
    v22 = "%{public}@[HAPBTLERequest] A request type is required";
    goto LABEL_10;
  }
LABEL_11:

  v27 = 0;
LABEL_12:

  return v27;
}

- (HAPBTLERequest)initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  HAPBTLERequest *v7;
  HAPBTLERequest *v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  int v14;
  void *v15;

  v7 = self;
  if (a3)
  {
    v7 = (HAPBTLERequest *)-[HAPBTLERequest _initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](self, "_initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", a3, a4, a5, a6, a7);
    v8 = v7;
  }
  else
  {
    v9 = sub_10007CCE4(0, (uint64_t)a2);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_10007CD2C(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v14 = 138543362;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] A characteristic is required", (uint8_t *)&v14, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (HAPBTLERequest)initWithRequestType:(unsigned __int8)a3 bodyData:(id)a4 shouldEncrypt:(BOOL)a5 timeoutInterval:(double)a6
{
  return (HAPBTLERequest *)-[HAPBTLERequest _initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:](self, "_initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", 0, a3, a4, a5, a6);
}

- (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest shortDescription](self, "shortDescription"));
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  else
    v6 = &stru_10023F210;
  v7 = -[HAPBTLERequest type](self, "type") + 1;
  if (v7 > 9u)
    v8 = CFSTR("unknown");
  else
    v8 = off_100236CA8[(char)v7];
  -[HAPBTLERequest timeoutInterval](self, "timeoutInterval");
  v10 = v9;
  if (-[HAPBTLERequest isEncrypted](self, "isEncrypted"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest identifier](self, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest body](self, "body"));
  v14 = objc_msgSend(v13, "length");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest characteristic](self, "characteristic"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@%@, Type = %@, Timeout = %f, Encrypted = %@, Request Identifier = %@, Body Length = %tu, Characteristic = %@>"), v5, v6, v8, v10, v11, v12, v14, v15));

  if (v3)
  return v16;
}

- (id)debugDescription
{
  return -[HAPBTLERequest descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLERequest descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (void)cancelWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[HAPBTLERequest isFinished](self, "isFinished"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest operation](self, "operation"));
    objc_msgSend(v4, "cancelWithError:", v6);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest responseTimer](self, "responseTimer"));
    objc_msgSend(v5, "suspend");

  }
}

- (id)serialize
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  if (-[HAPBTLERequest type](self, "type") == 255)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest body](self, "body"));
    v4 = objc_msgSend(v7, "mutableCopy");
    goto LABEL_5;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest _serializeHeader](self, "_serializeHeader"));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest body](self, "body"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest body](self, "body"));
    objc_msgSend(v4, "appendData:", v7);
LABEL_5:

  }
  return v4;
}

- (id)_serializeHeader
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int16 v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int16 v16;
  id v17;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 6));
  v23 = -[HAPBTLERequest type](self, "type");
  objc_msgSend(v3, "appendBytes:length:", &v23, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest identifier](self, "identifier"));
  v5 = objc_msgSend(v4, "unsignedCharValue");

  v22 = v5;
  objc_msgSend(v3, "appendBytes:length:", &v22, 1);
  if (-[HAPBTLERequest type](self, "type") == 6 || -[HAPBTLERequest type](self, "type") == 8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest service](self, "service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceID"));
    v8 = (unsigned __int16)objc_msgSend(v7, "unsignedShortValue");

    v21 = v8;
    objc_msgSend(v3, "appendBytes:length:", &v21, 2);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest characteristic](self, "characteristic"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID"));
      v12 = (unsigned __int16)objc_msgSend(v11, "unsignedShortValue");

    }
    else
    {
      v12 = 0;
    }
    v20 = v12;
    objc_msgSend(v3, "appendBytes:length:", &v20, 2);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest body](self, "body"));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLERequest body](self, "body"));
    v16 = (unsigned __int16)objc_msgSend(v15, "length");

    v19 = v16;
    objc_msgSend(v3, "appendBytes:length:", &v19, 2);
  }
  v17 = objc_msgSend(v3, "copy");

  return v17;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (unsigned)type
{
  return self->_type;
}

- (HAPService)service
{
  return self->_service;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSData)body
{
  return self->_body;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (HMFBlockOperation)operation
{
  return (HMFBlockOperation *)objc_loadWeakRetained((id *)&self->_operation);
}

- (void)setOperation:(id)a3
{
  objc_storeWeak((id *)&self->_operation, a3);
}

- (HAPBTLEControlOutputStream)controlOutputStream
{
  return self->_controlOutputStream;
}

- (void)setControlOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_controlOutputStream, a3);
}

- (HMFTimer)responseTimer
{
  return self->_responseTimer;
}

- (void)setResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_responseTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_controlOutputStream, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
