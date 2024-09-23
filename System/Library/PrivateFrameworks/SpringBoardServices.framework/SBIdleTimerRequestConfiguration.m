@implementation SBIdleTimerRequestConfiguration

- (SBIdleTimerRequestConfiguration)init
{
  SBIdleTimerRequestConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIdleTimerRequestConfiguration;
  result = -[SBIdleTimerRequestConfiguration init](&v3, sel_init);
  if (result)
    result->_precedence = 0;
  return result;
}

- (SBIdleTimerRequestConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  SBIdleTimerRequestConfiguration *v5;
  uint64_t v6;
  NSNumber *boxed_minExpirationTimeout;
  uint64_t v8;
  NSNumber *boxed_maxExpirationTimeout;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIdleTimerRequestConfiguration;
  v5 = -[ITIdleTimerConfiguration initWithConfiguration:](&v11, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_boxed_minExpirationTimeout");
    v6 = objc_claimAutoreleasedReturnValue();
    boxed_minExpirationTimeout = v5->_boxed_minExpirationTimeout;
    v5->_boxed_minExpirationTimeout = (NSNumber *)v6;

    objc_msgSend(v4, "_boxed_maxExpirationTimeout");
    v8 = objc_claimAutoreleasedReturnValue();
    boxed_maxExpirationTimeout = v5->_boxed_maxExpirationTimeout;
    v5->_boxed_maxExpirationTimeout = (NSNumber *)v8;

    v5->_precedence = objc_msgSend(v4, "precedence");
  }

  return v5;
}

+ (id)configurationWithMinimumExpirationTimeout:(double)a3
{
  id v6;
  void *v8;

  if ((BSFloatGreaterThanFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBIdleTimerRequestConfiguration.m"), 45, CFSTR("Min timeout: %g must be nonnegative"), *(_QWORD *)&a3);

  }
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setMinExpirationTimeout:", a3);
  return v6;
}

+ (id)configurationWithMaximumExpirationTimeout:(double)a3
{
  id v6;
  void *v8;

  if ((BSFloatGreaterThanFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBIdleTimerRequestConfiguration.m"), 54, CFSTR("Max timeout: %g must be nonnegative"), *(_QWORD *)&a3);

  }
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setMaxExpirationTimeout:", a3);
  return v6;
}

+ (id)configurationWithMinimumExpirationTimeout:(double)a3 maximumExpirationTimeout:(double)a4
{
  id v8;
  void *v10;

  if ((BSFloatGreaterThanFloat() & 1) == 0 && (BSFloatGreaterThanFloat() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBIdleTimerRequestConfiguration.m"), 63, CFSTR("At least either min timeout: %g or max timeout: %g must be nonzero"), *(_QWORD *)&a3, *(_QWORD *)&a4);

  }
  v8 = objc_alloc_init((Class)a1);
  if (BSFloatGreaterThanFloat())
    objc_msgSend(v8, "setMinExpirationTimeout:", a3);
  if (BSFloatGreaterThanFloat())
    objc_msgSend(v8, "setMaxExpirationTimeout:", a4);
  return v8;
}

+ (id)configurationWithIdleEventHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "_setIdleEventHandler:", v4);

  return v5;
}

- (BOOL)hasMinExpirationTimeout
{
  return self->_boxed_minExpirationTimeout != 0;
}

- (double)minExpirationTimeout
{
  double result;

  -[NSNumber doubleValue](self->_boxed_minExpirationTimeout, "doubleValue");
  return result;
}

- (void)setMinExpirationTimeout:(double)a3
{
  NSNumber *v6;
  NSNumber *boxed_minExpirationTimeout;
  NSNumber *v8;

  if (BSFloatGreaterThanFloat())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    boxed_minExpirationTimeout = self->_boxed_minExpirationTimeout;
    self->_boxed_minExpirationTimeout = v6;
  }
  else if (BSFloatIsZero())
  {
    boxed_minExpirationTimeout = self->_boxed_minExpirationTimeout;
    self->_boxed_minExpirationTimeout = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    -[NSNumber handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerRequestConfiguration.m"), 100, CFSTR("Min timeout: %g must be nonnegative"), *(_QWORD *)&a3);
    boxed_minExpirationTimeout = v8;
  }

}

- (BOOL)hasMaxExpirationTimeout
{
  return self->_boxed_maxExpirationTimeout != 0;
}

- (double)maxExpirationTimeout
{
  double result;

  -[NSNumber doubleValue](self->_boxed_maxExpirationTimeout, "doubleValue");
  return result;
}

- (void)setMaxExpirationTimeout:(double)a3
{
  NSNumber *v6;
  NSNumber *boxed_maxExpirationTimeout;
  NSNumber *v8;

  if (BSFloatGreaterThanFloat())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    boxed_maxExpirationTimeout = self->_boxed_maxExpirationTimeout;
    self->_boxed_maxExpirationTimeout = v6;
  }
  else if (BSFloatIsZero())
  {
    boxed_maxExpirationTimeout = self->_boxed_maxExpirationTimeout;
    self->_boxed_maxExpirationTimeout = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    -[NSNumber handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerRequestConfiguration.m"), 118, CFSTR("Max timeout: %g must be nonnegative"), *(_QWORD *)&a3);
    boxed_maxExpirationTimeout = v8;
  }

}

- (void)_setIdleEventHandler:(id)a3
{
  id v5;
  char v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  SBIdleTimerRequestConfiguration *v11;
  SEL v12;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_respondsToSelector();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = v6 & 1 | 2;
    else
      v7 = v6 & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 |= 4uLL;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__SBIdleTimerRequestConfiguration__setIdleEventHandler___block_invoke;
    v9[3] = &unk_1E288D918;
    v11 = self;
    v12 = a2;
    v10 = v5;
    v8 = (void *)MEMORY[0x193FF87DC](v9);
    -[ITIdleTimerConfiguration _setIdleEventMask:](self, "_setIdleEventMask:", v7);
    -[ITIdleTimerConfiguration _setIdleEventHandlerBlock:](self, "_setIdleEventHandlerBlock:", v8);

  }
  else
  {
    -[ITIdleTimerConfiguration _setIdleEventMask:](self, "_setIdleEventMask:", 0);
    -[ITIdleTimerConfiguration _setIdleEventHandlerBlock:](self, "_setIdleEventHandlerBlock:", 0);
  }

}

uint64_t __56__SBIdleTimerRequestConfiguration__setIdleEventHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v5;

  switch(a2)
  {
    case 4:
      return objc_msgSend(*(id *)(a1 + 32), "handleIdleTimerUserAttentionDidReset");
    case 2:
      return objc_msgSend(*(id *)(a1 + 32), "handleIdleTimerDidExpire");
    case 1:
      return objc_msgSend(*(id *)(a1 + 32), "handleIdleTimerDidWarn");
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("SBIdleTimerRequestConfiguration.m"), 144, CFSTR("We received an idle eventType: <%lu> which doesn't match any known idle event."), a2);

  return 1;
}

- (id)description
{
  return -[SBIdleTimerRequestConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerRequestConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t precedence;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBIdleTimerRequestConfiguration;
  -[ITIdleTimerConfiguration succinctDescriptionBuilder](&v11, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  precedence = self->_precedence;
  v6 = CFSTR("Normal");
  if (precedence == 1)
    v6 = CFSTR("High");
  if (precedence == 2)
    v7 = CFSTR("Critical");
  else
    v7 = v6;
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("precedence"));
  if (-[SBIdleTimerRequestConfiguration hasMinExpirationTimeout](self, "hasMinExpirationTimeout"))
  {
    -[SBIdleTimerRequestConfiguration minExpirationTimeout](self, "minExpirationTimeout");
    v8 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("minExpirationTimeout"), 0);
  }
  if (-[SBIdleTimerRequestConfiguration hasMaxExpirationTimeout](self, "hasMaxExpirationTimeout"))
  {
    -[SBIdleTimerRequestConfiguration maxExpirationTimeout](self, "maxExpirationTimeout");
    v9 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", CFSTR("maxExpirationTimeout"), 0);
  }
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerRequestConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBIdleTimerRequestConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  SBIdleTimerRequestConfiguration *v5;
  uint64_t v6;
  NSNumber *boxed_minExpirationTimeout;
  uint64_t v8;
  NSNumber *boxed_maxExpirationTimeout;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIdleTimerRequestConfiguration;
  v5 = -[ITIdleTimerConfiguration initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minExpirationTimeout"));
    v6 = objc_claimAutoreleasedReturnValue();
    boxed_minExpirationTimeout = v5->_boxed_minExpirationTimeout;
    v5->_boxed_minExpirationTimeout = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxExpirationTimeout"));
    v8 = objc_claimAutoreleasedReturnValue();
    boxed_maxExpirationTimeout = v5->_boxed_maxExpirationTimeout;
    v5->_boxed_maxExpirationTimeout = (NSNumber *)v8;

    v5->_precedence = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("precedence"));
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBIdleTimerRequestConfiguration;
    v4 = a3;
    -[ITIdleTimerConfiguration encodeWithBSXPCCoder:](&v5, sel_encodeWithBSXPCCoder_, v4);
    objc_msgSend(v4, "encodeObject:forKey:", self->_boxed_minExpirationTimeout, CFSTR("minExpirationTimeout"), v5.receiver, v5.super_class);
    objc_msgSend(v4, "encodeObject:forKey:", self->_boxed_maxExpirationTimeout, CFSTR("maxExpirationTimeout"));
    objc_msgSend(v4, "encodeUInt64:forKey:", self->_precedence, CFSTR("precedence"));

  }
}

- (NSNumber)_boxed_minExpirationTimeout
{
  return self->_boxed_minExpirationTimeout;
}

- (void)_setBoxed_minExpirationTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_boxed_minExpirationTimeout, a3);
}

- (NSNumber)_boxed_maxExpirationTimeout
{
  return self->_boxed_maxExpirationTimeout;
}

- (void)_setBoxed_maxExpirationTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_boxed_maxExpirationTimeout, a3);
}

- (unint64_t)precedence
{
  return self->_precedence;
}

- (void)setPrecedence:(unint64_t)a3
{
  self->_precedence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxed_maxExpirationTimeout, 0);
  objc_storeStrong((id *)&self->_boxed_minExpirationTimeout, 0);
}

@end
