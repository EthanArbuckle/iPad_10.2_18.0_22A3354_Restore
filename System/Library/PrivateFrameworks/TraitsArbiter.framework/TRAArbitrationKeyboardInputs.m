@implementation TRAArbitrationKeyboardInputs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedParticipantUniqueIdentifier, 0);
}

- (TRAArbitrationKeyboardInputs)initWithKeyboardFocusedParticipantUniqueIdentifier:(id)a3
{
  id v4;
  TRAArbitrationKeyboardInputs *v5;
  uint64_t v6;
  NSString *focusedParticipantUniqueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAArbitrationKeyboardInputs;
  v5 = -[TRAArbitrationKeyboardInputs init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    focusedParticipantUniqueIdentifier = v5->_focusedParticipantUniqueIdentifier;
    v5->_focusedParticipantUniqueIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)focusedParticipantUniqueIdentifier
{
  return self->_focusedParticipantUniqueIdentifier;
}

- (BOOL)isEqualToTraitsArbitrationKeyboardInputs:(id)a3
{
  TRAArbitrationKeyboardInputs *v5;
  NSString *focusedParticipantUniqueIdentifier;
  void *v7;
  char v8;
  void *v10;

  v5 = (TRAArbitrationKeyboardInputs *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputs == nil || [inputs isKindOfClass:[TRAArbitrationKeyboardInputs class]]"));

    }
    if (self == v5)
    {
      v8 = 1;
    }
    else
    {
      focusedParticipantUniqueIdentifier = self->_focusedParticipantUniqueIdentifier;
      -[TRAArbitrationKeyboardInputs focusedParticipantUniqueIdentifier](v5, "focusedParticipantUniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSString isEqualToString:](focusedParticipantUniqueIdentifier, "isEqualToString:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRAArbitrationKeyboardInputs *v4;
  BOOL v5;

  v4 = (TRAArbitrationKeyboardInputs *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRAArbitrationKeyboardInputs isEqualToTraitsArbitrationKeyboardInputs:](self, "isEqualToTraitsArbitrationKeyboardInputs:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationKeyboardInputs succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_focusedParticipantUniqueIdentifier, CFSTR("focusedParticipantUniqueIdentifier"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationKeyboardInputs descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
