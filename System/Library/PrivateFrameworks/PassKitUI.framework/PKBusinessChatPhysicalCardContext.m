@implementation PKBusinessChatPhysicalCardContext

- (PKBusinessChatPhysicalCardContext)initWithPaymentPass:(id)a3 intent:(int64_t)a4
{
  id v7;
  PKBusinessChatPhysicalCardContext *v8;
  PKBusinessChatPhysicalCardContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBusinessChatPhysicalCardContext;
  v8 = -[PKBusinessChatPhysicalCardContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_paymentPass, a3);
    v9->_intent = a4;
  }

  return v9;
}

- (id)businessIdentifier
{
  return (id)-[PKPaymentPass businessChatIdentifier](self->_paymentPass, "businessChatIdentifier");
}

- (id)intentParameters
{
  unint64_t intent;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;

  intent = self->_intent;
  if (intent > 7)
    v4 = 0;
  else
    v4 = off_1E3E63ED8[intent];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("targetDialog"));
  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_paymentPass, "associatedAccountServiceAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("accountID"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (id)groupParameters
{
  unint64_t intent;
  __CFString *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  intent = self->_intent;
  if (intent > 7)
    v3 = 0;
  else
    v3 = off_1E3E63F18[intent];
  v5[0] = CFSTR("domain");
  v5[1] = CFSTR("origin");
  v6[0] = CFSTR("apple_pay");
  v6[1] = CFSTR("Wallet");
  v5[2] = CFSTR("page");
  v6[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bodyText
{
  void *v3;

  v3 = 0;
  switch(self->_intent)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      PKLocalizedFeatureStringWithDefaultValue();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
