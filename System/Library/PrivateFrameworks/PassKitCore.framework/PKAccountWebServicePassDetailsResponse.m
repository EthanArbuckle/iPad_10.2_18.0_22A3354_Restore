@implementation PKAccountWebServicePassDetailsResponse

- (PKAccountWebServicePassDetailsResponse)initWithData:(id)a3
{
  PKAccountWebServicePassDetailsResponse *v3;
  PKAccountWebServicePassDetailsResponse *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSString *provisioningIdentifier;
  uint64_t v9;
  NSURL *passURL;
  uint64_t v11;
  NSString *passTypeIdentifier;
  uint64_t v13;
  NSString *passSerialNumber;
  uint64_t v15;
  NSString *ownershipTokenIdentifier;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  PKAccountPostProvisioningContent *v24;
  uint64_t v25;
  NSArray *postProvisioningContent;
  NSObject *v27;
  const char *v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  PKAccountWebServicePassDetailsResponse *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKAccountWebServicePassDetailsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v38, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_23:
    v32 = v4;
    goto LABEL_24;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      v41 = 2114;
      v42 = v31;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

LABEL_21:
    }

    goto LABEL_23;
  }
  v6 = v5;
  -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("provisioningIdentifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  provisioningIdentifier = v4->_provisioningIdentifier;
  v4->_provisioningIdentifier = (NSString *)v7;

  v4->_cardType = -[NSObject PKIntegerForKey:](v6, "PKIntegerForKey:", CFSTR("cardType"));
  v4->_status = -[NSObject PKIntegerForKey:](v6, "PKIntegerForKey:", CFSTR("status"));
  -[NSObject PKURLForKey:](v6, "PKURLForKey:", CFSTR("passURL"));
  v9 = objc_claimAutoreleasedReturnValue();
  passURL = v4->_passURL;
  v4->_passURL = (NSURL *)v9;

  -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("passTypeIdentifier"));
  v11 = objc_claimAutoreleasedReturnValue();
  passTypeIdentifier = v4->_passTypeIdentifier;
  v4->_passTypeIdentifier = (NSString *)v11;

  -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("passSerialNumber"));
  v13 = objc_claimAutoreleasedReturnValue();
  passSerialNumber = v4->_passSerialNumber;
  v4->_passSerialNumber = (NSString *)v13;

  -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("ownershipTokenIdentifier"));
  v15 = objc_claimAutoreleasedReturnValue();
  ownershipTokenIdentifier = v4->_ownershipTokenIdentifier;
  v4->_ownershipTokenIdentifier = (NSString *)v15;

  -[NSObject PKArrayForKey:](v6, "PKArrayForKey:", CFSTR("postProvisioningContent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v19);
          v24 = -[PKAccountPostProvisioningContent initWithDictionary:]([PKAccountPostProvisioningContent alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          if (v24)
            objc_msgSend(v18, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v21);
    }

    v25 = objc_msgSend(v18, "copy");
    postProvisioningContent = v4->_postProvisioningContent;
    v4->_postProvisioningContent = (NSArray *)v25;

  }
  switch(v4->_status)
  {
    case 0:
    case 4:
      if (v4->_passURL)
        goto LABEL_21;
      PKLogFacilityTypeGetObject(0xEuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v28 = "Malformed - Missing passURL";
      break;
    case 1:
    case 5:
      if (v4->_provisioningIdentifier)
        goto LABEL_21;
      PKLogFacilityTypeGetObject(0xEuLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v28 = "Malformed - Missing provisioningIdentifier";
      break;
    default:
      goto LABEL_21;
  }
  _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
LABEL_28:

  v32 = 0;
LABEL_24:

  return v32;
}

- (NSString)provisioningIdentifier
{
  return self->_provisioningIdentifier;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (NSArray)postProvisioningContent
{
  return self->_postProvisioningContent;
}

- (PKPaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void)setRemoteCredential:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCredential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_postProvisioningContent, 0);
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_provisioningIdentifier, 0);
}

@end
