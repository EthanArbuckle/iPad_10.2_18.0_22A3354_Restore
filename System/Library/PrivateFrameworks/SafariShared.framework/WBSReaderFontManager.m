@implementation WBSReaderFontManager

- (WBSReaderFontManager)init
{
  WBSReaderFontManager *v2;
  WBSReaderFontManager *v3;
  NSString *languageTag;
  void *v5;
  void *v6;
  WBSReaderFontManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSReaderFontManager;
  v2 = -[WBSReaderFontManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    languageTag = v2->_languageTag;
    v2->_languageTag = (NSString *)&stru_1E4B40D18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSReaderFontDownloadManager sharedManager](WBSReaderFontDownloadManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__fontDownloadDidFinish_, CFSTR("WBSReaderFontDownloadDidFinishNotification"), v6);

    v7 = v3;
  }

  return v3;
}

- (NSArray)fonts
{
  NSArray *validatedFonts;
  NSArray *v3;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  validatedFonts = self->_validatedFonts;
  if (validatedFonts)
  {
    v3 = validatedFonts;
  }
  else
  {
    +[WBSReaderLocalizedFonts fontsForLanguage:](WBSReaderLocalizedFonts, "fontsForLanguage:", self->_languageTag);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &__block_literal_global_86);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_validatedFonts;
    self->_validatedFonts = v6;

    v3 = self->_validatedFonts;
  }
  return v3;
}

uint64_t __29__WBSReaderFontManager_fonts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled");
}

- (NSArray)possibleFonts
{
  return (NSArray *)+[WBSReaderLocalizedFonts fontsForLanguage:](WBSReaderLocalizedFonts, "fontsForLanguage:", self->_languageTag);
}

- (id)defaultFontForLanguageTag:(id)a3
{
  void *v4;
  void *v5;

  +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguage:](WBSReaderLocalizedFonts, "defaultFontFamilyNameForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSReaderFontManager fontWithFontFamilyName:](self, "fontWithFontFamilyName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fontWithFontFamilyName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WBSReaderFontManager fonts](self, "fonts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "familyName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateLanguageTag:(id)a3
{
  NSArray *validatedFonts;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_languageTag, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_languageTag, a3);
    validatedFonts = self->_validatedFonts;
    self->_validatedFonts = 0;

  }
}

- (void)_fontDownloadDidFinish:(id)a3
{
  NSArray *validatedFonts;

  validatedFonts = self->_validatedFonts;
  self->_validatedFonts = 0;

}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_validatedFonts, 0);
}

@end
