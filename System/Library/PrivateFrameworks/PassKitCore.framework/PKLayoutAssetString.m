@implementation PKLayoutAssetString

+ (id)assetKey
{
  return CFSTR("strings");
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
      objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_25);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_18);
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

PKLayoutAssetString *__55__PKLayoutAssetString_nameToAssetsMapFromDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKLayoutAssetString *v3;

  v2 = a2;
  v3 = -[PKLayoutAssetString initWithDictionary:]([PKLayoutAssetString alloc], "initWithDictionary:", v2);

  return v3;
}

uint64_t __55__PKLayoutAssetString_nameToAssetsMapFromDictionaries___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (PKLayoutAssetString)initWithDictionary:(id)a3
{
  id v4;
  PKLayoutAssetString *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *displayText;
  uint64_t v10;
  NSString *markdownText;
  uint64_t v12;
  PKOSVersionRequirementRange *osVersionRange;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *configuration;
  PKLayoutAssetString *v19;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKLayoutAssetString;
  v5 = -[PKLayoutAssetString init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("key"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("markdownValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    markdownText = v5->_markdownText;
    v5->_markdownText = (NSString *)v10;

    PKOSVersionRequirementRangeFromLayoutAssetDictionary(v4);
    v12 = objc_claimAutoreleasedReturnValue();
    osVersionRange = v5->_osVersionRange;
    v5->_osVersionRange = (PKOSVersionRequirementRange *)v12;

    v14 = v5->_name;
    if (!v14 || !-[NSString length](v14, "length") || !v5->_displayText && !v5->_markdownText)
    {
      v19 = 0;
      goto LABEL_11;
    }
    v15 = (void *)objc_msgSend(v4, "mutableCopy");
    v22[0] = CFSTR("key");
    v22[1] = CFSTR("value");
    v22[2] = CFSTR("markdownValue");
    v22[3] = CFSTR("osVersionRange");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectsForKeys:", v16);
    if (objc_msgSend(v15, "count"))
    {
      v17 = objc_msgSend(v15, "copy");
      configuration = v5->_configuration;
      v5->_configuration = (NSDictionary *)v17;

    }
  }
  v19 = v5;
LABEL_11:

  return v19;
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

- (NSString)markdownText
{
  return self->_markdownText;
}

- (void)setMarkdownText:(id)a3
{
  objc_storeStrong((id *)&self->_markdownText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markdownText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_osVersionRange, 0);
}

@end
