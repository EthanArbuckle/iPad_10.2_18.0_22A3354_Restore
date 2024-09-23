@implementation TPSHeadEnrollmentValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;

  v4 = (void *)MEMORY[0x1E0DBF3D0];
  v5 = a3;
  objc_msgSend(v4, "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TPSHeadEnrollmentValidation validateWithCompletion:].cold.1(self, v6);

  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
}

- (void)validateWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138413058;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  v10 = 1024;
  v11 = 0;
  v12 = 2112;
  v13 = 0;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v6, 0x26u);

}

@end
