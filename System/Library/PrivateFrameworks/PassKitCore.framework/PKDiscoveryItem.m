@implementation PKDiscoveryItem

+ (id)convertEngagementRequestToDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "clientData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_METACLASS___PKDiscoveryItem;
    objc_msgSendSuper2(&v23, sel_convertEngagementRequestToDictionary_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("layoutBundleURL"));
    }
    else
    {
      objc_msgSend(v4, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("layoutBundleURL"));

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badging"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("shouldBadge"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entitledToForceLarge"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("entitledToForceLargeCard"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("carouselRankingOrder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("priority"));

    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("clientData"));

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("clientData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "could not serialize client data: %{public}@", buf, 0xCu);
      }

    }
    v20 = (void *)objc_msgSend(v9, "copy");

    goto LABEL_12;
  }
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  PKLogFacilityTypeGetObject(0x10uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "client data lacks URL", buf, 2u);
  }
  v20 = 0;
LABEL_12:

  return v20;
}

+ (id)activeItemFromEngagementRequest:(id)a3
{
  void *v3;
  PKDiscoveryItem *v4;

  objc_msgSend(a1, "convertEngagementRequestToDictionary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKDiscoveryItem initWithDictionary:]([PKDiscoveryItem alloc], "initWithDictionary:", v3);
  -[PKDiscoveryObject setStatus:](v4, "setStatus:", 2);

  return v4;
}

- (PKDiscoveryItem)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryItem *v5;
  void *v6;
  uint64_t v7;
  NSURL *layoutBundleURL;
  uint64_t v9;
  NSArray *supportedLocalizations;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *clientData;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKDiscoveryItem;
  v5 = -[PKDiscoveryObject initWithDictionary:](&v18, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "isEqual:", CFSTR("article"));

    objc_msgSend(v4, "PKURLForKey:", CFSTR("layoutBundleURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    layoutBundleURL = v5->_layoutBundleURL;
    v5->_layoutBundleURL = (NSURL *)v7;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedLocalizations"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedLocalizations = v5->_supportedLocalizations;
    v5->_supportedLocalizations = (NSArray *)v9;

    v5->_shouldBadge = objc_msgSend(v4, "PKBoolForKey:", CFSTR("shouldBadge"));
    v5->_entitledToForceLargeCard = objc_msgSend(v4, "PKBoolForKey:", CFSTR("entitledToForceLargeCard"));
    objc_msgSend(v4, "objectForKey:", CFSTR("priority"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("priority"));
      v13 = 1000;
      if (v12 < 1000)
        v13 = v12;
      v14 = v13 & ~(v13 >> 63);
    }
    else
    {
      v14 = 500;
    }
    objc_msgSend(v4, "PKDataForKey:", CFSTR("clientData"));
    v15 = objc_claimAutoreleasedReturnValue();
    clientData = v5->_clientData;
    v5->_clientData = (NSData *)v15;

    v5->_priority = v14;
  }

  return v5;
}

- (void)updateForRuleResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  const char *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[PKDiscoveryItem isTerminalStatus](self, "isTerminalStatus"))
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PKDiscoveryObject identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Discovery Item with identifier: %@ is in terminal state and won't be updated based on rule result", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    if (v3)
      v7 = 2;
    else
      v7 = 6;
    PKLogFacilityTypeGetObject(0x10uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PKDiscoveryObject identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKDiscoveryObject status](self, "status");
      v11 = "NO";
      v12 = 138413058;
      v13 = v9;
      v14 = 2048;
      if (v3)
        v11 = "YES";
      v15 = v10;
      v16 = 2048;
      v17 = v7;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Updating status of Discovery Item with identifier: %@ from %ld to %ld for result %s", (uint8_t *)&v12, 0x2Au);

    }
    -[PKDiscoveryObject setStatus:](self, "setStatus:", v7);
  }
}

- (void)updateWithDiscoveryItem:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *layoutBundleURL;
  NSArray *v7;
  NSArray *supportedLocalizations;
  NSData *v9;
  NSData *clientData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryItem;
  if (-[PKDiscoveryObject updateWithDiscoveryObject:](&v11, sel_updateWithDiscoveryObject_, v4))
  {
    self->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "layoutBundleURL");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    layoutBundleURL = self->_layoutBundleURL;
    self->_layoutBundleURL = v5;

    objc_msgSend(v4, "supportedLocalizations");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supportedLocalizations = self->_supportedLocalizations;
    self->_supportedLocalizations = v7;

    self->_shouldBadge = objc_msgSend(v4, "shouldBadge");
    self->_priority = objc_msgSend(v4, "priority");
    self->_entitledToForceLargeCard = objc_msgSend(v4, "entitledToForceLargeCard");
    objc_msgSend(v4, "clientData");
    v9 = (NSData *)objc_claimAutoreleasedReturnValue();
    clientData = self->_clientData;
    self->_clientData = v9;

  }
}

- (id)eventForKey:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSData *clientData;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && self->_clientData)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    clientData = self->_clientData;
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, clientData, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      objc_msgSend(v11, "PKDictionaryForKey:", CFSTR("metrics"));
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject PKDictionaryForKey:](v13, "PKDictionaryForKey:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB68]), "initWithUnderlyingDictionary:", v14);
      }
      else
      {
        PKLogFacilityTypeGetObject(0x10uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v4;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "couldn't find event for key: %{public}@", buf, 0xCu);
        }

        v15 = 0;
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "error unarchiving client data: %{public}@", buf, 0xCu);
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isTerminalStatus
{
  return -[PKDiscoveryObject status](self, "status") == 4;
}

- (BOOL)hasHitMaxViewCount
{
  int64_t v3;
  int64_t v4;

  v3 = -[PKDiscoveryObject maxViewCount](self, "maxViewCount");
  if (v3)
  {
    v4 = -[PKDiscoveryObject viewCount](self, "viewCount");
    LOBYTE(v3) = v4 >= -[PKDiscoveryObject maxViewCount](self, "maxViewCount");
  }
  return v3;
}

- (BOOL)hasHitMaxLargeViewCount
{
  int64_t v3;
  int64_t v4;

  v3 = -[PKDiscoveryObject maxViewCountLargeCard](self, "maxViewCountLargeCard");
  if (v3)
  {
    v4 = -[PKDiscoveryObject viewCount](self, "viewCount");
    LOBYTE(v3) = v4 >= -[PKDiscoveryObject maxViewCountLargeCard](self, "maxViewCountLargeCard");
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryItem;
  v4 = a3;
  -[PKDiscoveryObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_layoutBundleURL, CFSTR("layoutBundleURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedLocalizations, CFSTR("supportedLocalizations"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_shouldBadge, CFSTR("shouldBadge"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_entitledToForceLargeCard, CFSTR("entitledToForceLargeCard"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientData, CFSTR("clientData"));

}

- (PKDiscoveryItem)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryItem *v5;
  uint64_t v6;
  NSURL *layoutBundleURL;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *supportedLocalizations;
  uint64_t v13;
  NSData *clientData;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryItem;
  v5 = -[PKDiscoveryObject initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutBundleURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    layoutBundleURL = v5->_layoutBundleURL;
    v5->_layoutBundleURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedLocalizations"));
    v11 = objc_claimAutoreleasedReturnValue();
    supportedLocalizations = v5->_supportedLocalizations;
    v5->_supportedLocalizations = (NSArray *)v11;

    v5->_shouldBadge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shouldBadge")) != 0;
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
    v5->_entitledToForceLargeCard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("entitledToForceLargeCard"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientData"));
    v13 = objc_claimAutoreleasedReturnValue();
    clientData = v5->_clientData;
    v5->_clientData = (NSData *)v13;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryItem;
  v5 = -[PKDiscoveryObject copyWithZone:](&v11, sel_copyWithZone_);
  *((_QWORD *)v5 + 13) = self->_type;
  v6 = -[NSURL copyWithZone:](self->_layoutBundleURL, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 14);
  *((_QWORD *)v5 + 14) = v6;

  v8 = -[NSArray copyWithZone:](self->_supportedLocalizations, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v8;

  *((_BYTE *)v5 + 96) = self->_shouldBadge;
  *((_QWORD *)v5 + 16) = self->_priority;
  *((_BYTE *)v5 + 97) = self->_entitledToForceLargeCard;
  objc_storeStrong((id *)v5 + 17, self->_clientData);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryItem;
  -[PKDiscoveryObject description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; ]"), CFSTR("type"), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("layoutBundleURL"), self->_layoutBundleURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("supportedLocalizations"), self->_supportedLocalizations);
  if (self->_shouldBadge)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("shouldBadge"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("priority"), self->_priority);
  if (self->_entitledToForceLargeCard)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("entitledToForceLargeCard"), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("clientData"), self->_clientData);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSURL)layoutBundleURL
{
  return self->_layoutBundleURL;
}

- (void)setLayoutBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)supportedLocalizations
{
  return self->_supportedLocalizations;
}

- (void)setSupportedLocalizations:(id)a3
{
  objc_storeStrong((id *)&self->_supportedLocalizations, a3);
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (void)setShouldBadge:(BOOL)a3
{
  self->_shouldBadge = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)entitledToForceLargeCard
{
  return self->_entitledToForceLargeCard;
}

- (void)setEntitledToForceLargeCard:(BOOL)a3
{
  self->_entitledToForceLargeCard = a3;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
  objc_storeStrong((id *)&self->_clientData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_supportedLocalizations, 0);
  objc_storeStrong((id *)&self->_layoutBundleURL, 0);
}

@end
