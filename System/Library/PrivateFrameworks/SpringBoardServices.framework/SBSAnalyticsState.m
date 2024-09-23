@implementation SBSAnalyticsState

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (id)withTimestamp:(double)a3 payload:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimestamp:payload:", v6, a3);

  return v7;
}

- (SBSAnalyticsState)initWithTimestamp:(double)a3 payload:(id)a4
{
  id v7;
  void *v8;
  SBSAnalyticsState *v9;
  SBSAnalyticsState *v10;
  id v12;
  objc_super v13;

  v7 = a4;
  v8 = v7;
  if (v7 && (_SBSupportedType(v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("payload must contain only NSDictionary, NSArray, NSNumber, NSData, NString, NSNull objects"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)SBSAnalyticsState;
  v9 = -[SBSAnalyticsState init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_timestamp = a3;
    objc_storeStrong((id *)&v9->_payload, a4);
  }

  return v10;
}

- (double)timestamp
{
  return self->_timestamp;
}

+ (id)withTimestamp:(double)a3
{
  return (id)objc_msgSend(a1, "withTimestamp:payload:", 0, a3);
}

- (id)coreAnalyticsRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kSBSAnalyticsTimestamp"));

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)-[SBSAnalyticsState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSAnalyticsState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBSAnalyticsState *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SBSAnalyticsState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E288D940;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

uint64_t __59__SBSAnalyticsState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendTimeInterval:withName:decomposeUnits:", CFSTR("timestamp"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 8));
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("payload"), 1);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSAnalyticsState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("timestamp"), 0, self->_timestamp);
  return v3;
}

@end
