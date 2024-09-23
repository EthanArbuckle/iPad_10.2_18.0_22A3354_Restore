@implementation PKWebServiceTicketingFeature

- (PKWebServiceTicketingFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  PKWebServiceTicketingFeature *v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *supportedFeatures;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKWebServiceTicketingFeature;
  v8 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v17, sel_initWithFeatureType_dictionary_region_, 18, v6, v7);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    for (i = 0; i != 4; ++i)
    {
      objc_msgSend(v6, "objectForKey:", off_1E2AC3260[i]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11 || objc_msgSend(v11, "PKBoolForKey:", CFSTR("enabled")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

      }
    }
    v14 = objc_msgSend(v9, "copy");
    supportedFeatures = v8->_supportedFeatures;
    v8->_supportedFeatures = (NSSet *)v14;

  }
  return v8;
}

- (BOOL)isIntegrationTypeSupported:(int64_t)a3
{
  NSSet *supportedFeatures;
  void *v4;

  supportedFeatures = self->_supportedFeatures;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(supportedFeatures) = -[NSSet containsObject:](supportedFeatures, "containsObject:", v4);

  return (char)supportedFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
}

@end
