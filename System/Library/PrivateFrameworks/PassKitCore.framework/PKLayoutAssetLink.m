@implementation PKLayoutAssetLink

+ (id)assetKey
{
  return CFSTR("links");
}

+ (id)nameToAssetsMapFromDictionaries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_146);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_20_2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

PKLayoutAssetLink *__53__PKLayoutAssetLink_nameToAssetsMapFromDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKLayoutAssetLink *v3;

  v2 = a2;
  v3 = -[PKLayoutAssetLink initWithDictionary:]([PKLayoutAssetLink alloc], "initWithDictionary:", v2);

  return v3;
}

uint64_t __53__PKLayoutAssetLink_nameToAssetsMapFromDictionaries___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (PKLayoutAssetLink)initWithDictionary:(id)a3
{
  id v4;
  PKLayoutAssetLink *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *displayText;
  uint64_t v10;
  NSURL *url;
  uint64_t v12;
  PKOSVersionRequirementRange *osVersionRange;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSNumber *adamID;
  NSNumber *v20;
  NSString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *configuration;
  PKLayoutAssetLink *v26;
  uint64_t v28;
  objc_super v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKLayoutAssetLink;
  v5 = -[PKLayoutAssetLink init](&v29, sel_init);
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("key"));
  v6 = objc_claimAutoreleasedReturnValue();
  name = v5->_name;
  v5->_name = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("displayName"));
  v8 = objc_claimAutoreleasedReturnValue();
  displayText = v5->_displayText;
  v5->_displayText = (NSString *)v8;

  objc_msgSend(v4, "PKURLForKey:", CFSTR("url"));
  v10 = objc_claimAutoreleasedReturnValue();
  url = v5->_url;
  v5->_url = (NSURL *)v10;

  PKOSVersionRequirementRangeFromLayoutAssetDictionary(v4);
  v12 = objc_claimAutoreleasedReturnValue();
  osVersionRange = v5->_osVersionRange;
  v5->_osVersionRange = (PKOSVersionRequirementRange *)v12;

  objc_msgSend(v4, "objectForKey:", CFSTR("adamID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    if (objc_msgSend(v17, "scanUnsignedLongLong:", &v28) && v28)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v18 = objc_claimAutoreleasedReturnValue();
      adamID = v5->_adamID;
      v5->_adamID = (NSNumber *)v18;
    }
    else
    {
      adamID = v5->_adamID;
      v5->_adamID = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
    v20 = v14;
    v16 = v5->_adamID;
    v5->_adamID = v20;
  }

LABEL_11:
  v21 = v5->_name;
  if (!v21 || !-[NSString length](v21, "length"))
  {

    v26 = 0;
    goto LABEL_18;
  }
  v22 = (void *)objc_msgSend(v4, "mutableCopy");
  v30[0] = CFSTR("key");
  v30[1] = CFSTR("displayName");
  v30[2] = CFSTR("url");
  v30[3] = CFSTR("adamID");
  v30[4] = CFSTR("osVersionRange");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsForKeys:", v23);
  if (objc_msgSend(v22, "count"))
  {
    v24 = objc_msgSend(v22, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v24;

  }
LABEL_16:
  v26 = v5;
LABEL_18:

  return v26;
}

- (PKOSVersionRequirementRange)osVersionRange
{
  return self->_osVersionRange;
}

- (void)setOsVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionRange, a3);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_storeStrong((id *)&self->_displayText, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end
