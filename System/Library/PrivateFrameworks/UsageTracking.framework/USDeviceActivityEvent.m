@implementation USDeviceActivityEvent

- (USDeviceActivityEvent)initWithApplicationTokens:(id)a3 categoryTokens:(id)a4 webDomainTokens:(id)a5 threshold:(id)a6 includesPastActivity:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  USDeviceActivityEvent *v15;
  uint64_t v16;
  NSSet *applicationTokens;
  uint64_t v18;
  NSSet *categoryTokens;
  uint64_t v20;
  NSSet *webDomainTokens;
  uint64_t v22;
  NSSet *bundleIdentifiers;
  uint64_t v24;
  NSSet *categoryIdentifiers;
  uint64_t v26;
  NSSet *webDomains;
  uint64_t v28;
  NSDateComponents *threshold;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)USDeviceActivityEvent;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[USDeviceActivityEvent init](&v31, sel_init);
  v16 = objc_msgSend(v14, "copy", v31.receiver, v31.super_class);

  applicationTokens = v15->_applicationTokens;
  v15->_applicationTokens = (NSSet *)v16;

  v18 = objc_msgSend(v13, "copy");
  categoryTokens = v15->_categoryTokens;
  v15->_categoryTokens = (NSSet *)v18;

  v20 = objc_msgSend(v12, "copy");
  webDomainTokens = v15->_webDomainTokens;
  v15->_webDomainTokens = (NSSet *)v20;

  v22 = objc_opt_new();
  bundleIdentifiers = v15->_bundleIdentifiers;
  v15->_bundleIdentifiers = (NSSet *)v22;

  v24 = objc_opt_new();
  categoryIdentifiers = v15->_categoryIdentifiers;
  v15->_categoryIdentifiers = (NSSet *)v24;

  v26 = objc_opt_new();
  webDomains = v15->_webDomains;
  v15->_webDomains = (NSSet *)v26;

  v28 = objc_msgSend(v11, "copy");
  threshold = v15->_threshold;
  v15->_threshold = (NSDateComponents *)v28;

  v15->_isUntokenized = 0;
  v15->_includesPastActivity = a7;
  return v15;
}

- (USDeviceActivityEvent)initWithBundleIdentifiers:(id)a3 categoryIdentifiers:(id)a4 webDomains:(id)a5 threshold:(id)a6 includesPastActivity:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  USDeviceActivityEvent *v15;
  uint64_t v16;
  NSSet *applicationTokens;
  uint64_t v18;
  NSSet *categoryTokens;
  uint64_t v20;
  NSSet *webDomainTokens;
  uint64_t v22;
  NSSet *bundleIdentifiers;
  uint64_t v24;
  NSSet *categoryIdentifiers;
  uint64_t v26;
  NSSet *webDomains;
  uint64_t v28;
  NSDateComponents *threshold;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)USDeviceActivityEvent;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[USDeviceActivityEvent init](&v31, sel_init);
  v16 = objc_opt_new();
  applicationTokens = v15->_applicationTokens;
  v15->_applicationTokens = (NSSet *)v16;

  v18 = objc_opt_new();
  categoryTokens = v15->_categoryTokens;
  v15->_categoryTokens = (NSSet *)v18;

  v20 = objc_opt_new();
  webDomainTokens = v15->_webDomainTokens;
  v15->_webDomainTokens = (NSSet *)v20;

  v22 = objc_msgSend(v14, "copy", v31.receiver, v31.super_class);
  bundleIdentifiers = v15->_bundleIdentifiers;
  v15->_bundleIdentifiers = (NSSet *)v22;

  v24 = objc_msgSend(v13, "copy");
  categoryIdentifiers = v15->_categoryIdentifiers;
  v15->_categoryIdentifiers = (NSSet *)v24;

  v26 = objc_msgSend(v12, "copy");
  webDomains = v15->_webDomains;
  v15->_webDomains = (NSSet *)v26;

  v28 = objc_msgSend(v11, "copy");
  threshold = v15->_threshold;
  v15->_threshold = (NSDateComponents *)v28;

  v15->_isUntokenized = 1;
  v15->_includesPastActivity = a7;
  return v15;
}

- (USDeviceActivityEvent)initWithCoder:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  USDeviceActivityEvent *v20;
  uint64_t v21;
  NSSet *applicationTokens;
  uint64_t v23;
  NSSet *categoryTokens;
  uint64_t v25;
  NSSet *webDomainTokens;
  uint64_t v27;
  NSSet *bundleIdentifiers;
  uint64_t v29;
  NSSet *categoryIdentifiers;
  uint64_t v31;
  NSSet *webDomains;
  uint64_t v33;
  NSDateComponents *threshold;
  void *v37;
  objc_super v38;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("ApplicationTokens"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("CategoryTokens"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v6;
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("WebDomainTokens"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("BundleIdentifiers"));
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("CategoryIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("WebDomains"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Threshold"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = (void *)v7;
  if (v7 && v8 && v9 && v13 && v14 && v15 && v16)
  {
    v38.receiver = self;
    v38.super_class = (Class)USDeviceActivityEvent;
    v19 = (void *)v13;
    v20 = -[USDeviceActivityEvent init](&v38, sel_init);
    v21 = objc_msgSend(v18, "copy");
    applicationTokens = v20->_applicationTokens;
    v20->_applicationTokens = (NSSet *)v21;

    v23 = objc_msgSend(v8, "copy");
    categoryTokens = v20->_categoryTokens;
    v20->_categoryTokens = (NSSet *)v23;

    v25 = objc_msgSend(v9, "copy");
    webDomainTokens = v20->_webDomainTokens;
    v20->_webDomainTokens = (NSSet *)v25;

    v27 = objc_msgSend(v19, "copy");
    bundleIdentifiers = v20->_bundleIdentifiers;
    v20->_bundleIdentifiers = (NSSet *)v27;

    v29 = objc_msgSend(v14, "copy");
    categoryIdentifiers = v20->_categoryIdentifiers;
    v20->_categoryIdentifiers = (NSSet *)v29;

    v31 = objc_msgSend(v15, "copy");
    webDomains = v20->_webDomains;
    v20->_webDomains = (NSSet *)v31;

    v33 = objc_msgSend(v17, "copy");
    threshold = v20->_threshold;
    v20->_threshold = (NSDateComponents *)v33;

    v20->_isUntokenized = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IsUntokenized"));
    v20->_includesPastActivity = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("IncludesPastActivity"));
  }
  else
  {

    v19 = (void *)v13;
    v20 = 0;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *applicationTokens;
  id v5;

  applicationTokens = self->_applicationTokens;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationTokens, CFSTR("ApplicationTokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryTokens, CFSTR("CategoryTokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webDomainTokens, CFSTR("WebDomainTokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifiers, CFSTR("BundleIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryIdentifiers, CFSTR("CategoryIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webDomains, CFSTR("WebDomains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_threshold, CFSTR("Threshold"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUntokenized, CFSTR("IsUntokenized"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includesPastActivity, CFSTR("IncludesPastActivity"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)includesAllActivity
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  if (-[USDeviceActivityEvent isUntokenized](self, "isUntokenized"))
  {
    -[USDeviceActivityEvent bundleIdentifiers](self, "bundleIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "count"))
    {
      -[USDeviceActivityEvent categoryIdentifiers](self, "categoryIdentifiers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "count"))
      {
        -[USDeviceActivityEvent webDomains](self, "webDomains");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v7 = v5;
        v6 = objc_msgSend(v5, "count") == 0;

        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  else
  {
    -[USDeviceActivityEvent applicationTokens](self, "applicationTokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "count"))
    {
      -[USDeviceActivityEvent categoryTokens](self, "categoryTokens");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "count"))
      {
        -[USDeviceActivityEvent webDomainTokens](self, "webDomainTokens");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
LABEL_8:
      v6 = 0;
LABEL_11:

      goto LABEL_12;
    }
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[USDeviceActivityEvent applicationTokens](self, "applicationTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[USDeviceActivityEvent categoryTokens](self, "categoryTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoryTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[USDeviceActivityEvent webDomainTokens](self, "webDomainTokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "webDomainTokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          -[USDeviceActivityEvent bundleIdentifiers](self, "bundleIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bundleIdentifiers");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v12;
          if (objc_msgSend(v12, "isEqual:", v28))
          {
            -[USDeviceActivityEvent categoryIdentifiers](self, "categoryIdentifiers");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "categoryIdentifiers");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v13;
            if (objc_msgSend(v13, "isEqual:", v26))
            {
              -[USDeviceActivityEvent webDomains](self, "webDomains");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "webDomains");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v14;
              if (objc_msgSend(v14, "isEqual:", v24))
              {
                -[USDeviceActivityEvent threshold](self, "threshold");
                v15 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "threshold");
                v16 = objc_claimAutoreleasedReturnValue();
                v23 = (void *)v15;
                v17 = (void *)v15;
                v18 = (void *)v16;
                if (objc_msgSend(v17, "isEqual:", v16)
                  && (v22 = -[USDeviceActivityEvent isUntokenized](self, "isUntokenized"),
                      v22 == objc_msgSend(v5, "isUntokenized")))
                {
                  v20 = -[USDeviceActivityEvent includesPastActivity](self, "includesPastActivity");
                  v19 = v20 ^ objc_msgSend(v5, "includesPastActivity") ^ 1;
                }
                else
                {
                  LOBYTE(v19) = 0;
                }

              }
              else
              {
                LOBYTE(v19) = 0;
              }

            }
            else
            {
              LOBYTE(v19) = 0;
            }

          }
          else
          {
            LOBYTE(v19) = 0;
          }

        }
        else
        {
          LOBYTE(v19) = 0;
        }

      }
      else
      {
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  -[USDeviceActivityEvent applicationTokens](self, "applicationTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[USDeviceActivityEvent categoryTokens](self, "categoryTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[USDeviceActivityEvent webDomainTokens](self, "webDomainTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[USDeviceActivityEvent bundleIdentifiers](self, "bundleIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[USDeviceActivityEvent categoryIdentifiers](self, "categoryIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[USDeviceActivityEvent webDomains](self, "webDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[USDeviceActivityEvent threshold](self, "threshold");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");
  v17 = -[USDeviceActivityEvent isUntokenized](self, "isUntokenized");
  v18 = v16 ^ v17 ^ -[USDeviceActivityEvent includesPastActivity](self, "includesPastActivity");

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)USDeviceActivityEvent;
  -[USDeviceActivityEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USDeviceActivityEvent threshold](self, "threshold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nThreshold: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)applicationTokens
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)categoryTokens
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)webDomainTokens
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)bundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)categoryIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)webDomains
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSDateComponents)threshold
{
  return (NSDateComponents *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)includesPastActivity
{
  return self->_includesPastActivity;
}

- (BOOL)isUntokenized
{
  return self->_isUntokenized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_webDomainTokens, 0);
  objc_storeStrong((id *)&self->_categoryTokens, 0);
  objc_storeStrong((id *)&self->_applicationTokens, 0);
}

@end
