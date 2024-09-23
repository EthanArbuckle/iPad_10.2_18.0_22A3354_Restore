@implementation SSPaymentSheet

- (id)defaultAuthKitAuthenticationContext
{
  void *v3;
  void *v4;
  void *v5;

  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPaymentSheet authKitAuthenticationContextForAccount:](self, "authKitAuthenticationContextForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)authKitAuthenticationContextForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v8 &= 2u;
    if (v8)
    {
      LODWORD(v40) = 138543362;
      *(_QWORD *)((char *)&v40 + 4) = objc_opt_class();
      v10 = *(id *)((char *)&v40 + 4);
      LODWORD(v39) = 12;
      v38 = &v40;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v40, v39, v40);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog(v6, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v9);
    }

    goto LABEL_13;
  }
LABEL_14:
  v18 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v4, "altDSID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAltDSID:", v19);

  objc_msgSend(v4, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDSID:", v21);

  objc_msgSend(v18, "setIsUsernameEditable:", v5 == 0);
  -[SSPaymentSheet message](self, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set_passwordPromptTitle:", v22);

  -[SSPaymentSheet explanation](self, "explanation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setReason:", v23);

  objc_msgSend(v18, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v18, "setAuthenticationType:", 2);
  objc_msgSend(v18, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v18, "setUsername:", v5);
  if (!v18)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_msgSend(v24, "shouldLog", v38);
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v26 = v25 | 2;
    else
      v26 = v25;
    objc_msgSend(v24, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      v26 &= 2u;
    if (v26)
    {
      v28 = (void *)objc_opt_class();
      LODWORD(v40) = 138543362;
      *(_QWORD *)((char *)&v40 + 4) = v28;
      v29 = v28;
      LODWORD(v39) = 12;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, &v40, v39);
      v27 = objc_claimAutoreleasedReturnValue();
      free(v30);
      SSFileLog(v24, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v27);
    }

    goto LABEL_26;
  }
LABEL_27:

  return v18;
}

- (SSPaymentSheet)init
{
  SSPaymentSheet *v2;
  SSPaymentSheet *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSPaymentSheet;
  v2 = -[SSPaymentSheet init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSPaymentSheet _init](v2, "_init");
  return v3;
}

- (SSPaymentSheet)initWithServerResponse:(id)a3
{
  id v4;
  SSPaymentSheet *v5;
  SSPaymentSheet *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSPaymentSheet;
  v5 = -[SSPaymentSheet init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SSPaymentSheet _init](v5, "_init");
    -[SSPaymentSheet _parseResponse:](v6, "_parseResponse:", v4);
  }

  return v6;
}

- (SSPaymentSheet)initWithServerResponse:(id)a3 buyParams:(id)a4
{
  id v6;
  id v7;
  SSPaymentSheet *v8;
  SSPaymentSheet *v9;
  uint64_t v10;
  NSString *buyParams;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSPaymentSheet;
  v8 = -[SSPaymentSheet init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SSPaymentSheet _init](v8, "_init");
    -[SSPaymentSheet _parseResponse:](v9, "_parseResponse:", v6);
    v10 = objc_msgSend(v7, "copy");
    buyParams = v9->_buyParams;
    v9->_buyParams = (NSString *)v10;

    v12 = -[SSPaymentSheet _inferSalableIconTypeWithBuyParams:](v9, "_inferSalableIconTypeWithBuyParams:", v7);
    if (v12)
      -[SSPaymentSheet setSalableIconType:](v9, "setSalableIconType:", v12);
  }

  return v9;
}

- (void)_init
{
  NSLock *v3;
  NSLock *lock;
  NSString *countryCode;
  NSString *currencyCode;

  self->_applePayClassic = 0;
  v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  lock = self->_lock;
  self->_lock = v3;

  countryCode = self->_countryCode;
  self->_countryCode = (NSString *)CFSTR("US");

  currencyCode = self->_currencyCode;
  self->_currencyCode = (NSString *)CFSTR("USD");

  *(_WORD *)&self->_shouldShowCardPicker = 0;
  self->_shouldUppercaseText = 1;
}

+ (id)stringWithFormattedUsernameForString:(id)a3 username:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  if ((objc_msgSend(v7, "containsString:", CFSTR("%%appleId%%")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("%%appleId%%"), "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsString:", v9);

  }
  if ((objc_msgSend(v7, "containsString:", CFSTR("%%APPLE_ID%%")) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("%%APPLE_ID%%"), "localizedUppercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsString:", v11);

    v12 = v7;
    if ((v8 | v10) != 1)
      goto LABEL_29;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D002B8], "formattedUsernameFromUsername:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v6;
    v16 = v15;
    goto LABEL_24;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v17, "shouldLog");
  if (objc_msgSend(v17, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v17, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    v19 &= 2u;
  if (!v19)
    goto LABEL_22;
  LODWORD(v36) = 138412290;
  *(_QWORD *)((char *)&v36 + 4) = objc_opt_class();
  v21 = *(id *)((char *)&v36 + 4);
  LODWORD(v35) = 12;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v36, v35, v36);
    v20 = objc_claimAutoreleasedReturnValue();
    free(v22);
    SSFileLog(v17, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v20);
LABEL_22:

  }
  v14 = 0;
  v16 = &stru_1E47D72B0;
LABEL_24:
  v12 = v7;
  if (v8)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%%appleId%%"), v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("%%appleId%%"), "localizedUppercaseString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", v30, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v10)
  {
    -[__CFString localizedUppercaseString](v16, "localizedUppercaseString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%%APPLE_ID%%"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("%%APPLE_ID%%"), "localizedUppercaseString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", v33, v31);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_29:

  return v12;
}

- (NSString)accountHeader
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_accountHeader, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSString)buyParams
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_buyParams, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSString)displayPrice
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_displayPrice, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSAttributedString)displayPriceLabel
{
  NSAttributedString *displayPriceLabel;
  NSAttributedString *v4;
  NSAttributedString *v5;
  void *v6;

  -[SSPaymentSheet _lock](self, "_lock");
  displayPriceLabel = self->_displayPriceLabel;
  if (!displayPriceLabel)
  {
    -[SSPaymentSheet _displayPriceLabelForDisplayPrice:](self, "_displayPriceLabelForDisplayPrice:", self->_displayPrice);
    v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayPriceLabel;
    self->_displayPriceLabel = v4;

    displayPriceLabel = self->_displayPriceLabel;
  }
  v6 = (void *)-[NSAttributedString copy](displayPriceLabel, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSAttributedString *)v6;
}

- (NSString)explanation
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_explanation, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSString)paymentSummary
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_paymentSummary, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSString)presentingSceneIdentifier
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_presentingSceneIdentifier, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSString)ratingHeader
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_ratingHeader, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSString)ratingValue
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_ratingValue, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSURL)salableIconURL
{
  NSURL *salableIconURL;
  NSURL *v4;
  NSURL *v5;
  void *v6;

  -[SSPaymentSheet _lock](self, "_lock");
  salableIconURL = self->_salableIconURL;
  if (!salableIconURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_salableIconURLString);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v5 = self->_salableIconURL;
    self->_salableIconURL = v4;

    salableIconURL = self->_salableIconURL;
  }
  v6 = (void *)-[NSURL copy](salableIconURL, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSURL *)v6;
}

- (NSString)salableIconURLString
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_salableIconURLString, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (NSArray)salableInfo
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSArray copy](self->_salableInfo, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSArray *)v3;
}

- (NSAttributedString)salableInfoLabel
{
  NSAttributedString *salableInfoLabel;
  NSAttributedString *v4;
  NSAttributedString *v5;
  void *v6;

  -[SSPaymentSheet _lock](self, "_lock");
  salableInfoLabel = self->_salableInfoLabel;
  if (!salableInfoLabel)
  {
    if (self->_salableInfo)
    {
      -[SSPaymentSheet _attributedStringForSalableInfoStringArray:](self, "_attributedStringForSalableInfoStringArray:");
      v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_salableInfoLabel;
      self->_salableInfoLabel = v4;

      salableInfoLabel = self->_salableInfoLabel;
    }
    else
    {
      salableInfoLabel = 0;
    }
  }
  v6 = (void *)-[NSAttributedString copy](salableInfoLabel, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSAttributedString *)v6;
}

- (void)setAccountHeader:(id)a3
{
  NSString *v4;
  NSString *accountHeader;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_accountHeader != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    accountHeader = self->_accountHeader;
    self->_accountHeader = v4;

    if (self->_shouldUppercaseText)
    {
      -[NSString localizedUppercaseString](self->_accountHeader, "localizedUppercaseString");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_accountHeader;
      self->_accountHeader = v6;

    }
  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setDisplayPrice:(id)a3
{
  NSString *v4;
  NSString *displayPrice;
  NSString *v6;
  NSString *v7;
  NSAttributedString *displayPriceLabel;
  NSString *v9;

  v9 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_displayPrice != v9)
  {
    v4 = (NSString *)-[NSString copy](v9, "copy");
    displayPrice = self->_displayPrice;
    self->_displayPrice = v4;

    if (self->_shouldUppercaseText)
    {
      -[NSString localizedUppercaseString](self->_displayPrice, "localizedUppercaseString");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_displayPrice;
      self->_displayPrice = v6;

    }
    displayPriceLabel = self->_displayPriceLabel;
    self->_displayPriceLabel = 0;

  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setExplanation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *explanation;
  NSString *v10;

  v10 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_explanation != v10)
  {
    v4 = (void *)-[NSString copy](v10, "copy");
    -[SSPaymentSheet accountName](self, "accountName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend((id)objc_opt_class(), "stringWithFormattedUsernameForString:username:", v4, v5);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    explanation = self->_explanation;
    self->_explanation = v8;

  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setPaymentSummary:(id)a3
{
  NSString *v4;
  NSString *paymentSummary;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_paymentSummary != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    paymentSummary = self->_paymentSummary;
    self->_paymentSummary = v4;

    if (self->_shouldUppercaseText)
    {
      -[NSString localizedUppercaseString](self->_paymentSummary, "localizedUppercaseString");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_paymentSummary;
      self->_paymentSummary = v6;

    }
  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setPresentingSceneIdentifier:(id)a3
{
  NSString *v4;
  NSString *presentingSceneIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_presentingSceneIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    presentingSceneIdentifier = self->_presentingSceneIdentifier;
    self->_presentingSceneIdentifier = v4;

  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setRatingHeader:(id)a3
{
  NSString *v4;
  NSString *ratingHeader;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_ratingHeader != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    ratingHeader = self->_ratingHeader;
    self->_ratingHeader = v4;

    if (self->_shouldUppercaseText)
    {
      -[NSString localizedUppercaseString](self->_ratingHeader, "localizedUppercaseString");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_ratingHeader;
      self->_ratingHeader = v6;

    }
  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setRatingValue:(id)a3
{
  NSString *v4;
  NSString *ratingValue;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_ratingValue != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    ratingValue = self->_ratingValue;
    self->_ratingValue = v4;

    if (self->_shouldUppercaseText)
    {
      -[NSString localizedUppercaseString](self->_ratingValue, "localizedUppercaseString");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_ratingValue;
      self->_ratingValue = v6;

    }
  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setSalableIconURLString:(id)a3
{
  NSString *v4;
  NSString *salableIconURLString;
  NSURL *salableIconURL;
  NSString *v7;

  v7 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_salableIconURLString != v7)
  {
    v4 = (NSString *)-[NSString copy](v7, "copy");
    salableIconURLString = self->_salableIconURLString;
    self->_salableIconURLString = v4;

    salableIconURL = self->_salableIconURL;
    self->_salableIconURL = 0;

  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setSalableInfo:(id)a3
{
  NSArray *v4;
  NSArray *salableInfo;
  NSAttributedString *salableInfoLabel;
  NSArray *v7;

  v7 = (NSArray *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_salableInfo != v7)
  {
    v4 = (NSArray *)-[NSArray copy](v7, "copy");
    salableInfo = self->_salableInfo;
    self->_salableInfo = v4;

    if (self->_shouldUppercaseText)
      -[SSPaymentSheet _salableInfoItemsToUppercase](self, "_salableInfoItemsToUppercase");
    salableInfoLabel = self->_salableInfoLabel;
    self->_salableInfoLabel = 0;

  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (void)setStoreName:(id)a3
{
  NSString *v4;
  NSString *storeName;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  -[SSPaymentSheet _lock](self, "_lock");
  if (self->_storeName != v8)
  {
    v4 = (NSString *)-[NSString copy](v8, "copy");
    storeName = self->_storeName;
    self->_storeName = v4;

    if (self->_shouldUppercaseText)
    {
      -[NSString localizedUppercaseString](self->_storeName, "localizedUppercaseString");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_storeName;
      self->_storeName = v6;

    }
  }
  -[SSPaymentSheet _unlock](self, "_unlock");

}

- (NSString)storeName
{
  void *v3;

  -[SSPaymentSheet _lock](self, "_lock");
  v3 = (void *)-[NSString copy](self->_storeName, "copy");
  -[SSPaymentSheet _unlock](self, "_unlock");
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_accountHeader, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSArray copyWithZone:](self->_attributedList, "copyWithZone:", a3);
  v9 = (void *)v5[19];
  v5[19] = v8;

  v5[20] = self->_confirmationTitleType;
  v10 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v11 = (void *)v5[21];
  v5[21] = v10;

  v12 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v13 = (void *)v5[22];
  v5[22] = v12;

  v14 = -[NSNumber copyWithZone:](self->_designVersion, "copyWithZone:", a3);
  v15 = (void *)v5[23];
  v5[23] = v14;

  v16 = -[NSString copyWithZone:](self->_dialogId, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_displayPrice, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  v20 = -[NSString copyWithZone:](self->_explanation, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  v22 = -[NSArray copyWithZone:](self->_flexList, "copyWithZone:", a3);
  v23 = (void *)v5[24];
  v5[24] = v22;

  v24 = -[NSArray copyWithZone:](self->_inlineImages, "copyWithZone:", a3);
  v25 = (void *)v5[25];
  v5[25] = v24;

  *((_BYTE *)v5 + 16) = self->_applePayClassic;
  v26 = -[NSDictionary copyWithZone:](self->_merchantSession, "copyWithZone:", a3);
  v27 = (void *)v5[26];
  v5[26] = v26;

  v28 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v29 = (void *)v5[27];
  v5[27] = v28;

  v5[28] = self->_payeeType;
  v30 = -[NSString copyWithZone:](self->_paymentSummary, "copyWithZone:", a3);
  v31 = (void *)v5[9];
  v5[9] = v30;

  v32 = -[NSString copyWithZone:](self->_presentingSceneIdentifier, "copyWithZone:", a3);
  v33 = (void *)v5[10];
  v5[10] = v32;

  v34 = -[NSNumber copyWithZone:](self->_price, "copyWithZone:", a3);
  v35 = (void *)v5[29];
  v5[29] = v34;

  v36 = -[NSArray copyWithZone:](self->_priceSectionItems, "copyWithZone:", a3);
  v37 = (void *)v5[30];
  v5[30] = v36;

  v38 = -[NSString copyWithZone:](self->_ratingHeader, "copyWithZone:", a3);
  v39 = (void *)v5[11];
  v5[11] = v38;

  v40 = -[NSString copyWithZone:](self->_ratingValue, "copyWithZone:", a3);
  v41 = (void *)v5[12];
  v5[12] = v40;

  v5[31] = self->_salableIconType;
  v42 = -[NSString copyWithZone:](self->_salableIconURLString, "copyWithZone:", a3);
  v43 = (void *)v5[14];
  v5[14] = v42;

  v44 = -[NSArray copyWithZone:](self->_salableInfo, "copyWithZone:", a3);
  v45 = (void *)v5[15];
  v5[15] = v44;

  *((_BYTE *)v5 + 17) = self->_shouldShowCardPicker;
  *((_BYTE *)v5 + 18) = self->_shouldSuppressPrice;
  *((_BYTE *)v5 + 19) = self->_shouldUppercaseText;
  v46 = -[NSString copyWithZone:](self->_storeName, "copyWithZone:", a3);
  v47 = (void *)v5[17];
  v5[17] = v46;

  v48 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v49 = (void *)v5[33];
  v5[33] = v48;

  v5[34] = self->_titleType;
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountHeader);
  xpc_dictionary_set_BOOL(v3, "25", self->_applePayClassic);
  SSXPCDictionarySetObject(v3, "28", self->_attributedList);
  SSXPCDictionarySetObject(v3, "20", self->_buyParams);
  xpc_dictionary_set_int64(v3, "1", self->_confirmationTitleType);
  SSXPCDictionarySetObject(v3, "2", self->_countryCode);
  SSXPCDictionarySetObject(v3, "3", self->_currencyCode);
  SSXPCDictionarySetObject(v3, "30", self->_designVersion);
  SSXPCDictionarySetObject(v3, "21", self->_dialogId);
  SSXPCDictionarySetObject(v3, "4", self->_displayPrice);
  SSXPCDictionarySetObject(v3, "5", self->_explanation);
  SSXPCDictionarySetObject(v3, "6", self->_flexList);
  SSXPCDictionarySetObject(v3, "22", self->_inlineImages);
  SSXPCDictionarySetObject(v3, "24", self->_merchantSession);
  SSXPCDictionarySetObject(v3, "7", self->_message);
  xpc_dictionary_set_int64(v3, "8", self->_payeeType);
  SSXPCDictionarySetObject(v3, "9", self->_paymentSummary);
  SSXPCDictionarySetObject(v3, "29", self->_presentingSceneIdentifier);
  SSXPCDictionarySetObject(v3, "10", self->_price);
  SSXPCDictionarySetObject(v3, "23", self->_priceSectionItems);
  SSXPCDictionarySetObject(v3, "11", self->_ratingHeader);
  SSXPCDictionarySetObject(v3, "12", self->_ratingValue);
  xpc_dictionary_set_int64(v3, "18", self->_salableIconType);
  SSXPCDictionarySetObject(v3, "13", self->_salableIconURLString);
  SSXPCDictionarySetObject(v3, "14", self->_salableInfo);
  xpc_dictionary_set_BOOL(v3, "26", self->_shouldShowCardPicker);
  xpc_dictionary_set_BOOL(v3, "27", self->_shouldSuppressPrice);
  xpc_dictionary_set_BOOL(v3, "19", self->_shouldUppercaseText);
  SSXPCDictionarySetObject(v3, "15", self->_storeName);
  SSXPCDictionarySetObject(v3, "16", self->_title);
  xpc_dictionary_set_int64(v3, "17", self->_titleType);
  return v3;
}

- (SSPaymentSheet)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPaymentSheet *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *accountHeader;
  uint64_t v11;
  uint64_t v12;
  NSArray *attributedList;
  uint64_t v14;
  uint64_t v15;
  NSString *buyParams;
  uint64_t v17;
  uint64_t v18;
  NSString *countryCode;
  uint64_t v20;
  uint64_t v21;
  NSString *currencyCode;
  uint64_t v23;
  uint64_t v24;
  NSNumber *designVersion;
  uint64_t v26;
  uint64_t v27;
  NSString *dialogId;
  uint64_t v29;
  uint64_t v30;
  NSString *displayPrice;
  uint64_t v32;
  uint64_t v33;
  NSString *explanation;
  uint64_t v35;
  uint64_t v36;
  NSArray *flexList;
  uint64_t v38;
  uint64_t v39;
  NSArray *inlineImages;
  uint64_t v41;
  uint64_t v42;
  NSDictionary *merchantSession;
  uint64_t v44;
  uint64_t v45;
  NSString *message;
  uint64_t v47;
  uint64_t v48;
  NSString *paymentSummary;
  uint64_t v50;
  uint64_t v51;
  NSString *presentingSceneIdentifier;
  uint64_t v53;
  uint64_t v54;
  NSNumber *price;
  uint64_t v56;
  uint64_t v57;
  NSArray *priceSectionItems;
  uint64_t v59;
  uint64_t v60;
  NSString *ratingHeader;
  uint64_t v62;
  uint64_t v63;
  NSString *ratingValue;
  uint64_t v65;
  uint64_t v66;
  NSString *salableIconURLString;
  uint64_t v68;
  uint64_t v69;
  NSArray *salableInfo;
  uint64_t v71;
  uint64_t v72;
  NSString *storeName;
  uint64_t v74;
  uint64_t v75;
  NSString *title;
  objc_super v77;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v77.receiver = self;
    v77.super_class = (Class)SSPaymentSheet;
    v6 = -[SSPaymentSheet init](&v77, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountHeader = v6->_accountHeader;
      v6->_accountHeader = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "28", v11);
      attributedList = v6->_attributedList;
      v6->_attributedList = (NSArray *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "20", v14);
      buyParams = v6->_buyParams;
      v6->_buyParams = (NSString *)v15;

      v6->_confirmationTitleType = xpc_dictionary_get_int64(v5, "1");
      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
      countryCode = v6->_countryCode;
      v6->_countryCode = (NSString *)v18;

      v20 = objc_opt_class();
      v21 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v20);
      currencyCode = v6->_currencyCode;
      v6->_currencyCode = (NSString *)v21;

      v23 = objc_opt_class();
      v24 = SSXPCDictionaryCopyObjectWithClass(v5, "30", v23);
      designVersion = v6->_designVersion;
      v6->_designVersion = (NSNumber *)v24;

      v26 = objc_opt_class();
      v27 = SSXPCDictionaryCopyObjectWithClass(v5, "21", v26);
      dialogId = v6->_dialogId;
      v6->_dialogId = (NSString *)v27;

      v29 = objc_opt_class();
      v30 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v29);
      displayPrice = v6->_displayPrice;
      v6->_displayPrice = (NSString *)v30;

      v32 = objc_opt_class();
      v33 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v32);
      explanation = v6->_explanation;
      v6->_explanation = (NSString *)v33;

      v35 = objc_opt_class();
      v36 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v35);
      flexList = v6->_flexList;
      v6->_flexList = (NSArray *)v36;

      v38 = objc_opt_class();
      v39 = SSXPCDictionaryCopyObjectWithClass(v5, "22", v38);
      inlineImages = v6->_inlineImages;
      v6->_inlineImages = (NSArray *)v39;

      v6->_applePayClassic = xpc_dictionary_get_BOOL(v5, "25");
      v41 = objc_opt_class();
      v42 = SSXPCDictionaryCopyObjectWithClass(v5, "24", v41);
      merchantSession = v6->_merchantSession;
      v6->_merchantSession = (NSDictionary *)v42;

      v44 = objc_opt_class();
      v45 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v44);
      message = v6->_message;
      v6->_message = (NSString *)v45;

      v47 = objc_opt_class();
      v48 = SSXPCDictionaryCopyObjectWithClass(v5, "9", v47);
      paymentSummary = v6->_paymentSummary;
      v6->_paymentSummary = (NSString *)v48;

      v6->_payeeType = xpc_dictionary_get_int64(v5, "8");
      v50 = objc_opt_class();
      v51 = SSXPCDictionaryCopyObjectWithClass(v5, "29", v50);
      presentingSceneIdentifier = v6->_presentingSceneIdentifier;
      v6->_presentingSceneIdentifier = (NSString *)v51;

      v53 = objc_opt_class();
      v54 = SSXPCDictionaryCopyObjectWithClass(v5, "10", v53);
      price = v6->_price;
      v6->_price = (NSNumber *)v54;

      v56 = objc_opt_class();
      v57 = SSXPCDictionaryCopyObjectWithClass(v5, "23", v56);
      priceSectionItems = v6->_priceSectionItems;
      v6->_priceSectionItems = (NSArray *)v57;

      v59 = objc_opt_class();
      v60 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v59);
      ratingHeader = v6->_ratingHeader;
      v6->_ratingHeader = (NSString *)v60;

      v62 = objc_opt_class();
      v63 = SSXPCDictionaryCopyObjectWithClass(v5, "12", v62);
      ratingValue = v6->_ratingValue;
      v6->_ratingValue = (NSString *)v63;

      v6->_salableIconType = xpc_dictionary_get_int64(v5, "18");
      v65 = objc_opt_class();
      v66 = SSXPCDictionaryCopyObjectWithClass(v5, "13", v65);
      salableIconURLString = v6->_salableIconURLString;
      v6->_salableIconURLString = (NSString *)v66;

      v68 = objc_opt_class();
      v69 = SSXPCDictionaryCopyObjectWithClass(v5, "14", v68);
      salableInfo = v6->_salableInfo;
      v6->_salableInfo = (NSArray *)v69;

      v6->_shouldShowCardPicker = xpc_dictionary_get_BOOL(v5, "26");
      v6->_shouldSuppressPrice = xpc_dictionary_get_BOOL(v5, "27");
      v6->_shouldUppercaseText = xpc_dictionary_get_BOOL(v5, "19");
      v71 = objc_opt_class();
      v72 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v71);
      storeName = v6->_storeName;
      v6->_storeName = (NSString *)v72;

      v74 = objc_opt_class();
      v75 = SSXPCDictionaryCopyObjectWithClass(v5, "16", v74);
      title = v6->_title;
      v6->_title = (NSString *)v75;

      v6->_titleType = xpc_dictionary_get_int64(v5, "17");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)_attributedStringForAttributedArray:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, unint64_t);
  void *v16;
  SSPaymentSheet *v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__SSPaymentSheet__attributedStringForAttributedArray___block_invoke;
  v16 = &unk_1E47BE0E0;
  v17 = self;
  v18 = v5;
  v19 = v4;
  v20 = v6;
  v7 = v6;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  v11 = (void *)objc_msgSend(v10, "initWithAttributedString:", v9, v13, v14, v15, v16, v17);

  return v11;
}

void __54__SSPaymentSheet__attributedStringForAttributedArray___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_attributedStringForString:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "_attributedStringForAttributedDictionary:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v5);

LABEL_6:
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

- (id)_attributedStringForAttributedDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[SSPaymentSheet _attributedStringForString:](self, "_attributedStringForString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithAttributedString:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "isEqualToString:", CFSTR("large")))
    {
      v10 = objc_msgSend(v8, "length");
      objc_msgSend(v8, "addAttribute:value:range:", CFSTR("useLargeSize"), MEMORY[0x1E0C9AAB0], 0, v10);
    }

  }
  else
  {
    v8 = 0;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v8);

  return v11;
}

- (id)_attributedStringForSalableInfoStringArray:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, unint64_t);
  void *v16;
  SSPaymentSheet *v17;
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __61__SSPaymentSheet__attributedStringForSalableInfoStringArray___block_invoke;
  v16 = &unk_1E47BE108;
  v17 = self;
  v18 = v5;
  v19 = v4;
  v20 = v6;
  v7 = v6;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  v11 = (void *)objc_msgSend(v10, "initWithAttributedString:", v9, v13, v14, v15, v16, v17);

  return v11;
}

void __61__SSPaymentSheet__attributedStringForSalableInfoStringArray___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_attributedStringForString:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

- (id)_attributedStringForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[SSPaymentSheet accountName](self, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)objc_opt_class(), "stringWithFormattedUsernameForString:username:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_shouldUppercaseText)
  {
    objc_msgSend(v8, "localizedUppercaseString");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v8);
  -[SSPaymentSheet _replaceMarkupForMutableAttributedString:markupType:](self, "_replaceMarkupForMutableAttributedString:markupType:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSPaymentSheet _replaceMarkupForMutableAttributedString:markupType:](self, "_replaceMarkupForMutableAttributedString:markupType:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSPaymentSheet _replaceBreakingSpaceMarkupForMutableAttributedString:](self, "_replaceBreakingSpaceMarkupForMutableAttributedString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v13);
  return v14;
}

- (id)_attributedStringForStringArray:(id)a3 useGrey:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__SSPaymentSheet__attributedStringForStringArray_useGrey___block_invoke;
  v14[3] = &unk_1E47BE130;
  v18 = a4;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v11);

  return v12;
}

void __58__SSPaymentSheet__attributedStringForStringArray_useGrey___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_attributedStringForString:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "_greyAttributedStringForAttributedString:range:", v5, 0, objc_msgSend(v5, "length"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v6);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", *(_QWORD *)(a1 + 56));

}

- (int64_t)_confirmationTitleTypeForStringValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pay")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("confirm")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("get")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("install")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rent")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("redeem")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_displayPriceLabelForDisplayPrice:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3498];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  return v5;
}

- (id)_greyAttributedStringForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;

  length = a4.length;
  v5 = a3;
  if (!_greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute)
  {
    v6 = (void *)SSVPassKitFramework();
    SSVWeakLinkedStringConstantForString("PKPaymentContentItemLightColorAttribute", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute;
    _greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute = v7;

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v5);
  v10 = v9;
  if (_greyAttributedStringForAttributedString_range__kPKPaymentContentItemLightColorAttribute)
    v11 = length == 0;
  else
    v11 = 1;
  if (!v11)
    objc_msgSend(v9, "addAttribute:value:range:");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v10);

  return v12;
}

- (int64_t)_inferSalableIconTypeWithBuyParams:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "rangeOfString:", CFSTR("mtApp=com.apple.MobileSMS")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v4, "rangeOfString:", CFSTR("mtApp=com.apple.AppStore.BridgeStoreExtension")) == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 0;
      else
        v5 = 3;
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 4;
  }

  return v5;
}

- (void)_lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (void)_parseResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  int64_t v12;
  void *v13;
  NSString *v14;
  NSString *title;
  void *v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  id v23;
  NSString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSString *v34;
  NSString *accountHeader;
  void *v36;
  NSString *v37;
  NSString *countryCode;
  void *v39;
  NSString *v40;
  NSString *currencyCode;
  void *v42;
  NSNumber *v43;
  NSNumber *designVersion;
  void *v45;
  NSNumber *v46;
  NSNumber *price;
  void *v48;
  NSString *v49;
  NSString *displayPrice;
  NSAttributedString *displayPriceLabel;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  NSArray *v59;
  NSArray *priceSectionItems;
  void *v61;
  int64_t v62;
  void *v63;
  NSString *v64;
  NSString *salableIconURLString;
  NSURL *salableIconURL;
  void *v67;
  void *v68;
  void *v69;
  NSString *v70;
  NSString *storeName;
  void *v72;
  id v73;
  void *v74;
  NSString *v75;
  NSString *ratingHeader;
  void *v77;
  NSString *v78;
  NSString *ratingValue;
  void *v80;
  void *v81;
  void *v82;
  NSString *v83;
  NSString *paymentSummary;
  void *v85;
  NSArray *v86;
  NSArray *salableInfo;
  NSAttributedString *salableInfoLabel;
  void *v89;
  id v90;
  SSPaymentSheetRatingImage *v91;
  void *v92;
  SSPaymentSheetRatingImage **v93;
  NSArray *v94;
  NSArray *inlineImages;
  void *v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  NSArray *v103;
  NSArray *flexList;
  void *v105;
  NSArray *v106;
  NSArray *attributedList;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  SSPaymentSheetRatingImage *v112;
  void *v113;
  void (*v114)(uint64_t, void *);
  uint64_t *v115;
  SSPaymentSheetRatingImage *v116;
  int *v117;
  uint64_t v118;
  _QWORD v119[5];
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD v124[5];
  id v125;
  SSPaymentSheetRatingImage *v126;
  SSPaymentSheetRatingImage *v127;
  void *v128;
  int v129;
  id v130;
  __int16 v131;
  NSString *v132;
  __int16 v133;
  void *v134;
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("caseControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("true")))
      self->_shouldUppercaseText = 0;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "objectForKey:", CFSTR("type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("text")))
      {
        self->_titleType = 0;
      }
      else
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("enum")))
          v12 = 1;
        else
          v12 = 2;
        self->_titleType = v12;
      }
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("value"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (NSString *)objc_msgSend(v13, "copy");
      title = self->_title;
      self->_title = v14;

    }
    if (self->_titleType == 2)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("fallback"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (NSString *)objc_msgSend(v16, "copy");
        v18 = self->_title;
        self->_title = v17;

      }
    }
    else
    {
      v16 = v13;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (NSString *)objc_msgSend(v7, "copy");
      v11 = self->_title;
      self->_title = v10;

      self->_titleType = 0;
    }
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog");
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    v21 &= 2u;
  if (v21)
  {
    v23 = (id)objc_opt_class();
    v24 = self->_title;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_titleType);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = 138543874;
    v130 = v23;
    v131 = 2114;
    v132 = v24;
    v133 = 2114;
    v134 = v25;
    LODWORD(v118) = 32;
    v117 = &v129;
    v26 = (void *)_os_log_send_and_compose_impl();

    if (!v26)
      goto LABEL_33;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v129, v118);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v26);
    SSFileLog(v19, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v22);
  }

LABEL_33:
  objc_msgSend(v4, "valueForKey:", CFSTR("accountHeader"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = (NSString *)objc_msgSend(v33, "copy");
    accountHeader = self->_accountHeader;
    self->_accountHeader = v34;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("countryCode"), v117);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (NSString *)objc_msgSend(v36, "copy");
    countryCode = self->_countryCode;
    self->_countryCode = v37;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("currency"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = (NSString *)objc_msgSend(v39, "copy");
    currencyCode = self->_currencyCode;
    self->_currencyCode = v40;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("designVersion"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = (NSNumber *)objc_msgSend(v42, "copy");
    designVersion = self->_designVersion;
    self->_designVersion = v43;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("price"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = (NSNumber *)objc_msgSend(v45, "copy");
    price = self->_price;
    self->_price = v46;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("displayPrice"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = (NSString *)objc_msgSend(v48, "copy");
    displayPrice = self->_displayPrice;
    self->_displayPrice = v49;

    displayPriceLabel = self->_displayPriceLabel;
    self->_displayPriceLabel = 0;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("suppressPrice"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v52, "lowercaseString");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("true"));

    if (v54)
      self->_shouldSuppressPrice = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_shouldSuppressPrice = objc_msgSend(v52, "BOOLValue");
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("priceSection"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55)
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("pricingSection"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v57 = v55;
    v124[0] = MEMORY[0x1E0C809B0];
    v124[1] = 3221225472;
    v124[2] = __33__SSPaymentSheet__parseResponse___block_invoke;
    v124[3] = &unk_1E47BE158;
    v124[4] = self;
    v58 = v56;
    v125 = v58;
    objc_msgSend(v57, "enumerateObjectsUsingBlock:", v124);
    v59 = (NSArray *)objc_msgSend(v58, "copy");
    priceSectionItems = self->_priceSectionItems;
    self->_priceSectionItems = v59;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("requestor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v62 = -[SSPaymentSheet _payeeTypeForRequestorValue:](self, "_payeeTypeForRequestorValue:", v61);
  else
    v62 = -[SSPaymentSheet _payeeTypeInferredFromEnumeratedTitle](self, "_payeeTypeInferredFromEnumeratedTitle");
  self->_payeeType = v62;
  objc_msgSend(v4, "valueForKey:", CFSTR("salableIcon"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = (NSString *)objc_msgSend(v63, "copy");
    salableIconURLString = self->_salableIconURLString;
    self->_salableIconURLString = v64;

    salableIconURL = self->_salableIconURL;
    self->_salableIconURL = 0;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("salableIconType"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v67, "lowercaseString");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    self->_salableIconType = -[SSPaymentSheet _salableIconTypeForString:](self, "_salableIconTypeForString:", v68);

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("storeName"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = (NSString *)objc_msgSend(v69, "copy");
    storeName = self->_storeName;
    self->_storeName = v70;

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("rating"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = v72;
    objc_msgSend(v73, "valueForKey:", CFSTR("header"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = (NSString *)objc_msgSend(v74, "copy");
      ratingHeader = self->_ratingHeader;
      self->_ratingHeader = v75;

    }
    objc_msgSend(v73, "valueForKey:", CFSTR("text"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v78 = (NSString *)objc_msgSend(v77, "copy");
      ratingValue = self->_ratingValue;
      self->_ratingValue = v78;

    }
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("confirmationTitle"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v80, "lowercaseString");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    self->_confirmationTitleType = -[SSPaymentSheet _confirmationTitleTypeForStringValue:](self, "_confirmationTitleTypeForStringValue:", v81);

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("paymentSummary"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = (NSString *)objc_msgSend(v82, "copy");
    paymentSummary = self->_paymentSummary;
    self->_paymentSummary = v83;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("salableInfo"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = (NSArray *)objc_msgSend(v85, "copy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_78;
    v128 = v85;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
    v86 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  salableInfo = self->_salableInfo;
  self->_salableInfo = v86;

  salableInfoLabel = self->_salableInfoLabel;
  self->_salableInfoLabel = 0;

LABEL_78:
  objc_msgSend(v4, "objectForKey:", CFSTR("images"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = v89;
    v91 = -[SSPaymentSheetRatingImage initWithURLString:]([SSPaymentSheetRatingImage alloc], "initWithURLString:", v90);
    v127 = v91;
    v92 = (void *)MEMORY[0x1E0C99D20];
    v93 = &v127;
LABEL_82:
    objc_msgSend(v92, "arrayWithObjects:count:", v93, 1);
    v94 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_83:
    inlineImages = self->_inlineImages;
    self->_inlineImages = v94;

    goto LABEL_84;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = v89;
    v91 = -[SSPaymentSheetRatingImage initWithDictionary:]([SSPaymentSheetRatingImage alloc], "initWithDictionary:", v90);
    v126 = v91;
    v92 = (void *)MEMORY[0x1E0C99D20];
    v93 = &v126;
    goto LABEL_82;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v91 = v89;
    if (!-[SSPaymentSheetRatingImage count](v91, "count"))
    {
LABEL_105:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v90);
      v94 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_83;
    }
    -[SSPaymentSheetRatingImage objectAtIndexedSubscript:](v91, "objectAtIndexedSubscript:", 0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v112 = v91;
      v123 = MEMORY[0x1E0C809B0];
      v113 = &unk_1E47BAED0;
      v114 = __33__SSPaymentSheet__parseResponse___block_invoke_2;
      v115 = &v123;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_104:

        goto LABEL_105;
      }
      v116 = v91;
      v122 = MEMORY[0x1E0C809B0];
      v113 = &unk_1E47BE180;
      v114 = __33__SSPaymentSheet__parseResponse___block_invoke_3;
      v115 = &v122;
    }
    v115[1] = 3221225472;
    v115[2] = (uint64_t)v114;
    v115[3] = (uint64_t)v113;
    v115[4] = (uint64_t)v90;
    -[SSPaymentSheetRatingImage enumerateObjectsUsingBlock:](v91, "enumerateObjectsUsingBlock:", v115);

    goto LABEL_104;
  }
LABEL_84:
  objc_msgSend(v4, "objectForKey:", CFSTR("styles"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v97 = v96;
  else
    v97 = 0;
  v98 = v97;

  if (v98)
    -[SSPaymentSheet setStyles:](self, "setStyles:", v98);
  objc_msgSend(v4, "objectForKey:", CFSTR("flexList"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101 = v99;
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __33__SSPaymentSheet__parseResponse___block_invoke_4;
    v119[3] = &unk_1E47BE1F8;
    v119[4] = self;
    v120 = v98;
    v102 = v100;
    v121 = v102;
    objc_msgSend(v101, "enumerateObjectsUsingBlock:", v119);
    v103 = (NSArray *)objc_msgSend(v102, "copy");
    flexList = self->_flexList;
    self->_flexList = v103;

    -[SSPaymentSheet _attributedListForFlexList:](self, "_attributedListForFlexList:", v101);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (NSArray *)objc_msgSend(v105, "copy");
    attributedList = self->_attributedList;
    self->_attributedList = v106;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("isApplePay"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v108, "lowercaseString");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "isEqualToString:", CFSTR("true"));

    if (v110)
      self->_applePayClassic = 1;
  }
  if (self->_shouldUppercaseText)
  {
    -[SSPaymentSheet _salableInfoItemsToUppercase](self, "_salableInfoItemsToUppercase");
    -[SSPaymentSheet _stringValuesToUppercase](self, "_stringValuesToUppercase");
  }

}

void __33__SSPaymentSheet__parseResponse___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  SSPaymentSheetPriceSectionItem *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v7 = (id)objc_msgSend([v3 alloc], "initWithDictionary:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) == 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("caseControl"));

  v6 = -[SSPaymentSheetPriceSectionItem initWithDictionary:]([SSPaymentSheetPriceSectionItem alloc], "initWithDictionary:", v7);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __33__SSPaymentSheet__parseResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SSPaymentSheetRatingImage *v4;

  v3 = a2;
  v4 = -[SSPaymentSheetRatingImage initWithURLString:]([SSPaymentSheetRatingImage alloc], "initWithURLString:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __33__SSPaymentSheet__parseResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SSPaymentSheetRatingImage *v4;

  v3 = a2;
  v4 = -[SSPaymentSheetRatingImage initWithDictionary:]([SSPaymentSheetRatingImage alloc], "initWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __33__SSPaymentSheet__parseResponse___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  id v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "designVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", *MEMORY[0x1E0CFD970]);

  if (!v5)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("header"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("headerIcon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("value"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("valueStyle"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("gray")) & 1) != 0)
      v13 = 1;
    else
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("grey"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_48;
    }
    if (!v10)
      goto LABEL_48;
    v38 = v13;
    if (v6)
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 19))
      {
        objc_msgSend(v6, "localizedUppercaseString");
        v16 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v16;
      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
      if (v9)
        goto LABEL_20;
    }
    else
    {
      v17 = 0;
      if (v9)
      {
LABEL_20:
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
        goto LABEL_31;
      }
    }
    v18 = 0;
LABEL_31:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v9;
      v26 = *(void **)(a1 + 32);
      v49 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v27 = v17;
      v28 = v18;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_attributedStringForStringArray:useGrey:", v29, v38);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v28;
      v17 = v27;
      if (!v27)
        goto LABEL_38;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = 0;
        goto LABEL_45;
      }
      v37 = v9;
      objc_msgSend(*(id *)(a1 + 32), "_attributedStringForStringArray:useGrey:", v10, v38);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_38;
    }
    if (v30)
    {
      v47[0] = CFSTR("header");
      v47[1] = CFSTR("value");
      v48[0] = v17;
      v48[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v37;
LABEL_41:
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);

LABEL_45:
LABEL_48:

      goto LABEL_49;
    }
LABEL_38:
    v9 = v37;
    if (!v18 || !v30)
      goto LABEL_45;
    v45[0] = CFSTR("headerIcon");
    v45[1] = CFSTR("value");
    v46[0] = v18;
    v46[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  objc_msgSend(*(id *)(a1 + 32), "accountName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("style"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;

    objc_msgSend((id)objc_opt_class(), "_styleDictionaryWithName:styles:", v20, *(_QWORD *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend((id)objc_opt_class(), "stringWithFormattedUsernameForString:username:", v12, v6);
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_attributedStringWithString:styles:", v22, v21);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
      {
        v52 = CFSTR("value");
        v53[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEntriesFromDictionary:", v25);

      }
      v12 = (id)v22;
    }
    else
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __33__SSPaymentSheet__parseResponse___block_invoke_5;
      v42[3] = &unk_1E47BE1A8;
      v42[4] = *(_QWORD *)(a1 + 32);
      v43 = v6;
      v44 = v10;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v42);

    }
    v32 = *(void **)(a1 + 48);
    v33 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v32, "addObject:", v33);

    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v15;
    else
      v10 = 0;

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __33__SSPaymentSheet__parseResponse___block_invoke_6;
    v39[3] = &unk_1E47BE1D0;
    v39[4] = *(_QWORD *)(a1 + 32);
    v40 = v14;
    v41 = *(id *)(a1 + 48);
    v12 = v14;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v39);
    v34 = *(void **)(a1 + 48);
    v50 = CFSTR("value");
    v35 = (void *)objc_msgSend(v12, "copy");
    v51 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v36);

    goto LABEL_48;
  }
LABEL_49:

}

void __33__SSPaymentSheet__parseResponse___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "stringWithFormattedUsernameForString:username:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v10, "isEqualToString:", CFSTR("value"));
  v8 = *(void **)(a1 + 48);
  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

  }
  else
  {
    objc_msgSend(v8, "setObject:forKey:", v6, v10);
  }

}

void __33__SSPaymentSheet__parseResponse___block_invoke_6(id *a1, void *a2, unint64_t a3)
{
  char isKindOfClass;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v19;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("style"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    v13 = (void *)objc_opt_class();
    objc_msgSend(a1[4], "styles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_styleDictionaryWithName:styles:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_attributedStringWithString:styles:", v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "appendAttributedString:", v16);
    if (objc_msgSend(a1[6], "count") - 1 > a3)
    {
      v17 = a1[5];
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\u2028"));
      objc_msgSend(v17, "appendAttributedString:", v18);

    }
    v6 = v19;
  }

}

- (id)_attributedListForFlexList:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke;
  v15[3] = &unk_1E47BE180;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke_2;
  v13[3] = &unk_1E47BE158;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
  if (objc_msgSend(v10, "count"))
    v11 = (void *)objc_msgSend(v10, "copy");
  else
    v11 = 0;

  return v11;
}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attributedList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

    v4 = v6;
  }

}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke_3;
    v5[3] = &unk_1E47BE220;
    v3 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("value")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
        if (v7)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __45__SSPaymentSheet__attributedListForFlexList___block_invoke_4;
          v11[3] = &unk_1E47BE158;
          v11[4] = *(_QWORD *)(a1 + 32);
          v9 = v8;
          v12 = v9;
          objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
          if (objc_msgSend(v9, "count"))
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("value"));

        }
      }
    }
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __45__SSPaymentSheet__attributedListForFlexList___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("header"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("header"));

    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_attributedStringForAttributedDictionary:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_12;
    }
    else
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_attributedStringForAttributedArray:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      if (!v7)
        goto LABEL_12;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("value"));
LABEL_12:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

- (int64_t)_payeeTypeForRequestorValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppStore")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iTunes")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleMusic")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iBooks")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AppleNews")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_payeeTypeInferredFromEnumeratedTitle
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  void *v31;
  NSString *title;
  _BYTE *v33;
  uint64_t v34;
  _BYTE v35[22];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (v5)
  {
    *(_DWORD *)v35 = 138412290;
    *(_QWORD *)&v35[4] = objc_opt_class();
    v7 = *(id *)&v35[4];
    LODWORD(v34) = 12;
    v33 = v35;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, v35, v34, *(_OWORD *)v35);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
  }

LABEL_12:
  if (self->_titleType != 1)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v16, "shouldLog", v33);
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      v18 &= 2u;
    if (!v18)
      goto LABEL_26;
    v20 = (void *)objc_opt_class();
    *(_DWORD *)v35 = 138412290;
    *(_QWORD *)&v35[4] = v20;
    v21 = v20;
    LODWORD(v34) = 12;
    goto LABEL_24;
  }
  if (-[NSString isEqualToString:](self->_title, "isEqualToString:", CFSTR("AppStore")))
    return 3;
  if (-[NSString isEqualToString:](self->_title, "isEqualToString:", CFSTR("iTunes")))
    return 5;
  if (-[NSString isEqualToString:](self->_title, "isEqualToString:", CFSTR("AppleMusic")))
    return 1;
  if (-[NSString isEqualToString:](self->_title, "isEqualToString:", CFSTR("iBooks")))
    return 4;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:", CFSTR("AppleNews")))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = objc_msgSend(v16, "shouldLog", v33);
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v30 = v29 | 2;
    else
      v30 = v29;
    objc_msgSend(v16, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      v30 &= 2u;
    if (!v30)
      goto LABEL_26;
    v31 = (void *)objc_opt_class();
    title = self->_title;
    *(_DWORD *)v35 = 138412546;
    *(_QWORD *)&v35[4] = v31;
    *(_WORD *)&v35[12] = 2112;
    *(_QWORD *)&v35[14] = title;
    v21 = v31;
    LODWORD(v34) = 22;
LABEL_24:
    v22 = (void *)_os_log_send_and_compose_impl();

    if (!v22)
    {
LABEL_27:

      return 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, v35, v34);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v22);
    SSFileLog(v16, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v19);
LABEL_26:

    goto LABEL_27;
  }
  return 2;
}

- (id)_replaceBreakingSpaceMarkupForMutableAttributedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("[br/]"));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v9 = 0;
    do
    {
      v10 = v5;
      objc_msgSend(v3, "replaceCharactersInRange:withString:", v8, v7, CFSTR("\n"));
      objc_msgSend(v3, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v5, "rangeOfString:", CFSTR("[br/]"));
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v8 = v12;
    }
    while (v9++ < 9);
  }

  return v3;
}

- (id)_replaceMarkupForMutableAttributedString:(id)a3 markupType:(int64_t)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(const __CFString *, _QWORD, double);
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  CFTypeRef cf;

  v5 = a3;
  v6 = v5;
  v7 = CFSTR("[b]");
  v8 = CFSTR("[/b]");
  if (a4)
  {
    v8 = 0;
    v7 = 0;
  }
  if (a4 == 1)
    v9 = CFSTR("[/i]");
  else
    v9 = v8;
  if (a4 == 1)
    v10 = CFSTR("[i]");
  else
    v10 = v7;
  objc_msgSend(v5, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "rangeOfString:", v10) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = (void *)SSVCoreText();
    v14 = (uint64_t (*)(const __CFString *, _QWORD, double))SSVWeakLinkedSymbolForString("CTFontCreateWithName", v13);
    if (a4)
    {
      if (a4 != 1)
        goto LABEL_23;
      v15 = CFSTR("Helvetica-Italic");
    }
    else
    {
      v15 = CFSTR("Helvetica-Bold");
    }
    v16 = v14(v15, 0, 14.0);
    if (v16)
    {
      cf = (CFTypeRef)v16;
      v17 = objc_msgSend(v12, "rangeOfString:", v10);
      v19 = v18;
      v20 = objc_msgSend(v12, "rangeOfString:", v9);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = v20;
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = 0;
          do
          {
            v24 = v9;
            v25 = v12;
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v22, v21, &stru_1E47D72B0);
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v17, v19, &stru_1E47D72B0);
            objc_msgSend(v6, "string");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lowercaseString");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v24;
            v17 = objc_msgSend(v12, "rangeOfString:", v10);
            v19 = v27;
            v28 = objc_msgSend(v12, "rangeOfString:", v24);
            if (v17 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            v22 = v28;
            if (v28 == 0x7FFFFFFFFFFFFFFFLL)
              break;
          }
          while (v23++ < 9);
        }
      }
      CFRelease(cf);
    }
  }
LABEL_23:

  return v6;
}

- (int64_t)_salableIconTypeForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("app")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("merchant")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("messages")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("watch")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_salableInfoItemsToUppercase
{
  id v3;
  NSArray *salableInfo;
  NSArray *v5;
  NSArray *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  salableInfo = self->_salableInfo;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SSPaymentSheet__salableInfoItemsToUppercase__block_invoke;
  v8[3] = &unk_1E47BAED0;
  v9 = v3;
  v7 = v3;
  -[NSArray enumerateObjectsUsingBlock:](salableInfo, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v6 = self->_salableInfo;
  self->_salableInfo = v5;

}

void __46__SSPaymentSheet__salableInfoItemsToUppercase__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localizedUppercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_stringValuesToUppercase
{
  NSString *v3;
  NSString *accountHeader;
  NSString *v5;
  NSString *displayPrice;
  NSString *v7;
  NSString *paymentSummary;
  NSString *v9;
  NSString *ratingHeader;
  NSString *v11;
  NSString *ratingValue;
  NSString *v13;
  NSString *storeName;

  -[NSString localizedUppercaseString](self->_accountHeader, "localizedUppercaseString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountHeader = self->_accountHeader;
  self->_accountHeader = v3;

  -[NSString localizedUppercaseString](self->_displayPrice, "localizedUppercaseString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayPrice = self->_displayPrice;
  self->_displayPrice = v5;

  -[NSString localizedUppercaseString](self->_paymentSummary, "localizedUppercaseString");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  paymentSummary = self->_paymentSummary;
  self->_paymentSummary = v7;

  -[NSString localizedUppercaseString](self->_ratingHeader, "localizedUppercaseString");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  ratingHeader = self->_ratingHeader;
  self->_ratingHeader = v9;

  -[NSString localizedUppercaseString](self->_ratingValue, "localizedUppercaseString");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  ratingValue = self->_ratingValue;
  self->_ratingValue = v11;

  -[NSString localizedUppercaseString](self->_storeName, "localizedUppercaseString");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  storeName = self->_storeName;
  self->_storeName = v13;

}

- (void)_unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

+ (id)_attributedStringWithString:(id)a3 styles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;

  v5 = a3;
  v6 = a4;
  if (!_attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute)
  {
    v7 = (void *)SSVPassKitFramework();
    SSVWeakLinkedStringConstantForString("PKPaymentContentItemLightColorAttribute", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute;
    _attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute = v8;

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("color"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("gray")))
  {

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("color"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("grey"));

    if (!v13)
      goto LABEL_7;
  }
  v14 = _attributedStringWithString_styles__kPKPaymentContentItemLightColorAttribute;
  v15 = objc_msgSend(v5, "length");
  objc_msgSend(v10, "addAttribute:value:range:", v14, MEMORY[0x1E0C9AAB0], 0, v15);
LABEL_7:
  if (!_attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute)
  {
    v16 = (void *)SSVPassKitFramework();
    SSVWeakLinkedStringConstantForString("PKPaymentContentItemBoldAttribute", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)_attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute;
    _attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute = v17;

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bold"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("true")) & 1) != 0 || objc_msgSend(v19, "BOOLValue"))
  {
    v20 = _attributedStringWithString_styles__kPKPaymentContentItemBoldAttribute;
    v21 = objc_msgSend(v5, "length");
    objc_msgSend(v10, "addAttribute:value:range:", v20, MEMORY[0x1E0C9AAB0], 0, v21);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("size"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("large"));

  if (v23)
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0CFD938], *MEMORY[0x1E0CFD940], 0, objc_msgSend(v5, "length"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spacingAfter"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("large")) & 1) != 0)
    {
      v26 = (_QWORD *)MEMORY[0x1E0CFD950];
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("small")) & 1) != 0)
    {
      v26 = (_QWORD *)MEMORY[0x1E0CFD960];
    }
    else
    {
      if (!objc_msgSend(v25, "isEqualToString:", CFSTR("medium")))
        goto LABEL_22;
      v26 = (_QWORD *)MEMORY[0x1E0CFD958];
    }
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0CFD948], *v26, 0, objc_msgSend(v5, "length"));
  }
LABEL_22:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spacingBefore"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((objc_msgSend(v27, "isEqualToString:", CFSTR("large")) & 1) != 0)
    {
      v29 = (_QWORD *)MEMORY[0x1E0CFD950];
LABEL_29:
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0CFD968], *v29, 0, objc_msgSend(v5, "length"));
      goto LABEL_30;
    }
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("small")) & 1) != 0)
    {
      v29 = (_QWORD *)MEMORY[0x1E0CFD960];
      goto LABEL_29;
    }
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("medium")))
    {
      v29 = (_QWORD *)MEMORY[0x1E0CFD958];
      goto LABEL_29;
    }
  }
LABEL_30:
  v30 = (void *)objc_msgSend(v10, "copy");

  return v30;
}

+ (id)_styleDictionaryWithName:(id)a3 styles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__SSPaymentSheet__styleDictionaryWithName_styles___block_invoke;
  v10[3] = &unk_1E47BE248;
  v11 = v5;
  v6 = v5;
  objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __50__SSPaymentSheet__styleDictionaryWithName_styles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)isApplePayClassic
{
  return self->_applePayClassic;
}

- (void)setApplePayClassic:(BOOL)a3
{
  self->_applePayClassic = a3;
}

- (NSString)dialogId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDialogId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldShowCardPicker
{
  return self->_shouldShowCardPicker;
}

- (void)setShouldShowCardPicker:(BOOL)a3
{
  self->_shouldShowCardPicker = a3;
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSArray)attributedList
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (int64_t)confirmationTitleType
{
  return self->_confirmationTitleType;
}

- (void)setConfirmationTitleType:(int64_t)a3
{
  self->_confirmationTitleType = a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSString)currencyCode
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSNumber)designVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDesignVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSArray)flexList
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)inlineImages
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)merchantSession
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMerchantSession:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (int64_t)payeeType
{
  return self->_payeeType;
}

- (void)setPayeeType:(int64_t)a3
{
  self->_payeeType = a3;
}

- (NSNumber)price
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPrice:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSArray)priceSectionItems
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPriceSectionItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (int64_t)salableIconType
{
  return self->_salableIconType;
}

- (void)setSalableIconType:(int64_t)a3
{
  self->_salableIconType = a3;
}

- (BOOL)shouldSuppressPrice
{
  return self->_shouldSuppressPrice;
}

- (void)setShouldSuppressPrice:(BOOL)a3
{
  self->_shouldSuppressPrice = a3;
}

- (BOOL)shouldUppercaseText
{
  return self->_shouldUppercaseText;
}

- (void)setShouldUppercaseText:(BOOL)a3
{
  self->_shouldUppercaseText = a3;
}

- (NSArray)styles
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setStyles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (void)setTitleType:(int64_t)a3
{
  self->_titleType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_priceSectionItems, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_inlineImages, 0);
  objc_storeStrong((id *)&self->_flexList, 0);
  objc_storeStrong((id *)&self->_designVersion, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_attributedList, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_salableInfoLabel, 0);
  objc_storeStrong((id *)&self->_salableInfo, 0);
  objc_storeStrong((id *)&self->_salableIconURLString, 0);
  objc_storeStrong((id *)&self->_salableIconURL, 0);
  objc_storeStrong((id *)&self->_ratingValue, 0);
  objc_storeStrong((id *)&self->_ratingHeader, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentSummary, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_displayPriceLabel, 0);
  objc_storeStrong((id *)&self->_displayPrice, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_accountHeader, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
