@implementation PKSearchResults

- (void)encodeWithCoder:(id)a3
{
  NSArray *suggestedAutocompleteTokens;
  id v5;

  suggestedAutocompleteTokens = self->_suggestedAutocompleteTokens;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestedAutocompleteTokens, CFSTR("suggestedAutocompleteTokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryResults, CFSTR("categoryResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantResults, CFSTR("merchantResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionResults, CFSTR("transactionResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationResults, CFSTR("locationResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personResults, CFSTR("personResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_barcodePassResults, CFSTR("barcodePassResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentPassResults, CFSTR("paymentPassResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionTagResults, CFSTR("transactionTagResults"));

}

- (PKSearchResults)initWithCoder:(id)a3
{
  id v4;
  PKSearchResults *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *suggestedAutocompleteTokens;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *categoryResults;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *merchantResults;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *transactionResults;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *locationResults;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *personResults;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *transactionTagResults;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSArray *barcodePassResults;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSArray *paymentPassResults;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKSearchResults;
  v5 = -[PKSearchResults init](&v61, sel_init);
  if (v5)
  {
    v60 = (void *)MEMORY[0x1E0C99E60];
    v59 = objc_opt_class();
    v58 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v59, v58, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("suggestedAutocompleteTokens"));
    v15 = objc_claimAutoreleasedReturnValue();
    suggestedAutocompleteTokens = v5->_suggestedAutocompleteTokens;
    v5->_suggestedAutocompleteTokens = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("categoryResults"));
    v20 = objc_claimAutoreleasedReturnValue();
    categoryResults = v5->_categoryResults;
    v5->_categoryResults = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("merchantResults"));
    v25 = objc_claimAutoreleasedReturnValue();
    merchantResults = v5->_merchantResults;
    v5->_merchantResults = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("transactionResults"));
    v30 = objc_claimAutoreleasedReturnValue();
    transactionResults = v5->_transactionResults;
    v5->_transactionResults = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("locationResults"));
    v35 = objc_claimAutoreleasedReturnValue();
    locationResults = v5->_locationResults;
    v5->_locationResults = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("personResults"));
    v40 = objc_claimAutoreleasedReturnValue();
    personResults = v5->_personResults;
    v5->_personResults = (NSArray *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("transactionTagResults"));
    v45 = objc_claimAutoreleasedReturnValue();
    transactionTagResults = v5->_transactionTagResults;
    v5->_transactionTagResults = (NSArray *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("barcodePassResults"));
    v50 = objc_claimAutoreleasedReturnValue();
    barcodePassResults = v5->_barcodePassResults;
    v5->_barcodePassResults = (NSArray *)v50;

    v52 = (void *)MEMORY[0x1E0C99E60];
    v53 = objc_opt_class();
    objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("paymentPassResults"));
    v55 = objc_claimAutoreleasedReturnValue();
    paymentPassResults = v5->_paymentPassResults;
    v5->_paymentPassResults = (NSArray *)v55;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray description](self->_suggestedAutocompleteTokens, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("tokens: '%@'; "), v4);

  -[NSArray description](self->_categoryResults, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("categoryResults: '%@'; "), v5);

  -[NSArray description](self->_merchantResults, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantResults: '%@'; "), v6);

  -[NSArray description](self->_transactionResults, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionResults: '%@'; "), v7);

  -[NSArray description](self->_locationResults, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("locationResults: '%@'; "), v8);

  -[NSArray description](self->_personResults, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("personResults: '%@'; "), v9);

  -[NSArray description](self->_barcodePassResults, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("barcodePassResults: '%@'; "), v10);

  -[NSArray description](self->_paymentPassResults, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentPassResults: '%@'; "), v11);

  -[NSArray description](self->_transactionTagResults, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionTagResults: '%@'; "), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSArray)suggestedAutocompleteTokens
{
  return self->_suggestedAutocompleteTokens;
}

- (void)setSuggestedAutocompleteTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)paymentPassResults
{
  return self->_paymentPassResults;
}

- (void)setPaymentPassResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)barcodePassResults
{
  return self->_barcodePassResults;
}

- (void)setBarcodePassResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)categoryResults
{
  return self->_categoryResults;
}

- (void)setCategoryResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)merchantResults
{
  return self->_merchantResults;
}

- (void)setMerchantResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)transactionResults
{
  return self->_transactionResults;
}

- (void)setTransactionResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)personResults
{
  return self->_personResults;
}

- (void)setPersonResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)locationResults
{
  return self->_locationResults;
}

- (void)setLocationResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)transactionTagResults
{
  return self->_transactionTagResults;
}

- (void)setTransactionTagResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionTagResults, 0);
  objc_storeStrong((id *)&self->_locationResults, 0);
  objc_storeStrong((id *)&self->_personResults, 0);
  objc_storeStrong((id *)&self->_transactionResults, 0);
  objc_storeStrong((id *)&self->_merchantResults, 0);
  objc_storeStrong((id *)&self->_categoryResults, 0);
  objc_storeStrong((id *)&self->_barcodePassResults, 0);
  objc_storeStrong((id *)&self->_paymentPassResults, 0);
  objc_storeStrong((id *)&self->_suggestedAutocompleteTokens, 0);
}

@end
