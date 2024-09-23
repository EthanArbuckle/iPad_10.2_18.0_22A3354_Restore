@implementation PKPaymentOffersControllerRequest

- (PKPaymentOffersControllerRequest)initWithType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  PKPaymentOffersControllerRequest *v7;
  PKPaymentOffersControllerRequest *v8;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *completions;
  NSMutableOrderedSet *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOffersControllerRequest;
  v7 = -[PKPaymentOffersControllerRequest init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    completions = v8->_completions;
    v8->_completions = v9;

    v11 = v8->_completions;
    v12 = _Block_copy(v6);
    -[NSMutableOrderedSet pk_safelyAddObject:](v11, "pk_safelyAddObject:", v12);

  }
  return v8;
}

- (id)initPaymentOfferCatalogRequestWithCompletion:(id)a3
{
  return -[PKPaymentOffersControllerRequest initWithType:completion:](self, "initWithType:completion:", 0, a3);
}

- (id)initPaymentOfferRequestWithCriteriaIdentifierIdentifier:(id)a3 paymentPass:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  PKPaymentOffersControllerRequest *v13;
  PKPaymentOffersControllerRequest *v14;

  v11 = a3;
  v12 = a4;
  v13 = -[PKPaymentOffersControllerRequest initWithType:completion:](self, "initWithType:completion:", 1, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_criteriaIdentifier, a3);
    objc_storeStrong((id *)&v14->_paymentPass, a4);
    v14->_updateReason = a5;
  }

  return v14;
}

- (id)initDynamicContentRequestWithCriteriaIdentifier:(id)a3 pageTypes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  PKPaymentOffersControllerRequest *v10;
  uint64_t v11;
  NSString *criteriaIdentifier;
  uint64_t v13;
  NSSet *dynamicPageTypes;

  v8 = a3;
  v9 = a4;
  v10 = -[PKPaymentOffersControllerRequest initWithType:completion:](self, "initWithType:completion:", 2, a5);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    criteriaIdentifier = v10->_criteriaIdentifier;
    v10->_criteriaIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    dynamicPageTypes = v10->_dynamicPageTypes;
    v10->_dynamicPageTypes = (NSSet *)v13;

  }
  return v10;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4;
  void *v5;
  NSString *criteriaIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  NSSet *v17;
  NSSet *v18;
  NSSet *dynamicPageTypes;
  char v20;

  v4 = a3;
  if (objc_msgSend(v4, "type") != self->_type)
    goto LABEL_22;
  objc_msgSend(v4, "criteriaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  criteriaIdentifier = self->_criteriaIdentifier;
  v7 = v5;
  v8 = criteriaIdentifier;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  v9 = v8;
  if (v7 && v8)
  {
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_22;
LABEL_8:
    objc_msgSend(v4, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKObject uniqueID](self->_paymentPass, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 && v13)
    {
      v15 = objc_msgSend(v12, "isEqual:", v13);

      if ((v15 & 1) == 0)
        goto LABEL_22;
    }
    else
    {

      if (v12 != v14)
        goto LABEL_22;
    }
    objc_msgSend(v4, "dynamicPageTypes");
    v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    dynamicPageTypes = self->_dynamicPageTypes;
    if (v17 && dynamicPageTypes)
    {
      v20 = -[NSSet isEqual:](v17, "isEqual:", self->_dynamicPageTypes);

      if ((v20 & 1) == 0)
        goto LABEL_22;
    }
    else
    {

      if (v18 != dynamicPageTypes)
        goto LABEL_22;
    }
    if (objc_msgSend(v4, "updateReason") == self->_updateReason)
    {
      objc_msgSend(v4, "completions");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentOffersControllerRequest addCompletions:](self, "addCompletions:", v7);
      v16 = 1;
      goto LABEL_13;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }

  v16 = 0;
LABEL_13:

LABEL_23:
  return v16;
}

- (void)addCompletions:(id)a3
{
  NSMutableOrderedSet *completions;
  id v4;

  completions = self->_completions;
  objc_msgSend(a3, "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObjectsFromArray:](completions, "addObjectsFromArray:", v4);

}

- (id)description
{
  id v3;
  unint64_t type;
  const __CFString *v5;
  const __CFString *v6;
  PKPaymentPass *paymentPass;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  type = self->_type;
  if (type > 2)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AC9168[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);
  switch(self->_updateReason)
  {
    case 0uLL:
      goto LABEL_13;
    case 1uLL:
      v6 = CFSTR("fundingModeChanged");
      goto LABEL_12;
    case 2uLL:
      v6 = CFSTR("serverResponse");
      goto LABEL_12;
    case 3uLL:
      v6 = CFSTR("userSelection");
      goto LABEL_12;
    case 4uLL:
      v6 = CFSTR("handoff");
      goto LABEL_12;
    case 5uLL:
      v6 = CFSTR("amountChanged");
      goto LABEL_12;
    case 6uLL:
      v6 = CFSTR("passAdded");
      goto LABEL_12;
    default:
      v6 = CFSTR("unknown");
LABEL_12:
      objc_msgSend(v3, "appendFormat:", CFSTR("updateReason: '%@'; "), v6);
LABEL_13:
      if (self->_criteriaIdentifier)
        objc_msgSend(v3, "appendFormat:", CFSTR("criteriaIdentifier: '%@'; "), self->_criteriaIdentifier);
      paymentPass = self->_paymentPass;
      if (paymentPass)
      {
        -[PKObject uniqueID](paymentPass, "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("passUniqueID: '%@'; "), v8);

      }
      if (-[NSSet count](self->_dynamicPageTypes, "count"))
        objc_msgSend(v3, "appendFormat:", CFSTR("dynamicPageTypes: '%@'; "), self->_dynamicPageTypes);
      objc_msgSend(v3, "appendFormat:", CFSTR("completionCount: '%ld'; "),
        -[NSMutableOrderedSet count](self->_completions, "count"));
      objc_msgSend(v3, "appendFormat:", CFSTR(">"));
      return v3;
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (unint64_t)updateReason
{
  return self->_updateReason;
}

- (NSSet)dynamicPageTypes
{
  return self->_dynamicPageTypes;
}

- (NSOrderedSet)completions
{
  return &self->_completions->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicPageTypes, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
