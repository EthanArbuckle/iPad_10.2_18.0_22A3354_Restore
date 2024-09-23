@implementation SBFAuthenticationRequest

- (id)_initWithType:(unint64_t)a3 source:(int64_t)a4 passcode:(id)a5 skipSEKeepUserDataOperation:(BOOL)a6 verifyOnly:(BOOL)a7 handler:(id)a8
{
  id v14;
  id v15;
  SBFAuthenticationRequest *v16;
  SBFAuthenticationRequest *v17;
  uint64_t v18;
  NSString *passcode;
  uint64_t v20;
  id handler;
  objc_super v23;

  v14 = a5;
  v15 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SBFAuthenticationRequest;
  v16 = -[SBFAuthenticationRequest init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_source = a4;
    v18 = objc_msgSend(v14, "copy");
    passcode = v17->_passcode;
    v17->_passcode = (NSString *)v18;

    v20 = objc_msgSend(v15, "copy");
    handler = v17->_handler;
    v17->_handler = (id)v20;

    v17->_skipSEKeepUserDataOperation = a6;
    v17->_verifyOnly = a7;
  }

  return v17;
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4 skipSEKeepUserDataOperation:(BOOL)a5 verifyOnly:(BOOL)a6 handler:(id)a7
{
  return -[SBFAuthenticationRequest _initWithType:source:passcode:skipSEKeepUserDataOperation:verifyOnly:handler:](self, "_initWithType:source:passcode:skipSEKeepUserDataOperation:verifyOnly:handler:", 1, a4, a3, a5, a6, a7);
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4 skipSEKeepUserDataOperation:(BOOL)a5 handler:(id)a6
{
  return -[SBFAuthenticationRequest _initWithType:source:passcode:skipSEKeepUserDataOperation:verifyOnly:handler:](self, "_initWithType:source:passcode:skipSEKeepUserDataOperation:verifyOnly:handler:", 1, a4, a3, a5, 0, a6);
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4 handler:(id)a5
{
  return -[SBFAuthenticationRequest initForPasscode:source:skipSEKeepUserDataOperation:handler:](self, "initForPasscode:source:skipSEKeepUserDataOperation:handler:", a3, a4, 0, a5);
}

- (id)initForPasscode:(id)a3 source:(int64_t)a4
{
  return -[SBFAuthenticationRequest initForPasscode:source:handler:](self, "initForPasscode:source:handler:", a3, a4, 0);
}

- (id)initForBiometricAuthenticationWithSource:(int64_t)a3 handler:(id)a4
{
  return -[SBFAuthenticationRequest _initWithType:source:passcode:skipSEKeepUserDataOperation:verifyOnly:handler:](self, "_initWithType:source:passcode:skipSEKeepUserDataOperation:verifyOnly:handler:", 2, a3, 0, 0, 0, a4);
}

- (id)initForBiometricAuthenticationWithSource:(int64_t)a3
{
  return -[SBFAuthenticationRequest initForBiometricAuthenticationWithSource:handler:](self, "initForBiometricAuthenticationWithSource:handler:", a3, 0);
}

- (id)publicDescription
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_type, CFSTR("type"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_source, CFSTR("source"));
  v6 = (void *)MEMORY[0x1E0D01748];
  v7 = (void *)MEMORY[0x18D774178](self->_handler);
  objc_msgSend(v6, "builderWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("handler"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", self->_passcode != 0, CFSTR("hasPasscode"));
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  return -[SBFAuthenticationRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFAuthenticationRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_type, CFSTR("type"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_source, CFSTR("source"));
  v6 = (void *)MEMORY[0x18D774178](self->_handler);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("handler"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFAuthenticationRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)skipSEKeepUserDataOperation
{
  return self->_skipSEKeepUserDataOperation;
}

- (BOOL)verifyOnly
{
  return self->_verifyOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
