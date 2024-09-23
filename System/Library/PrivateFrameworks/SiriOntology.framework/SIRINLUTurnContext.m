@implementation SIRINLUTurnContext

- (SIRINLUTurnContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SIRINLUTurnContext;
  return -[SIRINLUTurnContext init](&v3, sel_init);
}

- (SIRINLUTurnContext)initWithNLContext:(id)a3 legacyNLContext:(id)a4
{
  id v7;
  id v8;
  SIRINLUTurnContext *v9;
  SIRINLUTurnContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUTurnContext;
  v9 = -[SIRINLUTurnContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nlContext, a3);
    objc_storeStrong((id *)&v10->_nlContextNullable, a3);
    objc_storeStrong((id *)&v10->_legacyNLContext, a4);
    objc_storeStrong((id *)&v10->_legacyNLContextNullable, a4);
  }

  return v10;
}

- (SIRINLUTurnContext)initWithNLContext:(id)a3
{
  id v5;
  SIRINLUTurnContext *v6;
  SIRINLUTurnContext *v7;
  uint64_t v8;
  SIRINLULegacyNLContext *legacyNLContext;
  SIRINLULegacyNLContext *legacyNLContextNullable;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUTurnContext;
  v6 = -[SIRINLUTurnContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nlContext, a3);
    objc_storeStrong((id *)&v7->_nlContextNullable, a3);
    objc_msgSend((id)objc_opt_class(), "createEmptyPlaceholderLegacyNLContext");
    v8 = objc_claimAutoreleasedReturnValue();
    legacyNLContext = v7->_legacyNLContext;
    v7->_legacyNLContext = (SIRINLULegacyNLContext *)v8;

    legacyNLContextNullable = v7->_legacyNLContextNullable;
    v7->_legacyNLContextNullable = 0;

  }
  return v7;
}

- (SIRINLUTurnContext)initWithLegacyNLContext:(id)a3
{
  id v5;
  SIRINLUTurnContext *v6;
  uint64_t v7;
  SIRINLUNLContext *nlContext;
  SIRINLUNLContext *nlContextNullable;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUTurnContext;
  v6 = -[SIRINLUTurnContext init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "createEmptyPlaceholderNLContext");
    v7 = objc_claimAutoreleasedReturnValue();
    nlContext = v6->_nlContext;
    v6->_nlContext = (SIRINLUNLContext *)v7;

    nlContextNullable = v6->_nlContextNullable;
    v6->_nlContextNullable = 0;

    objc_storeStrong((id *)&v6->_legacyNLContext, a3);
    objc_storeStrong((id *)&v6->_legacyNLContextNullable, a3);
  }

  return v6;
}

- (SIRINLUTurnContext)initWithCoder:(id)a3
{
  id v4;
  SIRINLUTurnContext *v5;
  uint64_t v6;
  SIRINLUNLContext *nlContext;
  uint64_t v8;
  SIRINLUNLContext *nlContextNullable;
  uint64_t v10;
  SIRINLULegacyNLContext *legacyNLContext;
  uint64_t v12;
  SIRINLULegacyNLContext *legacyNLContextNullable;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUTurnContext;
  v5 = -[SIRINLUTurnContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nlContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    nlContext = v5->_nlContext;
    v5->_nlContext = (SIRINLUNLContext *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nlContextNullable"));
    v8 = objc_claimAutoreleasedReturnValue();
    nlContextNullable = v5->_nlContextNullable;
    v5->_nlContextNullable = (SIRINLUNLContext *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legacyNLContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    legacyNLContext = v5->_legacyNLContext;
    v5->_legacyNLContext = (SIRINLULegacyNLContext *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("legacyNLContextNullable"));
    v12 = objc_claimAutoreleasedReturnValue();
    legacyNLContextNullable = v5->_legacyNLContextNullable;
    v5->_legacyNLContextNullable = (SIRINLULegacyNLContext *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SIRINLUTurnContext nlContext](self, "nlContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nlContext"));

  -[SIRINLUTurnContext nlContextNullable](self, "nlContextNullable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nlContextNullable"));

  -[SIRINLUTurnContext legacyNLContext](self, "legacyNLContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("legacyNLContext"));

  -[SIRINLUTurnContext legacyNLContextNullable](self, "legacyNLContextNullable");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("legacyNLContextNullable"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUTurnContext nlContext](self, "nlContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUTurnContext nlContextNullable](self, "nlContextNullable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUTurnContext legacyNLContext](self, "legacyNLContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUTurnContext legacyNLContextNullable](self, "legacyNLContextNullable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{TurnContext\n  nlContext: %@\n  nlContextNullable: %@\n  legacyNLContext: %@\n  legacyNLContextNullable: %@\n}"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SIRINLUNLContext)nlContext
{
  return self->_nlContext;
}

- (void)setNlContext:(id)a3
{
  objc_storeStrong((id *)&self->_nlContext, a3);
}

- (SIRINLULegacyNLContext)legacyNLContext
{
  return self->_legacyNLContext;
}

- (void)setLegacyNLContext:(id)a3
{
  objc_storeStrong((id *)&self->_legacyNLContext, a3);
}

- (SIRINLUNLContext)nlContextNullable
{
  return self->_nlContextNullable;
}

- (void)setNlContextNullable:(id)a3
{
  objc_storeStrong((id *)&self->_nlContextNullable, a3);
}

- (SIRINLULegacyNLContext)legacyNLContextNullable
{
  return self->_legacyNLContextNullable;
}

- (void)setLegacyNLContextNullable:(id)a3
{
  objc_storeStrong((id *)&self->_legacyNLContextNullable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNLContextNullable, 0);
  objc_storeStrong((id *)&self->_nlContextNullable, 0);
  objc_storeStrong((id *)&self->_legacyNLContext, 0);
  objc_storeStrong((id *)&self->_nlContext, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createEmptyPlaceholderNLContext
{
  SIRINLUNLContext *v2;
  void *v3;
  void *v4;
  void *v5;
  SIRINLUNLContext *v6;

  v2 = [SIRINLUNLContext alloc];
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SIRINLUNLContext initWithSystemDialogActs:activeTasks:executedTasks:](v2, "initWithSystemDialogActs:activeTasks:executedTasks:", v3, v4, v5);

  return v6;
}

+ (id)createEmptyPlaceholderLegacyNLContext
{
  return -[SIRINLULegacyNLContext initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:]([SIRINLULegacyNLContext alloc], "initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:", 0, 0, &stru_1E7D21BF0, 0);
}

@end
