@implementation SIRINLURequest

- (SIRINLURequest)initWithRequestId:(id)a3 currentTurnInput:(id)a4 previousTurnInputs:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIRINLURequest *v12;
  SIRINLURequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLURequest;
  v12 = -[SIRINLURequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestId, a3);
    objc_storeStrong((id *)&v13->_currentTurnInput, a4);
    objc_storeStrong((id *)&v13->_previousTurnInputs, a5);
  }

  return v13;
}

- (SIRINLURequest)initWithCoder:(id)a3
{
  id v4;
  SIRINLURequest *v5;
  uint64_t v6;
  SIRINLURequestID *requestId;
  uint64_t v8;
  SIRINLUTurnInput *currentTurnInput;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *previousTurnInputs;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIRINLURequest;
  v5 = -[SIRINLURequest init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLURequestID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentTurnInput"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentTurnInput = v5->_currentTurnInput;
    v5->_currentTurnInput = (SIRINLUTurnInput *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("previousTurnInputs"));
    v13 = objc_claimAutoreleasedReturnValue();
    previousTurnInputs = v5->_previousTurnInputs;
    v5->_previousTurnInputs = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SIRINLURequest requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestId"));

  -[SIRINLURequest currentTurnInput](self, "currentTurnInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currentTurnInput"));

  -[SIRINLURequest previousTurnInputs](self, "previousTurnInputs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("previousTurnInputs"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SIRINLURequest requestId](self, "requestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLURequest currentTurnInput](self, "currentTurnInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLURequest previousTurnInputs](self, "previousTurnInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v9, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{Request\n  requestId:\n%@\n  currentTurnInput:\n%@\n  previousTurnInputs:\n%@\n}"), v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SIRINLURequestID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (SIRINLUTurnInput)currentTurnInput
{
  return self->_currentTurnInput;
}

- (void)setCurrentTurnInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentTurnInput, a3);
}

- (NSArray)previousTurnInputs
{
  return self->_previousTurnInputs;
}

- (void)setPreviousTurnInputs:(id)a3
{
  objc_storeStrong((id *)&self->_previousTurnInputs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTurnInputs, 0);
  objc_storeStrong((id *)&self->_currentTurnInput, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
