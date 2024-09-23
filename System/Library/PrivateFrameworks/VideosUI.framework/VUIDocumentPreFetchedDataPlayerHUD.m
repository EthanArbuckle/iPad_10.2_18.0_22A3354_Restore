@implementation VUIDocumentPreFetchedDataPlayerHUD

- (VUIDocumentPreFetchedDataPlayerHUD)initWithDictionary:(id)a3
{
  id v4;
  VUIDocumentPreFetchedDataPlayerHUD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDocumentPreFetchedDataPlayerHUD;
  v5 = -[VUIDocumentPreFetchedData initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("tabId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[VUIDocumentPreFetchedDataPlayerHUD setTabId:](v5, "setTabId:", v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("canonicalId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[VUIDocumentPreFetchedDataPlayerHUD setCanonicalId:](v5, "setCanonicalId:", v7);
    -[VUIDocumentPreFetchedDataPlayerHUD setIsMultiviewPlayer:](v5, "setIsMultiviewPlayer:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isMultiviewPlayer"), 0));
    -[VUIDocumentPreFetchedDataPlayerHUD setPlayFromStart:](v5, "setPlayFromStart:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("playFromStart"), 0));
    -[VUIDocumentPreFetchedDataPlayerHUD setIncludeMultiviewButton:](v5, "setIncludeMultiviewButton:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("includeMultiviewButton"), 0));
    objc_msgSend(v4, "objectForKey:", CFSTR("locale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDocumentPreFetchedDataPlayerHUD setLocale:](v5, "setLocale:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("multiviewIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDocumentPreFetchedDataPlayerHUD setMultiviewIdentifiers:](v5, "setMultiviewIdentifiers:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("excludedCanonicals"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[VUIDocumentPreFetchedDataPlayerHUD setExcludedCanonicals:](v5, "setExcludedCanonicals:", v10);

  }
  return v5;
}

- (id)jsonData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  -[VUIDocumentPreFetchedDataPlayerHUD tabId](self, "tabId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("tabId"));

  -[VUIDocumentPreFetchedDataPlayerHUD canonicalId](self, "canonicalId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("canonicalId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlayerHUD isMultiviewPlayer](self, "isMultiviewPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isMultiviewPlayer"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlayerHUD playFromStart](self, "playFromStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("playFromStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIDocumentPreFetchedDataPlayerHUD includeMultiviewButton](self, "includeMultiviewButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("includeMultiviewButton"));

  -[VUIDocumentPreFetchedDataPlayerHUD multiviewIdentifiers](self, "multiviewIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v9, CFSTR("multiviewIdentifiers"));

  -[VUIDocumentPreFetchedDataPlayerHUD locale](self, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v10, CFSTR("locale"));

  -[VUIDocumentPreFetchedDataPlayerHUD excludedCanonicals](self, "excludedCanonicals");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("excludedCanonicals"));
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (void)setCanonicalId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)tabId
{
  return self->_tabId;
}

- (void)setTabId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isMultiviewPlayer
{
  return self->_isMultiviewPlayer;
}

- (void)setIsMultiviewPlayer:(BOOL)a3
{
  self->_isMultiviewPlayer = a3;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)playFromStart
{
  return self->_playFromStart;
}

- (void)setPlayFromStart:(BOOL)a3
{
  self->_playFromStart = a3;
}

- (BOOL)includeMultiviewButton
{
  return self->_includeMultiviewButton;
}

- (void)setIncludeMultiviewButton:(BOOL)a3
{
  self->_includeMultiviewButton = a3;
}

- (NSArray)excludedCanonicals
{
  return self->_excludedCanonicals;
}

- (void)setExcludedCanonicals:(id)a3
{
  objc_storeStrong((id *)&self->_excludedCanonicals, a3);
}

- (NSArray)multiviewIdentifiers
{
  return self->_multiviewIdentifiers;
}

- (void)setMultiviewIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_multiviewIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiviewIdentifiers, 0);
  objc_storeStrong((id *)&self->_excludedCanonicals, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_tabId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
}

@end
