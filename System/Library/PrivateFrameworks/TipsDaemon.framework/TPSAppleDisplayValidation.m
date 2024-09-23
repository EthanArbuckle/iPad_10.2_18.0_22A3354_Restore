@implementation TPSAppleDisplayValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  _BOOL8 v5;
  NSObject *v6;

  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  v5 = -[TPSAppleDisplayValidation _isConnected](self, "_isConnected");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v5, v6);

  v4[2](v4, v5, 0);
}

- (BOOL)_isConnected
{
  return 0;
}

@end
