@implementation TPSBiometricEnrollmentValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  uint32_t v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  int out_token;
  uint8_t buf[4];
  uint32_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  out_token = 0;
  v11 = 0;
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = notify_register_check("com.apple.BiometricKit.enrollmentChanged", &out_token);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v6;
      _os_log_impl(&dword_1DAC2F000, v7, OS_LOG_TYPE_INFO, "notify_register_check failed: %u", buf, 8u);
    }

    v8 = 0;
  }
  else
  {
    notify_get_state(out_token, &v11);
    notify_cancel(out_token);
    v9 = v11 == 0;
    v8 = v9 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue");
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting", v11);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v8, v10);

  v4[2](v4, v8, 0);
}

@end
