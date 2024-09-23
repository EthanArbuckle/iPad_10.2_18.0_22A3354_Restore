@implementation PKContactInformation

+ (id)contactInformationFromKeychain
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_keychainWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKeychainData:", v4);

  return v5;
}

+ (void)saveContactInformationToKeychain:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "keychainData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_keychainWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD70D8]);

  }
}

+ (void)deleteContactInformationFromKeychain
{
  id v2;

  objc_msgSend(a1, "_keychainWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetKeychainItem");

}

- (PKContactInformation)init
{
  return -[PKContactInformation initWithPostalAddresses:emailAddresses:phoneNumbers:](self, "initWithPostalAddresses:emailAddresses:phoneNumbers:", 0, 0, 0);
}

- (PKContactInformation)initWithPostalAddresses:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKContactInformation *v12;
  PKContactInformation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKContactInformation;
  v12 = -[PKContactInformation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_postalAddresses, a3);
    objc_storeStrong((id *)&v13->_emailAddresses, a4);
    objc_storeStrong((id *)&v13->_phoneNumbers, a5);
  }

  return v13;
}

- (PKContactInformation)initWithDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PKContactInformation *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  id v56;
  id obj;
  id obja;
  id objb;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  _BYTE v73[128];
  void *v74;
  _BYTE v75[128];
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "PKArrayForKey:", CFSTR("addresses"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0C99000uLL;
  v55 = (void *)v4;
  v56 = v3;
  if (v4)
  {
    v6 = (void *)v4;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v69;
      v11 = *MEMORY[0x1E0C97000];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v69 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
          v14 = objc_alloc_init(MEMORY[0x1E0C97360]);
          objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressFromWebServiceDictionaryRepresentation:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", v11, v15);
            v76 = v16;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setPostalAddresses:", v17);

            v18 = (void *)objc_msgSend(v14, "copy");
            objc_msgSend(v7, "addObject:", v18);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v9);
    }

    v19 = v7;
    if (objc_msgSend(v7, "count"))
      v53 = (void *)objc_msgSend(v7, "copy");
    else
      v53 = 0;
    v3 = v56;

    v5 = 0x1E0C99000uLL;
  }
  else
  {
    v53 = 0;
  }
  objc_msgSend(v3, "PKArrayForKey:", CFSTR("emails"));
  v20 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v20;
  if (v20)
  {
    v21 = (void *)v20;
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obja = v21;
    v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v65;
      v26 = *MEMORY[0x1E0C97000];
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v65 != v25)
            objc_enumerationMutation(obja);
          v28 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
          v29 = objc_alloc_init(MEMORY[0x1E0C97360]);
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", v26, v28);
          v74 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setEmailAddresses:", v31);

          v32 = (void *)objc_msgSend(v29, "copy");
          objc_msgSend(v22, "addObject:", v32);

        }
        v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      }
      while (v24);
    }

    v33 = (void *)objc_msgSend(v22, "copy");
    v3 = v56;
    v5 = 0x1E0C99000;
  }
  else
  {
    v33 = 0;
  }
  objc_msgSend(v3, "PKArrayForKey:", CFSTR("phoneNumbers"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v51 = v33;
    v35 = objc_alloc_init(*(Class *)(v5 + 3560));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v50 = v34;
    objb = v34;
    v36 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v61;
      v39 = *MEMORY[0x1E0C97000];
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v61 != v38)
            objc_enumerationMutation(objb);
          v41 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
          v42 = objc_alloc_init(MEMORY[0x1E0C97360]);
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v41);
          if (v43)
          {
            v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", v39, v43);
            v72 = v44;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setPhoneNumbers:", v45);

            v46 = (void *)objc_msgSend(v42, "copy");
            objc_msgSend(v35, "addObject:", v46);

          }
        }
        v37 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
      }
      while (v37);
    }

    if (objc_msgSend(v35, "count"))
      v47 = (void *)objc_msgSend(v35, "copy");
    else
      v47 = 0;
    v3 = v56;
    v33 = v51;

    v34 = v50;
  }
  else
  {
    v47 = 0;
  }
  v48 = -[PKContactInformation initWithPostalAddresses:emailAddresses:phoneNumbers:](self, "initWithPostalAddresses:emailAddresses:phoneNumbers:", v53, v33, v47, v50);

  return v48;
}

- (PKContactInformation)initWithKeychainData:(id)a3
{
  id v4;
  PKContactInformation *v5;
  id v6;
  void *v7;
  NSObject *v8;
  PKContactInformation *v9;
  id v11;
  uint8_t buf[4];
  PKContactInformation *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v5 = (PKContactInformation *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (!v6)
  {
LABEL_7:
    v5 = v5;
    v9 = v5;
    goto LABEL_8;
  }
  v7 = v6;
  PKLogFacilityTypeGetObject(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@: Error initializing from Keychain data: %@", buf, 0x16u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (id)keychainData
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;
  uint8_t buf[4];
  PKContactInformation *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%@: Error serializing data for Keychain: %@", buf, 0x16u);
    }

    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *postalAddresses;
  id v5;

  postalAddresses = self->_postalAddresses;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", postalAddresses, CFSTR("postalAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddresses, CFSTR("emailAddresses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumbers, CFSTR("phoneNumbers"));

}

- (PKContactInformation)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKContactInformation *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("postalAddresses"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("emailAddresses"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("phoneNumbers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PKContactInformation initWithPostalAddresses:emailAddresses:phoneNumbers:](self, "initWithPostalAddresses:emailAddresses:phoneNumbers:", v9, v10, v11);
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@; "), CFSTR("postalAddresses"), self->_postalAddresses);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@; "), CFSTR("emailAddresses"), self->_emailAddresses);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@; "), CFSTR("phoneNumbers"), self->_phoneNumbers);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)_keychainWrapper
{
  _BOOL4 v2;
  __CFString *v3;
  PKKeychainItemWrapper *v4;

  v2 = +[PKPaymentOptionsSynchronization shouldSyncToCloud](PKPaymentOptionsSynchronization, "shouldSyncToCloud");
  if (v2)
  {
    v3 = CFSTR("contactInformation");
  }
  else
  {
    objc_msgSend(CFSTR("contactInformation"), "stringByAppendingFormat:", CFSTR("Local"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:accessibility:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:accessibility:", v3, CFSTR("com.apple.PassbookUIService"), CFSTR("com.apple.passkit"), v2, 0, 1);
  -[PKKeychainItemWrapper setLabel:](v4, "setLabel:", CFSTR("com.apple.passkit"));

  return v4;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
}

@end
