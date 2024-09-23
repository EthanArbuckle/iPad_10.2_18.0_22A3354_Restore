@implementation IdsDeviceState

- (IdsDeviceState)init
{
  IdsDeviceState *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IdsDeviceState;
  v2 = -[IdsDeviceState init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[IdsDeviceState setExtensions:](v2, "setExtensions:", v3);

  }
  return v2;
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
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState deviceIdHash](self, "deviceIdHash"));
  v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState clientDataHash](self, "clientDataHash")),
        v7 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v6, v3),
        v6,
        v7)
    && -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[IdsDeviceState appVersion](self, "appVersion"), v3)&& -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[IdsDeviceState addedMs](self, "addedMs"), v3)&& -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", -[IdsDeviceState expiryMs](self, "expiryMs"), v3)&& (v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState extensions](self, "extensions")), v9 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v8, v3), v8, v9))
  {
    v10 = v3;
  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = (char *)objc_msgSend(v8, "length") + (_QWORD)v9;
  v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  v36 = 0;
  v13 = objc_msgSend(v12, "parseHashValue:end:result:", v7, v10, &v36);
  v14 = v36;
  if (v13)
  {
    objc_msgSend(v12, "setDeviceIdHash:", v14);
    v35 = 0;
    v15 = objc_msgSend(v12, "parseHashValue:end:result:", v13, v10, &v35);
    v16 = v35;
    if (v15)
    {
      objc_msgSend(v12, "setClientDataHash:", v16);
      v34 = 0;
      v17 = objc_msgSend(v12, "parseUint64:end:result:", v15, v10, &v34);
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v12, "setAppVersion:", v34);
        v33 = 0;
        v19 = objc_msgSend(v12, "parseUint64:end:result:", v18, v10, &v33);
        if (v19)
        {
          v20 = v19;
          objc_msgSend(v12, "setAddedMs:", v33);
          v32 = 0;
          v21 = objc_msgSend(v12, "parseUint64:end:result:", v20, v10, &v32);
          if (v21)
          {
            v22 = v21;
            objc_msgSend(v12, "setExpiryMs:", v32);
            v31 = 0;
            v23 = objc_msgSend(v12, "parseExtensions:end:result:", v22, v10, &v31);
            v24 = v31;
            if (v23)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v24));
              objc_msgSend(v12, "setExtensions:", v25);

              objc_msgSend(v12, "setParsedLength:", v23 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "bytes"));
              v26 = v12;
            }
            else
            {
              v26 = 0;
              if (a4)
                *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -359, CFSTR("failed to parse extensions from SingleDataRecord")));
            }

            goto LABEL_24;
          }
          if (a4)
          {
            v27 = kTransparencyErrorDecode;
            v28 = CFSTR("failed to parse expiry timestamp from DeviceState");
            v29 = -358;
            goto LABEL_19;
          }
LABEL_20:
          v26 = 0;
          goto LABEL_24;
        }
        if (!a4)
          goto LABEL_20;
        v27 = kTransparencyErrorDecode;
        v28 = CFSTR("failed to parse add timestamp from DeviceState");
        v29 = -357;
      }
      else
      {
        if (!a4)
          goto LABEL_20;
        v27 = kTransparencyErrorDecode;
        v28 = CFSTR("failed to parse app version from DeviceState");
        v29 = -356;
      }
    }
    else
    {
      if (!a4)
        goto LABEL_20;
      v27 = kTransparencyErrorDecode;
      v28 = CFSTR("failed to parse client data from DeviceState");
      v29 = -355;
    }
LABEL_19:
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v27, v29, v28));
LABEL_24:

    goto LABEL_25;
  }
  v26 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -354, CFSTR("failed to parse device ID from DeviceState")));
LABEL_25:

  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_deviceIdHash, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deviceIdHash:%@; clientDataHash:%@; applicationVersion:%llu; addedMs:%llu; expiryMs:%llu"),
                   v3,
                   v4,
                   self->_appVersion,
                   self->_addedMs,
                   self->_expiryMs));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsDeviceState *v5;
  uint64_t v6;
  IdsDeviceState *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsDeviceState *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsDeviceState, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceIdHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_appVersion = a3;
}

- (unint64_t)addedMs
{
  return self->_addedMs;
}

- (void)setAddedMs:(unint64_t)a3
{
  self->_addedMs = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
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
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_deviceIdHash, 0);
}

@end
