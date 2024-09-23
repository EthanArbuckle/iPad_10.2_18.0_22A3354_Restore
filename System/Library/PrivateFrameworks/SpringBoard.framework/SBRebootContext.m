@implementation SBRebootContext

- (SBRebootContext)initWithReason:(id)a3
{
  id v5;
  SBRebootContext *v6;
  SBRebootContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRebootContext;
  v6 = -[SBRebootContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reason, a3);

  return v7;
}

- (id)description
{
  const __CFString *v2;

  if (self->_isDark)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SBRebootContext:%p - reason:'%@'; dark:%@>"),
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
  _BOOL8 isDark;
  id v11;
  id v12;
  uint64_t fromOTASoftwareUpdate;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reason = self->_reason;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __27__SBRebootContext_isEqual___block_invoke;
  v21[3] = &unk_1E8E9E6B0;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", reason, v21);
  isDark = self->_isDark;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __27__SBRebootContext_isEqual___block_invoke_2;
  v19[3] = &unk_1E8EA3E78;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", isDark, v19);
  fromOTASoftwareUpdate = self->_fromOTASoftwareUpdate;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __27__SBRebootContext_isEqual___block_invoke_3;
  v17[3] = &unk_1E8EA3E78;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", fromOTASoftwareUpdate, v17);
  LOBYTE(fromOTASoftwareUpdate) = objc_msgSend(v5, "isEqual");

  return fromOTASoftwareUpdate;
}

id __27__SBRebootContext_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __27__SBRebootContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __27__SBRebootContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBRebootContext *v4;

  v4 = -[SBRebootContext initWithReason:]([SBRebootContext alloc], "initWithReason:", self->_reason);
  -[SBRebootContext setDark:](v4, "setDark:", self->_isDark);
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (void)setDark:(BOOL)a3
{
  self->_isDark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
