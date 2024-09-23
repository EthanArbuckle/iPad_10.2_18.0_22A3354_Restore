@implementation KeyStore

- (void)RotateKeys:(void *)a3
{
  NSString *keyStorePath;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  id v13;
  void *v14;
  uint64_t (**i)(id);
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  double v34;
  _BOOL4 v35;
  NSObject *log_handle;
  id v37;
  NSObject *v38;
  ccec_cp *v39;
  uint64_t v40;
  uint64_t **v41;
  uint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSString *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  id v64;
  unsigned __int8 v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  unsigned __int8 v71;
  id v72;
  id v73;
  ccec_cp *v74;
  uint64_t v75;
  char *v76;
  int v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  NSMutableData *v81;
  id v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  uint64_t (*v88)(id);
  id v89;
  __int128 v90;
  __int128 v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  uint64_t (**v98)(id);
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  unsigned int v110;
  void *v111;
  _DWORD v112[10];
  _BYTE v113[128];

  if (!self->super.super._singleFileMode)
  {
    keyStorePath = self->super.super._keyStorePath;
    v109 = 0;
    v6 = sub_100015A64(keyStorePath, &v109, 420);
    v7 = v109;
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      log_handle = self->super.super._log_handle;
      if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
      {
        v112[0] = 138412290;
        *(_QWORD *)&v112[1] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, log_handle, OS_LOG_TYPE_ERROR, "Failed to setup the key-store directory.Error: %@", (uint8_t *)v112, 0xCu);
      }
      v13 = 0;
      goto LABEL_66;
    }
    v88 = (uint64_t (*)(id))a3;
    v89 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", self->super.super._keyStorePath, 0));

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v11 = v10;
    v93 = v11;
    v98 = (uint64_t (**)(id))objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    if (v98)
    {
      v92 = 0;
      v94 = 0;
      v95 = 0;
      v13 = 0;
      v14 = *(void **)v106;
      v96 = 0;
      v97 = v14;
      *(_QWORD *)&v12 = 138412290;
      v91 = v12;
      *(_QWORD *)&v12 = 138412546;
      v90 = v12;
      do
      {
        for (i = 0; i != v98; i = (uint64_t (**)(id))((char *)i + 1))
        {
          if (*(void **)v106 != v97)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), self->super.super._keyStorePath, v16));
          v110 = 0;
          v104 = 0;
          v18 = -[ReadOnlyKeyStore readKeyFile:::::](self, "readKeyFile:::::", v17, &v104, &v110, 0, 0);
          v19 = v104;
          v20 = v19;
          if ((v18 & 1) != 0)
          {
            if (v110 == 1)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileCreationDate"));
              if (!v96 || objc_msgSend(v94, "compare:", v21) == (id)1)
              {
                v22 = v17;

                v23 = v21;
                v94 = v23;
                v96 = v22;
              }
              if (!v95 || objc_msgSend(v92, "compare:", v21) == (id)-1)
              {
                v24 = v17;

                v25 = v21;
                v92 = v25;
                v95 = v24;
              }

            }
            else
            {
              v31 = self->super.super._log_handle;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v112[0]) = 0;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Current key does not match expected key format. Skipping", (uint8_t *)v112, 2u);
              }
            }
          }
          else
          {
            v26 = self->super.super._log_handle;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v112[0] = v91;
              *(_QWORD *)&v112[1] = v16;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Deleting unparseable file '%@'", (uint8_t *)v112, 0xCu);
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v103 = v13;
            v28 = objc_msgSend(v27, "removeItemAtPath:error:", v16, &v103);
            v29 = v103;

            if ((v28 & 1) == 0)
            {
              v30 = self->super.super._log_handle;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                v32 = v30;
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedDescription"));
                v112[0] = v90;
                *(_QWORD *)&v112[1] = v16;
                LOWORD(v112[3]) = 2112;
                *(_QWORD *)((char *)&v112[3] + 2) = v33;
                _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to delete file '%@'. Error: %@", (uint8_t *)v112, 0x16u);

              }
            }
            v13 = v29;
            v11 = v93;
          }

        }
        v98 = (uint64_t (**)(id))objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
      }
      while (v98);

      if (v95)
      {
        objc_msgSend(v92, "timeIntervalSinceNow");
        v35 = fabs(v34) > 432000.0;
      }
      else
      {
        v35 = 1;
      }
      v37 = v96;
      if (v96 && (objc_msgSend(v96, "isEqualToString:", v95) & 1) == 0)
      {
        v37 = objc_retainAutorelease(v96);
        unlink((const char *)objc_msgSend(v37, "UTF8String"));
        if (v35)
          goto LABEL_37;
      }
      else if (v35)
      {
        goto LABEL_37;
      }
      v70 = self->super.super._log_handle;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v112[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Reusing an existing key file", (uint8_t *)v112, 2u);
      }
      v110 = 0;
      v99 = 0;
      v100 = 0;
      v71 = -[ReadOnlyKeyStore readKeyFile:::::](self, "readKeyFile:::::", v95, 0, &v110, &v100, &v99);
      v72 = v100;
      v73 = v99;
      if ((v71 & 1) != 0)
      {
        v74 = -[ReadOnlyKeyStore getEccFormat:](self, "getEccFormat:", v110);
        __chkstk_darwin();
        v76 = (char *)&v88 - v75;
        v77 = ccec_x963_import_priv(&v74->var0, (unint64_t)objc_msgSend(v73, "length"), (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v73), "bytes"), (unint64_t **)((char *)&v88 - v75));
        if (v77)
        {
          v78 = v77;
          cc_clear(24 * v74->var0 + 16, v76);
          v79 = self->super.super._log_handle;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v112[0] = 67109120;
            v112[1] = v78;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to parse the current private key. CoreCrypto error %d", (uint8_t *)v112, 8u);
          }
        }
        else
        {
          v81 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", ((unint64_t)(cczp_bitlen((uint64_t)v74) + 7) >> 2) | 1);
          v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v81));
          ccec_x963_export(0, (char *)objc_msgSend(v82, "mutableBytes"), (uint64_t **)v76);
          cc_clear(24 * v74->var0 + 16, v76);
          if ((v88(v82) & 1) == 0)
          {
            v83 = self->super.super._log_handle;
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v112[0]) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Failed to call the new public key callback with an existing key", (uint8_t *)v112, 2u);
            }
          }

        }
      }
      else
      {
        v80 = self->super.super._log_handle;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v112[0]) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Failed to read existing key file", (uint8_t *)v112, 2u);
        }
      }

      goto LABEL_65;
    }

    v13 = 0;
    v37 = 0;
    v94 = 0;
    v95 = 0;
    v92 = 0;
LABEL_37:
    v96 = v37;
    v38 = self->super.super._log_handle;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v112[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Creating a new key file", (uint8_t *)v112, 2u);
    }
    v39 = -[ReadOnlyKeyStore getEccFormat:](self, "getEccFormat:", 1);
    v98 = &v88;
    __chkstk_darwin();
    v41 = (uint64_t **)((char *)&v88 - v40);
    v42 = ccrng(0);
    ccecdh_generate_key((uint64_t *)v39, (uint64_t (**)(_QWORD, uint64_t, uint64_t *))v42, v41);
    v43 = 3 * ((unint64_t)(cczp_bitlen((uint64_t)v39) + 7) >> 3) + 1;
    v44 = ((unint64_t)(cczp_bitlen((uint64_t)v39) + 7) >> 2) | 1;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v43));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v44));
    v47 = objc_retainAutorelease(v45);
    ccec_x963_export(1, (char *)objc_msgSend(v47, "mutableBytes"), v41);
    v48 = objc_retainAutorelease(v46);
    ccec_x963_export(0, (char *)objc_msgSend(v48, "mutableBytes"), v41);
    cc_clear((32 * v39->var0) | 0x10, v41);
    memset(v112, 0, 32);
    v49 = ccsha256_di();
    v50 = objc_msgSend(v48, "length");
    v51 = objc_retainAutorelease(v48);
    ccdigest((uint64_t)v49, (size_t)v50, (char *)objc_msgSend(v51, "bytes"), (uint64_t)v112);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v112, 32));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 0x4D414749434B4559));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v54, CFSTR("magic"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v55, CFSTR("version"));

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v56, CFSTR("key_format"));

    v97 = v52;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v57, CFSTR("public_key_hash"));

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "base64EncodedStringWithOptions:", 0));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v58, CFSTR("full_key"));

    v59 = self->super.super._keyStorePath;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v60, "timeIntervalSince1970");
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%llu.key"), v59, (unint64_t)v61));

    v102 = v13;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v53, 0, &v102));
    v64 = v102;

    if (v63)
    {
      v101 = v64;
      v65 = objc_msgSend(v63, "writeToFile:options:error:", v62, 0x40000000, &v101);
      v13 = v101;

      if ((v65 & 1) != 0)
      {
        if ((v88(v51) & 1) == 0)
        {
          v66 = self->super.super._log_handle;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v110) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Failed to call the new public key callback", (uint8_t *)&v110, 2u);
          }
          unlink((const char *)objc_msgSend(objc_retainAutorelease(v62), "UTF8String"));
        }
      }
      else
      {
        v68 = self->super.super._log_handle;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v86 = v68;
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
          v110 = 138412290;
          v111 = v87;
          _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Failed to write to the new key file. Error: %@", (uint8_t *)&v110, 0xCu);

        }
      }
    }
    else
    {
      v67 = self->super.super._log_handle;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v84 = v67;
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedDescription"));
        v110 = 138412290;
        v111 = v85;
        _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Failed to generate JSON data for key file. Error: %@", (uint8_t *)&v110, 0xCu);

      }
      v13 = v64;
    }
    v69 = v97;

    v11 = v93;
LABEL_65:

    v8 = v89;
LABEL_66:

  }
}

@end
