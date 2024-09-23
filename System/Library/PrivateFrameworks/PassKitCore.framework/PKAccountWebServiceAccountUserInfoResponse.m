@implementation PKAccountWebServiceAccountUserInfoResponse

- (PKAccountWebServiceAccountUserInfoResponse)initWithData:(id)a3
{
  PKAccountWebServiceAccountUserInfoResponse *v3;
  PKAccountWebServiceAccountUserInfoResponse *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  CNContact *primaryUser;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PKAccountWebServiceAccountUserInfoResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v41, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v5;
      v6 = v5;
      v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
      -[NSObject PKDictionaryForKey:](v6, "PKDictionaryForKey:", CFSTR("billingAddress"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject PKDictionaryForKey:](v6, "PKDictionaryForKey:", CFSTR("name"));
      v9 = objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v9, CFSTR("firstName"), 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGivenName:");
      v39 = (void *)v9;
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v9, CFSTR("lastName"), 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFamilyName:");
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v6, CFSTR("email"), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = objc_alloc(MEMORY[0x1E0C97338]);
        v12 = (void *)objc_msgSend(v11, "initWithLabel:value:", *MEMORY[0x1E0C96FF0], v10);
        v47[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEmailAddresses:", v13);

      }
      v36 = (void *)v10;
      v14 = objc_alloc_init(MEMORY[0x1E0C97378]);
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v8, CFSTR("addressLine1"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v8, CFSTR("addressLine2"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v16;
      v35 = v7;
      if (objc_msgSend(v16, "length"))
      {
        objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("\n%@"), v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v17;
      }
      objc_msgSend(v14, "setStreet:", v15);
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v8, CFSTR("city"), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCity:", v33);
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v8, CFSTR("state"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setState:", v18);
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v8, CFSTR("postalCode"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPostalCode:", v19);
      -[PKAccountWebServiceAccountUserInfoResponse _stringValueFromDictionary:key:isOptional:](v4, "_stringValueFromDictionary:key:isOptional:", v8, CFSTR("countryCode"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setISOCountryCode:", v20);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedStringForCountryCode(v21, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCountry:", v22);

      v23 = objc_alloc(MEMORY[0x1E0C97338]);
      v24 = (void *)objc_msgSend(v23, "initWithLabel:value:", *MEMORY[0x1E0C96FF8], v14);
      v46 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPostalAddresses:", v25);

      v26 = objc_msgSend(v35, "copy");
      primaryUser = v4->_primaryUser;
      v4->_primaryUser = (CNContact *)v26;

      v5 = v40;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v29;
        v44 = 2114;
        v45 = v31;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (id)_stringValueFromDictionary:(id)a3 key:(id)a4 isOptional:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v8, "length"))
  {
    v9 = v8;
  }
  else
  {
    if (!a5)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Invalid %@ in user info response", (uint8_t *)&v12, 0xCu);
      }

    }
    v9 = 0;
  }

  return v9;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (CNContact)primaryUser
{
  return self->_primaryUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryUser, 0);
}

@end
