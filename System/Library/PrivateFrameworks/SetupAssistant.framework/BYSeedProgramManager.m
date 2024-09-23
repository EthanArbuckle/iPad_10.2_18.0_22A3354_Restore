@implementation BYSeedProgramManager

- (int64_t)currentSeedProgram
{
  void *v2;
  void *v3;
  int64_t v4;
  NSObject *v5;

  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0D8C970], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enrolledBetaProgramForCurrentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = objc_msgSend(v3, "program");
    else
      v4 = 0;

  }
  else
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BYSeedProgramManager currentSeedProgram].cold.1();

    return 0;
  }
  return v4;
}

- (NSDictionary)currentEnrollmentMetadata
{
  void *v2;
  void *v3;
  NSObject *v4;

  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0D8C970], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enrollmentMetadataForCurrentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BYSeedProgramManager currentSeedProgram].cold.1();

    v3 = (void *)MEMORY[0x1E0C9AA70];
  }
  return (NSDictionary *)v3;
}

- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D8C980]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D8C978]);
    if (v11)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D8C988]);
    objc_msgSend(MEMORY[0x1E0D8C970], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__BYSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_programID_completion___block_invoke;
    v16[3] = &unk_1E4E26DE8;
    v17 = v12;
    objc_msgSend(v14, "enrollCurrentDeviceWithEnrollmentMetadata:completion:", v13, v16);

  }
  else
  {
    _BYLoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BYSeedProgramManager currentSeedProgram].cold.1();

    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __88__BYSeedProgramManager_enrollInSeedProgramNamed_withAssetAudience_programID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v6 = 0;
      v7 = v4;
    }
    else if (v4)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v4, "code"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 1;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v10 = v7;
    _os_log_error_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_ERROR, "Failed to enroll in seed program: %{public}@", buf, 0xCu);
    if (v6)
    {

    }
  }

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4 == 0);
}

- (void)currentSeedProgram
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, v0, v1, "Seeding.framework not available!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
