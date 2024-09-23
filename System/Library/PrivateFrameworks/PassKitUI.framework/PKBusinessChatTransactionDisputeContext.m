@implementation PKBusinessChatTransactionDisputeContext

- (PKBusinessChatTransactionDisputeContext)initWithPaymentPass:(id)a3 transaction:(id)a4 account:(id)a5 accountUser:(id)a6 familyMember:(id)a7 physicalCards:(id)a8 intent:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  PKBusinessChatTransactionDisputeContext *v19;
  PKBusinessChatTransactionDisputeContext *v20;
  uint64_t v21;
  NSSet *physicalCards;
  char v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKBusinessChatTransactionDisputeContext;
  v19 = -[PKBusinessChatTransactionDisputeContext init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_paymentPass, a3);
    objc_storeStrong((id *)&v20->_transaction, a4);
    objc_storeStrong((id *)&v20->_account, a5);
    objc_storeStrong((id *)&v20->_accountUser, a6);
    objc_storeStrong((id *)&v20->_familyMember, a7);
    v21 = objc_msgSend(v18, "copy");
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v21;

    v20->_intent = a9;
    if (v16)
      v23 = objc_msgSend(v16, "isCurrentUser") ^ 1;
    else
      v23 = 0;
    v20->_disputingAccountUserTransaction = v23;
  }

  return v20;
}

- (PKBusinessChatTransactionDisputeContext)initWithPaymentPass:(id)a3 transaction:(id)a4 account:(id)a5 accountUser:(id)a6 familyMember:(id)a7 physicalCards:(id)a8 topic:(id)a9
{
  id v16;
  id v17;
  PKBusinessChatTransactionDisputeContext *v18;
  PKBusinessChatTransactionDisputeContext *v19;
  uint64_t v20;
  NSSet *physicalCards;
  char v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v16 = a6;
  v25 = a7;
  v17 = a8;
  v24 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PKBusinessChatTransactionDisputeContext;
  v18 = -[PKBusinessChatTransactionDisputeContext init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentPass, a3);
    objc_storeStrong((id *)&v19->_transaction, a4);
    objc_storeStrong((id *)&v19->_account, a5);
    objc_storeStrong((id *)&v19->_accountUser, a6);
    objc_storeStrong((id *)&v19->_familyMember, a7);
    v20 = objc_msgSend(v17, "copy");
    physicalCards = v19->_physicalCards;
    v19->_physicalCards = (NSSet *)v20;

    v19->_intent = 5;
    objc_storeStrong((id *)&v19->_topic, a9);
    if (v16)
      v22 = objc_msgSend(v16, "isCurrentUser") ^ 1;
    else
      v22 = 0;
    v19->_disputingAccountUserTransaction = v22;
  }

  return v19;
}

- (id)businessIdentifier
{
  return (id)-[PKPaymentPass businessChatIdentifier](self->_paymentPass, "businessChatIdentifier");
}

- (id)intentParameters
{
  PKAccountSupportTopic *topic;
  uint64_t v4;
  unint64_t intent;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSSet *physicalCards;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKAccountUser *accountUser;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;

  topic = self->_topic;
  if (topic)
  {
    -[PKAccountSupportTopic businessChatTargetDialog](topic, "businessChatTargetDialog");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (__CFString *)v4;
    goto LABEL_9;
  }
  intent = self->_intent;
  if (intent > 0xD)
    v6 = 0;
  else
    v6 = off_1E3E63DF8[intent];
  if (self->_disputingAccountUserTransaction)
  {
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("_alt"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("targetDialog"));
  -[PKPaymentTransaction serviceIdentifier](self->_transaction, "serviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("transactionId"));

  -[PKPaymentPass uniqueID](self->_paymentPass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("passUniqueId"));

  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_paymentPass, "associatedAccountServiceAccountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("accountID"));

  v11 = -[PKPaymentTransaction effectiveTransactionSource](self->_transaction, "effectiveTransactionSource");
  PKPaymentTransactionSourceToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("paymentMethod"));

  if (v11 == 5)
  {
    -[PKPaymentTransaction cardNumberSuffix](self->_transaction, "cardNumberSuffix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    physicalCards = self->_physicalCards;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __59__PKBusinessChatTransactionDisputeContext_intentParameters__block_invoke;
    v38[3] = &unk_1E3E63C90;
    v39 = v13;
    v15 = v13;
    -[NSSet pk_anyObjectPassingTest:](physicalCards, "pk_anyObjectPassingTest:", v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v16, "state");
  PKStringFromPhysicalCardState();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("physicalCardStatus"));

  -[PKPaymentTransaction amount](self->_transaction, "amount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("transactionAmount"));

  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("transactionMerchantName"));

  -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKW3CDateStringFromDate();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("transactionDate"));

  accountUser = self->_accountUser;
  if (accountUser)
  {
    -[PKAccountUser accountState](accountUser, "accountState");
    PKAccountStateToString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("transactorAccountState"));

    v26 = -[PKAccountUser accessLevel](self->_accountUser, "accessLevel");
    v27 = CFSTR("participant");
    if (v26 != 2)
      v27 = 0;
    if (v26 == 1)
      v28 = CFSTR("owner");
    else
      v28 = v27;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("transactorAccountRole"));
    -[PKAccountUser firstName](self->_accountUser, "firstName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("transactorFirstName"));

  }
  else
  {
    -[PKAccount state](self->_account, "state");
    PKAccountStateToString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("transactorAccountState"));

    v31 = -[PKAccount accessLevel](self->_account, "accessLevel");
    v32 = CFSTR("participant");
    if (v31 != 2)
      v32 = 0;
    if (v31 == 1)
      v33 = CFSTR("owner");
    else
      v33 = v32;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("transactorAccountRole"));
  }
  if (-[PKPaymentTransaction disputeStatus](self->_transaction, "disputeStatus"))
    v34 = CFSTR("true");
  else
    v34 = CFSTR("false");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("disputeInProgress"));
  -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
  PKPaymentTransactionTypeToString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("transactionType"));

  v36 = (void *)objc_msgSend(v7, "copy");
  return v36;
}

uint64_t __59__PKBusinessChatTransactionDisputeContext_intentParameters__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "FPANSuffix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)groupParameters
{
  uint64_t v2;
  unint64_t intent;
  __CFString *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if (self->_topic)
  {
    -[PKAccountSupportTopic businessChatPage](self->_topic, "businessChatPage");
    v2 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v4 = (__CFString *)v2;
    goto LABEL_9;
  }
  intent = self->_intent;
  if (intent > 0xD)
    v4 = 0;
  else
    v4 = off_1E3E63E68[intent];
  if (self->_disputingAccountUserTransaction)
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("::alt"));
    v2 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  v7[0] = CFSTR("domain");
  v7[1] = CFSTR("origin");
  v8[0] = CFSTR("apple_pay");
  v8[1] = CFSTR("Wallet");
  v7[2] = CFSTR("page");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)bodyText
{
  PKAccountSupportTopic *topic;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKFamilyMember *familyMember;
  PKAccountUser *accountUser;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  PKFamilyMember *v19;
  void *v20;
  uint64_t v21;

  topic = self->_topic;
  if (topic)
  {
    -[PKAccountSupportTopic bodyText](topic, "bodyText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBusinessChatTransactionDisputeContext _formattedBodyTextForTopicBodyText:](self, "_formattedBodyTextForTopicBodyText:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[PKPaymentTransaction formattedBalanceAdjustmentAmount](self->_transaction, "formattedBalanceAdjustmentAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBusinessChatTransactionDisputeContext _formattedTransactionDate](self, "_formattedTransactionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  familyMember = self->_familyMember;
  if (familyMember && !-[PKFamilyMember isMe](familyMember, "isMe"))
    goto LABEL_13;
  accountUser = self->_accountUser;
  if (accountUser)
  {
    -[PKAccountUser altDSID](accountUser, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrentUserAltDSID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = v12;
    if (v13 == v14)
    {

      v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v15 = v14;
    if (v13 && v14)
    {
      v16 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
LABEL_13:
    v18 = (void *)MEMORY[0x1E0D66C60];
    v19 = self->_familyMember;
    -[PKAccountUser nameComponents](self->_accountUser, "nameComponents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contactForFamilyMember:nameComponents:imageData:", v19, v20, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "givenName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_10:
  v17 = 0;
LABEL_15:
  switch(self->_intent)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      PKLocalizedFeatureStringWithDefaultValue();
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
      PKLocalizedFeatureStringWithDefaultValue();
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_19:
      v5 = (void *)v21;
      break;
    default:
      v5 = 0;
      break;
  }

LABEL_21:
  return v5;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)_formattedBodyTextForTopicBodyText:(id)a3
{
  PKPaymentTransaction *transaction;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  transaction = self->_transaction;
  v5 = a3;
  -[PKPaymentTransaction merchant](transaction, "merchant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBusinessChatTransactionDisputeContext _replacePlaceholder:withValue:inBodyText:](self, "_replacePlaceholder:withValue:inBodyText:", CFSTR("{merchantName}"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKBusinessChatTransactionDisputeContext _formattedTransactionDate](self, "_formattedTransactionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBusinessChatTransactionDisputeContext _replacePlaceholder:withValue:inBodyText:](self, "_replacePlaceholder:withValue:inBodyText:", CFSTR("{transactionDate}"), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransaction formattedBalanceAdjustmentAmount](self->_transaction, "formattedBalanceAdjustmentAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBusinessChatTransactionDisputeContext _replacePlaceholder:withValue:inBodyText:](self, "_replacePlaceholder:withValue:inBodyText:", CFSTR("{transactionAmount}"), v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_replacePlaceholder:(id)a3 withValue:(id)a4 inBodyText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if ((objc_msgSend(v9, "containsString:", v7) & 1) == 0)
    {
      v11 = v10;
      goto LABEL_7;
    }
    if (v8)
    {
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", v7, v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = v11;
      goto LABEL_8;
    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (id)_formattedTransactionDate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateStyle:", 3);
  objc_msgSend(v3, "setTimeStyle:", 1);
  -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
