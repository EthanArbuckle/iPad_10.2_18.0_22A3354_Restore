@implementation HAPDataStreamTransportSetupResponse

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDataStreamTransportSetupResponse *v6;
  HAPDataStreamTransportSetupResponse *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportSetupResponse);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDataStreamTransportSetupResponse parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPDataStreamTransportSetupResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportSetupResponse;
  return -[HAPDataStreamTransportSetupResponse init](&v3, "init");
}

- (HAPDataStreamTransportSetupResponse)initWithStatus:(id)a3 parameters:(id)a4 accessoryKeySalt:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPDataStreamTransportSetupResponse *v12;
  HAPDataStreamTransportSetupResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDataStreamTransportSetupResponse;
  v12 = -[HAPDataStreamTransportSetupResponse init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_status, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_accessoryKeySalt, a5);
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
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  BOOL v23;
  id *v24;
  id v25;
  id v26;
  uint64_t v27;
  id *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_19:
    -[HAPDataStreamTransportSetupResponse setStatus:](self, "setStatus:", v12, v29);
    -[HAPDataStreamTransportSetupResponse setParameters:](self, "setParameters:", v11);
    -[HAPDataStreamTransportSetupResponse setAccessoryKeySalt:](self, "setAccessoryKeySalt:", v10);
    v9 = 0;
    v23 = 1;
    goto LABEL_27;
  }
  v29 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)v7 + v8;
  while (1)
  {
    v38 = 0;
    v36 = 0;
    v37 = 0;
    v35 = 0;
    Next = TLV8GetNext(v7, v13, &v38, &v37, &v36, &v35);
    if ((_DWORD)Next)
      break;
    if (!v37)
    {
      v27 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

      v9 = (void *)v27;
      if (!v27)
        goto LABEL_19;
LABEL_23:
      v24 = v29;
      if (v29)
      {
        v26 = objc_retainAutorelease(v9);
        v9 = v26;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    switch(v38)
    {
      case 3:
        v31 = v9;
        v19 = sub_100022878(3, (unint64_t)v7, v13, (unint64_t *)&v35, &v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v17 = v31;

        if (!v17)
        {
          v30 = 0;
          v20 = objc_claimAutoreleasedReturnValue(+[NSData parsedFromData:error:](NSData, "parsedFromData:error:", v15, &v30));
          v17 = v30;
          v18 = v10;
          v10 = (void *)v20;
          goto LABEL_13;
        }
LABEL_14:

        v9 = v17;
        break;
      case 2:
        v33 = v9;
        v21 = sub_100022878(2, (unint64_t)v7, v13, (unint64_t *)&v35, &v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v17 = v33;

        if (!v17)
        {
          v32 = 0;
          v22 = objc_claimAutoreleasedReturnValue(+[HAPDataStreamTransportParameters parsedFromData:error:](HAPDataStreamTransportParameters, "parsedFromData:error:", v15, &v32));
          v17 = v32;
          v18 = v11;
          v11 = (void *)v22;
LABEL_13:

        }
        goto LABEL_14;
      case 1:
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
        v34 = v9;
        v16 = objc_claimAutoreleasedReturnValue(+[HAPDataStreamTransportCommandStatusWrapper parsedFromData:error:](HAPDataStreamTransportCommandStatusWrapper, "parsedFromData:error:", v15, &v34));
        v17 = v34;

        v18 = v12;
        v12 = (void *)v16;
        goto LABEL_13;
    }
    v7 = v35;
    if ((unint64_t)v35 >= v13)
    {
      if (!v9)
        goto LABEL_19;
      goto LABEL_23;
    }
  }
  v24 = v29;
  if (v29)
  {
    v25 = sub_100040DDC(Next);
    v26 = (id)objc_claimAutoreleasedReturnValue(v25);
LABEL_25:
    v23 = 0;
    *v24 = v26;
    goto LABEL_27;
  }
LABEL_26:
  v23 = 0;
LABEL_27:

  return v23;
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
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  _OWORD v34[21];

  memset(v34, 0, sizeof(v34));
  TLV8BufferInit(v34, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](self, "status"));

  if (!v5)
    goto LABEL_6;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](self, "status"));
  v33 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v33));
  v8 = v33;

  if (v8)
  {
LABEL_3:
    v9 = 0;
    goto LABEL_31;
  }
  v7 = objc_retainAutorelease(v7);
  v10 = TLV8BufferAppend(v34, 1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (!(_DWORD)v10)
  {

LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](self, "parameters"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](self, "parameters"));
      v32 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serializeWithError:", &v32));
      v8 = v32;

      if (v8)
      {

        goto LABEL_32;
      }
      v15 = objc_retainAutorelease(v13);
      v16 = (char *)objc_msgSend(v15, "bytes");
      v17 = (char *)objc_msgSend(v15, "length") + (_QWORD)v16;
      while (1)
      {
        v18 = v17 - v16 >= 255 ? 255 : v17 - v16;
        v19 = TLV8BufferAppend(v34, 2, v16, v18);
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
LABEL_36:
        v28 = sub_100040DDC(v9);
        v27 = (id)objc_claimAutoreleasedReturnValue(v28);
        v8 = 0;
        goto LABEL_37;
      }
LABEL_40:
      v8 = 0;
      goto LABEL_41;
    }
LABEL_16:
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](self, "accessoryKeySalt"));

    if (!v20)
    {
LABEL_38:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v34[0]));
      v8 = 0;
      goto LABEL_42;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](self, "accessoryKeySalt"));
    v31 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "serializeWithError:", &v31));
    v8 = v31;

    if (v8)
      goto LABEL_3;
    v7 = objc_retainAutorelease(v7);
    v22 = (char *)objc_msgSend(v7, "bytes");
    v23 = (char *)objc_msgSend(v7, "length") + (_QWORD)v22;
    do
    {
      if (v23 - v22 >= 255)
        v24 = 255;
      else
        v24 = v23 - v22;
      v10 = TLV8BufferAppend(v34, 3, v22, v24);
      if ((_DWORD)v10)
        v25 = 0;
      else
        v25 = v24;
      v22 += v25;
      if ((_DWORD)v10)
        v26 = 1;
      else
        v26 = v22 >= v23;
    }
    while (!v26);
  }
  v9 = v10;
LABEL_31:

  if (!v8)
  {
    if ((_DWORD)v9)
    {
      if (a3)
        goto LABEL_36;
      goto LABEL_40;
    }
    goto LABEL_38;
  }
LABEL_32:
  if (!a3)
  {
LABEL_41:
    v29 = 0;
    goto LABEL_42;
  }
  v27 = objc_retainAutorelease(v8);
  v8 = v27;
LABEL_37:
  v29 = 0;
  *a3 = v27;
LABEL_42:
  TLV8BufferFree(v34, v14);

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPDataStreamTransportSetupResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPDataStreamTransportSetupResponse *v8;

  v4 = +[HAPDataStreamTransportSetupResponse allocWithZone:](HAPDataStreamTransportSetupResponse, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](self, "parameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](self, "accessoryKeySalt"));
  v8 = -[HAPDataStreamTransportSetupResponse initWithStatus:parameters:accessoryKeySalt:](v4, "initWithStatus:parameters:accessoryKeySalt:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  HAPDataStreamTransportSetupResponse *v7;
  uint64_t v8;
  HAPDataStreamTransportSetupResponse *v9;
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

  v7 = (HAPDataStreamTransportSetupResponse *)a3;
  if (self == v7)
  {
    v12 = 1;
  }
  else
  {
    v8 = objc_opt_class(HAPDataStreamTransportSetupResponse, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](self, "status"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](v9, "status"));
      if (v10 != v11)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](self, "status"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](v9, "status"));
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_19;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](self, "parameters"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](v9, "parameters"));
      if (v13 == v14)
      {
        v27 = v13;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](self, "parameters"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](v9, "parameters"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_17;
        }
        v26 = v15;
        v27 = v13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](self, "accessoryKeySalt"));
      v17 = objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](v9, "accessoryKeySalt"));
      if (v16 == (void *)v17)
      {

        v12 = 1;
      }
      else
      {
        v18 = (void *)v17;
        v25 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](self, "accessoryKeySalt"));
        v24 = v4;
        v20 = v11;
        v21 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](v9, "accessoryKeySalt"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse parameters](self, "parameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetupResponse accessoryKeySalt](self, "accessoryKeySalt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPDataStreamTransportSetupResponse status=%@, parameters=%@, accessoryKeySalt=%@>"), v3, v4, v5));

  return (NSString *)v6;
}

- (HAPDataStreamTransportCommandStatusWrapper)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (HAPDataStreamTransportParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSData)accessoryKeySalt
{
  return self->_accessoryKeySalt;
}

- (void)setAccessoryKeySalt:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryKeySalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryKeySalt, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
