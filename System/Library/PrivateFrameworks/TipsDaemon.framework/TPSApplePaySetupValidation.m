@implementation TPSApplePaySetupValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = -[TPSApplePaySetupValidation getCurrentState](self, "getCurrentState");
  v6 = v5 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v6, v7);

  v4[2](v4, v6, 0);
}

- (BOOL)getCurrentState
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getPKPassLibraryClass_softClass;
  v12 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getPKPassLibraryClass_block_invoke;
    v8[3] = &unk_1EA1DF510;
    v8[4] = &v9;
    __getPKPassLibraryClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "passesOfType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSApplePaySetupValidation getCurrentState](self, "getCurrentState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v6, v7, 0);

}

@end
