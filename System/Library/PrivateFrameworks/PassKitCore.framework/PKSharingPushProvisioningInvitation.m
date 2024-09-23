@implementation PKSharingPushProvisioningInvitation

- (PKSharingPushProvisioningInvitation)initWithDisplayInformation:(id)a3 provisioningVouchersByOEM:(id)a4 activationOptions:(id)a5 proprietaryData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  PKSharingPushProvisioningInvitation *v31;
  void *v33;
  NSObject *v34;
  id v35;
  PKSharingPushProvisioningInvitation *v36;
  id v37;
  id v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("appleAuthorizationToken"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v11, "mutableCopy");
      v16 = v12;
      v17 = v16;
      v18 = 0;
      if (self && v16)
      {
        v34 = v15;
        v35 = v12;
        v36 = self;
        v37 = v11;
        v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v33 = v17;
        objc_msgSend(v17, "options");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v41 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
              if (objc_msgSend(v24, "type") == 1)
              {
                v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("pinCode"), CFSTR("type"));
                objc_msgSend(v24, "value");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("value"));

                v27 = objc_msgSend(v24, "valueLength");
                if (v27)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("length"));

                }
                objc_msgSend(v38, "addObject:", v25);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
          }
          while (v21);
        }

        v18 = (void *)objc_msgSend(v38, "copy");
        v11 = v37;
        v12 = v35;
        self = v36;
        v15 = v34;
        v17 = v33;
      }

      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("activationOptions"));
      v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v15, CFSTR("genericData"));
      objc_msgSend(v13, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("apple"));

      v39.receiver = self;
      v39.super_class = (Class)PKSharingPushProvisioningInvitation;
      self = -[PKSharingMessage initWithContent:format:type:displayInformation:](&v39, sel_initWithContent_format_type_displayInformation_, v29, 1, 1, v10);

      v31 = self;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v11;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKSharingPushProvisioningInvitation: provisioningDict missing Apple provisioning information. \n %@", buf, 0xCu);
      }
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  PKPushProvisioningTarget *v8;
  PKShareablePassMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *metadatas;
  id v16;
  PKPassShareActivationOptions *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __CFString *v23;
  PKPassShareActivationOption *v24;
  int v25;
  void *v26;
  PKPassShareActivationOptions *activationOptions;
  PKSharingMesageProprietaryData *v28;
  void *v29;
  PKSharingMesageProprietaryData *v30;
  PKSharingMesageProprietaryData *proprietaryData;
  id v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  id obj;
  id v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  PKShareablePassMetadata *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKSharingPushProvisioningInvitation;
  v5 = -[PKSharingMessage configureWithContent:](&v40, sel_configureWithContent_, v4);
  if (!v5)
    goto LABEL_25;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("genericData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("appleAuthorizationToken"));
  v7 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v7;
  if (v7)
  {
    v8 = -[PKPushProvisioningTarget initWithProvisioningDict:]([PKPushProvisioningTarget alloc], "initWithProvisioningDict:", v7);
    -[PKPushProvisioningTarget setSecondarySource:](v8, "setSecondarySource:", CFSTR("share"));
    v9 = -[PKShareablePassMetadata initWithPushProvisioningTarget:]([PKShareablePassMetadata alloc], "initWithPushProvisioningTarget:", v8);
    -[PKShareablePassMetadata preview](v9, "preview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessage displayInformation](self, "displayInformation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocalizedDescription:", v12);

    objc_msgSend(v11, "imageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setThumbnailURL:", v13);

    v45 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    metadatas = self->_metadatas;
    self->_metadatas = v14;

  }
  else
  {
    v8 = (PKPushProvisioningTarget *)self->_metadatas;
    self->_metadatas = (NSArray *)MEMORY[0x1E0C9AA60];
  }

  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("activationOptions"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = 0;
    goto LABEL_24;
  }
  v34 = v6;
  v35 = v5;
  v36 = v4;
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v33 = v16;
  obj = v16;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v18)
    goto LABEL_23;
  v19 = v18;
  v20 = *(_QWORD *)v42;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v42 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v22, "PKStringForKey:", CFSTR("type"), v33);
      v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      if (v23 == CFSTR("pinCode"))
      {

LABEL_18:
        v24 = -[PKPassShareActivationOption initWithDefaultIdentifierForType:]([PKPassShareActivationOption alloc], "initWithDefaultIdentifierForType:", 1);
        objc_msgSend(v22, "PKStringForKey:", CFSTR("value"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassShareActivationOption setValue:](v24, "setValue:", v26);

        -[PKPassShareActivationOption setValueLength:](v24, "setValueLength:", objc_msgSend(v22, "PKIntegerForKey:", CFSTR("length")));
        objc_msgSend(v39, "addObject:", v24);
LABEL_20:

        continue;
      }
      v24 = (PKPassShareActivationOption *)v23;
      if (!CFSTR("pinCode") || !v23)
      {

        goto LABEL_20;
      }
      v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("pinCode"));

      if (v25)
        goto LABEL_18;
    }
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  }
  while (v19);
LABEL_23:

  v17 = -[PKPassShareActivationOptions initWithOptions:]([PKPassShareActivationOptions alloc], "initWithOptions:", v39);
  v4 = v36;
  LOBYTE(v5) = v35;
  v6 = v34;
  v16 = v33;
LABEL_24:

  activationOptions = self->_activationOptions;
  self->_activationOptions = v17;

  v28 = [PKSharingMesageProprietaryData alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("apple"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PKSharingMesageProprietaryData initWithDictionary:](v28, "initWithDictionary:", v29);
  proprietaryData = self->_proprietaryData;
  self->_proprietaryData = v30;

  -[PKSharingMessage setType:](self, "setType:", 1);
LABEL_25:

  return v5;
}

- (NSString)provisioningCredentialHash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSArray firstObject](self->_metadatas, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "SHA256Hash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessage identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKSharingMessageTypeToString(-[PKSharingMessage type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  -[PKSharingMessage displayInformation](self, "displayInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("displayInformation: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("metadatas: '%@'; "), self->_metadatas);
  objc_msgSend(v3, "appendFormat:", CFSTR("activationOptions: '%@'; "), self->_activationOptions);
  objc_msgSend(v3, "appendFormat:", CFSTR("proprietaryData: '%@'; "), self->_proprietaryData);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingPushProvisioningInvitation *v4;
  PKSharingPushProvisioningInvitation *v5;
  PKSharingPushProvisioningInvitation *v6;
  NSArray *metadatas;
  NSArray *v8;
  BOOL v9;
  objc_super v11;

  v4 = (PKSharingPushProvisioningInvitation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKSharingPushProvisioningInvitation;
      if (-[PKSharingPushProvisioningInvitation isEqual:](&v11, sel_isEqual_, v6))
      {
        metadatas = self->_metadatas;
        v8 = v6->_metadatas;
        if (metadatas)
          v9 = v8 == 0;
        else
          v9 = 1;
        if (v9)
          LOBYTE(self) = metadatas == v8;
        else
          LOBYTE(self) = -[NSArray isEqual:](metadatas, "isEqual:");
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)metadatas
{
  return self->_metadatas;
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (PKSharingMesageProprietaryData)proprietaryData
{
  return self->_proprietaryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proprietaryData, 0);
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_metadatas, 0);
}

@end
