@implementation SBRotationDodgingModifier

- (SBRotationDodgingModifier)initWithIdentifier:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  id v9;
  SBRotationDodgingModifier *v10;
  SBRotationDodgingModifier *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBRotationDodgingModifier;
  v10 = -[SBChainableModifier init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    v11->_fromOrientation = a4;
    v11->_toOrientation = a5;
  }

  return v11;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  return 1;
}

- (id)handleRotationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  SBInvalidationDodgingModifierEventResponse *v9;
  uint64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBRotationDodgingModifier;
  -[SBDodgingModifier handleRotationEvent:](&v12, sel_handleRotationEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", self->_identifier);

  if (v7)
  {
    v8 = objc_msgSend(v4, "phase");
    self->_phase = v8;
    if (v8 == 2)
    {
      -[SBChainableModifier setState:](self, "setState:", 1);
    }
    else if (v8 == 1)
    {
      v9 = -[SBInvalidationDodgingModifierEventResponse initWithOptions:]([SBInvalidationDodgingModifierEventResponse alloc], "initWithOptions:", 3);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBDodgingModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
  }

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
