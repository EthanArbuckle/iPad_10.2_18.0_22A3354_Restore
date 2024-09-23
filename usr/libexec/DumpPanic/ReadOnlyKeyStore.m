@implementation ReadOnlyKeyStore

- (ReadOnlyKeyStore)initWithKeyStorePath:(id)a3 :(id)a4
{
  id v7;
  id v8;
  ReadOnlyKeyStore *v9;
  ReadOnlyKeyStore *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  ReadOnlyKeyStore *v15;
  ReadOnlyKeyStore *result;
  uint64_t v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ReadOnlyKeyStore;
  v9 = -[ReadOnlyKeyStore init](&v20, "init");
  v10 = v9;
  if (!v9)
  {
LABEL_7:

    return v10;
  }
  if (v8)
  {
    objc_storeStrong((id *)&v9->_log_handle, a4);
    v11 = v7;
    if (v11)
    {
      v12 = v11;

      objc_storeStrong((id *)&v10->_keyStorePath, a3);
      v10->_isDefaultKeyStorePath = objc_msgSend(v12, "isEqualToString:", CFSTR("/private/var/db/DumpPanic/Keys"));
      v19 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      LODWORD(v12) = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v12, &v19);

      v14 = v19 ^ 1;
      if (!(_DWORD)v12)
        v14 = 0;
      v10->_singleFileMode = v14;
      v15 = v10;
      goto LABEL_7;
    }
  }
  else
  {
    v17 = _os_assert_log(0);
    v11 = (id)_os_crash(v17);
    __break(1u);
  }
  v18 = _os_assert_log(v11);
  result = (ReadOnlyKeyStore *)_os_crash(v18);
  __break(1u);
  return result;
}

- (id)init:(id)a3
{
  id v4;
  void *v5;
  ReadOnlyKeyStore *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/private/var/db/DumpPanic/Keys"));
  v6 = -[ReadOnlyKeyStore initWithKeyStorePath::](self, "initWithKeyStorePath::", v5, v4);

  return v6;
}

- (BOOL)unlock
{
  return 1;
}

- (BOOL)hasMatchingPrivateKey:(int)a3 :(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReadOnlyKeyStore getMatchingPrivateKey::](self, "getMatchingPrivateKey::", v4, v6));
  LOBYTE(v4) = v8 != 0;

  objc_autoreleasePoolPop(v7);
  return v4;
}

- (ccec_cp)getEccFormat:(int)a3
{
  NSObject *log_handle;
  _DWORD v6[2];

  if (a3 == 1)
    return (ccec_cp *)ccec_cp_256(self, a2);
  log_handle = self->_log_handle;
  if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_error_impl((void *)&_mh_execute_header, log_handle, OS_LOG_TYPE_ERROR, "Unknown key format %d", (uint8_t *)v6, 8u);
  }
  return 0;
}

- (BOOL)readKeyFile:(id)a3 :(id *)a4 :(int *)a5 :(id *)a6 :(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSFileAttributeType v16;
  NSObject *v17;
  NSObject *log_handle;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  int v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;

  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v62 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributesOfItemAtPath:error:", v12, &v62));
  v15 = v62;

  if (!v14)
  {
    log_handle = self->_log_handle;
    if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
    {
      v19 = log_handle;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v64 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to gather the file attributes for key file. Error: %@", buf, 0xCu);

    }
    goto LABEL_12;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v14);
  v16 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fileType"));

  if (v16 == NSFileTypeRegular)
  {
    if ((unint64_t)objc_msgSend(v14, "fileSize") > 0x2000)
    {
      v21 = self->_log_handle;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "File seems to be too large to be useful. Skipping", buf, 2u);
      }
      goto LABEL_12;
    }
    v61 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v12, 0, &v61));
    v25 = v61;

    if (!v24)
    {
      v37 = self->_log_handle;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v45 = v37;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v64 = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to read the file contents for key file. Error: %@", buf, 0xCu);

      }
      v22 = 0;
      v15 = v25;
      goto LABEL_73;
    }
    v60 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v24, 0, &v60));
    v59 = v60;

    if (v26)
    {
      v27 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        v58 = v26;
        v28 = v26;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("magic")));
        v30 = v29;
        if (v29)
        {
          if (objc_msgSend(v29, "unsignedLongLongValue") == (id)0x4D414749434B4559)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("version")));
            v57 = v31;
            if (v31)
            {
              if (objc_msgSend(v31, "unsignedIntValue") == 1)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("key_format")));
                if (!v32)
                {
                  v48 = 0;
                  v49 = self->_log_handle;
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Misformatted key file. Key format not found", buf, 2u);
                  }
                  v22 = 0;
                  goto LABEL_69;
                }
                v56 = v32;
                v33 = objc_msgSend(v32, "intValue");
                if (!v33 || v33 >= 2)
                {
                  v50 = v33;
                  v51 = self->_log_handle;
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v64) = v50;
                    _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Unsupported key format in key file: %d", buf, 8u);
                  }
                  goto LABEL_67;
                }
                *a5 = v33;
                if (a6)
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("public_key_hash")));
                  if (v34)
                  {
                    v35 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v34, 0);
                    *a6 = v35;
                    if (v35)
                    {

                      goto LABEL_28;
                    }
                    v52 = self->_log_handle;
                    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      goto LABEL_66;
                    *(_WORD *)buf = 0;
                    v53 = "Failed to parse the Base64-encoded hash";
                  }
                  else
                  {
                    v52 = self->_log_handle;
                    if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      goto LABEL_66;
                    *(_WORD *)buf = 0;
                    v53 = "Misformatted key file. Public key hash not found";
                  }
LABEL_65:
                  _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v53, buf, 2u);
                  goto LABEL_66;
                }
LABEL_28:
                if (!a7)
                {
LABEL_32:
                  v22 = 1;
LABEL_68:
                  v48 = v56;
LABEL_69:

                  goto LABEL_70;
                }
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("full_key")));
                if (v34)
                {
                  v36 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v34, 0);
                  *a7 = v36;
                  if (v36)
                  {

                    goto LABEL_32;
                  }
                  v52 = self->_log_handle;
                  if (!os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                    goto LABEL_66;
                  *(_WORD *)buf = 0;
                  v53 = "Failed to parse the Base64-encoded key";
                  goto LABEL_65;
                }
                v52 = self->_log_handle;
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v53 = "Misformatted key file. Full key not found";
                  goto LABEL_65;
                }
LABEL_66:

LABEL_67:
                v22 = 0;
                goto LABEL_68;
              }
              v47 = self->_log_handle;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                v54 = v47;
                v55 = objc_msgSend(v57, "intValue");
                *(_DWORD *)buf = 67109120;
                LODWORD(v64) = v55;
                _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Unknown file version %d", buf, 8u);

              }
            }
            else
            {
              v44 = self->_log_handle;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Misformatted key file. Version not found", buf, 2u);
              }
            }
            v22 = 0;
LABEL_70:

            goto LABEL_71;
          }
          v42 = self->_log_handle;
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
LABEL_44:
            v22 = 0;
LABEL_71:

            v26 = v58;
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v43 = "Misformatted key file. Mismatched magic";
        }
        else
        {
          v42 = self->_log_handle;
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            goto LABEL_44;
          *(_WORD *)buf = 0;
          v43 = "Not a key file. Magic not found";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
        goto LABEL_44;
      }
      v41 = self->_log_handle;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to parse the file contents as a dictionary", buf, 2u);
      }
    }
    else
    {
      v38 = self->_log_handle;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = v38;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v64 = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to parse the file contents as JSON. Error: %@", buf, 0xCu);

        v26 = 0;
      }
    }
    v22 = 0;
LABEL_72:

    v15 = v59;
LABEL_73:

    goto LABEL_13;
  }
  v17 = self->_log_handle;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping non-file type '%@'", buf, 0xCu);
  }
LABEL_12:
  v22 = 0;
LABEL_13:

  return v22;
}

- (id)getMatchingPrivateKey:(int)a3 :(id)a4
{
  uint64_t v4;
  id v6;
  ccec_cp *v7;
  unint64_t *p_var0;
  uint64_t *v9;
  uint64_t v10;
  unint64_t **v11;
  id v12;
  id v13;
  int v14;
  int v15;
  NSObject *log_handle;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  int v33;
  id v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  unsigned int v38;
  id v39;
  id v40;
  int v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  id v50;
  NSString *keyStorePath;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  id v55;
  int v56;
  id v57;
  _WORD v58[8];
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  int v69;
  NSString *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _OWORD __s2[2];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  memset(__s2, 0, sizeof(__s2));
  v7 = -[ReadOnlyKeyStore getEccFormat:](self, "getEccFormat:", v4);
  if (!v7)
  {
    v20 = 0;
    goto LABEL_50;
  }
  p_var0 = &v7->var0;
  v56 = v4;
  v9 = &v52;
  __chkstk_darwin();
  v11 = (unint64_t **)((char *)&v52 - v10);
  v12 = objc_msgSend(v6, "length");
  v13 = objc_retainAutorelease(v6);
  v14 = ccec_x963_import_pub(p_var0, (uint64_t)v12, (unsigned __int8 *)objc_msgSend(v13, "bytes"), v11);
  if (v14)
  {
    v15 = v14;
    cc_clear(24 * *p_var0 + 16, v11);
    log_handle = self->_log_handle;
    if (!os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    v69 = 67109120;
    LODWORD(v70) = v15;
    v17 = "Failed to parse the input public key with the given format. CoreCrypto error %d";
    v18 = log_handle;
    v19 = 8;
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v69, v19);
    goto LABEL_49;
  }
  v21 = ccec_validate_pub((uint64_t **)v11);
  cc_clear(24 * *p_var0 + 16, v11);
  if (!v21)
  {
    v24 = self->_log_handle;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    LOWORD(v69) = 0;
    v17 = "The input public key did not pass basic validation checks";
    v18 = v24;
    v19 = 2;
    goto LABEL_14;
  }
  v22 = ccsha256_di();
  ccdigest((uint64_t)v22, (size_t)objc_msgSend(v13, "length"), (char *)objc_msgSend(objc_retainAutorelease(v13), "bytes"), (uint64_t)__s2);
  if (os_variant_has_internal_diagnostics("com.apple.DumpPanic")
    && _os_feature_enabled_impl("DumpPanic", "OnlyUseNvramKeyStore")
    && self->_isDefaultKeyStorePath)
  {
    goto LABEL_49;
  }
  if (self->_singleFileMode)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    objc_msgSend(v23, "addObject:", self->_keyStorePath);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentsOfDirectoryAtPath:error:", self->_keyStorePath, 0));

    if (v26)
    {
      v53 = &v52;
      v54 = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v57 = v26;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v66 != v30)
              objc_enumerationMutation(v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), self->_keyStorePath, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i)));
            objc_msgSend(v23, "addObject:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
        }
        while (v29);
      }

      v9 = v53;
      v6 = v54;
      v26 = v57;
    }
    else
    {
      v23 = 0;
    }

  }
  v33 = v56;
  if (!v23)
  {
    v48 = self->_log_handle;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      keyStorePath = self->_keyStorePath;
      v69 = 138412290;
      v70 = keyStorePath;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to enumerate the directory at '%@'", (uint8_t *)&v69, 0xCu);
    }
    goto LABEL_48;
  }
  v53 = v9;
  v54 = v6;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v34 = v23;
  v57 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (!v57)
    goto LABEL_45;
  v35 = *(_QWORD *)v62;
  v55 = v34;
  while (2)
  {
    for (j = 0; j != v57; j = (char *)j + 1)
    {
      if (*(_QWORD *)v62 != v35)
        objc_enumerationMutation(v34);
      v37 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
      v69 = 0;
      v59 = 0;
      v60 = 0;
      v38 = -[ReadOnlyKeyStore readKeyFile:::::](self, "readKeyFile:::::", v37, 0, &v69, &v60, &v59);
      v39 = v60;
      v20 = v59;
      if (v38)
      {
        if (v69 != v33)
        {
          v46 = self->_log_handle;
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            goto LABEL_43;
          v58[0] = 0;
          v44 = v46;
          v45 = "Current key does not match input key format. Skipping";
          goto LABEL_40;
        }
        if (objc_msgSend(v39, "length") == (id)32)
        {
          v40 = objc_retainAutorelease(v39);
          v41 = memcmp(objc_msgSend(v40, "bytes"), __s2, (size_t)objc_msgSend(v40, "length"));
          v42 = self->_log_handle;
          v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if (!v41)
          {
            if (v43)
            {
              v58[0] = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Found a matching private key", (uint8_t *)v58, 2u);
            }

            v50 = v55;
            v6 = v54;
            goto LABEL_50;
          }
          v33 = v56;
          v34 = v55;
          if (v43)
          {
            v58[0] = 0;
            v44 = v42;
            v45 = "Mismatched key hashes. Skipping";
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)v58, 2u);
          }
        }
        else
        {
          v47 = self->_log_handle;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v58[0] = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Mismatched key hash lengths", (uint8_t *)v58, 2u);
          }
        }
      }
LABEL_43:

    }
    v57 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v57)
      continue;
    break;
  }
LABEL_45:

  v6 = v54;
LABEL_48:

LABEL_49:
  v20 = 0;
LABEL_50:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_handle, 0);
  objc_storeStrong((id *)&self->_keyStorePath, 0);
}

@end
