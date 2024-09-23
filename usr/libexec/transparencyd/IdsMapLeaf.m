@implementation IdsMapLeaf

- (IdsMapLeaf)init
{
  IdsMapLeaf *v2;
  uint64_t v3;
  NSMutableArray *accountsArray;
  uint64_t v5;
  NSMutableArray *extensions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IdsMapLeaf;
  v2 = -[IdsMapLeaf init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    accountsArray = v2->_accountsArray;
    v2->_accountsArray = (NSMutableArray *)v3;

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
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9), "data"));
        if (!v10)
        {

          goto LABEL_13;
        }
        v11 = (void *)v10;
        objc_msgSend(v4, "appendData:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  v12 = 0;
  if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v4, 0, 0xFFFFFFLL, v3))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf extensions](self, "extensions"));
    v14 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v13, v3);

    if (v14)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v3));
    else
LABEL_13:
      v12 = 0;
  }

  return v12;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  IdsMapLeaf *v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  id v20;
  void *v21;
  IdsMapLeaf *v22;
  id v24;
  id v25;
  id v26;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  v9 = (char *)objc_msgSend(v7, "length") + (_QWORD)v8;
  v10 = objc_alloc_init(IdsMapLeaf);
  v26 = 0;
  v11 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:](v10, "parseByteArray:end:minLength:maxLength:result:", v6, v9, 0, 0xFFFFFFLL, &v26);
  v12 = v26;
  v13 = v12;
  if (v11)
  {
    if (objc_msgSend(v12, "length"))
    {
      while (1)
      {
        v25 = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[IdsAccount parseFromData:error:](IdsAccount, "parseFromData:error:", v13, &v25));
        v15 = v25;
        v16 = v15;
        if (!v14)
          break;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](v10, "accountsArray"));
        objc_msgSend(v17, "addObject:", v14);

        v18 = objc_retainAutorelease(v13);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (char *)objc_msgSend(v14, "parsedLength") + (_QWORD)objc_msgSend(v18, "bytes"), (_BYTE *)objc_msgSend(v18, "length") - (_BYTE *)objc_msgSend(v14, "parsedLength")));

        if (!objc_msgSend(v13, "length"))
          goto LABEL_5;
      }
      if (a4 && v15)
        *a4 = objc_retainAutorelease(v15);

      v22 = 0;
    }
    else
    {
LABEL_5:
      v24 = 0;
      v19 = -[TLSMessageClass parseExtensions:end:result:](v10, "parseExtensions:end:result:", v11, v9, &v24);
      v20 = v24;
      if (v19)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v20));
        -[IdsMapLeaf setExtensions:](v10, "setExtensions:", v21);

        v22 = v10;
      }
      else
      {
        v22 = 0;
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -264, CFSTR("failed to parse extensions from IdsMapLeaf")));
      }

    }
  }
  else
  {
    v22 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, -263, CFSTR("failed to parse accounts from IdsMapLeaf")));
  }

  return v22;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *obj;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_accountsArray;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v43;
    v26 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(obj);
        v28 = v4;
        v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("   {\n"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKeyHash"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    accountKeyHash:%@\n"), v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devicesArray"));
        v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v32)
        {
          v30 = *(_QWORD *)v39;
          v31 = v8;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(v29);
              v33 = v9;
              v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
              objc_msgSend(v8, "appendFormat:", CFSTR("     {\n"));
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdHash"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
              objc_msgSend(v8, "appendFormat:", CFSTR("      deviceIdHash: %@\n"), v12);

              v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientDataArray"));
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v35;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v35 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v18);
                    objc_msgSend(v13, "appendFormat:", CFSTR("       {\n"));
                    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "clientDataHash"));
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "kt_hexString"));
                    objc_msgSend(v13, "appendFormat:", CFSTR("        clientDataHash:%@\n"), v21);

                    objc_msgSend(v13, "appendFormat:", CFSTR("        appVersion:%lu\n"), objc_msgSend(v19, "appVersion"));
                    objc_msgSend(v13, "appendFormat:", CFSTR("        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n"),
                      objc_msgSend(v19, "addedMs"),
                      objc_msgSend(v19, "markedForDeletionMs"),
                      objc_msgSend(v19, "expiryMs"),
                      objc_msgSend(v19, "escrowExpiryMs"));
                    objc_msgSend(v13, "appendFormat:", CFSTR("       },\n"));
                    v18 = (char *)v18 + 1;
                  }
                  while (v16 != v18);
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                }
                while (v16);
              }

              objc_msgSend(v13, "appendFormat:", CFSTR("      ]"));
              v8 = v31;
              objc_msgSend(v31, "appendFormat:", CFSTR("      clientDatas: %@\n"), v13);
              objc_msgSend(v31, "appendFormat:", CFSTR("     },\n"));

              v9 = v33 + 1;
            }
            while ((id)(v33 + 1) != v32);
            v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v32);
        }

        objc_msgSend(v8, "appendFormat:", CFSTR("    ]"));
        v3 = v26;
        objc_msgSend(v26, "appendFormat:", CFSTR("    devices: %@\n"), v8);
        objc_msgSend(v26, "appendFormat:", CFSTR("   },\n"));

        v4 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v27);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("  ]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\n  accounts: %@\n}"), v3));

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  IdsMapLeaf *v5;
  uint64_t v6;
  IdsMapLeaf *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v5 = (IdsMapLeaf *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(IdsMapLeaf, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf data](v7, "data"));

      v10 = objc_msgSend(v8, "isEqualToData:", v9);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSMutableArray)accountsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExtensions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_accountsArray, 0);
}

- (id)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "diagnosticsJsonDictionary"));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accounts"));

  return v3;
}

- (id)recordForAccountKeyHash:(id)a3 deviceIdHash:(id)a4 appVersion:(unint64_t)a5 clientDataHash:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    v39 = v13;
    v40 = v10;
    v43 = v11;
    v37 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accountKeyHash"));
        v20 = objc_msgSend(v19, "isEqualToData:", v10);

        if (v20)
        {
          v41 = i;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "devicesArray"));
          v44 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          if (v44)
          {
            v45 = *(_QWORD *)v51;
            v38 = v15;
            v42 = v21;
            do
            {
              v22 = 0;
              v23 = v43;
              do
              {
                if (*(_QWORD *)v51 != v45)
                  objc_enumerationMutation(v21);
                v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceIdHash"));
                v26 = objc_msgSend(v25, "isEqualToData:", v23);

                if (v26)
                {
                  v48 = 0u;
                  v49 = 0u;
                  v46 = 0u;
                  v47 = 0u;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "clientDataArray"));
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                  if (v28)
                  {
                    v29 = v28;
                    v30 = *(_QWORD *)v47;
                    while (2)
                    {
                      for (j = 0; j != v29; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v47 != v30)
                          objc_enumerationMutation(v27);
                        v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
                        if (objc_msgSend(v32, "appVersion") == (id)a5)
                        {
                          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "clientDataHash"));
                          v34 = objc_msgSend(v33, "isEqualToData:", v12);

                          if ((v34 & 1) != 0)
                          {
                            v35 = v32;

                            v13 = v39;
                            v10 = v40;
                            v11 = v43;
                            goto LABEL_31;
                          }
                        }
                      }
                      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                      if (v29)
                        continue;
                      break;
                    }
                  }

                  v21 = v42;
                  v23 = v43;
                }
                v22 = (char *)v22 + 1;
              }
              while (v22 != v44);
              v13 = v39;
              v10 = v40;
              v16 = v37;
              v15 = v38;
              v44 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            }
            while (v44);
          }

          i = v41;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      v35 = 0;
      v11 = v43;
    }
    while (v15);
  }
  else
  {
    v35 = 0;
  }
LABEL_31:

  return v35;
}

- (id)accountForAccountKeyHash:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)verifyWithError:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _BOOL4 v34;
  id v35;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  id *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];

  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (!v5)
  {
LABEL_35:

    return 1;
  }
  v6 = v5;
  v7 = *(_QWORD *)v55;
LABEL_3:
  v8 = 0;
LABEL_4:
  if (*(_QWORD *)v55 != v7)
    objc_enumerationMutation(v4);
  v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash"));
  if (!v10
    || (v11 = (void *)v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash")),
        v13 = objc_msgSend(v12, "length"),
        v12,
        v11,
        !v13))
  {
    v37 = -81;
    goto LABEL_41;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "devicesArray"));
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    v37 = -82;
    goto LABEL_41;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "devicesArray"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (!v17)
    goto LABEL_33;
  v18 = *(_QWORD *)v51;
  v43 = v4;
  v44 = a3;
  v40 = *(_QWORD *)v51;
  v41 = v6;
LABEL_11:
  v19 = 0;
  v42 = v17;
LABEL_12:
  if (*(_QWORD *)v51 != v18)
    objc_enumerationMutation(v16);
  v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "clientDataArray"));
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "clientDataArray"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    if (!v24)
      goto LABEL_31;
    v25 = v24;
    v26 = *(_QWORD *)v47;
    v39 = v7;
    v45 = v16;
LABEL_17:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v26)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v27);
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "clientDataHash"));
      if (!v29)
        break;
      v30 = (void *)v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "clientDataHash"));
      v32 = objc_msgSend(v31, "length");

      if (!v32)
        break;
      if (objc_msgSend(v28, "markedForDeletionMs"))
      {
        v33 = objc_msgSend(v28, "escrowExpiryMs");
        if (v33 <= objc_msgSend(v28, "markedForDeletionMs"))
        {
          v37 = -85;
          goto LABEL_39;
        }
      }
      if (!objc_msgSend(v28, "markedForDeletionMs")
        && (v34 = objc_msgSend(v28, "expiryMs") != 0, ((v34 ^ (objc_msgSend(v28, "escrowExpiryMs") != 0)) & 1) != 0)
        || !objc_msgSend(v28, "markedForDeletionMs")
        && objc_msgSend(v28, "expiryMs")
        && (v35 = objc_msgSend(v28, "escrowExpiryMs"), v35 <= objc_msgSend(v28, "expiryMs")))
      {
        v37 = -237;
        goto LABEL_39;
      }
      if (v25 == (id)++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        v7 = v39;
        v16 = v45;
        if (v25)
          goto LABEL_17;
LABEL_31:

        v19 = (char *)v19 + 1;
        v6 = v41;
        v18 = v40;
        if (v19 == v42)
        {
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          v4 = v43;
          a3 = v44;
          if (!v17)
          {
LABEL_33:

            if ((id)++v8 == v6)
            {
              v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
              if (!v6)
                goto LABEL_35;
              goto LABEL_3;
            }
            goto LABEL_4;
          }
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
    v37 = -84;
LABEL_39:

    v4 = v43;
    a3 = v44;
    v16 = v45;
    goto LABEL_40;
  }
  v37 = -83;
  v4 = v43;
  a3 = v44;
LABEL_40:

LABEL_41:
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDecode, v37, CFSTR("MapLeaf missing required fields or inconsistent")));
  if (qword_1002A77A0 != -1)
    dispatch_once(&qword_1002A77A0, &stru_100247FD0);
  v38 = qword_1002A77A8;
  if (os_log_type_enabled((os_log_t)qword_1002A77A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v59 = v37;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "MapLeaf missing required fields or inconsistent: %ld", buf, 0xCu);
  }
  return 0;
}

@end
