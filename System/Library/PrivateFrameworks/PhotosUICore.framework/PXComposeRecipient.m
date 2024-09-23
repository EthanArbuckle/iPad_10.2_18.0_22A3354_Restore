@implementation PXComposeRecipient

- (PXComposeRecipient)initWithRecipient:(id)a3
{
  id v6;
  PXComposeRecipient *v7;
  PXComposeRecipient *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipient.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipient"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXComposeRecipient;
  v7 = -[PXComposeRecipient init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_recipient, a3);

  return v8;
}

- (PXComposeRecipient)initWithPersonSuggestion:(id)a3
{
  return -[PXComposeRecipient initWithPersonSuggestion:contact:](self, "initWithPersonSuggestion:contact:", a3, 0);
}

- (PXComposeRecipient)initWithPersonSuggestion:(id)a3 contact:(id)a4
{
  id v8;
  id v9;
  PXComposeRecipient *v10;
  PXComposeRecipient *v11;
  uint64_t v12;
  PXRecipient *recipient;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipient.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personSuggestion"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXComposeRecipient;
  v10 = -[PXComposeRecipient init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_personSuggestion, a3);
    PXRecipientWithPersonSuggestion(v11->_personSuggestion, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    recipient = v11->_recipient;
    v11->_recipient = (PXRecipient *)v12;

  }
  return v11;
}

- (NSString)localizedName
{
  void *recipient;

  recipient = self->_recipient;
  if (!recipient)
    recipient = self->_personSuggestion;
  objc_msgSend(recipient, "localizedName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNContact)contact
{
  void *recipient;

  recipient = self->_recipient;
  if (recipient)
  {
    objc_msgSend(recipient, "contact");
    recipient = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CNContact *)recipient;
}

- (NSDictionary)diagnosticDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipient localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Localized Name"));

  -[PXComposeRecipient contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Contact"));

  -[PXComposeRecipient personSuggestion](self, "personSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("YES");
  if (!v6)
    v7 = CFSTR("NO");
  v8 = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isSuggestion"));

  return (NSDictionary *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXComposeRecipient personSuggestion](self, "personSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personSuggestion");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      -[PXComposeRecipient recipient](self, "recipient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", v11);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[PXComposeRecipient recipient](self, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hash");
  }
  else
  {
    -[PXComposeRecipient personSuggestion](self, "personSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hash");

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXComposeRecipient localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipient contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, localizedName:%@, contact:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (PXRecipient)recipient
{
  return self->_recipient;
}

- (PXPersonSuggestion)personSuggestion
{
  return self->_personSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSuggestion, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
