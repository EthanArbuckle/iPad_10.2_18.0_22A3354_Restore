@implementation IdsDeviceMutation

- (IdsDeviceMutation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IdsDeviceMutation;
  return -[IdsDeviceMutation init](&v3, "init");
}

- (id)data
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  _BOOL8 v12;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation accountKeyHash](self, "accountKeyHash"));
  v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (!v5)
    goto LABEL_14;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation deviceIdHash](self, "deviceIdHash"));
  v7 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v6, v3);

  if (!v7)
    goto LABEL_14;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation clientDataHash](self, "clientDataHash"));
  v9 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v8, v3);

  if (!v9
    || !-[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[IdsDeviceMutation appVersion](self, "appVersion"), v3))
  {
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation idsMutation](self, "idsMutation"));
  v11 = objc_msgSend(v10, "mutationType");

  v12 = v11 == 1 && -[IdsDeviceMutation accountMismatch](self, "accountMismatch");
  if (-[TLSMessageClass encodeBool:buffer:](self, "encodeBool:buffer:", v12, v3)
    && ((v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation idsMutation](self, "idsMutation")),
         v14 = objc_msgSend(v13, "mutationType"),
         v13,
         v14 != 1)
      ? (v15 = 0)
      : (v15 = -[IdsDeviceMutation expiryMs](self, "expiryMs")),
        -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", v15, v3)))
  {
    v16 = v3;
  }
  else
  {
LABEL_14:
    v16 = 0;
  }

  return v16;
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
  id v22;
  _BYTE *v23;
  _BYTE *v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = (char *)objc_msgSend(v8, "length") + (_QWORD)v9;
  v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  v35 = 0;
  v13 = objc_msgSend(v12, "parseHashValue:end:result:", v7, v10, &v35);
  v14 = v35;
  if (v13)
  {
    objc_msgSend(v12, "setAccountKeyHash:", v14);
    v34 = 0;
    v15 = objc_msgSend(v12, "parseHashValue:end:result:", v13, v10, &v34);
    v16 = v34;
    if (!v15)
    {
      v25 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -243, CFSTR("failed to parse device ID from Mutation")));
      goto LABEL_25;
    }
    objc_msgSend(v12, "setDeviceIdHash:", v16);
    v33 = 0;
    v17 = objc_msgSend(v12, "parseHashValue:end:result:", v15, v10, &v33);
    v18 = v33;
    if (v17)
    {
      objc_msgSend(v12, "setClientDataHash:", v18);
      v32 = 0;
      v19 = objc_msgSend(v12, "parseUint64:end:result:", v17, v10, &v32);
      if (v19)
      {
        v20 = v19;
        objc_msgSend(v12, "setAppVersion:", v32);
        v31 = 0;
        objc_msgSend(v12, "setAccountMismatch:", 0);
        v21 = objc_msgSend(v12, "parseBool:end:result:", v20, v10, &v31);
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v12, "setAccountMismatch:", v31);
          v30 = 0;
          v23 = objc_msgSend(v12, "parseUint64:end:result:", v22, v10, &v30);
          if (v23)
          {
            v24 = v23;
            objc_msgSend(v12, "setExpiryMs:", v30);
            objc_msgSend(v12, "setParsedLength:", v24 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "bytes"));
            v25 = v12;
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }
          if (a4)
          {
            v26 = kTransparencyErrorDecode;
            v27 = CFSTR("failed to parse expiry timestamp from Mutation");
            v28 = -247;
            goto LABEL_22;
          }
LABEL_23:
          v25 = 0;
          goto LABEL_24;
        }
        if (!a4)
          goto LABEL_23;
        v26 = kTransparencyErrorDecode;
        v27 = CFSTR("failed to parse account mismatch from Mutation");
        v28 = -246;
      }
      else
      {
        if (!a4)
          goto LABEL_23;
        v26 = kTransparencyErrorDecode;
        v27 = CFSTR("failed to parse app version from Mutation");
        v28 = -245;
      }
    }
    else
    {
      if (!a4)
        goto LABEL_23;
      v26 = kTransparencyErrorDecode;
      v27 = CFSTR("failed to parse client data from Mutation");
      v28 = -244;
    }
LABEL_22:
    v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v26, v28, v27));
    goto LABEL_24;
  }
  v25 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -242, CFSTR("failed to parse account key from Mutation")));
LABEL_26:

  return v25;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_accountKeyHash, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_deviceIdHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\t\taccountKeyHash:%@\n\t\tdeviceIdHash:%@\n\t\tclientDataHash:%@\n\t\tapplicationVersion:%llu\n\t\taccountMismatch:%lu\n\t\texpiryMs:%llu\n}"), v3, v4, v5, self->_appVersion, self->_accountMismatch, self->_expiryMs));

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_accountKeyHash, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_deviceIdHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("accountKeyHash:%@; deviceIdHash::%@; clientDataHash:%@; applicationVersion:%llu; accountMismatch:%lu; expiryMs:%llu"),
                   v3,
                   v4,
                   v5,
                   self->_appVersion,
                   self->_accountMismatch,
                   self->_expiryMs));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsDeviceMutation *v5;
  uint64_t v6;
  IdsDeviceMutation *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsDeviceMutation *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsDeviceMutation, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation data](v7, "data"));

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

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountKeyHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceIdHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_appVersion = a3;
}

- (BOOL)accountMismatch
{
  return self->_accountMismatch;
}

- (void)setAccountMismatch:(BOOL)a3
{
  self->_accountMismatch = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
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
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_deviceIdHash, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);
  objc_destroyWeak((id *)&self->_idsMutation);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation accountKeyHash](self, "accountKeyHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountKeyHash"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation deviceIdHash](self, "deviceIdHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceIdHash"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation clientDataHash](self, "clientDataHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientDataHash"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[IdsDeviceMutation appVersion](self, "appVersion")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("appVersion"));

  if (-[IdsDeviceMutation expiryMs](self, "expiryMs"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[IdsDeviceMutation expiryMs](self, "expiryMs")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("expiryMs"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[IdsDeviceMutation expiryMs](self, "expiryMs") / 0x3E8)));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_toISO_8601_UTCString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("expiryDateReadable"));

  }
  return v3;
}

@end
