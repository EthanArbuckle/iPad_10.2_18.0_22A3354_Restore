@implementation HAPCharacteristicValueActiveTransitionContext

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueActiveTransitionContext *v6;
  HAPCharacteristicValueActiveTransitionContext *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueActiveTransitionContext);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueActiveTransitionContext parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPCharacteristicValueActiveTransitionContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueActiveTransitionContext;
  return -[HAPCharacteristicValueActiveTransitionContext init](&v3, "init");
}

- (HAPCharacteristicValueActiveTransitionContext)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 timeElapsedSinceStart:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPCharacteristicValueActiveTransitionContext *v12;
  HAPCharacteristicValueActiveTransitionContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueActiveTransitionContext;
  v12 = -[HAPCharacteristicValueActiveTransitionContext init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_HAPInstanceID, a3);
    objc_storeStrong((id *)&v13->_controllerContext, a4);
    objc_storeStrong((id *)&v13->_timeElapsedSinceStart, a5);
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
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id *v22;
  id v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  HAPCharacteristicValueActiveTransitionContext *v28;
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
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v30 = v9;
      v19 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v30));
      v17 = v30;

      v18 = v10;
      v10 = (void *)v19;
LABEL_12:

      goto LABEL_13;
    }
    if (v37 != 2)
    {
      if (v37 != 1)
        goto LABEL_14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v33 = v9;
      v16 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v33));
      v17 = v33;

      v18 = v12;
      v12 = (void *)v16;
      goto LABEL_12;
    }
    v32 = v9;
    v20 = sub_100022878(2, (unint64_t)v7, v13, (unint64_t *)&v34, &v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v17 = v32;

    if (!v17)
    {
      v31 = 0;
      v21 = objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v15, &v31));
      v17 = v31;
      v18 = v11;
      v11 = (void *)v21;
      goto LABEL_12;
    }
LABEL_13:

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
  -[HAPCharacteristicValueActiveTransitionContext setHAPInstanceID:](self, "setHAPInstanceID:", v12, v28);
  -[HAPCharacteristicValueActiveTransitionContext setControllerContext:](self, "setControllerContext:", v11);
  -[HAPCharacteristicValueActiveTransitionContext setTimeElapsedSinceStart:](self, "setTimeElapsedSinceStart:", v10);
  v9 = 0;
  v25 = 1;
LABEL_26:

  return v25;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  _OWORD v29[21];

  memset(v29, 0, sizeof(v29));
  TLV8BufferInit(v29, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](self, "HAPInstanceID"));

  if (!v5)
    goto LABEL_6;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](self, "HAPInstanceID"));
  v28 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v28));
  v8 = v28;

  if (v8)
  {
LABEL_3:
    v9 = 0;
    goto LABEL_20;
  }
  v7 = objc_retainAutorelease(v7);
  v10 = TLV8BufferAppend(v29, 1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (!(_DWORD)v10)
  {

LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](self, "controllerContext"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](self, "controllerContext"));
      v27 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serializeWithError:", &v27));
      v8 = v27;

      if (v8)
      {

        goto LABEL_21;
      }
      v15 = objc_retainAutorelease(v13);
      v16 = (char *)objc_msgSend(v15, "bytes");
      v17 = (char *)objc_msgSend(v15, "length") + (_QWORD)v16;
      while (1)
      {
        v18 = v17 - v16 >= 255 ? 255 : v17 - v16;
        v19 = TLV8BufferAppend(v29, 2, v16, v18);
        if ((_DWORD)v19)
          break;
        v16 += v18;
        if (v16 >= v17)
        {

          goto LABEL_16;
        }
      }
      v9 = v19;

      if (a3)
      {
LABEL_25:
        v23 = sub_100040DDC(v9);
        v22 = (id)objc_claimAutoreleasedReturnValue(v23);
        v8 = 0;
        goto LABEL_26;
      }
LABEL_29:
      v8 = 0;
      goto LABEL_30;
    }
LABEL_16:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](self, "timeElapsedSinceStart"));

    if (!v20)
    {
LABEL_27:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v29[0]));
      v8 = 0;
      goto LABEL_31;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](self, "timeElapsedSinceStart"));
    v26 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serializeWithError:", &v26));
    v8 = v26;

    if (v8)
      goto LABEL_3;
    v7 = objc_retainAutorelease(v7);
    v10 = TLV8BufferAppend(v29, 3, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }
  v9 = v10;
LABEL_20:

  if (!v8)
  {
    if ((_DWORD)v9)
    {
      if (a3)
        goto LABEL_25;
      goto LABEL_29;
    }
    goto LABEL_27;
  }
LABEL_21:
  if (!a3)
  {
LABEL_30:
    v24 = 0;
    goto LABEL_31;
  }
  v22 = objc_retainAutorelease(v8);
  v8 = v22;
LABEL_26:
  v24 = 0;
  *a3 = v22;
LABEL_31:
  TLV8BufferFree(v29, v14);

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueActiveTransitionContext *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPCharacteristicValueActiveTransitionContext *v8;

  v4 = +[HAPCharacteristicValueActiveTransitionContext allocWithZone:](HAPCharacteristicValueActiveTransitionContext, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](self, "HAPInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](self, "controllerContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](self, "timeElapsedSinceStart"));
  v8 = -[HAPCharacteristicValueActiveTransitionContext initWithHAPInstanceID:controllerContext:timeElapsedSinceStart:](v4, "initWithHAPInstanceID:controllerContext:timeElapsedSinceStart:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  HAPCharacteristicValueActiveTransitionContext *v7;
  uint64_t v8;
  HAPCharacteristicValueActiveTransitionContext *v9;
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

  v7 = (HAPCharacteristicValueActiveTransitionContext *)a3;
  if (self == v7)
  {
    v12 = 1;
  }
  else
  {
    v8 = objc_opt_class(HAPCharacteristicValueActiveTransitionContext, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](self, "HAPInstanceID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](v9, "HAPInstanceID"));
      if (v10 != v11)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](self, "HAPInstanceID"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](v9, "HAPInstanceID"));
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_19;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](self, "controllerContext"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](v9, "controllerContext"));
      if (v13 == v14)
      {
        v27 = v13;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](self, "controllerContext"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](v9, "controllerContext"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_17;
        }
        v26 = v15;
        v27 = v13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](self, "timeElapsedSinceStart"));
      v17 = objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](v9, "timeElapsedSinceStart"));
      if (v16 == (void *)v17)
      {

        v12 = 1;
      }
      else
      {
        v18 = (void *)v17;
        v25 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](self, "timeElapsedSinceStart"));
        v24 = v4;
        v20 = v11;
        v21 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](v9, "timeElapsedSinceStart"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext HAPInstanceID](self, "HAPInstanceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext controllerContext](self, "controllerContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPCharacteristicValueActiveTransitionContext timeElapsedSinceStart](self, "timeElapsedSinceStart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPCharacteristicValueActiveTransitionContext HAPInstanceID=%@, controllerContext=%@, timeElapsedSinceStart=%@>"), v3, v4, v5));

  return (NSString *)v6;
}

- (HAPTLVUnsignedNumberValue)HAPInstanceID
{
  return self->_HAPInstanceID;
}

- (void)setHAPInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_HAPInstanceID, a3);
}

- (NSData)controllerContext
{
  return self->_controllerContext;
}

- (void)setControllerContext:(id)a3
{
  objc_storeStrong((id *)&self->_controllerContext, a3);
}

- (HAPTLVUnsignedNumberValue)timeElapsedSinceStart
{
  return self->_timeElapsedSinceStart;
}

- (void)setTimeElapsedSinceStart:(id)a3
{
  objc_storeStrong((id *)&self->_timeElapsedSinceStart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeElapsedSinceStart, 0);
  objc_storeStrong((id *)&self->_controllerContext, 0);
  objc_storeStrong((id *)&self->_HAPInstanceID, 0);
}

@end
