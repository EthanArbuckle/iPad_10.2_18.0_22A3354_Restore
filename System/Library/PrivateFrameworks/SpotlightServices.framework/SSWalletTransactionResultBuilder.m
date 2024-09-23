@implementation SSWalletTransactionResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSWalletTransactionResultBuilder;
  if (objc_msgSendSuper2(&v9, sel_supportsResult_, v4))
  {
    v10[0] = CFSTR("com.apple.finance.transaction");
    v10[1] = CFSTR("com.apple.pktransaction");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SSWalletTransactionResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSWalletTransactionResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSWalletTransactionResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v15, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSWalletTransactionResultBuilder setBusinessName:](v5, "setBusinessName:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6530], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSWalletTransactionResultBuilder setTransactionAmount:](v5, "setTransactionAmount:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6538], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSWalletTransactionResultBuilder setCurrencyCode:](v5, "setCurrencyCode:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA63D0], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSWalletTransactionResultBuilder setDate:](v5, "setDate:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6098], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSWalletTransactionResultBuilder setCashBackPercentage:](v5, "setCashBackPercentage:", v10);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSWalletTransactionResultBuilder setDescriptions:](v5, "setDescriptions:", v13);

  }
  return v5;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SSWalletTransactionResultBuilder businessName](self, "businessName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0D8C660];
    -[SSWalletTransactionResultBuilder businessName](self, "businessName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSWalletTransactionResultBuilder;
    -[SSResultBuilder buildTitle](&v8, sel_buildTitle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SSWalletTransactionResultBuilder descriptions](self, "descriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v5 = (void *)objc_opt_class();
    -[SSWalletTransactionResultBuilder descriptions](self, "descriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "richTextsFromStrings:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSWalletTransactionResultBuilder;
    -[SSResultBuilder buildDescriptions](&v8, sel_buildDescriptions);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)buildSecondaryTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[SSWalletTransactionResultBuilder descriptions](self, "descriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 2
    && (-[SSWalletTransactionResultBuilder transactionAmount](self, "transactionAmount"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[SSWalletTransactionResultBuilder currencyCode](self, "currencyCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0D8C3D0];
      -[SSWalletTransactionResultBuilder transactionAmount](self, "transactionAmount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSWalletTransactionResultBuilder currencyCode](self, "currencyCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSNumberFormatManager currencyStringWithAmount:currencyCode:](SSNumberFormatManager, "currencyStringWithAmount:currencyCode:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    }
  }
  else
  {

  }
  v13.receiver = self;
  v13.super_class = (Class)SSWalletTransactionResultBuilder;
  -[SSResultBuilder buildSecondaryTitle](&v13, sel_buildSecondaryTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)buildSecondaryTitleIsDetached
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SSWalletTransactionResultBuilder buildSecondaryTitle](self, "buildSecondaryTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)buildTrailingTopText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[SSWalletTransactionResultBuilder cashBackPercentage](self, "cashBackPercentage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSWalletTransactionResultBuilder cashBackPercentage](self, "cashBackPercentage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSWalletTransactionResultBuilder;
    -[SSResultBuilder buildTrailingTopText](&v8, sel_buildTrailingTopText);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "setEncapsulationStyle:", 2);
  return v6;
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessName:(id)a3
{
  objc_storeStrong((id *)&self->_businessName, a3);
}

- (NSNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAmount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)cashBackPercentage
{
  return self->_cashBackPercentage;
}

- (void)setCashBackPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_cashBackPercentage, a3);
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (void)setDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_descriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_cashBackPercentage, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_businessName, 0);
}

@end
