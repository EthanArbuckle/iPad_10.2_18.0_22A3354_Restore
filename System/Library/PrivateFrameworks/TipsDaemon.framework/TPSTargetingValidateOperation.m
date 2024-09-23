@implementation TPSTargetingValidateOperation

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (TPSTargetingValidateOperation)initWithTargetingCondition:(id)a3
{
  id v5;
  TPSTargetingValidateOperation *v6;
  TPSTargetingValidateOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSTargetingValidateOperation;
  v6 = -[TPSAsyncOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_validator, a3);
    v7->_result = -1;
  }

  return v7;
}

void __37__TPSTargetingValidateOperation_main__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  v7 = *(void **)(a1 + 32);
  v6 = (id *)(a1 + 32);
  objc_msgSend(v7, "finishWithError:", v5);
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __37__TPSTargetingValidateOperation_main__block_invoke_cold_1(v6);

}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (int64_t)result
{
  void *v3;

  if (-[TPSAsyncOperation isCancelled](self, "isCancelled"))
    return -1;
  -[TPSAsyncOperation error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -1;
  else
    return self->_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_validator, 0);
}

- (void)cancel
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "cancelling...%@", (uint8_t *)&v2, 0xCu);
}

- (void)main
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "result");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x20u);

}

- (TPSTargetingValidation)validator
{
  return self->_validator;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTargetingValidateOperation validator](self, "validator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTargetingValidateOperation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; validator = %@; context = %@;>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)context
{
  return self->_context;
}

void __37__TPSTargetingValidateOperation_main__block_invoke_cold_1(id *a1)
{
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;
  void *v8;

  objc_msgSend(*a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "validator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "result");
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x2Au);

}

@end
