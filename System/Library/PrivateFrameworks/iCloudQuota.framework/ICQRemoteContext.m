@implementation ICQRemoteContext

+ (id)ICQContextFromRemoteAlertContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextFromDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contextFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("contextData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v3;
      v8 = "Caught error (%@) deserializing context data (%@)";
      v9 = v6;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    v8 = "Successfully formed context: %@";
    v9 = v6;
    v10 = 12;
    goto LABEL_6;
  }

  return v4;
}

- (ICQRemoteContext)initWithOffer:(id)a3 link:(id)a4 flowOptionsData:(id)a5 preloadedRemoteUIData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICQRemoteContext *v15;
  ICQRemoteContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICQRemoteContext;
  v15 = -[ICQRemoteContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_offer, a3);
    objc_storeStrong((id *)&v16->_link, a4);
    objc_storeStrong((id *)&v16->_flowOptionsData, a5);
    objc_storeStrong((id *)&v16->_preloadedRemoteUIData, a6);
  }

  return v16;
}

- (id)_serializedData
{
  void *v3;
  ICQRemoteContext *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  id v9;
  uint8_t buf[4];
  ICQRemoteContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (ICQRemoteContext *)v9;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      v7 = "Caught error (%@) serializing ICQRemoteContext";
LABEL_6:
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    v7 = "ICQRemoteContext %@ encoded successfully";
    goto LABEL_6;
  }

  return v3;
}

- (id)toDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("contextData");
  -[ICQRemoteContext _serializedData](self, "_serializedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ICQOffer *offer;
  id v5;

  offer = self->_offer;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", offer, CFSTR("offer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_link, CFSTR("link"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_flowOptionsData, CFSTR("flowOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preloadedRemoteUIData, CFSTR("preloadedRemoteUIData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentingSceneIdentifier, CFSTR("presentingSceneIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentingSceneBundleIdentifier, CFSTR("presentingSceneBundleIdentifier"));

}

- (ICQRemoteContext)initWithCoder:(id)a3
{
  id v4;
  ICQRemoteContext *v5;
  uint64_t v6;
  ICQOffer *offer;
  uint64_t v8;
  ICQLink *link;
  uint64_t v10;
  NSData *flowOptionsData;
  uint64_t v12;
  NSData *preloadedRemoteUIData;
  uint64_t v14;
  NSString *presentingSceneIdentifier;
  uint64_t v16;
  NSString *presentingSceneBundleIdentifier;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQRemoteContext;
  v5 = -[ICQRemoteContext init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offer"));
    v6 = objc_claimAutoreleasedReturnValue();
    offer = v5->_offer;
    v5->_offer = (ICQOffer *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link"));
    v8 = objc_claimAutoreleasedReturnValue();
    link = v5->_link;
    v5->_link = (ICQLink *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowOptions"));
    v10 = objc_claimAutoreleasedReturnValue();
    flowOptionsData = v5->_flowOptionsData;
    v5->_flowOptionsData = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preloadedRemoteUIData"));
    v12 = objc_claimAutoreleasedReturnValue();
    preloadedRemoteUIData = v5->_preloadedRemoteUIData;
    v5->_preloadedRemoteUIData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    presentingSceneIdentifier = v5->_presentingSceneIdentifier;
    v5->_presentingSceneIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentingSceneBundleIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    presentingSceneBundleIdentifier = v5->_presentingSceneBundleIdentifier;
    v5->_presentingSceneBundleIdentifier = (NSString *)v16;

  }
  return v5;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (ICQLink)link
{
  return self->_link;
}

- (NSData)flowOptionsData
{
  return self->_flowOptionsData;
}

- (NSData)preloadedRemoteUIData
{
  return self->_preloadedRemoteUIData;
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_preloadedRemoteUIData, 0);
  objc_storeStrong((id *)&self->_flowOptionsData, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

@end
