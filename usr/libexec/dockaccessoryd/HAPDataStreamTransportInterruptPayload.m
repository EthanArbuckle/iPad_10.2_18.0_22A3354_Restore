@implementation HAPDataStreamTransportInterruptPayload

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDataStreamTransportInterruptPayload *v6;
  HAPDataStreamTransportInterruptPayload *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportInterruptPayload);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDataStreamTransportInterruptPayload parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

- (HAPDataStreamTransportInterruptPayload)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  return -[HAPDataStreamTransportInterruptPayload init](&v3, "init");
}

- (HAPDataStreamTransportInterruptPayload)initWithRequestToSendIdentifiers:(id)a3 dataStreamTransportInterruptSequenceNumber:(id)a4
{
  id v7;
  id v8;
  HAPDataStreamTransportInterruptPayload *v9;
  HAPDataStreamTransportInterruptPayload *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  v9 = -[HAPDataStreamTransportInterruptPayload init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestToSendIdentifiers, a3);
    objc_storeStrong((id *)&v10->_dataStreamTransportInterruptSequenceNumber, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id *v21;
  id v22;
  id v23;
  uint64_t v24;
  id *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    v10 = 0;
LABEL_16:
    -[HAPDataStreamTransportInterruptPayload setRequestToSendIdentifiers:](self, "setRequestToSendIdentifiers:", v10, v26);
    -[HAPDataStreamTransportInterruptPayload setDataStreamTransportInterruptSequenceNumber:](self, "setDataStreamTransportInterruptSequenceNumber:", v9);
    v11 = 0;
    v20 = 1;
    goto LABEL_24;
  }
  v26 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = (unint64_t)v7 + v8;
  while (1)
  {
    v33 = 0;
    v31 = 0;
    v32 = 0;
    v30 = 0;
    Next = TLV8GetNext(v7, v12, &v33, &v32, &v31, &v30);
    if ((_DWORD)Next)
      break;
    if (!v32)
    {
      v24 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v11 = (void *)v24;
      if (!v24)
        goto LABEL_16;
LABEL_20:
      v21 = v26;
      if (v26)
      {
        v23 = objc_retainAutorelease(v11);
        v11 = v23;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v33 == 2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v27 = v11;
      v19 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v27));
      v16 = v27;

      v18 = v9;
      v9 = (void *)v19;
LABEL_10:

LABEL_11:
      v11 = v16;
      goto LABEL_12;
    }
    if (v33 == 1)
    {
      v29 = v11;
      v14 = sub_100022878(1, (unint64_t)v7, v12, (unint64_t *)&v30, &v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = v29;

      if (!v16)
      {
        v28 = 0;
        v17 = objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v15, &v28));
        v16 = v28;
        v18 = v10;
        v10 = (void *)v17;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
LABEL_12:
    v7 = v30;
    if ((unint64_t)v30 >= v12)
    {
      if (!v11)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  v21 = v26;
  if (v26)
  {
    v22 = sub_100040DDC(Next);
    v23 = (id)objc_claimAutoreleasedReturnValue(v22);
LABEL_22:
    v20 = 0;
    *v21 = v23;
    goto LABEL_24;
  }
LABEL_23:
  v20 = 0;
LABEL_24:

  return v20;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  _OWORD v25[21];

  memset(v25, 0, sizeof(v25));
  TLV8BufferInit(v25, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers"));

  if (!v5)
  {
LABEL_10:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber"));
      v23 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serializeWithError:", &v23));
      v8 = v23;

      if (v8)
        goto LABEL_12;
      v19 = objc_retainAutorelease(v7);
      v18 = TLV8BufferAppend(v25, 2, objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));

      if ((_DWORD)v18)
      {
LABEL_16:
        if (a3)
        {
          v20 = sub_100040DDC(v18);
          v17 = (id)objc_claimAutoreleasedReturnValue(v20);
          v8 = 0;
          goto LABEL_18;
        }
        v8 = 0;
LABEL_21:
        v21 = 0;
        goto LABEL_22;
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v25[0]));
    v8 = 0;
    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers"));
  v24 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v24));
  v8 = v24;

  if (!v8)
  {
    v9 = objc_retainAutorelease(v7);
    v10 = (char *)objc_msgSend(v9, "bytes");
    v11 = (char *)objc_msgSend(v9, "length") + (_QWORD)v10;
    while (1)
    {
      v12 = v11 - v10 >= 255 ? 255 : v11 - v10;
      v13 = TLV8BufferAppend(v25, 1, v10, v12);
      if ((_DWORD)v13)
        break;
      v10 += v12;
      if (v10 >= v11)
      {

        goto LABEL_10;
      }
    }
    v18 = v13;

    goto LABEL_16;
  }
LABEL_12:

  if (!a3)
    goto LABEL_21;
  v17 = objc_retainAutorelease(v8);
  v8 = v17;
LABEL_18:
  v21 = 0;
  *a3 = v17;
LABEL_22:
  TLV8BufferFree(v25, v16);

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPDataStreamTransportInterruptPayload *v4;
  void *v5;
  void *v6;
  HAPDataStreamTransportInterruptPayload *v7;

  v4 = +[HAPDataStreamTransportInterruptPayload allocWithZone:](HAPDataStreamTransportInterruptPayload, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber"));
  v7 = -[HAPDataStreamTransportInterruptPayload initWithRequestToSendIdentifiers:dataStreamTransportInterruptSequenceNumber:](v4, "initWithRequestToSendIdentifiers:dataStreamTransportInterruptSequenceNumber:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v5;
  HAPDataStreamTransportInterruptPayload *v6;
  uint64_t v7;
  HAPDataStreamTransportInterruptPayload *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (HAPDataStreamTransportInterruptPayload *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    v7 = objc_opt_class(HAPDataStreamTransportInterruptPayload, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](v8, "requestToSendIdentifiers"));
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](v8, "requestToSendIdentifiers"));
        if (!objc_msgSend(v11, "isEqual:", v3))
        {
          v12 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v18 = v11;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](v8, "dataStreamTransportInterruptSequenceNumber"));
      if (v13 == v14)
      {
        v12 = 1;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](v8, "dataStreamTransportInterruptSequenceNumber"));
        v12 = objc_msgSend(v15, "isEqual:", v16);

      }
      v11 = v18;
      if (v9 == v10)
        goto LABEL_14;
      goto LABEL_13;
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPDataStreamTransportInterruptPayload requestToSendIdentifiers=%@, dataStreamTransportInterruptSequenceNumber=%@>"), v3, v4));

  return (NSString *)v5;
}

- (NSData)requestToSendIdentifiers
{
  return self->_requestToSendIdentifiers;
}

- (void)setRequestToSendIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_requestToSendIdentifiers, a3);
}

- (HAPTLVUnsignedNumberValue)dataStreamTransportInterruptSequenceNumber
{
  return self->_dataStreamTransportInterruptSequenceNumber;
}

- (void)setDataStreamTransportInterruptSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_dataStreamTransportInterruptSequenceNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStreamTransportInterruptSequenceNumber, 0);
  objc_storeStrong((id *)&self->_requestToSendIdentifiers, 0);
}

@end
