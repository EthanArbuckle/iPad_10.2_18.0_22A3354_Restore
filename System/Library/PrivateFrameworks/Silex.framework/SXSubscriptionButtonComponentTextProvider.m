@implementation SXSubscriptionButtonComponentTextProvider

- (SXSubscriptionButtonComponentTextProvider)initWithTextProvider:(id)a3
{
  id v5;
  SXSubscriptionButtonComponentTextProvider *v6;
  SXSubscriptionButtonComponentTextProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXSubscriptionButtonComponentTextProvider;
  v6 = -[SXSubscriptionButtonComponentTextProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textProvider, a3);

  return v7;
}

- (id)textForComponent:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SXSubscriptionButtonComponentTextProvider textProvider](self, "textProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_24D68E0F8;
    if (v8)
      v10 = (__CFString *)v8;
    v6 = v10;

  }
  return v6;
}

- (SXSubscriptionButtonTextProviding)textProvider
{
  return self->_textProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
