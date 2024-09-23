@implementation PKTransactionHistoryHeaderItem

- (PKTransactionHistoryHeaderItem)initWithType:(unint64_t)a3
{
  PKTransactionHistoryHeaderItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryHeaderItem;
  result = -[PKTransactionHistoryHeaderItem init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

+ (id)identifier
{
  return CFSTR("header");
}

- (unint64_t)type
{
  return self->_type;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (BOOL)showDetailedPropertyLocation
{
  return self->_showDetailedPropertyLocation;
}

- (void)setShowDetailedPropertyLocation:(BOOL)a3
{
  self->_showDetailedPropertyLocation = a3;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void)setPeerPaymentCounterpartHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (PKPaymentTransactionGroup)transactionGroup
{
  return self->_transactionGroup;
}

- (void)setTransactionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transactionGroup, a3);
}

- (unint64_t)historyCount
{
  return self->_historyCount;
}

- (void)setHistoryCount:(unint64_t)a3
{
  self->_historyCount = a3;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

- (PKCreditInstallmentPlanProduct)installmentProduct
{
  return self->_installmentProduct;
}

- (void)setInstallmentProduct:(id)a3
{
  objc_storeStrong((id *)&self->_installmentProduct, a3);
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentProduct, 0);
  objc_storeStrong((id *)&self->_transactionGroup, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
}

@end
