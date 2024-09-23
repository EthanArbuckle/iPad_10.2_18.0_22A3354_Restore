@implementation CTSUServerConnectionRef

void __CTSUServerConnectionRef_block_invoke()
{
  void *v0;
  NSObject *v1;

  _CTServerConnectionAddIdentifierException();
  CTSUServerQueue();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CTSUServerConnectionRef_sCTServerConnectionRef = _CTServerConnectionCreateOnTargetQueue();

  if (!CTSUServerConnectionRef_sCTServerConnectionRef)
  {
    sos_default_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __CTSUServerConnectionRef_block_invoke_cold_1(v1);

  }
}

void __CTSUServerConnectionRef_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = a2;
    v8 = 2112;
    v9 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "notification: %@ info: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __CTSUServerConnectionRef_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "_CTServerConnectionCreateOnTargetQueue() returned nil", v1, 2u);
}

@end
