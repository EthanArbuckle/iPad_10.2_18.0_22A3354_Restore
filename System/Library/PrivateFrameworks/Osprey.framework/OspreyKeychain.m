@implementation OspreyKeychain

- (id)createKeychainQuery
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD6CA8];
  v3 = *MEMORY[0x1E0CD70A8];
  v9[0] = *MEMORY[0x1E0CD6C98];
  v9[1] = v3;
  v10[0] = v2;
  v10[1] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0CD6B58];
  v9[2] = *MEMORY[0x1E0CD6B80];
  v9[3] = v4;
  v5 = *MEMORY[0x1E0CD6898];
  v9[4] = *MEMORY[0x1E0CD68A0];
  v9[5] = v5;
  v10[2] = MEMORY[0x1E0C9AAA0];
  v10[3] = CFSTR("com.apple.siri.osprey");
  v10[4] = *MEMORY[0x1E0CD68D0];
  v10[5] = CFSTR("com.apple.siri.osprey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (BOOL)saveData:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  OSStatus v12;
  BOOL v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[OspreyKeychain createKeychainQuery](self, "createKeychainQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x1E0CD68F8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = *MEMORY[0x1E0CD70D8];
    objc_msgSend(v10, "setObject:forKey:", v6, *MEMORY[0x1E0CD70D8]);
    v12 = SecItemUpdate((CFDictionaryRef)v9, (CFDictionaryRef)v10);
    if (v12 == -25300)
    {
      objc_msgSend(v9, "setObject:forKey:", v6, v11);
      v12 = SecItemAdd((CFDictionaryRef)v9, 0);
    }
    if (v12)
    {
      if (v12 != -34018)
      {
        OspreyLoggingInit();
        if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
          -[OspreyKeychain saveData:withIdentifier:].cold.3();
        v13 = 0;
        goto LABEL_19;
      }
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
        -[OspreyKeychain saveData:withIdentifier:].cold.4();
    }
    v13 = 1;
LABEL_19:

    goto LABEL_20;
  }
  OspreyLoggingInit();
  v14 = OspreyLogContextAbsinthe;
  v15 = os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
      -[OspreyKeychain saveData:withIdentifier:].cold.2(v14, v16, v17, v18, v19, v20, v21, v22);
  }
  else if (v15)
  {
    -[OspreyKeychain saveData:withIdentifier:].cold.1();
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)fetchDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  OSStatus v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef result;

  v4 = a3;
  -[OspreyKeychain createKeychainQuery](self, "createKeychainQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CD68F8]);

  result = 0;
  v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if (v6)
  {
    v7 = 0;
    if (v6 == -34018)
    {
      OspreyLoggingInit();
      v8 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
        -[OspreyKeychain fetchDataWithIdentifier:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      v7 = 0;
    }
  }
  else
  {
    v7 = (void *)objc_msgSend((id)result, "copy");
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
  }

  return v7;
}

- (BOOL)deleteDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  OSStatus v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  if (v4)
  {
    -[OspreyKeychain createKeychainQuery](self, "createKeychainQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CD68F8]);
    v6 = SecItemDelete((CFDictionaryRef)v5);
    v7 = v6 == 0;
    if (v6 == -34018)
    {
      OspreyLoggingInit();
      v8 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
        -[OspreyKeychain deleteDataWithIdentifier:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    }

  }
  else
  {
    OspreyLoggingInit();
    v16 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyKeychain deleteDataWithIdentifier:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    v7 = 0;
  }

  return v7;
}

- (void)saveData:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1B97C2000, v0, v1, "%s Attempted to save nil data to keychain with identifier: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveData:(uint64_t)a3 withIdentifier:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Attempted to save data to keychain with nil identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveData:withIdentifier:.cold.3()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1B97C2000, v1, OS_LOG_TYPE_ERROR, "%s Failed to save data to keychain for identifier: %@ due to: %d", (uint8_t *)v2, 0x1Cu);
}

- (void)saveData:withIdentifier:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1B97C2000, v0, v1, "%s Failed to save data to keychain for identifier: %@ due to missing entitlement", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchDataWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Failed to fetch data from keychain due to missing entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deleteDataWithIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Attempted to delete data from keychain with nil identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deleteDataWithIdentifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Failed to delete data from keychain due to missing entitlement", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
