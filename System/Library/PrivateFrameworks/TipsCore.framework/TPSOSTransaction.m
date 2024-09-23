@implementation TPSOSTransaction

- (void)dealloc
{
  double v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_19A906000, v1, v2, "Ending transaction %s (%p) - held for %.3fs", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)transactionWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransactionName:", v4);

  return v5;
}

- (void)endTransaction
{
  double v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_19A906000, v1, v2, "Ending transaction: %s (%p) - held for %.3fs", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (TPSOSTransaction)initWithTransactionName:(id)a3
{
  id v4;
  TPSOSTransaction *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  OS_os_transaction *transaction;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSOSTransaction;
  v5 = -[TPSOSTransaction init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5->_creationTime = v7;
    v8 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v8;

    +[TPSLogger default](TPSLogger, "default");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[TPSOSTransaction initWithTransactionName:].cold.1(v6, (uint64_t)v5, v10);

  }
  return v5;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)initWithTransactionName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_19A906000, log, OS_LOG_TYPE_DEBUG, "Created transaction: %s (%p)", (uint8_t *)&v3, 0x16u);
}

@end
