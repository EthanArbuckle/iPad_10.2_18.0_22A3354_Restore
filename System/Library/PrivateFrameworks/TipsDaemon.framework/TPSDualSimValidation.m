@implementation TPSDualSimValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getCoreTelephonyClientClass_softClass_1;
  v18 = getCoreTelephonyClientClass_softClass_1;
  if (!getCoreTelephonyClientClass_softClass_1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getCoreTelephonyClientClass_block_invoke_1;
    v14[3] = &unk_1EA1DF510;
    v14[4] = &v15;
    __getCoreTelephonyClientClass_block_invoke_1((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v7 = [v6 alloc];
  v8 = (void *)objc_msgSend(v7, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v13 = 0;
  v9 = objc_msgSend(v8, "getDualSimCapability:", &v13);
  v10 = v13;
  v11 = (v9 == 3) ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[TPSDualSimValidation validateWithCompletion:].cold.1(self, v11, v12);

  v4[2](v4, v11, 0);
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
