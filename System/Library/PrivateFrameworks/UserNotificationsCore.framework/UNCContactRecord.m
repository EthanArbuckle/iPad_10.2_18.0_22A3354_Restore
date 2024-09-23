@implementation UNCContactRecord

- (UNCContactRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNCContactRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UNCContactRecord;
  v5 = -[UNCContactRecord init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("handle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setHandle:](v5, "setHandle:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("handleType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setHandleType:](v5, "setHandleType:", objc_msgSend(v7, "unsignedIntegerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("serviceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setServiceName:](v5, "setServiceName:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("displayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setDisplayName:](v5, "setDisplayName:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("displayNameSuggested"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setDisplayNameSuggested:](v5, "setDisplayNameSuggested:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("customIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setCustomIdentifier:](v5, "setCustomIdentifier:", v11);

    objc_msgSend(v4, "objectForKey:", CFSTR("cnContactIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setCnContactIdentifier:](v5, "setCnContactIdentifier:", v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("cnContactFullName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setCnContactFullname:](v5, "setCnContactFullname:", v13);

    objc_msgSend(v4, "objectForKey:", CFSTR("cnContactIdentifierSuggested"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCContactRecord setCnContactIdentifierSuggested:](v5, "setCnContactIdentifierSuggested:", objc_msgSend(v14, "BOOLValue"));

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCContactRecord handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("handle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[UNCContactRecord handleType](self, "handleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("handleType"));

  -[UNCContactRecord serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("serviceName"));

  -[UNCContactRecord displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, CFSTR("displayName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCContactRecord isDisplayNameSuggested](self, "isDisplayNameSuggested"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, CFSTR("displayNameSuggested"));

  -[UNCContactRecord customIdentifier](self, "customIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, CFSTR("customIdentifier"));

  -[UNCContactRecord cnContactIdentifier](self, "cnContactIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, CFSTR("cnContactIdentifier"));

  -[UNCContactRecord cnContactFullname](self, "cnContactFullname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v11, CFSTR("cnContactFullName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCContactRecord isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v12, CFSTR("cnContactIdentifierSuggested"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCContactRecord handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("handle"));

  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[UNCContactRecord handleType](self, "handleType"), CFSTR("handleType"));
  -[UNCContactRecord serviceName](self, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("serviceName"));

  -[UNCContactRecord displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "un_logDigest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("displayName"));

  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCContactRecord isDisplayNameSuggested](self, "isDisplayNameSuggested"), CFSTR("displayNameSuggested"));
  -[UNCContactRecord customIdentifier](self, "customIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "un_logDigest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("customIdentifier"));

  -[UNCContactRecord cnContactIdentifier](self, "cnContactIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", v17, CFSTR("cnContactIdentifier"));

  -[UNCContactRecord cnContactFullname](self, "cnContactFullname");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "un_logDigest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:withName:", v20, CFSTR("cnContactFullname"));

  v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCContactRecord isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested"), CFSTR("cnContactIdentifierSuggested"));
  objc_msgSend(v3, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
LABEL_14:
      LOBYTE(v27) = 0;
      goto LABEL_15;
    }
  }
  v5 = v4;
  if (!v5)
    goto LABEL_14;
  -[UNCContactRecord handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = UNEqualStrings();

  if (!v8)
    goto LABEL_14;
  v9 = -[UNCContactRecord handleType](self, "handleType");
  if (v9 != objc_msgSend(v5, "handleType"))
    goto LABEL_14;
  -[UNCContactRecord serviceName](self, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = UNEqualStrings();

  if (!v12)
    goto LABEL_14;
  -[UNCContactRecord displayName](self, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = UNEqualStrings();

  if (!v15)
    goto LABEL_14;
  v16 = -[UNCContactRecord isDisplayNameSuggested](self, "isDisplayNameSuggested");
  if (v16 != objc_msgSend(v5, "isDisplayNameSuggested"))
    goto LABEL_14;
  -[UNCContactRecord customIdentifier](self, "customIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = UNEqualStrings();

  if (!v19)
    goto LABEL_14;
  -[UNCContactRecord cnContactIdentifier](self, "cnContactIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cnContactIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = UNEqualStrings();

  if (!v22)
    goto LABEL_14;
  -[UNCContactRecord cnContactFullname](self, "cnContactFullname");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cnContactFullname");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = UNEqualStrings();

  if (!v25)
    goto LABEL_14;
  v26 = -[UNCContactRecord isCNContactIdentifierSuggested](self, "isCNContactIdentifierSuggested");
  v27 = v26 ^ objc_msgSend(v5, "isCNContactIdentifierSuggested") ^ 1;
LABEL_15:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  _BOOL8 displayNameSuggested;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = self->_handleType + -[NSString hash](self->_handle, "hash");
  v4 = -[NSString hash](self->_serviceName, "hash");
  v5 = v3 + v4 + -[NSString hash](self->_displayName, "hash");
  displayNameSuggested = self->_displayNameSuggested;
  v7 = displayNameSuggested + -[NSString hash](self->_customIdentifier, "hash");
  v8 = v5 + v7 + -[NSString hash](self->_cnContactIdentifier, "hash");
  v9 = -[NSString hash](self->_cnContactIdentifier, "hash");
  return v8 + v9 + -[NSString hash](self->_cnContactFullname, "hash") + self->_cnContactIdentifierSuggested;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isDisplayNameSuggested
{
  return self->_displayNameSuggested;
}

- (void)setDisplayNameSuggested:(BOOL)a3
{
  self->_displayNameSuggested = a3;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (void)setCustomIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (void)setCnContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)cnContactFullname
{
  return self->_cnContactFullname;
}

- (void)setCnContactFullname:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isCNContactIdentifierSuggested
{
  return self->_cnContactIdentifierSuggested;
}

- (void)setCnContactIdentifierSuggested:(BOOL)a3
{
  self->_cnContactIdentifierSuggested = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactFullname, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
