@implementation TPSMedicalIDAvailableValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)getHKHealthChecklistUtilitiesClass_softClass_0;
  v15 = getHKHealthChecklistUtilitiesClass_softClass_0;
  if (!getHKHealthChecklistUtilitiesClass_softClass_0)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getHKHealthChecklistUtilitiesClass_block_invoke_0;
    v11[3] = &unk_1EA1DF510;
    v11[4] = &v12;
    __getHKHealthChecklistUtilitiesClass_block_invoke_0((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isMedicalIDAvailable");

  v9 = v8 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSMedicalIDAvailableValidation validateWithCompletion:].cold.1(self, v9, v10);

  v4[2](v4, v9, 0);
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

@end
