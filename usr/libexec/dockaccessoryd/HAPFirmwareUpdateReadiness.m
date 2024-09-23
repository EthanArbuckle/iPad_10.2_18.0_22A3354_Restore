@implementation HAPFirmwareUpdateReadiness

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPFirmwareUpdateReadiness *v6;
  HAPFirmwareUpdateReadiness *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPFirmwareUpdateReadiness);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPFirmwareUpdateReadiness parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPFirmwareUpdateReadiness)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPFirmwareUpdateReadiness;
  return -[HAPFirmwareUpdateReadiness init](&v3, "init");
}

- (HAPFirmwareUpdateReadiness)initWithStagingNotReadyReasons:(id)a3 updateNotReadyReasons:(id)a4
{
  id v7;
  id v8;
  HAPFirmwareUpdateReadiness *v9;
  HAPFirmwareUpdateReadiness *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPFirmwareUpdateReadiness;
  v9 = -[HAPFirmwareUpdateReadiness init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stagingNotReadyReasons, a3);
    objc_storeStrong((id *)&v10->_updateNotReadyReasons, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  uint64_t Next;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  BOOL v18;
  id *v19;
  id v20;
  id v21;
  uint64_t v22;
  id *v24;
  void *v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  v6 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    v10 = 0;
LABEL_14:
    -[HAPFirmwareUpdateReadiness setStagingNotReadyReasons:](self, "setStagingNotReadyReasons:", v10);
    -[HAPFirmwareUpdateReadiness setUpdateNotReadyReasons:](self, "setUpdateNotReadyReasons:", v9);
    v11 = 0;
    v18 = 1;
    goto LABEL_22;
  }
  v24 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = &v7[v8];
  while (1)
  {
    v30 = 0;
    v28 = 0;
    v29 = 0;
    v27 = 0;
    Next = TLV8GetNext(v7, v12, &v30, &v29, &v28, &v27);
    if ((_DWORD)Next)
      break;
    if (!v29)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v11 = (void *)v22;
      if (!v22)
        goto LABEL_14;
LABEL_18:
      v19 = v24;
      if (v24)
      {
        v21 = objc_retainAutorelease(v11);
        v11 = v21;
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    if (v30 == 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v25 = v11;
      v15 = &v25;
      v16 = v9;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[HAPUpdateNotReadyReasonsWrapper parsedFromData:error:](HAPUpdateNotReadyReasonsWrapper, "parsedFromData:error:", v14, &v25));
      goto LABEL_9;
    }
    if (v30 == 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
      v26 = v11;
      v15 = &v26;
      v16 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[HAPStagingNotReadyReasonsWrapper parsedFromData:error:](HAPStagingNotReadyReasonsWrapper, "parsedFromData:error:", v14, &v26));
LABEL_9:
      v17 = *v15;

      v11 = v17;
    }
    v7 = v27;
    if (v27 >= v12)
    {
      if (!v11)
        goto LABEL_14;
      goto LABEL_18;
    }
  }
  v19 = v24;
  if (v24)
  {
    v20 = sub_100040DDC(Next);
    v21 = (id)objc_claimAutoreleasedReturnValue(v20);
LABEL_20:
    v18 = 0;
    *v19 = v21;
    goto LABEL_22;
  }
LABEL_21:
  v18 = 0;
LABEL_22:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  _OWORD v20[21];

  memset(v20, 0, sizeof(v20));
  TLV8BufferInit(v20, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](self, "stagingNotReadyReasons"));

  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](self, "stagingNotReadyReasons"));
  v19 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v19));
  v8 = v19;

  if (v8)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }
  v7 = objc_retainAutorelease(v7);
  v9 = TLV8BufferAppend(v20, 1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (!(_DWORD)v9)
  {

LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](self, "updateNotReadyReasons"));

    if (!v10)
      goto LABEL_17;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](self, "updateNotReadyReasons"));
    v18 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithError:", &v18));
    v8 = v18;

    if (v8)
      goto LABEL_7;
    v7 = objc_retainAutorelease(v7);
    v9 = TLV8BufferAppend(v20, 2, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }
  v12 = v9;
LABEL_10:

  if (!v8)
  {
    if ((_DWORD)v12)
    {
      if (a3)
      {
        v15 = sub_100040DDC(v12);
        v14 = (id)objc_claimAutoreleasedReturnValue(v15);
        v8 = 0;
        goto LABEL_16;
      }
      v8 = 0;
LABEL_19:
      v16 = 0;
      goto LABEL_20;
    }
LABEL_17:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v20[0]));
    v8 = 0;
    goto LABEL_20;
  }
  if (!a3)
    goto LABEL_19;
  v14 = objc_retainAutorelease(v8);
  v8 = v14;
LABEL_16:
  v16 = 0;
  *a3 = v14;
LABEL_20:
  TLV8BufferFree(v20, v13);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPFirmwareUpdateReadiness *v4;
  void *v5;
  void *v6;
  HAPFirmwareUpdateReadiness *v7;

  v4 = +[HAPFirmwareUpdateReadiness allocWithZone:](HAPFirmwareUpdateReadiness, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](self, "stagingNotReadyReasons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](self, "updateNotReadyReasons"));
  v7 = -[HAPFirmwareUpdateReadiness initWithStagingNotReadyReasons:updateNotReadyReasons:](v4, "initWithStagingNotReadyReasons:updateNotReadyReasons:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v5;
  HAPFirmwareUpdateReadiness *v6;
  uint64_t v7;
  HAPFirmwareUpdateReadiness *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (HAPFirmwareUpdateReadiness *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    v7 = objc_opt_class(HAPFirmwareUpdateReadiness, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](self, "stagingNotReadyReasons"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](v8, "stagingNotReadyReasons"));
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](self, "stagingNotReadyReasons"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](v8, "stagingNotReadyReasons"));
        if (!objc_msgSend(v11, "isEqual:", v3))
        {
          v12 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v18 = v11;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](self, "updateNotReadyReasons"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](v8, "updateNotReadyReasons"));
      if (v13 == v14)
      {
        v12 = 1;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](self, "updateNotReadyReasons"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](v8, "updateNotReadyReasons"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness stagingNotReadyReasons](self, "stagingNotReadyReasons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateReadiness updateNotReadyReasons](self, "updateNotReadyReasons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPFirmwareUpdateReadiness stagingNotReadyReasons=%@, updateNotReadyReasons=%@>"), v3, v4));

  return (NSString *)v5;
}

- (HAPStagingNotReadyReasonsWrapper)stagingNotReadyReasons
{
  return self->_stagingNotReadyReasons;
}

- (void)setStagingNotReadyReasons:(id)a3
{
  objc_storeStrong((id *)&self->_stagingNotReadyReasons, a3);
}

- (HAPUpdateNotReadyReasonsWrapper)updateNotReadyReasons
{
  return self->_updateNotReadyReasons;
}

- (void)setUpdateNotReadyReasons:(id)a3
{
  objc_storeStrong((id *)&self->_updateNotReadyReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateNotReadyReasons, 0);
  objc_storeStrong((id *)&self->_stagingNotReadyReasons, 0);
}

@end
