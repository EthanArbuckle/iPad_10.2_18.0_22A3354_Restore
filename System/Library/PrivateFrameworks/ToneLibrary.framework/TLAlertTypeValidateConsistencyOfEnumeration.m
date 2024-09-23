@implementation TLAlertTypeValidateConsistencyOfEnumeration

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke()
{
  void (**v0)(_QWORD, _QWORD);
  NSObject *v1;
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  _QWORD v31[3];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x2020000000;
  v31[2] = 0x7FFFFFFFFFFFFFFFLL;
  v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x2020000000;
  v29[2] = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_2;
  v23[3] = &unk_1E952B048;
  v23[4] = &v24;
  v23[5] = &v30;
  v23[6] = &v28;
  v0 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D824F08C](v23);
  v0[2](v0, 0);
  v0[2](v0, 1);
  v0[2](v0, 2);
  v0[2](v0, 3);
  v0[2](v0, 4);
  v0[2](v0, 5);
  v0[2](v0, 6);
  v0[2](v0, 7);
  v0[2](v0, 8);
  v0[2](v0, 9);
  v0[2](v0, 10);
  v0[2](v0, 11);
  v0[2](v0, 12);
  v0[2](v0, 13);
  v0[2](v0, 14);
  v0[2](v0, 15);
  v0[2](v0, 16);
  v0[2](v0, 17);
  v0[2](v0, 18);
  v0[2](v0, 19);
  v0[2](v0, 20);
  v0[2](v0, 21);
  v0[2](v0, 22);
  v0[2](v0, 23);
  v0[2](v0, 24);
  v0[2](v0, 25);
  v0[2](v0, 26);
  v0[2](v0, 27);
  v0[2](v0, 28);
  v0[2](v0, 29);
  if (*(_QWORD *)(v31[0] + 24))
  {
    TLLogGeneral();
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = os_log_type_enabled(v1, OS_LOG_TYPE_INFO);

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertType.m");
      v3 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v3, "lastPathComponent");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v33 = "void _TLAlertTypeValidateConsistencyOfEnumeration(void)_block_invoke";
        v34 = 2113;
        v35 = v5;
        v36 = 2049;
        v37 = 229;
        v38 = 2113;
        v39 = v6;
        _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_5((uint64_t)v31, v7);

  }
  if (*(_QWORD *)(v29[0] + 24) == 29)
  {
    v8 = 30;
  }
  else
  {
    TLLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertType.m");
      v11 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v11, "lastPathComponent");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v33 = "void _TLAlertTypeValidateConsistencyOfEnumeration(void)_block_invoke";
        v34 = 2113;
        v35 = v13;
        v36 = 2049;
        v37 = 232;
        v38 = 2113;
        v39 = v14;
        _os_log_impl(&dword_1D33D5000, v12, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_3((uint64_t)v29, v15);

    v8 = *(_QWORD *)(v29[0] + 24) + 1;
  }
  if (v8 != v25[3])
  {
    TLLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Playback/TLAlertType.m");
      v18 = objc_claimAutoreleasedReturnValue();
      TLLogGeneral();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject lastPathComponent](v18, "lastPathComponent");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136381443;
        v33 = "void _TLAlertTypeValidateConsistencyOfEnumeration(void)_block_invoke";
        v34 = 2113;
        v35 = v20;
        v36 = 2049;
        v37 = 233;
        v38 = 2113;
        v39 = v21;
        _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", buf, 0x2Au);

      }
    }
    else
    {
      TLLogGeneral();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
    }

    TLLogGeneral();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_1();

  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v30, 8);
}

_QWORD *___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_2(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  ++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  v2 = *(_QWORD *)(result[5] + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >= a2)
    v3 = a2;
  *(_QWORD *)(v2 + 24) = v3;
  v4 = *(_QWORD *)(result[6] + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 <= a2)
    v5 = a2;
  *(_QWORD *)(v4 + 24) = v5;
  return result;
}

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1D33D5000, v0, v1, "TLAlertType values are expected to be subsequent integer values.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 134218240;
  v4 = 29;
  v5 = 2048;
  v6 = v2;
  _os_log_error_impl(&dword_1D33D5000, a2, OS_LOG_TYPE_ERROR, "The maximum value of TLAlertType is expected to be %ld; instead, it was %ld. You probably forgot to update the defin"
    "ition of _TLAlertTypeMaximumAllowedValue in TLAlertType_Internal.h.",
    (uint8_t *)&v3,
    0x16u);
}

void ___TLAlertTypeValidateConsistencyOfEnumeration_block_invoke_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1D33D5000, a2, OS_LOG_TYPE_ERROR, "The minimum value of TLAlertType is expected to be TLAlertTypeNone, i.e. 0. Instead, it was: %ld", (uint8_t *)&v3, 0xCu);
}

@end
