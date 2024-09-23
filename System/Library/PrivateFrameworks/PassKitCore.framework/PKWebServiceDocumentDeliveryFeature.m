@implementation PKWebServiceDocumentDeliveryFeature

- (PKWebServiceDocumentDeliveryFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceDocumentDeliveryFeature *v7;
  uint64_t v8;
  NSURL *webServiceURL;
  PKWebServiceDocumentDeliveryFeature *v10;
  NSObject *v12;
  uint8_t v13[16];
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKWebServiceDocumentDeliveryFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v14, sel_initWithFeatureType_dictionary_region_, 12, v6, a4);
  if (v7
    && (v7->_enabled = objc_msgSend(v6, "PKBoolForKey:", CFSTR("enabled")),
        objc_msgSend(v6, "PKURLForKey:", CFSTR("webServiceURL")),
        v8 = objc_claimAutoreleasedReturnValue(),
        webServiceURL = v7->_webServiceURL,
        v7->_webServiceURL = (NSURL *)v8,
        webServiceURL,
        v7->_enabled)
    && !v7->_webServiceURL)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Missing webServiceURL for document delivery feature", v13, 2u);
    }

    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

+ (id)featureWithWebService:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (!os_variant_has_internal_ui()
    || (objc_msgSend(v3, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 13, 0),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v3, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 12, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (BOOL)isEnabledWithWebService:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "featureWithWebService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

+ (id)webServiceURLWithWebService:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "featureWithWebService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webServiceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSURL)webServiceURL
{
  return self->_webServiceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webServiceURL, 0);
}

@end
