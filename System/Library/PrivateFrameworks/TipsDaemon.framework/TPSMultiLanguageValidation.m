@implementation TPSMultiLanguageValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend(v4, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)objc_msgSend(v6, "count") < 2;

  v8 = v7 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v8, v9);

  v5[2](v5, v8, 0);
}

@end
