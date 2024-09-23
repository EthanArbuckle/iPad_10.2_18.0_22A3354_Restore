@implementation PKBusinessChatPayLaterContext

- (PKBusinessChatPayLaterContext)initWithPayLaterAccount:(id)a3 paymentPass:(id)a4 topic:(id)a5 financingPlan:(id)a6 installment:(id)a7 payment:(id)a8 dispute:(id)a9
{
  id v16;
  id v17;
  PKBusinessChatPayLaterContext *v18;
  PKBusinessChatPayLaterContext *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PKBusinessChatPayLaterContext;
  v18 = -[PKBusinessChatPayLaterContext init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_payLaterAccount, a3);
    objc_storeStrong((id *)&v19->_paymentPass, a4);
    objc_storeStrong((id *)&v19->_topic, a5);
    objc_storeStrong((id *)&v19->_financingPlan, a6);
    objc_storeStrong((id *)&v19->_installment, a7);
    objc_storeStrong((id *)&v19->_payment, a8);
    objc_storeStrong((id *)&v19->_dispute, a9);
  }

  return v19;
}

- (id)businessIdentifier
{
  return (id)-[PKPaymentPass businessChatIdentifier](self->_paymentPass, "businessChatIdentifier");
}

- (id)intentParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPayLaterBusinessChatTopic targetDialog](self->_topic, "targetDialog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("targetDialog"));

  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("loanID"));

  -[PKPayLaterPayment paymentIdentifier](self->_payment, "paymentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("loanActivityItemID"));
  }
  else
  {
    -[PKPayLaterInstallment installmentIdentifier](self->_installment, "installmentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("loanActivityItemID"));
    }
    else
    {
      -[PKPayLaterFinancingPlanDispute identifier](self->_dispute, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("loanActivityItemID"));

    }
  }

  -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("transactionMerchantName"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
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
  v6[0] = CFSTR("FPP");
  v6[1] = CFSTR("Wallet");
  v5[2] = CFSTR("page");
  -[PKPayLaterBusinessChatTopic page](self->_topic, "page");
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
  return (id)-[PKPayLaterBusinessChatTopic messagesBubbleTextWithFinancingPlan:installment:payment:dispute:](self->_topic, "messagesBubbleTextWithFinancingPlan:installment:payment:dispute:", self->_financingPlan, self->_installment, self->_payment, self->_dispute);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispute, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
}

@end
