@implementation PKPaymentOfferInstallmentAssessment

- (PKPaymentOfferInstallmentAssessment)initWithDictionary:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  PKPaymentOfferInstallmentAssessment *v8;
  PKPaymentOfferInstallmentAssessment *v9;
  uint64_t v10;
  NSString *identifier;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PKPaymentOfferInstallmentAssessmentOffer *v18;
  __CFString *v19;
  __CFString *v20;
  char v21;
  uint64_t v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  char v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  char v46;
  __CFString *v47;
  __CFString *v48;
  int v49;
  uint64_t v50;
  NSArray *offers;
  uint64_t v52;
  NSString *selectedOfferIdentifier;
  void *v54;
  PKPaymentOfferDynamicContent *v55;
  PKPaymentOfferDynamicContent *dynamicContent;
  void *v57;
  PKPaymentOfferAction *v58;
  PKPaymentOfferAction *action;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)PKPaymentOfferInstallmentAssessment;
  v8 = -[PKPaymentOfferInstallmentAssessment init](&v65, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_49;
  objc_storeStrong((id *)&v8->_sessionIdentifier, a4);
  objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
  v10 = objc_claimAutoreleasedReturnValue();
  identifier = v9->_identifier;
  v9->_identifier = (NSString *)v10;

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("offers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v62;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v62 != v16)
          objc_enumerationMutation(v13);
        v18 = -[PKPaymentOfferInstallmentAssessmentOffer initWithDictionary:]([PKPaymentOfferInstallmentAssessmentOffer alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v17));
        objc_msgSend(v12, "safelyAddObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v15);
  }
  objc_msgSend(v6, "PKStringForKey:", CFSTR("offerEligibility"));
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 == CFSTR("eligible"))
    goto LABEL_12;
  if (!v19)
  {
LABEL_40:
    v22 = 0;
    goto LABEL_41;
  }
  v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("eligible"));

  if ((v21 & 1) == 0)
  {
    v23 = v20;
    if (v23 == CFSTR("notEligible")
      || (v24 = v23,
          v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("notEligible")),
          v24,
          (v25 & 1) != 0))
    {
      v22 = 2;
      goto LABEL_41;
    }
    v26 = v24;
    if (v26 == CFSTR("insufficientCredit")
      || (v27 = v26,
          v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("insufficientCredit")),
          v27,
          (v28 & 1) != 0))
    {
      v22 = 3;
      goto LABEL_41;
    }
    v29 = v27;
    if (v29 == CFSTR("merchantNotSupported")
      || (v30 = v29,
          v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("merchantNotSupported")),
          v30,
          (v31 & 1) != 0))
    {
      v22 = 4;
      goto LABEL_41;
    }
    v32 = v30;
    if (v32 == CFSTR("purchaseAmountIneligible")
      || (v33 = v32,
          v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("purchaseAmountIneligible")),
          v33,
          (v34 & 1) != 0))
    {
      v22 = 5;
      goto LABEL_41;
    }
    v35 = v33;
    if (v35 == CFSTR("accountRestricted")
      || (v36 = v35,
          v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("accountRestricted")),
          v36,
          (v37 & 1) != 0))
    {
      v22 = 6;
      goto LABEL_41;
    }
    v38 = v36;
    if (v38 == CFSTR("userIneligible")
      || (v39 = v38,
          v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("userIneligible")),
          v39,
          (v40 & 1) != 0))
    {
      v22 = 7;
      goto LABEL_41;
    }
    v41 = v39;
    if (v41 == CFSTR("fraudSuspected")
      || (v42 = v41,
          v43 = -[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("fraudSuspected")),
          v42,
          (v43 & 1) != 0))
    {
      v22 = 8;
      goto LABEL_41;
    }
    v44 = v42;
    if (v44 == CFSTR("notSupportedForCard")
      || (v45 = v44,
          v46 = -[__CFString isEqualToString:](v44, "isEqualToString:", CFSTR("notSupportedForCard")),
          v45,
          (v46 & 1) != 0))
    {
      v22 = 9;
      goto LABEL_41;
    }
    v47 = v45;
    if (v47 == CFSTR("systemError")
      || (v48 = v47,
          v49 = -[__CFString isEqualToString:](v47, "isEqualToString:", CFSTR("systemError")),
          v48,
          v49))
    {
      v22 = 10;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_12:
  v22 = 1;
LABEL_41:

  v9->_offerEligibility = v22;
  if (objc_msgSend(v12, "count"))
  {
    v50 = objc_msgSend(v12, "copy");
    offers = v9->_offers;
    v9->_offers = (NSArray *)v50;
  }
  else
  {
    offers = v9->_offers;
    v9->_offers = 0;
  }

  objc_msgSend(v6, "PKStringForKey:", CFSTR("selectedOfferIdentifier"));
  v52 = objc_claimAutoreleasedReturnValue();
  selectedOfferIdentifier = v9->_selectedOfferIdentifier;
  v9->_selectedOfferIdentifier = (NSString *)v52;

  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("dynamicContent"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "count"))
  {
    v55 = -[PKPaymentOfferDynamicContent initWithDictionary:]([PKPaymentOfferDynamicContent alloc], "initWithDictionary:", v54);
    dynamicContent = v9->_dynamicContent;
    v9->_dynamicContent = v55;

  }
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("action"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v57, "count"))
  {
    v58 = -[PKPaymentOfferAction initWithDictionary:]([PKPaymentOfferAction alloc], "initWithDictionary:", v57);
    action = v9->_action;
    v9->_action = v58;

  }
LABEL_49:

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  v4 = self->_offerEligibility - 1;
  if (v4 > 9)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD7B98[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("offerEligibility"));
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_offers, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_181);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("offers"));

  -[PKPaymentOfferAction dictionaryRepresentation](self->_action, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("action"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_selectedOfferIdentifier, CFSTR("selectedOfferIdentifier"));
  -[PKPaymentOfferDynamicContent dictionaryRepresentation](self->_dynamicContent, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dynamicContent"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

uint64_t __63__PKPaymentOfferInstallmentAssessment_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (id)installmentOfferWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSArray *offers;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    offers = self->_offers;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__PKPaymentOfferInstallmentAssessment_installmentOfferWithIdentifier___block_invoke;
    v9[3] = &unk_1E2AD7B78;
    v10 = v4;
    -[NSArray pk_firstObjectPassingTest:](offers, "pk_firstObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __70__PKPaymentOfferInstallmentAssessment_installmentOfferWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (BOOL)isEligible
{
  return self->_offerEligibility == 1;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentAssessment *v4;
  PKPaymentOfferInstallmentAssessment *v5;
  PKPaymentOfferInstallmentAssessment *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  char v12;
  NSString *sessionIdentifier;
  NSString *v14;
  _BOOL4 v15;
  NSArray *offers;
  NSArray *v17;
  PKPaymentOfferAction *action;
  PKPaymentOfferAction *v19;
  NSString *selectedOfferIdentifier;
  NSString *v21;
  _BOOL4 v22;
  PKPaymentOfferDynamicContent *dynamicContent;
  PKPaymentOfferDynamicContent *v25;

  v4 = (PKPaymentOfferInstallmentAssessment *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
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
          if (!v8 || !v9)
            goto LABEL_34;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_35;
        }
        sessionIdentifier = v6->_sessionIdentifier;
        v8 = self->_sessionIdentifier;
        v14 = sessionIdentifier;
        if (v8 == v14)
        {

        }
        else
        {
          v10 = v14;
          if (!v8 || !v14)
            goto LABEL_34;
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_35;
        }
        if (self->_offerEligibility != v6->_offerEligibility)
          goto LABEL_35;
        offers = self->_offers;
        v17 = v6->_offers;
        if (offers && v17)
        {
          if ((-[NSArray isEqual:](offers, "isEqual:") & 1) == 0)
            goto LABEL_35;
        }
        else if (offers != v17)
        {
          goto LABEL_35;
        }
        action = self->_action;
        v19 = v6->_action;
        if (action && v19)
        {
          if (!-[PKPaymentOfferAction isEqual:](action, "isEqual:"))
            goto LABEL_35;
        }
        else if (action != v19)
        {
          goto LABEL_35;
        }
        selectedOfferIdentifier = v6->_selectedOfferIdentifier;
        v8 = self->_selectedOfferIdentifier;
        v21 = selectedOfferIdentifier;
        if (v8 == v21)
        {

LABEL_39:
          dynamicContent = self->_dynamicContent;
          v25 = v6->_dynamicContent;
          if (dynamicContent && v25)
            v12 = -[PKPaymentOfferDynamicContent isEqual:](dynamicContent, "isEqual:");
          else
            v12 = dynamicContent == v25;
          goto LABEL_36;
        }
        v10 = v21;
        if (v8 && v21)
        {
          v22 = -[NSString isEqualToString:](v8, "isEqualToString:", v21);

          if (v22)
            goto LABEL_39;
LABEL_35:
          v12 = 0;
LABEL_36:

          goto LABEL_37;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    v12 = 0;
  }
LABEL_37:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_sessionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_offers);
  objc_msgSend(v3, "safelyAddObject:", self->_action);
  objc_msgSend(v3, "safelyAddObject:", self->_selectedOfferIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_dynamicContent);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_offerEligibility - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionIdentifier: '%@'; "), self->_sessionIdentifier);
  v4 = self->_offerEligibility - 1;
  if (v4 > 9)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD7B98[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("offerEligibility: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("offers: '%@'; "), self->_offers);
  objc_msgSend(v3, "appendFormat:", CFSTR("action: '%@'; "), self->_action);
  objc_msgSend(v3, "appendFormat:", CFSTR("selectedOfferIdentifier: '%@'; "), self->_selectedOfferIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("dynamicContent: '%@'; "), self->_dynamicContent);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentAssessment)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentAssessment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *sessionIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *offers;
  uint64_t v15;
  PKPaymentOfferAction *action;
  uint64_t v17;
  NSString *selectedOfferIdentifier;
  uint64_t v19;
  PKPaymentOfferDynamicContent *dynamicContent;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentOfferInstallmentAssessment;
  v5 = -[PKPaymentOfferInstallmentAssessment init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v8;

    v5->_offerEligibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offerEligibility"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("offers"));
    v13 = objc_claimAutoreleasedReturnValue();
    offers = v5->_offers;
    v5->_offers = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v15 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (PKPaymentOfferAction *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedOfferIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    selectedOfferIdentifier = v5->_selectedOfferIdentifier;
    v5->_selectedOfferIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicContent"));
    v19 = objc_claimAutoreleasedReturnValue();
    dynamicContent = v5->_dynamicContent;
    v5->_dynamicContent = (PKPaymentOfferDynamicContent *)v19;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_offerEligibility, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offers, CFSTR("offers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedOfferIdentifier, CFSTR("selectedOfferIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicContent, CFSTR("dynamicContent"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentAssessment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *sessionIdentifier;
  uint64_t v10;
  NSArray *offers;
  PKPaymentOfferAction *v12;
  PKPaymentOfferAction *action;
  uint64_t v14;
  NSString *selectedOfferIdentifier;
  PKPaymentOfferDynamicContent *v16;
  PKPaymentOfferDynamicContent *dynamicContent;

  v5 = -[PKPaymentOfferInstallmentAssessment init](+[PKPaymentOfferInstallmentAssessment allocWithZone:](PKPaymentOfferInstallmentAssessment, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v8;

  v5->_offerEligibility = self->_offerEligibility;
  v10 = -[NSArray copyWithZone:](self->_offers, "copyWithZone:", a3);
  offers = v5->_offers;
  v5->_offers = (NSArray *)v10;

  v12 = -[PKPaymentOfferAction copyWithZone:](self->_action, "copyWithZone:", a3);
  action = v5->_action;
  v5->_action = v12;

  v14 = -[NSString copyWithZone:](self->_selectedOfferIdentifier, "copyWithZone:", a3);
  selectedOfferIdentifier = v5->_selectedOfferIdentifier;
  v5->_selectedOfferIdentifier = (NSString *)v14;

  v16 = -[PKPaymentOfferDynamicContent copyWithZone:](self->_dynamicContent, "copyWithZone:", a3);
  dynamicContent = v5->_dynamicContent;
  v5->_dynamicContent = v16;

  return v5;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)offerEligibility
{
  return self->_offerEligibility;
}

- (NSArray)offers
{
  return self->_offers;
}

- (PKPaymentOfferAction)action
{
  return self->_action;
}

- (NSString)selectedOfferIdentifier
{
  return self->_selectedOfferIdentifier;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_selectedOfferIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
