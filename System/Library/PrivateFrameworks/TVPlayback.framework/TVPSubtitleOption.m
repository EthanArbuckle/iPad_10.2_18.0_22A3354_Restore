@implementation TVPSubtitleOption

+ (id)offSubtitleOption
{
  return -[TVPSubtitleOption initWithAVMediaSelectionOption:]([TVPOffSubtitleOption alloc], "initWithAVMediaSelectionOption:", 0);
}

+ (id)offSubtitleOptionWithAVMediaSelectionOption:(id)a3
{
  id v3;
  TVPOffSubtitleOption *v4;

  v3 = a3;
  v4 = -[TVPSubtitleOption initWithAVMediaSelectionOption:]([TVPOffSubtitleOption alloc], "initWithAVMediaSelectionOption:", v3);

  return v4;
}

+ (id)autoSubtitleOption
{
  return -[TVPSubtitleOption initWithAVMediaSelectionOption:]([TVPAutoSubtitleOption alloc], "initWithAVMediaSelectionOption:", 0);
}

- (TVPSubtitleOption)initWithAVMediaSelectionOption:(id)a3
{
  id v5;
  TVPSubtitleOption *v6;
  TVPSubtitleOption *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVPSubtitleOption;
  v6 = -[TVPSubtitleOption init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avMediaSelectionOption, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__currentLocaleDidChange_, *MEMORY[0x24BDBCA70], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TVPSubtitleOption;
  -[TVPSubtitleOption dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "avMediaSelectionOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)languageCodeFromLocale
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *languageCodeFromLocale;
  NSString *v7;

  if (!self->_languageCodeFromLocale)
  {
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvp_subtitleLanguageCode");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    languageCodeFromLocale = self->_languageCodeFromLocale;
    self->_languageCodeFromLocale = v5;

    if (!self->_languageCodeFromLocale && -[TVPSubtitleOption subtitleType](self, "subtitleType") == 2)
    {
      v7 = self->_languageCodeFromLocale;
      self->_languageCodeFromLocale = (NSString *)CFSTR("en");

    }
  }
  return self->_languageCodeFromLocale;
}

- (NSString)languageCodeBCP47
{
  NSString *languageCodeBCP47;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  languageCodeBCP47 = self->_languageCodeBCP47;
  if (!languageCodeBCP47)
  {
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extendedLanguageTag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_languageCodeBCP47;
    self->_languageCodeBCP47 = v6;

    languageCodeBCP47 = self->_languageCodeBCP47;
  }
  return languageCodeBCP47;
}

- (NSString)identifier
{
  NSString *identifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;

  identifier = self->_identifier;
  if (!identifier)
  {
    v4 = (void *)MEMORY[0x24BDB2588];
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commonMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataItemsFromArray:withKey:keySpace:", v6, *MEMORY[0x24BDB1DA0], *MEMORY[0x24BDB1E38]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)objc_msgSend(v9, "copy");
    v11 = self->_identifier;
    self->_identifier = v10;

    if (!self->_identifier)
    {
      self->_identifier = (NSString *)&stru_24F15E1B8;

    }
    identifier = self->_identifier;
  }
  return identifier;
}

- (NSString)localizedDisplayString
{
  NSString *localizedDisplayString;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  localizedDisplayString = self->_localizedDisplayString;
  if (!localizedDisplayString)
  {
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvp_localizedDisplayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_localizedDisplayString;
    self->_localizedDisplayString = v6;

    localizedDisplayString = self->_localizedDisplayString;
  }
  return localizedDisplayString;
}

- (BOOL)containsOnlyForcedSubtitles
{
  NSNumber *cachedContainsOnlyForcedSubtitles;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  cachedContainsOnlyForcedSubtitles = self->_cachedContainsOnlyForcedSubtitles;
  if (!cachedContainsOnlyForcedSubtitles)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CA0]));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedContainsOnlyForcedSubtitles;
    self->_cachedContainsOnlyForcedSubtitles = v6;

    cachedContainsOnlyForcedSubtitles = self->_cachedContainsOnlyForcedSubtitles;
  }
  return -[NSNumber BOOLValue](cachedContainsOnlyForcedSubtitles, "BOOLValue");
}

- (int64_t)subtitleType
{
  NSNumber *cachedSubtitleType;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSNumber *v8;
  NSNumber *v9;

  cachedSubtitleType = self->_cachedSubtitleType;
  if (!cachedSubtitleType)
  {
    -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1CF8]);

    if ((v6 & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v4, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CA8])
           && (objc_msgSend(v4, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CE0]) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v4, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CB8]))
    {
      v7 = 3;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->_cachedSubtitleType;
    self->_cachedSubtitleType = v8;

    cachedSubtitleType = self->_cachedSubtitleType;
  }
  return -[NSNumber integerValue](cachedSubtitleType, "integerValue");
}

- (id)description
{
  void *v2;
  void *v3;

  -[TVPSubtitleOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_currentLocaleDidChange:(id)a3
{
  -[TVPSubtitleOption setLocalizedDisplayString:](self, "setLocalizedDisplayString:", 0);
}

- (void)setLanguageCodeFromLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setLanguageCodeBCP47:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLocalizedDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AVMediaSelectionOption)avMediaSelectionOption
{
  return self->_avMediaSelectionOption;
}

- (void)setAvMediaSelectionOption:(id)a3
{
  objc_storeStrong((id *)&self->_avMediaSelectionOption, a3);
}

- (NSNumber)cachedContainsOnlyForcedSubtitles
{
  return self->_cachedContainsOnlyForcedSubtitles;
}

- (void)setCachedContainsOnlyForcedSubtitles:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContainsOnlyForcedSubtitles, a3);
}

- (NSNumber)cachedSubtitleType
{
  return self->_cachedSubtitleType;
}

- (void)setCachedSubtitleType:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSubtitleType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubtitleType, 0);
  objc_storeStrong((id *)&self->_cachedContainsOnlyForcedSubtitles, 0);
  objc_storeStrong((id *)&self->_avMediaSelectionOption, 0);
  objc_storeStrong((id *)&self->_localizedDisplayString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_languageCodeBCP47, 0);
  objc_storeStrong((id *)&self->_languageCodeFromLocale, 0);
}

@end
