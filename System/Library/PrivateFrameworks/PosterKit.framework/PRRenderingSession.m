@implementation PRRenderingSession

- (PRRenderingSession)initWithReason:(id)a3 invalidationBlock:(id)a4
{
  id v6;
  id v7;
  PRRenderingSession *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRRenderingSession;
  v8 = -[PRRenderingSession init](&v16, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01868]), "initWithIdentifier:forReason:invalidationBlock:", CFSTR("RenderExtension"), v6, v7);
    objc_storeStrong((id *)&v8->_assertion, v9);
    v8->_timeRemaining = 5.0;
    v10 = dispatch_time(0, 5000000000);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke;
    v13[3] = &unk_1E2183900;
    v14 = v9;
    v15 = v6;
    v11 = v9;
    dispatch_after(v10, MEMORY[0x1E0C80D38], v13);

  }
  return v8;
}

uint64_t __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isValid");
  if ((_DWORD)result)
  {
    PRLogRendering();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke_cold_1(a1, v3);

    return objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
  return result;
}

- (PRInvalidatable)assertion
{
  return self->_assertion;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

void __55__PRRenderingSession_initWithReason_invalidationBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18B634000, a2, OS_LOG_TYPE_ERROR, "Rendering extension timed-out: %@", (uint8_t *)&v3, 0xCu);
}

@end
