@implementation CKKSItemEncrypter

+ (id)padData:(id)a3 blockSize:(unint64_t)a4 additionalBlock:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint8_t v18[16];

  v5 = a5;
  v7 = a3;
  if (!a4)
  {
    v8 = sub_10000EF14("SecWarning");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CKKS padding function received invalid blocksize 0, using 1 instead", v18, 2u);
    }

    a4 = 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v7));
  v11 = (unint64_t)objc_msgSend(v10, "length");
  if (v5)
    v12 = a4;
  else
    v12 = 0;
  v13 = a4 + v12 + v11 / a4 * a4 - v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v13));
  objc_msgSend(v10, "appendData:", v14);

  v15 = objc_retainAutorelease(v10);
  v16 = objc_msgSend(v15, "mutableBytes");
  *((_BYTE *)objc_msgSend(v15, "length") + (_QWORD)v16 - v13) = 0x80;

  return v15;
}

+ (id)removePaddingFromData:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  id v5;
  char *v6;
  int v7;

  v3 = a3;
  v4 = (unsigned __int8 *)objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (char *)objc_msgSend(v5, "bytes") - 1;
  while (v4)
  {
    v7 = (v4--)[(_QWORD)v6];
    if (v7)
    {
      if (v7 == 128)
        v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subdataWithRange:", 0));
      else
        v4 = 0;
      break;
    }
  }

  return v4;
}

+ (id)encryptCKKSItem:(id)a3 dataDictionary:(id)a4 updatingCKKSItem:(id)a5 parentkey:(id)a6 keyCache:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
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
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  const __CFString *v40;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  const __CFString *v47;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v15)
    goto LABEL_4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter decryptItemToDictionary:keyCache:error:](CKKSItemEncrypter, "decryptItemToDictionary:keyCache:error:", v15, v17, a8));
  v19 = objc_msgSend(v18, "mutableCopy");

  if (v19)
  {
    objc_msgSend(v19, "addEntriesFromDictionary:", v14);

    v14 = v19;
LABEL_4:
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getKeychainBackedKey:", a8));
    if (v20
      && (v21 = objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey randomKeyWrappedByParent:error:](CKKSKeychainBackedKey, "randomKeyWrappedByParent:error:", v20, a8))) != 0)
    {
      v22 = (void *)v21;
      v45 = v13;
      v23 = -[CKKSItem initCopyingCKKSItem:]([CKKSItem alloc], "initCopyingCKKSItem:", v13);
      v44 = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uuid"));
      objc_msgSend(v23, "setParentKeyUUID:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "wrappedkey"));
      objc_msgSend(v23, "setWrappedkey:", v25);

      if (v15)
        objc_msgSend(v15, "encver");
      objc_msgSend(v23, "setEncver:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storedCKRecord"));

      if (v26)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storedCKRecord"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storedCKRecord"));
        v43 = v17;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "recordID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "zoneID"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "updateCKRecord:zoneID:", v42, v29));
        objc_msgSend(v23, "setStoredCKRecord:", v30);

        v17 = v43;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "makeAuthenticatedDataDictionaryUpdatingCKKSItem:encryptionVersion:", v15, objc_msgSend(v23, "encver")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "aessivkey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter encryptDictionary:key:authenticatedData:error:](CKKSItemEncrypter, "encryptDictionary:key:authenticatedData:error:", v14, v32, v31, a8));
      objc_msgSend(v23, "setEncitem:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "encitem"));
      if (v34)
        v35 = v23;
      else
        v35 = 0;

      v16 = v44;
      v13 = v45;
    }
    else
    {
      v35 = 0;
    }

    goto LABEL_22;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "zoneID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "zoneName"));
  v38 = sub_10000BDF4(CFSTR("ckme"), v37);
  v39 = objc_claimAutoreleasedReturnValue(v38);

  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    if (a8)
      v40 = (const __CFString *)*a8;
    else
      v40 = CFSTR("null error passed in");
    *(_DWORD *)buf = 138412290;
    v47 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't decrypt old CKMirror entry: %@", buf, 0xCu);
  }

  v35 = 0;
LABEL_22:

  return v35;
}

+ (id)decryptItemToDictionaryVersionNone:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "encitem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v5, 512, 0, a4));

  return v6;
}

+ (id)decryptItemToDictionaryVersion1or2:(id)a3 keyCache:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  int v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentKeyUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
  if (v9)
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "loadKeyForUUID:contextID:zoneID:error:", v10, v11, v12, a5));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[CKKSKey loadKeyWithUUID:contextID:zoneID:error:](CKKSKey, "loadKeyWithUUID:contextID:zoneID:error:", v10, v11, v12, a5));
  v14 = (void *)v13;

  if (v14
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wrappedkey")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unwrapAESKey:error:", v15, a5)),
        v15,
        v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "makeAuthenticatedDataDictionaryUpdatingCKKSItem:encryptionVersion:", v8, objc_msgSend(v8, "encver")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encitem"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "decryptDictionary:key:authenticatedData:error:", v18, v16, v17, a5));

    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoneID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "zoneName"));
      v22 = sub_10000BDF4(CFSTR("item"), v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *a5;
        v26 = 138412290;
        v27 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "ckks: couldn't decrypt item %@", (uint8_t *)&v26, 0xCu);
      }

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)decryptItemToDictionary:(id)a3 keyCache:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint8_t buf[4];
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "encver");
  if (v9 == (id)2 || v9 == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter decryptItemToDictionaryVersion1or2:keyCache:error:](CKKSItemEncrypter, "decryptItemToDictionaryVersion1or2:keyCache:error:", v7, v8, a5));
  }
  else
  {
    v21 = NSLocalizedDescriptionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unrecognized encryption version: %lu"), objc_msgSend(v7, "encver")));
    v22 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), 1, v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
    v16 = sub_10000BDF4(CFSTR("item"), v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "decryptItemToDictionary failed: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v13);

    v10 = 0;
  }

  return v10;
}

+ (id)encryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v9, 200, 0, a6));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("v_Data")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter padData:blockSize:additionalBlock:](CKKSItemEncrypter, "padData:blockSize:additionalBlock:", v13, 20, (unint64_t)objc_msgSend(v14, "length") < 0x14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encryptData:authenticatedData:error:", v15, v11, a6));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)decryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "decryptData:authenticatedData:error:", a3, a5, a6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSItemEncrypter removePaddingFromData:](CKKSItemEncrypter, "removePaddingFromData:", v7));

    if (v8)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v8, 512, 0, a6));
    }
    else
    {
      if (!a6)
        return 0;
      v10 = NSLocalizedDescriptionKey;
      v11 = CFSTR("Could not remove padding from decrypted item: malformed data");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
      v7 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -67673, v8));
    }

  }
  return v7;
}

@end
