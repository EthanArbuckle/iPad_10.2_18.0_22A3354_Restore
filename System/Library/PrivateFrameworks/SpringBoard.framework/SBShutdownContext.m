@implementation SBShutdownContext

- (SBShutdownContext)initWithReason:(id)a3
{
  id v5;
  SBShutdownContext *v6;
  SBShutdownContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBShutdownContext;
  v6 = -[SBShutdownContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reason, a3);

  return v7;
}

- (id)description
{
  const __CFString *v2;

  if (self->_fromUserPowerDown)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SBShutdownContext:%p - reason:'%@'; fromUserPowerDown:%@>"),
               self,
               self->_reason,
               v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *reason;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t fromUserPowerDown;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reason = self->_reason;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __29__SBShutdownContext_isEqual___block_invoke;
  v19[3] = &unk_1E8E9E6B0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", reason, v19);
  fromUserPowerDown = self->_fromUserPowerDown;
  v14 = v7;
  v15 = 3221225472;
  v16 = __29__SBShutdownContext_isEqual___block_invoke_2;
  v17 = &unk_1E8EA3E78;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", fromUserPowerDown, &v14);
  LOBYTE(fromUserPowerDown) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return fromUserPowerDown;
}

id __29__SBShutdownContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __29__SBShutdownContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBShutdownContext *v4;

  v4 = -[SBShutdownContext initWithReason:]([SBShutdownContext alloc], "initWithReason:", self->_reason);
  -[SBShutdownContext setFromUserPowerDown:](v4, "setFromUserPowerDown:", self->_fromUserPowerDown);
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)fromUserPowerDown
{
  return self->_fromUserPowerDown;
}

- (void)setFromUserPowerDown:(BOOL)a3
{
  self->_fromUserPowerDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
