@implementation SBHomeHardwareButtonLongPressDurationAssertion

- (SBHomeHardwareButtonLongPressDurationAssertion)initWithReason:(id)a3 duration:(double)a4
{
  id v6;
  SBHomeHardwareButtonLongPressDurationAssertion *v7;
  SBHomeHardwareButtonLongPressDurationAssertion *v8;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeHardwareButtonLongPressDurationAssertion;
  v7 = -[SBHomeHardwareButtonLongPressDurationAssertion init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_duration = a4;
    v9 = objc_msgSend(v6, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

  }
  return v8;
}

- (NSString)description
{
  return (NSString *)-[SBHomeHardwareButtonLongPressDurationAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHomeHardwareButtonLongPressDurationAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHomeHardwareButtonLongPressDurationAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBHomeHardwareButtonLongPressDurationAssertion *v11;

  v4 = a3;
  -[SBHomeHardwareButtonLongPressDurationAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__SBHomeHardwareButtonLongPressDurationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __88__SBHomeHardwareButtonLongPressDurationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("reason"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendTimeInterval:withName:decomposeUnits:", CFSTR("duration"), 0, *(double *)(*(_QWORD *)(a1 + 40) + 8));
}

- (double)duration
{
  return self->_duration;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
