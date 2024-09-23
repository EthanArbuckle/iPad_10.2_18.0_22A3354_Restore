@implementation SBTraitsInputsValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  id v6;
  void *v8;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsInputsValidators.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputs != nil"));

  }
  return v6;
}

- (SBTraitsInputsValidator)initWithValidatorOrder:(id)a3
{
  id v4;
  SBTraitsInputsValidator *v5;
  uint64_t v6;
  NSNumber *validatorOrder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsInputsValidator;
  v5 = -[SBTraitsInputsValidator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    validatorOrder = v5->_validatorOrder;
    v5->_validatorOrder = (NSNumber *)v6;

  }
  return v5;
}

- (SBTraitsInputsValidator)init
{
  return -[SBTraitsInputsValidator initWithValidatorOrder:](self, "initWithValidatorOrder:", &unk_1E91D0FC8);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsInputsValidator;
  -[SBTraitsInputsValidator description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSNumber stringValue](self->_validatorOrder, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" order: %@"), v6);

  return (NSString *)v5;
}

- (NSNumber)validatorOrder
{
  return self->_validatorOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatorOrder, 0);
}

@end
