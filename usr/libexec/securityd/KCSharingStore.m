@implementation KCSharingStore

- (KCSharingStore)init
{
  return -[KCSharingStore initWithConnection:accessGroups:metadataDomain:](self, "initWithConnection:accessGroups:metadataDomain:", 0, 0, 0);
}

- (KCSharingStore)initWithConnection:(__OpaqueSecDbConnection *)a3 accessGroups:(id)a4 metadataDomain:(id)a5
{
  id v8;
  __CFString *v9;
  KCSharingStore *v10;
  KCSharingStore *v11;
  KCSharingAccessGroups *v12;
  KCSharingAccessGroups *accessGroups;
  __CFString *v14;
  objc_super v16;

  v8 = a4;
  v9 = (__CFString *)a5;
  v16.receiver = self;
  v16.super_class = (Class)KCSharingStore;
  v10 = -[KCSharingStore init](&v16, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_connection, a3);
    if (v8)
      v12 = (KCSharingAccessGroups *)v8;
    else
      v12 = objc_alloc_init(KCSharingAccessGroups);
    accessGroups = v11->_accessGroups;
    v11->_accessGroups = v12;

    if (v9)
      v14 = v9;
    else
      v14 = CFSTR("KCSharingStoreMetadata");
    objc_storeStrong((id *)&v11->_metadataDomain, v14);
  }

  return v11;
}

- (id)plan
{
  return objc_alloc_init(KCSharingDatabaseUpdatePlan);
}

- (BOOL)withConnection:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id connection;
  int v9;
  BOOL v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  id v17;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = v6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10018D5B8;
  v27 = sub_10018D5C8;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  connection = self->_connection;
  if (!connection)
  {
    v17 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100195EF0;
    v13[3] = &unk_1002E9E48;
    v15 = &v19;
    v14 = v6;
    v16 = &v23;
    if ((sub_100011A30(1, 1, 0, (uint64_t)&v17, (uint64_t)v13) & 1) == 0)
    {
      v11 = v17;
      if (a4)
      {
        *a4 = v17;
        v17 = 0;
      }
      else if (v17)
      {
        v17 = 0;
        CFRelease(v11);
      }

      goto LABEL_13;
    }

    if (*((_BYTE *)v20 + 24))
      goto LABEL_3;
LABEL_6:
    if (a4)
    {
      v10 = 0;
      *a4 = objc_retainAutorelease((id)v24[5]);
      goto LABEL_14;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  obj = 0;
  v9 = (*((uint64_t (**)(id, id, id *))v6 + 2))(v6, connection, &obj);
  objc_storeStrong(&v28, obj);
  *((_BYTE *)v20 + 24) = v9;
  if (!v9)
    goto LABEL_6;
LABEL_3:
  v10 = 1;
LABEL_14:
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (id)fetchValueForMetadataKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  OSStatus v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *Error;
  void *v17;
  void *v18;
  void *v20;
  CFStringRef v21;
  id v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[9];
  _QWORD v26[9];

  v6 = a3;
  v25[0] = kSecClass;
  v25[1] = kSecUseDataProtectionKeychain;
  v26[0] = kSecClassGenericPassword;
  v26[1] = &__kCFBooleanTrue;
  v26[2] = &__kCFBooleanFalse;
  v25[2] = kSecAttrSynchronizable;
  v25[3] = kSecAttrAccessGroup;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entryAccessGroup"));
  v26[3] = v8;
  v26[4] = v6;
  v25[4] = kSecAttrAccount;
  v25[5] = kSecAttrService;
  v26[5] = self->_metadataDomain;
  v26[6] = kSecMatchLimitOne;
  v25[6] = kSecMatchLimit;
  v25[7] = kSecReturnAttributes;
  v25[8] = kSecReturnData;
  v26[7] = &__kCFBooleanTrue;
  v26[8] = &__kCFBooleanTrue;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 9));

  v20 = (void *)0xAAAAAAAAAAAAAAAALL;
  v10 = SecItemCopyMatching(v9, (CFTypeRef *)&v20);
  if (v10 == -25300)
  {
LABEL_11:
    v15 = 0;
    goto LABEL_15;
  }
  if (!v10)
  {
    v11 = v20;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", kSecValueData));
    if ((_NSIsNSData(v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v12, 0, 0, a4));
      if (v13)
      {
        v14 = v13;
        v15 = v14;
LABEL_14:

        goto LABEL_15;
      }
      v14 = 0;
    }
    else
    {
      v23 = CFSTR("KCSharingInvalidAttribute");
      v21 = kSecValueData;
      v14 = objc_msgSend(v12, "copy");
      v22 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v24 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      sub_10004D4E8(a4, 1, (uint64_t)v18);

    }
    v15 = 0;
    goto LABEL_14;
  }
  Error = (void *)SecCopyLastError();
  if (!a4)
  {
    if (Error)
      CFRelease(Error);
    goto LABEL_11;
  }
  v15 = 0;
  *a4 = Error;
LABEL_15:

  return v15;
}

- (BOOL)removeValueForMetadataKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  int v11;
  void *Error;
  BOOL v13;
  BOOL v14;
  _QWORD v16[6];
  _QWORD v17[6];

  v16[0] = kSecClass;
  v16[1] = kSecUseDataProtectionKeychain;
  v17[0] = kSecClassGenericPassword;
  v17[1] = &__kCFBooleanTrue;
  v17[2] = &__kCFBooleanFalse;
  v16[2] = kSecAttrSynchronizable;
  v16[3] = kSecAttrAccessGroup;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entryAccessGroup"));
  v17[3] = v8;
  v17[4] = v6;
  v16[4] = kSecAttrAccount;
  v16[5] = kSecAttrService;
  v17[5] = self->_metadataDomain;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 6));

  v10 = SecItemDelete(v9);
  v11 = v10;
  if ((_DWORD)v10 != -25300 && (_DWORD)v10)
  {
    Error = (void *)SecCopyLastError(v10);
    if (a4)
    {
      *a4 = Error;
    }
    else if (Error)
    {
      CFRelease(Error);
    }
  }
  if (v11)
    v13 = v11 == -25300;
  else
    v13 = 1;
  v14 = v13;

  return v14;
}

- (BOOL)setValue:(id)a3 forMetadataKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFDictionary *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unsigned __int8 v17;
  void *Error;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[6];
  _QWORD v25[6];

  v8 = a4;
  if (a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, a5));
    if (v9)
    {
      v24[0] = kSecClass;
      v24[1] = kSecUseDataProtectionKeychain;
      v25[0] = kSecClassGenericPassword;
      v25[1] = &__kCFBooleanTrue;
      v25[2] = &__kCFBooleanFalse;
      v24[2] = kSecAttrSynchronizable;
      v24[3] = kSecAttrAccessGroup;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entryAccessGroup"));
      v25[3] = v11;
      v25[4] = v8;
      v24[4] = kSecAttrAccount;
      v24[5] = kSecAttrService;
      v25[5] = self->_metadataDomain;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 6));

      v22[0] = kSecAttrIsInvisible;
      v22[1] = kSecValueData;
      v23[0] = &__kCFBooleanTrue;
      v23[1] = v9;
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v14 = objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v14, "addEntriesFromDictionary:", v13);
      v20[0] = kSecAttrAccessible;
      v20[1] = kSecAttrSysBound;
      v21[0] = kSecAttrAccessibleWhenUnlocked;
      v21[1] = &off_10030AF40;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      objc_msgSend(v14, "addEntriesFromDictionary:", v15);

      v16 = SecItemAdd((CFDictionaryRef)v14, 0);
      if ((_DWORD)v16 == -25299)
        v16 = SecItemUpdate((CFDictionaryRef)v12, v13);
      v17 = (_DWORD)v16 == 0;
      if ((_DWORD)v16)
      {
        Error = (void *)SecCopyLastError(v16);
        if (a5)
        {
          *a5 = Error;
        }
        else if (Error)
        {
          CFRelease(Error);
        }
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = -[KCSharingStore removeValueForMetadataKey:error:](self, "removeValueForMetadataKey:error:", v8, a5);
  }

  return v17;
}

- (BOOL)hasOutgoingChangesInDatabaseWithScope:(int64_t)a3
{
  BOOL v3;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100195CB8;
  v5[3] = &unk_1002E9EC0;
  v5[6] = a3;
  v5[7] = a2;
  v5[4] = self;
  v5[5] = &v6;
  v3 = -[KCSharingStore withConnection:error:](self, "withConnection:error:", v5, 0) && *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)stageAllOutgoingChangesWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100195C48;
  v4[3] = &unk_1002E9F10;
  v4[4] = self;
  return -[KCSharingStore withConnection:error:](self, "withConnection:error:", v4, a3);
}

- (BOOL)withLocalFingerprintsTable:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  uint64_t (**v8)(id, id *);
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v15;
  unsigned __int8 v16;
  id v17;
  char v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  id v27;
  CFTypeRef v28;

  v8 = (uint64_t (**)(id, id *))a3;
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CREATE TEMP TABLE lsfp(               type INTEGER NOT NULL,               pkid INTEGER, /* Private key row ID */               pkkp BLOB, /* Private key keyprint */               pkvp BLOB, /* Private key valueprint */               ipid INTEGER, /* Internet password row ID */               ipkp BLOB, /* Internet password keyprint */               ipvp BLOB /* Internet password valueprint */          );")));
  v28 = 0;
  if ((sub_10001B41C((uint64_t)a4, v9, &v28) & 1) == 0)
  {
    v15 = (id)v28;
    v19 = CFSTR("Creating fingerprints table");
LABEL_7:
    sub_10004D598(a5, 27, v15, v19, v10, v11, v12, v13, v25);
    v18 = 0;
    goto LABEL_10;
  }
  v27 = 0;
  v14 = -[KCSharingStore fingerprintAllPrivateKeysInTransaction:error:](self, "fingerprintAllPrivateKeysInTransaction:error:", a4, &v27);
  v15 = v27;
  if ((v14 & 1) == 0)
  {
    sub_10001B41C((uint64_t)a4, CFSTR("DROP TABLE lsfp"), 0);
    v19 = CFSTR("Fingerprinting all private keys");
    goto LABEL_7;
  }
  v26 = 0;
  v16 = -[KCSharingStore fingerprintAllPasswordsInTransaction:error:](self, "fingerprintAllPasswordsInTransaction:error:", a4, &v26);
  v17 = v26;
  if ((v16 & 1) != 0)
  {
    v18 = v8[2](v8, a5);
    sub_10001B41C((uint64_t)a4, CFSTR("DROP TABLE lsfp"), 0);
  }
  else
  {
    sub_10001B41C((uint64_t)a4, CFSTR("DROP TABLE lsfp"), 0);
    sub_10004D598(a5, 27, v17, CFSTR("Fingerprinting all passwords"), v20, v21, v22, v23, v25);
    v18 = 0;
  }

LABEL_10:
  return v18;
}

- (BOOL)fingerprintAllPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  KCSharingRowMapper *v7;
  void *v8;
  void *v9;
  void *v10;
  KCSharingRowMapper *v11;
  _QWORD v13[4];
  KCSharingRowMapper *v14;
  KCSharingStore *v15;
  __OpaqueSecDbConnection *v16;

  v7 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingPrivateKeyCredential));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v7, "columnNamesWithTableName:", CFSTR("lpk")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@           FROM keys lpk           WHERE lpk.ggrp <> ''"), v9));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100195AC0;
  v13[3] = &unk_1002E9F60;
  v15 = self;
  v16 = a3;
  v14 = v7;
  v11 = v7;
  LOBYTE(a4) = sub_10014783C((uint64_t)a3, v10, a4, v13);

  return (char)a4;
}

- (BOOL)fingerprintPrivateKeyDatabaseItem:(SecDbItem *)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  KCSharingLocalFingerprint *v8;
  uint64_t v9;
  void *v10;
  char v11;
  __CFString *v12;
  _QWORD v14[4];
  KCSharingLocalFingerprint *v15;
  __OpaqueSecDbConnection *v16;
  __CFString *v17;

  v8 = -[KCSharingLocalFingerprint initWithDatabaseItem:error:]([KCSharingLocalFingerprint alloc], "initWithDatabaseItem:error:", a3, a5);
  if (!v8)
    goto LABEL_8;
  v17 = 0;
  v9 = sub_1001163AC(a3, &v17);
  if (!v9)
  {
    v12 = v17;
    if (a5)
    {
      v11 = 0;
      *a5 = v17;
      goto LABEL_9;
    }
    if (v17)
    {
      v17 = 0;
      CFRelease(v12);
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO lsfp(type, pkid, pkkp, pkvp)           VALUES(%lld, %lld, ?1, ?2)"), 1, v9));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001959F8;
  v14[3] = &unk_1002E9FC8;
  v15 = v8;
  v16 = a4;
  v11 = sub_10014783C((uint64_t)a4, v10, a5, v14);

LABEL_9:
  return v11;
}

- (BOOL)fingerprintAllPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  KCSharingRowMapper *v7;
  void *v8;
  void *v9;
  void *v10;
  KCSharingRowMapper *v11;
  _QWORD v13[4];
  KCSharingRowMapper *v14;
  KCSharingStore *v15;
  __OpaqueSecDbConnection *v16;

  v7 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingInternetPasswordCredential));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v7, "columnNamesWithTableName:", CFSTR("lip")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@           FROM inet lip           WHERE lip.ggrp <> ''"), v9));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100195870;
  v13[3] = &unk_1002E9F60;
  v15 = self;
  v16 = a3;
  v14 = v7;
  v11 = v7;
  LOBYTE(a4) = sub_10014783C((uint64_t)a3, v10, a4, v13);

  return (char)a4;
}

- (BOOL)fingerprintPasswordDatabaseItem:(SecDbItem *)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  KCSharingLocalFingerprint *v8;
  uint64_t v9;
  void *v10;
  char v11;
  __CFString *v12;
  _QWORD v14[4];
  KCSharingLocalFingerprint *v15;
  __OpaqueSecDbConnection *v16;
  __CFString *v17;

  v8 = -[KCSharingLocalFingerprint initWithDatabaseItem:error:]([KCSharingLocalFingerprint alloc], "initWithDatabaseItem:error:", a3, a5);
  if (!v8)
    goto LABEL_8;
  v17 = 0;
  v9 = sub_1001163AC(a3, &v17);
  if (!v9)
  {
    v12 = v17;
    if (a5)
    {
      v11 = 0;
      *a5 = v17;
      goto LABEL_9;
    }
    if (v17)
    {
      v17 = 0;
      CFRelease(v12);
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("INSERT INTO lsfp(type, ipid, ipkp, ipvp)           VALUES(%lld, %lld, ?1, ?2)"), 2, v9));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001957A8;
  v14[3] = &unk_1002E9FC8;
  v15 = v8;
  v16 = a4;
  v11 = sub_10014783C((uint64_t)a4, v10, a5, v14);

LABEL_9:
  return v11;
}

- (BOOL)stageAllOutgoingChangesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100195174;
  v5[3] = &unk_1002E9EE8;
  v5[4] = self;
  v5[5] = a3;
  return -[KCSharingStore withLocalFingerprintsTable:inTransaction:error:](self, "withLocalFingerprintsTable:inTransaction:error:", v5, a3, a4);
}

- (id)stageAllOutgoingChangedPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v6;
  KCSharingRowMapper *v7;
  KCSharingRowMapper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  KCSharingRowMapper *v15;
  KCSharingRowMapper *v16;
  void *v17;
  id v18;
  _QWORD v21[5];
  KCSharingRowMapper *v22;
  KCSharingRowMapper *v23;
  id v24;
  __OpaqueSecDbConnection *v25;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v7 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingMirrorEntry));
  v8 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingPrivateKeyCredential));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v7, "columnNamesWithTableName:", CFSTR("m")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v8, "columnNamesWithTableName:", CFSTR("lpk")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", ")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@, %2$@           FROM lsfp l           JOIN sharingMirror m ON (m.type = %3$lld AND l.type = %3$lld AND m.pkkp = l.pkkp)           JOIN keys lpk ON lpk.rowid = l.pkid           WHERE m.agrp = ? AND                (                    (l.type = m.type AND l.pkvp <> m.pkvp) OR                     (m.flag <> 0 AND(                        (m.flag & %4$u) <> 0                    ))                ) AND                 (m.flag = 0 OR (m.flag & %5$u) = 0) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone, o.uuid) = (m.ownr, m.zone, m.uuid)                )"), v10, v12, 1, 1, 4));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100194CBC;
  v21[3] = &unk_1002EA038;
  v24 = v6;
  v25 = a3;
  v21[4] = self;
  v22 = v7;
  v23 = v8;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  if (sub_10014783C((uint64_t)a3, v13, a4, v21))
    v17 = v14;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (id)stageAllOutgoingNewPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  KCSharingRowMapper *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  KCSharingRowMapper *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  KCSharingRowMapper *v18;
  id v19;
  __OpaqueSecDbConnection *v20;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v8 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingPrivateKeyCredential));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v8, "columnNamesWithTableName:", CFSTR("lpk")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WITH groups(ownr, zone) AS(              SELECT msh.ownr, msh.zone               FROM sharingMirror msh               WHERE (msh.agrp, msh.uuid) = (?1, ?2) AND                     NOT EXISTS(                        SELECT 1 FROM sharingIncomingQueue ish                         WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid) AND                               ish.deln                    ) AND                     NOT EXISTS(                        SELECT 1 FROM sharingOutgoingQueue osh                         WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid)                    )               UNION ALL               SELECT osh.ownr, osh.zone               FROM sharingOutgoingQueue osh               WHERE (osh.agrp, osh.uuid) = (?1, ?2) AND                     NOT osh.deln          )           SELECT g.ownr, g.zone, %1$@           FROM lsfp l           JOIN keys lpk ON lpk.rowid = l.pkid           JOIN groups g ON substr(g.zone, 1, length(?3)) = ?3 AND                            substr(g.zone, length(?3) + 1) = lpk.ggrp           WHERE NOT EXISTS(                    SELECT 1 FROM sharingMirror m                     WHERE (m.ownr, m.zone) = (g.ownr, g.zone) AND                           (m.type, l.type, m.pkkp) = (%2$lld, %2$lld, l.pkkp)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone) = (g.ownr, g.zone) AND                           (o.type, l.type, o.pkkp) = (%2$lld, %2$lld, l.pkkp)                )"), v10, 1));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100194928;
  v17[3] = &unk_1002EA088;
  v17[4] = self;
  v18 = v8;
  v19 = v7;
  v20 = a3;
  v12 = v7;
  v13 = v8;
  if (sub_10014783C((uint64_t)a3, v11, a4, v17))
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (id)stageAllOutgoingChangedPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v6;
  KCSharingRowMapper *v7;
  KCSharingRowMapper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  KCSharingRowMapper *v15;
  KCSharingRowMapper *v16;
  void *v17;
  id v18;
  _QWORD v21[5];
  KCSharingRowMapper *v22;
  KCSharingRowMapper *v23;
  id v24;
  __OpaqueSecDbConnection *v25;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v7 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingMirrorEntry));
  v8 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingInternetPasswordCredential));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v7, "columnNamesWithTableName:", CFSTR("m")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v8, "columnNamesWithTableName:", CFSTR("lip")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", ")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@, %2$@           FROM lsfp l           JOIN sharingMirror m ON (m.type = %3$lld AND l.type = %3$lld AND m.ipkp = l.ipkp)           JOIN inet lip ON lip.rowid = l.ipid           WHERE m.agrp = ?1 AND                (                    (l.type = m.type AND l.ipvp <> m.ipvp) OR                     (m.flag <> 0 AND(                        (m.flag & %4$u) <> 0                    ))                ) AND                 (m.flag = 0 OR (m.flag & %5$u) = 0) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone, o.uuid) = (m.ownr, m.zone, m.uuid)                )"), v10, v12, 2, 1, 4));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100194470;
  v21[3] = &unk_1002EA038;
  v24 = v6;
  v25 = a3;
  v21[4] = self;
  v22 = v7;
  v23 = v8;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  if (sub_10014783C((uint64_t)a3, v13, a4, v21))
    v17 = v14;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (id)stageAllOutgoingNewPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  KCSharingRowMapper *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  KCSharingRowMapper *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  KCSharingRowMapper *v18;
  id v19;
  __OpaqueSecDbConnection *v20;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v8 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingInternetPasswordCredential));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v8, "columnNamesWithTableName:", CFSTR("lip")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("WITH groups(ownr, zone) AS(              SELECT msh.ownr, msh.zone               FROM sharingMirror msh               WHERE (msh.agrp, msh.uuid) = (?1, ?2) AND                     NOT EXISTS(                        SELECT 1 FROM sharingIncomingQueue ish                         WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid) AND                               ish.deln                    ) AND                     NOT EXISTS(                        SELECT 1 FROM sharingOutgoingQueue osh                         WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (msh.agrp, msh.ownr, msh.zone, msh.uuid)                    )               UNION ALL               SELECT osh.ownr, osh.zone               FROM sharingOutgoingQueue osh               WHERE (osh.agrp, osh.uuid) = (?1, ?2) AND                     NOT osh.deln          )           SELECT g.ownr, g.zone, %1$@           FROM lsfp l           JOIN inet lip ON lip.rowid = l.ipid           JOIN groups g ON substr(g.zone, 1, length(?3)) = ?3 AND                            substr(g.zone, length(?3) + 1) = lip.ggrp           WHERE NOT EXISTS(                    SELECT 1 FROM sharingMirror m                     WHERE (m.ownr, m.zone) = (g.ownr, g.zone) AND                           (m.type, l.type, m.ipkp) = (%2$lld, %2$lld, l.ipkp)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.ownr, o.zone) = (g.ownr, g.zone) AND                           (o.type, l.type, o.ipkp) = (%2$lld, %2$lld, l.ipkp)                )"), v10, 2));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001940DC;
  v17[3] = &unk_1002EA088;
  v17[4] = self;
  v18 = v8;
  v19 = v7;
  v20 = a3;
  v12 = v7;
  v13 = v8;
  if (sub_10014783C((uint64_t)a3, v11, a4, v17))
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (id)stageAllOutgoingDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  KCSharingRowMapper *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  __OpaqueSecDbConnection *v20;
  _QWORD v21[4];
  KCSharingRowMapper *v22;
  id v23;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100193EB8;
  v21[3] = &unk_1002EA0B0;
  v22 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingMirrorEntry));
  v23 = v7;
  v8 = v7;
  v9 = v22;
  v10 = objc_retainBlock(v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v9, "columnNamesWithTableName:", CFSTR("m")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", ")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@           FROM sharingMirror m           WHERE m.agrp = ? AND                (                    (m.type = %2$lld AND m.pkkp NOT IN(                        SELECT l.pkkp FROM lsfp l                         WHERE l.type = %2$lld                    )) OR                     (m.type = %3$lld AND m.ipkp NOT IN(                        SELECT l.ipkp FROM lsfp l                         WHERE l.type = %3$lld                    )) OR                     (m.flag <> 0 AND (m.flag & %4$u) <> 0)                )"), v12, 1, 2, 4));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100193FEC;
  v18[3] = &unk_1002EA100;
  v19 = v10;
  v20 = a3;
  v18[4] = self;
  v14 = v10;
  if (sub_10014783C((uint64_t)a3, v13, a4, v18))
    v15 = v8;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (BOOL)stageIncomingRow:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[4];
  KCSharingStore *v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100193DAC;
  v7[3] = &unk_1002EA150;
  v8 = self;
  v9 = a3;
  v5 = v9;
  LOBYTE(a4) = -[KCSharingStore withConnection:error:](v8, "withConnection:error:", v7, a4);

  return (char)a4;
}

- (BOOL)stageIncomingRecord:(id)a3 error:(id *)a4
{
  id v6;
  KCSharingIncomingEntry *v7;

  v6 = a3;
  v7 = -[KCSharingIncomingEntry initWithFetchedRecord:]([KCSharingIncomingEntry alloc], "initWithFetchedRecord:", v6);

  LOBYTE(a4) = -[KCSharingStore stageIncomingRow:error:](self, "stageIncomingRow:error:", v7, a4);
  return (char)a4;
}

- (BOOL)stageIncomingDeletionForRecordID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[KCSharingIncomingDeletion initForDeletedRecordWithRecordID:]([KCSharingIncomingDeletion alloc], "initForDeletedRecordWithRecordID:", v6);

  LOBYTE(a4) = -[KCSharingStore stageIncomingRow:error:](self, "stageIncomingRow:error:", v7, a4);
  return (char)a4;
}

- (BOOL)stageOutgoingShares:(id)a3 deletionsForShares:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _QWORD v10[4];
  KCSharingStore *v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100193ACC;
  v10[3] = &unk_1002EA1A0;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v7 = v13;
  v8 = v12;
  LOBYTE(a5) = -[KCSharingStore withConnection:error:](v11, "withConnection:error:", v10, a5);

  return (char)a5;
}

- (BOOL)applyIncomingShareDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 updateInfos:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48[2];

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v10 = objc_opt_class(KCSharingIncomingRow);
  v48[0] = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100193A0C;
  v46[3] = &unk_1002EA1C8;
  v11 = v9;
  v47 = v11;
  v12 = -[KCSharingStore enumerateRowsInRemotelyDeletedZonesForEntryModel:inTransaction:withError:usingBlock:](self, "enumerateRowsInRemotelyDeletedZonesForEntryModel:inTransaction:withError:usingBlock:", v10, a3, v48, v46);
  v17 = v48[0];
  if ((v12 & 1) == 0)
  {
    sub_10004D598(a5, 28, v17, CFSTR("Enumerating incoming rows in remotely deleted zones"), v13, v14, v15, v16, v37);
    v35 = 0;
    v33 = v47;
    goto LABEL_9;
  }
  v38 = (uint64_t)v8;

  v18 = objc_opt_class(KCSharingOutgoingRow);
  v45 = v17;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100193A4C;
  v43[3] = &unk_1002EA1C8;
  v19 = v11;
  v44 = v19;
  v20 = -[KCSharingStore enumerateRowsInRemotelyDeletedZonesForEntryModel:inTransaction:withError:usingBlock:](self, "enumerateRowsInRemotelyDeletedZonesForEntryModel:inTransaction:withError:usingBlock:", v18, a3, &v45, v43);
  v21 = v45;

  if ((v20 & 1) == 0)
  {
    sub_10004D598(a5, 28, v21, CFSTR("Enumerating outgoing rows in remotely deleted zones"), v22, v23, v24, v25, v38);
    v35 = 0;
    v33 = v44;
    v17 = v21;
LABEL_8:
    v8 = v39;
    goto LABEL_9;
  }

  v26 = objc_opt_class(KCSharingMirrorEntry);
  v42 = v21;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100193A8C;
  v40[3] = &unk_1002EA1C8;
  v27 = v19;
  v41 = v27;
  v28 = -[KCSharingStore enumerateRowsInRemotelyDeletedZonesForEntryModel:inTransaction:withError:usingBlock:](self, "enumerateRowsInRemotelyDeletedZonesForEntryModel:inTransaction:withError:usingBlock:", v26, a3, &v42, v40);
  v17 = v42;

  if ((v28 & 1) == 0)
  {
    sub_10004D598(a5, 28, v17, CFSTR("Enumerating mirror entries in remotely deleted zones"), v29, v30, v31, v32, v38);
    v35 = 0;
    v33 = v41;
    goto LABEL_8;
  }

  v33 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
  v34 = v27;
  v8 = (id)v38;
  v35 = objc_msgSend(v34, "applyInTransaction:withAccessGroups:updateInfos:error:", a3, v33, v38, a5);
LABEL_9:

  return v35;
}

- (BOOL)enumerateRowsInRemotelyDeletedZonesForEntryModel:(Class)a3 inTransaction:(__OpaqueSecDbConnection *)a4 withError:(id *)a5 usingBlock:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  __OpaqueSecDbConnection *v16;
  Class v17;

  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT r.rowid, r.zone, r.uuid           FROM %1$@ r           WHERE r.agrp = ?1 AND                 EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.zone, ish.uuid) = (r.agrp, r.zone, ?2) AND                           ish.deln                )"), *(_QWORD *)-[objc_class databaseItemClass](a3, "databaseItemClass")));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100193758;
  v14[3] = &unk_1002EA218;
  v16 = a4;
  v17 = a3;
  v14[4] = self;
  v15 = v10;
  v12 = v10;
  LOBYTE(a5) = sub_10014783C((uint64_t)a4, v11, a5, v14);

  return (char)a5;
}

- (BOOL)enumerateRowsInRemotelyDeletedZonesForLocalItemsInTransaction:(__OpaqueSecDbConnection *)a3 withError:(id *)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  id v15;
  __OpaqueSecDbConnection *v16;
  _QWORD v17[5];
  id v18;
  __OpaqueSecDbConnection *v19;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT lpk.rowid           FROM keys lpk           JOIN sharingIncomingQueue ish ON substr(ish.zone, 1, length(?3)) = ?3 AND                                            substr(ish.zone, length(?3) + 1) = lpk.ggrp           WHERE (ish.agrp, ish.uuid) = (?1, ?2) AND                 ish.deln")));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100193410;
  v17[3] = &unk_1002EA100;
  v17[4] = self;
  v19 = a3;
  v10 = v8;
  v18 = v10;
  if (sub_10014783C((uint64_t)a3, v9, a4, v17))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT lip.rowid           FROM inet lip           JOIN sharingIncomingQueue ish ON substr(ish.zone, 1, length(?3)) = ?3 AND                                            substr(ish.zone, length(?3) + 1) = lip.ggrp           WHERE (ish.agrp, ish.uuid) = (?1, ?2) AND                 ish.deln")));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100193538;
    v14[3] = &unk_1002EA100;
    v14[4] = self;
    v16 = a3;
    v15 = v10;
    v12 = sub_10014783C((uint64_t)a3, v11, a4, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)enumerateRowsInZoneIDs:(id)a3 forEntryModel:(Class)a4 inTransaction:(__OpaqueSecDbConnection *)a5 withError:(id *)a6 usingBlock:(id)a7
{
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  void ***v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, char *);
  void *v28;
  id v29;
  KCSharingStore *v30;
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  Class v34;
  __OpaqueSecDbConnection *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  char v46;

  v12 = a3;
  v13 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_10018D5B8;
  v40 = sub_10018D5C8;
  v41 = 0;
  v14 = sqlite3_limit(*((sqlite3 **)a5 + 8), 9, -1);
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100192FC8;
  v28 = &unk_1002EA268;
  v34 = a4;
  v35 = a5;
  v32 = &v42;
  v33 = &v36;
  v29 = v12;
  v30 = self;
  v15 = v13;
  v31 = v15;
  v16 = v29;
  v17 = &v25;
  v18 = objc_msgSend(v16, "count", v25, v26);
  v19 = (v14 & ~(v14 >> 31)) - 1;
  if (v19 >= 2 && v18)
  {
    v46 = 0;
    v20 = objc_msgSend(v16, "count");
    if ((unint64_t)v20 >= v19 >> 1)
      v21 = (id)(v19 >> 1);
    else
      v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subarrayWithRange:", 0, v21));
    v27((uint64_t)v17, v22, &v46);

  }
  v23 = *((unsigned __int8 *)v43 + 24);
  if (a6 && !*((_BYTE *)v43 + 24))
    *a6 = objc_retainAutorelease((id)v37[5]);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v23 != 0;
}

- (BOOL)enumerateRowsInZoneIDs:(id)a3 forLocalItemsInTransaction:(__OpaqueSecDbConnection *)a4 withError:(id *)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  void ***v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, char *);
  void *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  __OpaqueSecDbConnection *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  char v50;
  _BYTE v51[128];

  v9 = a3;
  v10 = a6;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 1;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_10018D5B8;
  v44 = sub_10018D5C8;
  v45 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v12);
        v16 = sub_10004CEEC(*(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    }
    while (v13);
  }

  v18 = sqlite3_limit(*((sqlite3 **)a4 + 8), 9, -1);
  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_1001927D0;
  v31 = &unk_1002EA290;
  v33 = &v46;
  v34 = &v40;
  v35 = a4;
  v19 = v10;
  v32 = v19;
  v20 = v11;
  v21 = &v28;
  v22 = objc_msgSend(v20, "count", v28, v29);
  if (v18 >= 1 && v22)
  {
    v50 = 0;
    v23 = objc_msgSend(v20, "count");
    if ((unint64_t)v23 >= (v18 & ~(v18 >> 31)))
      v24 = (id)(v18 & ~(v18 >> 31));
    else
      v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subarrayWithRange:", 0, v24));
    v30((uint64_t)v21, v25, &v50);

  }
  v26 = *((unsigned __int8 *)v47 + 24);
  if (a5 && !*((_BYTE *)v47 + 24))
    *a5 = objc_retainAutorelease((id)v41[5]);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v26 != 0;
}

- (BOOL)resolveMergeConflictsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  KCSharingRowMapper *v7;
  KCSharingRowMapper *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  KCSharingRowMapper *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id *v48;
  KCSharingRowMapper *v49;
  _QWORD v50[5];
  KCSharingRowMapper *v51;
  KCSharingRowMapper *v52;
  __OpaqueSecDbConnection *v53;
  id v54;
  _QWORD v55[6];
  id v56;
  _QWORD v57[5];
  KCSharingRowMapper *v58;
  __OpaqueSecDbConnection *v59;
  id v60;
  _QWORD v61[6];
  id v62[2];

  v7 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingIncomingRow));
  v8 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingOutgoingRow));
  v62[0] = 0;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100191D28;
  v61[3] = &unk_1002E9FC8;
  v61[4] = self;
  v61[5] = a3;
  v9 = sub_10014783C((uint64_t)a3, CFSTR("SELECT i.rowid, o.rowid, m.rowid                                         FROM sharingIncomingQueue i                                         JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                                         JOIN sharingMirror m ON (m.agrp, m.ownr, m.zone, m.uuid) = (o.agrp, o.ownr, o.zone, o.uuid)                                         WHERE i.agrp = ? AND i.deln AND o.deln"), v62, v61);
  v14 = v62[0];
  if ((v9 & 1) != 0)
  {
    v48 = a4;
    v49 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v7, "columnNamesWithTableName:", CFSTR("i")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", ")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@, o.rowid, o.data           FROM sharingIncomingQueue i           JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)           WHERE i.agrp = ?1 AND                 o.deln AND                 NOT i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )")));

    v60 = 0;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100191DF4;
    v57[3] = &unk_1002E9F60;
    v57[4] = self;
    v59 = a3;
    v17 = v7;
    v58 = v17;
    v18 = sub_10014783C((uint64_t)a3, v16, &v60, v57);
    v19 = v60;
    v24 = v19;
    if ((v18 & 1) != 0)
    {
      v47 = v19;
      v56 = 0;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100191F08;
      v55[3] = &unk_1002E9FC8;
      v55[4] = self;
      v55[5] = a3;
      v25 = sub_10014783C((uint64_t)a3, CFSTR("SELECT i.rowid, o.rowid, m.rowid                                                    FROM sharingIncomingQueue i                                                    JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                                                    JOIN sharingMirror m ON (m.agrp, m.ownr, m.zone, m.uuid) = (o.agrp, o.ownr, o.zone, o.uuid)                                                    WHERE i.agrp = ?1 AND                                                          NOT o.deln AND                                                          i.deln AND                                                          NOT EXISTS(                                                             SELECT 1 FROM sharingIncomingQueue ish                                                              WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                                                                    ish.deln                                                         ) AND                                                          NOT EXISTS(                                                             SELECT 1 FROM sharingOutgoingQueue osh                                                              WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                                                                    osh.deln                                                         )"), &v56, v55);
      v26 = v56;
      v31 = v26;
      if ((v25 & 1) != 0)
      {
        v46 = v26;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v17, "columnNamesWithTableName:", CFSTR("i")));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "componentsJoinedByString:", CFSTR(", ")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v49, "columnNamesWithTableName:", CFSTR("o")));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", ")));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@, %2$@           FROM sharingIncomingQueue i           JOIN sharingOutgoingQueue o ON (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)           WHERE i.agrp = ?1 AND                 NOT o.deln AND                 NOT i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )")));

        v8 = v49;
        v54 = 0;
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100191FFC;
        v50[3] = &unk_1002EA088;
        v50[4] = self;
        v53 = a3;
        v51 = v17;
        v52 = v49;
        v35 = sub_10014783C((uint64_t)a3, v34, &v54, v50);
        v40 = v54;
        if ((v35 & 1) == 0)
          sub_10004D598(v48, 28, v40, CFSTR("Resolving change-change conflicts"), v36, v37, v38, v39, (uint64_t)v32);

        v24 = v47;
        v31 = v46;
      }
      else
      {
        sub_10004D598(v48, 28, v26, CFSTR("Resolving remote deletion-local change conflicts"), v27, v28, v29, v30, (uint64_t)v43);
        v35 = 0;
        v8 = v49;
        v24 = v47;
      }

    }
    else
    {
      sub_10004D598(v48, 28, v19, CFSTR("Resolving remote change-local deletion conflicts"), v20, v21, v22, v23, (uint64_t)v43);
      v35 = 0;
      v8 = v49;
    }

  }
  else
  {
    sub_10004D598(a4, 28, v14, CFSTR("Resolving deletion-deletion conflicts"), v10, v11, v12, v13, v42);
    v35 = 0;
  }

  return v35;
}

- (BOOL)applyIncomingEntriesInTransaction:(__OpaqueSecDbConnection *)a3 updateInfos:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  KCSharingRowMapper *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  KCSharingRowMapper *v15;
  void *v16;
  unsigned __int8 v17;
  _QWORD v19[5];
  KCSharingRowMapper *v20;
  id v21;
  __OpaqueSecDbConnection *v22;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v10 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingIncomingRow));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v10, "columnNamesWithTableName:", CFSTR("i")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", ")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@           FROM sharingIncomingQueue i           WHERE i.agrp = ?1 AND                 NOT i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )"), v12));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100191B40;
  v19[3] = &unk_1002EA088;
  v22 = a3;
  v19[4] = self;
  v20 = v10;
  v14 = v9;
  v21 = v14;
  v15 = v10;
  if (sub_10014783C((uint64_t)a3, v13, a5, v19))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
    v17 = objc_msgSend(v14, "applyInTransaction:withAccessGroups:updateInfos:error:", a3, v16, v8, a5);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)applyIncomingDeletionsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  _QWORD v15[5];
  id v16;
  __OpaqueSecDbConnection *v17;
  _QWORD v18[5];
  id v19;
  __OpaqueSecDbConnection *v20;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT i.rowid, m.rowid, IFNULL(l.type, 0), l.pkid, l.ipid           FROM sharingIncomingQueue i           JOIN sharingMirror m ON (m.agrp, m.ownr, m.zone, m.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)           LEFT JOIN lsfp l ON (l.type = %1$lld AND l.pkkp = m.pkkp) OR                               (l.type = %2$lld AND l.ipkp = m.ipkp)           WHERE i.agrp = ?1 AND                 i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue ish                     WHERE (ish.agrp, ish.ownr, ish.zone, ish.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           ish.deln                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue osh                     WHERE (osh.agrp, osh.ownr, osh.zone, osh.uuid) = (i.agrp, i.ownr, i.zone, ?2) AND                           osh.deln                )"), 1, 2));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100191658;
  v18[3] = &unk_1002E9F60;
  v18[4] = self;
  v20 = a3;
  v9 = v7;
  v19 = v9;
  if (sub_10014783C((uint64_t)a3, v8, a4, v18))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT i.rowid           FROM sharingIncomingQueue i           WHERE i.agrp = ? AND                 i.deln AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingMirror m                     WHERE (m.agrp, m.ownr, m.zone, m.uuid) = (i.agrp, i.ownr, i.zone, i.uuid)                )")));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100191764;
    v15[3] = &unk_1002E9F60;
    v15[4] = self;
    v17 = a3;
    v11 = v9;
    v16 = v11;
    if (sub_10014783C((uint64_t)a3, v10, a4, v15))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
      v13 = objc_msgSend(v11, "applyInTransaction:withAccessGroups:error:", a3, v12, a4);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)resolveConflictingPrimaryKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  _BOOL4 v7;

  v7 = -[KCSharingStore resolveConflictingPrimaryKeysForEntriesOfType:inTransaction:error:](self, "resolveConflictingPrimaryKeysForEntriesOfType:inTransaction:error:", 1, a3, a4);
  if (v7)
    LOBYTE(v7) = -[KCSharingStore resolveConflictingPrimaryKeysForEntriesOfType:inTransaction:error:](self, "resolveConflictingPrimaryKeysForEntriesOfType:inTransaction:error:", 2, a3, a4);
  return v7;
}

- (BOOL)resolveConflictingPrimaryKeysForEntriesOfType:(int64_t)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  void *v10;
  KCSharingRowMapper *v11;
  __CFString **v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id *v16;
  __CFString *v17;
  void *v18;
  KCSharingRowMapper *v19;
  void *v20;
  uint64_t v21;
  KCSharingRowMapper *v22;
  void *v23;
  KCSharingRowMapper *v24;
  id v25;
  void *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  void *v35;
  KCSharingRowMapper *v36;
  _QWORD v37[5];
  KCSharingRowMapper *v38;
  id v39;
  __OpaqueSecDbConnection *v40;
  _QWORD v41[5];
  KCSharingRowMapper *v42;
  id v43;
  __OpaqueSecDbConnection *v44;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v11 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingMirrorEntry));
  v12 = off_1002EA328;
  switch(a3)
  {
    case 0:
    case 3:
      v13 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("KCSharingStore.m"), 1756, CFSTR("Can't resolve conflicting primary keys for entries of type %ld"), a3);

      v10 = v13;
      v15 = 1;
      goto LABEL_13;
    case 1:
      goto LABEL_5;
    case 2:
      v12 = &off_1002EA330;
LABEL_5:
      v16 = a5;
      v17 = *v12;
      goto LABEL_6;
    default:
      v16 = a5;
      v17 = 0;
LABEL_6:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v11, "columnNamesWithTableName:", CFSTR("m")));
      v19 = v11;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", ")));
      v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@           FROM sharingMirror m           JOIN(              SELECT ownr, zone, min(uuid) AS lo               FROM sharingMirror               WHERE agrp = ? AND type = %2$lld               GROUP BY ownr, zone, %3$@               HAVING count(*) > 1          ) p ON (p.ownr, p.zone) = (m.ownr, m.zone) AND                  p.lo = m.uuid"), v20, a3, v17));

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1001912FC;
      v41[3] = &unk_1002EA088;
      v41[4] = self;
      v44 = a4;
      v36 = v19;
      v22 = v19;
      v23 = (void *)v21;
      v24 = v22;
      v42 = v22;
      v25 = v10;
      v43 = v25;
      v26 = (void *)v21;
      v27 = v16;
      if (sub_10014783C((uint64_t)a4, v26, v16, v41))
      {
        v34 = v23;
        v35 = v10;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v24, "columnNamesWithTableName:", CFSTR("m")));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", ")));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@           FROM sharingMirror m           JOIN(              SELECT ownr, zone, %3$@, min(uuid) AS lo, max(uuid) AS hi               FROM sharingMirror               WHERE agrp = ? AND type = %2$lld               GROUP BY ownr, zone, %3$@               HAVING count(*) > 1          ) r ON (r.ownr, r.zone) = (m.ownr, m.zone) AND                  m.uuid > r.lo AND m.uuid <= r.hi           WHERE m.type = %2$lld AND                 m.%3$@ = r.%3$@"), v29, a3, v17));

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1001913F8;
        v37[3] = &unk_1002EA088;
        v37[4] = self;
        v40 = a4;
        v38 = v24;
        v31 = v25;
        v39 = v31;
        v11 = v36;
        if (sub_10014783C((uint64_t)a4, v30, v27, v37))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
          v15 = objc_msgSend(v31, "applyInTransaction:withAccessGroups:error:", a4, v32, v27);

        }
        else
        {
          v15 = 0;
        }

        v10 = v35;
        v23 = v34;
      }
      else
      {
        v15 = 0;
        v11 = v36;
      }

LABEL_13:
      return v15;
  }
}

- (BOOL)restageUnappliedMirrorEntriesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  void *v7;
  KCSharingRowMapper *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  KCSharingRowMapper *v14;
  void *v15;
  unsigned __int8 v16;
  _QWORD v18[5];
  KCSharingRowMapper *v19;
  id v20;
  __OpaqueSecDbConnection *v21;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v8 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingMirrorEntry));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v8, "columnNamesWithTableName:", CFSTR("m")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", ")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %1$@           FROM sharingMirror m           WHERE m.agrp = ?1 AND                 m.flag <> 0 AND                (                    ((m.flag & %2$u) <> 0 AND m.lwsv < %3$lli) OR                     ((m.flag & %4$u) <> 0)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingIncomingQueue i                     WHERE (i.agrp, i.ownr, i.zone, i.uuid) = (m.agrp, m.ownr, m.zone, m.uuid)                ) AND                 NOT EXISTS(                    SELECT 1 FROM sharingOutgoingQueue o                     WHERE (o.agrp, o.ownr, o.zone, o.uuid) = (m.agrp, m.ownr, m.zone, m.uuid) AND                           o.deln                )"), v10, 2, objc_msgSend(v11, "entrySchemaVersion"), 8));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001910E8;
  v18[3] = &unk_1002EA088;
  v21 = a3;
  v18[4] = self;
  v19 = v8;
  v13 = v7;
  v20 = v13;
  v14 = v8;
  if (sub_10014783C((uint64_t)a3, v12, a4, v18))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
    v16 = objc_msgSend(v13, "applyInTransaction:withAccessGroups:error:", a3, v15, a4);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)mergeWithError:(id *)a3
{
  return -[KCSharingStore mergeWithUpdateInfos:error:](self, "mergeWithUpdateInfos:error:", 0, a3);
}

- (BOOL)mergeWithUpdateInfos:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[4];
  KCSharingStore *v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100190C88;
  v7[3] = &unk_1002EA150;
  v8 = self;
  v9 = a3;
  v5 = v9;
  LOBYTE(a4) = -[KCSharingStore withConnection:error:](v8, "withConnection:error:", v7, a4);

  return (char)a4;
}

- (BOOL)hasIncomingEntries:(BOOL *)a3 deletions:(BOOL *)a4 inTransaction:(__OpaqueSecDbConnection *)a5 error:(id *)a6
{
  _QWORD v7[8];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100190B50;
  v7[3] = &unk_1002EA360;
  v7[4] = self;
  v7[5] = a5;
  v7[6] = a3;
  v7[7] = a4;
  return sub_10014783C((uint64_t)a5, CFSTR("SELECT EXISTS(                          SELECT 1 FROM sharingIncomingQueue i                           WHERE i.agrp = ?1 AND NOT i.deln                      ) AS hasEntries, EXISTS(                          SELECT 1 FROM sharingIncomingQueue i                           WHERE i.agrp = ?1 AND i.deln                      ) AS hasDeletions"), a6, v7);
}

- (id)fetchOutgoingDatabaseItemWithRecordID:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8;
  KCSharingRowMapper *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  KCSharingRowMapper *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  KCSharingRowMapper *v20;
  uint64_t *v21;
  __OpaqueSecDbConnection *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingOutgoingRow));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingRowMapper columnNamesWithTableName:](v9, "columnNamesWithTableName:", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", ")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SELECT %@ FROM sharingOutgoingQueue WHERE (agrp, ownr, zone, uuid) = (?1, ?2, ?3, ?4)"), v11));

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10018D5B8;
  v27 = sub_10018D5C8;
  v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100190920;
  v18[3] = &unk_1002EA3B0;
  v18[4] = self;
  v13 = v8;
  v21 = &v23;
  v22 = a4;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  if ((sub_10014783C((uint64_t)a4, v12, a5, v18) & 1) != 0)
  {
    v15 = (void *)v24[5];
    if (v15)
    {
      v16 = v15;
    }
    else
    {
      sub_10004D4E8(a5, 9, 0);
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v16;
}

- (BOOL)dropDeletionsForRecordIDs:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8;
  int v9;
  id v10;
  _QWORD *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  int v17;
  _QWORD v19[2];
  void (*v20)(_QWORD *, void *, char *);
  void *v21;
  KCSharingStore *v22;
  uint64_t *v23;
  uint64_t *v24;
  __OpaqueSecDbConnection *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  char v36;

  v8 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_10018D5B8;
  v30 = sub_10018D5C8;
  v31 = 0;
  v9 = sqlite3_limit(*((sqlite3 **)a4 + 8), 9, -1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v20 = sub_10019038C;
  v21 = &unk_1002EA3F8;
  v24 = &v26;
  v25 = a4;
  v22 = self;
  v23 = &v32;
  v10 = v8;
  v11 = v19;
  v12 = objc_msgSend(v10, "count");
  v13 = (v9 & ~(v9 >> 31)) - 1;
  if (v13 >= 3 && v12)
  {
    v36 = 0;
    v14 = (unint64_t)objc_msgSend(v10, "count");
    if (v14 >= v13 / 3)
      v15 = v13 / 3;
    else
      v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v15));
    v20(v11, v16, &v36);

  }
  v17 = *((unsigned __int8 *)v33 + 24);
  if (a5 && !*((_BYTE *)v33 + 24))
    *a5 = objc_retainAutorelease((id)v27[5]);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17 != 0;
}

- (id)fetchZonesToSaveToDatabaseWithScope:(int64_t)a3 error:(id *)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  __CFString *v9;
  KCSharingStore *v10;
  id v11;

  if (a3 != 2)
    return &__NSArray0__struct;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019011C;
  v8[3] = &unk_1002EA1A0;
  v9 = CFSTR("SELECT o.zone                       FROM sharingOutgoingQueue o                       WHERE (o.agrp, o.ownr, o.uuid) = (?1, ?2, ?3) AND                             NOT o.deln AND                             NOT EXISTS(                                SELECT 1 FROM sharingMirror m                                 WHERE (m.agrp, m.ownr, m.zone, m.uuid) = (o.agrp, o.ownr, o.zone, o.uuid)                            )");
  v10 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v5;
  if (-[KCSharingStore withConnection:error:](v10, "withConnection:error:", v8, a4))
    v6 = objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return v6;
}

- (id)fetchZoneIDsToDeleteFromDatabaseWithScope:(int64_t)a3 error:(id *)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  __CFString *v9;
  KCSharingStore *v10;
  id v11;

  if (a3 != 2)
    return &__NSArray0__struct;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018FED0;
  v8[3] = &unk_1002EA1A0;
  v9 = CFSTR("SELECT o.zone                       FROM sharingOutgoingQueue o                       WHERE (o.agrp, o.ownr, o.uuid) = (?1, ?2, ?3) AND                             o.deln");
  v10 = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = v5;
  if (-[KCSharingStore withConnection:error:](v10, "withConnection:error:", v8, a4))
    v6 = objc_msgSend(v5, "copy");
  else
    v6 = 0;

  return v6;
}

- (id)fetchOutgoingRecordWithRecordID:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  KCSharingStore *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10018D5B8;
  v16 = sub_10018D5C8;
  v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018FE2C;
  v8[3] = &unk_1002EA420;
  v9 = self;
  v5 = a3;
  v10 = v5;
  v11 = &v12;
  if (-[KCSharingStore withConnection:error:](v9, "withConnection:error:", v8, a4))
    v6 = (id)v13[5];
  else
    v6 = 0;

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)fetchOutgoingChangesWithCursor:(id)a3 maxChangeCount:(int64_t)a4 maxBatchSizeInBytes:(int64_t)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  KCSharingRowMapper *v13;
  id v14;
  _QWORD *v15;
  KCSharingRowMapper *v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  KCSharingRowMapper *v22;
  _QWORD *v23;
  _QWORD *v24;
  KCSharingOutgoingChangesetCursor *v25;
  KCSharingOutgoingChangeset *v26;
  _QWORD v31[4];
  id v32;
  KCSharingRowMapper *v33;
  KCSharingStore *v34;
  id v35;
  id v36;
  int64_t v37;
  SEL v38;
  _QWORD v39[4];
  KCSharingRowMapper *v40;
  id v41;
  id v42;
  id v43;
  _QWORD *v44;
  int64_t v45;
  _QWORD v46[4];
  _QWORD v47[4];
  id v48;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyset"));
  v12 = objc_msgSend(v11, "mutableCopy");

  v13 = -[KCSharingRowMapper initWithModel:]([KCSharingRowMapper alloc], "initWithModel:", objc_opt_class(KCSharingOutgoingRow));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10018E450;
  v47[3] = &unk_1002EA448;
  v14 = v8;
  v48 = v14;
  v15 = objc_retainBlock(v47);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10018E638;
  v39[3] = &unk_1002EA470;
  v16 = v13;
  v40 = v16;
  v17 = v10;
  v41 = v17;
  v18 = v12;
  v44 = v46;
  v45 = a5;
  v42 = v18;
  v19 = v9;
  v43 = v19;
  v20 = objc_retainBlock(v39);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10018E8B4;
  v31[3] = &unk_1002EA4E8;
  v21 = v14;
  v32 = v21;
  v22 = v16;
  v37 = a4;
  v33 = v22;
  v34 = self;
  v23 = v20;
  v35 = v23;
  v38 = a2;
  v24 = v15;
  v36 = v24;
  if (-[KCSharingStore withConnection:error:](self, "withConnection:error:", v31, a6))
  {
    v25 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:keyset:fetchBehavior:]([KCSharingOutgoingChangesetCursor alloc], "initWithDatabaseScope:keyset:fetchBehavior:", objc_msgSend(v21, "databaseScope"), v18, objc_msgSend(v21, "fetchBehavior"));
    v26 = -[KCSharingOutgoingChangeset initWithRecordsToSave:recordIDsToDelete:cursor:]([KCSharingOutgoingChangeset alloc], "initWithRecordsToSave:recordIDsToDelete:cursor:", v19, v17, v25);

  }
  else
  {
    v26 = 0;
  }

  _Block_object_dispose(v46, 8);
  return v26;
}

- (BOOL)updateMirrorWithSavedRecords:(id)a3 deletedRecordIDs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _QWORD v10[4];
  KCSharingStore *v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018DF10;
  v10[3] = &unk_1002EA1A0;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v7 = v13;
  v8 = v12;
  LOBYTE(a5) = -[KCSharingStore withConnection:error:](v11, "withConnection:error:", v10, a5);

  return (char)a5;
}

- (BOOL)updateMirrorWithDeletedZoneIDs:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[4];
  KCSharingStore *v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018DE78;
  v7[3] = &unk_1002EA150;
  v8 = self;
  v9 = a3;
  v5 = v9;
  LOBYTE(a4) = -[KCSharingStore withConnection:error:](v8, "withConnection:error:", v7, a4);

  return (char)a4;
}

- (BOOL)updateMirrorWithDeletedZoneIDs:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  unsigned __int8 v40;
  uint64_t v42;
  id *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55[2];

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](self, "plan"));
  v10 = objc_opt_class(KCSharingIncomingRow);
  v55[0] = 0;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10018DD78;
  v53[3] = &unk_1002EA1C8;
  v11 = v9;
  v54 = v11;
  v12 = -[KCSharingStore enumerateRowsInZoneIDs:forEntryModel:inTransaction:withError:usingBlock:](self, "enumerateRowsInZoneIDs:forEntryModel:inTransaction:withError:usingBlock:", v8, v10, a4, v55, v53);
  v17 = v55[0];
  if ((v12 & 1) != 0)
  {
    v43 = a5;

    v18 = objc_opt_class(KCSharingOutgoingRow);
    v52 = v17;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10018DDB8;
    v50[3] = &unk_1002EA1C8;
    v19 = v11;
    v51 = v19;
    v20 = -[KCSharingStore enumerateRowsInZoneIDs:forEntryModel:inTransaction:withError:usingBlock:](self, "enumerateRowsInZoneIDs:forEntryModel:inTransaction:withError:usingBlock:", v8, v18, a4, &v52, v50);
    v21 = v52;

    if ((v20 & 1) == 0)
    {
      sub_10004D598(v43, 30, v21, CFSTR("Enumerating outgoing rows in locally deleted zones"), v22, v23, v24, v25, (uint64_t)v43);
      v40 = 0;
      v39 = v51;
LABEL_10:
      v17 = v21;
      goto LABEL_11;
    }

    v26 = objc_opt_class(KCSharingMirrorEntry);
    v49 = v21;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10018DDF8;
    v47[3] = &unk_1002EA1C8;
    v27 = v19;
    v48 = v27;
    v28 = -[KCSharingStore enumerateRowsInZoneIDs:forEntryModel:inTransaction:withError:usingBlock:](self, "enumerateRowsInZoneIDs:forEntryModel:inTransaction:withError:usingBlock:", v8, v26, a4, &v49, v47);
    v17 = v49;

    if ((v28 & 1) != 0)
    {

      v46 = v17;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10018DE38;
      v44[3] = &unk_1002EA1C8;
      v33 = v27;
      v45 = v33;
      v34 = -[KCSharingStore enumerateRowsInZoneIDs:forLocalItemsInTransaction:withError:usingBlock:](self, "enumerateRowsInZoneIDs:forLocalItemsInTransaction:withError:usingBlock:", v8, a4, &v46, v44);
      v21 = v46;

      if ((v34 & 1) != 0)
      {

        v39 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
        v40 = objc_msgSend(v33, "applyInTransaction:withAccessGroups:error:", a4, v39, v43);
      }
      else
      {
        sub_10004D598(v43, 30, v21, CFSTR("Enumerating local Keychain items in locally deleted zones"), v35, v36, v37, v38, (uint64_t)v43);
        v40 = 0;
        v39 = v45;
      }
      goto LABEL_10;
    }
    sub_10004D598(v43, 30, v17, CFSTR("Enumerating mirror entries in locally deleted zones"), v29, v30, v31, v32, (uint64_t)v43);
    v40 = 0;
    v39 = v48;
  }
  else
  {
    sub_10004D598(a5, 30, v17, CFSTR("Enumerating incoming rows in locally deleted zones"), v13, v14, v15, v16, v42);
    v40 = 0;
    v39 = v54;
  }
LABEL_11:

  return v40;
}

- (BOOL)dropOutgoingChangeForRecordID:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD v7[4];
  KCSharingStore *v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018DCE0;
  v7[3] = &unk_1002EA150;
  v8 = self;
  v9 = a3;
  v5 = v9;
  LOBYTE(a4) = -[KCSharingStore withConnection:error:](v8, "withConnection:error:", v7, a4);

  return (char)a4;
}

- (BOOL)dropOutgoingChangeForRecordID:(id)a3 inTransaction:(__OpaqueSecDbConnection *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, sqlite3_stmt *, _QWORD *);
  void *v16;
  KCSharingStore *v17;
  id v18;
  id v19;
  __OpaqueSecDbConnection *v20;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10018D9F8;
  v16 = &unk_1002EA088;
  v17 = self;
  v18 = a3;
  v20 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingStore plan](v17, "plan"));
  v19 = v8;
  v9 = v18;
  if (sub_10014783C((uint64_t)a4, CFSTR("SELECT rowid FROM sharingOutgoingQueue                       WHERE (agrp, ownr, zone, uuid) = (?1, ?2, ?3, ?4)"), a5, &v13))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups", v13, v14, v15, v16, v17, v18, v19, v20));
    v11 = objc_msgSend(v8, "applyInTransaction:withAccessGroups:error:", a4, v10, a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)resetWithError:(id *)a3
{
  int v4;
  BOOL v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10018D5B8;
  v12 = sub_10018D5C8;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018D834;
  v7[3] = &unk_1002EAEE8;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  sub_1000339F0(dword_1003414E0, (uint64_t)v7);
  v4 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((_BYTE *)v15 + 24))
  {
    *a3 = objc_retainAutorelease((id)v9[5]);
    v4 = *((unsigned __int8 *)v15 + 24);
  }
  v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)wipeWithError:(id *)a3
{
  int v4;
  BOOL v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10018D5B8;
  v12 = sub_10018D5C8;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018D5D0;
  v7[3] = &unk_1002EAEE8;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  sub_1000339F0(dword_1003414E0, (uint64_t)v7);
  v4 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((_BYTE *)v15 + 24))
  {
    *a3 = objc_retainAutorelease((id)v9[5]);
    v4 = *((unsigned __int8 *)v15 + 24);
  }
  v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)wipeLocalPrivateKeysInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  v6 = KCSharingLogObject(CFSTR("KCSharingStore"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wiping local private keys...", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10018D5A0;
  v9[3] = &unk_1002EA528;
  v9[4] = a3;
  return sub_10014783C((uint64_t)a3, CFSTR("DELETE FROM keys WHERE ggrp <> ''"), a4, v9);
}

- (BOOL)wipeLocalPasswordsInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  v6 = KCSharingLogObject(CFSTR("KCSharingStore"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wiping local passwords...", buf, 2u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10018D588;
  v9[3] = &unk_1002EA528;
  v9[4] = a3;
  return sub_10014783C((uint64_t)a3, CFSTR("DELETE FROM inet WHERE ggrp <> ''"), a4, v9);
}

- (BOOL)resetSyncTablesInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _QWORD v23[3];
  _BYTE v24[128];

  v7 = KCSharingLogObject(CFSTR("KCSharingStore"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wiping sync tables...", buf, 2u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v23[0] = CFSTR("DELETE FROM sharingIncomingQueue WHERE agrp = ?");
  v23[1] = CFSTR("DELETE FROM sharingMirror WHERE agrp = ?");
  v23[2] = CFSTR("DELETE FROM sharingOutgoingQueue WHERE agrp = ?");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10018D4E0;
        v17[3] = &unk_1002E9FC8;
        v17[4] = self;
        v17[5] = a3;
        if (!sub_10014783C((uint64_t)a3, v14, a4, v17))
        {
          v15 = 0;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (BOOL)resetMetadataInTransaction:(__OpaqueSecDbConnection *)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  CFDictionaryRef *v10;
  CFDictionaryRef *v11;
  void *v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  BOOL v15;
  BOOL v16;
  __CFString *v17;
  id v18;
  void *v19;
  _QWORD v21[7];
  Block_layout v22;
  CFDictionaryRef *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  char v32;
  __CFString *v33;

  v7 = KCSharingLogObject(CFSTR("KCSharingStore"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Wiping local metadata...", buf, 2u);
  }

  v33 = 0;
  v9 = sub_1000119B8((uint64_t)CFSTR("genp"), &qword_100341240, (uint64_t)&unk_100341238);
  v10 = (CFDictionaryRef *)sub_1000114E8(v9, 0, 0, 0, &v33);
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore accessGroups](self, "accessGroups"));
    v13 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entryAccessGroup"));
    sub_100012178(kSecAttrAccessGroup, v13, (uint64_t)v11);

    v14 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(-[KCSharingStore metadataDomain](self, "metadataDomain"));
    sub_100012178(kSecAttrService, v14, (uint64_t)v11);

    *(_QWORD *)buf = 0;
    v30 = buf;
    v31 = 0x2020000000;
    v32 = 1;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v24 = 0;
    v21[6] = a3;
    v22.isa = _NSConcreteStackBlock;
    *(_QWORD *)&v22.flags = 3221225472;
    v22.invoke = (void (*)(void *, ...))sub_10018D42C;
    v22.descriptor = (Block_descriptor_1 *)&unk_1002EA5C8;
    v23 = v11;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10018D464;
    v21[3] = &unk_1002EA610;
    v21[4] = &v25;
    v21[5] = buf;
    v15 = sub_10001E280(v11, (uint64_t)a3, (CFTypeRef *)&v24, &stru_1002EA5A8, &v22, 0, 0, (uint64_t)v21);
    sub_100011108((const void **)v11, 0);
    if (v15)
    {
      if (v30[24])
      {
        v16 = 1;
LABEL_21:
        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(buf, 8);
        return v16;
      }
      v19 = (void *)v26[3];
      if (a4)
      {
        v16 = 0;
        *a4 = v19;
        v26[3] = 0;
        goto LABEL_21;
      }
      if (v19)
      {
        v26[3] = 0;
        CFRelease(v19);
      }
    }
    else
    {
      v18 = v24;
      if (a4)
      {
        v16 = 0;
        *a4 = v24;
        goto LABEL_21;
      }
      if (v24)
      {
        v24 = 0;
        CFRelease(v18);
      }
    }
    v16 = 0;
    goto LABEL_21;
  }
  v17 = v33;
  if (a4)
  {
    *a4 = v33;
  }
  else if (v33)
  {
    v33 = 0;
    CFRelease(v17);
  }
  return 1;
}

- (id)fetchAllEntriesForModel:(Class)a3 withTransform:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  Class v15;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10018D194;
  v12[3] = &unk_1002EA688;
  v14 = a4;
  v15 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = v8;
  v9 = v14;
  if (-[KCSharingStore withConnection:error:](self, "withConnection:error:", v12, a5))
    v10 = objc_msgSend(v8, "copy");
  else
    v10 = 0;

  return v10;
}

- (id)fetchAllCKSharesInMirrorForGroupID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018CE1C;
  v11[3] = &unk_1002EA6B0;
  v14 = objc_opt_class(KCSharingMirrorEntry);
  v12 = v6;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = v7;
  v8 = v6;
  if (-[KCSharingStore withConnection:error:](self, "withConnection:error:", v11, a4))
    v9 = objc_msgSend(v7, "copy");
  else
    v9 = 0;

  return v9;
}

- (id)fetchAllSharingGroupsInMirrorWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore fetchAllCKSharesInMirrorForGroupID:error:](self, "fetchAllCKSharesInMirrorForGroupID:error:", 0, a3));
  if (!v4 || a3 && *a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = sub_10004D234(*(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10));
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          if (v12)
            objc_msgSend(v5, "addObject:", v12, (_QWORD)v14);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (id)fetchCKShareFromMirrorForGroupID:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingStore fetchAllCKSharesInMirrorForGroupID:error:](self, "fetchAllCKSharesInMirrorForGroupID:error:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (id)fetchAllMirrorEntriesWithError:(id *)a3
{
  uint64_t v5;

  v5 = objc_opt_class(KCSharingMirrorEntry);
  return -[KCSharingStore fetchAllEntriesForModel:withTransform:error:](self, "fetchAllEntriesForModel:withTransform:error:", v5, &stru_1002EA6F0, a3);
}

- (id)fetchAllIncomingRowsWithError:(id *)a3
{
  uint64_t v5;

  v5 = objc_opt_class(KCSharingIncomingEntry);
  return -[KCSharingStore fetchAllEntriesForModel:withTransform:error:](self, "fetchAllEntriesForModel:withTransform:error:", v5, &stru_1002EA710, a3);
}

- (id)fetchAllOutgoingRowsWithError:(id *)a3
{
  uint64_t v5;

  v5 = objc_opt_class(KCSharingOutgoingEntry);
  return -[KCSharingStore fetchAllEntriesForModel:withTransform:error:](self, "fetchAllEntriesForModel:withTransform:error:", v5, &stru_1002EA730, a3);
}

- (KCSharingAccessGroups)accessGroups
{
  return self->_accessGroups;
}

- (NSString)metadataDomain
{
  return self->_metadataDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDomain, 0);
  objc_storeStrong((id *)&self->_accessGroups, 0);
  objc_storeStrong(&self->_connection, 0);
}

@end
