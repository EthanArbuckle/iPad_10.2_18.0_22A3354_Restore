@implementation HAPBTLEResponse

- (HAPBTLEResponse)init
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

- (HAPBTLEResponse)initWithRequest:(id)a3
{
  id v5;
  HAPBTLEResponse *v6;
  HAPBTLEResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPBTLEResponse;
  v6 = -[HAPBTLEResponse init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
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
  const __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse shortDescription](self, "shortDescription"));
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  else
    v6 = &stru_10023F210;
  if (-[HAPBTLEResponse isEncrypted](self, "isEncrypted"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse identifier](self, "identifier"));
  v9 = -[HAPBTLEResponse bodyLength](self, "bodyLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse request](self, "request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse body](self, "body"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@%@, Encrypted = %@, Response Identifier = %@, Body Length = %tu, Request = %@> <Body: %@>"), v5, v6, v7, v8, v9, v10, v11));

  if (v3)
  return v12;
}

- (id)debugDescription
{
  return -[HAPBTLEResponse descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLEResponse descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)isEncrypted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse request](self, "request"));
  v3 = objc_msgSend(v2, "isEncrypted");

  return v3;
}

- (BOOL)isComplete
{
  _BOOL4 v3;

  v3 = -[HAPBTLEResponse isHeaderComplete](self, "isHeaderComplete");
  if (v3)
    LOBYTE(v3) = -[HAPBTLEResponse isBodyComplete](self, "isBodyComplete");
  return v3;
}

- (BOOL)isBodyComplete
{
  id v3;
  void *v4;
  BOOL v5;

  if (!-[HAPBTLEResponse isHeaderComplete](self, "isHeaderComplete"))
    return 0;
  v3 = -[HAPBTLEResponse bodyLength](self, "bodyLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse body](self, "body"));
  v5 = v3 == objc_msgSend(v4, "length");

  return v5;
}

- (BOOL)isValid
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = -[HAPBTLEResponse isComplete](self, "isComplete");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse identifier](self, "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse request](self, "request"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = objc_msgSend(v4, "isEqual:", v6);

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (unint64_t)_remainingBodyLength
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse body](self, "body"));

  if (v3)
    return 0;
  v5 = -[HAPBTLEResponse bodyLength](self, "bodyLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse _internalBody](self, "_internalBody"));
  v4 = v5 - (_QWORD)objc_msgSend(v6, "length");

  return v4;
}

- (unint64_t)appendData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  char *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v6 = a3;
  if (-[HAPBTLEResponse isComplete](self, "isComplete"))
  {
    v8 = sub_10007CCE4(0, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sub_10007CD2C(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse shortDescription](self, "shortDescription"));
      v30 = 138543618;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not appending data, the response is complete", (uint8_t *)&v30, 0x16u);

    }
    if (a4)
    {
      v13 = CFSTR("Response is complete.");
LABEL_6:
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Failed to parse response."), v13, 0, 0));
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  if (-[HAPBTLEResponse isHeaderComplete](self, "isHeaderComplete"))
  {
    v14 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v6, "length") <= 1)
    {
      v16 = sub_10007CCE4(0, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = sub_10007CD2C(0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse shortDescription](self, "shortDescription"));
        v30 = 138543874;
        v31 = v19;
        v32 = 2112;
        v33 = v20;
        v34 = 2112;
        v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@[%@] The data, %@, does not contain the entire response header", (uint8_t *)&v30, 0x20u);

      }
      if (a4)
      {
        v13 = CFSTR("The entire header was not present.");
        goto LABEL_6;
      }
LABEL_14:
      v14 = 0;
      goto LABEL_27;
    }
    v14 = -[HAPBTLEResponse _deserializeHeaderWithData:error:](self, "_deserializeHeaderWithData:error:", v6, a4);
    if (!v14)
      goto LABEL_27;
  }
  v21 = (char *)objc_msgSend(v6, "length");
  if (!-[HAPBTLEResponse isBodyComplete](self, "isBodyComplete") && v21 != (char *)v14)
  {
    v22 = -[HAPBTLEResponse _remainingBodyLength](self, "_remainingBodyLength");
    if (v22)
    {
      if (v22 >= (unint64_t)&v21[-v14])
        v23 = (unint64_t)&v21[-v14];
      else
        v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse _internalBody](self, "_internalBody"));

      if (!v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", -[HAPBTLEResponse bodyLength](self, "bodyLength")));
        -[HAPBTLEResponse _setInternalBody:](self, "_setInternalBody:", v25);

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse _internalBody](self, "_internalBody"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", v14, v23));
      objc_msgSend(v26, "appendData:", v27);

      v14 += v23;
    }
    if (!-[HAPBTLEResponse _remainingBodyLength](self, "_remainingBodyLength"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse _internalBody](self, "_internalBody"));
      -[HAPBTLEResponse setBody:](self, "setBody:", v28);

      -[HAPBTLEResponse _setInternalBody:](self, "_setInternalBody:", 0);
    }
  }
LABEL_27:

  return v14;
}

- (unint64_t)_deserializeHeaderWithData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  HAPBTLETransactionIdentifier *v8;
  HAPBTLETransactionIdentifier *v9;
  HAPBTLETransactionIdentifier *identifier;
  void *v11;
  unint64_t v12;
  _BYTE v14[2];

  v6 = a3;
  v7 = 2;
  objc_msgSend(v6, "getBytes:length:", v14, 2);
  v8 = [HAPBTLETransactionIdentifier alloc];
  v9 = -[HAPBTLETransactionIdentifier initWithUnsignedCharValue:](v8, "initWithUnsignedCharValue:", v14[0]);
  identifier = self->_identifier;
  self->_identifier = v9;

  self->_statusCode = v14[1];
  if ((unint64_t)objc_msgSend(v6, "length") >= 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 2, (char *)objc_msgSend(v6, "length") - 2));
    v12 = -[HAPBTLEResponse _deserializeHeaderBodyLengthWithData:error:](self, "_deserializeHeaderBodyLengthWithData:error:", v11, a4);

    if (!v12)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v7 = v12 + 2;
  }
  -[HAPBTLEResponse setHeaderComplete:](self, "setHeaderComplete:", 1);
LABEL_6:

  return v7;
}

- (unint64_t)_deserializeHeaderBodyLengthWithData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") > 1)
  {
    LOWORD(v15) = 0;
    v13 = 2;
    objc_msgSend(v6, "getBytes:range:", &v15, 0, 2);
    self->_bodyLength = (unsigned __int16)v15;
  }
  else
  {
    v8 = sub_10007CCE4(0, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_10007CD2C(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEResponse shortDescription](self, "shortDescription"));
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse header body length with control body: %@", (uint8_t *)&v15, 0x20u);

    }
    v13 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 15, CFSTR("Failed to parse response."), CFSTR("Failed to parse header body length."), 0, 0));
  }

  return v13;
}

- (HAPBTLERequest)request
{
  return self->_request;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isHeaderComplete
{
  return self->_headerComplete;
}

- (void)setHeaderComplete:(BOOL)a3
{
  self->_headerComplete = a3;
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (NSMutableData)_internalBody
{
  return self->__internalBody;
}

- (void)_setInternalBody:(id)a3
{
  objc_storeStrong((id *)&self->__internalBody, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__internalBody, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
