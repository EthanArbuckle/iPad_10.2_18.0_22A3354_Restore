@implementation SURollbackSuggestionInfo

- (SURollbackSuggestionInfo)init
{
  SURollbackSuggestionInfo *v2;
  SURollbackSuggestionInfo *v3;
  NSString *clientIdentifier;
  NSArray *responsibleProcessesInfo;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SURollbackSuggestionInfo;
  v2 = -[SURollbackSuggestionInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    clientIdentifier = v2->_clientIdentifier;
    v2->_clientIdentifier = 0;

    responsibleProcessesInfo = v3->_responsibleProcessesInfo;
    v3->_responsibleProcessesInfo = 0;

    v3->_suggestionReason = 0;
  }
  return v3;
}

- (id)description
{
  void *v2;
  NSString *clientIdentifier;
  NSArray *responsibleProcessesInfo;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  clientIdentifier = self->_clientIdentifier;
  responsibleProcessesInfo = self->_responsibleProcessesInfo;
  SUStringFromRollbackSuggestionReasonType(self->_suggestionReason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("\n        ClientIdentifier: %@\n        responsibleProcessesInfo: %@\n        Suggestion Reason: %@\n"), clientIdentifier, responsibleProcessesInfo, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SURollbackSuggestionInfo)initWithCoder:(id)a3
{
  id v4;
  SURollbackSuggestionInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SURollbackSuggestionInfo;
  v5 = -[SURollbackSuggestionInfo init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackSuggestionInfo setClientIdentifier:](v5, "setClientIdentifier:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("responsibleProcessesInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackSuggestionInfo setResponsibleProcessesInfo:](v5, "setResponsibleProcessesInfo:", v10);

    -[SURollbackSuggestionInfo setSuggestionReason:](v5, "setSuggestionReason:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("RollbackSuggestionReason")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SURollbackSuggestionInfo clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("ClientIdentifier"));

  -[SURollbackSuggestionInfo responsibleProcessesInfo](self, "responsibleProcessesInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("responsibleProcessesInfo"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[SURollbackSuggestionInfo suggestionReason](self, "suggestionReason"), CFSTR("RollbackSuggestionReason"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  SURollbackSuggestionInfo *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SURollbackSuggestionInfo);
  -[SURollbackSuggestionInfo clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackSuggestionInfo setClientIdentifier:](v4, "setClientIdentifier:", v5);

  -[SURollbackSuggestionInfo responsibleProcessesInfo](self, "responsibleProcessesInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackSuggestionInfo setResponsibleProcessesInfo:](v4, "setResponsibleProcessesInfo:", v6);

  -[SURollbackSuggestionInfo setSuggestionReason:](v4, "setSuggestionReason:", -[SURollbackSuggestionInfo suggestionReason](self, "suggestionReason"));
  return v4;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSArray)responsibleProcessesInfo
{
  return self->_responsibleProcessesInfo;
}

- (void)setResponsibleProcessesInfo:(id)a3
{
  objc_storeStrong((id *)&self->_responsibleProcessesInfo, a3);
}

- (unint64_t)suggestionReason
{
  return self->_suggestionReason;
}

- (void)setSuggestionReason:(unint64_t)a3
{
  self->_suggestionReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsibleProcessesInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
