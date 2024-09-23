@implementation PKAccountSupportTopic

- (PKAccountSupportTopic)initWithDictionary:(id)a3
{
  id v4;
  PKAccountSupportTopic *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *bodyText;
  uint64_t v10;
  NSString *businessChatPage;
  uint64_t v12;
  NSString *businessChatTargetDialog;
  void *v14;
  id v15;
  uint64_t v16;
  PKAccountSupportTopicExplanation *v17;
  PKAccountSupportTopicExplanation *explanation;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountSupportTopic;
  v5 = -[PKAccountSupportTopic init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("bodyText"));
    v8 = objc_claimAutoreleasedReturnValue();
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("page"));
    v10 = objc_claimAutoreleasedReturnValue();
    businessChatPage = v5->_businessChatPage;
    v5->_businessChatPage = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("targetDialogue"));
    v12 = objc_claimAutoreleasedReturnValue();
    businessChatTargetDialog = v5->_businessChatTargetDialog;
    v5->_businessChatTargetDialog = (NSString *)v12;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("explanation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("issueType"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("dispute")) & 1) != 0)
    {
      v16 = 2;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("fraud")) & 1) != 0)
    {
      v16 = 3;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("mapsFeedback")))
    {
      v16 = 4;
    }
    else
    {
      v16 = 0;
    }

    v5->_issueType = v16;
    if (v14)
    {
      v17 = -[PKAccountSupportTopicExplanation initWithDictionary:]([PKAccountSupportTopicExplanation alloc], "initWithDictionary:", v14);
      explanation = v5->_explanation;
      v5->_explanation = v17;

    }
  }

  return v5;
}

- (PKAccountSupportTopic)initWithOtherTopicForAccount:(id)a3
{
  uint64_t v4;
  PKAccountSupportTopic *v5;
  NSString *v6;
  NSString *businessChatTargetDialog;
  __CFString *v8;
  PKAccountSupportTopic *v9;
  NSString *businessChatPage;
  objc_super v12;
  objc_super v13;

  v4 = objc_msgSend(a3, "type");
  if (v4 == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)PKAccountSupportTopic;
    v9 = -[PKAccountSupportTopic init](&v12, sel_init);
    self = v9;
    if (v9)
    {
      businessChatPage = v9->_businessChatPage;
      v9->_businessChatPage = (NSString *)CFSTR("wallet::transaction::generalcontact");

      businessChatTargetDialog = self->_businessChatTargetDialog;
      v8 = CFSTR("wallet_transaction_generalcontact");
      goto LABEL_7;
    }
  }
  else if (v4 == 4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PKAccountSupportTopic;
    v5 = -[PKAccountSupportTopic init](&v13, sel_init);
    self = v5;
    if (v5)
    {
      v6 = v5->_businessChatPage;
      v5->_businessChatPage = (NSString *)CFSTR("wallet::savings::other");

      businessChatTargetDialog = self->_businessChatTargetDialog;
      v8 = CFSTR("wallet_savings_other");
LABEL_7:
      self->_businessChatTargetDialog = &v8->isa;

    }
  }
  return self;
}

- (PKAccountSupportTopic)initWithUnavailableFundingSourceTopicForAccount:(id)a3
{
  PKAccountSupportTopic *v4;
  PKAccountSupportTopic *v5;
  NSString *businessChatPage;
  NSString *businessChatTargetDialog;
  PKAccountSupportTopic *v8;
  objc_super v10;

  if (objc_msgSend(a3, "type") == 4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKAccountSupportTopic;
    v4 = -[PKAccountSupportTopic init](&v10, sel_init);
    v5 = v4;
    if (v4)
    {
      businessChatPage = v4->_businessChatPage;
      v4->_businessChatPage = (NSString *)CFSTR("wallet::savings::unavailablefundingsource");

      businessChatTargetDialog = v5->_businessChatTargetDialog;
      v5->_businessChatTargetDialog = (NSString *)CFSTR("wallet_savings_unavailablefundingsource");

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKAccountSupportTopic)initWithBeneficiaryTopicForAccount:(id)a3
{
  PKAccountSupportTopic *v4;
  PKAccountSupportTopic *v5;
  NSString *businessChatPage;
  NSString *businessChatTargetDialog;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString *bodyText;
  PKAccountSupportTopic *v15;
  objc_super v17;

  if (objc_msgSend(a3, "type") == 4)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKAccountSupportTopic;
    v4 = -[PKAccountSupportTopic init](&v17, sel_init);
    v5 = v4;
    if (v4)
    {
      businessChatPage = v4->_businessChatPage;
      v4->_businessChatPage = (NSString *)CFSTR("wallet::savings::beneficiary");

      businessChatTargetDialog = v5->_businessChatTargetDialog;
      v5->_businessChatTargetDialog = (NSString *)CFSTR("wallet_savings_beneficiary");

      PKLocalizedFeatureString(CFSTR("ADD_BENEFICIARY_MESSAGE_BODY"), 5, 0, v8, v9, v10, v11, v12, (uint64_t)v17.receiver);
      v13 = objc_claimAutoreleasedReturnValue();
      bodyText = v5->_bodyText;
      v5->_bodyText = (NSString *)v13;

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)supportsBusinessChat
{
  return self->_businessChatPage
      && self->_businessChatTargetDialog
      && -[PKAccountSupportTopic issueType](self, "issueType") != 4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)businessChatTargetDialog
{
  return self->_businessChatTargetDialog;
}

- (NSString)businessChatPage
{
  return self->_businessChatPage;
}

- (unint64_t)issueType
{
  return self->_issueType;
}

- (PKAccountSupportTopicExplanation)explanation
{
  return self->_explanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_businessChatPage, 0);
  objc_storeStrong((id *)&self->_businessChatTargetDialog, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
