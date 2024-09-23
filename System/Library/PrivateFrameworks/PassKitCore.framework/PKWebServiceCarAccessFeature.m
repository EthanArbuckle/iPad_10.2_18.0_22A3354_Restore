@implementation PKWebServiceCarAccessFeature

- (PKWebServiceCarAccessFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceCarAccessFeature *v7;
  void *v8;
  PKOSVersionRequirementRange *v9;
  uint64_t v10;
  PKOSVersionRequirementRange *v11;
  NSObject *v12;
  uint64_t v13;
  PKOSVersionRequirementRange *ownerSharingOSVersionRequirement;
  void *v15;
  PKOSVersionRequirementRange *v16;
  uint64_t v17;
  PKOSVersionRequirementRange *friendSharingOSVersionRequirement;
  NSObject *v19;
  PKWebServiceCarAccessFeature *v20;
  uint64_t v21;
  PKOSVersionRequirementRange *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  NSDictionary *brandIdentifierForBrandCode;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  PKCarUnlockSupportedTerminal *v36;
  NSObject *v37;
  uint64_t v38;
  NSArray *supportedTerminals;
  void *v41;
  void *v42;
  void *v43;
  PKWebServiceCarAccessFeature *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](self, "initWithFeatureType:dictionary:region:", 2, v6, a4);
  if (!v7)
    goto LABEL_28;
  objc_msgSend(v6, "objectForKey:", CFSTR("ownerSharingVersionRequirement"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [PKOSVersionRequirementRange alloc];
  if (!v8)
  {
    v13 = -[PKOSVersionRequirementRange initWithMinimumVersion:maximumVersion:](v9, "initWithMinimumVersion:maximumVersion:", 0, 0);
    ownerSharingOSVersionRequirement = v7->_ownerSharingOSVersionRequirement;
    v7->_ownerSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v13;

    goto LABEL_8;
  }
  v10 = -[PKOSVersionRequirementRange initWithDictionary:](v9, "initWithDictionary:", v8);
  v11 = v7->_ownerSharingOSVersionRequirement;
  v7->_ownerSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v10;

  if (v7->_ownerSharingOSVersionRequirement)
  {
LABEL_8:
    objc_msgSend(v6, "objectForKey:", CFSTR("friendSharingVersionRequirement"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [PKOSVersionRequirementRange alloc];
    if (v15)
    {
      v17 = -[PKOSVersionRequirementRange initWithDictionary:](v16, "initWithDictionary:", v8);
      friendSharingOSVersionRequirement = v7->_friendSharingOSVersionRequirement;
      v7->_friendSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v17;

      if (!v7->_friendSharingOSVersionRequirement)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v8;
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Invalid friend sharing version range: %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
      v21 = -[PKOSVersionRequirementRange initWithMinimumVersion:maximumVersion:](v16, "initWithMinimumVersion:maximumVersion:", 0, 0);
      v22 = v7->_friendSharingOSVersionRequirement;
      v7->_friendSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v21;

    }
    v42 = v15;
    v43 = v8;
    objc_msgSend(v6, "objectForKey:", CFSTR("brandIdentifiers"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __58__PKWebServiceCarAccessFeature_initWithDictionary_region___block_invoke;
    v50[3] = &unk_1E2AC3218;
    v25 = v24;
    v51 = v25;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v50);
    v41 = v25;
    v26 = objc_msgSend(v25, "copy");
    brandIdentifierForBrandCode = v7->_brandIdentifierForBrandCode;
    v44 = v7;
    v7->_brandIdentifierForBrandCode = (NSDictionary *)v26;

    v45 = v6;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedTerminals"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v28, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v36 = -[PKCarUnlockSupportedTerminal initWithDictionary:]([PKCarUnlockSupportedTerminal alloc], "initWithDictionary:", v35);
          if (v36)
          {
            objc_msgSend(v29, "addObject:", v36);
          }
          else
          {
            PKLogFacilityTypeGetObject(0x16uLL);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v35;
              _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Invalid supported terminal dictionary: %@", buf, 0xCu);
            }

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v32);
    }

    v38 = objc_msgSend(v29, "copy");
    v7 = v44;
    supportedTerminals = v44->_supportedTerminals;
    v44->_supportedTerminals = (NSArray *)v38;

    v6 = v45;
LABEL_28:
    v20 = v7;
    goto LABEL_29;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v8;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Invalid owner sharing version range: %@", buf, 0xCu);
  }

LABEL_13:
  v20 = 0;
LABEL_29:

  return v20;
}

void __58__PKWebServiceCarAccessFeature_initWithDictionary_region___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

}

- (id)localizedNameForIssuerWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[PKWebServiceCarAccessFeature supportedTerminalForIdentifier:](self, "supportedTerminalForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "partnerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)supportedTerminalForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_supportedTerminals;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "partnerIdentifier", (_QWORD)v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

- (PKOSVersionRequirementRange)ownerSharingOSVersionRequirement
{
  return self->_ownerSharingOSVersionRequirement;
}

- (PKOSVersionRequirementRange)friendSharingOSVersionRequirement
{
  return self->_friendSharingOSVersionRequirement;
}

- (NSArray)supportedTerminals
{
  return self->_supportedTerminals;
}

- (NSDictionary)brandIdentifierForBrandCode
{
  return self->_brandIdentifierForBrandCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandIdentifierForBrandCode, 0);
  objc_storeStrong((id *)&self->_supportedTerminals, 0);
  objc_storeStrong((id *)&self->_friendSharingOSVersionRequirement, 0);
  objc_storeStrong((id *)&self->_ownerSharingOSVersionRequirement, 0);
}

@end
