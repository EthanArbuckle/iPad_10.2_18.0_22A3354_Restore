@implementation PKPeerPaymentAssociatedAccountPresentationContext

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithFAFamilyMember:(id)a3 options:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  PKPeerPaymentAssociatedAccountPresentationContext *v9;

  v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E0D66D80];
    v8 = a3;
    a3 = (id)objc_msgSend([v7 alloc], "initWithFAFamilyMember:", v8);

  }
  v9 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:options:](self, "initWithPKFamilyMember:options:", a3, v6);

  return v9;
}

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  PKPeerPaymentAssociatedAccountPresentationContext *v9;
  PKPeerPaymentAssociatedAccountPresentationContext *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentAssociatedAccountPresentationContext;
  v9 = -[PKPeerPaymentAssociatedAccountPresentationContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_member, a3);
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Creating PKPeerPaymentAssociatedAccountPresentationContext with options %@", buf, 0xCu);
    }

  }
  return v10;
}

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 transaction:(id)a4
{
  id v7;
  PKPeerPaymentAssociatedAccountPresentationContext *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:options:](self, "initWithPKFamilyMember:options:", a3, 0);
  if (v8)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Creating PKPeerPaymentAssociatedAccountPresentationContext with transaction %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)&v8->_transaction, a4);
  }

  return v8;
}

- (PKPeerPaymentAssociatedAccountPresentationContext)initWithPKFamilyMember:(id)a3 setupType:(int64_t)a4
{
  PKPeerPaymentAssociatedAccountPresentationContext *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:options:](self, "initWithPKFamilyMember:options:", a3, 0);
  if (v5)
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentAssociatedAccountSetupTypeToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Creating PKPeerPaymentAssociatedAccountPresentationContext with setupType %@", (uint8_t *)&v9, 0xCu);

    }
    v5->_setupType = a4;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("familyMember: '%@'; "), self->_member);
  if (self->_transaction)
    objc_msgSend(v3, "appendFormat:", CFSTR("transaction: '%@'; "), self->_transaction);
  PKPeerPaymentAssociatedAccountSetupTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("setupType: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (PKFamilyMember)member
{
  return self->_member;
}

- (void)setMember:(id)a3
{
  objc_storeStrong((id *)&self->_member, a3);
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (int64_t)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(int64_t)a3
{
  self->_setupType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_member, 0);
}

@end
