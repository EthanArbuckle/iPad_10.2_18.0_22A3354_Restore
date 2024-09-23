@implementation IdsDevice

- (IdsDevice)init
{
  IdsDevice *v2;
  uint64_t v3;
  NSMutableArray *clientDataArray;
  uint64_t v5;
  NSMutableArray *extensions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IdsDevice;
  v2 = -[IdsDevice init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    clientDataArray = v2->_clientDataArray;
    v2->_clientDataArray = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)data
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice deviceIdHash](self, "deviceIdHash"));
  v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](self, "clientDataArray")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](self, "clientDataArray", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "data"));
          if (!v14)
          {

            goto LABEL_16;
          }
          v15 = (void *)v14;
          objc_msgSend(v8, "appendData:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v8, 1, 0xFFFFLL, v3)&& (v16 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice extensions](self, "extensions")), v17 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v16, v3), v16, v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v3));
    }
    else
    {
LABEL_16:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  IdsDevice *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  id v22;
  void *v23;
  IdsDevice *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = (char *)objc_msgSend(v7, "length") + (_QWORD)v8;
  v10 = objc_alloc_init(IdsDevice);
  v30 = 0;
  v11 = -[TLSMessageClass parseHashValue:end:result:](v10, "parseHashValue:end:result:", v6, v9, &v30);
  v12 = v30;
  if (v11)
  {
    -[IdsDevice setDeviceIdHash:](v10, "setDeviceIdHash:", v12);
    v29 = 0;
    v13 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:](v10, "parseByteArray:end:minLength:maxLength:result:", v11, v9, 1, 0xFFFFLL, &v29);
    v14 = v29;
    v15 = v14;
    if (v13)
    {
      v26 = v12;
      if (!objc_msgSend(v14, "length"))
      {
LABEL_6:
        v27 = 0;
        v21 = -[TLSMessageClass parseExtensions:end:result:](v10, "parseExtensions:end:result:", v13, v9, &v27);
        v22 = v27;
        if (v21)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v22));
          -[IdsDevice setExtensions:](v10, "setExtensions:", v23);

          -[IdsDevice setParsedLength:](v10, "setParsedLength:", v21 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v7), "bytes"));
          v24 = v10;
        }
        else
        {
          v24 = 0;
          if (a4)
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -259, CFSTR("failed to parse extensions from IdsDevice")));
        }
        v12 = v26;

        goto LABEL_21;
      }
      while (1)
      {
        v28 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SingleDataRecord parseFromData:error:](SingleDataRecord, "parseFromData:error:", v15, &v28));
        v17 = v28;
        v18 = v17;
        if (!v16)
          break;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](v10, "clientDataArray"));
        objc_msgSend(v19, "addObject:", v16);

        v20 = objc_retainAutorelease(v15);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)objc_msgSend(v16, "parsedLength") + (_QWORD)objc_msgSend(v20, "bytes"), (_BYTE *)objc_msgSend(v20, "length") - (_BYTE *)objc_msgSend(v16, "parsedLength")));

        if (!objc_msgSend(v15, "length"))
          goto LABEL_6;
      }
      if (a4 && v17)
        *a4 = objc_retainAutorelease(v17);

    }
    else if (a4)
    {
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -258, CFSTR("failed to parse client datas from IdsDevice")));
LABEL_21:

      goto LABEL_22;
    }
    v24 = 0;
    goto LABEL_21;
  }
  v24 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -257, CFSTR("failed to parse device ID from IdsDevice")));
LABEL_22:

  return v24;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IdsDevice *v14;
  NSMutableArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = self;
  obj = self->_clientDataArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v7);
        objc_msgSend(v3, "appendFormat:", CFSTR("   {\n"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientDataHash"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    clientDataHash:%@\n"), v10);

        objc_msgSend(v3, "appendFormat:", CFSTR("    appVersion:%lu\n"), objc_msgSend(v8, "appVersion"));
        objc_msgSend(v3, "appendFormat:", CFSTR("        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n"),
          objc_msgSend(v8, "addedMs"),
          objc_msgSend(v8, "markedForDeletionMs"),
          objc_msgSend(v8, "expiryMs"),
          objc_msgSend(v8, "escrowExpiryMs"));
        objc_msgSend(v3, "appendFormat:", CFSTR("   },\n"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("  ]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v14->_deviceIdHash, "kt_hexString"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\n  deviceIdHash:%@\n  clientDatas: %@\n}"), v11, v3));

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsDevice *v5;
  uint64_t v6;
  IdsDevice *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsDevice *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsDevice, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice data](v7, "data"));

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

- (NSMutableArray)clientDataArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientDataArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
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
  objc_storeStrong((id *)&self->_clientDataArray, 0);
  objc_storeStrong((id *)&self->_deviceIdHash, 0);
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice deviceIdHash](self, "deviceIdHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceIdHash"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](self, "clientDataArray", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "diagnosticsJsonDictionary"));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientDatas"));

  return v3;
}

@end
