@implementation TIWordSearchOperationPerformMaintenance

- (TIWordSearchOperationPerformMaintenance)initWithMecabraWrapper:(id)a3
{
  id v5;
  TIWordSearchOperationPerformMaintenance *v6;
  TIWordSearchOperationPerformMaintenance *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIWordSearchOperationPerformMaintenance;
  v6 = -[TIWordSearchOperationPerformMaintenance init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mecabraWrapper, a3);

  return v7;
}

- (void)perform
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[TIWordSearchOperationPerformMaintenance mecabraWrapper](self, "mecabraWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)os_transaction_create();
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Starting MecabraPerformMaintenance"), "-[TIWordSearchOperationPerformMaintenance perform]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    -[TIWordSearchOperationPerformMaintenance mecabraWrapper](self, "mecabraWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mecabraRef");
    MecabraPerformMaintenance();

    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Finished MecabraPerformMaintenance"), "-[TIWordSearchOperationPerformMaintenance perform]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
}

- (TIMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)setMecabraWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
