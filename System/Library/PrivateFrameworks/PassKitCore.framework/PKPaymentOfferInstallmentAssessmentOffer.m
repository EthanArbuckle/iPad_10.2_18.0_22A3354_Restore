@implementation PKPaymentOfferInstallmentAssessmentOffer

- (PKPaymentOfferInstallmentAssessmentOffer)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentAssessmentOffer *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *serviceProviderURL;
  uint64_t v10;
  NSDate *dueDate;
  uint64_t v12;
  PKCurrencyAmount *totalCost;
  void *v14;
  uint64_t v15;
  PKCurrencyAmount *installmentAmount;
  uint64_t v17;
  PKCurrencyAmount *totalInterestAndFeesAmount;
  void *v19;
  PKPaymentOfferInstallmentFeeDetails *v20;
  PKPaymentOfferInstallmentFeeDetails *feeDetails;
  void *v22;
  PKPaymentOfferInstallmentInterestDetails *v23;
  PKPaymentOfferInstallmentInterestDetails *interestDetails;
  void *v25;
  PKPaymentOfferInstallmentDownpaymentDetails *v26;
  PKPaymentOfferInstallmentDownpaymentDetails *downpaymentDetails;
  uint64_t v28;
  NSDictionary *serviceProviderData;
  void *v30;
  PKPaymentOfferDynamicContent *v31;
  PKPaymentOfferDynamicContent *dynamicContent;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentOfferInstallmentAssessmentOffer;
  v5 = -[PKPaymentOfferInstallmentAssessmentOffer init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("serviceProviderURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceProviderURL = v5->_serviceProviderURL;
    v5->_serviceProviderURL = (NSURL *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("dueDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v10;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalCost"));
    v12 = objc_claimAutoreleasedReturnValue();
    totalCost = v5->_totalCost;
    v5->_totalCost = (PKCurrencyAmount *)v12;

    v5->_installmentCount = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("installmentCount"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("installmentPeriod"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installmentPeriod = PKPaymentOfferPeriodFromString(v14);

    v5->_installmentInterval = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("installmentInterval"));
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("installmentAmount"));
    v15 = objc_claimAutoreleasedReturnValue();
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v15;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalInterestAndFeesAmount"));
    v17 = objc_claimAutoreleasedReturnValue();
    totalInterestAndFeesAmount = v5->_totalInterestAndFeesAmount;
    v5->_totalInterestAndFeesAmount = (PKCurrencyAmount *)v17;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("feeDetails"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = -[PKPaymentOfferInstallmentFeeDetails initWithDictionary:]([PKPaymentOfferInstallmentFeeDetails alloc], "initWithDictionary:", v19);
      feeDetails = v5->_feeDetails;
      v5->_feeDetails = v20;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("interestDetails"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v23 = -[PKPaymentOfferInstallmentInterestDetails initWithDictionary:]([PKPaymentOfferInstallmentInterestDetails alloc], "initWithDictionary:", v22);
      interestDetails = v5->_interestDetails;
      v5->_interestDetails = v23;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("downpaymentDetails"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "count"))
    {
      v26 = -[PKPaymentOfferInstallmentDownpaymentDetails initWithDictionary:]([PKPaymentOfferInstallmentDownpaymentDetails alloc], "initWithDictionary:", v25);
      downpaymentDetails = v5->_downpaymentDetails;
      v5->_downpaymentDetails = v26;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("serviceProviderData"));
    v28 = objc_claimAutoreleasedReturnValue();
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v28;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("dynamicContent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count"))
    {
      v31 = -[PKPaymentOfferDynamicContent initWithDictionary:]([PKPaymentOfferDynamicContent alloc], "initWithDictionary:", v30);
      dynamicContent = v5->_dynamicContent;
      v5->_dynamicContent = v31;

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  -[NSURL absoluteString](self->_serviceProviderURL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("serviceProviderURL"));

  PKISO8601DateStringFromDate(self->_dueDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dueDate"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalCost, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("totalCost"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_installmentCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("installmentCount"));

  PKPaymentOfferPeriodToString(self->_installmentPeriod);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("installmentPeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_installmentInterval);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("installmentInterval"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_installmentAmount, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("installmentAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalInterestAndFeesAmount, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalInterestAndFeesAmount"));

  -[PKPaymentOfferInstallmentFeeDetails dictionaryRepresentation](self->_feeDetails, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("feeDetails"));

  -[PKPaymentOfferInstallmentInterestDetails dictionaryRepresentation](self->_interestDetails, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("interestDetails"));

  -[PKPaymentOfferInstallmentDownpaymentDetails dictionaryRepresentation](self->_downpaymentDetails, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("downpaymentDetails"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_serviceProviderData, CFSTR("serviceProviderData"));
  -[PKPaymentOfferDynamicContent dictionaryRepresentation](self->_dynamicContent, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("dynamicContent"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_preferredLanguage, CFSTR("preferredLanguage"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentAssessmentOffer *v4;
  PKPaymentOfferInstallmentAssessmentOffer *v5;
  PKPaymentOfferInstallmentAssessmentOffer *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSURL *serviceProviderURL;
  NSURL *v13;
  NSDate *dueDate;
  NSDate *v15;
  PKCurrencyAmount *totalCost;
  PKCurrencyAmount *v17;
  PKCurrencyAmount *installmentAmount;
  PKCurrencyAmount *v19;
  PKCurrencyAmount *totalInterestAndFeesAmount;
  PKCurrencyAmount *v21;
  PKPaymentOfferInstallmentFeeDetails *feeDetails;
  PKPaymentOfferInstallmentFeeDetails *v23;
  PKPaymentOfferInstallmentInterestDetails *interestDetails;
  PKPaymentOfferInstallmentInterestDetails *v25;
  PKPaymentOfferInstallmentDownpaymentDetails *downpaymentDetails;
  PKPaymentOfferInstallmentDownpaymentDetails *v27;
  NSDictionary *serviceProviderData;
  NSDictionary *v29;
  PKPaymentOfferDynamicContent *dynamicContent;
  PKPaymentOfferDynamicContent *v31;
  NSString *preferredLanguage;
  NSString *v33;
  NSString *v34;

  v4 = (PKPaymentOfferInstallmentAssessmentOffer *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
          {
LABEL_70:

            goto LABEL_71;
          }
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_71;
        }
        serviceProviderURL = self->_serviceProviderURL;
        v13 = v6->_serviceProviderURL;
        if (serviceProviderURL && v13)
        {
          if ((-[NSURL isEqual:](serviceProviderURL, "isEqual:") & 1) == 0)
            goto LABEL_68;
        }
        else if (serviceProviderURL != v13)
        {
          goto LABEL_68;
        }
        dueDate = self->_dueDate;
        v15 = v6->_dueDate;
        if (dueDate && v15)
        {
          if ((-[NSDate isEqual:](dueDate, "isEqual:") & 1) == 0)
            goto LABEL_68;
        }
        else if (dueDate != v15)
        {
          goto LABEL_68;
        }
        totalCost = self->_totalCost;
        v17 = v6->_totalCost;
        if (totalCost && v17)
        {
          if (!-[PKCurrencyAmount isEqual:](totalCost, "isEqual:"))
            goto LABEL_68;
        }
        else if (totalCost != v17)
        {
          goto LABEL_68;
        }
        if (self->_installmentCount != v6->_installmentCount
          || self->_installmentPeriod != v6->_installmentPeriod
          || self->_installmentInterval != v6->_installmentInterval)
        {
          goto LABEL_68;
        }
        installmentAmount = self->_installmentAmount;
        v19 = v6->_installmentAmount;
        if (installmentAmount && v19)
        {
          if (!-[PKCurrencyAmount isEqual:](installmentAmount, "isEqual:"))
            goto LABEL_68;
        }
        else if (installmentAmount != v19)
        {
          goto LABEL_68;
        }
        totalInterestAndFeesAmount = self->_totalInterestAndFeesAmount;
        v21 = v6->_totalInterestAndFeesAmount;
        if (totalInterestAndFeesAmount && v21)
        {
          if (!-[PKCurrencyAmount isEqual:](totalInterestAndFeesAmount, "isEqual:"))
            goto LABEL_68;
        }
        else if (totalInterestAndFeesAmount != v21)
        {
          goto LABEL_68;
        }
        feeDetails = self->_feeDetails;
        v23 = v6->_feeDetails;
        if (feeDetails && v23)
        {
          if (!-[PKPaymentOfferInstallmentFeeDetails isEqual:](feeDetails, "isEqual:"))
            goto LABEL_68;
        }
        else if (feeDetails != v23)
        {
          goto LABEL_68;
        }
        interestDetails = self->_interestDetails;
        v25 = v6->_interestDetails;
        if (interestDetails && v25)
        {
          if (!-[PKPaymentOfferInstallmentInterestDetails isEqual:](interestDetails, "isEqual:"))
            goto LABEL_68;
        }
        else if (interestDetails != v25)
        {
          goto LABEL_68;
        }
        downpaymentDetails = self->_downpaymentDetails;
        v27 = v6->_downpaymentDetails;
        if (downpaymentDetails && v27)
        {
          if (!-[PKPaymentOfferInstallmentDownpaymentDetails isEqual:](downpaymentDetails, "isEqual:"))
            goto LABEL_68;
        }
        else if (downpaymentDetails != v27)
        {
          goto LABEL_68;
        }
        serviceProviderData = self->_serviceProviderData;
        v29 = v6->_serviceProviderData;
        if (serviceProviderData && v29)
        {
          if ((-[NSDictionary isEqual:](serviceProviderData, "isEqual:") & 1) == 0)
            goto LABEL_68;
        }
        else if (serviceProviderData != v29)
        {
          goto LABEL_68;
        }
        dynamicContent = self->_dynamicContent;
        v31 = v6->_dynamicContent;
        if (dynamicContent && v31)
        {
          if (-[PKPaymentOfferDynamicContent isEqual:](dynamicContent, "isEqual:"))
            goto LABEL_63;
        }
        else if (dynamicContent == v31)
        {
LABEL_63:
          preferredLanguage = self->_preferredLanguage;
          v33 = v6->_preferredLanguage;
          v8 = preferredLanguage;
          v34 = v33;
          if (v8 == v34)
          {
            LOBYTE(v11) = 1;
            v10 = v8;
          }
          else
          {
            v10 = v34;
            LOBYTE(v11) = 0;
            if (v8 && v34)
              LOBYTE(v11) = -[NSString isEqualToString:](v8, "isEqualToString:", v34);
          }
          goto LABEL_70;
        }
LABEL_68:
        LOBYTE(v11) = 0;
LABEL_71:

        goto LABEL_72;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_72:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceProviderURL);
  objc_msgSend(v3, "safelyAddObject:", self->_dueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_totalCost);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalInterestAndFeesAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_feeDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_interestDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_downpaymentDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceProviderData);
  objc_msgSend(v3, "safelyAddObject:", self->_dynamicContent);
  objc_msgSend(v3, "safelyAddObject:", self->_preferredLanguage);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_installmentCount - v4 + 32 * v4;
  v6 = self->_installmentPeriod - v5 + 32 * v5;
  v7 = self->_installmentInterval - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("serviceProviderURL: '%@'; "), self->_serviceProviderURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("dueDate: '%@'; "), self->_dueDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalCost: '%@'; "), self->_totalCost);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalInterestAndFeesAmount: '%@'; "), self->_totalInterestAndFeesAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAmount: '%@'; "), self->_installmentAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentCount: %ld; "), self->_installmentCount);
  PKPaymentOfferPeriodToString(self->_installmentPeriod);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentPeriod: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("installmentInterval: %ld; "), self->_installmentInterval);
  objc_msgSend(v3, "appendFormat:", CFSTR("feeDetails: '%@'; "), self->_feeDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("interestDetails: '%@'; "), self->_interestDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("downpaymentDetails: '%@'; "), self->_downpaymentDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("serviceProviderData: '%@'; "), self->_serviceProviderData);
  objc_msgSend(v3, "appendFormat:", CFSTR("dynamicContent: '%@'; "), self->_dynamicContent);
  objc_msgSend(v3, "appendFormat:", CFSTR("preferredLanguage: '%@'; "), self->_preferredLanguage);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentAssessmentOffer)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentAssessmentOffer *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *serviceProviderURL;
  uint64_t v10;
  NSDate *dueDate;
  uint64_t v12;
  PKCurrencyAmount *totalCost;
  uint64_t v14;
  PKCurrencyAmount *installmentAmount;
  uint64_t v16;
  PKPaymentOfferInstallmentFeeDetails *feeDetails;
  uint64_t v18;
  PKPaymentOfferInstallmentDownpaymentDetails *downpaymentDetails;
  uint64_t v20;
  PKCurrencyAmount *totalInterestAndFeesAmount;
  uint64_t v22;
  PKPaymentOfferInstallmentInterestDetails *interestDetails;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *serviceProviderData;
  uint64_t v31;
  PKPaymentOfferDynamicContent *dynamicContent;
  uint64_t v33;
  NSString *preferredLanguage;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentOfferInstallmentAssessmentOffer;
  v5 = -[PKPaymentOfferInstallmentAssessmentOffer init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProviderURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceProviderURL = v5->_serviceProviderURL;
    v5->_serviceProviderURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalCost"));
    v12 = objc_claimAutoreleasedReturnValue();
    totalCost = v5->_totalCost;
    v5->_totalCost = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v14;

    v5->_installmentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentCount"));
    v5->_installmentPeriod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentPeriod"));
    v5->_installmentInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentInterval"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feeDetails"));
    v16 = objc_claimAutoreleasedReturnValue();
    feeDetails = v5->_feeDetails;
    v5->_feeDetails = (PKPaymentOfferInstallmentFeeDetails *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downpaymentDetails"));
    v18 = objc_claimAutoreleasedReturnValue();
    downpaymentDetails = v5->_downpaymentDetails;
    v5->_downpaymentDetails = (PKPaymentOfferInstallmentDownpaymentDetails *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalInterestAndFeesAmount"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalInterestAndFeesAmount = v5->_totalInterestAndFeesAmount;
    v5->_totalInterestAndFeesAmount = (PKCurrencyAmount *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestDetails"));
    v22 = objc_claimAutoreleasedReturnValue();
    interestDetails = v5->_interestDetails;
    v5->_interestDetails = (PKPaymentOfferInstallmentInterestDetails *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("serviceProviderData"));
    v29 = objc_claimAutoreleasedReturnValue();
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (NSDictionary *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicContent"));
    v31 = objc_claimAutoreleasedReturnValue();
    dynamicContent = v5->_dynamicContent;
    v5->_dynamicContent = (PKPaymentOfferDynamicContent *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredLanguage"));
    v33 = objc_claimAutoreleasedReturnValue();
    preferredLanguage = v5->_preferredLanguage;
    v5->_preferredLanguage = (NSString *)v33;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProviderURL, CFSTR("serviceProviderURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDate, CFSTR("dueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalCost, CFSTR("totalCost"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentAmount, CFSTR("installmentAmount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installmentCount, CFSTR("installmentCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installmentPeriod, CFSTR("installmentPeriod"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installmentInterval, CFSTR("installmentInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feeDetails, CFSTR("feeDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downpaymentDetails, CFSTR("downpaymentDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalInterestAndFeesAmount, CFSTR("totalInterestAndFeesAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestDetails, CFSTR("interestDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProviderData, CFSTR("serviceProviderData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicContent, CFSTR("dynamicContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredLanguage, CFSTR("preferredLanguage"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentAssessmentOffer *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *serviceProviderURL;
  uint64_t v10;
  NSDate *dueDate;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *totalCost;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *installmentAmount;
  PKPaymentOfferInstallmentFeeDetails *v16;
  PKPaymentOfferInstallmentFeeDetails *feeDetails;
  PKPaymentOfferInstallmentDownpaymentDetails *v18;
  PKPaymentOfferInstallmentDownpaymentDetails *downpaymentDetails;
  PKCurrencyAmount *v20;
  PKCurrencyAmount *totalInterestAndFeesAmount;
  PKPaymentOfferInstallmentInterestDetails *v22;
  PKPaymentOfferInstallmentInterestDetails *interestDetails;
  uint64_t v24;
  NSDictionary *serviceProviderData;
  PKPaymentOfferDynamicContent *v26;
  PKPaymentOfferDynamicContent *dynamicContent;
  uint64_t v28;
  NSString *preferredLanguage;

  v5 = -[PKPaymentOfferInstallmentAssessmentOffer init](+[PKPaymentOfferInstallmentAssessmentOffer allocWithZone:](PKPaymentOfferInstallmentAssessmentOffer, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSURL copyWithZone:](self->_serviceProviderURL, "copyWithZone:", a3);
  serviceProviderURL = v5->_serviceProviderURL;
  v5->_serviceProviderURL = (NSURL *)v8;

  v10 = -[NSDate copyWithZone:](self->_dueDate, "copyWithZone:", a3);
  dueDate = v5->_dueDate;
  v5->_dueDate = (NSDate *)v10;

  v12 = -[PKCurrencyAmount copyWithZone:](self->_totalCost, "copyWithZone:", a3);
  totalCost = v5->_totalCost;
  v5->_totalCost = v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_installmentAmount, "copyWithZone:", a3);
  installmentAmount = v5->_installmentAmount;
  v5->_installmentAmount = v14;

  v5->_installmentCount = self->_installmentCount;
  v5->_installmentPeriod = self->_installmentPeriod;
  v5->_installmentInterval = self->_installmentInterval;
  v16 = -[PKPaymentOfferInstallmentFeeDetails copyWithZone:](self->_feeDetails, "copyWithZone:", a3);
  feeDetails = v5->_feeDetails;
  v5->_feeDetails = v16;

  v18 = -[PKPaymentOfferInstallmentDownpaymentDetails copyWithZone:](self->_downpaymentDetails, "copyWithZone:", a3);
  downpaymentDetails = v5->_downpaymentDetails;
  v5->_downpaymentDetails = v18;

  v20 = -[PKCurrencyAmount copyWithZone:](self->_totalInterestAndFeesAmount, "copyWithZone:", a3);
  totalInterestAndFeesAmount = v5->_totalInterestAndFeesAmount;
  v5->_totalInterestAndFeesAmount = v20;

  v22 = -[PKPaymentOfferInstallmentInterestDetails copyWithZone:](self->_interestDetails, "copyWithZone:", a3);
  interestDetails = v5->_interestDetails;
  v5->_interestDetails = v22;

  v24 = -[NSDictionary copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  serviceProviderData = v5->_serviceProviderData;
  v5->_serviceProviderData = (NSDictionary *)v24;

  v26 = -[PKPaymentOfferDynamicContent copyWithZone:](self->_dynamicContent, "copyWithZone:", a3);
  dynamicContent = v5->_dynamicContent;
  v5->_dynamicContent = v26;

  v28 = -[NSString copyWithZone:](self->_preferredLanguage, "copyWithZone:", a3);
  preferredLanguage = v5->_preferredLanguage;
  v5->_preferredLanguage = (NSString *)v28;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)serviceProviderURL
{
  return self->_serviceProviderURL;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (PKCurrencyAmount)totalCost
{
  return self->_totalCost;
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (unint64_t)installmentPeriod
{
  return self->_installmentPeriod;
}

- (int64_t)installmentInterval
{
  return self->_installmentInterval;
}

- (PKCurrencyAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (PKPaymentOfferInstallmentFeeDetails)feeDetails
{
  return self->_feeDetails;
}

- (PKPaymentOfferInstallmentInterestDetails)interestDetails
{
  return self->_interestDetails;
}

- (PKPaymentOfferInstallmentDownpaymentDetails)downpaymentDetails
{
  return self->_downpaymentDetails;
}

- (PKCurrencyAmount)totalInterestAndFeesAmount
{
  return self->_totalInterestAndFeesAmount;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (void)setPreferredLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_totalInterestAndFeesAmount, 0);
  objc_storeStrong((id *)&self->_downpaymentDetails, 0);
  objc_storeStrong((id *)&self->_interestDetails, 0);
  objc_storeStrong((id *)&self->_feeDetails, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
  objc_storeStrong((id *)&self->_totalCost, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_serviceProviderURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
