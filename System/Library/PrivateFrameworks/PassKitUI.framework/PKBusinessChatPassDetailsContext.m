@implementation PKBusinessChatPassDetailsContext

- (PKBusinessChatPassDetailsContext)initWithPass:(id)a3
{
  id v5;
  PKBusinessChatPassDetailsContext *v6;
  PKBusinessChatPassDetailsContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKBusinessChatPassDetailsContext;
  v6 = -[PKBusinessChatPassDetailsContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pass, a3);

  return v7;
}

- (id)businessIdentifier
{
  return (id)-[PKPass businessChatIdentifier](self->_pass, "businessChatIdentifier");
}

- (id)intentParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("wallet_pass_message"), CFSTR("targetDialog"));
  -[PKPass uniqueID](self->_pass, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("passUniqueId"));

  -[PKPass paymentPass](self->_pass, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedAccountServiceAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accountID"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)groupParameters
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("domain");
  v3[1] = CFSTR("origin");
  v4[0] = CFSTR("apple_pay");
  v4[1] = CFSTR("Wallet");
  v3[2] = CFSTR("page");
  v4[2] = CFSTR("wallet::pass::message");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
