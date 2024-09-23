@implementation POPrebootDeviceConfiguration

- (void)setEncryptionKeyData:(id)a3
{
  NSDate *v5;
  NSDate *encryptionKeySaveDate;
  id v7;

  objc_storeStrong((id *)&self->_encryptionKeyData, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  encryptionKeySaveDate = self->_encryptionKeySaveDate;
  self->_encryptionKeySaveDate = v5;

}

- (id)dataRepresentation
{
  return -[POPrebootDeviceConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 0);
}

- (id)dictionaryRepresentationForDisplay:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  NSData *encryptionKeyData;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v5, "setFormatOptions:", 1907);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  encryptionKeyData = self->_encryptionKeyData;
  if (v3)
    -[NSData psso_sha256HashString](encryptionKeyData, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](encryptionKeyData, "psso_base64URLEncodedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptionKeyData);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

  if (v3)
  {
    objc_msgSend(v5, "stringFromDate:", self->_encryptionKeySaveDate);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[NSDate timeIntervalSince1970](self->_encryptionKeySaveDate, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptionKeySaveDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v12);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("created"));

  return v6;
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

  -[POPrebootDeviceConfiguration dictionaryRepresentationForDisplay:](self, "dictionaryRepresentationForDisplay:", a3);
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
    v11[2] = __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke;
    v11[3] = &unk_2514FF9D0;
    v12 = v5;
    v7 = __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v11);

    v8 = 0;
  }
  else
  {
    PO_LOG_POPrebootDeviceConfiguration();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POPrebootDeviceConfiguration dataRepresentationForDisplay:].cold.1((uint64_t)v4, v9);

    v8 = v4;
  }

  return v8;
}

id __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing user login config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POPrebootDeviceConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

- (POPrebootDeviceConfiguration)initWithDictionary:(id)a3
{
  id v4;
  POPrebootDeviceConfiguration *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSData *encryptionKeyData;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDate *encryptionKeySaveDate;

  v4 = a3;
  v5 = -[POPrebootDeviceConfiguration init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_encryptionKeyData);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_encryptionKeyData);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "psso_initWithBase64URLEncodedString:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      encryptionKeyData = v5->_encryptionKeyData;
      v5->_encryptionKeyData = (NSData *)v11;

    }
    NSStringFromSelector(sel_encryptionKeySaveDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      NSStringFromSelector(sel_encryptionKeySaveDate);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v16, "intValue"));
      v17 = objc_claimAutoreleasedReturnValue();
      encryptionKeySaveDate = v5->_encryptionKeySaveDate;
      v5->_encryptionKeySaveDate = (NSDate *)v17;

    }
  }

  return v5;
}

- (POPrebootDeviceConfiguration)initWithData:(id)a3
{
  void *v4;
  id v5;
  POPrebootDeviceConfiguration *v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = __45__POPrebootDeviceConfiguration_initWithData___block_invoke();
    v6 = 0;
  }
  else
  {
    self = -[POPrebootDeviceConfiguration initWithDictionary:](self, "initWithDictionary:", v4);
    v6 = self;
  }

  return v6;
}

id __45__POPrebootDeviceConfiguration_initWithData___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error deserializing user login config."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POPrebootDeviceConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return v0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POPrebootDeviceConfiguration dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POPrebootDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  POPrebootDeviceConfiguration *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POPrebootDeviceConfiguration initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[POPrebootDeviceConfiguration dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (NSData)encryptionKeyData
{
  return self->_encryptionKeyData;
}

- (NSDate)encryptionKeySaveDate
{
  return self->_encryptionKeySaveDate;
}

- (NSData)deviceConfigurationData
{
  return self->_deviceConfigurationData;
}

- (void)setDeviceConfigurationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)loginConfigurationData
{
  return self->_loginConfigurationData;
}

- (void)setLoginConfigurationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginConfigurationData, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationData, 0);
  objc_storeStrong((id *)&self->_encryptionKeySaveDate, 0);
  objc_storeStrong((id *)&self->_encryptionKeyData, 0);
}

- (void)dataRepresentationForDisplay:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a1, 4);
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "serialized configuration: %{public}@", (uint8_t *)&v4, 0xCu);

}

void __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24440D000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

@end
