@implementation PKBusinessChatAccountContext

- (PKBusinessChatAccountContext)initWithAccount:(id)a3 topic:(id)a4
{
  id v7;
  id v8;
  PKBusinessChatAccountContext *v9;
  PKBusinessChatAccountContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKBusinessChatAccountContext;
  v9 = -[PKBusinessChatAccountContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)businessIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (-[PKAccount type](self->_account, "type") == 4)
  {
    PKSavingsBusinessChatIdentifierOverride();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[PKAccount savingsDetails](self->_account, "savingsDetails");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "businessChatIdentifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)intentParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKAccountSupportTopic businessChatTargetDialog](self->_topic, "businessChatTargetDialog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("targetDialog"));

  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountID"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)groupParameters
{
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("domain");
  v5[1] = CFSTR("origin");
  v6[0] = CFSTR("apple_pay");
  v6[1] = CFSTR("Wallet");
  v5[2] = CFSTR("page");
  -[PKAccountSupportTopic businessChatPage](self->_topic, "businessChatPage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  return (id)-[PKAccountSupportTopic bodyText](self->_topic, "bodyText");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
