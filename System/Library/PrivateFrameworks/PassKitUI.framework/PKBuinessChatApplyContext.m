@implementation PKBuinessChatApplyContext

- (PKBuinessChatApplyContext)initWithIdentifier:(id)a3 intent:(int64_t)a4
{
  id v7;
  PKBuinessChatApplyContext *v8;
  PKBuinessChatApplyContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBuinessChatApplyContext;
  v8 = -[PKBuinessChatApplyContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_intent = a4;
  }

  return v9;
}

- (id)businessIdentifier
{
  return self->_identifier;
}

- (id)intentParameters
{
  id v3;
  void *v4;
  unint64_t intent;
  __CFString *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  intent = self->_intent;
  if (intent > 2)
    v6 = 0;
  else
    v6 = off_1E3E63DC8[intent];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("targetDialog"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)groupParameters
{
  id v3;
  unint64_t intent;
  __CFString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("apple_pay"), CFSTR("domain"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Wallet"), CFSTR("origin"));
  intent = self->_intent;
  if (intent > 2)
    v5 = 0;
  else
    v5 = off_1E3E63DE0[intent];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("page"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  int64_t intent;
  void *v3;

  intent = self->_intent;
  if (intent == 1 || intent == 2)
  {
    PKLocalizedFeatureStringWithDefaultValue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
