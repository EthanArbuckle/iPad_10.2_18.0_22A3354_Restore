@implementation SPSearchAppEntity

- (SPSearchAppEntity)initWithBundleIdentifier:(id)a3 appName:(id)a4 fromSuggestion:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  SPSearchAppEntity *v11;
  SPSearchAppEntity *v12;
  objc_super v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SPSearchAppEntity;
  v11 = -[SPSearchAppEntity init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SPSearchEntity setTokenString:](v11, "setTokenString:", v10);
    -[SPSearchEntity setDisplayString:](v12, "setDisplayString:", v10);
    objc_storeStrong((id *)&v12->_bundleIdentifier, a3);
    -[SPSearchEntity setIsSuggestion:](v12, "setIsSuggestion:", v5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPSearchAppEntity;
  v4 = a3;
  -[SPSearchEntity encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[SPSearchAppEntity bundleIdentifier](self, "bundleIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, kAppIdentifierKey);

  objc_msgSend(v4, "encodeBool:forKey:", -[SPSearchEntity isSuggestion](self, "isSuggestion"), CFSTR("isSuggestion"));
}

- (SPSearchAppEntity)initWithCoder:(id)a3
{
  id v4;
  SPSearchAppEntity *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  if (initWithCoder__onceAppClassesToken != -1)
    dispatch_once(&initWithCoder__onceAppClassesToken, &__block_literal_global_318);
  v9.receiver = self;
  v9.super_class = (Class)SPSearchAppEntity;
  v5 = -[SPSearchEntity initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__appClassesToDecode, kAppIdentifierKey);
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSuggestion")));
  }

  return v5;
}

void __35__SPSearchAppEntity_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__appClassesToDecode;
  initWithCoder__appClassesToDecode = v2;

}

- (BOOL)isAppEntitySearch
{
  return 1;
}

- (BOOL)isScopedSearch
{
  return 1;
}

- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 additions:(id)a6 flags:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (__CFString *)a7;
  if (objc_msgSend(v12, "length"))
  {
    if (objc_msgSend(v20, "length"))
      objc_msgSend(v20, "appendString:", CFSTR(" || "));
    v15 = -[__CFString length](v14, "length");
    v16 = &stru_1E6E549F0;
    if (v15)
      v16 = v14;
    if (v13)
      objc_msgSend(v20, "appendFormat:", CFSTR("(%@=\"%@\"%@ || (kMDItemDisplayName=\"%@\" && _kMDItemBundleID=\"com.apple.application\")) && (%@) && (%@) && (%@) && (%@))"), v11, v12, v16, v13, CFSTR("!(FieldMatch(@\"_kMDItemDomainIdentifier\",@\"com.apple.siri.interactions\", @\"com.apple.siri.interactions\", @\"com.apple.siri.upcomingmedia\"))"), CFSTR("(_kMDItemUserActivityEligibleForPublicIndexing != 1 && _kMDItemUserActivityEligibleForPublicIndexing != 0)"), CFSTR("kMDItemContentType != \"public.folder\"), CFSTR("com_apple_mobilesms_chatStyle!=*"));
    else
      objc_msgSend(v20, "appendFormat:", CFSTR("(%@=\"%@\"%@) && (%@) && (%@)"), v11, v12, v16, CFSTR("!(FieldMatch(@\"_kMDItemDomainIdentifier\",@\"com.apple.siri.interactions\", @\"com.apple.siri.interactions\", @\"com.apple.siri.upcomingmedia\"))"), CFSTR("(_kMDItemUserActivityEligibleForPublicIndexing != 1 && _kMDItemUserActivityEligibleForPublicIndexing != 0)"), v17, v18, v19);
  }

}

- (id)spotlightQueryString
{
  void *v3;
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[SPSearchAppEntity bundleIdentifier](self, "bundleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[SPSearchAppEntity bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

  if (v6)
  {

    v4 = CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider");
  }
  if (-[SPSearchEntity hasWords](self, "hasWords"))
  {
    v7 = 0;
  }
  else
  {
    -[SPSearchEntity tokenText](self, "tokenText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SPSearchAppEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, *MEMORY[0x1E0CA6060], v4, v7, 0);

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
