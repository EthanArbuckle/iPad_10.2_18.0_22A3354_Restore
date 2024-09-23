@implementation IdsMutation

- (int)getSimpleMutationType
{
  unsigned int v2;

  v2 = -[IdsMutation mutationType](self, "mutationType");
  if (v2 > 6)
    return 1;
  else
    return dword_100216F10[(char)v2];
}

- (BOOL)getOptIn
{
  unsigned int v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = -[IdsMutation mutationType](self, "mutationType");
  switch(v3)
  {
    case 6u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_6;
    case 4u:
      v8 = objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
        v12 = objc_opt_class(IdsDeviceMutationWithExt, v11);
        isKindOfClass = objc_opt_isKindOfClass(v10, v12);

        if ((isKindOfClass & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensions", 0));
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v20, "extensionType") == 3)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "extensionData"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(+[OptInOutWithExt parseFromData:error:](OptInOutWithExt, "parseFromData:error:", v22, 0));

                  v21 = objc_msgSend(v23, "optIn");
                  return v21;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
              if (v17)
                continue;
              break;
            }
          }

        }
      }
      break;
    case 3u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
LABEL_6:
      v5 = v4;
      v6 = objc_msgSend(v4, "optIn");

      return v6;
  }
  return 0;
}

- (id)getOptInOutWithExt
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (-[IdsMutation mutationType](self, "mutationType") == 4
    && (v3 = objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"))) != 0
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation")),
        v7 = objc_opt_class(IdsDeviceMutationWithExt, v6),
        isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "extensions", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "extensionType") == 3)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensionData"));
            v11 = (id)objc_claimAutoreleasedReturnValue(+[OptInOutWithExt parseFromData:error:](OptInOutWithExt, "parseFromData:error:", v16, 0));

            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)hasOptInExtension
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (-[IdsMutation mutationType](self, "mutationType") == 4
    && (v3 = objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"))) != 0
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation")),
        v7 = objc_opt_class(IdsDeviceMutationWithExt, v6),
        isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "extensions", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "extensionType") == 3)
          {
            LOBYTE(v11) = 1;
            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return (char)v11;
}

- (id)accountKeyHash
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[IdsMutation mutationType](self, "mutationType");
  v4 = 0;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_6:
      v6 = v5;
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKeyHash"));

      return v4;
    }
    if (v3 == 6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_6;
    }
  }
  return v4;
}

- (IdsMutation)init
{
  IdsMutation *v2;
  uint64_t v3;
  NSMutableArray *extensions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IdsMutation;
  v2 = -[IdsMutation init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)data
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  if (-[TLSMessageClass encodeByte:buffer:](self, "encodeByte:buffer:", -[IdsMutation mutationVersion](self, "mutationVersion"), v3))
  {
    if (-[TLSMessageClass encodeByte:buffer:](self, "encodeByte:buffer:", -[IdsMutation mutationType](self, "mutationType"), v3))
    {
      if (-[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[IdsMutation mutationMs](self, "mutationMs"), v3))
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation uriVRFOutput](self, "uriVRFOutput"));
        v5 = -[TLSMessageClass encodeVRFOutput:buffer:](self, "encodeVRFOutput:buffer:", v4, v3);

        if (v5)
        {
          v6 = -[IdsMutation mutationType](self, "mutationType");
          v7 = 0;
          if (v6 > 6)
          {
            v10 = 0;
          }
          else
          {
            if (((1 << v6) & 0x36) != 0)
            {
              v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_14:
              v11 = v8;
              v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));

              if (v10
                && (objc_msgSend(v3, "appendData:", v10),
                    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation extensions](self, "extensions")),
                    v13 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v12, v3),
                    v12,
                    v13))
              {
                v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v3));
              }
              else
              {
                v7 = 0;
              }
              goto LABEL_18;
            }
            if (v6 == 3)
            {
              v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
              goto LABEL_14;
            }
            v10 = 0;
            if (v6 == 6)
            {
              v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
              goto LABEL_14;
            }
          }
LABEL_18:

          goto LABEL_9;
        }
      }
    }
  }
  v7 = 0;
LABEL_9:

  return v7;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  char *v10;
  IdsMutation *v11;
  const char *v12;
  BOOL v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  IdsMutation *v27;
  id v28;
  char *v29;
  const char *v30;
  id v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  unsigned __int8 v41;
  char v42;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = (char *)objc_msgSend(v7, "length");

  v10 = &v9[(_QWORD)v8];
  v11 = objc_alloc_init(IdsMutation);
  v42 = 0;
  v12 = -[TLSMessageClass parseByte:end:result:](v11, "parseByte:end:result:", v6, v10, &v42);
  if (v12)
    v13 = v42 == 2;
  else
    v13 = 0;
  if (!v13)
  {
    if (a4)
    {
      v14 = kTransparencyErrorDecode;
      v15 = CFSTR("failed to parse mutation version from Mutation");
      v16 = -265;
LABEL_16:
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v14, v16, v15));
      goto LABEL_42;
    }
    goto LABEL_17;
  }
  v17 = v12;
  -[IdsMutation setMutationVersion:](v11, "setMutationVersion:", 2);
  v41 = 0;
  v18 = -[TLSMessageClass parseByte:end:result:](v11, "parseByte:end:result:", v17, v10, &v41);
  if (!v18)
  {
    if (a4)
    {
      v14 = kTransparencyErrorDecode;
      v15 = CFSTR("failed to parse mutation type from Mutation");
      v16 = -239;
      goto LABEL_16;
    }
LABEL_17:
    v27 = 0;
    goto LABEL_42;
  }
  v19 = v18;
  -[IdsMutation setMutationType:](v11, "setMutationType:", v41);
  v40 = 0;
  v20 = -[TLSMessageClass parseUint64:end:result:](v11, "parseUint64:end:result:", v19, v10, &v40);
  if (!v20)
  {
    if (a4)
    {
      v14 = kTransparencyErrorDecode;
      v15 = CFSTR("failed to parse mutation timestamp from Mutation");
      v16 = -240;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v21 = v20;
  -[IdsMutation setMutationMs:](v11, "setMutationMs:", v40);
  v39 = 0;
  v22 = -[TLSMessageClass parseVRFOutput:end:result:](v11, "parseVRFOutput:end:result:", v21, v10, &v39);
  v23 = v39;
  if (v22)
  {
    -[IdsMutation setUriVRFOutput:](v11, "setUriVRFOutput:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v22, v10 - v22));
    switch(-[IdsMutation mutationType](v11, "mutationType"))
    {
      case 1u:
      case 2u:
        v38 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[IdsDeviceMutation parseFromData:error:](IdsDeviceMutation, "parseFromData:error:", v24, &v38));
        v26 = v38;
        goto LABEL_21;
      case 3u:
        v36 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[OptInOut parseFromData:error:](OptInOut, "parseFromData:error:", v24, &v36));
        v28 = v36;
        if (!v25)
          goto LABEL_32;
        objc_msgSend(v25, "setIdsMutation:", v11);
        -[IdsMutation setOptInOut:](v11, "setOptInOut:", v25);
        goto LABEL_30;
      case 4u:
      case 5u:
        v37 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[IdsDeviceMutationWithExt parseFromData:error:](IdsDeviceMutationWithExt, "parseFromData:error:", v24, &v37));
        v26 = v37;
LABEL_21:
        v28 = v26;
        if (!v25)
          goto LABEL_32;
        objc_msgSend(v25, "setIdsMutation:", v11);
        -[IdsMutation setIdsDeviceMutation:](v11, "setIdsDeviceMutation:", v25);
        goto LABEL_30;
      case 6u:
        v35 = 0;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[OptInOutMutation parseFromData:error:](OptInOutMutation, "parseFromData:error:", v24, &v35));
        v28 = v35;
        if (v25)
        {
          objc_msgSend(v25, "setIdsMutation:", v11);
          -[IdsMutation setOptInOutMutation:](v11, "setOptInOutMutation:", v25);
LABEL_30:
          v29 = (char *)objc_msgSend(v25, "parsedLength") + (_QWORD)v22;

          v34 = 0;
          v30 = -[TLSMessageClass parseExtensions:end:result:](v11, "parseExtensions:end:result:", v29, v10, &v34);
          v31 = v34;
          if (v30)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v31));
            -[IdsMutation setExtensions:](v11, "setExtensions:", v32);

            v27 = v11;
          }
          else
          {
            v27 = 0;
            if (a4)
              *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -248, CFSTR("failed to parse extensions from Mutation")));
          }

        }
        else
        {
LABEL_32:
          if (a4 && v28)
            *a4 = objc_retainAutorelease(v28);

LABEL_36:
          v27 = 0;
        }
        break;
      default:
        if (!a4)
          goto LABEL_36;
        v27 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -273, CFSTR("unknown mutation type in mutation")));
        break;
    }

  }
  else
  {
    v27 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -241, CFSTR("failed to parse uri VRF output from Mutation")));
  }

LABEL_42:
  return v27;
}

- (id)debugDescription
{
  unsigned int v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t mutationType;
  unint64_t mutationMs;
  void *v9;
  void *v10;

  v3 = -[IdsMutation mutationType](self, "mutationType");
  v4 = CFSTR("unknown");
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_8:
      v6 = v5;
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugDescription"));

      goto LABEL_9;
    }
    if (v3 == 3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
      goto LABEL_8;
    }
    if (v3 == 6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_8;
    }
  }
LABEL_9:
  mutationType = self->_mutationType;
  mutationMs = self->_mutationMs;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_uriVRFOutput, "kt_hexString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\tmutationType:%hhu\n\tmutationMs:%llu\n\turiVRFOutput:%@\n\tsubMutation:\n%@\n}"), mutationType, mutationMs, v9, v4));

  return v10;
}

- (id)description
{
  unsigned int v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t mutationType;
  unint64_t mutationMs;
  void *v9;
  void *v10;

  v3 = -[IdsMutation mutationType](self, "mutationType");
  v4 = CFSTR("unknown");
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_8:
      v6 = v5;
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));

      goto LABEL_9;
    }
    if (v3 == 3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
      goto LABEL_8;
    }
    if (v3 == 6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_8;
    }
  }
LABEL_9:
  mutationType = self->_mutationType;
  mutationMs = self->_mutationMs;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_uriVRFOutput, "kt_hexString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mutationType:%hhu; mutationMs:%llu; uriVRFOutput:%@; subMutation:%@"),
                    mutationType,
                    mutationMs,
                    v9,
                    v4));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsMutation *v5;
  uint64_t v6;
  IdsMutation *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsMutation *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsMutation, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unsigned)mutationVersion
{
  return self->_mutationVersion;
}

- (void)setMutationVersion:(unsigned __int8)a3
{
  self->_mutationVersion = a3;
}

- (unsigned)mutationType
{
  return self->_mutationType;
}

- (void)setMutationType:(unsigned __int8)a3
{
  self->_mutationType = a3;
}

- (unint64_t)mutationMs
{
  return self->_mutationMs;
}

- (void)setMutationMs:(unint64_t)a3
{
  self->_mutationMs = a3;
}

- (NSData)uriVRFOutput
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriVRFOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OptInOut)optInOut
{
  return (OptInOut *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptInOut:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OptInOutMutation)optInOutMutation
{
  return (OptInOutMutation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOptInOutMutation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (IdsDeviceMutation)idsDeviceMutation
{
  return (IdsDeviceMutation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsDeviceMutation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_idsDeviceMutation, 0);
  objc_storeStrong((id *)&self->_optInOutMutation, 0);
  objc_storeStrong((id *)&self->_optInOut, 0);
  objc_storeStrong((id *)&self->_uriVRFOutput, 0);
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[IdsMutation mutationVersion](self, "mutationVersion")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("version"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[IdsMutation mutationType](self, "mutationType")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[IdsMutation mutationMs](self, "mutationMs")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("mutationMs"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[IdsMutation mutationMs](self, "mutationMs") / 0x3E8)));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_toISO_8601_UTCString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("mutationDateReadable"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation uriVRFOutput](self, "uriVRFOutput"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("uriVrfOutput"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("optInOut"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "diagnosticsJsonDictionary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("idsDeviceMutation"));

  }
  return v3;
}

@end
