@implementation TPSMedicalIDEnabledValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  +[TPSHealthKitDefines sharedHealthStore](TPSHealthKitDefines, "sharedHealthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v6 = (void *)getHKMedicalIDStoreClass_softClass;
  v16 = getHKMedicalIDStoreClass_softClass;
  if (!getHKMedicalIDStoreClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getHKMedicalIDStoreClass_block_invoke;
    v12[3] = &unk_1EA1DF510;
    v12[4] = &v13;
    __getHKMedicalIDStoreClass_block_invoke((uint64_t)v12);
    v6 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v13, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithHealthStore:", v5);
  v9 = objc_msgSend(v8, "medicalIDSetUpStatus") != 2;
  v10 = v9 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[TPSMedicalIDEnabledValidation validateWithCompletion:].cold.1(self, v10, v11);

  v4[2](v4, v10, 0);
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
