@implementation PKPayLaterPayment

- (PKPayLaterPayment)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterPayment *v5;
  uint64_t v6;
  NSString *paymentIdentifier;
  __CFString *v8;
  __CFString *v9;
  char v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  char v26;
  __CFString *v27;
  __CFString *v28;
  int v29;
  __CFString *v30;
  __CFString *v31;
  char v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  char v36;
  __CFString *v37;
  __CFString *v38;
  char v39;
  __CFString *v40;
  __CFString *v41;
  int v42;
  uint64_t v43;
  NSDate *postedDate;
  uint64_t v45;
  PKCurrencyAmount *amount;
  uint64_t v47;
  PKCurrencyAmount *interestPaid;
  uint64_t v49;
  PKCurrencyAmount *principalPaid;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  PKPayLaterPaymentFundingSource *v58;
  void *v59;
  void *v60;
  id v61;
  PKPayLaterPaymentFundingSource *v62;
  void *v63;
  NSObject *v64;
  NSString *v65;
  uint64_t v66;
  NSArray *fundingSources;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t buf[4];
  PKPayLaterPaymentFundingSource *v75;
  __int16 v76;
  NSString *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)PKPayLaterPayment;
  v5 = -[PKPayLaterPayment init](&v73, sel_init);
  if (!v5)
    goto LABEL_60;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  paymentIdentifier = v5->_paymentIdentifier;
  v5->_paymentIdentifier = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == CFSTR("payment"))
    goto LABEL_5;
  if (!v8)
    goto LABEL_24;
  v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("payment"));

  if ((v10 & 1) != 0)
  {
LABEL_5:
    v11 = 1;
    goto LABEL_25;
  }
  v12 = v9;
  if (v12 == CFSTR("temporaryCredit")
    || (v13 = v12,
        v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("temporaryCredit")),
        v13,
        (v14 & 1) != 0))
  {
    v11 = 2;
    goto LABEL_25;
  }
  v15 = v13;
  if (v15 == CFSTR("refund")
    || (v16 = v15,
        v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("refund")),
        v16,
        (v17 & 1) != 0))
  {
    v11 = 3;
    goto LABEL_25;
  }
  v18 = v16;
  if (v18 == CFSTR("creditRevoked")
    || (v19 = v18,
        v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("creditRevoked")),
        v19,
        (v20 & 1) != 0))
  {
    v11 = 4;
    goto LABEL_25;
  }
  v21 = v19;
  if (v21 == CFSTR("declined")
    || (v22 = v21,
        v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("declined")),
        v22,
        (v23 & 1) != 0))
  {
    v11 = 5;
    goto LABEL_25;
  }
  v24 = v22;
  if (v24 == CFSTR("refundRevoked")
    || (v25 = v24,
        v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("refundRevoked")),
        v25,
        (v26 & 1) != 0))
  {
    v11 = 6;
    goto LABEL_25;
  }
  v27 = v25;
  if (v27 == CFSTR("adjustment")
    || (v28 = v27,
        v29 = -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("adjustment")),
        v28,
        v29))
  {
    v11 = 7;
  }
  else
  {
LABEL_24:
    v11 = 0;
  }
LABEL_25:

  v5->_type = v11;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("subtype"));
  v30 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30 != CFSTR("goodwillCredit"))
  {
    if (v30)
    {
      v32 = -[__CFString isEqualToString:](v30, "isEqualToString:", CFSTR("goodwillCredit"));

      if ((v32 & 1) != 0)
        goto LABEL_28;
      v34 = v31;
      if (v34 == CFSTR("settlement")
        || (v35 = v34,
            v36 = -[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("settlement")),
            v35,
            (v36 & 1) != 0))
      {
        v33 = 2;
        goto LABEL_39;
      }
      v37 = v35;
      if (v37 == CFSTR("systemReduction")
        || (v38 = v37,
            v39 = -[__CFString isEqualToString:](v37, "isEqualToString:", CFSTR("systemReduction")),
            v38,
            (v39 & 1) != 0))
      {
        v33 = 3;
        goto LABEL_39;
      }
      v40 = v38;
      if (v40 == CFSTR("systemIncrease")
        || (v41 = v40,
            v42 = -[__CFString isEqualToString:](v40, "isEqualToString:", CFSTR("systemIncrease")),
            v41,
            v42))
      {
        v33 = 4;
        goto LABEL_39;
      }
    }
    v33 = 0;
    goto LABEL_39;
  }
LABEL_28:
  v33 = 1;
LABEL_39:

  v5->_subtype = v33;
  objc_msgSend(v4, "PKDateForKey:", CFSTR("postedDate"));
  v43 = objc_claimAutoreleasedReturnValue();
  postedDate = v5->_postedDate;
  v5->_postedDate = (NSDate *)v43;

  objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("amount"));
  v45 = objc_claimAutoreleasedReturnValue();
  amount = v5->_amount;
  v5->_amount = (PKCurrencyAmount *)v45;

  objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("interestPaid"));
  v47 = objc_claimAutoreleasedReturnValue();
  interestPaid = v5->_interestPaid;
  v5->_interestPaid = (PKCurrencyAmount *)v47;

  objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("principalPaid"));
  v49 = objc_claimAutoreleasedReturnValue();
  principalPaid = v5->_principalPaid;
  v5->_principalPaid = (PKCurrencyAmount *)v49;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedTransactionPaymentHash"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPayment setAssociatedTransactionPaymentHash:](v5, "setAssociatedTransactionPaymentHash:", v51);

  v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("fundingSources"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v70;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v70 != v56)
          objc_enumerationMutation(v53);
        v58 = -[PKPayLaterPaymentFundingSource initWithDictionary:]([PKPayLaterPaymentFundingSource alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v57));
        objc_msgSend(v52, "safelyAddObject:", v58);

        ++v57;
      }
      while (v55 != v57);
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v55);
  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("fundingSource"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "count"))
    v60 = v59;
  else
    v60 = v4;
  v61 = v60;

  v62 = -[PKPayLaterPaymentFundingSource initWithDictionary:]([PKPayLaterPaymentFundingSource alloc], "initWithDictionary:", v61);
  objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("fundingSourceRefundAmount"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
    -[PKPayLaterPaymentFundingSource setRefundAmount:](v62, "setRefundAmount:", v63);
  if (v62 && (objc_msgSend(v52, "containsObject:", v62) & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v5->_paymentIdentifier;
      *(_DWORD *)buf = 138412546;
      v75 = v62;
      v76 = 2112;
      v77 = v65;
      _os_log_impl(&dword_18FC92000, v64, OS_LOG_TYPE_DEFAULT, "Adding legacyFundingSource to fundingSources array: %@ for paymentIdentifier: %@", buf, 0x16u);
    }

    objc_msgSend(v52, "safelyAddObject:", v62);
  }
  if (objc_msgSend(v52, "count"))
  {
    v66 = objc_msgSend(v52, "copy");
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSArray *)v66;
  }
  else
  {
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = 0;
  }

LABEL_60:
  return v5;
}

- (void)setAssociatedTransactionPaymentHash:(id)a3
{
  NSString *v4;
  NSString *associatedTransactionPaymentHash;

  objc_msgSend(a3, "uppercaseString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  associatedTransactionPaymentHash = self->_associatedTransactionPaymentHash;
  self->_associatedTransactionPaymentHash = v4;

}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterPayment *v4;
  PKPayLaterPayment *v5;
  BOOL v6;

  v4 = (PKPayLaterPayment *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterPayment isEqualToPayLaterPayment:](self, "isEqualToPayLaterPayment:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterPayment:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDate *postedDate;
  NSDate *v12;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *interestPaid;
  PKCurrencyAmount *v16;
  PKCurrencyAmount *principalPaid;
  PKCurrencyAmount *v18;
  NSArray *fundingSources;
  NSArray *v20;
  NSString *associatedTransactionPaymentHash;
  void *v22;
  NSString *v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_38;
  v6 = (void *)v4[1];
  v7 = self->_paymentIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8)
    {
LABEL_40:

      goto LABEL_41;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_41;
  }
  if (self->_type != v5[2] || self->_subtype != v5[3])
    goto LABEL_38;
  postedDate = self->_postedDate;
  v12 = (NSDate *)v5[4];
  if (postedDate && v12)
  {
    if ((-[NSDate isEqual:](postedDate, "isEqual:") & 1) == 0)
      goto LABEL_38;
  }
  else if (postedDate != v12)
  {
    goto LABEL_38;
  }
  amount = self->_amount;
  v14 = (PKCurrencyAmount *)v5[5];
  if (amount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:"))
      goto LABEL_38;
  }
  else if (amount != v14)
  {
    goto LABEL_38;
  }
  interestPaid = self->_interestPaid;
  v16 = (PKCurrencyAmount *)v5[6];
  if (interestPaid && v16)
  {
    if (!-[PKCurrencyAmount isEqual:](interestPaid, "isEqual:"))
      goto LABEL_38;
  }
  else if (interestPaid != v16)
  {
    goto LABEL_38;
  }
  principalPaid = self->_principalPaid;
  v18 = (PKCurrencyAmount *)v5[7];
  if (principalPaid && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](principalPaid, "isEqual:"))
      goto LABEL_38;
  }
  else if (principalPaid != v18)
  {
    goto LABEL_38;
  }
  fundingSources = self->_fundingSources;
  v20 = (NSArray *)v5[8];
  if (fundingSources && v20)
  {
    if ((-[NSArray isEqual:](fundingSources, "isEqual:") & 1) != 0)
      goto LABEL_33;
  }
  else if (fundingSources == v20)
  {
LABEL_33:
    associatedTransactionPaymentHash = self->_associatedTransactionPaymentHash;
    v22 = (void *)v5[9];
    v7 = associatedTransactionPaymentHash;
    v23 = v22;
    if (v7 == v23)
    {
      LOBYTE(v10) = 1;
      v9 = v7;
    }
    else
    {
      v9 = v23;
      LOBYTE(v10) = 0;
      if (v7 && v23)
        LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v23);
    }
    goto LABEL_40;
  }
LABEL_38:
  LOBYTE(v10) = 0;
LABEL_41:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_postedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_interestPaid);
  objc_msgSend(v3, "safelyAddObject:", self->_principalPaid);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingSources);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedTransactionPaymentHash);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_subtype - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentIdentifier: '%@'; "), self->_paymentIdentifier);
  v4 = self->_type - 1;
  if (v4 > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD5780[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  v6 = self->_subtype - 1;
  if (v6 > 3)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD57B8[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR("subtype: '%@'; "), v7);
  -[NSDate description](self->_postedDate, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("postedDate: '%@'; "), v8);

  -[PKCurrencyAmount amount](self->_amount, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), v10);

  -[PKCurrencyAmount amount](self->_interestPaid, "amount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("interestPaid: '%@'; "), v12);

  -[PKCurrencyAmount amount](self->_principalPaid, "amount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("principalPaid: '%@'; "), v14);

  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSources: '%@'; "), self->_fundingSources);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedTransactionPaymentHash: '%@'; "),
    self->_associatedTransactionPaymentHash);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  NSDate *postedDate;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_paymentIdentifier, CFSTR("paymentIdentifier"));
  v4 = self->_type - 1;
  if (v4 > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD5780[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));
  v6 = self->_subtype - 1;
  if (v6 > 3)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD57B8[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("subtype"));
  postedDate = self->_postedDate;
  if (postedDate)
  {
    PKISO8601DateStringFromDate(postedDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("postedDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("postedDate"));
  }
  -[PKCurrencyAmount dictionaryRepresentation](self->_amount, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("amount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_interestPaid, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("interestPaid"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_principalPaid, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("principalPaid"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_associatedTransactionPaymentHash, CFSTR("associatedTransactionPaymentHash"));
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_fundingSources, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_160);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("fundingSources"));

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

uint64_t __45__PKPayLaterPayment_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPayment)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPayment *v5;
  uint64_t v6;
  NSString *paymentIdentifier;
  uint64_t v8;
  NSDate *postedDate;
  uint64_t v10;
  PKCurrencyAmount *amount;
  uint64_t v12;
  PKCurrencyAmount *interestPaid;
  uint64_t v14;
  PKCurrencyAmount *principalPaid;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *fundingSources;
  uint64_t v21;
  NSString *associatedTransactionPaymentHash;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterPayment;
  v5 = -[PKPayLaterPayment init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentIdentifier = v5->_paymentIdentifier;
    v5->_paymentIdentifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_subtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subtype"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postedDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    postedDate = v5->_postedDate;
    v5->_postedDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v10 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestPaid"));
    v12 = objc_claimAutoreleasedReturnValue();
    interestPaid = v5->_interestPaid;
    v5->_interestPaid = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("principalPaid"));
    v14 = objc_claimAutoreleasedReturnValue();
    principalPaid = v5->_principalPaid;
    v5->_principalPaid = (PKCurrencyAmount *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("fundingSources"));
    v19 = objc_claimAutoreleasedReturnValue();
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedTransactionPaymentHash"));
    v21 = objc_claimAutoreleasedReturnValue();
    associatedTransactionPaymentHash = v5->_associatedTransactionPaymentHash;
    v5->_associatedTransactionPaymentHash = (NSString *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *paymentIdentifier;
  id v5;

  paymentIdentifier = self->_paymentIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paymentIdentifier, CFSTR("paymentIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_subtype, CFSTR("subtype"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postedDate, CFSTR("postedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestPaid, CFSTR("interestPaid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_principalPaid, CFSTR("principalPaid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingSources, CFSTR("fundingSources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedTransactionPaymentHash, CFSTR("associatedTransactionPaymentHash"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterPayment *v5;
  uint64_t v6;
  NSString *paymentIdentifier;
  uint64_t v8;
  NSDate *postedDate;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *principalPaid;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *interestPaid;
  uint64_t v16;
  NSArray *fundingSources;
  uint64_t v18;
  NSString *associatedTransactionPaymentHash;

  v5 = -[PKPayLaterPayment init](+[PKPayLaterPayment allocWithZone:](PKPayLaterPayment, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_paymentIdentifier, "copyWithZone:", a3);
  paymentIdentifier = v5->_paymentIdentifier;
  v5->_paymentIdentifier = (NSString *)v6;

  v5->_type = self->_type;
  v5->_subtype = self->_subtype;
  v8 = -[NSDate copyWithZone:](self->_postedDate, "copyWithZone:", a3);
  postedDate = v5->_postedDate;
  v5->_postedDate = (NSDate *)v8;

  v10 = -[PKCurrencyAmount copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = v10;

  v12 = -[PKCurrencyAmount copyWithZone:](self->_principalPaid, "copyWithZone:", a3);
  principalPaid = v5->_principalPaid;
  v5->_principalPaid = v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_interestPaid, "copyWithZone:", a3);
  interestPaid = v5->_interestPaid;
  v5->_interestPaid = v14;

  v16 = -[NSArray copyWithZone:](self->_fundingSources, "copyWithZone:", a3);
  fundingSources = v5->_fundingSources;
  v5->_fundingSources = (NSArray *)v16;

  v18 = -[NSString copyWithZone:](self->_associatedTransactionPaymentHash, "copyWithZone:", a3);
  associatedTransactionPaymentHash = v5->_associatedTransactionPaymentHash;
  v5->_associatedTransactionPaymentHash = (NSString *)v18;

  return v5;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (NSDate)postedDate
{
  return self->_postedDate;
}

- (void)setPostedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (PKCurrencyAmount)interestPaid
{
  return self->_interestPaid;
}

- (void)setInterestPaid:(id)a3
{
  objc_storeStrong((id *)&self->_interestPaid, a3);
}

- (PKCurrencyAmount)principalPaid
{
  return self->_principalPaid;
}

- (void)setPrincipalPaid:(id)a3
{
  objc_storeStrong((id *)&self->_principalPaid, a3);
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSources, a3);
}

- (NSString)associatedTransactionPaymentHash
{
  return self->_associatedTransactionPaymentHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTransactionPaymentHash, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_principalPaid, 0);
  objc_storeStrong((id *)&self->_interestPaid, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_postedDate, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end
