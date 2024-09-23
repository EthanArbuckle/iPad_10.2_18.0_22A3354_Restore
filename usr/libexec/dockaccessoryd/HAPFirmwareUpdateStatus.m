@implementation HAPFirmwareUpdateStatus

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPFirmwareUpdateStatus *v6;
  HAPFirmwareUpdateStatus *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPFirmwareUpdateStatus);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPFirmwareUpdateStatus parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPFirmwareUpdateStatus)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPFirmwareUpdateStatus;
  return -[HAPFirmwareUpdateStatus init](&v3, "init");
}

- (HAPFirmwareUpdateStatus)initWithState:(id)a3 updateDuration:(id)a4 stagedFirmwareVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPFirmwareUpdateStatus *v12;
  HAPFirmwareUpdateStatus *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPFirmwareUpdateStatus;
  v12 = -[HAPFirmwareUpdateStatus init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_state, a3);
    objc_storeStrong((id *)&v13->_updateDuration, a4);
    objc_storeStrong((id *)&v13->_stagedFirmwareVersion, a5);
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
  uint64_t v21;
  id *v22;
  id v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  HAPFirmwareUpdateStatus *v28;
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
    if (v37 != 3)
    {
      if (v37 == 2)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
        v32 = v9;
        v21 = objc_claimAutoreleasedReturnValue(+[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v32));
        v17 = v32;

        v18 = v11;
        v11 = (void *)v21;
      }
      else
      {
        if (v37 != 1)
          goto LABEL_14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
        v33 = v9;
        v16 = objc_claimAutoreleasedReturnValue(+[HAPFirmwareUpdateStateWrapper parsedFromData:error:](HAPFirmwareUpdateStateWrapper, "parsedFromData:error:", v15, &v33));
        v17 = v33;

        v18 = v12;
        v12 = (void *)v16;
      }
      goto LABEL_12;
    }
    v31 = v9;
    v19 = sub_100022878(3, (unint64_t)v7, v13, (unint64_t *)&v34, &v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v17 = v31;

    if (!v17)
    {
      v30 = 0;
      v20 = objc_claimAutoreleasedReturnValue(+[NSString parsedFromData:error:](NSString, "parsedFromData:error:", v15, &v30));
      v17 = v30;
      v18 = v10;
      v10 = (void *)v20;
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
  -[HAPFirmwareUpdateStatus setState:](self, "setState:", v12, v28);
  -[HAPFirmwareUpdateStatus setUpdateDuration:](self, "setUpdateDuration:", v11);
  -[HAPFirmwareUpdateStatus setStagedFirmwareVersion:](self, "setStagedFirmwareVersion:", v10);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  id v27;
  _OWORD v28[21];

  memset(v28, 0, sizeof(v28));
  TLV8BufferInit(v28, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](self, "state"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](self, "state"));
    v27 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v27));
    v8 = v27;

    if (v8)
      goto LABEL_11;
    v7 = objc_retainAutorelease(v7);
    v9 = TLV8BufferAppend(v28, 1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    if ((_DWORD)v9)
      goto LABEL_24;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](self, "updateDuration"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](self, "updateDuration"));
    v26 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithError:", &v26));
    v8 = v26;

    if (!v8)
    {
      v7 = objc_retainAutorelease(v7);
      v9 = TLV8BufferAppend(v28, 2, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      if ((_DWORD)v9)
        goto LABEL_24;

      goto LABEL_9;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_25;
  }
LABEL_9:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](self, "stagedFirmwareVersion"));

  if (!v12)
    goto LABEL_32;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](self, "stagedFirmwareVersion"));
  v25 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serializeWithError:", &v25));
  v8 = v25;

  if (v8)
    goto LABEL_11;
  v7 = objc_retainAutorelease(v7);
  v15 = (char *)objc_msgSend(v7, "bytes");
  v16 = (char *)objc_msgSend(v7, "length") + (_QWORD)v15;
  do
  {
    if (v16 - v15 >= 255)
      v17 = 255;
    else
      v17 = v16 - v15;
    v9 = TLV8BufferAppend(v28, 3, v15, v17);
    if ((_DWORD)v9)
      v18 = 0;
    else
      v18 = v17;
    v15 += v18;
    if ((_DWORD)v9)
      v19 = 1;
    else
      v19 = v15 >= v16;
  }
  while (!v19);
LABEL_24:
  v14 = v9;
LABEL_25:

  if (!v8)
  {
    if ((_DWORD)v14)
    {
      if (a3)
      {
        v22 = sub_100040DDC(v14);
        v21 = (id)objc_claimAutoreleasedReturnValue(v22);
        v8 = 0;
        goto LABEL_31;
      }
      v8 = 0;
LABEL_34:
      v23 = 0;
      goto LABEL_35;
    }
LABEL_32:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v28[0]));
    v8 = 0;
    goto LABEL_35;
  }
  if (!a3)
    goto LABEL_34;
  v21 = objc_retainAutorelease(v8);
  v8 = v21;
LABEL_31:
  v23 = 0;
  *a3 = v21;
LABEL_35:
  TLV8BufferFree(v28, v20);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPFirmwareUpdateStatus *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPFirmwareUpdateStatus *v8;

  v4 = +[HAPFirmwareUpdateStatus allocWithZone:](HAPFirmwareUpdateStatus, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](self, "updateDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](self, "stagedFirmwareVersion"));
  v8 = -[HAPFirmwareUpdateStatus initWithState:updateDuration:stagedFirmwareVersion:](v4, "initWithState:updateDuration:stagedFirmwareVersion:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  HAPFirmwareUpdateStatus *v7;
  uint64_t v8;
  HAPFirmwareUpdateStatus *v9;
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

  v7 = (HAPFirmwareUpdateStatus *)a3;
  if (self == v7)
  {
    v12 = 1;
  }
  else
  {
    v8 = objc_opt_class(HAPFirmwareUpdateStatus, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](self, "state"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](v9, "state"));
      if (v10 != v11)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](self, "state"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](v9, "state"));
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v12 = 0;
          goto LABEL_19;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](self, "updateDuration"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](v9, "updateDuration"));
      if (v13 == v14)
      {
        v27 = v13;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](self, "updateDuration"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](v9, "updateDuration"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
          goto LABEL_17;
        }
        v26 = v15;
        v27 = v13;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](self, "stagedFirmwareVersion"));
      v17 = objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](v9, "stagedFirmwareVersion"));
      if (v16 == (void *)v17)
      {

        v12 = 1;
      }
      else
      {
        v18 = (void *)v17;
        v25 = v3;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](self, "stagedFirmwareVersion"));
        v24 = v4;
        v20 = v11;
        v21 = v10;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](v9, "stagedFirmwareVersion"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus updateDuration](self, "updateDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFirmwareUpdateStatus stagedFirmwareVersion](self, "stagedFirmwareVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPFirmwareUpdateStatus state=%@, updateDuration=%@, stagedFirmwareVersion=%@>"), v3, v4, v5));

  return (NSString *)v6;
}

- (HAPFirmwareUpdateStateWrapper)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (HAPTLVUnsignedNumberValue)updateDuration
{
  return self->_updateDuration;
}

- (void)setUpdateDuration:(id)a3
{
  objc_storeStrong((id *)&self->_updateDuration, a3);
}

- (NSString)stagedFirmwareVersion
{
  return self->_stagedFirmwareVersion;
}

- (void)setStagedFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_updateDuration, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
