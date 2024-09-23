@implementation IdsAccount

- (IdsAccount)init
{
  IdsAccount *v2;
  uint64_t v3;
  NSMutableArray *devicesArray;
  uint64_t v5;
  NSMutableArray *extensions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IdsAccount;
  v2 = -[IdsAccount init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    devicesArray = v2->_devicesArray;
    v2->_devicesArray = (NSMutableArray *)v3;

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount accountKeyHash](self, "accountKeyHash"));
  v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray", 0));
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

    if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v8, 1, 0xFFFFLL, v3)&& (v16 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount extensions](self, "extensions")), v17 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v16, v3), v16, v17))
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
  IdsAccount *v10;
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
  IdsAccount *v24;
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
  v10 = objc_alloc_init(IdsAccount);
  v30 = 0;
  v11 = -[TLSMessageClass parseHashValue:end:result:](v10, "parseHashValue:end:result:", v6, v9, &v30);
  v12 = v30;
  if (v11)
  {
    -[IdsAccount setAccountKeyHash:](v10, "setAccountKeyHash:", v12);
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
          -[IdsAccount setExtensions:](v10, "setExtensions:", v23);

          -[IdsAccount setParsedLength:](v10, "setParsedLength:", v21 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v7), "bytes"));
          v24 = v10;
        }
        else
        {
          v24 = 0;
          if (a4)
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -262, CFSTR("failed to parse extensions from IdsAccount")));
        }
        v12 = v26;

        goto LABEL_21;
      }
      while (1)
      {
        v28 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[IdsDevice parseFromData:error:](IdsDevice, "parseFromData:error:", v15, &v28));
        v17 = v28;
        v18 = v17;
        if (!v16)
          break;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](v10, "devicesArray"));
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
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -261, CFSTR("failed to parse devices from IdsAccount")));
LABEL_21:

      goto LABEL_22;
    }
    v24 = 0;
    goto LABEL_21;
  }
  v24 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -260, CFSTR("failed to parse account key from IdsAccount")));
LABEL_22:

  return v24;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  IdsAccount *v21;
  NSMutableArray *obj;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = self;
  obj = self->_devicesArray;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v32;
    v24 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v26 = v4;
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("   {\n"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdHash"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    deviceIdHash: %@\n"), v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientDataArray"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
              objc_msgSend(v8, "appendFormat:", CFSTR("     {\n"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientDataHash"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
              objc_msgSend(v8, "appendFormat:", CFSTR("      clientDataHash:%@\n"), v16);

              objc_msgSend(v8, "appendFormat:", CFSTR("      appVersion:%lu\n"), objc_msgSend(v14, "appVersion"));
              objc_msgSend(v8, "appendFormat:", CFSTR("        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n"),
                objc_msgSend(v14, "addedMs"),
                objc_msgSend(v14, "markedForDeletionMs"),
                objc_msgSend(v14, "expiryMs"),
                objc_msgSend(v14, "escrowExpiryMs"));
              objc_msgSend(v8, "appendFormat:", CFSTR("     },\n"));
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v11);
        }

        objc_msgSend(v8, "appendFormat:", CFSTR("    ]"));
        v3 = v24;
        objc_msgSend(v24, "appendFormat:", CFSTR("    clientDatas: %@\n"), v8);
        objc_msgSend(v24, "appendFormat:", CFSTR("   },\n"));

        v4 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("  ]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount accountKeyHash](v21, "accountKeyHash"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\n  accountKeyHash:%@\n  devices: %@\n}"), v18, v3));

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsAccount *v5;
  uint64_t v6;
  IdsAccount *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsAccount *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsAccount, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (id)parseOptInOutExtension:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
    while (1)
    {
      v15 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[OptInOutWithExt parseFromData:error:](OptInOutWithExt, "parseFromData:error:", v8, &v15));
      v10 = v15;
      v11 = v10;
      if (!v9)
        break;
      objc_msgSend(v6, "addObject:", v9);
      v12 = objc_retainAutorelease(v8);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)objc_msgSend(v9, "parsedLength") + (_QWORD)objc_msgSend(v12, "bytes"), (_BYTE *)objc_msgSend(v12, "length") - (_BYTE *)objc_msgSend(v9, "parsedLength")));

      if (!objc_msgSend(v8, "length"))
        goto LABEL_5;
    }
    if (a4 && v10)
      *a4 = objc_retainAutorelease(v10);

    v13 = 0;
  }
  else
  {
LABEL_5:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  }

  return v13;
}

+ (id)encodeOptInOutExtensionData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "data", (_QWORD)v13));
        objc_msgSend(v4, "appendData:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v4));
  return v11;
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountKeyHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)devicesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevicesArray:(id)a3
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
  objc_storeStrong((id *)&self->_devicesArray, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);
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
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount accountKeyHash](self, "accountKeyHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountKeyHash"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v11), "diagnosticsJsonDictionary"));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("devices"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount sortedOptInOutHistory:](self, "sortedOptInOutHistory:", 0));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v19), "diagnosticsJsonDictionary", (_QWORD)v22));
          objc_msgSend(v14, "addObject:", v20);

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("optInOutHistory"));
  }

  return v3;
}

- (id)sortedOptInOutHistory:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount extensions](self, "extensions", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "extensionType") == 2)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "extensionData"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[IdsAccount parseOptInOutExtension:error:](IdsAccount, "parseOptInOutExtension:error:", v11, a3));

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  if (objc_msgSend(v10, "count"))
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingComparator:", &stru_100247FB0));
  else
    v12 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v13 = (void *)v12;

  return v13;
}

- (BOOL)isActive:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientDataArray", 0));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
              if (!objc_msgSend(v15, "markedForDeletionMs")
                && (!objc_msgSend(v15, "expiryMs") || (unint64_t)objc_msgSend(v15, "expiryMs") > a3)
                || (unint64_t)objc_msgSend(v15, "markedForDeletionMs") > a3
                && (!objc_msgSend(v15, "expiryMs") || (unint64_t)objc_msgSend(v15, "expiryMs") > a3))
              {

                v16 = 1;
                goto LABEL_24;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
    }
    while (v6);
  }
  else
  {
    v16 = 0;
  }
LABEL_24:

  return v16;
}

- (BOOL)hasOptInAfter:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount sortedOptInOutHistory:](self, "sortedOptInOutHistory:", 0));
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "optIn") && (unint64_t)objc_msgSend(v12, "timestampMs") > a3)
          {
            v13 = 1;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_15:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
