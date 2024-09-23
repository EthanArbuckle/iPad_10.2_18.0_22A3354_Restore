@implementation SiriActivityAssertion

- (SiriActivityAssertion)initWithIdentifier:(id)a3 reference:(id)a4 reason:(id)a5 timestamp:(double)a6 invalidationBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SiriActivityAssertion *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *reason;
  uint64_t v21;
  NSString *reference;
  uint64_t v23;
  id invalidationBlock;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SiriActivityAssertion;
  v16 = -[SiriActivityAssertion init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    reason = v16->_reason;
    v16->_reason = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    reference = v16->_reference;
    v16->_reference = (NSString *)v21;

    v16->_timestamp = a6;
    v23 = objc_msgSend(v15, "copy");
    invalidationBlock = v16->_invalidationBlock;
    v16->_invalidationBlock = (id)v23;

  }
  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  NSString *reason;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NSString *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_invalidationBlock)
  {
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      reason = self->_reason;
      *(_DWORD *)buf = 136315650;
      v8 = "-[SiriActivityAssertion dealloc]";
      v9 = 2112;
      v10 = identifier;
      v11 = 2112;
      v12 = reason;
      _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s Deallocated SiriActivityAssertion (identifier=%@, reason=%@) before it was properly invalidated.", buf, 0x20u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SiriActivityAssertion;
  -[SiriActivityAssertion dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  -[SiriActivityAssertion invalidatedAtTimestamp:](self, "invalidatedAtTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)invalidatedAtTimestamp:(double)a3
{
  id invalidationBlock;
  id v6;
  double v7;
  void (**v8)(id, SiriActivityAssertion *, double);

  invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v8 = (void (**)(id, SiriActivityAssertion *, double))_Block_copy(invalidationBlock);
    v6 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

    v7 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(a3);
    v8[2](v8, self, v7);

  }
}

- (BOOL)isValid
{
  return self->_invalidationBlock != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reference
{
  return self->_reference;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
