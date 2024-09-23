@implementation SBFAuthenticationAssertion

- (SBFAuthenticationAssertion)initWithIdentifier:(id)a3 type:(int64_t)a4 withController:(id)a5
{
  id v9;
  id v10;
  SBFAuthenticationAssertion *v11;
  uint64_t v12;
  NSString *identifier;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  if (a4)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFAuthenticationAssertion.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

    if (v10)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFAuthenticationAssertion.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != SBFAuthenticationAssertionTypeUndefined"));

  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFAuthenticationAssertion.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("controller != nil"));

LABEL_4:
  v18.receiver = self;
  v18.super_class = (Class)SBFAuthenticationAssertion;
  v11 = -[SBFAuthenticationAssertion init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v11->_type = a4;
    objc_storeWeak((id *)&v11->_controller, v10);
  }

  return v11;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  unint64_t type;
  const __CFString *v7;
  objc_super v8;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    type = self->_type;
    if (type > 2)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_1E200E930[type];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFAuthenticationAssertion.m"), 53, CFSTR("the assertion must be invalidated before it can be dealloced : (%@) %@"), v7, self->_identifier);

  }
  v8.receiver = self;
  v8.super_class = (Class)SBFAuthenticationAssertion;
  -[SBFAuthenticationAssertion dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBFAuthenticationAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFAuthenticationAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  unint64_t type;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("reason"));
  type = self->_type;
  if (type > 2)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E200E930[type];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("type"));
  if (self->_activated)
  {
    v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFAuthenticationAssertion isValid](self, "isValid"), CFSTR("valid"));
    if (self->_activationDate)
    {
      objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", self->_activationDate);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:withName:", v9, CFSTR("activationDate"));

    }
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFAuthenticationAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isValid
{
  id WeakRetained;
  char v5;

  if (!self->_activated || self->_invalidated)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v5 = objc_msgSend(WeakRetained, "_isAssertionValid:", self);

  return v5;
}

- (void)activate
{
  NSDate *v3;
  NSDate *activationDate;
  id WeakRetained;

  if (!self->_activated && !self->_invalidated)
  {
    self->_activated = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activationDate = self->_activationDate;
    self->_activationDate = v3;

    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "_addAuthenticationAssertion:", self);

  }
}

- (void)invalidate
{
  id WeakRetained;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_activated)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "_removeAuthenticationAssertion:", self);

    }
    objc_storeWeak((id *)&self->_controller, 0);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SBFUserAuthenticationController)controller
{
  return (SBFUserAuthenticationController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
}

@end
