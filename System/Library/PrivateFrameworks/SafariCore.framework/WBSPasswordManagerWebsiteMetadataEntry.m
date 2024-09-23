@implementation WBSPasswordManagerWebsiteMetadataEntry

- (WBSPasswordManagerWebsiteMetadataEntry)initWithKeychainDictionary:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  WBSPasswordManagerWebsiteMetadataEntry *v8;
  uint64_t v9;
  NSDictionary *originalBackingDictionary;
  uint64_t v11;
  NSString *websiteName;
  uint64_t v13;
  NSDate *websiteNameDateLastModified;
  uint64_t v15;
  NSDate *websiteNameDateLastRefreshed;
  WBSPasswordManagerWebsiteMetadataEntry *v17;
  NSObject *v18;
  NSObject *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSPasswordManagerWebsiteMetadataEntry;
  v8 = -[WBSPasswordManagerWebsiteMetadataEntry init](&v21, sel_init);
  if (!v8)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WBSPasswordManagerWebsiteMetadataEntry initWithKeychainDictionary:forDomain:].cold.1((uint64_t)v7, v18);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[WBSPasswordManagerWebsiteMetadataEntry initWithKeychainDictionary:forDomain:].cold.2((uint64_t)v7, v19);
    goto LABEL_9;
  }
  v9 = objc_msgSend(v6, "copy");
  originalBackingDictionary = v8->_originalBackingDictionary;
  v8->_originalBackingDictionary = (NSDictionary *)v9;

  -[NSDictionary safari_stringForKey:](v8->_originalBackingDictionary, "safari_stringForKey:", CFSTR("wn"));
  v11 = objc_claimAutoreleasedReturnValue();
  websiteName = v8->_websiteName;
  v8->_websiteName = (NSString *)v11;

  -[NSDictionary safari_dateForKey:](v8->_originalBackingDictionary, "safari_dateForKey:", CFSTR("wn_dm"));
  v13 = objc_claimAutoreleasedReturnValue();
  websiteNameDateLastModified = v8->_websiteNameDateLastModified;
  v8->_websiteNameDateLastModified = (NSDate *)v13;

  -[NSDictionary safari_dateForKey:](v8->_originalBackingDictionary, "safari_dateForKey:", CFSTR("wn_dr"));
  v15 = objc_claimAutoreleasedReturnValue();
  websiteNameDateLastRefreshed = v8->_websiteNameDateLastRefreshed;
  v8->_websiteNameDateLastRefreshed = (NSDate *)v15;

  v17 = v8;
LABEL_10:

  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; websiteName = %@; websiteNameDateLastModified = %@; websiteNameDateLastRefreshed = %@>"),
    v5,
    self,
    self->_websiteName,
    self->_websiteNameDateLastModified,
    self->_websiteNameDateLastRefreshed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)updateWebsiteName:(id)a3
{
  id v4;
  NSDate *v5;
  NSString *websiteName;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSDate *websiteNameDateLastRefreshed;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  websiteName = self->_websiteName;
  if (websiteName && -[NSString isEqualToString:](websiteName, "isEqualToString:", v4))
  {
    v7 = 0;
  }
  else
  {
    v8 = (NSString *)objc_msgSend(v4, "copy");
    v9 = self->_websiteName;
    self->_websiteName = v8;

    objc_storeStrong((id *)&self->_websiteNameDateLastModified, v5);
    v7 = 1;
  }
  websiteNameDateLastRefreshed = self->_websiteNameDateLastRefreshed;
  self->_websiteNameDateLastRefreshed = v5;

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSDate *websiteNameDateLastModified;
  NSDate *websiteNameDateLastRefreshed;
  void *v9;

  v3 = (void *)-[NSDictionary mutableCopy](self->_originalBackingDictionary, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (-[NSString length](self->_websiteName, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_websiteName, CFSTR("wn"));
  websiteNameDateLastModified = self->_websiteNameDateLastModified;
  if (websiteNameDateLastModified)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", websiteNameDateLastModified, CFSTR("wn_dm"));
  websiteNameDateLastRefreshed = self->_websiteNameDateLastRefreshed;
  if (websiteNameDateLastRefreshed)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", websiteNameDateLastRefreshed, CFSTR("wn_dr"));
  v9 = (void *)objc_msgSend(v6, "copy");

  return (NSDictionary *)v9;
}

+ (NSString)keychainAccountName
{
  return (NSString *)&stru_1E64A2498;
}

- (NSString)keychainItemDescription
{
  return (NSString *)_WBSLocalizedString(CFSTR("Website Metadata"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
}

- (id)keychainItemLabelForDomain:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  _WBSLocalizedString(CFSTR("Website Metadata for %@"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)originalBackingDictionary
{
  return self->_originalBackingDictionary;
}

- (NSString)websiteName
{
  return self->_websiteName;
}

- (NSDate)websiteNameDateLastModified
{
  return self->_websiteNameDateLastModified;
}

- (NSDate)websiteNameDateLastRefreshed
{
  return self->_websiteNameDateLastRefreshed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteNameDateLastRefreshed, 0);
  objc_storeStrong((id *)&self->_websiteNameDateLastModified, 0);
  objc_storeStrong((id *)&self->_websiteName, 0);
  objc_storeStrong((id *)&self->_originalBackingDictionary, 0);
}

- (void)initWithKeychainDictionary:(uint64_t)a1 forDomain:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_1B2621000, a2, OS_LOG_TYPE_ERROR, "Error initializing WBSPasswordManagerWebsiteMetadataEntry: received nil keychain dictionary for %{private}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithKeychainDictionary:(uint64_t)a1 forDomain:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 138478083;
  v5 = a1;
  v6 = 2112;
  v7 = objc_opt_class();
  _os_log_fault_impl(&dword_1B2621000, v3, OS_LOG_TYPE_FAULT, "Error initializing WBSPasswordManagerWebsiteMetadataEntry: received non-Dictionary keychain dictionary for %{private}@; type was %@",
    (uint8_t *)&v4,
    0x16u);

}

@end
