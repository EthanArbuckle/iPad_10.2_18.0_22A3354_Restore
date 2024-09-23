@implementation POUserLoginState

- (POUserLoginState)initWithUniqueIdentifier:(id)a3
{
  id v5;
  POUserLoginState *v6;
  POUserLoginState *v7;
  uint64_t v8;
  NSDate *lastUpdated;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)POUserLoginState;
  v6 = -[POUserLoginState init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueIdentifier, a3);
    v7->_state = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v7->_lastUpdated;
    v7->_lastUpdated = (NSDate *)v8;

  }
  return v7;
}

- (void)setState:(unint64_t)a3
{
  NSDate *v4;
  NSDate *lastUpdated;

  self->_state = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v4;

}

- (void)setlastLogin:(id)a3
{
  NSDate *v5;
  NSDate *lastUpdated;
  id v7;

  objc_storeStrong((id *)&self->_lastLogin, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v5;

}

- (void)setLoginType:(unint64_t)a3
{
  NSDate *v4;
  NSDate *lastUpdated;

  self->_loginType = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v4;

}

- (id)dictionaryRepresentation
{
  return -[POUserLoginState dictionaryRepresentationForDisplay:](self, "dictionaryRepresentationForDisplay:", 0);
}

- (id)dictionaryRepresentationForDisplay:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  NSString *uniqueIdentifier;
  void *v8;
  unint64_t state;
  void *v10;
  void *v11;
  NSDate *lastLogin;
  void *v13;
  void *v14;
  unint64_t loginType;
  void *v16;
  void *v17;
  NSDate *lastUpdated;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v5, "setFormatOptions:", 1907);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  uniqueIdentifier = self->_uniqueIdentifier;
  NSStringFromSelector(sel_uniqueIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", uniqueIdentifier, v8);

  state = self->_state;
  if (v3)
    +[POConstantCoreUtil stringForLoginPolicyState:](POConstantCoreUtil, "stringForLoginPolicyState:", state);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_state);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v11);

  lastLogin = self->_lastLogin;
  if (lastLogin)
  {
    objc_msgSend(v5, "stringFromDate:", self->_lastLogin);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  NSStringFromSelector(sel_lastLogin);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

  if (lastLogin)
  loginType = self->_loginType;
  if (v3)
    +[POConstantCoreUtil stringForLoginType:](POConstantCoreUtil, "stringForLoginType:", loginType);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", loginType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v17);

  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    objc_msgSend(v5, "stringFromDate:", lastUpdated);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  NSStringFromSelector(sel_lastUpdated);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v20);

  if (lastUpdated)
  v21 = (void *)objc_msgSend(v6, "copy");

  return v21;
}

- (id)dataRepresentation
{
  return -[POUserLoginState dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 0);
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  -[POUserLoginState dictionaryRepresentationForDisplay:](self, "dictionaryRepresentationForDisplay:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 11, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__POUserLoginState_dataRepresentationForDisplay___block_invoke;
    v10[3] = &unk_2514FF9D0;
    v11 = v5;
    v7 = __49__POUserLoginState_dataRepresentationForDisplay___block_invoke((uint64_t)v10);

    v8 = 0;
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

id __49__POUserLoginState_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing user state."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginState();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

- (POUserLoginState)initWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  POUserLoginState *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v5)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __33__POUserLoginState_initWithData___block_invoke;
    v10[3] = &unk_2514FF9D0;
    v11 = v5;
    v7 = __33__POUserLoginState_initWithData___block_invoke((uint64_t)v10);

    v8 = 0;
  }
  else
  {
    self = -[POUserLoginState initWithDictionary:](self, "initWithDictionary:", v4);
    v8 = self;
  }

  return v8;
}

id __33__POUserLoginState_initWithData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing user state."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginState();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

- (POUserLoginState)initWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  POUserLoginState *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *lastLogin;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDate *lastUpdated;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v5, "setFormatOptions:", 1907);
  NSStringFromSelector(sel_uniqueIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POUserLoginState initWithUniqueIdentifier:](self, "initWithUniqueIdentifier:", v7);
  if (v8)
  {
    NSStringFromSelector(sel_state);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      NSStringFromSelector(sel_state);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8->_state = objc_msgSend(v12, "unsignedIntValue");
    }
    NSStringFromSelector(sel_lastLogin);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v5, "dateFromString:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      lastLogin = v8->_lastLogin;
      v8->_lastLogin = (NSDate *)v15;

    }
    NSStringFromSelector(sel_loginType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_loginType = (int)objc_msgSend(v18, "intValue");

    NSStringFromSelector(sel_lastUpdated);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v5, "dateFromString:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      lastUpdated = v8->_lastUpdated;
      v8->_lastUpdated = (NSDate *)v21;

    }
  }

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POUserLoginState dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserLoginState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  POUserLoginState *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POUserLoginState initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[POUserLoginState dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (NSDate)lastLogin
{
  return self->_lastLogin;
}

- (void)setLastLogin:(id)a3
{
  objc_storeStrong((id *)&self->_lastLogin, a3);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_lastLogin, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
