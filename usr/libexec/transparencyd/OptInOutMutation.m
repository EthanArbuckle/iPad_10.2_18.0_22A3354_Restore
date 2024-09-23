@implementation OptInOutMutation

- (OptInOutMutation)init
{
  OptInOutMutation *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OptInOutMutation;
  v2 = -[OptInOutMutation init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[OptInOutMutation setExtensions:](v2, "setExtensions:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[OptInOutMutation setDevicesArray:](v2, "setDevicesArray:", v4);

  }
  return v2;
}

- (id)data
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation accountKeyHash](self, "accountKeyHash"));
  v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && -[TLSMessageClass encodeBool:buffer:](self, "encodeBool:buffer:", -[OptInOutMutation optIn](self, "optIn"), v3)
    && -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[OptInOutMutation timestampMs](self, "timestampMs"), v3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation devicesArray](self, "devicesArray", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11), "data"));
          if (!v12)
          {

            goto LABEL_18;
          }
          v13 = (void *)v12;
          objc_msgSend(v6, "appendData:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
    }

    v14 = 0;
    if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v6, 0, 0xFFFFLL, v3))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation extensions](self, "extensions"));
      v16 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v15, v3);

      if (v16)
        v14 = v3;
      else
LABEL_18:
        v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _BYTE *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  id v34;
  id *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  unsigned __int8 v44;
  id v45;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = (char *)objc_msgSend(v8, "length") + (_QWORD)v9;
  v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  v45 = 0;
  v13 = objc_msgSend(v12, "parseHashValue:end:result:", v7, v10, &v45);
  v14 = v45;
  if (v13)
  {
    objc_msgSend(v12, "setAccountKeyHash:", v14);
    v44 = 0;
    v15 = objc_msgSend(v12, "parseBool:end:result:", v13, v10, &v44);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v12, "setOptIn:", v44);
      v43 = 0;
      v17 = objc_msgSend(v12, "parseUint64:end:result:", v16, v10, &v43);
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v12, "setTimestampMs:", v43);
        v42 = 0;
        v19 = objc_msgSend(v12, "parseByteArray:end:minLength:maxLength:result:", v18, v10, 0, 0xFFFFLL, &v42);
        v20 = v42;
        v21 = v20;
        if (!v19)
        {
          v30 = 0;
          if (a4)
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -360, CFSTR("failed to parse devices from OptInOut")));
          goto LABEL_29;
        }
        v36 = a4;
        v37 = v19;
        if (objc_msgSend(v20, "length"))
        {
          while (1)
          {
            v41 = 0;
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[IdsDeviceState parseFromData:error:](IdsDeviceState, "parseFromData:error:", v21, &v41));
            v23 = v41;
            v24 = v23;
            if (!v22)
              break;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "devicesArray"));
            objc_msgSend(v25, "addObject:", v22);

            v26 = objc_retainAutorelease(v21);
            v21 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)objc_msgSend(v22, "parsedLength") + (_QWORD)objc_msgSend(v26, "bytes"), (_BYTE *)objc_msgSend(v26, "length") - (_BYTE *)objc_msgSend(v22, "parsedLength")));

            if (!objc_msgSend(v21, "length"))
              goto LABEL_8;
          }
          if (a4 && v23)
            *a4 = objc_retainAutorelease(v23);

          v30 = 0;
          goto LABEL_29;
        }
LABEL_8:
        v40 = 0;
        v27 = objc_msgSend(v12, "parseExtensions:end:result:", v37, v10, &v40);
        v28 = v40;
        if (v27)
          goto LABEL_9;

        v39 = 0;
        v34 = objc_msgSend(v12, "parseByteArray:end:minLength:maxLength:result:", v18, v10, 0, 0x10000, &v39);
        v21 = v39;
        if (!v34)
        {
          v30 = 0;
          v28 = 0;
          if (v36)
            *v36 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -360, CFSTR("failed to parse devices from OptInOut")));
          goto LABEL_10;
        }
        v38 = 0;
        v27 = objc_msgSend(v12, "parseExtensions:end:result:", v34, v10, &v38);
        v28 = v38;
        if (v27)
        {
LABEL_9:
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v28));
          objc_msgSend(v12, "setExtensions:", v29);

          objc_msgSend(v12, "setParsedLength:", v27 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "bytes"));
          v30 = v12;
        }
        else
        {
          v30 = 0;
          if (v36)
            *v36 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -248, CFSTR("failed to parse extensions from OptInOut")));
        }
LABEL_10:

LABEL_29:
        goto LABEL_30;
      }
      if (a4)
      {
        v31 = kTransparencyErrorDecode;
        v32 = CFSTR("failed to parse timestampMs from OptInOut");
        v33 = -275;
        goto LABEL_17;
      }
LABEL_18:
      v30 = 0;
      goto LABEL_30;
    }
    if (!a4)
      goto LABEL_18;
    v31 = kTransparencyErrorDecode;
    v32 = CFSTR("failed to parse optIn BOOLean from OptInOut");
    v33 = -274;
  }
  else
  {
    if (!a4)
      goto LABEL_18;
    v31 = kTransparencyErrorDecode;
    v32 = CFSTR("failed to parse account key from OptInOut");
    v33 = -242;
  }
LABEL_17:
  v30 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v31, v33, v32));
LABEL_30:

  return v30;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation accountKeyHash](self, "accountKeyHash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kt_hexString"));
  if (-[OptInOutMutation optIn](self, "optIn"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = -[OptInOutMutation timestampMs](self, "timestampMs");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation devicesArray](self, "devicesArray"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("accountKeyHash:%@, optIn:%@; timestampMs:%llu, devices: %@"),
                   v4,
                   v5,
                   v6,
                   v7));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  OptInOutMutation *v5;
  uint64_t v6;
  OptInOutMutation *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (OptInOutMutation *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(OptInOutMutation, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (IdsMutation)idsMutation
{
  return (IdsMutation *)objc_loadWeakRetained((id *)&self->_idsMutation);
}

- (void)setIdsMutation:(id)a3
{
  objc_storeWeak((id *)&self->_idsMutation, a3);
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (unint64_t)timestampMs
{
  return self->_timestampMs;
}

- (void)setTimestampMs:(unint64_t)a3
{
  self->_timestampMs = a3;
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccountKeyHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)devicesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDevicesArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_devicesArray, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);
  objc_destroyWeak((id *)&self->_idsMutation);
}

@end
