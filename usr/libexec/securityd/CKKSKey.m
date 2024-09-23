@implementation CKKSKey

+ (id)isItemKeyForKeychainView:(SecDbItem *)a3
{
  const void *v4;
  void *v5;
  const void *v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unsigned __int8 v20;

  v4 = sub_10000C1D0(a3, kSecAttrAccessGroup);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = sub_10000C1D0(a3, kSecAttrDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_10000C1D0(a3, kSecAttrServer);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  if (v5)
    v11 = v7 == 0;
  else
    v11 = 1;
  if (v11 || v9 == 0)
    goto LABEL_23;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (objc_msgSend(v5, "isEqual:", v13))
    goto LABEL_22;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (objc_msgSend(v7, "isEqual:", v14))
  {
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if ((objc_msgSend(v10, "isEqual:", v15) & 1) != 0
    || !objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.security.ckks")))
  {

    goto LABEL_21;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("tlk")) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-nonsync"), CFSTR("tlk")));
    if ((objc_msgSend(v7, "isEqualToString:", v16) & 1) != 0)
    {
LABEL_17:

      goto LABEL_18;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-piggy"), CFSTR("tlk")));
    if ((objc_msgSend(v7, "isEqualToString:", v17) & 1) != 0
      || (objc_msgSend(v7, "isEqualToString:", CFSTR("classA")) & 1) != 0)
    {

      goto LABEL_17;
    }
    v20 = objc_msgSend(v7, "isEqualToString:", CFSTR("classC"));

    if ((v20 & 1) != 0)
      goto LABEL_19;
LABEL_23:
    v18 = 0;
    goto LABEL_24;
  }
LABEL_18:

LABEL_19:
  v18 = v10;
LABEL_24:

  return v18;
}

- (CKKSKey)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKSKey;
  return -[CKKSKey init](&v3, "init");
}

- (id)initSelfWrappedWithAESKey:(id)a3 contextID:(id)a4 uuid:(id)a5 keyclass:(id)a6 state:(id)a7 zoneID:(id)a8 encodedCKRecord:(id)a9 currentkey:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CKKSKey *v20;
  CKKSKey *v21;
  uint64_t v22;
  id v23;
  CKKSKeychainBackedKey *keycore;
  CKKSKeychainBackedKey *v25;
  void *v26;
  uint64_t v27;
  NSData *wrappedKeyDataBackingStore;
  CKKSKey *v29;
  id obj;
  id v32;
  id v33;
  objc_super v34;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  obj = a7;
  v32 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CKKSKey;
  v20 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v34, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("synckey"), a9, a4, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v21->_parentKeyUUID, a5);
    objc_storeStrong((id *)&v21->_keyclass, a6);
    v33 = 0;
    v22 = objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey keyWrappedBySelf:uuid:keyclass:zoneID:error:](CKKSKeychainBackedKey, "keyWrappedBySelf:uuid:keyclass:zoneID:error:", v16, v17, v18, v19, &v33));
    v23 = v33;
    keycore = v21->_keycore;
    v21->_keycore = (CKKSKeychainBackedKey *)v22;

    v25 = v21->_keycore;
    if (!v25)
    {

      v29 = 0;
      goto LABEL_6;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](v25, "wrappedkey"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "wrappedData"));
    wrappedKeyDataBackingStore = v21->_wrappedKeyDataBackingStore;
    v21->_wrappedKeyDataBackingStore = (NSData *)v27;

    v21->_currentkey = a10 != 0;
    objc_storeStrong((id *)&v21->_state, obj);

  }
  v29 = v21;
LABEL_6:

  return v29;
}

- (CKKSKey)initWithWrappedKeyData:(id)a3 contextID:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 state:(id)a8 zoneID:(id)a9 encodedCKRecord:(id)a10 currentkey:(int64_t)a11
{
  id v18;
  CKKSKey *v19;
  CKKSKey *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)CKKSKey;
  v19 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v26, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("synckey"), a10, a4, a9);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_wrappedKeyDataBackingStore, a3);
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v20->_parentKeyUUID, a6);
    objc_storeStrong((id *)&v20->_keyclass, a7);
    v20->_currentkey = a11 != 0;
    objc_storeStrong((id *)&v20->_state, a8);
  }

  return v20;
}

- (CKKSKey)initWithKeyCore:(id)a3 contextID:(id)a4 state:(id)a5 currentkey:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  CKKSKey *v15;
  void *v16;
  uint64_t v17;
  NSData *wrappedKeyDataBackingStore;
  uint64_t v19;
  NSString *uuid;
  uint64_t v21;
  NSString *parentKeyUUID;
  uint64_t v23;
  SecCKKSKeyClass *keyclass;
  objc_super v26;

  v11 = a3;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "zoneID"));
  v26.receiver = self;
  v26.super_class = (Class)CKKSKey;
  v15 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:](&v26, "initWithCKRecordType:encodedCKRecord:contextID:zoneID:", CFSTR("synckey"), 0, v13, v14);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_keycore, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](v15->_keycore, "wrappedkey"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "wrappedData"));
    wrappedKeyDataBackingStore = v15->_wrappedKeyDataBackingStore;
    v15->_wrappedKeyDataBackingStore = (NSData *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
    uuid = v15->_uuid;
    v15->_uuid = (NSString *)v19;

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentKeyUUID"));
    parentKeyUUID = v15->_parentKeyUUID;
    v15->_parentKeyUUID = (NSString *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keyclass"));
    keyclass = v15->_keyclass;
    v15->_keyclass = (SecCKKSKeyClass *)v23;

    v15->_currentkey = a6;
    objc_storeStrong((id *)&v15->_state, a5);
  }

  return v15;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKKSKey;
  -[CKKSKey dealloc](&v2, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_opt_class(CKKSKey);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentKeyUUID"));
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedKeyData"));
        if (objc_msgSend(v11, "isEqualToData:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
          if (objc_msgSend(v13, "isEqual:"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
            v18 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyclass"));
            v15 = objc_msgSend(v17, "isEqual:", v14);

            v13 = v18;
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)getKeychainBackedKey:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CKKSWrappedAESSIVKey *v9;
  void *v10;
  CKKSWrappedAESSIVKey *v11;
  CKKSKeychainBackedKey *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKKSKeychainBackedKey *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
    v8 = objc_msgSend(v7, "length");

    if (v8 == (id)80)
    {
      v9 = [CKKSWrappedAESSIVKey alloc];
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
      v11 = -[CKKSWrappedAESSIVKey initWithData:](v9, "initWithData:", v10);

      v12 = [CKKSKeychainBackedKey alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
      v17 = -[CKKSKeychainBackedKey initWithWrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:](v12, "initWithWrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:", v11, v13, v14, v15, v16);
      -[CKKSKey setKeycore:](self, "setKeycore:", v17);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    }
    else
    {
      v6 = 0;
      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -50, CFSTR("Wrong key size")));
    }
  }
  return v6;
}

- (NSData)wrappedKeyData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v20[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));

  if (!v3)
    return (NSData *)(id)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wrappedkey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "wrappedData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
  v8 = objc_msgSend(v6, "isEqualToData:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    v11 = sub_10000BDF4(CFSTR("ckkskey"), v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Probable bug: wrapped key data does not match cached version", v20, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wrappedkey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "wrappedData"));
    -[CKKSKey setWrappedKeyDataBackingStore:](self, "setWrappedKeyDataBackingStore:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "wrappedkey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "wrappedData"));

  return (NSData *)v18;
}

- (NSString)zoneName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "zoneName"));

  return (NSString *)v3;
}

- (BOOL)wrapsSelf
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)wrapUnder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keycore")),
        v10 = objc_msgSend(v8, "wrapUnder:error:", v9, a4),
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentKeyUUID"));
    -[CKKSKey setParentKeyUUID:](self, "setParentKeyUUID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "wrappedkey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "wrappedData"));
    -[CKKSKey setWrappedKeyDataBackingStore:](self, "setWrappedKeyDataBackingStore:", v15);

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)topKeyInAnyState:(id *)a3
{
  id v5;
  CKKSKey *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  CKKSKey *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = self;
  if (!v6)
    goto LABEL_11;
  do
  {
    if (-[CKKSKey wrapsSelf](v6, "wrapsSelf"))
    {
      v6 = v6;
      v12 = v6;
      goto LABEL_12;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v6, "uuid"));
    v8 = objc_msgSend(v5, "containsObject:", v7);

    if (v8)
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v6, "uuid"));
    objc_msgSend(v5, "addObject:", v9);

    v18[0] = CFSTR("UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](v6, "parentKeyUUID"));
    v18[1] = CFSTR("state");
    v19[0] = v10;
    v19[1] = CFSTR("remote");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    v12 = (CKKSKey *)objc_claimAutoreleasedReturnValue(+[CKKSSQLDatabaseObject tryFromDatabaseWhere:error:](CKKSKey, "tryFromDatabaseWhere:error:", v11, a3));

    if (!v12)
    {
      v16 = CFSTR("UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](v6, "parentKeyUUID"));
      v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
      v12 = (CKKSKey *)objc_claimAutoreleasedReturnValue(+[CKKSSQLDatabaseObject fromDatabaseWhere:error:](CKKSKey, "fromDatabaseWhere:error:", v14, a3));

    }
    v6 = v12;
  }
  while (v12);
  if (a3)
  {
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 54, CFSTR("Circular reference in key hierarchy")));
  }
  else
  {
LABEL_11:
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)ensureKeyLoadedForContextID:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  id v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v24 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ensureKeyLoadedFromKeychain:", &v24));
  v9 = v24;

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  }
  else
  {
    v23 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey unwrapViaKeyHierarchy:](self, "unwrapViaKeyHierarchy:", &v23));
    v13 = v23;

    if (v12)
    {
      v22 = 0;
      v14 = -[CKKSKey saveKeyMaterialToKeychain:](self, "saveKeyMaterialToKeychain:", &v22);
      v15 = v22;
      v16 = v15;
      if (!v14 || v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
        v19 = sub_10000BDF4(CFSTR("ckkskey"), v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Resaving missing key failed, continuing: %@", buf, 0xCu);
        }

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));

    }
    else if (a4)
    {
      if (v13)
        v21 = v13;
      else
        v21 = v9;
      v10 = 0;
      *a4 = objc_retainAutorelease(v21);
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)unwrapViaKeyHierarchy:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
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
  id v33;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aessivkey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aessivkey"));

    return v10;
  }
  else
  {
    v33 = 0;
    v12 = objc_msgSend(v8, "loadKeyMaterialFromKeychain:", &v33);
    v13 = v33;

    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aessivkey"));

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
      v17 = objc_msgSend(v16, "isEqual:", CFSTR("tlk"));

      if (!v17)
        goto LABEL_12;
      v18 = objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
      if (!v18
        || (v19 = (void *)v18,
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID")),
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid")),
            v22 = objc_msgSend(v20, "isEqualToString:", v21),
            v21,
            v20,
            v19,
            v22))
      {
        v15 = 0;
        if (a3)
          *a3 = objc_retainAutorelease(v13);
      }
      else
      {
LABEL_12:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey fromDatabaseAnyState:contextID:zoneID:error:](CKKSKey, "fromDatabaseAnyState:contextID:zoneID:error:", v23, v24, v25, a3));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "unwrapViaKeyHierarchy:", a3));
        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "wrappedkey"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "unwrapAESKey:error:", v29, a3));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
          objc_msgSend(v31, "setAessivkey:", v30);

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "aessivkey"));

        }
        else
        {
          v15 = 0;
        }

      }
    }

    return v15;
  }
}

- (BOOL)unwrapViaTLKSharesTrustedBy:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  BOOL v26;
  CKKSKey *v27;
  BOOL v28;
  void *v29;
  id v30;
  NSObject *v31;
  CKKSKey *v32;
  id *v34;
  id v35;
  id v36;
  id obj;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  CKKSKey *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v44 = 0;
    v12 = objc_claimAutoreleasedReturnValue(+[CKKSTLKShareRecord allForUUID:contextID:zoneID:error:](CKKSTLKShareRecord, "allForUUID:contextID:zoneID:error:", v10, v9, v11, &v44));
    v13 = v44;

    v38 = (void *)v12;
    if (!v12 || v13)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
      v30 = sub_10000BDF4(CFSTR("ckksshare"), v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v46 = self;
        v47 = 2112;
        v48 = v13;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Unable to load TLK shares for TLK(%@): %@", buf, 0x16u);
      }

      if (a5)
      {
        v13 = objc_retainAutorelease(v13);
        v28 = 0;
        *a5 = v13;
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v34 = a5;
      v35 = v9;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v36 = v8;
      obj = v8;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v41;
        while (2)
        {
          v18 = 0;
          v19 = v16;
          do
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v18);
            v39 = 0;
            v21 = objc_msgSend(v20, "unwrapKey:fromShares:error:", self, v38, &v39);
            v16 = v39;
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
            v23 = sub_10000BDF4(CFSTR("ckksshare"), v22);
            v24 = objc_claimAutoreleasedReturnValue(v23);

            v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            if (v21)
              v26 = v16 == 0;
            else
              v26 = 0;
            if (v26)
            {
              if (v25)
              {
                v32 = (CKKSKey *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
                *(_DWORD *)buf = 138412546;
                v46 = v32;
                v47 = 2112;
                v48 = v20;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Recovered tlk (%@) from trust state (%@)", buf, 0x16u);

              }
              v28 = 1;
              goto LABEL_33;
            }
            if (v25)
            {
              v27 = (CKKSKey *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
              *(_DWORD *)buf = 138412802;
              v46 = v27;
              v47 = 2112;
              v48 = v20;
              v49 = 2112;
              v50 = v16;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to recover tlk (%@) from trust state (%@): %@", buf, 0x20u);

            }
            v18 = (char *)v18 + 1;
            v19 = v16;
          }
          while (v15 != v18);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v16 = 0;
      }

      if (v34)
      {
        v19 = objc_retainAutorelease(v16);
        v28 = 0;
        *v34 = v19;
      }
      else
      {
        v28 = 0;
        v19 = v16;
      }
LABEL_33:
      v9 = v35;
      v8 = v36;

      v13 = 0;
    }

  }
  else
  {
    v28 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 52, CFSTR("No current trust states; can't unwrap TLK")));
  }

  return v28;
}

- (BOOL)validTLK:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;

  v5 = -[CKKSKey wrapsSelf](self, "wrapsSelf");
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Potential TLK %@ doesn't wrap itself: %@"), self, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("CKKSErrorDomain"), 18, v7, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
    v10 = sub_10000BDF4(CFSTR("ckksshare"), v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error with TLK: %@", buf, 0xCu);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v8);

  }
  return v5;
}

- (BOOL)tlkMaterialPresentOrRecoverableViaTLKShareForContextID:(id)a3 forTrustStates:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  const char *v22;
  void *v23;
  id v24;
  unsigned int v25;
  id v26;
  id v27;
  unsigned int v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v10)
  {
    v42 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey ensureKeyLoadedForContextID:error:](self, "ensureKeyLoadedForContextID:error:", v8, &v42));
    v12 = v42;

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
      v41 = v12;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ensureKeyLoadedFromKeychain:", &v41));
      v14 = v41;

      if (v11 && !v14)
      {
        v40 = 0;
        v15 = -[CKKSKey trySelfWrappedKeyCandidate:error:](self, "trySelfWrappedKeyCandidate:error:", v11, &v40);
        v12 = v40;
        if ((v15 & 1) != 0)
        {
          v16 = 1;
LABEL_34:

          goto LABEL_35;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
        v24 = sub_10000BDF4(CFSTR("ckksshare"), v23);
        v20 = objc_claimAutoreleasedReturnValue(v24);

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v12;
          v22 = "Some key is present, but the key is not self-wrapped: %@";
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      v12 = v14;
    }
    v17 = objc_msgSend(v12, "code");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
    v19 = sub_10000BDF4(CFSTR("ckksshare"), v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v17 == (id)-25308)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        v44 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to load key due to lock state: %@", buf, 0xCu);
      }

      if (a5)
      {
        v12 = objc_retainAutorelease(v12);
        v16 = 0;
        *a5 = v12;
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_34;
    }
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      v44 = v12;
      v22 = "Do not yet have this key in the keychain: %@";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    }
LABEL_19:

    v39 = 0;
    v25 = -[CKKSKey unwrapViaTLKSharesTrustedBy:contextID:error:](self, "unwrapViaTLKSharesTrustedBy:contextID:error:", v9, v8, &v39);
    v26 = v39;
    v27 = v26;
    if (!v25 || v26)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
      v34 = sub_10000BDF4(CFSTR("ckksshare"), v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);

      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
        *(_DWORD *)buf = 138412546;
        v44 = v36;
        v45 = 2112;
        v46 = v27;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to unwrap tlk(%@) via shares: %@", buf, 0x16u);

      }
      if (!a5)
      {
        v16 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      v38 = 0;
      v16 = 1;
      v28 = -[CKKSKey saveKeyMaterialToKeychain:error:](self, "saveKeyMaterialToKeychain:error:", 1, &v38);
      v29 = v38;
      v27 = v29;
      if (v28 && !v29)
        goto LABEL_33;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
      v31 = sub_10000BDF4(CFSTR("ckksshare"), v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v27;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Errored saving TLK to keychain: %@", buf, 0xCu);
      }

      if (!a5)
      {
        v16 = 1;
LABEL_33:

        goto LABEL_34;
      }
    }
    v27 = objc_retainAutorelease(v27);
    v16 = 0;
    *a5 = v27;
    goto LABEL_33;
  }
  v16 = 0;
LABEL_35:

  return v16;
}

- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v9 = objc_msgSend(v8, "trySelfWrappedKeyCandidate:error:", v6, a4);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wrapAESKey:error:", v6, a4));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "unwrapAESKey:error:", v6, a4));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "encryptData:authenticatedData:error:", v8, v9, a5));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "decryptData:authenticatedData:error:", v8, v9, a5));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)saveKeyMaterialToKeychain:(id *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v7 = objc_msgSend(v6, "saveKeyMaterialToKeychain:error:", 1, a3);

  return v7;
}

- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (!v7)
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v9 = objc_msgSend(v8, "saveKeyMaterialToKeychain:error:", v5, a4);

  return v9;
}

- (BOOL)loadKeyMaterialFromKeychain:(id *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v7 = objc_msgSend(v6, "loadKeyMaterialFromKeychain:", a3);

  return v7;
}

- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  v7 = objc_msgSend(v6, "deleteKeyMaterialFromKeychain:", a3);

  return v7;
}

- (BOOL)saveToDatabaseAsOnlyCurrentKeyForClassAndState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  -[CKKSKey setCurrentkey:](self, "setCurrentkey:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey currentKeysForClass:contextID:state:zoneID:error:](CKKSKey, "currentKeysForClass:contextID:state:zoneID:error:", v5, v6, v7, v8, a3));

  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "setCurrentkey:", 0, (_QWORD)v18);
          if (!objc_msgSend(v15, "saveToDatabase:", a3))
          {

            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }

    v16 = -[CKKSSQLDatabaseObject saveToDatabase:](self, "saveToDatabase:", a3);
  }
  else
  {
LABEL_12:
    v16 = 0;
  }

  return v16;
}

- (void)setFromCKRecord:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordType"));
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("synckey"));

  if ((v5 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v16, CFSTR("synckey")));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v17, 0));

    objc_exception_throw(v18);
  }
  -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordName"));
  -[CKKSKey setUuid:](self, "setUuid:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordName"));
    -[CKKSKey setParentKeyUUID:](self, "setParentKeyUUID:", v11);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    -[CKKSKey setParentKeyUUID:](self, "setParentKeyUUID:", v9);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("class")));
  -[CKKSKey setKeyclass:](self, "setKeyclass:", v12);

  v13 = objc_alloc((Class)NSData);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v15 = objc_msgSend(v13, "initWithBase64EncodedString:options:", v14, 0);
  -[CKKSKey setWrappedKeyDataBackingStore:](self, "setWrappedKeyDataBackingStore:", v15);

  -[CKKSKey setKeycore:](self, "setKeycore:", 0);
  -[CKKSKey setState:](self, "setState:", CFSTR("remote"));

}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("synckey"));

  if ((v9 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CKRecordType (%@) was not %@"), v22, CFSTR("synckey")));
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongCKRecordTypeException"), v23, 0));

    objc_exception_throw(v24);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("parentkeyref"));
  }
  else
  {
    v13 = objc_alloc((Class)CKReference);
    v14 = objc_alloc((Class)CKRecordID);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
    v16 = objc_msgSend(v14, "initWithRecordName:zoneID:", v15, v7);
    v17 = objc_msgSend(v13, "initWithRecordID:action:", v16, CKReferenceActionValidate);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("parentkeyref"));

  }
  +[CKKSItem setOSVersionInRecord:](CKKSItem, "setOSVersionInRecord:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("class"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("wrappedkey"));

  return v6;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  BOOL v29;
  id v30;
  id v31;
  id v32;
  __int16 v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  uint8_t buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordType"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("synckey"));

  if (!v6)
    goto LABEL_20;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    v21 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v19 = "UUID does not match";
      v20 = buf;
      goto LABEL_9;
    }
LABEL_19:

LABEL_20:
    v29 = 0;
    goto LABEL_21;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentkeyref")));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentkeyref")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = sub_10000BDF4(CFSTR("ckkskey"), 0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v36 = 0;
        v19 = "wrapping key reference (non-self-wrapped) does not match";
        v20 = (uint8_t *)&v36;
LABEL_9:
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v19, v20, 2u);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else if (!-[CKKSKey wrapsSelf](self, "wrapsSelf"))
  {
    v31 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v18 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    v37 = 0;
    v19 = "wrapping key reference (self-wrapped) does not match";
    v20 = (uint8_t *)&v37;
    goto LABEL_9;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("class")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if ((v24 & 1) == 0)
  {
    v30 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v18 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    v35 = 0;
    v19 = "key class does not match";
    v20 = (uint8_t *)&v35;
    goto LABEL_9;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "base64EncodedStringWithOptions:", 0));
  v28 = objc_msgSend(v25, "isEqual:", v27);

  if ((v28 & 1) == 0)
  {
    v32 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v18 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    v34 = 0;
    v19 = "wrapped key does not match";
    v20 = (uint8_t *)&v34;
    goto LABEL_9;
  }
  v29 = 1;
LABEL_21:

  return v29;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%@](%@): %@ (%@,%@:%d)>"), v5, v6, v8, v9, v10, v11, -[CKKSKey currentkey](self, "currentkey")));

  return v12;
}

- (id)whereClauseToFindSelf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];

  v10[0] = CFSTR("contextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v11[0] = v3;
  v10[1] = CFSTR("UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v11[1] = v4;
  v10[2] = CFSTR("state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  v11[2] = v5;
  v10[3] = CFSTR("ckzone");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
  v11[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4));

  return v8;
}

- (id)sqlValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;
  void *v29;
  void *v31;
  _QWORD v32[9];
  _QWORD v33[9];

  v32[0] = CFSTR("contextID");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v33[0] = v31;
  v32[1] = CFSTR("UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v33[1] = v3;
  v32[2] = CFSTR("parentKeyUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  if (v4)
    v5 = objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  else
    v5 = objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v6 = (void *)v5;
  v33[2] = v5;
  v32[3] = CFSTR("ckzone");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));

  if (v8)
    v9 = v8;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10 = v9;

  v33[3] = v10;
  v32[4] = CFSTR("ckrecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "base64EncodedStringWithOptions:", 0));

  if (v12)
    v13 = v12;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14 = v13;

  v33[4] = v14;
  v32[5] = CFSTR("keyclass");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18 = v17;

  v33[5] = v18;
  v32[6] = CFSTR("state");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  v20 = v19;
  if (v19)
    v21 = v19;
  else
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v22 = v21;

  v33[6] = v22;
  v32[7] = CFSTR("wrappedkey");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "base64EncodedDataWithOptions:", 0));

  if (v24)
    v25 = v24;
  else
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v26 = v25;

  v33[7] = v26;
  v32[8] = CFSTR("currentkey");
  v27 = -[CKKSKey currentkey](self, "currentkey");
  v28 = CFSTR("0");
  if (v27)
    v28 = CFSTR("1");
  v33[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 9));

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKKSKey;
  v5 = -[CKKSCKRecordHolder copyWithZone:](&v9, "copyWithZone:");
  v6 = -[CKKSKeychainBackedKey copyWithZone:](self->_keycore, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 12);
  *((_QWORD *)v5 + 12) = v6;

  objc_storeStrong((id *)v5 + 11, self->_state);
  *((_BYTE *)v5 + 56) = self->_currentkey;
  return v5;
}

- (id)serializeAsProtobuf:(id *)a3
{
  void *v5;
  void *v6;
  CKKSSerializedKey *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  void *v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey ensureKeyLoadedForContextID:error:](self, "ensureKeyLoadedForContextID:error:", v5, a3));

  if (v6)
  {
    v7 = objc_alloc_init(CKKSSerializedKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    -[CKKSSerializedKey setUuid:](v7, "setUuid:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    -[CKKSSerializedKey setZoneName:](v7, "setZoneName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
    -[CKKSSerializedKey setKeyclass:](v7, "setKeyclass:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aessivkey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "aessivkey"));
    v16 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", v13 + 8, v15[11]);
    -[CKKSSerializedKey setKey:](v7, "setKey:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey data](v7, "data"));
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setParentKeyUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeyclass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SecCKKSProcessedState)state
{
  return (SecCKKSProcessedState *)objc_getProperty(self, a2, 88, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)currentkey
{
  return self->_currentkey;
}

- (void)setCurrentkey:(BOOL)a3
{
  self->_currentkey = a3;
}

- (CKKSKeychainBackedKey)keycore
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 96, 1);
}

- (void)setKeycore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSData)wrappedKeyDataBackingStore
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWrappedKeyDataBackingStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKeyDataBackingStore, 0);
  objc_storeStrong((id *)&self->_keycore, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)loadKeyWithUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;

  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey fromDatabase:contextID:zoneID:error:](CKKSKey, "fromDatabase:contextID:zoneID:error:", a3, v9, a5, a6));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ensureKeyLoadedForContextID:error:", v9, a6));

  if (v11)
    v11 = v10;

  return v11;
}

+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyclass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "randomKeyWrappedByParent:keyclass:error:", v6, v7, a4));

  return v8;
}

+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CKKSKey *v11;
  void *v12;
  CKKSKey *v13;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getKeychainBackedKey:", a5));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey randomKeyWrappedByParent:keyclass:error:](CKKSKeychainBackedKey, "randomKeyWrappedByParent:keyclass:error:", v9, v8, a5));
    if (v10)
    {
      v11 = [CKKSKey alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextID"));
      v13 = -[CKKSKey initWithKeyCore:contextID:state:currentkey:](v11, "initWithKeyCore:contextID:state:currentkey:", v10, v12, CFSTR("local"), 0);

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

+ (id)randomKeyWrappedBySelf:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  CKKSKey *v9;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey randomKeyWrappedBySelf:error:](CKKSKeychainBackedKey, "randomKeyWrappedBySelf:error:", a3, a5));
  if (v8)
    v9 = -[CKKSKey initWithKeyCore:contextID:state:currentkey:]([CKKSKey alloc], "initWithKeyCore:contextID:state:currentkey:", v8, v7, CFSTR("local"), 0);
  else
    v9 = 0;

  return v9;
}

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = CFSTR("UUID");
  v21[2] = CFSTR("state");
  v22[2] = CFSTR("local");
  v21[3] = CFSTR("ckzone");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v18, a6));

  return v19;
}

+ (id)fromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = CFSTR("UUID");
  v21[2] = CFSTR("ckzone");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabaseWhere:error:", v18, a6));

  return v19;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = CFSTR("UUID");
  v21[2] = CFSTR("state");
  v22[2] = CFSTR("local");
  v21[3] = CFSTR("ckzone");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v18, a6));

  return v19;
}

+ (id)tryFromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21[0] = CFSTR("contextID");
  v13 = v11;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = CFSTR("UUID");
  v21[2] = CFSTR("ckzone");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
  v22[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryFromDatabaseWhere:error:", v18, a6));

  return v19;
}

+ (id)selfWrappedKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[4];

  v8 = a3;
  v19[0] = CFSTR("UUID");
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSSQLWhereColumn op:column:](CKKSSQLWhereColumn, "op:column:", 1, 2));
  v20[0] = v10;
  v19[1] = CFSTR("contextID");
  v11 = v8;
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v14 = v13;

  v20[1] = v14;
  v20[2] = CFSTR("local");
  v19[2] = CFSTR("state");
  v19[3] = CFSTR("ckzone");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  v20[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v16, a5));

  return v17;
}

+ (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSCurrentKeyPointer fromDatabase:contextID:zoneID:error:](CKKSCurrentKeyPointer, "fromDatabase:contextID:zoneID:error:", a3, v10, v11, a6));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentKeyUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fromDatabase:contextID:zoneID:error:", v14, v10, v11, a6));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)currentKeysForClass:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];

  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a5;
  v15 = a6;
  v26[0] = v12;
  v25[0] = CFSTR("keyclass");
  v25[1] = CFSTR("contextID");
  v16 = v13;
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v19 = v18;

  v26[1] = v19;
  v26[2] = CFSTR("1");
  v25[2] = CFSTR("currentkey");
  v25[3] = CFSTR("state");
  v20 = CFSTR("local");
  if (v14)
    v20 = v14;
  v26[3] = v20;
  v25[4] = CFSTR("ckzone");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneName"));
  v26[4] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v22, a7));

  return v23;
}

+ (id)allKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v8 = a3;
  v9 = a4;
  v18[0] = CFSTR("contextID");
  v10 = v8;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v18[1] = CFSTR("ckzone");
  v19[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v19[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v15, a5));

  return v16;
}

+ (id)remoteKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];

  v8 = a3;
  v9 = a4;
  v18[0] = CFSTR("contextID");
  v10 = v8;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v19[0] = v13;
  v19[1] = CFSTR("remote");
  v18[1] = CFSTR("state");
  v18[2] = CFSTR("ckzone");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v19[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v15, a5));

  return v16;
}

+ (id)localKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];

  v8 = a3;
  v9 = a4;
  v18[0] = CFSTR("contextID");
  v10 = v8;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  v19[0] = v13;
  v19[1] = CFSTR("local");
  v18[1] = CFSTR("state");
  v18[2] = CFSTR("ckzone");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v19[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "allWhere:error:", v15, a5));

  return v16;
}

+ (id)sqlTable
{
  return CFSTR("synckeys");
}

+ (id)sqlColumns
{
  return &off_10030B750;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3;
  CKKSKey *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  CKKSKey *v15;
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

  v3 = a3;
  v4 = [CKKSKey alloc];
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wrappedkey")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "asBase64DecodedData"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextID")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "asString"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UUID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asString"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("parentKeyUUID")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "asString"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keyclass")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "asString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "asString"));
  v7 = objc_alloc((Class)CKRecordZoneID);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckzone")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asString"));
  v9 = objc_msgSend(v7, "initWithZoneName:ownerName:", v8, CKCurrentUserDefaultName);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ckrecord")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asBase64DecodedData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currentkey")));

  v15 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:](v4, "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:", v25, v5, v6, v18, v17, v14, v9, v11, objc_msgSend(v12, "asNSInteger"));
  return v15;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_10010A588;
  v24 = sub_10010A598;
  v25 = 0;
  v10 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v27[0] = v8;
  v26[0] = CFSTR("contextID");
  v26[1] = CFSTR("ckzone");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15 = v14;

  v27[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v19[1] = 3221225472;
  v19[2] = sub_10010A5A0;
  v19[3] = &unk_1002E9DF8;
  v19[4] = &v20;
  v19[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v11, v16, &off_10030B768, 0, 0, -1, v19, a5);

  v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

+ (id)countsByClassWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = objc_msgSend((id)objc_opt_class(a1), "sqlTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[0] = CFSTR("contextID");
  v21[1] = CFSTR("ckzone");
  v22[0] = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));

  if (v13)
    v14 = v13;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15 = v14;

  v22[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010A480;
  v19[3] = &unk_1002DE3E0;
  v17 = v10;
  v20 = v17;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:](CKKSSQLDatabaseObject, "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:", v12, v16, &off_10030B780, &off_10030B798, 0, -1, v19, a5);

  return v17;
}

+ (id)loadFromProtobuf:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  CKKSSerializedKey *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CKKSKey *v17;
  CKKSAESSIVKey *v18;
  id v19;
  id v20;
  void *v21;
  CKKSAESSIVKey *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;

  v7 = a4;
  v8 = a3;
  v9 = -[CKKSSerializedKey initWithData:]([CKKSSerializedKey alloc], "initWithData:", v8);

  if (!v9)
    goto LABEL_9;
  v10 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v9, "uuid"));
  if (!v10)
    goto LABEL_9;
  v11 = (void *)v10;
  v12 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v9, "zoneName"));
  if (!v12)
  {
LABEL_8:

    goto LABEL_9;
  }
  v13 = (void *)v12;
  v14 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v9, "keyclass"));
  if (!v14)
  {

    goto LABEL_8;
  }
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v9, "key"));

  if (v16)
  {
    v17 = [CKKSKey alloc];
    v18 = [CKKSAESSIVKey alloc];
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v9, "key")));
    v20 = objc_msgSend(v19, "bytes");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v9, "key"));
    v22 = -[CKKSAESSIVKey initWithBytes:len:](v18, "initWithBytes:len:", v20, objc_msgSend(v21, "length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v9, "uuid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v9, "keyclass"));
    v25 = objc_alloc((Class)CKRecordZoneID);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v9, "zoneName"));
    v27 = objc_msgSend(v25, "initWithZoneName:ownerName:", v26, CKCurrentUserDefaultName);
    v28 = -[CKKSKey initSelfWrappedWithAESKey:contextID:uuid:keyclass:state:zoneID:encodedCKRecord:currentkey:](v17, "initSelfWrappedWithAESKey:contextID:uuid:keyclass:state:zoneID:encodedCKRecord:currentkey:", v22, v7, v23, v24, CFSTR("remote"), v27, 0, 0);

    goto LABEL_11;
  }
LABEL_9:
  v28 = 0;
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 21, CFSTR("Data failed to parse as a CKKSSerializedKey")));
LABEL_11:

  return v28;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7
{
  _BOOL4 v8;
  CKKSKey *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CKKSKey *v16;
  CKKSKey *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  void *v38;
  void *v39;
  void *v40;
  CKKSKey *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  unsigned int v47;
  CKKSKey *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  unsigned int v59;
  CKKSKey *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  CKKSKey **v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  CKKSKey *v74;
  __int16 v75;
  CKKSKey *v76;

  v8 = a5;
  v10 = (CKKSKey *)a3;
  v11 = a4;
  v68 = a6;
  if (!v8)
  {
LABEL_17:
    v16 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]([CKKSKey alloc], "initWithCKRecord:contextID:", v10, v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v16, "uuid"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "zoneID"));
    v71 = 0;
    v28 = objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabase:contextID:zoneID:error:](CKKSKey, "tryFromDatabase:contextID:zoneID:error:", v38, v11, v40, &v71));
    v41 = (CKKSKey *)v71;

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "zoneID"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "zoneName"));
      v45 = sub_10000BDF4(CFSTR("ckkskey"), v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);

      v30 = v68;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v74 = v16;
        v75 = 2112;
        v76 = v41;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Error finding existing local key for %@: %@", buf, 0x16u);
      }

    }
    else
    {
      v30 = v68;
      if (v28 && -[NSObject matchesCKRecord:](v28, "matchesCKRecord:", v10))
      {
        -[NSObject setStoredCKRecord:](v28, "setStoredCKRecord:", v10);
        v70 = 0;
        v59 = -[NSObject saveToDatabase:](v28, "saveToDatabase:", &v70);
        v60 = (CKKSKey *)v70;
        v17 = v60;
        if (v59 && !v60)
          goto LABEL_24;
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID", a7));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "zoneID"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "zoneName"));
        v64 = sub_10000BDF4(CFSTR("ckkskey"), v63);
        v58 = objc_claimAutoreleasedReturnValue(v64);

        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v74 = (CKKSKey *)v28;
          v75 = 2112;
          v76 = v17;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Couldn't update existing key: %@: %@", buf, 0x16u);
        }
        goto LABEL_29;
      }
    }
    -[CKKSKey setState:](v16, "setState:", CFSTR("remote"), a7);
    -[CKKSKey setCurrentkey:](v16, "setCurrentkey:", 0);
    v69 = 0;
    v47 = -[CKKSSQLDatabaseObject saveToDatabase:](v16, "saveToDatabase:", &v69);
    v48 = (CKKSKey *)v69;
    v17 = v48;
    if (v47 && !v48)
    {
      objc_msgSend(v30, "_onqueueHandleFlag:", CFSTR("key_process_requested"));
LABEL_24:
      v29 = 1;
      goto LABEL_38;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "zoneID"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "zoneName"));
    v52 = sub_10000BDF4(CFSTR("ckkskey"), v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);

    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v16;
      v75 = 2112;
      v76 = v17;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Couldn't save key record to database: %@: %@", buf, 0x16u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "zoneID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "zoneName"));
    v57 = sub_10000BDF4(CFSTR("ckkskey"), v56);
    v58 = objc_claimAutoreleasedReturnValue(v57);

    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "CKRecord was %@", buf, 0xCu);
    }
LABEL_29:

    if (v67)
    {
      v17 = objc_retainAutorelease(v17);
      v29 = 0;
      *v67 = v17;
    }
    else
    {
      v29 = 0;
    }
    goto LABEL_38;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID"));
  v72 = 0;
  v16 = (CKKSKey *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:](CKKSKey, "tryFromDatabaseAnyState:contextID:zoneID:error:", v13, v11, v15, &v72));
  v17 = (CKKSKey *)v72;

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "zoneID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "zoneName"));
    v21 = sub_10000BDF4(CFSTR("ckksresync"), v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v17;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "error loading key: %@", buf, 0xCu);
    }

  }
  if (!v16)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "zoneID"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "zoneName"));
    v34 = sub_10000BDF4(CFSTR("ckksresync"), v33);
    v28 = objc_claimAutoreleasedReturnValue(v34);

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v10;
      v35 = "BUG: No sync key matching resynced CloudKit record: %@";
      v36 = v28;
      v37 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
    }
LABEL_16:

    goto LABEL_17;
  }
  v23 = -[CKKSKey matchesCKRecord:](v16, "matchesCKRecord:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneName"));
  v27 = sub_10000BDF4(CFSTR("ckksresync"), v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);

  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v16;
      v75 = 2112;
      v76 = v10;
      v35 = "BUG: Local sync key doesn't match resynced CloudKit record(s): %@ %@";
      v36 = v28;
      v37 = 22;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v74 = v10;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Already know about this sync key, skipping update: %@", buf, 0xCu);
  }
  v29 = 1;
  v30 = v68;
LABEL_38:

  return v29;
}

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v7 = a3;
  v8 = a4;
  while (1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v26 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:](CKKSKey, "tryFromDatabaseAnyState:contextID:zoneID:error:", v9, v8, v10, &v26));
    v12 = v26;

    if (!v11)
      break;
    v25 = 0;
    objc_msgSend(v11, "deleteFromDatabase:", &v25);
    v13 = v25;
    if (v13)
    {
      v19 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneName"));
      v22 = sub_10000BDF4(CFSTR("ckkskey"), v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v7;
        v29 = 2112;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Couldn't delete key record from database: %@: %@", buf, 0x16u);
      }

LABEL_13:
      v18 = 0;
      goto LABEL_15;
    }

  }
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
    v16 = sub_10000BDF4(CFSTR("ckkskey"), v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Couldn't load key record from database: %@: %@", buf, 0x16u);
    }

    if (a5)
    {
      v12 = objc_retainAutorelease(v12);
      v18 = 0;
      *a5 = v12;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  v18 = 1;
LABEL_15:

  return v18;
}

@end
