@implementation PKPayLaterBusinessChatTopic

- (PKPayLaterBusinessChatTopic)initWithContext:(unint64_t)a3 topicType:(unint64_t)a4
{
  PKPayLaterBusinessChatTopic *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterBusinessChatTopic;
  result = -[PKPayLaterBusinessChatTopic init](&v7, sel_init);
  if (result)
  {
    result->_topicType = a4;
    if (a4)
      result->_requiresFinancingPlan = a3 == 1;
  }
  return result;
}

- (PKPayLaterBusinessChatTopic)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterBusinessChatTopic *v5;
  uint64_t v6;
  NSString *displayText;
  uint64_t v8;
  NSString *page;
  uint64_t v10;
  NSString *targetDialog;
  uint64_t v12;
  NSString *analyticsIdentifier;
  uint64_t v14;
  NSString *messageBubbleText;
  uint64_t v16;
  NSString *serverDefinedContentRequestType;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSSet *relevantFinancingPlanStates;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKPayLaterBusinessChatTopic initWithContext:topicType:](self, "initWithContext:topicType:", 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("displayText"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatPage"));
    v8 = objc_claimAutoreleasedReturnValue();
    page = v5->_page;
    v5->_page = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("buesinessChatTargetDialog"));
    v10 = objc_claimAutoreleasedReturnValue();
    targetDialog = v5->_targetDialog;
    v5->_targetDialog = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("analyticsIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("messageBubbleText"));
    v14 = objc_claimAutoreleasedReturnValue();
    messageBubbleText = v5->_messageBubbleText;
    v5->_messageBubbleText = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("contentRequestType"));
    v16 = objc_claimAutoreleasedReturnValue();
    serverDefinedContentRequestType = v5->_serverDefinedContentRequestType;
    v5->_serverDefinedContentRequestType = (NSString *)v16;

    v5->_requiresFinancingPlan = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresFinancingPlan"));
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("relevantFinancingPlanStates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = PKPayLaterFinancingPlanStateFromString(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v24));
          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25, (_QWORD)v30);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v26);

          }
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v19, "count"))
    {
      v27 = objc_msgSend(v19, "copy");
      relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
      v5->_relevantFinancingPlanStates = (NSSet *)v27;
    }
    else
    {
      relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
      v5->_relevantFinancingPlanStates = 0;
    }

  }
  return v5;
}

- (NSString)displayText
{
  unint64_t topicType;
  __CFString *v4;
  __CFString *v6;

  topicType = self->_topicType;
  v4 = &stru_1E2ADF4C0;
  switch(topicType)
  {
    case 0uLL:
      return self->_displayText;
    case 1uLL:
      v6 = CFSTR("DISPUTE_TOPIC_CANCELLATION_ISSUE");
      goto LABEL_14;
    case 2uLL:
      v6 = CFSTR("DISPUTE_TOPIC_CANCELLED");
      goto LABEL_14;
    case 3uLL:
      v6 = CFSTR("DISPUTE_TOPIC_CHARGED_OFF");
      goto LABEL_14;
    case 4uLL:
      v6 = CFSTR("DISPUTE_TOPIC_REFUND_NOT_SHOWN");
      goto LABEL_14;
    case 5uLL:
      v6 = CFSTR("DISPUTE_TOPIC_MERCHANT_ISSUE");
      goto LABEL_14;
    case 6uLL:
      v6 = CFSTR("DISPUTE_TOPIC_DELIVERY_ISSUE");
      goto LABEL_14;
    case 7uLL:
      v6 = CFSTR("DISPUTE_TOPIC_LOAN_AMOUNT_ISSUE");
      goto LABEL_14;
    case 8uLL:
      v6 = CFSTR("DISPUTE_TOPIC_PURHCASE_NOT_AUTHORIZED");
      goto LABEL_14;
    case 9uLL:
      v6 = CFSTR("DISPUTE_TOPIC_LOAN_PENDING");
      goto LABEL_14;
    case 0xAuLL:
      v6 = CFSTR("DISPUTE_TOPIC_PAYMENT_ISSUE");
      goto LABEL_14;
    case 0x11uLL:
      v6 = CFSTR("DISPUTE_TOPIC_OTHER");
LABEL_14:
      PKLocalizedCocoonString(&v6->isa, 0);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (NSString *)v4;
  }
  return (NSString *)v4;
}

- (NSString)page
{
  unint64_t topicType;
  __CFString *v4;
  NSString *result;

  topicType = self->_topicType;
  v4 = CFSTR("wallet::loan::cancellationissue");
  switch(topicType)
  {
    case 0uLL:
      result = self->_page;
      break;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      result = CFSTR("wallet::loan::cancelled");
      break;
    case 3uLL:
      result = CFSTR("wallet::loan::chargedOff");
      break;
    case 4uLL:
      result = CFSTR("wallet::loan::refundissue");
      break;
    case 5uLL:
      result = CFSTR("wallet::loan::merchantissue");
      break;
    case 6uLL:
      result = CFSTR("wallet::loan::deliveryissue");
      break;
    case 7uLL:
      result = CFSTR("wallet::loan::loanamountissue");
      break;
    case 8uLL:
      result = CFSTR("wallet::loan::purchasenotauthorized");
      break;
    case 9uLL:
      result = CFSTR("wallet::loan::loanpending");
      break;
    case 0xAuLL:
      result = CFSTR("wallet::payment::paymentissue");
      break;
    case 0xBuLL:
      result = CFSTR("wallet::loan::disputeevidenceemail");
      break;
    case 0xCuLL:
      result = CFSTR("wallet::loan::restricted");
      break;
    case 0xDuLL:
      result = CFSTR("wallet::loan::unusualactivity");
      break;
    case 0xEuLL:
      result = CFSTR("wallet::loan::locked");
      break;
    case 0xFuLL:
      result = CFSTR("wallet::loan::lockedbankruptcy");
      break;
    case 0x10uLL:
      result = CFSTR("wallet::loan::oustandingcredit");
      break;
    case 0x11uLL:
      v4 = CFSTR("wallet::loanorpayment::other");
LABEL_20:
      result = v4;
      break;
    default:
      result = &stru_1E2ADF4C0;
      break;
  }
  return result;
}

- (NSString)targetDialog
{
  unint64_t topicType;
  __CFString *v4;
  NSString *result;

  topicType = self->_topicType;
  v4 = CFSTR("wallet_loan_cancellationissue");
  switch(topicType)
  {
    case 0uLL:
      result = self->_targetDialog;
      break;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      result = CFSTR("wallet_loan_cancelled");
      break;
    case 3uLL:
      result = CFSTR("wallet_loan_chargedoff");
      break;
    case 4uLL:
      result = CFSTR("wallet_loan_refundissue");
      break;
    case 5uLL:
      result = CFSTR("wallet_loan_merchantissue");
      break;
    case 6uLL:
      result = CFSTR("wallet_loan_deliveryissue");
      break;
    case 7uLL:
      result = CFSTR("wallet_loan_loanamountissue");
      break;
    case 8uLL:
      result = CFSTR("wallet_loan_purchasenotauthorized");
      break;
    case 9uLL:
      result = CFSTR("wallet_loan_loanpending");
      break;
    case 0xAuLL:
      result = CFSTR("wallet_payment_paymentissue");
      break;
    case 0xBuLL:
      result = CFSTR("wallet_loan_disputeevidenceemail");
      break;
    case 0xCuLL:
      result = CFSTR("wallet_loan_restricted");
      break;
    case 0xDuLL:
      result = CFSTR("wallet_loan_unusualactivity");
      break;
    case 0xEuLL:
      result = CFSTR("wallet_loan_locked");
      break;
    case 0xFuLL:
      result = CFSTR("wallet_loan_lockedbankruptcy");
      break;
    case 0x10uLL:
      result = CFSTR("wallet_loan_outstandingcredit");
      break;
    case 0x11uLL:
      v4 = CFSTR("wallet_loanorpayment_other");
LABEL_20:
      result = v4;
      break;
    default:
      result = &stru_1E2ADF4C0;
      break;
  }
  return result;
}

- (NSString)analyticsIdentifier
{
  unint64_t topicType;
  __CFString *v4;
  NSString *result;

  topicType = self->_topicType;
  v4 = CFSTR("cancellationIssue");
  switch(topicType)
  {
    case 0uLL:
      result = self->_analyticsIdentifier;
      break;
    case 1uLL:
      goto LABEL_18;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      result = CFSTR("refundNotShown");
      break;
    case 5uLL:
      result = CFSTR("merchantIssue");
      break;
    case 6uLL:
      result = CFSTR("deliveryIssue");
      break;
    case 7uLL:
      result = CFSTR("loanAmountIssue");
      break;
    case 8uLL:
      result = CFSTR("purchaseNotAuthorized");
      break;
    case 9uLL:
      result = CFSTR("loanPending");
      break;
    case 0xAuLL:
      result = CFSTR("paymentIssue");
      break;
    case 0xBuLL:
      result = CFSTR("disputeEvidenceEmail");
      break;
    case 0xCuLL:
      result = CFSTR("accountRestricted");
      break;
    case 0xDuLL:
      result = CFSTR("unusualActivityDetected");
      break;
    case 0xEuLL:
      result = CFSTR("accountLocked");
      break;
    case 0xFuLL:
      result = CFSTR("accountLockedBankruptcy");
      break;
    case 0x10uLL:
      result = CFSTR("outstandingCredit");
      break;
    case 0x11uLL:
      v4 = CFSTR("other");
LABEL_18:
      result = v4;
      break;
    default:
      result = CFSTR("unknown");
      break;
  }
  return result;
}

- (NSSet)relevantFinancingPlanStates
{
  NSSet *v3;
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = 0;
  switch(self->_topicType)
  {
    case 0uLL:
      v3 = self->_relevantFinancingPlanStates;
      return v3;
    case 1uLL:
    case 8uLL:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v7 = &unk_1E2C3ED28;
      v8 = 0;
      v6 = &unk_1E2C3ED10;
      goto LABEL_4;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      v4 = (void *)MEMORY[0x1E0C99E60];
      v6 = &unk_1E2C3ED40;
      v7 = 0;
LABEL_4:
      objc_msgSend(v4, "setWithObjects:", &unk_1E2C3ECF8, v6, v7, v8);
      goto LABEL_5;
    case 9uLL:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2C3ED10, &unk_1E2C3ED28, 0, v8);
LABEL_5:
      v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (NSString)payLaterContentRequestTypeString
{
  NSString *v2;
  unint64_t topicType;
  uint64_t v5;
  NSString *v6;

  v2 = 0;
  topicType = self->_topicType;
  v5 = 2;
  switch(topicType)
  {
    case 0uLL:
      v6 = self->_serverDefinedContentRequestType;
      goto LABEL_12;
    case 1uLL:
      goto LABEL_11;
    case 4uLL:
      v5 = 3;
      goto LABEL_11;
    case 5uLL:
      v5 = 4;
      goto LABEL_11;
    case 6uLL:
      v5 = 5;
      goto LABEL_11;
    case 7uLL:
      v5 = 6;
      goto LABEL_11;
    case 8uLL:
      v5 = 7;
      goto LABEL_11;
    case 9uLL:
      v5 = 8;
      goto LABEL_11;
    case 0xAuLL:
      v5 = 9;
      goto LABEL_11;
    case 0x11uLL:
      v5 = 10;
LABEL_11:
      PKAccountWebServicePayLaterContentRequestTypeToString(v5);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v2 = v6;
      break;
    default:
      return v2;
  }
  return v2;
}

- (id)messagesBubbleTextWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5 dispute:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "merchant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "planSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "totalAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "amount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ECF22460 != -1)
    dispatch_once(&qword_1ECF22460, &__block_literal_global_74);
  objc_msgSend((id)_MergedGlobals_220, "stringFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formattedStringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "formattedStringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_topicType)
  {
    case 0uLL:
      v22 = self->_messageBubbleText;
      goto LABEL_26;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I have a cancellation issue with my loan of %@ for my purchase from %@."), v17, v11, v31);
      goto LABEL_22;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I need help with my canceled loan for my purchase from %@"), v11, v30, v31);
      goto LABEL_22;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I need help with my charged off loan for my purchase from %@."), v11, v30, v31);
      goto LABEL_22;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I made a return on my purchase from %@ but my payment schedule has not been updated."), v11, v30, v31);
      goto LABEL_22;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I have a return or cancellation issue with my loan for my purchase from %@."), v11, v30, v31);
      goto LABEL_22;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("My order, or part of my order, was never received for my purchase from %@."), v11, v30, v31);
      goto LABEL_22;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("My order from %@ was for a different amount than my loan of %@."), v11, v17, v31);
      goto LABEL_22;
    case 8uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I never made this purchase or never authorized a loan of %@ to pay for my purchase from %@."), v17, v11, v31);
      goto LABEL_22;
    case 9uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I have a question about when my loan payments for my purchase from %@ will start."), v11, v30, v31);
      goto LABEL_22;
    case 0xAuLL:
      goto LABEL_21;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please resend the email asking for additional information about my dispute for my purchase from %@."), v11, v30, v31);
      goto LABEL_22;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      v20 = CFSTR("I need help with my Apple Pay Later account.");
      goto LABEL_5;
    case 0xFuLL:
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      v20 = CFSTR("I’d like more information about my account status.");
LABEL_5:
      v21 = objc_msgSend(v19, "initWithFormat:", v20);
      goto LABEL_23;
    case 0x11uLL:
      if (v8 && v11)
      {
LABEL_21:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I need help with my loan payment of %@ made on %@ for my purchase from %@."), v18, v16, v11);
      }
      else
      {
        if (!v11)
        {
          v22 = &stru_1E2ADF4C0;
          goto LABEL_24;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("I need help with the loan for my purchase from %@."), v11, v30, v31);
      }
LABEL_22:
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v22 = (__CFString *)v21;
LABEL_24:
      if (-[__CFString length](v22, "length"))
      {
        PKLocalizedFeatureStringWithDefaultValue(CFSTR("BUSINESS_CHAT_PAT_LATER_CONTACT_SUPPORT"), 3, v22, 0, v23, v24, v25, v26, v29);
        v27 = objc_claimAutoreleasedReturnValue();

        v22 = (__CFString *)v27;
      }
LABEL_26:

      return v22;
    default:
      v22 = 0;
      goto LABEL_24;
  }
}

uint64_t __95__PKPayLaterBusinessChatTopic_messagesBubbleTextWithFinancingPlan_installment_payment_dispute___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_220;
  _MergedGlobals_220 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_220;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return objc_msgSend((id)_MergedGlobals_220, "setDateStyle:", 1);
}

- (void)updateWithBusinessChatTopic:(id)a3
{
  void *v4;
  void *v5;

  if (!self->_topicType)
  {
    objc_msgSend(a3, "messageBubbleText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_storeStrong((id *)&self->_messageBubbleText, v4);
      v4 = v5;
    }

  }
}

+ (id)genericBusinessChatTopicForContext:(unint64_t)a3
{
  return -[PKPayLaterBusinessChatTopic initWithContext:topicType:]([PKPayLaterBusinessChatTopic alloc], "initWithContext:topicType:", a3, 17);
}

- (unint64_t)topicType
{
  return self->_topicType;
}

- (BOOL)requiresFinancingPlan
{
  return self->_requiresFinancingPlan;
}

- (NSString)messageBubbleText
{
  return self->_messageBubbleText;
}

- (void)setMessageBubbleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBubbleText, 0);
  objc_storeStrong((id *)&self->_relevantFinancingPlanStates, 0);
  objc_storeStrong((id *)&self->_serverDefinedContentRequestType, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_targetDialog, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
