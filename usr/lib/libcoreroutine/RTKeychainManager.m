@implementation RTKeychainManager

+ (RTKeychainManager)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  objc_opt_class();
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTKeychainManager;
  return (RTKeychainManager *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)createSymmetricKeyWithSize:(int64_t)a3 identifier:(id)a4 storeInKeychain:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  _BOOL4 v15;
  char *v16;
  char *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  const __CFString **v22;
  uint64_t *v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (v10)
  {
    if ((unint64_t)a3 < 3)
    {
      -[RTKeychainManager _keySpecifierWithBitSize:](self, "_keySpecifierWithBitSize:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      -[RTKeychainManager _randomKeyWithSpecifier:error:](self, "_randomKeyWithSpecifier:error:", v11, &v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (char *)v28;
      v14 = v13;
      if (!v12 || v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilityKeychain);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v14;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "could not generate key, error, %@", buf, 0xCu);
        }

        if (a6)
        {
          v18 = 0;
          *a6 = objc_retainAutorelease(v14);
          goto LABEL_31;
        }
      }
      else
      {
        if (!v7
          || (v27 = 0,
              v15 = -[RTKeychainManager _setKey:forIdentifier:error:](self, "_setKey:forIdentifier:error:", v12, v10, &v27), v16 = (char *)v27, v17 = v16, v15)&& !v16)
        {
          objc_msgSend(v12, "keyData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

          goto LABEL_32;
        }
        _rt_log_facility_get_os_log(RTLogFacilityKeychain);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v17;
          _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "could not set key in keychain, error, %@", buf, 0xCu);
        }

        if (a6)
          *a6 = objc_retainAutorelease(v17);

      }
      v18 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[RTKeychainManager createSymmetricKeyWithSize:identifier:storeInKeychain:error:]";
      v35 = 1024;
      v36 = 55;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if ((unint64_t)a3 < 3)
      goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTKeychainManager createSymmetricKeyWithSize:identifier:storeInKeychain:error:]";
    v35 = 1024;
    v36 = 56;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "unknown key size (in %s:%d)", buf, 0x12u);
  }

  if (v10)
  {
    if (a6)
    {
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("Invalid parameter: unknown key size.");
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v30;
      v23 = &v29;
LABEL_19:
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v14);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_20;
  }
LABEL_17:
  if (a6)
  {
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("Invalid parameter: identifier must be non-nil.");
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = &v32;
    v23 = &v31;
    goto LABEL_19;
  }
LABEL_20:
  v18 = 0;
LABEL_33:

  return v18;
}

- (BOOL)removeEncryptionKeyWithIdentifier:(id)a3 error:(id *)a4
{
  _BOOL4 v5;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v12 = 0;
    v5 = -[RTKeychainManager _removeItemWithIdentifier:error:](self, "_removeItemWithIdentifier:error:", a3, &v12);
    v6 = v12;
    v7 = v6;
    v8 = !v5;
    if (v6)
      v8 = 1;
    if (a4 && v8)
      *a4 = objc_retainAutorelease(v6);
    v9 = v7 == 0;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTKeychainManager removeEncryptionKeyWithIdentifier:error:]";
      v17 = 1024;
      v18 = 122;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (!a4)
      return 0;
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("Invalid parameter: identifier must be non-nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v7);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)encryptionKeyWithSize:(int64_t)a3 identifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  id v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    if ((unint64_t)a3 < 3)
    {
      v20 = 0;
      -[RTKeychainManager _keyForIdentifier:error:](self, "_keyForIdentifier:error:", v8, &v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (char *)v20;
      if (v10)
      {
        _rt_log_facility_get_os_log(RTLogFacilityKeychain);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v10;
          _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "error encountered attempting to fetch AES key from keychain: %@", buf, 0xCu);
        }

        if (a5)
        {
          v21 = *MEMORY[0x1E0CB3388];
          v22 = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v12);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        v13 = 0;
      }
      else
      {
        v13 = v9;
      }

      goto LABEL_23;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTKeychainManager encryptionKeyWithSize:identifier:error:]";
      v29 = 1024;
      v30 = 152;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if ((unint64_t)a3 < 3)
      goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTKeychainManager encryptionKeyWithSize:identifier:error:]";
    v29 = 1024;
    v30 = 153;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "unknown key size (in %s:%d)", buf, 0x12u);
  }

  if (v8)
  {
    if (a5)
    {
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("Invalid parameter: unknown key size.");
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v24;
      v18 = &v23;
LABEL_19:
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v10);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_20;
  }
LABEL_17:
  if (a5)
  {
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Invalid parameter: identifier must be non-nil.");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v26;
    v18 = &v25;
    goto LABEL_19;
  }
LABEL_20:
  v13 = 0;
LABEL_24:

  return v13;
}

- (BOOL)updateKeyWithIdentifier:(id)a3 keyData:(id)a4 keySize:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  int v20;
  BOOL v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    if (!a6)
      goto LABEL_23;
    v23 = CFSTR("identifier");
    goto LABEL_20;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyData", buf, 2u);
    }

    if (!a6)
      goto LABEL_23;
    v23 = CFSTR("keyData");
LABEL_20:
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if ((unint64_t)a5 >= 3)
  {
    if (a6)
    {
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR("Invalid parameter: unknown key size.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_23:
    v21 = 0;
    goto LABEL_29;
  }
  -[RTKeychainManager _keySpecifierWithBitSize:](self, "_keySpecifierWithBitSize:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C928]), "initWithData:specifier:error:", v12, v13, &v29);
  v15 = v29;
  v16 = v15;
  if (!v14 || v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v16;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "could not generate key, error, %@", buf, 0xCu);
    }

    v21 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v16);
  }
  else
  {
    v28 = 0;
    v17 = -[RTKeychainManager _updateKey:forIdentifier:error:](self, "_updateKey:forIdentifier:error:", v14, v10, &v28);
    v18 = v28;
    v19 = v18;
    v20 = !v17;
    if (v18)
      v20 = 1;
    if (a6 && v20)
      *a6 = objc_retainAutorelease(v18);
    v21 = v19 == 0;

  }
LABEL_29:

  return v21;
}

- (void)sendDiagnosticsToURL:(id)a3 options:(id)a4 handler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (int)_copySecItemMatchingQuery:(id)a3 result:(id *)a4
{
  OSStatus v5;
  int v6;
  CFTypeRef v7;
  void *v8;
  id v9;
  CFTypeRef result;

  if (!a4)
    return -50;
  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  v6 = v5;
  v7 = result;
  if (result)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *a4;
      *a4 = v8;

      v7 = result;
    }
    CFRelease(v7);
  }
  return v6;
}

- (int)_updateSecItemMatchingQuery:(id)a3 attributes:(id)a4
{
  return SecItemUpdate((CFDictionaryRef)a3, (CFDictionaryRef)a4);
}

- (int)_addSecItemWithAttributes:(id)a3 result:(id *)a4
{
  return SecItemAdd((CFDictionaryRef)a3, (CFTypeRef *)a4);
}

- (int)_deleteSecItemMatchingQuery:(id)a3
{
  return SecItemDelete((CFDictionaryRef)a3);
}

- (id)_keySpecifierWithBitSize:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C930]), "initWithBitSize:", a3);
}

- (id)_randomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0D8C928];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initRandomKeyWithSpecifier:error:", v6, a4);

  return v7;
}

- (id)_keyForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0CD6CC0];
  v8 = *MEMORY[0x1E0CD70A8];
  v24[0] = *MEMORY[0x1E0CD6C98];
  v24[1] = v8;
  v25[0] = v7;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0CD68A8];
  v10 = *MEMORY[0x1E0CD6B80];
  v24[2] = *MEMORY[0x1E0CD68A0];
  v24[3] = v10;
  v25[2] = v9;
  v25[3] = MEMORY[0x1E0C9AAB0];
  v11 = *MEMORY[0x1E0CD7018];
  v24[4] = *MEMORY[0x1E0CD6900];
  v24[5] = v11;
  v25[4] = v6;
  v25[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = -[RTKeychainManager _copySecItemMatchingQuery:result:](self, "_copySecItemMatchingQuery:result:", v12, &v19);
  v14 = v19;
  v15 = v14;
  if (v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 1024;
      v23 = v13;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "could not get key for identifier, %@ in keychain, error, %d", buf, 0x12u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v13, 0);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = v14;
  }

  return v17;
}

- (BOOL)_setKey:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  int v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = *MEMORY[0x1E0CD6CC0];
  v10 = *MEMORY[0x1E0CD70A8];
  v21[0] = *MEMORY[0x1E0CD6C98];
  v21[1] = v10;
  v22[0] = v9;
  v22[1] = MEMORY[0x1E0C9AAB0];
  v11 = *MEMORY[0x1E0CD6B80];
  v21[2] = *MEMORY[0x1E0CD68A0];
  v21[3] = v11;
  v22[2] = *MEMORY[0x1E0CD68A8];
  v22[3] = MEMORY[0x1E0C9AAB0];
  v21[4] = *MEMORY[0x1E0CD70D8];
  objc_msgSend(a3, "keyData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = *MEMORY[0x1E0CD6900];
  v22[4] = v12;
  v22[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[RTKeychainManager _addSecItemWithAttributes:result:](self, "_addSecItemWithAttributes:result:", v13, 0);
  if (v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412546;
      v18 = v8;
      v19 = 1024;
      v20 = v14;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "could not set key for identifier, %@ in keychain, error, %d", (uint8_t *)&v17, 0x12u);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14 == 0;
}

- (BOOL)_removeItemWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0CD6CC0];
  v8 = *MEMORY[0x1E0CD70A8];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v8;
  v20[0] = v7;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0CD68A8];
  v10 = *MEMORY[0x1E0CD6B80];
  v19[2] = *MEMORY[0x1E0CD68A0];
  v19[3] = v10;
  v20[2] = v9;
  v20[3] = MEMORY[0x1E0C9AAB0];
  v19[4] = *MEMORY[0x1E0CD6900];
  v20[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[RTKeychainManager _deleteSecItemMatchingQuery:](self, "_deleteSecItemMatchingQuery:", v11);
  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 1024;
      v18 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "could not remove key for identifier, %@ in keychain, error, %d", (uint8_t *)&v15, 0x12u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v12, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12 == 0;
}

- (BOOL)_updateKey:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = *MEMORY[0x1E0CD6CC0];
  v10 = *MEMORY[0x1E0CD70A8];
  v27[0] = *MEMORY[0x1E0CD6C98];
  v27[1] = v10;
  v28[0] = v9;
  v28[1] = MEMORY[0x1E0C9AAB0];
  v11 = *MEMORY[0x1E0CD68A8];
  v12 = *MEMORY[0x1E0CD6B80];
  v27[2] = *MEMORY[0x1E0CD68A0];
  v27[3] = v12;
  v28[2] = v11;
  v28[3] = MEMORY[0x1E0C9AAB0];
  v27[4] = *MEMORY[0x1E0CD6900];
  v28[4] = v8;
  v13 = (void *)MEMORY[0x1E0C99D80];
  v14 = a3;
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0CD70D8];
  objc_msgSend(v14, "keyData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[RTKeychainManager _updateSecItemMatchingQuery:attributes:](self, "_updateSecItemMatchingQuery:attributes:", v15, v17);
  if (v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityKeychain);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412546;
      v22 = v8;
      v23 = 1024;
      v24 = v18;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "could not update key for identifier, %@ in keychain, error, %d", (uint8_t *)&v21, 0x12u);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v18, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v18 == 0;
}

@end
