@implementation HAPSupportedFirmwareUpdateConfiguration

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPSupportedFirmwareUpdateConfiguration *v6;
  HAPSupportedFirmwareUpdateConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPSupportedFirmwareUpdateConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPSupportedFirmwareUpdateConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPSupportedFirmwareUpdateConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPSupportedFirmwareUpdateConfiguration;
  return -[HAPSupportedFirmwareUpdateConfiguration init](&v3, "init");
}

- (HAPSupportedFirmwareUpdateConfiguration)initWithUpdateDuration:(id)a3
{
  id v5;
  HAPSupportedFirmwareUpdateConfiguration *v6;
  HAPSupportedFirmwareUpdateConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPSupportedFirmwareUpdateConfiguration;
  v6 = -[HAPSupportedFirmwareUpdateConfiguration init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_updateDuration, a3);

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t Next;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  HAPSupportedFirmwareUpdateConfiguration *v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v6 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v21 = self;
  v9 = 0;
  v10 = 0;
  v11 = &v7[v8];
  do
  {
    v26 = 0;
    v24 = 0;
    v25 = 0;
    v23 = 0;
    Next = TLV8GetNext(v7, v11, &v26, &v25, &v24, &v23);
    if ((_DWORD)Next)
    {
      if (a4)
      {
        v17 = sub_100040DDC(Next);
        v16 = (id)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_14;
      }
LABEL_18:
      v18 = 0;
      goto LABEL_19;
    }
    if (!v25)
    {
      v19 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v10 = (void *)v19;
      if (!v19)
        goto LABEL_16;
LABEL_9:
      if (a4)
      {
        v16 = objc_retainAutorelease(v10);
        v10 = v16;
LABEL_14:
        v18 = 0;
        *a4 = v16;
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    if (v26 == 1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v22 = v10;
      v14 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v13, &v22));
      v15 = v22;

      v10 = v15;
      v9 = (void *)v14;
    }
    v7 = v23;
  }
  while (v23 < v11);
  if (v10)
    goto LABEL_9;
LABEL_16:
  self = v21;
LABEL_17:
  -[HAPSupportedFirmwareUpdateConfiguration setUpdateDuration:](self, "setUpdateDuration:", v9, v21);
  v10 = 0;
  v18 = 1;
LABEL_19:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v16;
  _OWORD v17[21];

  memset(v17, 0, sizeof(v17));
  TLV8BufferInit(v17, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration"));

  if (!v5)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration"));
  v16 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v16));
  v8 = v16;

  if (!v8)
  {
    v11 = objc_retainAutorelease(v7);
    v12 = TLV8BufferAppend(v17, 1, objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));

    if ((_DWORD)v12)
    {
      if (a3)
      {
        v13 = sub_100040DDC(v12);
        v10 = (id)objc_claimAutoreleasedReturnValue(v13);
        v8 = 0;
        goto LABEL_8;
      }
      v8 = 0;
LABEL_11:
      v14 = 0;
      goto LABEL_12;
    }
LABEL_9:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v17[0]));
    v8 = 0;
    goto LABEL_12;
  }

  if (!a3)
    goto LABEL_11;
  v10 = objc_retainAutorelease(v8);
  v8 = v10;
LABEL_8:
  v14 = 0;
  *a3 = v10;
LABEL_12:
  TLV8BufferFree(v17, v9);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPSupportedFirmwareUpdateConfiguration *v4;
  void *v5;
  HAPSupportedFirmwareUpdateConfiguration *v6;

  v4 = +[HAPSupportedFirmwareUpdateConfiguration allocWithZone:](HAPSupportedFirmwareUpdateConfiguration, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration"));
  v6 = -[HAPSupportedFirmwareUpdateConfiguration initWithUpdateDuration:](v4, "initWithUpdateDuration:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPSupportedFirmwareUpdateConfiguration *v5;
  uint64_t v6;
  HAPSupportedFirmwareUpdateConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = (HAPSupportedFirmwareUpdateConfiguration *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPSupportedFirmwareUpdateConfiguration, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](v7, "updateDuration"));
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](v7, "updateDuration"));
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPSupportedFirmwareUpdateConfiguration updateDuration=%@>"), v2));

  return (NSString *)v3;
}

- (HAPTLVUnsignedNumberValue)updateDuration
{
  return self->_updateDuration;
}

- (void)setUpdateDuration:(id)a3
{
  objc_storeStrong((id *)&self->_updateDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDuration, 0);
}

@end
