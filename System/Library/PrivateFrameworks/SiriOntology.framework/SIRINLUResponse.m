@implementation SIRINLUResponse

- (SIRINLUResponse)initWithRequestId:(id)a3 parses:(id)a4
{
  id v7;
  id v8;
  SIRINLUResponse *v9;
  SIRINLUResponse *v10;
  NSArray *repetitionResults;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SIRINLUResponse;
  v9 = -[SIRINLUResponse init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestId, a3);
    objc_storeStrong((id *)&v10->_parses, a4);
    repetitionResults = v10->_repetitionResults;
    v10->_repetitionResults = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v10;
}

- (SIRINLUResponse)initWithRequestId:(id)a3 parses:(id)a4 repetitionResults:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIRINLUResponse *v12;
  SIRINLUResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUResponse;
  v12 = -[SIRINLUResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestId, a3);
    objc_storeStrong((id *)&v13->_parses, a4);
    objc_storeStrong((id *)&v13->_repetitionResults, a5);
  }

  return v13;
}

- (SIRINLUResponse)initWithCoder:(id)a3
{
  id v4;
  SIRINLUResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  SIRINLURequestID *requestId;
  uint64_t v11;
  NSArray *parses;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *repetitionResults;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SIRINLUResponse;
  v5 = -[SIRINLUResponse init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
    v9 = objc_claimAutoreleasedReturnValue();
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLURequestID *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parses"));
    v11 = objc_claimAutoreleasedReturnValue();
    parses = v5->_parses;
    v5->_parses = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("repetitionResults"));
    v16 = objc_claimAutoreleasedReturnValue();
    repetitionResults = v5->_repetitionResults;
    v5->_repetitionResults = (NSArray *)v16;

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
  -[SIRINLUResponse requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestId"));

  -[SIRINLUResponse parses](self, "parses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parses"));

  -[SIRINLUResponse repetitionResults](self, "repetitionResults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("repetitionResults"));

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

  -[SIRINLUResponse requestId](self, "requestId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUResponse repetitionResults](self, "repetitionResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SIRINLUResponse parses](self, "parses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v8, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{Response\n  requestId:\n%@\n  parses:\n%@\n  repetitionResults:\n%@\n}"), v5, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SIRINLURequestID)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSArray)parses
{
  return self->_parses;
}

- (void)setParses:(id)a3
{
  objc_storeStrong((id *)&self->_parses, a3);
}

- (SIRINLUResponseStatus)responseStatus
{
  return self->_responseStatus;
}

- (void)setResponseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_responseStatus, a3);
}

- (NSArray)repetitionResults
{
  return self->_repetitionResults;
}

- (void)setRepetitionResults:(id)a3
{
  objc_storeStrong((id *)&self->_repetitionResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repetitionResults, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_parses, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
