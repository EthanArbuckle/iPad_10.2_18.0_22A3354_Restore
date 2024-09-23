@implementation WBSGeneratedPassword

+ (NSString)privateBrowsingSentinel
{
  return (NSString *)CFSTR("Saved In Private Browsing");
}

+ (id)keychainDictionaryRepresentationWithPassword:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = CFSTR("pwd");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WBSGeneratedPassword)initWithPassword:(id)a3 protectionSpace:(id)a4 generationDate:(id)a5 wasGeneratedInPrivateBrowsingSession:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  WBSGeneratedPassword *v13;
  uint64_t v14;
  NSString *password;
  uint64_t v16;
  NSURLProtectionSpace *protectionSpace;
  WBSGeneratedPassword *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSGeneratedPassword;
  v13 = -[WBSGeneratedPassword init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    password = v13->_password;
    v13->_password = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    protectionSpace = v13->_protectionSpace;
    v13->_protectionSpace = (NSURLProtectionSpace *)v16;

    objc_storeStrong((id *)&v13->_generationDate, a5);
    v13->_wasGeneratedInPrivateBrowsingSession = a6;
    v18 = v13;
  }

  return v13;
}

- (WBSGeneratedPassword)initWithKeychainItemDictionary:(id)a3
{
  id v4;
  WBSGeneratedPassword *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  NSDate *generationDate;
  uint64_t v11;
  NSData *keychainPersistentReference;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSURLProtectionSpace *protectionSpace;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSDictionary *originalKeychainDictionary;
  void *v28;
  uint64_t v29;
  NSString *password;
  WBSGeneratedPassword *v31;
  NSObject *v32;
  NSObject *v33;
  id v35;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WBSGeneratedPassword;
  v5 = -[WBSGeneratedPassword init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    generationDate = v5->_generationDate;
    v5->_generationDate = (NSDate *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
    v11 = objc_claimAutoreleasedReturnValue();
    keychainPersistentReference = v5->_keychainPersistentReference;
    v5->_keychainPersistentReference = (NSData *)v11;

    v13 = *MEMORY[0x1E0CD6B50];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Saved In Private Browsing"));
    v5->_wasGeneratedInPrivateBrowsingSession = v15;
    if ((v15 & 1) == 0)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v16, "setScheme:", CFSTR("https"));
      objc_msgSend(v4, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHost:", v17);

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AC8]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPort:", v18);

      v19 = (void *)MEMORY[0x1E0C92C70];
      objc_msgSend(v16, "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safari_HTMLFormProtectionSpaceForURL:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      protectionSpace = v5->_protectionSpace;
      v5->_protectionSpace = (NSURLProtectionSpace *)v21;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v23, 0, 0, &v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v35;
      if (v24)
      {
        v26 = objc_msgSend(v24, "copy");
        originalKeychainDictionary = v5->_originalKeychainDictionary;
        v5->_originalKeychainDictionary = (NSDictionary *)v26;

        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("pwd"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "copy");
        password = v5->_password;
        v5->_password = (NSString *)v29;

        v31 = v5;
      }
      else
      {
        v33 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[WBSGeneratedPassword initWithKeychainItemDictionary:].cold.2(v33, v25);
        v31 = 0;
      }

    }
    else
    {
      v32 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[WBSGeneratedPassword initWithKeychainItemDictionary:].cold.1(v32);
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)-[WBSGeneratedPassword keychainDictionaryRepresentationWithPassword:](self, "keychainDictionaryRepresentationWithPassword:", self->_password);
}

- (id)keychainDictionaryRepresentationWithPassword:(id)a3
{
  NSDictionary *originalKeychainDictionary;
  id v4;
  void *v5;

  if (self->_originalKeychainDictionary)
    originalKeychainDictionary = self->_originalKeychainDictionary;
  else
    originalKeychainDictionary = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v4 = a3;
  v5 = (void *)-[NSDictionary mutableCopy](originalKeychainDictionary, "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("pwd"));

  return v5;
}

- (BOOL)wasGeneratedInPrivateBrowsingSession
{
  return self->_wasGeneratedInPrivateBrowsingSession;
}

- (NSDate)generationDate
{
  return self->_generationDate;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (NSString)password
{
  return self->_password;
}

- (NSData)keychainPersistentReference
{
  return self->_keychainPersistentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainPersistentReference, 0);
  objc_storeStrong((id *)&self->_generationDate, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
}

- (void)initWithKeychainItemDictionary:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v4, "Found non-Data object in data field of generated password item: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_4();
}

- (void)initWithKeychainItemDictionary:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v3, v5, "Unable to unarchive data blob from generated password item: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_4();
}

@end
