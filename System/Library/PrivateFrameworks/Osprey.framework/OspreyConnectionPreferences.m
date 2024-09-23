@implementation OspreyConnectionPreferences

- (OspreyConnectionPreferences)initWithConnectionHost:(id)a3 keychain:(id)a4
{
  id v6;
  id v7;
  OspreyConnectionPreferences *v8;
  void *v9;
  uint64_t v10;
  NSString *connectionHost;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OspreyConnectionPreferences;
  v8 = -[OspreyConnectionPreferences init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    connectionHost = v8->_connectionHost;
    v8->_connectionHost = (NSString *)v10;

    objc_storeStrong((id *)&v8->_keychain, a4);
  }

  return v8;
}

- (OspreyConnectionPreferences)initWithDictionary:(id)a3 keychain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OspreyConnectionPreferences *v9;
  NSDate *v10;
  NSDate *deviceAttestionExpireOn;
  NSNumber *v12;
  NSNumber *deviceAttestionVersion;
  NSNumber *v14;
  NSNumber *deviceAuthenticationVersion;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("host"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[OspreyConnectionPreferences initWithConnectionHost:keychain:](self, "initWithConnectionHost:keychain:", v8, v7);

  if (v9 == self)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("deviceAttestationExpireOn"));
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
    self->_deviceAttestionExpireOn = v10;

    objc_msgSend(v6, "objectForKey:", CFSTR("deviceAttestationVersion"));
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    deviceAttestionVersion = self->_deviceAttestionVersion;
    self->_deviceAttestionVersion = v12;

    objc_msgSend(v6, "objectForKey:", CFSTR("deviceAuthenticationVersion"));
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    deviceAuthenticationVersion = self->_deviceAuthenticationVersion;
    self->_deviceAuthenticationVersion = v14;

  }
  return v9;
}

- (id)dictionaryRepresentation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setValue:forKey:", self->_connectionHost, CFSTR("host"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceAttestionExpireOn, CFSTR("deviceAttestationExpireOn"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceAttestionVersion, CFSTR("deviceAttestationVersion"));
  objc_msgSend(v3, "setValue:forKey:", self->_deviceAuthenticationVersion, CFSTR("deviceAuthenticationVersion"));
  return v3;
}

- (void)deleteAll
{
  -[OspreyConnectionPreferences deleteCertificateData](self, "deleteCertificateData");
  -[OspreyConnectionPreferences deleteDeviceAttestationData](self, "deleteDeviceAttestationData");
}

- (void)resetCachedDeviceAttestation
{
  NSDate *deviceAttestionExpireOn;
  NSNumber *deviceAttestionVersion;

  -[OspreyConnectionPreferences deleteCertificateData](self, "deleteCertificateData");
  -[OspreyConnectionPreferences deleteDeviceAttestationData](self, "deleteDeviceAttestationData");
  deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
  self->_deviceAttestionExpireOn = 0;

  deviceAttestionVersion = self->_deviceAttestionVersion;
  self->_deviceAttestionVersion = 0;

}

- (id)_certificateDataKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceAttestation.certificate.for.%@"), self->_connectionHost);
}

- (NSData)certificateData
{
  OspreyKeychain *keychain;
  void *v4;
  NSData *v5;
  NSData *certificateData;

  if (!self->_certificateDataFetched)
  {
    keychain = self->_keychain;
    -[OspreyConnectionPreferences _certificateDataKey](self, "_certificateDataKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OspreyKeychain fetchDataWithIdentifier:](keychain, "fetchDataWithIdentifier:", v4);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    certificateData = self->_certificateData;
    self->_certificateData = v5;

    self->_certificateDataFetched = 1;
  }
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  NSData *v4;
  NSData *certificateData;
  OspreyKeychain *keychain;
  NSData *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  if (a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    certificateData = self->_certificateData;
    self->_certificateData = v4;

    self->_certificateDataFetched = 1;
    keychain = self->_keychain;
    v7 = self->_certificateData;
    -[OspreyConnectionPreferences _certificateDataKey](self, "_certificateDataKey");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[OspreyKeychain saveData:withIdentifier:](keychain, "saveData:withIdentifier:", v7, v16);

  }
  else
  {
    OspreyLoggingInit();
    v8 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR))
      -[OspreyConnectionPreferences setCertificateData:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

- (void)deleteCertificateData
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Error deleting certificate from keychain.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)_deviceAttestationDataKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceAttestation.for.%@"), self->_connectionHost);
}

- (BOOL)isDeviceAttestionExpired
{
  NSDate *deviceAttestionExpireOn;
  void *v3;

  deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(deviceAttestionExpireOn) = -[NSDate compare:](deviceAttestionExpireOn, "compare:", v3) == NSOrderedAscending;

  return (char)deviceAttestionExpireOn;
}

- (BOOL)setDeviceAttestationData:(id)a3 withExpiration:(id)a4
{
  id v6;
  id v7;
  NSData *v8;
  NSData *deviceAttestationData;
  void *v10;
  BOOL v11;
  NSDate *deviceAttestionExpireOn;
  NSData *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_storeStrong((id *)&self->_deviceAttestionExpireOn, a4);
    v8 = (NSData *)objc_msgSend(v6, "copy");
    deviceAttestationData = self->_deviceAttestationData;
    self->_deviceAttestationData = v8;

    -[OspreyConnectionPreferences _deviceAttestationDataKey](self, "_deviceAttestationDataKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextPreferences, OS_LOG_TYPE_DEBUG))
      -[OspreyConnectionPreferences setDeviceAttestationData:withExpiration:].cold.2();
    v11 = -[OspreyKeychain saveData:withIdentifier:](self->_keychain, "saveData:withIdentifier:", self->_deviceAttestationData, v10);

  }
  else
  {
    deviceAttestionExpireOn = self->_deviceAttestionExpireOn;
    self->_deviceAttestionExpireOn = 0;

    v13 = self->_deviceAttestationData;
    self->_deviceAttestationData = 0;

    OspreyLoggingInit();
    v14 = OspreyLogContextPreferences;
    if (os_log_type_enabled((os_log_t)OspreyLogContextPreferences, OS_LOG_TYPE_ERROR))
      -[OspreyConnectionPreferences setDeviceAttestationData:withExpiration:].cold.1((uint64_t)self, v14);
    v11 = 0;
  }

  return v11;
}

- (id)deviceAttestationData
{
  void *v3;
  NSData *deviceAttestationData;
  NSData *v5;
  NSData *v6;
  NSData *v7;
  NSData *v8;

  -[OspreyConnectionPreferences _deviceAttestationDataKey](self, "_deviceAttestationDataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[OspreyConnectionPreferences isDeviceAttestionExpired](self, "isDeviceAttestionExpired"))
  {
    -[OspreyKeychain deleteDataWithIdentifier:](self->_keychain, "deleteDataWithIdentifier:", v3);
    deviceAttestationData = self->_deviceAttestationData;
    self->_deviceAttestationData = 0;

    v5 = 0;
  }
  else
  {
    v6 = self->_deviceAttestationData;
    if (!v6)
    {
      -[OspreyKeychain fetchDataWithIdentifier:](self->_keychain, "fetchDataWithIdentifier:", v3);
      v7 = (NSData *)objc_claimAutoreleasedReturnValue();
      v8 = self->_deviceAttestationData;
      self->_deviceAttestationData = v7;

      v6 = self->_deviceAttestationData;
    }
    v5 = v6;
  }

  return v5;
}

- (void)deleteDeviceAttestationData
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B97C2000, v0, OS_LOG_TYPE_DEBUG, "%s Deleted with key: '%@'", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (NSString)connectionHost
{
  return self->_connectionHost;
}

- (void)setConnectionHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)deviceAuthenticationVersion
{
  return self->_deviceAuthenticationVersion;
}

- (void)setDeviceAuthenticationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)deviceAttestionVersion
{
  return self->_deviceAttestionVersion;
}

- (void)setDeviceAttestionVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)deviceAttestionExpireOn
{
  return self->_deviceAttestionExpireOn;
}

- (void)setDeviceAttestionExpireOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAttestionExpireOn, 0);
  objc_storeStrong((id *)&self->_deviceAttestionVersion, 0);
  objc_storeStrong((id *)&self->_deviceAuthenticationVersion, 0);
  objc_storeStrong((id *)&self->_connectionHost, 0);
  objc_storeStrong((id *)&self->_deviceAttestationData, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_keychain, 0);
}

- (void)setCertificateData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B97C2000, a1, a3, "%s Attempted to save nil data for certificate.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceAttestationData:(uint64_t)a1 withExpiration:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 136315394;
  v4 = "-[OspreyConnectionPreferences setDeviceAttestationData:withExpiration:]";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1B97C2000, a2, OS_LOG_TYPE_ERROR, "%s Attempted to save nil data for device attestation data for host: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceAttestationData:withExpiration:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_1B97C2000, v2, OS_LOG_TYPE_DEBUG, "%s Saved with key: '%@' and expiration: %@", (uint8_t *)v3, 0x20u);
}

@end
