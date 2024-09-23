@implementation TPSCloudDriveValidation

- (void)validateWithCompletion:(id)a3
{
  uint64_t v4;
  void (**v5)(id, uint64_t, _QWORD);
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;

  v4 = *MEMORY[0x1E0C8F430];
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  v6 = +[TPSCloudAccountChecker isiCloudDataClassEnabled:](TPSCloudAccountChecker, "isiCloudDataClassEnabled:", v4);
  v7 = v6 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v7, v8);

  v5[2](v5, v7, 0);
}

@end
