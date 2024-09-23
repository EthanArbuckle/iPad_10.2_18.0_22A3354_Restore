@implementation PKBusinessChatAccountStateContext

- (PKBusinessChatAccountStateContext)initWithAccount:(id)a3 paymentPass:(id)a4 eligibleForRecoveryPaymentPlan:(BOOL)a5
{
  id v9;
  id v10;
  PKBusinessChatAccountStateContext *v11;
  PKBusinessChatAccountStateContext *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKBusinessChatAccountStateContext;
  v11 = -[PKBusinessChatAccountStateContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    objc_storeStrong((id *)&v12->_paymentPass, a4);
    v12->_eligibleForRecoveryPaymentPlan = a5;
  }

  return v12;
}

- (id)businessIdentifier
{
  return (id)-[PKPaymentPass businessChatIdentifier](self->_paymentPass, "businessChatIdentifier");
}

- (id)intentParameters
{
  const __CFString *v3;
  id v4;
  void *v5;
  void *v6;

  switch(-[PKAccount state](self->_account, "state"))
  {
    case 0:
      v3 = CFSTR("wallet_account_unknown");
      break;
    case 1:
      v3 = CFSTR("wallet_account_active");
      break;
    case 2:
      if (-[PKAccount stateReason](self->_account, "stateReason") == 1 && self->_eligibleForRecoveryPaymentPlan)
        v3 = CFSTR("wallet_account_delinquent");
      else
        v3 = CFSTR("wallet_account_restricted");
      break;
    case 3:
      v3 = CFSTR("wallet_account_locked");
      break;
    case 4:
      if (-[PKAccount stateReason](self->_account, "stateReason") == 8 && self->_eligibleForRecoveryPaymentPlan)
        v3 = CFSTR("wallet_account_chargedoff");
      else
        v3 = CFSTR("wallet_account_closed");
      break;
    default:
      v3 = 0;
      break;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("targetDialog"));
  -[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_paymentPass, "associatedAccountServiceAccountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("accountID"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (id)groupParameters
{
  const __CFString *v3;
  id v4;
  void *v5;

  switch(-[PKAccount state](self->_account, "state"))
  {
    case 0:
      v3 = CFSTR("wallet::account::unknown");
      break;
    case 1:
      v3 = CFSTR("wallet::account::active");
      break;
    case 2:
      if (-[PKAccount stateReason](self->_account, "stateReason") == 1 && self->_eligibleForRecoveryPaymentPlan)
        v3 = CFSTR("wallet::account::delinquent");
      else
        v3 = CFSTR("wallet::account::restricted");
      break;
    case 3:
      v3 = CFSTR("wallet::account::locked");
      break;
    case 4:
      if (-[PKAccount stateReason](self->_account, "stateReason") == 8 && self->_eligibleForRecoveryPaymentPlan)
        v3 = CFSTR("wallet::account::chargedoff");
      else
        v3 = CFSTR("wallet::account::closed");
      break;
    default:
      v3 = 0;
      break;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("apple_pay"), CFSTR("domain"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Wallet"), CFSTR("origin"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("page"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  uint64_t v3;
  void *v4;

  v3 = -[PKAccount state](self->_account, "state");
  if (v3 == 4)
  {
    if (-[PKAccount stateReason](self->_account, "stateReason") == 8 && self->_eligibleForRecoveryPaymentPlan)
      goto LABEL_7;
LABEL_8:
    PKLocalizedFeatureStringWithDefaultValue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (v3 != 2 || !self->_eligibleForRecoveryPaymentPlan)
    goto LABEL_8;
LABEL_7:
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
