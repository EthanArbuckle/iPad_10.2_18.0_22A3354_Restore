@implementation KTTransparentData

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  KTTransparentData *v35;
  NSMutableArray *obj;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v35 = self;
  obj = self->_accounts;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v39)
  {
    v37 = *(_QWORD *)v55;
    v38 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v55 != v37)
          objc_enumerationMutation(obj);
        v40 = v4;
        v5 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("   {\n"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKey"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    accountKey:%@\n"), v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKeyHash"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    accountKeyHash:%@\n"), v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));
        v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v44)
        {
          v42 = *(_QWORD *)v51;
          v43 = v10;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v51 != v42)
                objc_enumerationMutation(v41);
              v45 = v11;
              v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v11);
              objc_msgSend(v10, "appendFormat:", CFSTR("     {\n"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceID"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
              objc_msgSend(v10, "appendFormat:", CFSTR("      deviceID:%@\n"), v14);

              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceIDHash"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
              objc_msgSend(v10, "appendFormat:", CFSTR("      deviceIDHash: %@\n"), v16);

              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientDatas"));
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v47;
                do
                {
                  v22 = 0;
                  do
                  {
                    if (*(_QWORD *)v47 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v22);
                    objc_msgSend(v17, "appendFormat:", CFSTR("       {\n"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "clientData"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "kt_hexString"));
                    objc_msgSend(v17, "appendFormat:", CFSTR("        clientData:%@\n"), v25);

                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "clientDataHash"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "kt_hexString"));
                    objc_msgSend(v17, "appendFormat:", CFSTR("        clientDataHash:%@\n"), v27);

                    objc_msgSend(v17, "appendFormat:", CFSTR("        appVersion:%lu\n"), objc_msgSend(v23, "applicationVersion"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "addedDate"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "markedForDeletion"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "expiry"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "escrowExpiry"));
                    objc_msgSend(v17, "appendFormat:", CFSTR("        addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n"),
                      v28,
                      v29,
                      v30,
                      v31);

                    objc_msgSend(v17, "appendFormat:", CFSTR("       },\n"));
                    v22 = (char *)v22 + 1;
                  }
                  while (v20 != v22);
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
                }
                while (v20);
              }

              objc_msgSend(v17, "appendFormat:", CFSTR("      ]"));
              v10 = v43;
              objc_msgSend(v43, "appendFormat:", CFSTR("      clientDatas: %@\n"), v17);
              objc_msgSend(v43, "appendFormat:", CFSTR("     },\n"));

              v11 = v45 + 1;
            }
            while ((id)(v45 + 1) != v44);
            v44 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v44);
        }

        objc_msgSend(v10, "appendFormat:", CFSTR("    ]"));
        v3 = v38;
        objc_msgSend(v38, "appendFormat:", CFSTR("    devices: %@\n"), v10);
        objc_msgSend(v38, "appendFormat:", CFSTR("   },\n"));

        v4 = v40 + 1;
      }
      while ((id)(v40 + 1) != v39);
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v39);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("  ]"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v35->_uriVRFOutput, "kt_hexString"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\n  uriVRFOutput: %@\n  accounts: %@\n}"), v32, v3));

  return v33;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t String;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uriVRFOutput"));

  String = KTStaticKeyPeerValidateResultGetString(-[KTTransparentData staticKeyStatus](self, "staticKeyStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(String);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("staticKeyStatus"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "diagnosticsJsonDictionary"));
        objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accounts"));
  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accounts"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uriVRFOutput"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](self, "currentTreeEpochBeginDate"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("currentTreeEpoch"));

}

- (KTTransparentData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  KTTransparentData *v17;
  id v18;

  v4 = a3;
  v6 = objc_opt_class(NSArray, v5);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(KTAccount, v7), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("accounts")));
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v11), CFSTR("uriVRFOutput"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v14), CFSTR("currentTreeEpoch"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = objc_alloc_init(KTTransparentData);
  if (v17)
  {
    v18 = objc_msgSend(v10, "mutableCopy");
    -[KTTransparentData setAccounts:](v17, "setAccounts:", v18);

    -[KTTransparentData setUriVRFOutput:](v17, "setUriVRFOutput:", v13);
    -[KTTransparentData setCurrentTreeEpochBeginDate:](v17, "setCurrentTreeEpochBeginDate:", v16);
  }

  return v17;
}

- (KTTransparentData)initWithUriVRFOutput:(id)a3 mapLeaf:(id)a4 pendingSMTs:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  KTTransparentData *v14;
  KTTransparentData *v15;
  uint64_t v16;
  NSMutableArray *accounts;
  KTTransparentData *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)KTTransparentData;
  v14 = -[KTTransparentData init](&v20, "init");
  v15 = v14;
  if (v14
    && ((objc_storeStrong((id *)&v14->_uriVRFOutput, a3),
         v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")),
         accounts = v15->_accounts,
         v15->_accounts = (NSMutableArray *)v16,
         accounts,
         -[KTTransparentData setStaticKeyStatus:](v15, "setStaticKeyStatus:", 3),
         v12)
     && !-[KTTransparentData updateWithMapLeaf:error:](v15, "updateWithMapLeaf:error:", v12, a6)
     || v13 && !-[KTTransparentData updateWithSMTs:error:](v15, "updateWithSMTs:error:", v13, a6)))
  {
    v18 = 0;
  }
  else
  {
    v18 = v15;
  }

  return v18;
}

- (KTTransparentData)initWithUriVRFOutput:(id)a3
{
  return -[KTTransparentData initWithUriVRFOutput:mapLeaf:pendingSMTs:error:](self, "initWithUriVRFOutput:mapLeaf:pendingSMTs:error:", a3, 0, 0, 0);
}

- (id)copy
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0));
  v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(KTTransparentData, v3), v2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)serialize
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, CFSTR("kTransparentData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "encodedData"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  KTTransparentData *v5;
  uint64_t v6;
  KTTransparentData *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;

  v5 = (KTTransparentData *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(KTTransparentData, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
      v9 = objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](v7, "uriVRFOutput"));
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](v7, "uriVRFOutput"));
        v13 = objc_msgSend(v11, "isEqualToData:", v12);

        if (!v13)
          goto LABEL_15;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
      v16 = objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](v7, "accounts"));
      if (v15 == (void *)v16)
      {

      }
      else
      {
        v17 = (void *)v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](v7, "accounts"));
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_15;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](self, "currentTreeEpochBeginDate"));
      v22 = objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](v7, "currentTreeEpochBeginDate"));
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](self, "currentTreeEpochBeginDate"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentTreeEpochBeginDate](v7, "currentTreeEpochBeginDate"));
        v26 = objc_msgSend(v24, "kt_isEqualWithinOneMillisecond:", v25);

        if ((v26 & 1) == 0)
        {
LABEL_15:
          v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      v14 = 1;
      goto LABEL_18;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (id)accountForAccountKeyHash:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  v5 = self->_accounts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqualToData:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)accountForAccountKey:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_accounts;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountKey", (_QWORD)v17));
        v12 = objc_msgSend(v11, "isEqualToData:", v4);

        if ((v12 & 1) != 0)
        {
          v15 = v10;
          goto LABEL_12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_sha256WithSalt:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v5));
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "setAccountKey:", v4);
LABEL_12:

  return v15;
}

- (void)removeAccountsObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_accounts, "removeObject:", a3);
}

- (void)addAccountsObject:(id)a3
{
  -[NSMutableArray addObject:](self->_accounts, "addObject:", a3);
}

- (BOOL)updateWithMapLeaf:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  KTAccount *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = objc_msgSend(v6, "verifyWithError:", a4);
  if (v7 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[KTTransparentData setAccounts:](self, "setAccounts:", v8);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsArray", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = -[KTAccount initWithIdsAccount:]([KTAccount alloc], "initWithIdsAccount:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
          objc_msgSend(v15, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[KTTransparentData cleanupAccounts](self, "cleanupAccounts");
  }

  return v7 == (id)1;
}

- (id)sortMutationsByTimestamp:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100113974;
  v12[3] = &unk_100245DC0;
  v12[4] = &v13;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingComparator:", v12));
  v7 = v6;
  if (*((_BYTE *)v14 + 24))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -332, CFSTR("error sorting SMTs due to multiple conflicting SMTs with the same timestamp")));
    v9 = v8;
    if (a4 && v8)
      *a4 = objc_retainAutorelease(v8);

    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)mutationsFromSMTs:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMutationTimestamp signedTypeWithObject:](SignedMutationTimestamp, "signedTypeWithObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11), (_QWORD)v17));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "parsedMutationWithError:", a4));
        if (!v13)
        {

          v15 = 0;
          goto LABEL_11;
        }
        v14 = (void *)v13;
        objc_msgSend(v6, "addObject:", v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = v6;
LABEL_11:

  return v15;
}

- (void)markAccountsWithMutationMs:(unint64_t)a3 except:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id obj;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)a3 / 1000.0));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    v24 = *(_QWORD *)v39;
    v25 = v6;
    do
    {
      v11 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v11);
        if ((!v6
           || (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v11), "isEqual:", v6) & 1) == 0)
          && objc_msgSend(v12, "active:", v7, v24, v25))
        {
          v28 = v11;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "devices"));
          v13 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v35 != v15)
                  objc_enumerationMutation(v29);
                v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v17, "active:", v7))
                {
                  v32 = 0u;
                  v33 = 0u;
                  v30 = 0u;
                  v31 = 0u;
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientDatas"));
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                  if (v19)
                  {
                    v20 = v19;
                    v21 = *(_QWORD *)v31;
                    do
                    {
                      for (j = 0; j != v20; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v31 != v21)
                          objc_enumerationMutation(v18);
                        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
                        if (objc_msgSend(v23, "active:", v7))
                          objc_msgSend(v23, "markWithMutationMs:", a3);
                      }
                      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                    }
                    while (v20);
                  }

                }
              }
              v14 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v14);
          }

          v10 = v24;
          v6 = v25;
          v9 = v26;
          v11 = v28;
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v9);
  }

}

- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v9, "timestampMs") / 1000.0));
  if (v7 && objc_msgSend(v7, "active:", v8))
    objc_msgSend(v7, "updateWithOptInOutMutation:error:", v9, a4);

}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  void *v6;
  KTAccount *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountKeyHash"));
  v7 = (KTAccount *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsMutation"));
  -[KTTransparentData markAccountsWithMutationMs:except:](self, "markAccountsWithMutationMs:except:", objc_msgSend(v8, "mutationMs"), v7);

  if (v7)
  {
    -[KTAccount updateWithAddMutation:error:](v7, "updateWithAddMutation:error:", v9, a4);
  }
  else
  {
    v7 = -[KTAccount initWithMutation:]([KTAccount alloc], "initWithMutation:", v9);
    -[KTTransparentData addAccountsObject:](self, "addAccountsObject:", v7);
  }

}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountKeyHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKeyHash:](self, "accountForAccountKeyHash:", v6));

  if (v7)
    objc_msgSend(v7, "updateWithMarkDeleteMutation:error:", v8, a4);

}

- (void)cleanupAccounts
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "cleanupDevices", (_QWORD)v11);
        if (objc_msgSend(v10, "shouldRemove"))
          -[KTTransparentData removeAccountsObject:](self, "removeAccountsObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)deleteMarkedEntries:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)a3 / 1000.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "marked:", v4, (_QWORD)v13))
          -[KTTransparentData removeAccountsObject:](self, "removeAccountsObject:", v12);
        objc_msgSend(v12, "deleteMarkedEntries:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)updateWithMutation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  _DWORD v21[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uriVRFOutput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
  v9 = objc_msgSend(v7, "isEqualToData:", v8);

  if ((v9 & 1) != 0)
  {
    switch(objc_msgSend(v6, "mutationType"))
    {
      case 1u:
      case 4u:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceMutation"));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceMutation"));
          -[KTTransparentData updateWithAddMutation:error:](self, "updateWithAddMutation:error:", v11, a4);
          goto LABEL_25;
        }
        if (qword_1002A7558 != -1)
          dispatch_once(&qword_1002A7558, &stru_100245E00);
        v12 = qword_1002A7560;
        if (!os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
          break;
        LOWORD(v21[0]) = 0;
        v13 = "Add mutation doesn't have idsDeviceMutation object";
        goto LABEL_11;
      case 2u:
      case 5u:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceMutation"));

        if (v15)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDeviceMutation"));
          -[KTTransparentData updateWithMarkDeleteMutation:error:](self, "updateWithMarkDeleteMutation:error:", v11, a4);
          goto LABEL_25;
        }
        if (qword_1002A7558 != -1)
          dispatch_once(&qword_1002A7558, &stru_100245E20);
        v12 = qword_1002A7560;
        if (!os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
          break;
        LOWORD(v21[0]) = 0;
        v13 = "Mark mutation doesn't have idsDeviceMutation object";
        goto LABEL_11;
      case 3u:
        if (qword_1002A7558 != -1)
          dispatch_once(&qword_1002A7558, &stru_100245E40);
        v18 = qword_1002A7560;
        if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "WARNING: Skipping deprecated mutation type OPT_IN_OUT_MUTATION", (uint8_t *)v21, 2u);
        }
        goto LABEL_26;
      case 6u:
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "optInOutMutation"));

        if (v19)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "optInOutMutation"));
          -[KTTransparentData updateWithOptInOutMutation:error:](self, "updateWithOptInOutMutation:error:", v11, a4);
LABEL_25:

LABEL_26:
          -[KTTransparentData cleanupAccounts](self, "cleanupAccounts");
          v14 = 1;
          goto LABEL_27;
        }
        if (qword_1002A7558 != -1)
          dispatch_once(&qword_1002A7558, &stru_100245E60);
        v12 = qword_1002A7560;
        if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21[0]) = 0;
          v13 = "optInOutWithSync mutation doesn't have OptInOutMutation object";
          goto LABEL_11;
        }
        break;
      default:
        if (qword_1002A7558 != -1)
          dispatch_once(&qword_1002A7558, &stru_100245E80);
        v16 = (void *)qword_1002A7560;
        if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
        {
          v17 = v16;
          v21[0] = 67109120;
          v21[1] = objc_msgSend(v6, "mutationType");
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "unknown mutation type %d, continuing anyway", (uint8_t *)v21, 8u);

        }
        goto LABEL_26;
    }
  }
  else
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -86, CFSTR("smt has different URI VRF output than computed in witness")));
    if (qword_1002A7558 != -1)
      dispatch_once(&qword_1002A7558, &stru_100245DE0);
    v12 = qword_1002A7560;
    if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      v13 = "smt has different URI VRF output than computed in witness";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v21, 2u);
    }
  }
  v14 = 0;
LABEL_27:

  return v14;
}

- (BOOL)updateWithSMTs:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData mutationsFromSMTs:error:](self, "mutationsFromSMTs:error:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData sortMutationsByTimestamp:error:](self, "sortMutationsByTimestamp:error:", v6, a4));

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          if (!-[KTTransparentData updateWithMutation:error:](self, "updateWithMutation:error:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), a4, (_QWORD)v15))
          {
            v13 = 0;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_12:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)filterLoggableDatas:(id)a3 deviceIdHash:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceIdHash", (_QWORD)v21));

        if (!v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
          objc_msgSend(v14, "computeHashesForSalt:", v16);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceIdHash"));
        v18 = objc_msgSend(v17, "isEqualToData:", v7);

        if (v18)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    v19 = v8;
  else
    v19 = 0;

  return v19;
}

- (id)filterLoggableDatas:(id)a3 clientDataHash:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientDataHash", (_QWORD)v21));

        if (!v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](self, "uriVRFOutput"));
          objc_msgSend(v14, "computeHashesForSalt:", v16);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientDataHash"));
        v18 = objc_msgSend(v17, "isEqualToData:", v7);

        if (v18)
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    v19 = v8;
  else
    v19 = 0;

  return v19;
}

- (id)failedRecordsForSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  TransparencyError *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  void *v78;
  id v79;
  id *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  const __CFString *v85;
  id v87;
  void *v88;
  uint64_t v89;
  id v90;
  __CFString *obj;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  id *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  KTTransparentData *v101;
  void *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[2];
  _QWORD v113[2];
  uint8_t buf[4];
  uint64_t v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  id v119;
  __int16 v120;
  id v121;
  _BYTE v122[128];
  const __CFString *v123;
  void *v124;
  _BYTE v125[128];
  const __CFString *v126;
  const __CFString *v127;

  v90 = a3;
  v12 = a4;
  v100 = a5;
  v95 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v12));
  v88 = v13;
  if (v13)
  {
    v96 = a7;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "devices"));
    v94 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
    if (v94)
    {
      v87 = v12;
      v93 = *(_QWORD *)v109;
      v101 = self;
      while (1)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v109 != v93)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v102 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "deviceIDHash"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "fetchSyncedLoggableDataByDeviceIdHash:", v17));

          if (v18)
          {
            if (qword_1002A7558 != -1)
              dispatch_once(&qword_1002A7558, &stru_100245EC0);
            v19 = (void *)qword_1002A7560;
            if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_DEBUG))
            {
              v20 = v19;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceID"));
              v97 = v14;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "kt_hexString"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceIDHash"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "kt_hexString"));
              v26 = objc_msgSend(v18, "count");
              *(_DWORD *)buf = 138412802;
              v115 = (uint64_t)v23;
              v116 = 2112;
              v117 = v25;
              v118 = 1024;
              LODWORD(v119) = v26;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CloudDevices: found device %@ with deviceIDHash: %@: %d", buf, 0x1Cu);

              self = v101;
              v14 = v97;

            }
            objc_msgSend(v16, "addObjectsFromArray:", v18);
          }
          if ((objc_msgSend(v100, "disableKTSyncabledKVSStore") & 1) == 0)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceIDHash"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData filterLoggableDatas:deviceIdHash:](self, "filterLoggableDatas:deviceIdHash:", v90, v27));

            if (v28)
            {
              if (qword_1002A7558 != -1)
                dispatch_once(&qword_1002A7558, &stru_100245EE0);
              v29 = (void *)qword_1002A7560;
              if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_DEBUG))
              {
                v30 = v29;
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
                v98 = v14;
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceID"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "kt_hexString"));
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceIDHash"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "kt_hexString"));
                v36 = objc_msgSend(v28, "count");
                *(_DWORD *)buf = 138412802;
                v115 = (uint64_t)v33;
                v116 = 2112;
                v117 = v35;
                v118 = 1024;
                LODWORD(v119) = v36;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "KVS: found device %@ with deviceIDHash: %@: %d", buf, 0x1Cu);

                v14 = v98;
                self = v101;

              }
              objc_msgSend(v16, "addObjectsFromArray:", v28);

            }
          }
          v103 = v16;
          if (!objc_msgSend(v16, "count"))
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceIDHash"));
            v60 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "kt_hexString"));

            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "addedDate"));
            v62 = objc_msgSend(v61, "compare:", v95);

            if (v62 == (id)1)
            {
              v41 = (void *)v60;
              if (qword_1002A7558 != -1)
                dispatch_once(&qword_1002A7558, &stru_100245F00);
              v63 = (void *)qword_1002A7560;
              if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_DEBUG))
              {
                v64 = v63;
                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "addedDate"));
                *(_DWORD *)buf = 138412802;
                v115 = v60;
                v116 = 2112;
                v117 = v65;
                v118 = 2112;
                v119 = v95;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "skipping device (%@) added %@ after request time %@", buf, 0x20u);

              }
              v58 = 3;
              goto LABEL_69;
            }
            v72 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -99, *v96, CFSTR("Unknown device in Transparent Data with deviceIdHash %@"), v60));
            if (objc_msgSend(v102, "marked:", v95))
            {
              v41 = (void *)v60;
              v73 = +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -107, *v96, CFSTR("Unknown marked device in Transparent Data with deviceIdHash %@"), v60);
              goto LABEL_61;
            }
            v41 = (void *)v60;
            if (objc_msgSend(v102, "expired:", v95))
            {
              v73 = +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -161, *v96, CFSTR("Unknown expired device in Transparent Data with deviceIdHash %@"), v60);
LABEL_61:
              v76 = objc_claimAutoreleasedReturnValue(v73);

              v72 = (void *)v76;
            }
            if (qword_1002A7558 != -1)
              dispatch_once(&qword_1002A7558, &stru_100245F20);
            v77 = qword_1002A7560;
            if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v115 = (uint64_t)v41;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Unknown device in Transparent Data with deviceIdHash %{public}@", buf, 0xCu);
            }
            if (v72)
              *v96 = objc_retainAutorelease(v72);
            v123 = CFSTR("failedDeviceIdHash");
            v124 = v41;
            v58 = 1;
            v89 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));

            goto LABEL_69;
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "deviceID"));
          objc_msgSend(v102, "setDeviceID:", v38);

          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "clientDatas"));
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
          v41 = v39;
          if (!v40)
          {
            v58 = 0;
            goto LABEL_69;
          }
          v42 = v40;
          v92 = v18;
          v99 = v14;
          v43 = *(_QWORD *)v105;
          while (2)
          {
            v44 = 0;
            do
            {
              if (*(_QWORD *)v105 != v43)
                objc_enumerationMutation(v39);
              v45 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v44);
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "clientDataHash"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData filterLoggableDatas:clientDataHash:](self, "filterLoggableDatas:clientDataHash:", v103, v46));

              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectAtIndexedSubscript:", 0));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "clientData"));
                objc_msgSend(v45, "setClientData:", v49);

                objc_msgSend(v45, "setSynced:", 1);
              }
              else
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "deviceID"));
                v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "kt_hexString"));

                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "clientDataHash"));
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "kt_hexString"));

                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "addedDate"));
                v54 = objc_msgSend(v53, "compare:", v95);

                if (v54 != (id)1)
                {
                  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "addedDate"));
                  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "markedForDeletion"));
                  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "expiry"));
                  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown client data in Transparent Data for device {%@, %@, %@, %@, %@}"), v47, v52, v66, v67, v68));

                  v70 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -100, *v96, CFSTR("%@"), v69));
                  if ((objc_msgSend(v45, "marked:", v95) & 1) != 0)
                  {
                    v71 = -108;
                    self = v101;
                    goto LABEL_50;
                  }
                  self = v101;
                  if (objc_msgSend(v45, "expired:", v95))
                  {
                    v71 = -162;
LABEL_50:
                    v74 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), v71, *v96, CFSTR("%@"), v69));

                    v70 = (void *)v74;
                  }
                  if (qword_1002A7558 != -1)
                    dispatch_once(&qword_1002A7558, &stru_100245F60);
                  v75 = qword_1002A7560;
                  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v115 = (uint64_t)v69;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }
                  if (v70)
                    *v96 = objc_retainAutorelease(v70);
                  v112[0] = CFSTR("failedDeviceId");
                  v112[1] = CFSTR("failedClientDataHash");
                  v113[0] = v47;
                  v113[1] = v52;
                  v89 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112, 2));

                  v58 = 1;
                  goto LABEL_58;
                }
                if (qword_1002A7558 != -1)
                  dispatch_once(&qword_1002A7558, &stru_100245F40);
                v55 = (void *)qword_1002A7560;
                if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_DEBUG))
                {
                  v56 = v55;
                  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "addedDate"));
                  *(_DWORD *)buf = 138413058;
                  v115 = (uint64_t)v47;
                  v116 = 2112;
                  v117 = v52;
                  v118 = 2112;
                  v119 = v57;
                  v120 = 2112;
                  v121 = v95;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "skipping client data (%@,%@) added %@ after request time %@", buf, 0x2Au);

                }
                self = v101;
              }

              v44 = (char *)v44 + 1;
              v39 = v41;
            }
            while (v42 != v44);
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
            if (v42)
              continue;
            break;
          }
          v58 = 0;
LABEL_58:
          v14 = v99;
          v18 = v92;
LABEL_69:

          if (v58 != 3 && v58)
          {
            v12 = v87;
            v78 = (void *)v89;
            goto LABEL_86;
          }
          v14 = (char *)v14 + 1;
        }
        while (v14 != v94);
        v94 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v108, v125, 16);
        if (!v94)
        {
          v78 = 0;
          v12 = v87;
          goto LABEL_86;
        }
      }
    }
    v78 = 0;
    goto LABEL_86;
  }
  if (a7)
  {
    v79 = *a7;
    v80 = a7;
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
    *v80 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", CFSTR("TransparencyErrorVerify"), -98, v79, CFSTR("No transparent data for accountKey %@"), v81));

  }
  if (qword_1002A7558 != -1)
    dispatch_once(&qword_1002A7558, &stru_100245EA0);
  v82 = (void *)qword_1002A7560;
  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
  {
    v83 = v82;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
    *(_DWORD *)buf = 138412290;
    v115 = (uint64_t)v84;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %@", buf, 0xCu);

  }
  v126 = CFSTR("failedAccountKey");
  if (v12)
    v85 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "base64EncodedStringWithOptions:", 0));
  else
    v85 = CFSTR("NULL");
  obj = (__CFString *)v85;
  v127 = v85;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1));
  if (v12)
LABEL_86:

  return v78;
}

- (BOOL)validateAndUpdateWithSyncedLoggableDatas:(id)a3 accountKey:(id)a4 cloudDevices:(id)a5 requestDate:(id)a6 error:(id *)a7
{
  void *v7;
  BOOL v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failedRecordsForSyncedLoggableDatas:accountKey:cloudDevices:requestDate:error:](self, "failedRecordsForSyncedLoggableDatas:accountKey:cloudDevices:requestDate:error:", a3, a4, a5, a6, a7));
  v8 = v7 == 0;

  return v8;
}

- (BOOL)validateOtherAccountsInactiveForAccount:(id)a3 at:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v8 = a3;
  v9 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->_accounts;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "isEqual:", v8) & 1) == 0
          && objc_msgSend(v15, "active:", v9))
        {
          if (a5)
          {
            v28 = a5;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountKeyHash"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountKeyHash"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_hexString"));
            *v28 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -91, CFSTR("verifying (%@), other accountKey (%@) has active records"), v18, v20));

          }
          if (qword_1002A7558 != -1)
            dispatch_once(&qword_1002A7558, &stru_100245F80);
          v21 = (void *)qword_1002A7560;
          if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountKeyHash"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "kt_hexString"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountKeyHash"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "kt_hexString"));
            *(_DWORD *)buf = 138412546;
            v34 = v24;
            v35 = 2112;
            v36 = v26;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "verifying (%@), other accountKey (%@) has active records", buf, 0x16u);

          }
          v16 = 0;
          goto LABEL_18;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)validateActiveClientDatas:(id)a3 at:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v6 = a4;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "devices"));
  v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v30)
  {
    v8 = *(_QWORD *)v40;
    v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    v34 = v7;
    v29 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v7);
        v31 = v10;
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[491], "array"));
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v33 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientDatas"));
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v36;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v36 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v18, "active:", v6))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "applicationVersion")));
                v20 = objc_msgSend(v12, "containsObject:", v19);

                if (v20)
                {
                  if (a5)
                  {
                    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deviceIDHash"));
                    *a5 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -92, CFSTR("muliple active client datas for deviceIdHash %@ appVersion %lu"), v23, objc_msgSend(v18, "applicationVersion")));

                  }
                  if (qword_1002A7558 != -1)
                    dispatch_once(&qword_1002A7558, &stru_100245FA0);
                  v24 = (void *)qword_1002A7560;
                  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
                  {
                    v25 = v24;
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deviceIDHash"));
                    v27 = objc_msgSend(v18, "applicationVersion");
                    *(_DWORD *)buf = 138412546;
                    v44 = v26;
                    v45 = 2048;
                    v46 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "muliple active client datas for deviceIdHash %@ appVersion %lu", buf, 0x16u);

                  }
                  v22 = 0;
                  v7 = v34;
                  goto LABEL_27;
                }
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "applicationVersion")));
                objc_msgSend(v12, "addObject:", v21);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
            if (v15)
              continue;
            break;
          }
        }

        v10 = v31 + 1;
        v7 = v34;
        v8 = v29;
        v9 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
      }
      while ((id)(v31 + 1) != v30);
      v22 = 1;
      v30 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v30);
  }
  else
  {
    v22 = 1;
  }
LABEL_27:

  return v22;
}

- (BOOL)verifyServerInvariantsAt:(id)a3 error:(id *)a4
{
  id v6;
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

  v6 = a3;
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts", 0));
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
        if (objc_msgSend(v12, "active:", v6)
          && !-[KTTransparentData validateOtherAccountsInactiveForAccount:at:error:](self, "validateOtherAccountsInactiveForAccount:at:error:", v12, v6, a4)|| !-[KTTransparentData validateActiveClientDatas:at:error:](self, "validateActiveClientDatas:at:error:", v12, v6, a4))
        {
          v13 = 0;
          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_15:

  return v13;
}

+ (void)addResult:(unint64_t)a3 failure:(id)a4 toLoggableDatas:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = a4;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "setResult:", a3);
        objc_msgSend(v13, "setFailure:", v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)failureResult:(id)a3 loggableData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("failedAccountKey"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("failedDeviceId"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientData"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("failedClientData"));

  }
  return v7;
}

- (id)failedServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _UNKNOWN **v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  char *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  id v99;
  id obj;
  void *v101;
  uint64_t v102;
  id v103;
  void *v104;
  void *v105;
  char *v106;
  id v107;
  id v108;
  void *v109;
  id *v110;
  KTTransparentData *v111;
  uint64_t v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[4];
  void *v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  double v129;
  _BYTE v130[128];
  _BYTE v131[128];
  void *v132;

  v10 = a3;
  v11 = a4;
  v111 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v11));
  v110 = a6;
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v99 = v10;
    obj = v10;
    v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
    v14 = 0;
    if (!v103)
      goto LABEL_58;
    v102 = *(_QWORD *)v119;
    v15 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    v108 = v11;
    v109 = v13;
    v101 = v12;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v119 != v102)
          objc_enumerationMutation(obj);
        v106 = (char *)v16;
        v17 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIdHash"));

        if (!v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData uriVRFOutput](v111, "uriVRFOutput"));
          objc_msgSend(v17, "computeHashesForSalt:", v19);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceIdHash"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceForDeviceIdHash:", v20));

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
          objc_msgSend(v21, "setDeviceID:", v22);

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "deviceID"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "kt_hexString"));

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientDataHash"));
          v105 = v21;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientRecordsForHash:", v25));

          v104 = v26;
          if (v26)
          {
            v113 = (void *)v24;
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            v107 = v26;
            v27 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
            if (!v27)
              goto LABEL_37;
            v28 = v27;
            v112 = *(_QWORD *)v115;
            while (1)
            {
              v29 = 0;
              do
              {
                if (*(_QWORD *)v115 != v112)
                  objc_enumerationMutation(v107);
                v30 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[472], "dateWithTimeIntervalSinceReferenceDate:", a5));
                v32 = objc_msgSend(v30, "marked:", v31);

                if (v32)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "markedForDeletion"));
                  objc_msgSend(v33, "timeIntervalSinceReferenceDate");
                  v35 = a5 - v34;

                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("idsResponseTime"));

                  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "markedForDeletion"));
                  objc_msgSend(v38, "timeIntervalSinceReferenceDate");
                  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, CFSTR("markedForDeletion"));

                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v11, CFSTR("accountKey"));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v113, CFSTR("deviceID"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, CFSTR("clientData"));

                  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v35));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v41, CFSTR("since"));

                  v42 = v35;
                  v43 = v42;
                  v44 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:", CFSTR("TransparencyErrorVerify"), -96, 2, 0, v36, CFSTR("Transparent data is marked for deletion since %.2f"), v42));

                  if (qword_1002A7558 != -1)
                    dispatch_once(&qword_1002A7558, &stru_100246020);
                  v45 = (void *)qword_1002A7560;
                  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
                  {
                    v46 = v45;
                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
                    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
                    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "kt_hexString"));
                    *(_DWORD *)buf = 138544130;
                    v123 = v47;
                    v124 = 2114;
                    v125 = (uint64_t)v113;
                    v126 = 2112;
                    v127 = v49;
                    v128 = 2048;
                    v129 = v43;
                    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@ is marked since %.2f", buf, 0x2Au);

                    v11 = v108;
                  }
                  v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failureResult:loggableData:](v111, "failureResult:loggableData:", v11, v17));
                  objc_msgSend(v109, "addObject:", v50);

                  objc_msgSend(v17, "setResult:", 0);
                  objc_msgSend(v17, "setFailure:", v44);
                  objc_msgSend(v17, "setMarked:", 1);
                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "escrowExpiry"));
                  objc_msgSend(v17, "setMarkExpiryDate:", v51);

                  v52 = v110;
                  v15 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
                  if (!v110)
                    goto LABEL_31;
                  goto LABEL_29;
                }
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[472], "dateWithTimeIntervalSinceReferenceDate:", a5));
                v54 = objc_msgSend(v30, "expired:", v53);

                if (v54)
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v55, CFSTR("idsResponseTime"));

                  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "expiry"));
                  objc_msgSend(v56, "timeIntervalSinceReferenceDate");
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v57, CFSTR("expire"));

                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v11, CFSTR("accountKey"));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v113, CFSTR("deviceID"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
                  objc_msgSend(v36, "setObject:forKeyedSubscript:", v58, CFSTR("clientData"));

                  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "expiry"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:", CFSTR("TransparencyErrorVerify"), -238, 2, 0, v36, CFSTR("Transparent data for accountKey is expired since %@"), v59));

                  if (qword_1002A7558 != -1)
                    dispatch_once(&qword_1002A7558, &stru_100246040);
                  v60 = (void *)qword_1002A7560;
                  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
                  {
                    v61 = v60;
                    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
                    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "kt_hexString"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "expiry"));
                    *(_DWORD *)buf = 138544130;
                    v123 = v108;
                    v124 = 2114;
                    v125 = (uint64_t)v113;
                    v126 = 2112;
                    v127 = v63;
                    v128 = 2112;
                    v129 = *(double *)&v64;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "Transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@ is expired since %@", buf, 0x2Au);

                  }
                  v11 = v108;
                  v65 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failureResult:loggableData:](v111, "failureResult:loggableData:", v108, v17));
                  objc_msgSend(v109, "addObject:", v65);

                  objc_msgSend(v17, "setResult:", 0);
                  objc_msgSend(v17, "setFailure:", v44);
                  v52 = v110;
                  if (!v110)
                    goto LABEL_31;
LABEL_29:
                  if (v44)
                    *v52 = objc_retainAutorelease(v44);
LABEL_31:

                  v14 = v44;
                  goto LABEL_32;
                }
                v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
                objc_msgSend(v30, "setClientData:", v66);

                objc_msgSend(v30, "setVerified:", 1);
                if (objc_msgSend(v17, "result") == (id)2)
                  objc_msgSend(v17, "setResult:", 1);
LABEL_32:
                v29 = (char *)v29 + 1;
              }
              while (v28 != v29);
              v67 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
              v28 = v67;
              if (!v67)
              {
LABEL_37:

                v68 = v14;
                v12 = v101;
                v13 = v109;
                v69 = v105;
                v70 = v106;
                v71 = v113;
                goto LABEL_54;
              }
            }
          }
          v83 = v13;
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "kt_hexString"));
          v71 = (void *)v24;
          v68 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -95, CFSTR("No transparent data for accountKey %@ and deviceId %@ and clientData %@"), v84, v24, v86));

          if (qword_1002A7558 != -1)
            dispatch_once(&qword_1002A7558, &stru_100246000);
          v87 = (void *)qword_1002A7560;
          if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
          {
            v88 = v87;
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientData"));
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "kt_hexString"));
            *(_DWORD *)buf = 138543874;
            v123 = v89;
            v124 = 2114;
            v125 = v24;
            v126 = 2112;
            v127 = v91;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %{public}@ and deviceId %{public}@ and clientData %@", buf, 0x20u);

          }
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failureResult:loggableData:](v111, "failureResult:loggableData:", v11, v17));
          v13 = v83;
          objc_msgSend(v83, "addObject:", v92);

          objc_msgSend(v17, "setResult:", 0);
          objc_msgSend(v17, "setFailure:", v68);
          v15 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
          if (v110)
          {
            v69 = v105;
            v70 = v106;
            v12 = v101;
            if (v68)
            {
              v68 = objc_retainAutorelease(v68);
              *v110 = v68;
            }
          }
          else
          {
            v69 = v105;
            v70 = v106;
            v12 = v101;
          }
LABEL_54:

        }
        else
        {
          v72 = v12;
          v73 = v13;
          v69 = 0;
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "kt_hexString"));
          v68 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -94, CFSTR("No transparent data for accountKey %@ and deviceId %@"), v74, v76));

          if (qword_1002A7558 != -1)
            dispatch_once(&qword_1002A7558, &stru_100245FE0);
          v13 = v73;
          v77 = (void *)qword_1002A7560;
          if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
          {
            v78 = v77;
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceID"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "kt_hexString"));
            *(_DWORD *)buf = 138412546;
            v123 = v79;
            v124 = 2112;
            v125 = (uint64_t)v81;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %@ and deviceId %@", buf, 0x16u);

            v13 = v73;
          }
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failureResult:loggableData:](v111, "failureResult:loggableData:", v11, v17));
          objc_msgSend(v13, "addObject:", v82);

          objc_msgSend(v17, "setResult:", 0);
          objc_msgSend(v17, "setFailure:", v68);
          v15 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
          if (!v110)
          {
            v14 = v68;
            v70 = v106;
            v12 = v72;
            goto LABEL_56;
          }
          v70 = v106;
          v12 = v72;
          if (v68)
          {
            v14 = objc_retainAutorelease(v68);
            *v110 = v14;
            goto LABEL_56;
          }
        }
        v14 = v68;
LABEL_56:

        v16 = v70 + 1;
      }
      while (v16 != v103);
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
      if (!v103)
      {
LABEL_58:

        if (objc_msgSend(v13, "count"))
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v13));
        else
          v93 = 0;
        v10 = v99;
        goto LABEL_70;
      }
    }
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -93, CFSTR("No transparent data for accountKey %@"), v94));

  +[KTTransparentData addResult:failure:toLoggableDatas:](KTTransparentData, "addResult:failure:toLoggableDatas:", 0, v14, v10);
  if (a6 && v14)
    *a6 = objc_retainAutorelease(v14);
  if (qword_1002A7558 != -1)
    dispatch_once(&qword_1002A7558, &stru_100245FC0);
  v95 = (void *)qword_1002A7560;
  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
  {
    v96 = v95;
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
    *(_DWORD *)buf = 138412290;
    v123 = v97;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "No transparent data for accountKey %@", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failureResult:loggableData:](v111, "failureResult:loggableData:", v11, 0));
  v132 = v13;
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v132, 1));
LABEL_70:

  return v93;
}

- (BOOL)validateAndUpdateWithServerLoggableDatas:(id)a3 accountKey:(id)a4 idsResponseTime:(double)a5 error:(id *)a6
{
  void *v6;
  BOOL v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData failedServerLoggableDatas:accountKey:idsResponseTime:error:](self, "failedServerLoggableDatas:accountKey:idsResponseTime:error:", a3, a4, a6, a5));
  v7 = v6 == 0;

  return v7;
}

- (BOOL)validateOptInHistory:(id)a3 accountKey:(id)a4 responseTime:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a4));
  LOBYTE(a6) = objc_msgSend(v12, "validateOptInHistory:responseTime:error:", v11, v10, a6);

  return (char)a6;
}

- (id)earliestAddedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v23;
  id v24;
  id obj;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", 9.22337204e18));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v4));
  v7 = v6;
  if (v6)
  {
    v23 = v6;
    v24 = v4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientDatas"));
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(_QWORD *)v29 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
                v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addedDate"));
                if (v16)
                {
                  v17 = (void *)v16;
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addedDate"));
                  v19 = objc_msgSend(v18, "compare:", v5);

                  if (v19 == (id)-1)
                  {
                    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addedDate"));

                    v5 = (void *)v20;
                  }
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v12);
          }

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v27);
    }

    v7 = v23;
    v4 = v24;
  }
  v21 = v5;

  return v21;
}

- (unint64_t)accountOptInState:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "optInState");
  else
    v5 = 2;

  return v5;
}

- (id)accountOptInRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "optInRecord"));
  else
    v5 = 0;

  return v5;
}

- (id)accountOptInHistory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "optInHistory"));
  else
    v5 = 0;

  return v5;
}

- (unint64_t)accountEverOptedIn:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "everOptedIn");
  else
    v5 = 2;

  return v5;
}

- (unint64_t)accountRecentlyOptedIn:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "recentlyOptedIn");
  else
    v5 = 2;

  return v5;
}

- (unint64_t)verifiedAccountOptInState
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData currentPublicID](self, "currentPublicID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicKeyInfo"));

  v5 = -[KTTransparentData accountOptInState:](self, "accountOptInState:", v4);
  return v5;
}

- (unint64_t)currentAccountOptInState
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accounts](self, "accounts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 2;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v10 = objc_msgSend(v8, "active:", v9);

        if ((v10 & 1) != 0)
        {
          v6 = objc_msgSend(v8, "optInState");
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = 2;
  }
LABEL_12:

  return v6;
}

- (id)currentPublicID
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_accounts;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountKey", (_QWORD)v10));

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountKey"));
          v3 = (id)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v8, 0));

          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)optInAfter:(id)a3 accountKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountOptInRecord:](self, "accountOptInRecord:", a4));
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "optIn"))
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v8, "timestampMs") / 1000.0));
  if (qword_1002A7558 != -1)
    dispatch_once(&qword_1002A7558, &stru_100246060);
  v10 = qword_1002A7560;
  if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "opted-in peer verification failure ids(%@) optin(%@)", (uint8_t *)&v14, 0x16u);
  }
  v11 = objc_msgSend(v6, "compare:", v9);

  if (v11 == (id)-1)
    v12 = 1;
  else
LABEL_8:
    v12 = 0;

  return v12;
}

- (id)expectedSelfResolutionDate:(id)a3 requestDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
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
  uint8_t buf[16];
  _BYTE v43[128];
  _BYTE v44[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountForAccountKey:](self, "accountForAccountKey:", v6));
  v9 = v8;
  if (v8)
  {
    v28 = v8;
    v29 = v6;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "devices"));
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    v10 = 0;
    if (v32)
    {
      v31 = *(_QWORD *)v39;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(obj);
          v33 = v11;
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientDatas"));
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v35 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addedDate"));
                v20 = objc_msgSend(v7, "compare:", v19);

                if (v20 != (id)-1 && (objc_msgSend(v18, "synced") & 1) == 0)
                {
                  if (!v10
                    || (v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "escrowExpiry"))) != 0
                    && (v22 = (void *)v21,
                        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "escrowExpiry")),
                        v24 = objc_msgSend(v10, "compare:", v23),
                        v23,
                        v22,
                        v24 == (id)-1))
                  {
                    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "escrowExpiry"));

                    v10 = (void *)v25;
                  }
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v15);
          }

          v11 = v33 + 1;
        }
        while ((id)(v33 + 1) != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v32);
    }

    v9 = v28;
    v6 = v29;
  }
  else
  {
    if (qword_1002A7558 != -1)
      dispatch_once(&qword_1002A7558, &stru_100246080);
    v26 = qword_1002A7560;
    if (os_log_type_enabled((os_log_t)qword_1002A7560, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "no account record for account key, so no expected resolution date", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)getLogDataForAccountKey:(id)a3 uri:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  void *v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTTransparentData accountOptInHistory:](self, "accountOptInHistory:", v6));
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v15, "timestampMs") / 1000.0));
          v17 = objc_msgSend(objc_alloc((Class)KTOptIOLogState), "initWithURI:smtTimestamp:optIn:", v7, v16, objc_msgSend(v15, "optIn"));
          objc_msgSend(v8, "addObject:", v17);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v12);
    }

    v25 = v7;
    v26 = v8;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSMutableArray)accounts
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)uriVRFOutput
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriVRFOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)currentTreeEpochBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentTreeEpochBeginDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)staticKeyEnforced
{
  return self->_staticKeyEnforced;
}

- (void)setStaticKeyEnforced:(BOOL)a3
{
  self->_staticKeyEnforced = a3;
}

- (NSArray)optInOutHistoryDescription
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)staticKeyStatus
{
  return self->_staticKeyStatus;
}

- (void)setStaticKeyStatus:(unint64_t)a3
{
  self->_staticKeyStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInOutHistoryDescription, 0);
  objc_storeStrong((id *)&self->_currentTreeEpochBeginDate, 0);
  objc_storeStrong((id *)&self->_uriVRFOutput, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end
