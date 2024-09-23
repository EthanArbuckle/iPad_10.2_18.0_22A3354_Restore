@implementation TPSCloudBackupValidation

- (void)validateWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;

  v4 = (objc_class *)MEMORY[0x1E0D4E0A8];
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDelegate:", 0);
  v7 = objc_msgSend(v6, "isBackupEnabled");
  v8 = v7 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v8, v9);

  v5[2](v5, v8, 0);
}

@end
