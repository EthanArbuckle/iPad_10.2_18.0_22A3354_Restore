@implementation KTAccount

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
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  KTAccount *v32;
  NSMutableArray *obj;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = self;
  obj = self->_devices;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v43;
    v35 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v37 = v4;
        v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("   {\n"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    deviceID:%@\n"), v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIDHash"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    deviceIDHash: %@\n"), v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientDatas"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v39;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v15);
              objc_msgSend(v10, "appendFormat:", CFSTR("     {\n"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clientData"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
              objc_msgSend(v10, "appendFormat:", CFSTR("      clientData:%@\n"), v18);

              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clientDataHash"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_hexString"));
              objc_msgSend(v10, "appendFormat:", CFSTR("      clientDataHash:%@\n"), v20);

              objc_msgSend(v10, "appendFormat:", CFSTR("      appVersion:%lu\n"), objc_msgSend(v16, "applicationVersion"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "addedDate"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "markedForDeletion"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "expiry"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "escrowExpiry"));
              objc_msgSend(v10, "appendFormat:", CFSTR("      addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n"),
                v21,
                v22,
                v23,
                v24);

              objc_msgSend(v10, "appendFormat:", CFSTR("     },\n"));
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v13);
        }

        objc_msgSend(v10, "appendFormat:", CFSTR("    ]"));
        v3 = v35;
        objc_msgSend(v35, "appendFormat:", CFSTR("    clientDatas: %@\n"), v10);
        objc_msgSend(v35, "appendFormat:", CFSTR("   },\n"));

        v4 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v36);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("  ]"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](v32, "accountKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "kt_hexString"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v32, "accountKeyHash"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "kt_hexString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInHistoryDescription](v32, "optInHistoryDescription"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\n  accountKey:%@\n  accountKeyHash:%@\n  optInHistory:%@\n devices: %@\n}"), v26, v28, v29, v3));

  return v30;
}

- (id)optInOutHistoryJsonArray
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "diagnosticsJsonDictionary"));
          objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }
  return v5;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accountKey"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("accountKeyHash"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), "diagnosticsJsonDictionary"));
        objc_msgSend(v9, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("devices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistoryJsonArray](self, "optInOutHistoryJsonArray"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("optInOutHistory"));

  return (NSDictionary *)v3;
}

- (id)optInHistoryDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "optIn"))
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)((unint64_t)objc_msgSend(v11, "timestampMs") / 0x3E8)));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_toISO_8601_UTCString"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v12, v14));

        objc_msgSend(v4, "addObject:", v15);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(",")));
  return v16;
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
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountKeyHash"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("devices"));

  v8 = objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1)
                                                                               + 8 * (_QWORD)v18), "data"));
            if (v19)
              objc_msgSend(v13, "addObject:", v19);

            v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v16);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v13));
      objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("optInOutHistory"));

    }
  }

}

- (KTAccount)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  KTAccount *v34;
  KTAccount *v35;
  id v36;
  void *v37;
  void *v39;
  KTAccount *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  _BYTE v51[128];

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("accountKey"));
  v43 = objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v7), CFSTR("accountKeyHash"));
  v42 = objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_opt_class(NSArray, v9);
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(KTDevice, v11), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("devices")));
  v15 = objc_opt_class(NSArray, v14);
  v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(NSData, v16), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("optInOutHistory")));
  v20 = v19;
  if (v19)
  {
    v39 = v18;
    v40 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v19, "count")));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v44 = 0;
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[OptInOutWithExt parseFromData:error:](OptInOutWithExt, "parseFromData:error:", v27, &v44));
          v29 = v44;
          if (!v28)
          {
            v30 = (void *)v43;
            if (qword_1002A7698 != -1)
              dispatch_once(&qword_1002A7698, &stru_1002470D0);
            v32 = v41;
            v31 = (void *)v42;
            v18 = v39;
            v33 = qword_1002A76A0;
            if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v29;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "failed to parse OptInOut record: %@", buf, 0xCu);
            }

            v34 = 0;
            self = v40;
            goto LABEL_21;
          }
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v24)
          continue;
        break;
      }
    }

    v18 = v39;
    self = v40;
  }
  else
  {
    v21 = 0;
  }
  v35 = objc_alloc_init(KTAccount);
  v34 = v35;
  v31 = (void *)v42;
  v30 = (void *)v43;
  v32 = v41;
  if (v35)
  {
    -[KTAccount setAccountKey:](v35, "setAccountKey:", v43);
    -[KTAccount setAccountKeyHash:](v34, "setAccountKeyHash:", v42);
    v36 = objc_msgSend(v41, "mutableCopy");
    -[KTAccount setDevices:](v34, "setDevices:", v36);

    if (v21)
    {
      -[KTAccount setOptInOutHistory:](v34, "setOptInOutHistory:", v21);
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[KTAccount setOptInOutHistory:](v34, "setOptInOutHistory:", v37);

    }
  }
LABEL_21:

  return v34;
}

- (KTAccount)initWithIdsAccount:(id)a3
{
  id v4;
  KTAccount *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  KTDevice *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  KTAccount *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)KTAccount;
  v5 = -[KTAccount init](&v29, "init");
  if (!v5)
    goto LABEL_15;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountKeyHash"));
  -[KTAccount setAccountKeyHash:](v5, "setAccountKeyHash:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[KTAccount setDevices:](v5, "setDevices:", v7);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devicesArray"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = -[KTDevice initWithIdsDevice:]([KTDevice alloc], "initWithIdsDevice:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](v5, "devices"));
        objc_msgSend(v14, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v10);
  }

  v24 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedOptInOutHistory:", &v24));
  v16 = v24;
  v17 = objc_msgSend(v15, "mutableCopy");
  -[KTAccount setOptInOutHistory:](v5, "setOptInOutHistory:", v17);

  if (v16)
  {
    if (qword_1002A7698 != -1)
      dispatch_once(&qword_1002A7698, &stru_1002470F0);
    v18 = (void *)qword_1002A76A0;
    if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v5, "accountKeyHash"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "kt_hexString"));
      *(_DWORD *)buf = 138412546;
      v31 = v21;
      v32 = 2112;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create account for %@: %@", buf, 0x16u);

    }
    v22 = 0;
  }
  else
  {
LABEL_15:
    v22 = v5;
  }

  return v22;
}

- (KTAccount)initWithMutation:(id)a3
{
  id v4;
  KTAccount *v5;
  uint64_t v6;
  NSData *accountKeyHash;
  KTDevice *v8;
  uint64_t v9;
  NSMutableArray *devices;
  uint64_t v11;
  NSMutableArray *optInOutHistory;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  KTAccount *v18;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)KTAccount;
  v5 = -[KTAccount init](&v21, "init");
  if (!v5)
    goto LABEL_9;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountKeyHash"));
  accountKeyHash = v5->_accountKeyHash;
  v5->_accountKeyHash = (NSData *)v6;

  v8 = -[KTDevice initWithMutation:]([KTDevice alloc], "initWithMutation:", v4);
  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
  devices = v5->_devices;
  v5->_devices = (NSMutableArray *)v9;

  v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  optInOutHistory = v5->_optInOutHistory;
  v5->_optInOutHistory = (NSMutableArray *)v11;

  v14 = objc_opt_class(IdsDeviceMutationWithExt, v13);
  if ((objc_opt_isKindOfClass(v4, v14) & 1) == 0)
    goto LABEL_9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extensions"));
  v20 = 0;
  -[KTAccount updateWithExtensions:error:](v5, "updateWithExtensions:error:", v15, &v20);
  v16 = v20;

  if (v16)
  {
    if (qword_1002A7698 != -1)
      dispatch_once(&qword_1002A7698, &stru_100247110);
    v17 = qword_1002A76A0;
    if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "unable to create account record: %@", buf, 0xCu);
    }

    v18 = 0;
  }
  else
  {
LABEL_9:
    v18 = v5;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  KTAccount *v5;
  uint64_t v6;
  KTAccount *v7;
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

  v5 = (KTAccount *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(KTAccount, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
      v9 = objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](v7, "accountKey"));
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](self, "accountKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKey](v7, "accountKey"));
        v13 = objc_msgSend(v11, "isEqualToData:", v12);

        if (!v13)
          goto LABEL_15;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
      v16 = objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v7, "accountKeyHash"));
      if (v15 == (void *)v16)
      {

      }
      else
      {
        v17 = (void *)v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](self, "accountKeyHash"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount accountKeyHash](v7, "accountKeyHash"));
        v20 = objc_msgSend(v18, "isEqualToData:", v19);

        if (!v20)
          goto LABEL_15;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
      v22 = objc_claimAutoreleasedReturnValue(-[KTAccount devices](v7, "devices"));
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](v7, "devices"));
        v26 = objc_msgSend(v24, "isEqual:", v25);

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

- (BOOL)marked:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "marked:", v4))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)expired:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "expired:", v4))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)active:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "active:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)deviceForDeviceIdHash:(id)a3
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
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_devices;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIDHash", (_QWORD)v15));
          v12 = objc_msgSend(v11, "isEqualToData:", v4);

          if ((v12 & 1) != 0)
          {
            v13 = v10;

            goto LABEL_15;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    goto LABEL_14;
  }
  if (-[NSMutableArray count](self->_devices, "count") != (id)1)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", 0));
LABEL_15:

  return v13;
}

- (id)optInRecord
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)optInHistory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    else
      v3 = 0;
  }
  return v3;
}

- (BOOL)optInState
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInRecord](self, "optInRecord"));
  v3 = objc_msgSend(v2, "optIn");

  return v3;
}

- (BOOL)everOptedIn
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (id)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0));
      v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v6);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "optIn") & 1) != 0)
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
          v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v3)
            continue;
          break;
        }
      }
LABEL_13:

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (BOOL)recentlyOptedIn
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (id)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory", 0));
      v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v6);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "optIn") & 1) != 0)
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
          v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v3)
            continue;
          break;
        }
      }
LABEL_13:

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (id)kvsOptInOutEntry:(id)a3 before:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
  v9 = objc_msgSend(v6, "compare:", v8);

  if (v9 == (id)-1)
  {
    v11 = (char *)objc_msgSend(v5, "count") - 1;
    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
      v14 = objc_msgSend(v6, "compare:", v13);

      if (v14 != (id)-1)
        break;
      if (--v11 == (char *)-1)
        goto LABEL_8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v11));
    if (v10)
      goto LABEL_9;
LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
    v17 = objc_msgSend(v16, "BOOLValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0));
    v21[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17 ^ 1));
    v21[1] = v19;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  }
LABEL_9:

  return v10;
}

- (BOOL)validateEmptyOptInOutHistory:(id)a3 responseTime:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v28;
  uint8_t v29[16];
  uint8_t buf[16];
  uint8_t v31[16];
  uint8_t v32[16];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v11 = (unint64_t)objc_msgSend(v10, "count");

  v12 = (unint64_t)objc_msgSend(v8, "count");
  if (!(v11 | v12))
  {
LABEL_2:
    v13 = 1;
    goto LABEL_29;
  }
  if (v11)
  {
    if (!v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
      v16 = objc_msgSend(v15, "optIn");

      if (!v16)
      {
        if (qword_1002A7698 != -1)
          dispatch_once(&qword_1002A7698, &stru_100247190);
        v28 = qword_1002A76A0;
        if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "opt-in state match: kvs = <null>; kt = 0",
            v29,
            2u);
        }
        goto LABEL_2;
      }
      if (qword_1002A7698 != -1)
        dispatch_once(&qword_1002A7698, &stru_100247170);
      v17 = qword_1002A76A0;
      if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "opt-in state mismatch: kvs = <null>; kt = 1",
          buf,
          2u);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -289, CFSTR("Opt-in state mismatch: kvs = <null>; kt = 1")));
      v19 = v18;
      if (a5 && v18)
        *a5 = objc_retainAutorelease(v18);

    }
    v13 = 0;
    goto LABEL_29;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount kvsOptInOutEntry:before:](self, "kvsOptInOutEntry:before:", v8, v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", 1));
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    if (qword_1002A7698 != -1)
      dispatch_once(&qword_1002A7698, &stru_100247130);
    v23 = qword_1002A76A0;
    if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "opt-in state mismatch: kvs = 1; kt = <null>",
        v32,
        2u);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -289, CFSTR("Opt-in state mismatch: kvs = 1; kt = <null>")));
    v25 = v24;
    if (a5 && v24)
      *a5 = objc_retainAutorelease(v24);

  }
  else
  {
    if (qword_1002A7698 != -1)
      dispatch_once(&qword_1002A7698, &stru_100247150);
    v26 = qword_1002A76A0;
    if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "opt-in state match: kvs = 0; kt = <null>",
        v31,
        2u);
    }
  }
  v13 = v22 ^ 1;

LABEL_29:
  return v13;
}

- (BOOL)validateOptInHistory:(id)a3 responseTime:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  _BYTE v41[10];
  unint64_t v42;
  _BYTE v43[128];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount kvsOptInOutEntry:before:](self, "kvsOptInOutEntry:before:", v8, v9));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
      v14 = objc_msgSend(v13, "BOOLValue");

      if ((_DWORD)v14 == -[KTAccount optInState](self, "optInState"))
      {
        if (!(_DWORD)v14)
        {
          v19 = 1;
LABEL_34:

          goto LABEL_35;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v20, "timeIntervalSince1970");
        v22 = v21;

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "reverseObjectEnumerator"));

        v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
        if (v24)
        {
          v25 = v24;
          v35 = v12;
          v26 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v37 != v26)
                objc_enumerationMutation(v18);
              v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
              if ((unint64_t)v22 < (unint64_t)objc_msgSend(v28, "timestampMs") / 0x3E8
                && (objc_msgSend(v28, "optIn") & 1) == 0)
              {
                if (qword_1002A7698 != -1)
                  dispatch_once(&qword_1002A7698, &stru_1002471D0);
                v12 = v35;
                v29 = (void *)qword_1002A76A0;
                if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
                {
                  v30 = v29;
                  v31 = (unint64_t)objc_msgSend(v28, "timestampMs");
                  *(_DWORD *)buf = 134218240;
                  *(_QWORD *)v41 = v31 / 0x3E8;
                  *(_WORD *)&v41[8] = 2048;
                  v42 = (unint64_t)v22;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Detected opt-out at %llu after kvs opt-in at %llu", buf, 0x16u);

                }
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -322, CFSTR("Detected opt-out at %llu after kvs opt-in at %llu"), (unint64_t)objc_msgSend(v28, "timestampMs") / 0x3E8, (unint64_t)v22));
                v33 = v32;
                if (a5 && v32)
                  *a5 = objc_retainAutorelease(v32);

                v19 = 0;
                goto LABEL_33;
              }
            }
            v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
            v19 = 1;
            if (v25)
              continue;
            break;
          }
          v12 = v35;
        }
        else
        {
          v19 = 1;
        }
      }
      else
      {
        if (qword_1002A7698 != -1)
          dispatch_once(&qword_1002A7698, &stru_1002471B0);
        v15 = (void *)qword_1002A76A0;
        if (os_log_type_enabled((os_log_t)qword_1002A76A0, OS_LOG_TYPE_ERROR))
        {
          v16 = v15;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v41 = -[KTAccount optInState](self, "optInState");
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = (_DWORD)v14;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "current opt-in state mismatch: kt = %d, kvs = %d", buf, 0xEu);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorVerify"), -289, CFSTR("Current opt-in state mismatch: kt = %d, kvs = %d"), -[KTAccount optInState](self, "optInState"), v14));
        v18 = v17;
        v19 = 0;
        if (a5 && v17)
        {
          v18 = objc_retainAutorelease(v17);
          v19 = 0;
          *a5 = v18;
        }
      }
LABEL_33:

      goto LABEL_34;
    }
  }
  v19 = -[KTAccount validateEmptyOptInOutHistory:responseTime:error:](self, "validateEmptyOptInOutHistory:responseTime:error:", v8, v9, a5);
LABEL_35:

  return v19;
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  void *v6;
  KTDevice *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceIdHash"));
  v7 = (KTDevice *)objc_claimAutoreleasedReturnValue(-[KTAccount deviceForDeviceIdHash:](self, "deviceForDeviceIdHash:", v6));

  if (v7)
  {
    -[KTDevice updateWithAddMutation:error:](v7, "updateWithAddMutation:error:", v11, a4);
  }
  else
  {
    v7 = -[KTDevice initWithMutation:]([KTDevice alloc], "initWithMutation:", v11);
    -[KTAccount addDevicesObject:](self, "addDevicesObject:", v7);
  }
  v9 = objc_opt_class(IdsDeviceMutationWithExt, v8);
  if ((objc_opt_isKindOfClass(v11, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "extensions"));
    -[KTAccount updateWithExtensions:error:](self, "updateWithExtensions:error:", v10, a4);

  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdHash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount deviceForDeviceIdHash:](self, "deviceForDeviceIdHash:", v6));

  if (v7)
    objc_msgSend(v7, "updateWithMarkDeleteMutation:error:", v8, a4);

}

- (void)updateWithDeviceStateArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "deviceIdHash"));
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v11));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "deviceIDHash"));
          v20 = objc_msgSend(v4, "containsObject:", v19);

          if ((v20 & 1) != 0)
          {
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_10012F9FC;
            v25[3] = &unk_1002471F8;
            v25[4] = v18;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexesOfObjectsPassingTest:", v25));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectsAtIndexes:", v21));
            objc_msgSend(v18, "updateWithDeviceStateArray:", v22);

          }
          else
          {
            -[KTAccount removeDevicesObject:](self, "removeDevicesObject:", v18);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v15);
    }

    v3 = v23;
  }

}

- (void)updateWithExtensions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "extensionType", (_QWORD)v15) == 3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "extensionData"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[OptInOutWithExt parseFromData:error:](OptInOutWithExt, "parseFromData:error:", v12, 0));

          if (-[KTAccount updateWithOptInOutWithExt:error:](self, "updateWithOptInOutWithExt:error:", v13, a4)
            && objc_msgSend(v13, "optIn"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v13, "timestampMs") / 1000.0));
            -[KTAccount deleteMarkedEntries:](self, "deleteMarkedEntries:", v14);

          }
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

}

- (BOOL)updateWithOptInOutWithExt:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  char v32;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v9 = v8;
  if (!v7)
    goto LABEL_5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  v11 = objc_msgSend(v10, "timestampMs");
  v12 = objc_msgSend(v5, "timestampMs");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
  v14 = v13;
  if (v11 >= v12)
  {
    v18 = objc_msgSend(v13, "count");

    v19 = 0;
    if (v18)
    {
      while (1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v19));
        LOBYTE(v18) = objc_msgSend(v5, "isEqual:", v21);

        if ((v18 & 1) != 0)
          break;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v19));
        v24 = objc_msgSend(v23, "timestampMs");
        v25 = objc_msgSend(v5, "timestampMs");

        if (v24 > v25)
          break;
        ++v19;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
        v27 = objc_msgSend(v26, "count");

        if (v19 >= (unint64_t)v27)
        {
          LOBYTE(v18) = 0;
          goto LABEL_13;
        }
      }
      if (!v19)
        goto LABEL_14;
LABEL_13:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", v19 - 1));
      v31 = objc_msgSend(v30, "optIn");
      v32 = v31 ^ objc_msgSend(v5, "optIn") ^ 1;

    }
    else
    {
LABEL_14:
      v32 = 0;
    }
    v28 = 0;
    if ((v18 & 1) == 0 && (v32 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      objc_msgSend(v9, "insertObject:atIndex:", v5, v19);
      goto LABEL_18;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
    v16 = objc_msgSend(v15, "optIn");
    v17 = objc_msgSend(v5, "optIn");

    if (v16 != v17)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount optInOutHistory](self, "optInOutHistory"));
      v9 = v8;
LABEL_5:
      objc_msgSend(v8, "addObject:", v5);
LABEL_18:

      v28 = 1;
      goto LABEL_19;
    }
    v28 = 0;
  }
LABEL_19:

  return v28;
}

- (void)updateWithOptInOutMutation:(id)a3 error:(id *)a4
{
  OptInOutWithExt *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = -[OptInOutWithExt initWithMutation:]([OptInOutWithExt alloc], "initWithMutation:", v9);
  if (-[KTAccount updateWithOptInOutWithExt:error:](self, "updateWithOptInOutWithExt:error:", v6, a4)
    && -[OptInOut optIn](v6, "optIn"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v9, "timestampMs") / 1000.0));
    -[KTAccount deleteMarkedEntries:](self, "deleteMarkedEntries:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "devicesArray"));
    -[KTAccount updateWithDeviceStateArray:](self, "updateWithDeviceStateArray:", v8);

  }
}

- (void)removeDevicesObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_devices, "removeObject:", a3);
}

- (void)addDevicesObject:(id)a3
{
  -[NSMutableArray addObject:](self->_devices, "addObject:", a3);
}

- (BOOL)shouldRemove
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)cleanupDevices
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
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
        objc_msgSend(v10, "cleanupRecords", (_QWORD)v11);
        if (objc_msgSend(v10, "shouldRemove"))
          -[KTAccount removeDevicesObject:](self, "removeDevicesObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)deleteMarkedEntries:(id)a3
{
  id v4;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccount devices](self, "devices"));
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
          -[KTAccount removeDevicesObject:](self, "removeDevicesObject:", v12);
        objc_msgSend(v12, "deleteMarkedEntries:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountKeyHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)devices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableArray)optInOutHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptInOutHistory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInOutHistory, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_accountKeyHash, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end
