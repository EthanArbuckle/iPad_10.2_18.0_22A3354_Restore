@implementation HAPBTLEControlPacket

- (HAPBTLEControlPacket)init
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

+ (id)packetWithSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  HAPBTLETransactionIdentifier *v15;
  void *v16;
  HAPBTLEControlPacket *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v24;
  unsigned __int8 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    v7 = CFSTR("The control field length is invalid.");
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v5, "getBytes:range:", buf, 0, 1);
  v6 = buf[0];
  if ((buf[0] & 1) != 0)
  {
    v7 = CFSTR("Invalid control field version.");
    goto LABEL_7;
  }
  if ((buf[0] & 0x70) != 0)
  {
    v7 = CFSTR("Reserved bits must be zero.");
LABEL_7:
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to parse control field."), v7, 0, 0));
LABEL_8:
    v9 = 0;
LABEL_9:
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v9 = (buf[0] >> 1) & 7;
  if (v9 > 1)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid control type: %u."), (buf[0] >> 1) & 7));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to parse control field."), v24, 0, 0));

    goto LABEL_8;
  }
  if ((buf[0] & 0x80) != 0)
  {
    if ((unint64_t)objc_msgSend(v5, "length") <= 1)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Failed to parse control field."), CFSTR("The control field length is invalid for a continuation payload."), 0, 0));
      goto LABEL_9;
    }
    v25 = 0;
    objc_msgSend(v5, "getBytes:range:", &v25, 1, 1);
    v11 = v25;
    v12 = 2;
  }
  else
  {
    v11 = 0;
    v12 = 1;
  }
  v8 = 0;
  v10 = v6 >> 7;
LABEL_10:

  v14 = v8;
  if (v12)
  {
    v15 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:]([HAPBTLETransactionIdentifier alloc], "initWithUnsignedCharValue:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", v12, (char *)objc_msgSend(v5, "length") - v12));
    v17 = -[HAPBTLEControlPacket initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:]([HAPBTLEControlPacket alloc], "initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:", v9, v15, v10, v16, -1);

  }
  else
  {
    v18 = sub_10007CCE4(0, v13);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = sub_10007CD2C(0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[HAPBTLEControlPacket shortDescription](HAPBTLEControlPacket, "shortDescription"));
      *(_DWORD *)buf = 138543874;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse control field with error: %@", buf, 0x20u);

    }
    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }

  return v17;
}

- (HAPBTLEControlPacket)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 continuationPacket:(BOOL)a5 packetPayload:(id)a6 maximumLength:(unint64_t)a7
{
  _BOOL4 v9;
  id v13;
  id v14;
  HAPBTLEControlPacket *v15;
  HAPBTLEControlPacket *v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  id v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  HAPBTLEControlPacket *v26;
  uint64_t v27;
  NSData *payload;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  unint64_t v36;

  v9 = a5;
  v13 = a4;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)HAPBTLEControlPacket;
  v15 = -[HAPBTLEControlPacket init](&v30, "init");
  v16 = v15;
  if (!v15)
  {
LABEL_12:
    v26 = v16;
    goto LABEL_13;
  }
  v15->_type = a3;
  objc_storeStrong((id *)&v15->_transactionIdentifier, a4);
  v16->_continuationPacket = v9;
  if (v9)
    v18 = 2;
  else
    v18 = 1;
  v19 = a7 >= v18;
  v20 = (id)(a7 - v18);
  if (v19)
  {
    if (objc_msgSend(v14, "length") < v20)
      v20 = objc_msgSend(v14, "length");
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subdataWithRange:", 0, v20));
    payload = v16->_payload;
    v16->_payload = (NSData *)v27;

    goto LABEL_12;
  }
  v21 = sub_10007CCE4(0, v17);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = sub_10007CD2C(0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket shortDescription](v16, "shortDescription"));
    *(_DWORD *)buf = 138543874;
    v32 = v24;
    v33 = 2112;
    v34 = v25;
    v35 = 2048;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@[%@] The maximum packet length must be greater than the header length: %tu", buf, 0x20u);

  }
  v26 = 0;
LABEL_13:

  return v26;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  return objc_msgSend((id)objc_opt_class(self, a2), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  unsigned int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket shortDescription](self, "shortDescription"));
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  else
    v6 = &stru_10023F210;
  v7 = -[HAPBTLEControlPacket type](self, "type");
  v8 = CFSTR("unknown");
  if (v7 == 1)
    v8 = CFSTR("response");
  if (!v7)
    v8 = CFSTR("request");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket transactionIdentifier](self, "transactionIdentifier"));
  v11 = objc_msgSend(v10, "unsignedCharValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket payload](self, "payload"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@%@, Type = %@, Transaction Identifier = 0x%02x, Payload Length = %tu>"), v5, v6, v9, v11, objc_msgSend(v12, "length")));

  if (v3)
  return v13;
}

- (id)debugDescription
{
  return -[HAPBTLEControlPacket descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLEControlPacket descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)serialize
{
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;
  unsigned int v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;

  v3 = -[HAPBTLEControlPacket type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket transactionIdentifier](self, "transactionIdentifier"));
  v5 = objc_msgSend(v4, "unsignedCharValue");
  v6 = -[HAPBTLEControlPacket isContinuationPacket](self, "isContinuationPacket");
  buf[0] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", 2));
  v8 = v7;
  v9 = 2 * v3;
  if (v6)
    v9 = (2 * v3) | 0x80;
  v19 = v9;
  objc_msgSend(v7, "appendBytes:length:", &v19, 1);
  if (v6)
    objc_msgSend(v8, "appendBytes:length:", buf, 1);

  if (v8)
  {
    v11 = objc_msgSend(v8, "mutableCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket payload](self, "payload"));
    -[NSObject appendData:](v11, "appendData:", v12);

    v13 = -[NSObject copy](v11, "copy");
  }
  else
  {
    v14 = sub_10007CCE4(0, v10);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = sub_10007CD2C(0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket shortDescription](self, "shortDescription"));
      *(_DWORD *)buf = 138543874;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control header with error: %@", buf, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

- (unsigned)type
{
  return self->_type;
}

- (HAPBTLETransactionIdentifier)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)payload
{
  return self->_payload;
}

- (BOOL)isContinuationPacket
{
  return self->_continuationPacket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
