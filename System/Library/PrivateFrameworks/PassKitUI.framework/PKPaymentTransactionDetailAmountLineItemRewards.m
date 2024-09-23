@implementation PKPaymentTransactionDetailAmountLineItemRewards

- (PKPaymentTransactionDetailAmountLineItemRewards)initWithRewardsValueUnit:(unint64_t)a3 eligibleValue:(id)a4 isEligible:(BOOL)a5 totalAmount:(id)a6 hasPromotionalReward:(BOOL)a7 promotionName:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  PKPaymentTransactionDetailAmountLineItemRewards *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  NSString *label;
  NSString *v24;
  NSString *value;
  id v27;
  objc_super v28;

  v10 = a5;
  v13 = a4;
  v14 = a6;
  v15 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentTransactionDetailAmountLineItemRewards;
  v16 = -[PKPaymentTransactionDetailAmountLineItemRewards init](&v28, sel_init);
  if (v16)
  {
    if (a3 && a3 != 2)
    {
      if (a3 != 1)
      {
        v22 = 0;
        goto LABEL_20;
      }
      PKRewardsCenterEnabled();
      PKFormattedStringMinimalFractionDigitsFromNumber();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        PKLocalizedFeatureString();
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        v21 = 0;
        goto LABEL_21;
      }
      v27 = v17;
      PKLocalizedFeatureString();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      objc_msgSend(v14, "formattedStringValue", v27);
      v21 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      label = v16->_label;
      v16->_label = v22;
      v24 = v22;

      value = v16->_value;
      v16->_value = (NSString *)v21;

      goto LABEL_22;
    }
    v18 = PKRewardsCenterEnabled();
    if (v15)
      v19 = v18;
    else
      v19 = 0;
    if (v10)
    {
      if (v19)
        goto LABEL_14;
    }
    else if (v19)
    {
LABEL_14:
      v27 = v15;
      PKLocalizedFeatureString();
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v22 = (NSString *)v20;
      goto LABEL_18;
    }
    PKLocalizedFeatureString();
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_22:

  return v16;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEmphasized
{
  return 0;
}

- (unint64_t)lineItemType
{
  return 4;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
