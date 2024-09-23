@implementation PKCarUnlockSupportedTerminal

- (PKCarUnlockSupportedTerminal)initWithDictionary:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *associatedApplicationIdentifiers;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSString *v11;
  NSString *partnerIdentifier;
  NSString *v13;
  NSString *partnerName;
  NSString *v15;
  NSString *manufacturerIdentifier;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  PKPassAutomaticSelectionCriterion *v24;
  NSObject *v25;
  uint64_t v26;
  NSSet *terminalCriteria;
  PKCarUnlockSupportedTerminal *v28;
  NSObject *v29;
  const char *v30;
  PKCarUnlockSupportedTerminal *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameters to create supported terminal with";
    goto LABEL_32;
  }
  self = -[PKCarUnlockSupportedTerminal init](self, "init");
  if (self)
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedApplicationIdentifiers"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
    self->_associatedApplicationIdentifiers = v5;

    if (!-[NSArray count](self->_associatedApplicationIdentifiers, "count"))
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedApplicationIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
      {
        v40[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v10 = self->_associatedApplicationIdentifiers;
        self->_associatedApplicationIdentifiers = v9;

      }
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("partnerIdentifier"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    partnerIdentifier = self->_partnerIdentifier;
    self->_partnerIdentifier = v11;

    if (self->_partnerIdentifier)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("partnerName"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      partnerName = self->_partnerName;
      self->_partnerName = v13;

      if (self->_partnerName)
      {
        objc_msgSend(v4, "PKStringForKey:", CFSTR("manufacturerIdentifier"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        manufacturerIdentifier = self->_manufacturerIdentifier;
        self->_manufacturerIdentifier = v15;

        if (self->_manufacturerIdentifier)
        {
          v32 = self;
          objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("terminalCriteria"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v17, "count"));
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v19 = v17;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v34 != v22)
                  objc_enumerationMutation(v19);
                v24 = -[PKPassAutomaticSelectionCriterion initWithDictionary:]([PKPassAutomaticSelectionCriterion alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
                if (v24)
                {
                  objc_msgSend(v18, "addObject:", v24);
                }
                else
                {
                  PKLogFacilityTypeGetObject(0x16uLL);
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v38 = 0;
                    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Invalid terminal criterion: %@", buf, 0xCu);
                  }

                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
            }
            while (v21);
          }

          v26 = objc_msgSend(v18, "copy");
          self = v32;
          terminalCriteria = v32->_terminalCriteria;
          v32->_terminalCriteria = (NSSet *)v26;

          goto LABEL_23;
        }
        PKLogFacilityTypeGetObject(0x16uLL);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v30 = "Missing manufacturer identifier for supported terminal";
          goto LABEL_32;
        }
LABEL_33:

        v28 = 0;
        goto LABEL_34;
      }
      PKLogFacilityTypeGetObject(0x16uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_WORD *)buf = 0;
      v30 = "Missing partner name for supported terminal";
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_WORD *)buf = 0;
      v30 = "Missing partner ID for supported terminal";
    }
LABEL_32:
    _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_33;
  }
LABEL_23:
  self = self;
  v28 = self;
LABEL_34:

  return v28;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedAppIdentifiers: '%@'; "), self->_associatedApplicationIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("partnerIdentifier: '%@'; "), self->_partnerIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("manufacturerIdentifier: '%@'; "), self->_manufacturerIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("partnerName: '%@'; "), self->_partnerName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)vehicleInitiatedPairingLaunchURLWithReferralSource:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[PKCarUnlockSupportedTerminal partnerIdentifier](self, "partnerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKVehicleInitiatedPairingLaunchURL(v4, 1, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *associatedApplicationIdentifiers;
  id v5;

  associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedApplicationIdentifiers, CFSTR("associatedApplicationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partnerIdentifier, CFSTR("partnerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partnerName, CFSTR("partnerName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturerIdentifier, CFSTR("manufacturerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminalCriteria, CFSTR("terminalCriteria"));

}

- (PKCarUnlockSupportedTerminal)initWithCoder:(id)a3
{
  id v4;
  PKCarUnlockSupportedTerminal *v5;
  uint64_t v6;
  NSArray *associatedApplicationIdentifiers;
  uint64_t v8;
  NSString *partnerIdentifier;
  uint64_t v10;
  NSString *partnerName;
  uint64_t v12;
  NSString *manufacturerIdentifier;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSSet *terminalCriteria;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCarUnlockSupportedTerminal;
  v5 = -[PKCarUnlockSupportedTerminal init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("associatedApplicationIdentifiers"));
    v6 = objc_claimAutoreleasedReturnValue();
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerName"));
    v10 = objc_claimAutoreleasedReturnValue();
    partnerName = v5->_partnerName;
    v5->_partnerName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    manufacturerIdentifier = v5->_manufacturerIdentifier;
    v5->_manufacturerIdentifier = (NSString *)v12;

    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = (void *)objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("terminalCriteria"));
    v17 = objc_claimAutoreleasedReturnValue();
    terminalCriteria = v5->_terminalCriteria;
    v5->_terminalCriteria = (NSSet *)v17;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (NSString)partnerName
{
  return self->_partnerName;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (NSSet)terminalCriteria
{
  return self->_terminalCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalCriteria, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerName, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
}

@end
