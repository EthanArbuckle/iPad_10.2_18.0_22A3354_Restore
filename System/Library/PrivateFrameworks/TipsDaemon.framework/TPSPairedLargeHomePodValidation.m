@implementation TPSPairedLargeHomePodValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getHMClientConnectionClass_softClass_0;
  v13 = getHMClientConnectionClass_softClass_0;
  if (!getHMClientConnectionClass_softClass_0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getHMClientConnectionClass_block_invoke_0;
    v9[3] = &unk_1EA1DF510;
    v9[4] = &v10;
    __getHMClientConnectionClass_block_invoke_0((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  v7 = objc_msgSend(v6, "areAnyLargeHomePodConfigured");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[TPSPairedLargeHomePodValidation validateWithCompletion:].cold.1(self, v7, v8);

  v4[2](v4, v7, 0);
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
