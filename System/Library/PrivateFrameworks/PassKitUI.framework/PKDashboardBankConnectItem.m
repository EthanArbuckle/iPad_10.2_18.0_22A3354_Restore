@implementation PKDashboardBankConnectItem

+ (id)fromAccount:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_accountType);
  if (v4 == (id)1)
  {
    v5 = sub_19D82FC2C(v3);
  }
  else
  {
    if (v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = sub_19D82F58C(v3);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

+ (id)dashboardBankConnectDebitCardItemFrom:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_19D82F58C(v3);

  return v4;
}

+ (id)transferActionFor:(id)a3
{
  return sub_19D82E890((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_19D82F370, (uint64_t)&block_descriptor_6_13);
}

+ (id)dashboardBankConnectCreditCardItemFrom:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_19D82FC2C(v3);

  return v4;
}

+ (id)payBillActionFor:(id)a3
{
  return sub_19D82E890((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_19D82FA10, (uint64_t)&block_descriptor_154);
}

+ (NSDateFormatter)nextPaymentDateFormatter
{
  return (NSDateFormatter *)sub_19D82F8A8();
}

+ (id)formatAvailableBalance:(id)a3 for:(unint64_t)a4
{
  return sub_19D82E950((uint64_t)a1, (uint64_t)a2, a3, a4, sub_19D82E9C4);
}

+ (id)formatBookedBalance:(id)a3 for:(unint64_t)a4
{
  return sub_19D82E950((uint64_t)a1, (uint64_t)a2, a3, a4, sub_19D82EE9C);
}

+ (id)identifier
{
  return CFSTR("bankConnectItem");
}

- (NSString)balanceTitle
{
  unint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[PKDashboardBankConnectItem accountType](self, "accountType");
  if (v3 == 1)
  {
LABEL_7:
    -[PKDashboardBankConnectItem bookedBalance](self, "bookedBalance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v5 = CFSTR("BANK_CONNECT_DASHBOARD_LIABILITY_ACCOUNT_BOOKED_BALANCE_TITLE");
      goto LABEL_12;
    }
    -[PKDashboardBankConnectItem availableBalance](self, "availableBalance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = CFSTR("BANK_CONNECT_DASHBOARD_LIABILITY_ACCOUNT_AVAILABLE_CREDIT_TITLE");
      goto LABEL_12;
    }
LABEL_11:
    v5 = CFSTR("BANK_CONNECT_DASHBOARD_UNAVAILABLE_BALANCE_TITLE");
    goto LABEL_12;
  }
  if (v3)
    goto LABEL_11;
  -[PKDashboardBankConnectItem availableBalance](self, "availableBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PKDashboardBankConnectItem bookedBalance](self, "bookedBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v5 = CFSTR("BANK_CONNECT_DASHBOARD_ASSET_ACCOUNT_BOOKED_BALANCE_TITLE");
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  v5 = CFSTR("BANK_CONNECT_DASHBOARD_ASSET_ACCOUNT_AVAILABLE_BALANCE_TITLE");
LABEL_12:
  PKLocalizedBankConnectString(&v5->isa);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)displayedBalance
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = -[PKDashboardBankConnectItem accountType](self, "accountType");
  if (v3 != 1)
  {
    if (v3)
    {
LABEL_9:
      PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_DASHBOARD_UNAVAILABLE_BALANCE"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      return (NSString *)v6;
    }
    -[PKDashboardBankConnectItem availableBalance](self, "availableBalance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[PKDashboardBankConnectItem bookedBalance](self, "bookedBalance");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_6:
    v6 = v4;

    return (NSString *)v6;
  }
  -[PKDashboardBankConnectItem bookedBalance](self, "bookedBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_6;
  -[PKDashboardBankConnectItem availableBalance](self, "availableBalance");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v6 = (id)v5;
  if (!v5)
    goto LABEL_9;
  return (NSString *)v6;
}

- (NSString)balanceSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PKDashboardBankConnectItem accountType](self, "accountType")
    && (-[PKDashboardBankConnectItem bookedBalance](self, "bookedBalance"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v4 = (void *)v3,
        -[PKDashboardBankConnectItem availableBalance](self, "availableBalance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[PKDashboardBankConnectItem availableBalance](self, "availableBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_DASHBOARD_LIABILITY_ACCOUNT_AVAILABLE_BALANCE_SUBTITLE"), CFSTR("%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (unint64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(unint64_t)a3
{
  self->_accountType = a3;
}

- (id)transferAction
{
  return self->_transferAction;
}

- (void)setTransferAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)payBillAction
{
  return self->_payBillAction;
}

- (void)setPayBillAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)availableBalance
{
  return self->_availableBalance;
}

- (void)setAvailableBalance:(id)a3
{
  objc_storeStrong((id *)&self->_availableBalance, a3);
}

- (NSString)bookedBalance
{
  return self->_bookedBalance;
}

- (void)setBookedBalance:(id)a3
{
  objc_storeStrong((id *)&self->_bookedBalance, a3);
}

- (NSString)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
  objc_storeStrong((id *)&self->_creditLimit, a3);
}

- (NSString)paymentDueDate
{
  return self->_paymentDueDate;
}

- (void)setPaymentDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDueDate, a3);
}

- (NSString)minimumCreditPayment
{
  return self->_minimumCreditPayment;
}

- (void)setMinimumCreditPayment:(id)a3
{
  objc_storeStrong((id *)&self->_minimumCreditPayment, a3);
}

- (NSDate)asOfDate
{
  return self->_asOfDate;
}

- (void)setAsOfDate:(id)a3
{
  objc_storeStrong((id *)&self->_asOfDate, a3);
}

- (BOOL)isPaymentOverdue
{
  return self->_isPaymentOverdue;
}

- (void)setIsPaymentOverdue:(BOOL)a3
{
  self->_isPaymentOverdue = a3;
}

- (BOOL)isAccountEnabled
{
  return self->_isAccountEnabled;
}

- (void)setIsAccountEnabled:(BOOL)a3
{
  self->_isAccountEnabled = a3;
}

- (BOOL)isAccountMismatched
{
  return self->_isAccountMismatched;
}

- (void)setIsAccountMismatched:(BOOL)a3
{
  self->_isAccountMismatched = a3;
}

- (BOOL)hasMultipleBalances
{
  return self->_hasMultipleBalances;
}

- (void)setHasMultipleBalances:(BOOL)a3
{
  self->_hasMultipleBalances = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asOfDate, 0);
  objc_storeStrong((id *)&self->_minimumCreditPayment, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_bookedBalance, 0);
  objc_storeStrong((id *)&self->_availableBalance, 0);
  objc_storeStrong(&self->_payBillAction, 0);
  objc_storeStrong(&self->_transferAction, 0);
}

@end
