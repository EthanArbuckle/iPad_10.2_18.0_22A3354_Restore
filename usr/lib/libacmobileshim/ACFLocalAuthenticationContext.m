@implementation ACFLocalAuthenticationContext

- (void)dealloc
{
  objc_super v3;

  -[ACFLocalAuthenticationContext setContext:](self, "setContext:", 0);
  -[ACFLocalAuthenticationContext setLocalizedReason:](self, "setLocalizedReason:", 0);
  -[ACFLocalAuthenticationContext setLocalizedFallbackTitle:](self, "setLocalizedFallbackTitle:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACFLocalAuthenticationContext;
  -[ACFLocalAuthenticationContext dealloc](&v3, sel_dealloc);
}

- (LAContext)context
{
  LAContext *result;

  result = self->_context;
  if (!result)
  {
    result = (LAContext *)objc_opt_new();
    self->_context = result;
  }
  return result;
}

- (BOOL)canEvaluatePolicy:(int64_t)a3 error:(id *)a4
{
  return -[LAContext canEvaluatePolicy:error:](-[ACFLocalAuthenticationContext context](self, "context"), "canEvaluatePolicy:error:", a3, a4);
}

- (void)evaluatePolicy:(int64_t)a3 completion:(id)a4
{
  id v7;
  LAContext *v8;
  NSString *v9;
  _QWORD v10[5];

  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACFLocalAuthenticationContext.m"), 62, CFSTR("Completion block should not equal to nil"));
  v7 = (id)objc_msgSend(a4, "copy");
  if (-[ACFLocalAuthenticationContext localizedFallbackTitle](self, "localizedFallbackTitle"))
    -[LAContext setLocalizedFallbackTitle:](-[ACFLocalAuthenticationContext context](self, "context"), "setLocalizedFallbackTitle:", -[ACFLocalAuthenticationContext localizedFallbackTitle](self, "localizedFallbackTitle"));
  v8 = -[ACFLocalAuthenticationContext context](self, "context");
  v9 = -[ACFLocalAuthenticationContext localizedReason](self, "localizedReason");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke;
  v10[3] = &unk_24FCE52F0;
  v10[4] = v7;
  -[LAContext evaluatePolicy:localizedReason:reply:](v8, "evaluatePolicy:localizedReason:reply:", a3, v9, v10);
}

void __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v4[6];
  char v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke_2;
  v4[3] = &unk_24FCE52C8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4[4] = a3;
  v4[5] = v3;
  dispatch_async_on_main_thread((uint64_t)v4);
}

uint64_t __59__ACFLocalAuthenticationContext_evaluatePolicy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)reset
{
  -[ACFLocalAuthenticationContext setContext:](self, "setContext:", 0);
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedFallbackTitle
{
  return self->_localizedFallbackTitle;
}

- (void)setLocalizedFallbackTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
