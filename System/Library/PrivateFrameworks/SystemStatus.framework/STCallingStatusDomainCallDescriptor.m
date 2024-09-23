@implementation STCallingStatusDomainCallDescriptor

+ (id)audioCallDescriptorWithState:(unint64_t)a3
{
  return -[STCallingStatusDomainCallDescriptor initWithCallType:callState:copresenceActivityType:]([STCallingStatusDomainCallDescriptor alloc], "initWithCallType:callState:copresenceActivityType:", 0, a3, 0);
}

+ (id)videoCallDescriptorWithState:(unint64_t)a3
{
  return -[STCallingStatusDomainCallDescriptor initWithCallType:callState:copresenceActivityType:]([STCallingStatusDomainCallDescriptor alloc], "initWithCallType:callState:copresenceActivityType:", 1, a3, 0);
}

+ (id)copresenceCallDescriptorWithActivityType:(unint64_t)a3
{
  return -[STCallingStatusDomainCallDescriptor initWithCallType:callState:copresenceActivityType:]([STCallingStatusDomainCallDescriptor alloc], "initWithCallType:callState:copresenceActivityType:", 2, 0, a3);
}

- (STCallingStatusDomainCallDescriptor)initWithCallType:(unint64_t)a3 callState:(unint64_t)a4 copresenceActivityType:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  STCallingStatusDomainCallDescriptor *v12;
  STCallingStatusDomainCallDescriptor *v13;
  STActivityAttribution *callProviderAttribution;
  const __CFString *v16;
  const __CFString *v17;
  objc_super v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
      if (a4 == 2)
        goto LABEL_11;
      break;
    case 1uLL:
      if (a4 <= 6)
      {
        v9 = 1 << a4;
        v10 = 84;
        goto LABEL_10;
      }
      break;
    case 2uLL:
      if (a4 <= 6)
      {
        v9 = 1 << a4;
        v10 = 92;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      if (a4 <= 6)
      {
        v9 = 1 << a4;
        v10 = 90;
LABEL_10:
        if ((v9 & v10) != 0)
          goto LABEL_11;
      }
      break;
    default:
LABEL_11:
      STSystemStatusLogCallingDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        if (a4 - 1 > 5)
          v16 = CFSTR("active");
        else
          v16 = off_1E91E51C8[a4 - 1];
        if (a3 - 1 > 2)
          v17 = CFSTR("audio");
        else
          v17 = off_1E91E51B0[a3 - 1];
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_1D12C7000, v11, OS_LOG_TYPE_ERROR, "state %{public}@ is not valid for call type %{public}@, behavior is undefined", buf, 0x16u);
      }

      break;
  }
  v18.receiver = self;
  v18.super_class = (Class)STCallingStatusDomainCallDescriptor;
  v12 = -[STCallingStatusDomainCallDescriptor init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_callType = a3;
    v12->_callState = a4;
    callProviderAttribution = v12->_callProviderAttribution;
    v12->_copresenceActivityType = a5;
    v12->_callProviderAttribution = 0;

  }
  return v13;
}

- (STCallingStatusDomainCallDescriptor)initWithCallType:(unint64_t)a3 callState:(unint64_t)a4 copresenceActivityType:(unint64_t)a5 callProviderAttribution:(id)a6
{
  id v10;
  STCallingStatusDomainCallDescriptor *v11;
  uint64_t v12;
  STActivityAttribution *callProviderAttribution;

  v10 = a6;
  v11 = -[STCallingStatusDomainCallDescriptor initWithCallType:callState:copresenceActivityType:](self, "initWithCallType:callState:copresenceActivityType:", a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    callProviderAttribution = v11->_callProviderAttribution;
    v11->_callProviderAttribution = (STActivityAttribution *)v12;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STCallingStatusDomainCallDescriptor callType](self, "callType");
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke;
  v29[3] = &unk_1E91E5108;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v29);
  v10 = -[STCallingStatusDomainCallDescriptor callState](self, "callState");
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_2;
  v27[3] = &unk_1E91E5108;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v10, v27);
  v13 = -[STCallingStatusDomainCallDescriptor copresenceActivityType](self, "copresenceActivityType");
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_3;
  v25[3] = &unk_1E91E5108;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v13, v25);
  -[STCallingStatusDomainCallDescriptor callProviderAttribution](self, "callProviderAttribution");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  v21 = 3221225472;
  v22 = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_4;
  v23 = &unk_1E91E4AB0;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", v16, &v20);

  LOBYTE(v16) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);
  return (char)v16;
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callType");
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callState");
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copresenceActivityType");
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callProviderAttribution");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STCallingStatusDomainCallDescriptor callType](self, "callType"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STCallingStatusDomainCallDescriptor callState](self, "callState"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STCallingStatusDomainCallDescriptor copresenceActivityType](self, "copresenceActivityType"));
  -[STCallingStatusDomainCallDescriptor callProviderAttribution](self, "callProviderAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:", v7);

  v9 = objc_msgSend(v3, "hash");
  return v9;
}

- (NSString)description
{
  return (NSString *)-[STCallingStatusDomainCallDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STCallingStatusDomainCallDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STCallingStatusDomainCallDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STCallingStatusDomainCallDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    v7 = objc_msgSend(a1, "callType") - 1;
    if (v7 > 2)
      v8 = CFSTR("audio");
    else
      v8 = off_1E91E51B0[v7];
    objc_msgSend(v6, "appendString:withName:", v8, CFSTR("callType"));
    v9 = objc_msgSend(a1, "callState") - 1;
    if (v9 > 5)
      v10 = CFSTR("active");
    else
      v10 = off_1E91E51C8[v9];
    objc_msgSend(v6, "appendString:withName:", v10, CFSTR("callState"));
    v11 = objc_msgSend(a1, "copresenceActivityType") - 1;
    if (v11 > 4)
      v12 = CFSTR("none");
    else
      v12 = off_1E91E51F8[v11];
    objc_msgSend(v6, "appendString:withName:", v12, CFSTR("copresenceActivityType"));
    objc_msgSend(a1, "callProviderAttribution");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:withName:", v14, CFSTR("callProviderAttribution"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STCallingStatusDomainCallDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[STCallingStatusDomainCallDescriptor callType](self, "callType"), CFSTR("callType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[STCallingStatusDomainCallDescriptor callState](self, "callState"), CFSTR("callState"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[STCallingStatusDomainCallDescriptor copresenceActivityType](self, "copresenceActivityType"), CFSTR("copresenceActivityType"));
  -[STCallingStatusDomainCallDescriptor callProviderAttribution](self, "callProviderAttribution");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("callProviderAttribution"));

}

- (STCallingStatusDomainCallDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  STCallingStatusDomainCallDescriptor *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callType"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("callState"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("copresenceActivityType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callProviderAttribution"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[STCallingStatusDomainCallDescriptor initWithCallType:callState:copresenceActivityType:callProviderAttribution:](self, "initWithCallType:callState:copresenceActivityType:callProviderAttribution:", v5, v6, v7, v8);
  return v9;
}

- (unint64_t)callType
{
  return self->_callType;
}

- (unint64_t)callState
{
  return self->_callState;
}

- (unint64_t)copresenceActivityType
{
  return self->_copresenceActivityType;
}

- (STActivityAttribution)callProviderAttribution
{
  return self->_callProviderAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProviderAttribution, 0);
}

@end
