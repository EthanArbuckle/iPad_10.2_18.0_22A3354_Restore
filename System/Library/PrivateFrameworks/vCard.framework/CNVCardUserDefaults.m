@implementation CNVCardUserDefaults

+ (BOOL)includeNotesInVCards
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ABIncludeNotesInVCard"));
}

+ (BOOL)includePhotosInVCards
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ABIncludePhotosInVCard"));
}

+ (BOOL)includeUserSettings
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ABIncludeUserSettingsInVCard"));
}

+ (BOOL)isPrivateVCardFieldsEnabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ABPrivateVCardFieldsEnabled"));
}

+ (id)vCardPrivateFields
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "objectForKey:", CFSTR("ABPrivateVCardFields"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "_cn_filter:", &__block_literal_global_17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __41__CNVCardUserDefaults_vCardPrivateFields__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(v6, "BOOLValue");
  return v7;
}

+ (unint64_t)outputFormat
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ABUse21vCardFormat"));
}

+ (id)vCard21Encoding
{
  return (id)objc_msgSend(a1, "objectForKey:", CFSTR("AB21vCardEncoding"));
}

+ (int64_t)defaultNameOrdering
{
  return objc_msgSend(a1, "integerForKey:", CFSTR("ABNameDisplay"));
}

+ (BOOL)debugLogEnabled
{
  return objc_msgSend(a1, "BOOLForKey:", CFSTR("ABVCardDebug"));
}

+ (BOOL)BOOLForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.AddressBook"), 0) != 0;
}

+ (int64_t)integerForKey:(id)a3
{
  return CFPreferencesGetAppIntegerValue((CFStringRef)a3, CFSTR("com.apple.AddressBook"), 0);
}

+ (id)objectForKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.AddressBook"));
}

@end
