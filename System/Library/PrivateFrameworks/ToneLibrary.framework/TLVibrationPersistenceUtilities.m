@implementation TLVibrationPersistenceUtilities

+ (BOOL)_validateObjectWithError:(id *)a3 validationBlock:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v14;
  id v15;
  id v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  (*((void (**)(id, id *, id *, id *))a4 + 2))(a4, &v16, &v15, &v14);
  v5 = v16;
  v6 = (unint64_t)v15;
  v7 = (unint64_t)v14;
  v8 = (void *)v7;
  if (!v5)
  {
    if (!(v6 | v7))
    {
      v9 = 1;
      goto LABEL_9;
    }
    if (a3)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tl_errorWithDomain:description:", CFSTR("TLServiceValidationErrorDomain"), CFSTR("Unexpected type for %@: %@ (%@)"), v8, v12, v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 0;
  *a3 = objc_retainAutorelease(v5);
LABEL_9:

  return v9;
}

+ (BOOL)_objectIsValidUserGeneratedVibrationPattern:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke;
  v9[3] = &unk_1E952AC68;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = objc_msgSend(a1, "_validateObjectWithError:validationBlock:", a4, v9);

  return (char)a4;
}

void __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, const __CFString **a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a2 && a3 && a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = *(id *)(a1 + 32);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v24;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *a3 = objc_retainAutorelease(v13);
              v22 = CFSTR("key of user generated vibration pattern wrapper");
              goto LABEL_29;
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v10)
            continue;
          break;
        }
      }

      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("Name"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("Pattern"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!+[TLVibrationPattern isValidVibrationPatternPropertyListRepresentation:](TLVibrationPattern, "isValidVibrationPatternPropertyListRepresentation:", v14))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "tl_errorWithDomain:description:", CFSTR("TLServiceValidationErrorDomain"), CFSTR("Invalid vibration pattern: %@"), *(_QWORD *)(a1 + 32));
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        *a3 = objc_retainAutorelease(v8);
        v22 = CFSTR("name of user generated vibration pattern");
LABEL_29:
        *a4 = v22;
      }

    }
    else
    {
      *a3 = objc_retainAutorelease(*(id *)(a1 + 32));
      *a4 = CFSTR("user generated vibration pattern wrapper");
    }
  }
  else
  {
    TLLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Vibrations/TLVibrationPersistenceUtilities.m");
      v17 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v17, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v29 = "+[TLVibrationPersistenceUtilities _objectIsValidUserGeneratedVibrationPattern:error:]_block_invoke";
        v30 = 2113;
        v31 = v19;
        v32 = 2049;
        v33 = 71;
        v34 = 2113;
        v35 = v20;
        _os_log_impl(&dword_1D33D5000, v18, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_1();

  }
}

+ (BOOL)objectIsValidUserGeneratedVibrationPatternsDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__TLVibrationPersistenceUtilities_objectIsValidUserGeneratedVibrationPatternsDictionary_error___block_invoke;
  v9[3] = &unk_1E952AC90;
  v10 = v6;
  v11 = a1;
  v7 = v6;
  LOBYTE(a4) = objc_msgSend(a1, "_validateObjectWithError:validationBlock:", a4, v9);

  return (char)a4;
}

void __95__TLVibrationPersistenceUtilities_objectIsValidUserGeneratedVibrationPatternsDictionary_error___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a2 || !a3 || !a4)
  {
    TLLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Vibrations/TLVibrationPersistenceUtilities.m");
      v19 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v19, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v32 = "+[TLVibrationPersistenceUtilities objectIsValidUserGeneratedVibrationPatternsDictionary:error:]_block_invoke";
        v33 = 2113;
        v34 = v21;
        v35 = 2049;
        v36 = 109;
        v37 = 2113;
        v38 = v22;
        _os_log_impl(&dword_1D33D5000, v20, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_1();

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a3 = objc_retainAutorelease(*(id *)(a1 + 32));
    *a4 = CFSTR("root object");
    return;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
    goto LABEL_31;
  v10 = v9;
  v24 = a2;
  v11 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *a3 = objc_retainAutorelease(v13);
        *a4 = CFSTR("key object");
        goto LABEL_31;
      }
      if (!objc_msgSend(v13, "hasPrefix:", CFSTR("usergeneratedvibration:")))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "tl_errorWithDomain:description:", CFSTR("TLServiceValidationErrorDomain"), CFSTR("Invalid key object: %@. All key objects need to start with \"%@\"), v13, CFSTR("usergeneratedvibration:"));
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (!v16)
          return;
        goto LABEL_30;
      }
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v14, "_objectIsValidUserGeneratedVibrationPattern:error:", v15, &v25);
      v16 = v25;

      if (v16)
      {

LABEL_30:
        v8 = objc_retainAutorelease(v16);
        *v24 = v8;
        goto LABEL_31;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
      continue;
    break;
  }
LABEL_31:

}

+ (NSURL)userGeneratedVibrationStoreFileURL
{
  void *v2;
  void *v3;
  void *v4;

  CPSharedResourcesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media/Vibrations/UserGeneratedVibrationPatterns.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

void __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "Pointers of validation block can't be NULL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "*** Assertion failure.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

@end
