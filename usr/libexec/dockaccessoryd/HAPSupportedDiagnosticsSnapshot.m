@implementation HAPSupportedDiagnosticsSnapshot

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPSupportedDiagnosticsSnapshot *v6;
  HAPSupportedDiagnosticsSnapshot *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPSupportedDiagnosticsSnapshot);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPSupportedDiagnosticsSnapshot parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (HAPSupportedDiagnosticsSnapshot)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPSupportedDiagnosticsSnapshot;
  return -[HAPSupportedDiagnosticsSnapshot init](&v3, "init");
}

- (HAPSupportedDiagnosticsSnapshot)initWithFormat:(id)a3 type:(id)a4 audioDiagnostics:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPSupportedDiagnosticsSnapshot *v15;
  HAPSupportedDiagnosticsSnapshot *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPSupportedDiagnosticsSnapshot;
  v15 = -[HAPSupportedDiagnosticsSnapshot init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_format, a3);
    objc_storeStrong((id *)&v16->_type, a4);
    objc_storeStrong((id *)&v16->_audioDiagnostics, a5);
    objc_storeStrong((id *)&v16->_options, a6);
  }

  return v16;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  uint64_t Next;
  void *v16;
  id *v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  HAPSupportedDiagnosticsSnapshot *v24;
  id *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v6 = objc_retainAutorelease(a3);
  v7 = (char *)objc_msgSend(v6, "bytes");
  v8 = (uint64_t)objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
LABEL_20:
    -[HAPSupportedDiagnosticsSnapshot setFormat:](self, "setFormat:", v13);
    -[HAPSupportedDiagnosticsSnapshot setType:](self, "setType:", v12);
    -[HAPSupportedDiagnosticsSnapshot setAudioDiagnostics:](self, "setAudioDiagnostics:", v11);
    -[HAPSupportedDiagnosticsSnapshot setOptions:](self, "setOptions:", v10);
    v9 = 0;
    v20 = 1;
  }
  else
  {
    v24 = self;
    v25 = a4;
    v26 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = &v7[v8];
    while (1)
    {
      v34 = 0;
      v32 = 0;
      v33 = 0;
      v31 = 0;
      Next = TLV8GetNext(v7, v14, &v34, &v33, &v32, &v31);
      if ((_DWORD)Next)
        break;
      if (!v33)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HMFErrorDomain, 3, 0));

        v9 = (id)v22;
        if (v22)
          goto LABEL_13;
        goto LABEL_19;
      }
      switch(v34)
      {
        case 1:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v30 = v9;
          v17 = &v30;
          v18 = v13;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDiagnosticsSnapshotFormatWrapper parsedFromData:error:](HAPDiagnosticsSnapshotFormatWrapper, "parsedFromData:error:", v16, &v30));
          goto LABEL_10;
        case 2:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v29 = v9;
          v17 = &v29;
          v18 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDiagnosticsSnapshotTypeWrapper parsedFromData:error:](HAPDiagnosticsSnapshotTypeWrapper, "parsedFromData:error:", v16, &v29));
          goto LABEL_10;
        case 3:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v28 = v9;
          v17 = &v28;
          v18 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDiagnosticsSnapshotAudioWrapper parsedFromData:error:](HAPDiagnosticsSnapshotAudioWrapper, "parsedFromData:error:", v16, &v28));
          goto LABEL_10;
        case 4:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:"));
          v27 = v9;
          v17 = &v27;
          v18 = v10;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDiagnosticsSnapshotOptionsWrapper parsedFromData:error:](HAPDiagnosticsSnapshotOptionsWrapper, "parsedFromData:error:", v16, &v27));
LABEL_10:
          v19 = *v17;

          v9 = v19;
          break;
        default:
          break;
      }
      v7 = v31;
      if (v31 >= v14)
      {
        if (v9)
        {
LABEL_13:
          v6 = v26;
          if (v25)
          {
            v9 = objc_retainAutorelease(v9);
            v20 = 0;
            *v25 = v9;
          }
          else
          {
            v20 = 0;
          }
          goto LABEL_24;
        }
LABEL_19:
        v6 = v26;
        self = v24;
        goto LABEL_20;
      }
    }
    if (v25)
    {
      v21 = sub_100040DDC(Next);
      v20 = 0;
      *v25 = (id)objc_claimAutoreleasedReturnValue(v21);
    }
    else
    {
      v20 = 0;
    }
    v6 = v26;
  }
LABEL_24:

  return v20;
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  _OWORD v26[21];

  memset(v26, 0, sizeof(v26));
  TLV8BufferInit(v26, 0xFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](self, "format"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](self, "format"));
    v25 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serializeWithError:", &v25));
    v8 = v25;

    if (v8)
      goto LABEL_15;
    v7 = objc_retainAutorelease(v7);
    v9 = TLV8BufferAppend(v26, 1, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    if ((_DWORD)v9)
      goto LABEL_17;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](self, "type"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](self, "type"));
    v24 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializeWithError:", &v24));
    v8 = v24;

    if (v8)
      goto LABEL_15;
    v7 = objc_retainAutorelease(v7);
    v9 = TLV8BufferAppend(v26, 2, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    if ((_DWORD)v9)
      goto LABEL_17;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](self, "audioDiagnostics"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](self, "audioDiagnostics"));
    v23 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serializeWithError:", &v23));
    v8 = v23;

    if (!v8)
    {
      v7 = objc_retainAutorelease(v7);
      v9 = TLV8BufferAppend(v26, 3, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
      if ((_DWORD)v9)
        goto LABEL_17;

      goto LABEL_13;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_18;
  }
LABEL_13:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](self, "options"));

  if (!v14)
    goto LABEL_25;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](self, "options"));
  v22 = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serializeWithError:", &v22));
  v8 = v22;

  if (v8)
    goto LABEL_15;
  v7 = objc_retainAutorelease(v7);
  v9 = TLV8BufferAppend(v26, 4, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
LABEL_17:
  v16 = v9;
LABEL_18:

  if (!v8)
  {
    if ((_DWORD)v16)
    {
      if (a3)
      {
        v19 = sub_100040DDC(v16);
        v18 = (id)objc_claimAutoreleasedReturnValue(v19);
        v8 = 0;
        goto LABEL_24;
      }
      v8 = 0;
LABEL_27:
      v20 = 0;
      goto LABEL_28;
    }
LABEL_25:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26[0]));
    v8 = 0;
    goto LABEL_28;
  }
  if (!a3)
    goto LABEL_27;
  v18 = objc_retainAutorelease(v8);
  v8 = v18;
LABEL_24:
  v20 = 0;
  *a3 = v18;
LABEL_28:
  TLV8BufferFree(v26, v17);

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPSupportedDiagnosticsSnapshot *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPSupportedDiagnosticsSnapshot *v9;

  v4 = +[HAPSupportedDiagnosticsSnapshot allocWithZone:](HAPSupportedDiagnosticsSnapshot, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](self, "format"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](self, "audioDiagnostics"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](self, "options"));
  v9 = -[HAPSupportedDiagnosticsSnapshot initWithFormat:type:audioDiagnostics:options:](v4, "initWithFormat:type:audioDiagnostics:options:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  uint64_t v5;
  HAPSupportedDiagnosticsSnapshot *v6;
  uint64_t v7;
  HAPSupportedDiagnosticsSnapshot *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = (HAPSupportedDiagnosticsSnapshot *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    v7 = objc_opt_class(HAPSupportedDiagnosticsSnapshot, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](self, "format"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](v8, "format"));
      if (v9 != v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](self, "format"));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](v8, "format"));
        v34 = v11;
        if (!objc_msgSend(v11, "isEqual:", v3))
        {
          v12 = 0;
          goto LABEL_25;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](self, "type"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](v8, "type"));
      if (v13 != v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](self, "type"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](v8, "type"));
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v12 = 0;
LABEL_23:

LABEL_24:
          if (v9 == v10)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v31 = v15;
      }
      v16 = objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](self, "audioDiagnostics"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](v8, "audioDiagnostics"));
      v32 = (void *)v16;
      if ((void *)v16 == v17)
      {
        v27 = v14;
        v28 = v13;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](self, "audioDiagnostics"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](v8, "audioDiagnostics"));
        v30 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v12 = 0;
          v24 = v32;
          goto LABEL_21;
        }
        v27 = v14;
        v28 = v13;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](self, "options"));
      v20 = objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](v8, "options"));
      if (v19 == (void *)v20)
      {

        v12 = 1;
      }
      else
      {
        v21 = (void *)v20;
        v26 = v3;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](self, "options"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](v8, "options"));
        v12 = objc_msgSend(v22, "isEqual:", v23);

        v3 = v26;
      }
      v24 = v32;
      v14 = v27;
      v13 = v28;
      if (v32 == v17)
      {
LABEL_22:

        v15 = v31;
        if (v13 == v14)
          goto LABEL_24;
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    v12 = 0;
  }
LABEL_27:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot format](self, "format"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot audioDiagnostics](self, "audioDiagnostics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPSupportedDiagnosticsSnapshot options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<HAPSupportedDiagnosticsSnapshot format=%@, type=%@, audioDiagnostics=%@, options=%@>"), v3, v4, v5, v6));

  return (NSString *)v7;
}

- (HAPDiagnosticsSnapshotFormatWrapper)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (HAPDiagnosticsSnapshotTypeWrapper)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (HAPDiagnosticsSnapshotAudioWrapper)audioDiagnostics
{
  return self->_audioDiagnostics;
}

- (void)setAudioDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_audioDiagnostics, a3);
}

- (HAPDiagnosticsSnapshotOptionsWrapper)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_audioDiagnostics, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
