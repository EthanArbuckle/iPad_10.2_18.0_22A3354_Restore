@implementation POACMHelper

+ (id)platformSSOSystemKey
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  int v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v2 = MEMORY[0x24BDAC760];
  v16 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__POACMHelper_platformSSOSystemKey__block_invoke;
  v10[3] = &unk_2515003A8;
  v10[4] = &v11;
  v3 = ACMGetEnvironmentVariable(52, (uint64_t)v10);
  if (v3 == -14)
    goto LABEL_4;
  if (v3)
  {
    if (v3 != -1)
    {
      v8[0] = v2;
      v8[1] = 3221225472;
      v8[2] = __35__POACMHelper_platformSSOSystemKey__block_invoke_1;
      v8[3] = &__block_descriptor_36_e14___NSError_8__0l;
      v9 = v3;
      v6 = __35__POACMHelper_platformSSOSystemKey__block_invoke_1((uint64_t)v8);
LABEL_9:
      v5 = 0;
      goto LABEL_10;
    }
LABEL_4:
    PO_LOG_POACMHelper();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[POACMHelper platformSSOSystemKey].cold.1(v4);

    goto LABEL_9;
  }
  v5 = (id)v12[5];
LABEL_10:
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __35__POACMHelper_platformSSOSystemKey__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

id __35__POACMHelper_platformSSOSystemKey__block_invoke_1(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to retrieve system key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POACMHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35__POACMHelper_platformSSOSystemKey__block_invoke_1_cold_1((uint64_t)v2, a1, v3);

  return v2;
}

+ (void)createPlatformSSOSystemKey:(id)a3
{
  id v3;
  size_t v4;
  id v5;
  uint64_t v6;

  v3 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v3, "bytes");
  v4 = objc_msgSend(v3, "length");

  if (ACMSetEnvironmentVariable(52, &v6, v4))
    v5 = __42__POACMHelper_createPlatformSSOSystemKey___block_invoke();
}

id __42__POACMHelper_createPlatformSSOSystemKey___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to set system key"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POACMHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return v0;
}

+ (void)clearSmartCardPIN
{
  id v2;

  if (ACMSetEnvironmentVariable(20, 0, 0))
    v2 = __32__POACMHelper_clearSmartCardPIN__block_invoke();
}

id __32__POACMHelper_clearSmartCardPIN__block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to clear PIN"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POACMHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return v0;
}

+ (void)platformSSOSystemKey
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24440D000, log, OS_LOG_TYPE_DEBUG, "ACM not available", v1, 2u);
}

void __35__POACMHelper_platformSSOSystemKey__block_invoke_1_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a2 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_24440D000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
