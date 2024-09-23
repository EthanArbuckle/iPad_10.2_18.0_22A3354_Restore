@implementation TPSAutoCorrectKeyboardValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = +[TPSKeyboardUtilities isAutoCorrectionEnabled](TPSKeyboardUtilities, "isAutoCorrectionEnabled");
  v6 = v5 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v6, v7);

  v4[2](v4, v6, 0);
}

@end
