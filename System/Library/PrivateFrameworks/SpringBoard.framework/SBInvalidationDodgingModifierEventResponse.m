@implementation SBInvalidationDodgingModifierEventResponse

+ (id)responseWithOptions:(unint64_t)a3
{
  return -[SBInvalidationDodgingModifierEventResponse initWithOptions:]([SBInvalidationDodgingModifierEventResponse alloc], "initWithOptions:", a3);
}

- (SBInvalidationDodgingModifierEventResponse)initWithOptions:(unint64_t)a3
{
  SBInvalidationDodgingModifierEventResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBInvalidationDodgingModifierEventResponse;
  result = -[SBChainableModifierEventResponse init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (unint64_t)type
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SBInvalidationDodgingModifierEventResponse;
  -[SBDodgingModifierEventResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringFromInvalidationEventResponseOptions(self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)disableCoalescing
{
  return self->_disableCoalescing;
}

- (void)setDisableCoalescing:(BOOL)a3
{
  self->_disableCoalescing = a3;
}

- (NSString)completionIdentifier
{
  return self->_completionIdentifier;
}

- (void)setCompletionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_completionIdentifier, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_completionIdentifier, 0);
}

@end
