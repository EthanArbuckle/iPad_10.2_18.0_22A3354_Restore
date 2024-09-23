@implementation PKWebServiceRegionFeature

+ (id)regionFeatureWithType:(int64_t)a3 dictionary:(id)a4 region:(id)a5
{
  id v7;
  id v8;
  void *v9;
  PKWebServiceVirtualCardFeature *v10;
  int64_t v11;
  __objc2_class *v12;
  uint64_t v13;

  v7 = a4;
  v8 = a5;
  v9 = 0;
  switch(a3)
  {
    case 1:
      v10 = [PKWebServiceRegionFeature alloc];
      v11 = 1;
      goto LABEL_5;
    case 2:
      v12 = PKWebServiceCarAccessFeature;
      goto LABEL_18;
    case 3:
      v12 = PKWebServiceMerchantTokensFeature;
      goto LABEL_18;
    case 4:
      v12 = PKWebServiceMMORFeature;
      goto LABEL_18;
    case 5:
      v12 = PKWebServiceSharingFeature;
      goto LABEL_18;
    case 6:
      v12 = PKWebServiceTorinoFeature;
      goto LABEL_18;
    case 7:
    case 8:
      v10 = [PKWebServiceVirtualCardFeature alloc];
      v11 = a3;
LABEL_5:
      v13 = -[PKWebServiceVirtualCardFeature initWithFeatureType:dictionary:region:](v10, "initWithFeatureType:dictionary:region:", v11, v7, v8);
      goto LABEL_19;
    case 9:
      v12 = PKWebServiceDisbursementFeature;
      goto LABEL_18;
    case 11:
      v12 = PKWebServiceIssuerBindingFeature;
      goto LABEL_18;
    case 12:
    case 13:
      v12 = PKWebServiceDocumentDeliveryFeature;
      goto LABEL_18;
    case 14:
      v12 = PKWebServiceStaticContentDataSourceFeature;
      goto LABEL_18;
    case 15:
      v12 = PKWebServicePaymentOffersFeature;
      goto LABEL_18;
    case 16:
      v12 = PKWebServiceMerchantCategoryCodesFeature;
      goto LABEL_18;
    case 17:
      v12 = PKWebServiceRemoteNetworkPaymentFeature;
      goto LABEL_18;
    case 18:
      v12 = PKWebServiceTicketingFeature;
LABEL_18:
      v13 = objc_msgSend([v12 alloc], "initWithDictionary:region:", v7, v8);
LABEL_19:
      v9 = (void *)v13;
      break;
    default:
      break;
  }

  return v9;
}

- (PKWebServiceRegionFeature)initWithFeatureType:(int64_t)a3 dictionary:(id)a4 region:(id)a5
{
  id v8;
  id v9;
  PKWebServiceRegionFeature *v10;
  NSObject *v11;
  NSObject *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  int64_t v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  PKOSVersionRequirementRange *v22;
  PKOSVersionRequirementRange *v23;
  PKOSVersionRequirementRange *versionRange;
  NSObject *v25;
  PKOSVersionRequirementRange *v26;
  PKOSVersionRequirementRange *v27;
  PKWebServiceRegionFeature *v28;
  unsigned int v29;
  char v30;
  int64_t v31;
  NSObject *v32;
  int v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Invalid parameters to create region feature with", (uint8_t *)&v34, 2u);
    }
    goto LABEL_31;
  }
  v10 = -[PKWebServiceRegionFeature init](self, "init");
  self = v10;
  if (!v10)
    goto LABEL_26;
  v10->_featureType = a3;
  objc_storeStrong((id *)&v10->_region, a5);
  objc_msgSend(v8, "PKNumberForKey:", CFSTR("automaticRegister"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = -[NSObject BOOLValue](v11, "BOOLValue");
  else
    v13 = 1;
  self->_automaticRegister = v13;
  objc_msgSend(v8, "PKStringForKey:", CFSTR("registrationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    if ((objc_msgSend(v16, "isEqual:", CFSTR("lightweight")) & 1) != 0)
    {
      v17 = 2;
    }
    else
    {
      if (!objc_msgSend(v16, "isEqual:", CFSTR("reregister")))
      {
        v29 = objc_msgSend(v16, "isEqual:", CFSTR("none"));
        v30 = v29;
        v31 = v29;

        self->_registrationType = v31;
        if ((v30 & 1) == 0)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v34 = 138412290;
            v35 = v16;
            _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "Unknown registration type: %@", (uint8_t *)&v34, 0xCu);
          }

          goto LABEL_31;
        }
        goto LABEL_16;
      }
      v17 = 3;
    }

  }
  else
  {
    v17 = 2;
  }
  self->_registrationType = v17;
LABEL_16:
  objc_msgSend(v8, "PKNumberForKey:", CFSTR("enablementThreshold"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    objc_msgSend(v18, "floatValue");
  else
    v20 = 0.0;
  self->_enablementThreshold = v20;
  objc_msgSend(v8, "objectForKey:", CFSTR("versionRange"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [PKOSVersionRequirementRange alloc];
  if (v21)
  {
    v23 = -[PKOSVersionRequirementRange initWithDictionary:](v22, "initWithDictionary:", v21);
    versionRange = self->_versionRange;
    self->_versionRange = v23;

    if (!self->_versionRange)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v34 = 138412290;
        v35 = v21;
        _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Invalid version range: %@", (uint8_t *)&v34, 0xCu);
      }

LABEL_31:
      v28 = 0;
      goto LABEL_32;
    }
  }
  else
  {
    v26 = -[PKOSVersionRequirementRange initWithMinimumVersion:maximumVersion:](v22, "initWithMinimumVersion:maximumVersion:", 0, 0);
    v27 = self->_versionRange;
    self->_versionRange = v26;

  }
LABEL_26:
  self = self;
  v28 = self;
LABEL_32:

  return v28;
}

- (NSString)region
{
  return self->_region;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (int64_t)registrationType
{
  return self->_registrationType;
}

- (float)enablementThreshold
{
  return self->_enablementThreshold;
}

- (BOOL)automaticRegister
{
  return self->_automaticRegister;
}

- (PKOSVersionRequirementRange)versionRange
{
  return self->_versionRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionRange, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
