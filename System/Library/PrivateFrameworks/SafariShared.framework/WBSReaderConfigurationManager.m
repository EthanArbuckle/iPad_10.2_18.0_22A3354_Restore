@implementation WBSReaderConfigurationManager

- (void)setJavaScriptEnabled:(BOOL)a3
{
  self->_javaScriptEnabled = a3;
}

- (void)setIsOLEDDisplay:(BOOL)a3
{
  self->_isOLEDDisplay = a3;
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  self->_darkModeEnabled = a3;
}

- (WBSReaderConfigurationManager)initWithPersistedSettingsAsDictionaryRepresentation:(id)a3 fontManager:(id)a4 prefersLargerDefaultFontSize:(BOOL)a5
{
  id v8;
  WBSReaderConfigurationManager *v9;
  WBSReaderConfigurationManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  char isKindOfClass;
  NSMutableDictionary *v25;
  NSMutableDictionary *fontFamilyNameForLanguageTag;
  NSString *v27;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  NSString *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  WBSReaderConfigurationManager *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37 = a4;
  v42.receiver = self;
  v42.super_class = (Class)WBSReaderConfigurationManager;
  v9 = -[WBSReaderConfigurationManager init](&v42, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_38;
  objc_storeStrong((id *)&v9->_fontManager, a4);
  v10->_prefersLargerDefaultFontSize = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = (id)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(v8, "safari_dictionaryForKey:", CFSTR("fontSizeIndexForSizeClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "safari_numberForKey:", CFSTR("all"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v10->_textZoomIndex = objc_msgSend(v13, "integerValue");

      goto LABEL_10;
    }

  }
  objc_msgSend(v8, "safari_numberForKey:", CFSTR("fontSizeIndex"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v15)
  {
    v10->_textZoomIndex = objc_msgSend(v15, "integerValue");
LABEL_10:

    if (v10->_textZoomIndex < 0xCuLL)
      goto LABEL_12;
  }
  v10->_textZoomIndex = -[WBSReaderConfigurationManager _defaultTextZoomIndex](v10, "_defaultTextZoomIndex");
LABEL_12:
  objc_msgSend(v8, "safari_dictionaryForKey:", CFSTR("fontFamilyNameForLanguageTag"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              continue;
          }

          goto LABEL_24;
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v19)
          continue;
        break;
      }
    }

    v25 = (NSMutableDictionary *)objc_msgSend(v18, "mutableCopy");
  }
  else
  {
LABEL_24:
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  fontFamilyNameForLanguageTag = v10->_fontFamilyNameForLanguageTag;
  v10->_fontFamilyNameForLanguageTag = v25;

  objc_msgSend(v8, "safari_stringForKey:", CFSTR("themeName"));
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = WBSThemeForNSString(v27);
    if (v29 != -1)
    {
      v10->_theme = v29;

      goto LABEL_30;
    }

  }
  v10->_theme = -1;
LABEL_30:
  objc_msgSend(v8, "safari_stringForKey:", CFSTR("darkModeThemeName"));
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
  {
LABEL_34:
    v10->_darkModeTheme = -1;
    goto LABEL_35;
  }
  v32 = WBSThemeForNSString(v30);
  if (v32 == -1)
  {

    goto LABEL_34;
  }
  v10->_darkModeTheme = v32;

LABEL_35:
  objc_msgSend(v8, "safari_numberForKey:", CFSTR("version"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "unsignedIntegerValue");

  if (v34 <= 4)
    -[WBSReaderConfigurationManager _migrateToVersion5IfNecessary](v10, "_migrateToVersion5IfNecessary");
  v35 = v10;

LABEL_38:
  return v10;
}

- (void)_migrateToVersion5IfNecessary
{
  int64_t textZoomIndex;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  textZoomIndex = self->_textZoomIndex;
  if (textZoomIndex == -[WBSReaderConfigurationManager _defaultTextZoomIndex](self, "_defaultTextZoomIndex"))
    self->_textZoomIndex = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSMutableDictionary copy](self->_fontFamilyNameForLanguageTag, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_fontFamilyNameForLanguageTag, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguage:](WBSReaderLocalizedFonts, "defaultFontFamilyNameForLanguage:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
        {

        }
        else
        {
          v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("Georgia"));

          if ((v11 & 1) == 0)
            goto LABEL_12;
        }
        -[NSMutableDictionary removeObjectForKey:](self->_fontFamilyNameForLanguageTag, "removeObjectForKey:", v8);
LABEL_12:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  if (!self->_theme)
    self->_theme = -1;
  if (self->_darkModeTheme == 2)
    self->_darkModeTheme = -1;
}

- (int64_t)_defaultTextZoomIndex
{
  if (self->_prefersLargerDefaultFontSize)
    return 4;
  else
    return 3;
}

- (WBSReaderConfigurationManager)initWithPersistedSettingsAsDictionaryRepresentation:(id)a3 fontManager:(id)a4
{
  return -[WBSReaderConfigurationManager initWithPersistedSettingsAsDictionaryRepresentation:fontManager:prefersLargerDefaultFontSize:](self, "initWithPersistedSettingsAsDictionaryRepresentation:fontManager:prefersLargerDefaultFontSize:", a3, a4, 0);
}

- (NSDictionary)configurationToSave
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_textZoomIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("fontSizeIndex"));

  }
  v5 = CFSTR("White");
  switch(self->_theme)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      goto LABEL_8;
    case 1:
      v5 = CFSTR("Sepia");
      goto LABEL_7;
    case 2:
      v5 = CFSTR("Gray");
      goto LABEL_7;
    case 3:
      v5 = CFSTR("Night");
      goto LABEL_7;
    default:
LABEL_7:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("themeName"));
LABEL_8:
      v6 = CFSTR("White");
      switch(self->_darkModeTheme)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          goto LABEL_13;
        case 1:
          v6 = CFSTR("Sepia");
          goto LABEL_12;
        case 2:
          v6 = CFSTR("Gray");
          goto LABEL_12;
        case 3:
          v6 = CFSTR("Night");
          goto LABEL_12;
        default:
LABEL_12:
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("darkModeThemeName"));
LABEL_13:
          if (-[NSMutableDictionary count](self->_fontFamilyNameForLanguageTag, "count", v6))
            objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_fontFamilyNameForLanguageTag, CFSTR("fontFamilyNameForLanguageTag"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4B87C10, CFSTR("version"));
          return (NSDictionary *)v3;
      }
  }
}

- (NSDictionary)configurationToSendToWebPage
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  NSMutableDictionary *fontFamilyNameForLanguageTag;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("fontSizeIndex"));

  v5 = 16;
  if (!self->_darkModeEnabled)
    v5 = 8;
  v6 = *(int64_t *)((char *)&self->super.isa + v5);
  if (v6 == -1)
    v6 = -[WBSReaderConfigurationManager _defaultThemeForAppearance:](self, "_defaultThemeForAppearance:");
  if ((unint64_t)(v6 - 1) > 2)
    v7 = CFSTR("White");
  else
    v7 = off_1E4B3E7B8[v6 - 1];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("themeName"));
  +[WBSReaderFont systemSerifFont](WBSReaderFont, "systemSerifFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fontFamilyNameForLanguageTag = self->_fontFamilyNameForLanguageTag;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__WBSReaderConfigurationManager_configurationToSendToWebPage__block_invoke;
  v16[3] = &unk_1E4B3E798;
  v10 = v8;
  v17 = v10;
  -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](fontFamilyNameForLanguageTag, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("fontFamilyNameForLanguageTag"));
  +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguageMap](WBSReaderLocalizedFonts, "defaultFontFamilyNameForLanguageMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("defaultFontFamilyNameForLanguage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_javaScriptEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("javaScriptEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOLEDDisplay);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isOLEDDisplay"));

  return (NSDictionary *)v3;
}

id __61__WBSReaderConfigurationManager_configurationToSendToWebPage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "familyNameForWebContent");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (BOOL)canMakeTextBigger
{
  return -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex") < 11;
}

- (BOOL)canMakeTextSmaller
{
  return -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex") > 0;
}

- (BOOL)resettingTextSizeWouldHaveEffect
{
  int64_t v3;

  v3 = -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex");
  return v3 != -[WBSReaderConfigurationManager _defaultTextZoomIndex](self, "_defaultTextZoomIndex");
}

- (void)makeTextBigger
{
  id v3;

  if (-[WBSReaderConfigurationManager canMakeTextBigger](self, "canMakeTextBigger"))
  {
    self->_textZoomIndex = -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex") + 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSWebsiteZoomDidChangeNotification"), 0);

  }
}

- (void)makeTextSmaller
{
  id v3;

  if (-[WBSReaderConfigurationManager canMakeTextSmaller](self, "canMakeTextSmaller"))
  {
    self->_textZoomIndex = -[WBSReaderConfigurationManager effectiveTextZoomIndex](self, "effectiveTextZoomIndex") - 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSWebsiteZoomDidChangeNotification"), 0);

  }
}

- (void)resetTextSize
{
  id v2;

  self->_textZoomIndex = -[WBSReaderConfigurationManager _defaultTextZoomIndex](self, "_defaultTextZoomIndex");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WBSWebsiteZoomDidChangeNotification"), 0);

}

- (void)setFont:(id)a3 forLanguageTag:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fontFamilyNameForLanguageTag, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)fontForLanguageTag:(id)a3
{
  id v4;
  WBSReaderFontManager *fontManager;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  fontManager = self->_fontManager;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fontFamilyNameForLanguageTag, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSReaderFontManager fontWithFontFamilyName:](fontManager, "fontWithFontFamilyName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v7, "isInstalled") & 1) == 0)
  {
    -[WBSReaderFontManager defaultFontForLanguageTag:](self->_fontManager, "defaultFontForLanguageTag:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (void)setTheme:(int64_t)a3 forAppearance:(int64_t)a4
{
  uint64_t v4;

  if (a4)
  {
    if (a4 != 1)
      return;
    v4 = 16;
  }
  else
  {
    v4 = 8;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
}

- (int64_t)themeForAppearance:(int64_t)a3
{
  int64_t darkModeTheme;

  if (a3 == 1)
  {
    darkModeTheme = self->_darkModeTheme;
  }
  else
  {
    if (a3)
      return darkModeTheme;
    darkModeTheme = self->_theme;
  }
  if (darkModeTheme != -1)
    return darkModeTheme;
  return -[WBSReaderConfigurationManager _defaultThemeForAppearance:](self, "_defaultThemeForAppearance:");
}

- (int64_t)_defaultThemeForAppearance:(int64_t)a3
{
  if (a3 == 1)
    return 3;
  else
    return 0;
}

- (int64_t)effectiveTextZoomIndex
{
  if (self->_textZoomIndex == 0x7FFFFFFFFFFFFFFFLL)
    return -[WBSReaderConfigurationManager _defaultTextZoomIndex](self, "_defaultTextZoomIndex");
  else
    return self->_textZoomIndex;
}

- (BOOL)javaScriptEnabled
{
  return self->_javaScriptEnabled;
}

- (BOOL)darkModeEnabled
{
  return self->_darkModeEnabled;
}

- (BOOL)isOLEDDisplay
{
  return self->_isOLEDDisplay;
}

- (WBSReaderFontManager)fontManager
{
  return self->_fontManager;
}

- (int64_t)textZoomIndex
{
  return self->_textZoomIndex;
}

- (void)setTextZoomIndex:(int64_t)a3
{
  self->_textZoomIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontManager, 0);
  objc_storeStrong((id *)&self->_fontFamilyNameForLanguageTag, 0);
}

@end
