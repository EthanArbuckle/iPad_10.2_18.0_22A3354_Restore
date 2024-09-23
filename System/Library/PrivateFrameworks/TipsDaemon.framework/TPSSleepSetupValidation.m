@implementation TPSSleepSetupValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v5 = (void *)getHKSPSleepStoreClass_softClass;
  v20 = getHKSPSleepStoreClass_softClass;
  if (!getHKSPSleepStoreClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getHKSPSleepStoreClass_block_invoke;
    v16[3] = &unk_1EA1DF510;
    v16[4] = &v17;
    __getHKSPSleepStoreClass_block_invoke((uint64_t)v16);
    v5 = (void *)v18[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v17, 8);
  v7 = objc_alloc_init(v6);
  v15 = 0;
  objc_msgSend(v7, "currentSleepScheduleWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v8, "isEnabled");
    v12 = v11 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[TPSSleepSetupValidation validateWithCompletion:].cold.2((uint64_t)v10, v13);

    }
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[TPSSleepSetupValidation validateWithCompletion:].cold.1(self, v12, v14);

  v4[2](v4, v12, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);

}

- (void)validateWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Failed to query sleep schedule: %@", (uint8_t *)&v2, 0xCu);
}

@end
