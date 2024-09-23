@implementation MOContextContactMetaData

- (MOContextContactMetaData)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOContextContactMetaData;
  return -[MOContextContactMetaData init](&v3, sel_init);
}

- (MOContextContactMetaData)initWithContactIdentifier:(id)a3 contactName:(id)a4 mdEntityIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOContextContactMetaData *v12;
  MOContextContactMetaData *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MOContextContactMetaData;
  v12 = -[MOContextContactMetaData init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextContactIdentifier, a3);
    objc_storeStrong((id *)&v13->_contactName, a4);
    objc_storeStrong((id *)&v13->_mdEntityIdentifier, a5);
    _mo_log_facility_get_os_log(MOLogFacilityPersonalizedSensing);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_243AAA000, v14, OS_LOG_TYPE_INFO, "ContactMetaData contextContactIdentifier,%@,contactName,%@,mdEntityIdentifier,%@", buf, 0x20u);
    }

  }
  return v13;
}

- (MOContextContactMetaData)initWithContactName:(id)a3
{
  id v5;
  MOContextContactMetaData *v6;
  MOContextContactMetaData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextContactMetaData;
  v6 = -[MOContextContactMetaData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactName, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextContactMetaData *v4;
  void *v5;
  void *v6;
  void *v7;
  MOContextContactMetaData *v8;

  v4 = [MOContextContactMetaData alloc];
  -[MOContextContactMetaData contextContactIdentifier](self, "contextContactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextContactMetaData contactName](self, "contactName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextContactMetaData mdEntityIdentifier](self, "mdEntityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MOContextContactMetaData initWithContactIdentifier:contactName:mdEntityIdentifier:](v4, "initWithContactIdentifier:contactName:mdEntityIdentifier:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contactName;
  id v5;

  contactName = self->_contactName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactName, CFSTR("contactName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextContactIdentifier, CFSTR("contextContactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mdEntityIdentifier, CFSTR("mdEntityIdentifier"));

}

- (MOContextContactMetaData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MOContextContactMetaData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextContactIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mdEntityIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MOContextContactMetaData initWithContactIdentifier:contactName:mdEntityIdentifier:](self, "initWithContactIdentifier:contactName:mdEntityIdentifier:", v6, v5, v7);
  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextContactMetaData contactName](self, "contactName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("contact name, %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)contactName
{
  return self->_contactName;
}

- (NSString)contextContactIdentifier
{
  return self->_contextContactIdentifier;
}

- (NSString)mdEntityIdentifier
{
  return self->_mdEntityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_contextContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
}

@end
