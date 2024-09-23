@implementation PKSharingCarKeyInvitation

- (PKSharingCarKeyInvitation)initWithRawInvite:(id)a3 shareIdentifier:(id)a4 radioTechnology:(unint64_t)a5 vehicleModel:(id)a6 vehicleIssuer:(id)a7 readerIdentifier:(id)a8 partnerIdentifier:(id)a9 brandIdentifier:(id)a10 carKeySharingDict:(id)a11 proprietaryData:(id)a12 activationOptions:(id)a13 displayInformation:(id)a14
{
  PKSharingCarKeyInvitation *v14;
  PKSharingCarKeyInvitation *v15;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  PKSharingCarKeyInvitation *v37;
  id v39;
  objc_class *v41;
  id v42;
  id v43;
  char v44;
  id v45;
  objc_super v46;

  v14 = self;
  v15 = 0;
  if (a3 && a4)
  {
    v41 = (objc_class *)MEMORY[0x1E0C99E08];
    v44 = a5;
    v39 = a14;
    v42 = a13;
    v45 = a12;
    v21 = a11;
    v22 = a10;
    v23 = a9;
    v24 = a8;
    v43 = a7;
    v25 = a6;
    v26 = a4;
    v27 = a3;
    v28 = objc_alloc_init(v41);
    objc_msgSend(v27, "hexEncoding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("sharingData"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("sharingId"));

    objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("model"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, CFSTR("brand"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, CFSTR("vehicleIdentifier"));
    +[PKSharingCarKeyInvitation _mergeActivationOptions:intoDictionary:](PKSharingCarKeyInvitation, "_mergeActivationOptions:intoDictionary:", v42, v28);

    v30 = (void *)objc_msgSend(v21, "mutableCopy");
    PKRadioTechnologiesToString(v44);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("radioTechnologies"));

    objc_msgSend(v30, "setObject:forKeyedSubscript:", v25, CFSTR("vehicleModel"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v43, CFSTR("vehicleIssuer"));

    objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, CFSTR("readerIdentifier"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v23, CFSTR("partnerIdentifier"));

    objc_msgSend(v30, "setObject:forKeyedSubscript:", v22, CFSTR("brandIdentifier"));
    objc_msgSend(v45, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(v32, "mutableCopy");
    v34 = v33;
    if (v33)
      v35 = v33;
    else
      v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = v35;

    objc_msgSend(v36, "setObject:forKeyedSubscript:", v30, CFSTR("carKey"));
    v46.receiver = self;
    v46.super_class = (Class)PKSharingCarKeyInvitation;
    v37 = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:](&v46, sel_initWithFormat_type_genericSharingDict_appleSharingDict_displayInformation_, 2, 1, v28, v36, v39);

    v14 = v37;
    v15 = v14;
  }

  return v15;
}

- (BOOL)configureWithContent:(id)a3
{
  _BOOL4 v4;
  PKSharingMesageProprietaryData *v5;
  void *v6;
  PKSharingMesageProprietaryData *v7;
  PKSharingMesageProprietaryData *proprietaryData;
  void *v9;
  PKPassShareActivationOptions *v10;
  PKPassShareActivationOptions *activationOptions;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKSharingCarKeyInvitation;
  v4 = -[PKSharingCarKeyMessage configureWithContent:](&v13, sel_configureWithContent_, a3);
  if (v4)
  {
    v5 = [PKSharingMesageProprietaryData alloc];
    -[PKSharingGenericMessage appleSharingDict](self, "appleSharingDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKSharingMesageProprietaryData initWithDictionary:](v5, "initWithDictionary:", v6);
    proprietaryData = self->_proprietaryData;
    self->_proprietaryData = v7;

    -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSharingCarKeyInvitation _activationOptionsFromDictionary:](PKSharingCarKeyInvitation, "_activationOptionsFromDictionary:", v9);
    v10 = (PKPassShareActivationOptions *)objc_claimAutoreleasedReturnValue();
    activationOptions = self->_activationOptions;
    self->_activationOptions = v10;

  }
  return v4;
}

- (unint64_t)radioTechnology
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKStringForKey:", CFSTR("radioTechnologies"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = PKRadioTechnologiesFromString(v3);
  return v4;
}

- (NSString)vehicleModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PKStringForKey:", CFSTR("vehicleModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PKStringForKey:", CFSTR("model"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)vehicleIssuer
{
  void *v2;
  void *v3;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKStringForKey:", CFSTR("vehicleIssuer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)readerIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PKStringForKey:", CFSTR("readerIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PKStringForKey:", CFSTR("vehicleIdentifier"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)partnerIdentifier
{
  void *v2;
  void *v3;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKStringForKey:", CFSTR("partnerIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)brandIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PKStringForKey:", CFSTR("brandIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "PKStringForKey:", CFSTR("brand"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

+ (void)_mergeActivationOptions:(id)a3 intoDictionary:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (objc_msgSend(v5, "containsOptionOfType:", 1))
    {
      v7 = CFSTR("DevicePIN");
      objc_msgSend(v5, "optionOfType:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "valueLength");
      if (v9)
      {
        v10 = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("pinLength"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("pinCodeLength"));

      }
    }
    else
    {
      v7 = CFSTR("VehicleActivation");
      objc_msgSend(v5, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("activationOptions"));
    }

    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("authType"));

  }
}

+ (id)_activationOptionsFromDictionary:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  BOOL v8;
  PKPassShareActivationOptions *v9;
  int v10;
  PKPassShareActivationOption *v11;
  void *v12;
  PKPassShareActivationOptions *v13;
  void *v14;
  BOOL v15;
  char v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(v3, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("authType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("DevicePIN");
    if (v5 == v6)
    {

LABEL_12:
      v11 = -[PKPassShareActivationOption initWithDefaultIdentifierForType:]([PKPassShareActivationOption alloc], "initWithDefaultIdentifierForType:", 1);
      objc_msgSend(v3, "PKNumberForKey:", CFSTR("pinLength"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (objc_msgSend(v3, "PKNumberForKey:", CFSTR("pinCodeLength")),
            (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[PKPassShareActivationOption setValueLength:](v11, "setValueLength:", objc_msgSend(v12, "integerValue"));

      }
      v13 = [PKPassShareActivationOptions alloc];
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPassShareActivationOptions initWithOptions:](v13, "initWithOptions:", v14);

      goto LABEL_25;
    }
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

    }
    else
    {
      v10 = -[__CFString isEqualToString:](v5, "isEqualToString:", v6);

      if (v10)
        goto LABEL_12;
    }
    if (v5)
      v15 = CFSTR("VehicleActivation") == 0;
    else
      v15 = 1;
    if (v15)
    {
      if (v5 == CFSTR("VehicleActivation"))
      {
LABEL_24:
        objc_msgSend(v3, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("activationOptions"));
        v11 = (PKPassShareActivationOption *)objc_claimAutoreleasedReturnValue();
        v9 = -[PKPassShareActivationOptions initWithCarKeyIdentifiers:]([PKPassShareActivationOptions alloc], "initWithCarKeyIdentifiers:", v11);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      v16 = -[__CFString isEqual:](v5, "isEqual:");
      if ((v16 & 1) != 0)
        goto LABEL_24;
    }
    v9 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v9 = 0;
LABEL_27:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMesageProprietaryData)proprietaryData
{
  return self->_proprietaryData;
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_proprietaryData, 0);
}

@end
