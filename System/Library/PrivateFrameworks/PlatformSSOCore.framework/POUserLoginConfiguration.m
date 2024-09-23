@implementation POUserLoginConfiguration

- (POUserLoginConfiguration)initWithLoginUserName:(id)a3
{
  id v5;
  POUserLoginConfiguration *v6;
  POUserLoginConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POUserLoginConfiguration;
  v6 = -[POUserLoginConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_loginUserName, a3);

  return v7;
}

- (BOOL)setCustomAssertionRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POUserLoginConfiguration setCustomAssertionRequestHeaderClaims:](self, "setCustomAssertionRequestHeaderClaims:", v8);
  }
  else
  {
    __81__POUserLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __81__POUserLoginConfiguration_setCustomAssertionRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomAssertionRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POUserLoginConfiguration setCustomAssertionRequestBodyClaims:](self, "setCustomAssertionRequestBodyClaims:", v8);
  }
  else
  {
    __79__POUserLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __79__POUserLoginConfiguration_setCustomAssertionRequestBodyClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Request body claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomLoginRequestHeaderClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POUserLoginConfiguration setCustomLoginRequestHeaderClaims:](self, "setCustomLoginRequestHeaderClaims:", v8);
  }
  else
  {
    __77__POUserLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

id __77__POUserLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Login request header claims are not valid JSON."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (BOOL)setCustomLoginRequestBodyClaims:(id)a3 returningError:(id *)a4
{
  id v6;
  int v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6);
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");
    -[POUserLoginConfiguration setCustomLoginRequestBodyClaims:](self, "setCustomLoginRequestBodyClaims:", v8);
  }
  else
  {
    __77__POUserLoginConfiguration_setCustomLoginRequestHeaderClaims_returningError___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (a4)
    {
      v8 = objc_retainAutorelease(v9);
      *a4 = v8;
    }
  }

  return v7;
}

- (id)dataRepresentation
{
  return -[POUserLoginConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 0);
}

- (id)dictionaryRepresentationForDisplay:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *loginUserName;
  void *v7;
  NSDictionary *customAssertionRequestHeaderClaims;
  void *v9;
  NSDictionary *customAssertionRequestBodyClaims;
  void *v11;
  NSDictionary *customLoginRequestHeaderClaims;
  void *v13;
  NSDictionary *customLoginRequestBodyClaims;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v3)
  {
    +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", self->_loginUserName);
    loginUserName = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    loginUserName = self->_loginUserName;
  }
  NSStringFromSelector(sel_loginUserName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", loginUserName, v7);

  if (v3)
  customAssertionRequestHeaderClaims = self->_customAssertionRequestHeaderClaims;
  NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", customAssertionRequestHeaderClaims, v9);

  customAssertionRequestBodyClaims = self->_customAssertionRequestBodyClaims;
  NSStringFromSelector(sel_customAssertionRequestBodyClaims);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", customAssertionRequestBodyClaims, v11);

  customLoginRequestHeaderClaims = self->_customLoginRequestHeaderClaims;
  NSStringFromSelector(sel_customLoginRequestHeaderClaims);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", customLoginRequestHeaderClaims, v13);

  customLoginRequestBodyClaims = self->_customLoginRequestBodyClaims;
  NSStringFromSelector(sel_customLoginRequestBodyClaims);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", customLoginRequestBodyClaims, v15);

  v16 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v16, "setFormatOptions:", 1907);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("created"));

  return v5;
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  -[POUserLoginConfiguration dictionaryRepresentationForDisplay:](self, "dictionaryRepresentationForDisplay:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 11, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__POUserLoginConfiguration_dataRepresentationForDisplay___block_invoke;
    v11[3] = &unk_2514FF9D0;
    v12 = v5;
    v7 = __57__POUserLoginConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v11);

    v8 = 0;
  }
  else
  {
    PO_LOG_POUserLoginConfiguration();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POUserLoginConfiguration dataRepresentationForDisplay:].cold.1((uint64_t)v4, v9);

    v8 = v4;
  }

  return v8;
}

id __57__POUserLoginConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing user login config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (POUserLoginConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  POUserLoginConfiguration *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *customAssertionRequestHeaderClaims;
  void *v11;
  uint64_t v12;
  NSDictionary *customAssertionRequestBodyClaims;
  void *v14;
  uint64_t v15;
  NSDictionary *customLoginRequestHeaderClaims;
  void *v17;
  uint64_t v18;
  NSDictionary *customLoginRequestBodyClaims;

  v4 = a3;
  NSStringFromSelector(sel_loginUserName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[POUserLoginConfiguration initWithLoginUserName:](self, "initWithLoginUserName:", v6);
  if (v7)
  {
    NSStringFromSelector(sel_customAssertionRequestHeaderClaims);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    customAssertionRequestHeaderClaims = v7->_customAssertionRequestHeaderClaims;
    v7->_customAssertionRequestHeaderClaims = (NSDictionary *)v9;

    NSStringFromSelector(sel_customAssertionRequestBodyClaims);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    customAssertionRequestBodyClaims = v7->_customAssertionRequestBodyClaims;
    v7->_customAssertionRequestBodyClaims = (NSDictionary *)v12;

    NSStringFromSelector(sel_customLoginRequestHeaderClaims);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    customLoginRequestHeaderClaims = v7->_customLoginRequestHeaderClaims;
    v7->_customLoginRequestHeaderClaims = (NSDictionary *)v15;

    NSStringFromSelector(sel_customLoginRequestBodyClaims);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    customLoginRequestBodyClaims = v7->_customLoginRequestBodyClaims;
    v7->_customLoginRequestBodyClaims = (NSDictionary *)v18;

  }
  return v7;
}

- (POUserLoginConfiguration)initWithData:(id)a3
{
  void *v4;
  id v5;
  POUserLoginConfiguration *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = __41__POUserLoginConfiguration_initWithData___block_invoke();
    v6 = 0;
  }
  else
  {
    self = -[POUserLoginConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v6 = self;
  }

  return v6;
}

id __41__POUserLoginConfiguration_initWithData___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error deserializing user login config."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserLoginConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POUserLoginConfiguration dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserLoginConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  POUserLoginConfiguration *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POUserLoginConfiguration initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[POUserLoginConfiguration dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSString)loginUserName
{
  return self->_loginUserName;
}

- (void)setLoginUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)customAssertionRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCustomAssertionRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)customAssertionRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCustomAssertionRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)customLoginRequestHeaderClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCustomLoginRequestHeaderClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)customLoginRequestBodyClaims
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCustomLoginRequestBodyClaims:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLoginRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customLoginRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestBodyClaims, 0);
  objc_storeStrong((id *)&self->_customAssertionRequestHeaderClaims, 0);
  objc_storeStrong((id *)&self->_loginUserName, 0);
}

- (void)dataRepresentationForDisplay:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 4);
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "serialized configuration: %{public}@", v4, 0xCu);

}

@end
