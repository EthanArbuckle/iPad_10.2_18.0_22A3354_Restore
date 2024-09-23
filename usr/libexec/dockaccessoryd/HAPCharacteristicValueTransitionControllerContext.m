@implementation HAPCharacteristicValueTransitionControllerContext

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransitionControllerContext *v6;
  HAPCharacteristicValueTransitionControllerContext *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionControllerContext);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransitionControllerContext parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPCharacteristicValueTransitionControllerContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionControllerContext;
  return -[HAPCharacteristicValueTransitionControllerContext init](&v3, "init");
}

- (HAPCharacteristicValueTransitionControllerContext)initWithIdentifier:(id)a3 startTime:(id)a4 transitionChecksum:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPCharacteristicValueTransitionControllerContext *v12;
  HAPCharacteristicValueTransitionControllerContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueTransitionControllerContext;
  v12 = -[HAPCharacteristicValueTransitionControllerContext init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_startTime, a4);
    objc_storeStrong((id *)&v13->_transitionChecksum, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t Next;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  id v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  HAPCharacteristicValueTransitionControllerContext *v28;
  id *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_24;
  }
  v28 = self;
  v29 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)v7 + v8;
  do
  {
    v37 = 0;
    v35 = 0;
    v36 = 0;
    v34 = 0;
    Next = TLV8GetNext(v7, v13, &v37, &v36, &v35, &v34);
    if ((_DWORD)Next)
    {
      v22 = v29;
      if (v29)
      {
        v24 = sub_100040DDC(Next);
        v23 = (id)objc_claimAutoreleasedReturnValue(v24);
        goto LABEL_21;
      }
LABEL_25:
      v25 = 0;
      goto LABEL_26;
    }
    if (!v36)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v9 = (void *)v26;
      if (!v26)
        goto LABEL_23;
LABEL_16:
      v22 = v29;
      if (v29)
      {
        v23 = objc_retainAutorelease(v9);
        v9 = v23;
LABEL_21:
        v25 = 0;
        *v22 = v23;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (v37 == 3)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v30 = v9;
      v20 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v16, &v30));
      v17 = v30;

      v19 = v10;
      v10 = (void *)v20;
      goto LABEL_12;
    }
    if (v37 == 2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v31 = v9;
      v21 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v16, &v31));
      v17 = v31;

      v19 = v11;
      v11 = (void *)v21;
      goto LABEL_12;
    }
    if (v37 != 1)
      goto LABEL_14;
    v33 = v9;
    v15 = sub_100022878(1, (unint64_t)v7, v13, (unint64_t *)&v34, &v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v33;

    if (!v17)
    {
      v32 = 0;
      v18 = objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v16, &v32));
      v17 = v32;
      v19 = v12;
      v12 = (void *)v18;
LABEL_12:

    }
    v9 = v17;
LABEL_14:
    v7 = v34;
  }
  while ((unint64_t)v34 < v13);
  if (v9)
    goto LABEL_16;
LABEL_23:
  self = v28;
LABEL_24:
  -[HAPCharacteristicValueTransitionControllerContext setIdentifier:](self, "setIdentifier:", v12, v28);
  -[HAPCharacteristicValueTransitionControllerContext setStartTime:](self, "setStartTime:", v11);
  -[HAPCharacteristicValueTransitionControllerContext setTransitionChecksum:](self, "setTransitionChecksum:", v10);
  v9 = 0;
  v25 = 1;
LABEL_26:

  return v25;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  _OWORD v29[21];

  memset(v29, 0, sizeof(v29));
  TLV8BufferInit(v29, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](self, "identifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](self, "identifier"));
    v28 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v28));
    v8 = v28;

    if (v8)
    {

      goto LABEL_22;
    }
    v10 = objc_retainAutorelease(v7);
    v11 = (char *)objc_msgSend(v10, "bytes");
    v12 = (char *)objc_msgSend(v10, "length") + (_QWORD)v11;
    while (1)
    {
      v13 = v12 - v11 >= 255 ? 255 : v12 - v11;
      v14 = TLV8BufferAppend(v29, 1, v11, v13);
      if ((_DWORD)v14)
        break;
      v11 += v13;
      if (v11 >= v12)
      {

        goto LABEL_11;
      }
    }
    v21 = v14;

LABEL_25:
    if (a3)
    {
      v23 = sub_100040DDC(v21);
      v22 = (id)objc_claimAutoreleasedReturnValue(v23);
      v8 = 0;
      goto LABEL_27;
    }
    v8 = 0;
LABEL_30:
    v24 = 0;
    goto LABEL_31;
  }
LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](self, "startTime"));

  if (!v15)
    goto LABEL_15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](self, "startTime"));
  v27 = 0;
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serializeWithError:", &v27));
  v8 = v27;

  if (v8)
  {
LABEL_17:
    v21 = 0;
    goto LABEL_21;
  }
  v17 = objc_retainAutorelease(v17);
  v18 = TLV8BufferAppend(v29, 2, objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
  if (!(_DWORD)v18)
  {

LABEL_15:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](self, "transitionChecksum"));

    if (!v19)
      goto LABEL_28;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](self, "transitionChecksum"));
    v26 = 0;
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serializeWithError:", &v26));
    v8 = v26;

    if (v8)
      goto LABEL_17;
    v17 = objc_retainAutorelease(v17);
    v18 = TLV8BufferAppend(v29, 3, objc_msgSend(v17, "bytes"), objc_msgSend(v17, "length"));
  }
  v21 = v18;
LABEL_21:

  if (!v8)
  {
    if ((_DWORD)v21)
      goto LABEL_25;
LABEL_28:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v29[0]));
    v8 = 0;
    goto LABEL_31;
  }
LABEL_22:
  if (!a3)
    goto LABEL_30;
  v22 = objc_retainAutorelease(v8);
  v8 = v22;
LABEL_27:
  v24 = 0;
  *a3 = v22;
LABEL_31:
  TLV8BufferFree(v29, v9);

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueTransitionControllerContext *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPCharacteristicValueTransitionControllerContext *v8;

  v4 = +[HAPCharacteristicValueTransitionControllerContext allocWithZone:](HAPCharacteristicValueTransitionControllerContext, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](self, "startTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](self, "transitionChecksum"));
  v8 = -[HAPCharacteristicValueTransitionControllerContext initWithIdentifier:startTime:transitionChecksum:](v4, "initWithIdentifier:startTime:transitionChecksum:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  HAPCharacteristicValueTransitionControllerContext *v7;
  uint64_t v8;
  HAPCharacteristicValueTransitionControllerContext *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = (HAPCharacteristicValueTransitionControllerContext *)a3;
  if (self == v7)
  {
    v12 = 1;
  }
  else
  {
    v8 = objc_opt_class(HAPCharacteristicValueTransitionControllerContext, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](self, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](v9, "identifier"));
      if (v10 != v11)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](self, "identifier"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](v9, "identifier"));
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_19;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](self, "startTime"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](v9, "startTime"));
      if (v13 == v14)
      {
        v27 = v13;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](self, "startTime"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](v9, "startTime"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_17;
        }
        v26 = v15;
        v27 = v13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](self, "transitionChecksum"));
      v17 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](v9, "transitionChecksum"));
      if (v16 == (void *)v17)
      {

        v12 = 1;
      }
      else
      {
        v18 = (void *)v17;
        v25 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](self, "transitionChecksum"));
        v24 = v4;
        v20 = v11;
        v21 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](v9, "transitionChecksum"));
        v12 = objc_msgSend(v19, "isEqual:", v22);

        v10 = v21;
        v11 = v20;
        v4 = v24;

        v3 = v25;
      }
      v15 = v26;
      v13 = v27;
      if (v27 == v14)
      {
LABEL_18:

        if (v10 == v11)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext startTime](self, "startTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueTransitionControllerContext transitionChecksum](self, "transitionChecksum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransitionControllerContext identifier=%@, startTime=%@, transitionChecksum=%@>"), v3, v4, v5));

  return (NSString *)v6;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HAPTLVUnsignedNumberValue)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (HAPTLVUnsignedNumberValue)transitionChecksum
{
  return self->_transitionChecksum;
}

- (void)setTransitionChecksum:(id)a3
{
  objc_storeStrong((id *)&self->_transitionChecksum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionChecksum, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
