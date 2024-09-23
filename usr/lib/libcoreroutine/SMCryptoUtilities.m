@implementation SMCryptoUtilities

+ (id)getSerializedJsonData:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v10);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getSerializedJsonData,failed to serialize dict into JSON,error,%@", buf, 0xCu);
      }
      v6 = 0;
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\/"), CFSTR("/"));
      v5 = objc_claimAutoreleasedReturnValue();

      -[NSObject dataUsingEncoding:](v5, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v8;
      v6 = v3;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getSerializedJsonData,dict is nil", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)getDeserializedJsonDict:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v8;
  uint8_t buf[4];
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 1, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getDeserializedJsonDict,failed to deserialize json dictionary,error,%@", buf, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = v3;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getDeserializedJsonDict,jsonData is nil", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)getRandomBytes:(unint64_t)a3
{
  void *v4;
  const __SecRandom *v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_retainAutorelease(v4);
  v7 = SecRandomCopyBytes(v5, a3, (void *)objc_msgSend(v6, "mutableBytes"));
  if (v7)
  {
    v8 = v7;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,getRandomBytes,failed to generate AES key,error,%d", (uint8_t *)v12, 8u);
    }

    v10 = 0;
  }
  else
  {
    v10 = v6;
  }

  return v10;
}

+ (id)createAllowReadToken
{
  return +[SMCryptoUtilities getRandomBytes:](SMCryptoUtilities, "getRandomBytes:", 32);
}

+ (id)createSafetyCacheKey
{
  return +[SMCryptoUtilities getRandomBytes:](SMCryptoUtilities, "getRandomBytes:", 32);
}

+ (id)encryptSafetyCache:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "#SafetyCache,SMCU,encryptSafetyCache,data and/or key pointer are nil";
    v18 = v9;
    v19 = 2;
LABEL_22:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "length") == 32)
  {
    v8 = objc_msgSend(v5, "length");
    +[SMCryptoUtilities getRandomBytes:](SMCryptoUtilities, "getRandomBytes:", 16);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v8 + 32);
      objc_msgSend(v10, "replaceBytesInRange:withBytes:", 0, 16, -[NSObject bytes](objc_retainAutorelease(v9), "bytes"));
      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "mutableBytes");
      v12 = objc_retainAutorelease(v7);
      objc_msgSend(v12, "bytes");
      objc_msgSend(v12, "length");
      v13 = objc_retainAutorelease(v11);
      -[NSObject mutableBytes](v13, "mutableBytes");
      objc_msgSend(objc_retainAutorelease(v5), "bytes");
      v14 = CCCryptorGCMOneshotEncrypt();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (!v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,SMCU,encryptSafetyCache,successfully encrypted data", buf, 2u);
        }

        v13 = v13;
        v20 = v13;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v23 = v14;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,encryptSafetyCache,failed to encrypt data,error,%d", buf, 8u);
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,encryptSafetyCache,failed to generate IV", buf, 2u);
      }
    }
    v20 = 0;
LABEL_19:

    goto LABEL_20;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v23 = objc_msgSend(v7, "length");
    v17 = "#SafetyCache,SMCU,encryptSafetyCache,unsupported AES key length,%d";
    v18 = v9;
    v19 = 8;
    goto LABEL_22;
  }
LABEL_12:
  v20 = 0;
LABEL_20:

  return v20;
}

+ (id)decryptSafetyCache:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "#SafetyCache,SMCU,decryptSafetyCache,encryptedData and/or key pointer are nil";
      v10 = v8;
      v11 = 2;
      goto LABEL_8;
    }
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0x20)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = objc_msgSend(v5, "length");
      v9 = "#SafetyCache,SMCU,decryptSafetyCache,encryptedData is too short,length,%d";
      v10 = v8;
      v11 = 8;
LABEL_8:
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v12 = objc_msgSend(v5, "length") - 32;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v12);
  objc_msgSend(objc_retainAutorelease(v5), "bytes");
  v14 = objc_retainAutorelease(v7);
  objc_msgSend(v14, "bytes");
  objc_msgSend(v14, "length");
  v8 = objc_retainAutorelease(v13);
  -[NSObject mutableBytes](v8, "mutableBytes");
  v15 = CCCryptorGCMOneshotDecrypt();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v15;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,SMCU,decryptSafetyCache,failed to decrypt data,error,%d", buf, 8u);
    }

    goto LABEL_13;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,SMCU,decryptSafetyCache,successfully decrypted data", buf, 2u);
  }

  v8 = v8;
  v18 = v8;
LABEL_14:

  return v18;
}

+ (id)decryptSafetyCache:(id)a3 key:(id)a4 sessionID:(id)a5 role:(id)a6 device:(int64_t)a7 metricsDict:(id *)a8 hashString:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  id v33;
  const __CFString *v34;
  NSObject *v35;
  id v36;
  const __CFString *v37;
  int64_t v38;
  NSObject *v39;
  id v40;
  const __CFString *v41;
  int64_t v42;
  NSObject *v43;
  id v44;
  int64_t v45;
  objc_class *v47;
  void *v48;
  int64_t v49;
  void *v50;
  objc_class *v51;
  void *v52;
  int64_t v53;
  void *v54;
  objc_class *v55;
  void *v56;
  int64_t v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  int64_t v63;
  void *v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

LABEL_18:
      v21 = 0;
      goto LABEL_59;
    }
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: encryptedData";
LABEL_64:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_17;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_64;
  }
  if (v16)
  {
    +[SMCryptoUtilities decryptSafetyCache:withKey:](SMCryptoUtilities, "decryptSafetyCache:withKey:", v15, v16);
    v19 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)v19;
    if (!v19)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v53 = a7;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v66 = v18;
        v67 = 2112;
        v68 = v17;
        v69 = 2112;
        v70 = v52;
        v71 = 2112;
        v72 = v54;
        _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,decryption failed", buf, 0x2Au);

        a7 = v53;
      }

      if (a7 == 1 && a8)
      {
        v36 = *a8;
        v37 = CFSTR("phoneCacheDecryptionResult");
      }
      else
      {
        v42 = a7;
        v21 = 0;
        if (v42 != 2 || !a8)
          goto LABEL_58;
        v36 = *a8;
        v37 = CFSTR("watchCacheDecryptionResult");
      }
      objc_msgSend(v36, "setValue:forKey:", &unk_1E9328328, v37);
      v21 = 0;
LABEL_58:

      goto LABEL_59;
    }
    +[SMCryptoUtilities getDeserializedJsonDict:](SMCryptoUtilities, "getDeserializedJsonDict:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v29 = 0;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v57 = a7;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v66 = v18;
        v67 = 2112;
        v68 = v17;
        v69 = 2112;
        v70 = v56;
        v71 = 2112;
        v72 = v58;
        _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,deserialization failed", buf, 0x2Au);

        a7 = v57;
      }

      if (a7 == 1 && a8)
      {
        v40 = *a8;
        v41 = CFSTR("phoneCacheDecryptionResult");
      }
      else
      {
        v45 = a7;
        v21 = 0;
        if (v45 != 2 || !a8)
          goto LABEL_57;
        v40 = *a8;
        v41 = CFSTR("watchCacheDecryptionResult");
      }
      objc_msgSend(v40, "setValue:forKey:", &unk_1E9328340, v41);
      v21 = 0;
LABEL_57:

      goto LABEL_58;
    }
    v63 = a7;
    v62 = (void *)v20;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B8F8]), "initWithDictionary:", v20);
    if (!v21)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v66 = v18;
        v67 = 2112;
        v68 = v17;
        v69 = 2112;
        v70 = v60;
        v71 = 2112;
        v72 = v61;
        _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,initialization of SMCache object failed", buf, 0x2Au);

      }
      if (v63 == 1 && a8)
      {
        objc_msgSend(*a8, "setValue:forKey:", &unk_1E9328358, CFSTR("phoneCacheDecryptionResult"));
        v29 = v62;
      }
      else
      {
        v29 = v62;
        if (v63 == 2 && a8)
          objc_msgSend(*a8, "setValue:forKey:", &unk_1E9328358, CFSTR("watchCacheDecryptionResult"));
      }
      goto LABEL_52;
    }
    if (a9)
    {
      objc_msgSend(v64, "md5");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hexString");
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v66 = v18;
      v67 = 2112;
      v68 = v17;
      v69 = 2112;
      v70 = v25;
      v71 = 2112;
      v72 = v26;
      v73 = 2112;
      v74 = v27;
      v75 = 2048;
      v76 = objc_msgSend(v21, "identifierHash");
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,sessionID:%@,%@,%@,successfully decrypted safety cache data,cacheIdentifier %@, hash %lu", buf, 0x3Eu);

    }
    if (v63 == 1 && a8)
    {
      v28 = CFSTR("phoneCacheDecryptionResult");
      v29 = v62;
    }
    else
    {
      v29 = v62;
      if (v63 != 2 || !a8)
        goto LABEL_51;
      v28 = CFSTR("watchCacheDecryptionResult");
    }
    objc_msgSend(*a8, "setValue:forKey:", &unk_1E9328370, v28);
LABEL_51:
    v44 = v21;
LABEL_52:

    goto LABEL_57;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v49 = a7;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v66 = v18;
    v67 = 2112;
    v68 = v17;
    v69 = 2112;
    v70 = v48;
    v71 = 2112;
    v72 = v50;
    _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,sessionID:%@,%@,%@,no safety cache key available", buf, 0x2Au);

    a7 = v49;
  }

  if (a7 == 1 && a8)
  {
    v33 = *a8;
    v34 = CFSTR("phoneCacheDecryptionResult");
LABEL_32:
    objc_msgSend(v33, "setValue:forKey:", &unk_1E9328310, v34);
    goto LABEL_18;
  }
  v38 = a7;
  v21 = 0;
  if (v38 == 2 && a8)
  {
    v33 = *a8;
    v34 = CFSTR("watchCacheDecryptionResult");
    goto LABEL_32;
  }
LABEL_59:

  return v21;
}

@end
