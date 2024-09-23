@implementation TVPAudioOption

- (TVPAudioOption)initWithPropertyListRepresentation:(id)a3
{
  id v5;
  TVPAudioOption *v6;
  TVPAudioOption *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPAudioOption;
  v6 = -[TVPAudioOption init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_propertyListRepresentation, a3);
    v7->_trackID = 0;
  }

  return v7;
}

- (TVPAudioOption)initWithSavedTrackID:(int)a3 savedLocaleLanguageCode:(id)a4
{
  id v6;
  TVPAudioOption *v7;
  TVPAudioOption *v8;
  uint64_t v9;
  NSString *savedLocaleLanguageCode;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TVPAudioOption;
  v7 = -[TVPAudioOption init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_trackID = a3;
    v9 = objc_msgSend(v6, "copy");
    savedLocaleLanguageCode = v8->_savedLocaleLanguageCode;
    v8->_savedLocaleLanguageCode = (NSString *)v9;

  }
  return v8;
}

- (TVPAudioOption)initWithOption:(id)a3
{
  id v5;
  TVPAudioOption *v6;
  TVPAudioOption *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVPAudioOption;
  v6 = -[TVPAudioOption init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avMediaSelectionOption, a3);
    v7->_trackID = 0;
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
  v4.super_class = (Class)TVPAudioOption;
  -[TVPAudioOption dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
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

  -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)languageCodeFromLocale
{
  NSString *languageCodeFromLocale;
  NSString **p_languageCodeFromLocale;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  p_languageCodeFromLocale = &self->_languageCodeFromLocale;
  languageCodeFromLocale = self->_languageCodeFromLocale;
  if (!languageCodeFromLocale)
  {
    objc_storeStrong((id *)p_languageCodeFromLocale, self->_savedLocaleLanguageCode);
    languageCodeFromLocale = self->_languageCodeFromLocale;
    if (!languageCodeFromLocale)
    {
      -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)objc_msgSend(v7, "copy");
      v9 = self->_languageCodeFromLocale;
      self->_languageCodeFromLocale = v8;

      languageCodeFromLocale = self->_languageCodeFromLocale;
    }
  }
  return languageCodeFromLocale;
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
    -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
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
    -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
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

- (NSString)title
{
  NSString *title;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;

  title = self->_title;
  if (!title)
  {
    v4 = (void *)MEMORY[0x24BDB2588];
    -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commonMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadataItemsFromArray:filteredByIdentifier:", v6, *MEMORY[0x24BDB1D78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)objc_msgSend(v9, "copy");
    v11 = self->_title;
    self->_title = v10;

    title = self->_title;
  }
  return title;
}

- (id)propertyListRepresentation
{
  id v3;
  void *v4;

  v3 = self->_propertyListRepresentation;
  if (!v3)
  {
    -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyList");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)hasAudioDescriptions
{
  void *v2;
  char v3;

  -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CB0]);

  return v3;
}

- (NSArray)mediaCharacteristics
{
  void *v2;
  void *v3;

  -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)trackID
{
  TVPAudioOption *v2;
  TVPAudioOption *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;

  v2 = self;
  LODWORD(self) = self->_trackID;
  if (!(_DWORD)self)
  {
    -[TVPAudioOption avMediaSelectionOption](v2, "avMediaSelectionOption");
    self = (TVPAudioOption *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v3 = self;
      -[TVPAudioOption avMediaSelectionOption](v2, "avMediaSelectionOption");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        -[TVPAudioOption avMediaSelectionOption](v2, "avMediaSelectionOption");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "trackID");

        LODWORD(self) = v7;
      }
      else
      {
        LODWORD(self) = 0;
      }
    }
  }
  return (int)self;
}

- (void)_currentLocaleDidChange:(id)a3
{
  -[TVPAudioOption setLocalizedDisplayString:](self, "setLocalizedDisplayString:", 0);
}

- (BOOL)hasMediaCharacteristic:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TVPAudioOption avMediaSelectionOption](self, "avMediaSelectionOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMediaCharacteristic:", v4);

  return v6;
}

- (void)setLanguageCodeFromLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLanguageCodeBCP47:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLocalizedDisplayString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPropertyListRepresentation:(id)a3
{
  objc_storeStrong(&self->_propertyListRepresentation, a3);
}

- (AVMediaSelectionOption)avMediaSelectionOption
{
  return self->_avMediaSelectionOption;
}

- (void)setAvMediaSelectionOption:(id)a3
{
  objc_storeStrong((id *)&self->_avMediaSelectionOption, a3);
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (NSString)savedLocaleLanguageCode
{
  return self->_savedLocaleLanguageCode;
}

- (void)setSavedLocaleLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedLocaleLanguageCode, 0);
  objc_storeStrong((id *)&self->_avMediaSelectionOption, 0);
  objc_storeStrong(&self->_propertyListRepresentation, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_localizedDisplayString, 0);
  objc_storeStrong((id *)&self->_languageCodeBCP47, 0);
  objc_storeStrong((id *)&self->_languageCodeFromLocale, 0);
}

@end
