@implementation TIIndicScriptComposer

- (TIIndicScriptComposer)initWithLanguage:(id)a3 contextFetcher:(id)a4
{
  id v6;
  id v7;
  TIIndicScriptComposer *v8;
  TIIndicScriptComposer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIIndicScriptComposer;
  v8 = -[TIIndicScriptComposer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TIIndicScriptComposer setLanguageIdentifier:](v8, "setLanguageIdentifier:", v6);
    -[TIIndicScriptComposer setContextFetcher:](v9, "setContextFetcher:", v7);
  }

  return v9;
}

- (NSString)context
{
  void (**v2)(void);
  void *v3;

  -[TIIndicScriptComposer contextFetcher](self, "contextFetcher");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)scriptCode
{
  NSString *v2;
  int ScriptCodeForLanguage;

  -[TIIndicScriptComposer languageIdentifier](self, "languageIdentifier");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  ScriptCodeForLanguage = GetScriptCodeForLanguage(v2);

  return ScriptCodeForLanguage;
}

- (BOOL)composesConsonants
{
  return 1;
}

- (id)_consonantLettersSet
{
  NSCharacterSet *consonantLettersSet;
  NSCharacterSet **p_consonantLettersSet;
  id obj;

  p_consonantLettersSet = &self->_consonantLettersSet;
  consonantLettersSet = self->_consonantLettersSet;
  if (!consonantLettersSet)
  {
    obj = 0;
    GetConsonantLettersSetAndArray(-[TIIndicScriptComposer scriptCode](self, "scriptCode"), &obj, 0);
    objc_storeStrong((id *)p_consonantLettersSet, obj);
    consonantLettersSet = self->_consonantLettersSet;
  }
  return consonantLettersSet;
}

- (id)_consonantLetters
{
  NSArray *consonantLetters;
  NSArray **p_consonantLetters;
  id obj;

  p_consonantLetters = &self->_consonantLetters;
  consonantLetters = self->_consonantLetters;
  if (!consonantLetters)
  {
    obj = 0;
    GetConsonantLettersSetAndArray(-[TIIndicScriptComposer scriptCode](self, "scriptCode"), 0, &obj);
    objc_storeStrong((id *)p_consonantLetters, obj);
    consonantLetters = self->_consonantLetters;
  }
  return consonantLetters;
}

- (id)_contextualVowelLetters
{
  NSArray *contextualVowelLetters;
  NSArray *v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  unsigned __int16 v9;
  void *v10;
  const __CFString *v11;
  NSArray *v12;
  unsigned __int16 v14;
  _WORD v15[2];

  contextualVowelLetters = self->_contextualVowelLetters;
  if (!contextualVowelLetters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 16);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = -[TIIndicScriptComposer scriptCode](self, "scriptCode");
    v6 = TI::IndicUtils::initialVowelLetterForScript(v5);
    if (v6 > (unsigned __int16)(v6 - 4))
    {
      v7 = (unsigned __int16)(v6 - 4);
      do
      {
        v15[0] = v6;
        v15[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v15, 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v4, "addObject:", v8);

        ++v7;
      }
      while (v6 > v7);
    }
    v9 = v6 + 15;
    v14 = v6 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v10);

      ++v14;
    }
    while (v14 <= v9);
    if (v5 > 15)
    {
      if (v5 == 16)
      {
        -[NSArray addObject:](v4, "addObject:", CFSTR("ਅੱ"));
        v11 = CFSTR("ਅੰ");
        goto LABEL_16;
      }
      if (v5 == 31)
      {
        v11 = CFSTR("ଅ‍୍ୟ");
        goto LABEL_16;
      }
    }
    else
    {
      if (v5 == 4)
      {
        v11 = CFSTR("অ‍্য");
        goto LABEL_16;
      }
      if (v5 == 10)
      {
        v11 = CFSTR("ॲ");
LABEL_16:
        -[NSArray addObject:](v4, "addObject:", v11);
      }
    }
    v12 = self->_contextualVowelLetters;
    self->_contextualVowelLetters = v4;

    contextualVowelLetters = self->_contextualVowelLetters;
  }
  return contextualVowelLetters;
}

- (id)_vowelLettersAndSigns
{
  NSCharacterSet *vowelLettersAndSigns;
  NSCharacterSet *v4;
  unsigned int v5;
  NSCharacterSet *v6;

  vowelLettersAndSigns = self->_vowelLettersAndSigns;
  if (!vowelLettersAndSigns)
  {
    v4 = (NSCharacterSet *)objc_opt_new();
    v5 = TI::IndicUtils::initialVowelLetterForScript(-[TIIndicScriptComposer scriptCode](self, "scriptCode"));
    -[NSCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", v5, 16);
    -[NSCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", v5 + 57, 15);
    v6 = self->_vowelLettersAndSigns;
    self->_vowelLettersAndSigns = v4;

    vowelLettersAndSigns = self->_vowelLettersAndSigns;
  }
  return vowelLettersAndSigns;
}

- (BOOL)_characterBeforeCursorIsVowel
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[TIIndicScriptComposer context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
    -[TIIndicScriptComposer _vowelLettersAndSigns](self, "_vowelLettersAndSigns");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "characterIsMember:", v4);

    if ((v4 & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (BOOL)_characterBeforeCursorIsConsonant
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[TIIndicScriptComposer context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
    -[TIIndicScriptComposer _consonantLettersSet](self, "_consonantLettersSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "characterIsMember:", v4);

    if ((v4 & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (unsigned)_viramaSign
{
  return TI::IndicUtils::initialVowelLetterForScript(-[TIIndicScriptComposer scriptCode](self, "scriptCode")) + 72;
}

- (id)_stringByStrippingTrailingVirama:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (v5 = objc_msgSend(v4, "_lastLongCharacter"), v5 == -[TIIndicScriptComposer _viramaSign](self, "_viramaSign"))
    && objc_msgSend(v4, "_rangeOfLongCharacterAtIndex:", objc_msgSend(v4, "length") - 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (BOOL)_contextIsStartOfWord
{
  void *v2;
  uint64_t v3;
  char v4;

  -[TIIndicScriptComposer context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    if (-[TIIndicScriptComposer _contextIsStartOfWord]::__onceToken != -1)
      dispatch_once(&-[TIIndicScriptComposer _contextIsStartOfWord]::__onceToken, &__block_literal_global_13265);
    v3 = objc_msgSend(v2, "characterAtIndex:", objc_msgSend(v2, "length") - 1);
    v4 = objc_msgSend((id)-[TIIndicScriptComposer _contextIsStartOfWord]::__nonLetterCharacterSet, "characterIsMember:", v3);
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)_vowelLetterToSignConverter
{
  id vowelLetterToSignConverter;

  vowelLetterToSignConverter = self->_vowelLetterToSignConverter;
  if (!vowelLetterToSignConverter)
  {
    self->_vowelLetterToSignConverter = &__block_literal_global_31_13264;
    vowelLetterToSignConverter = &__block_literal_global_31_13264;
  }
  return _Block_copy(vowelLetterToSignConverter);
}

- (id)_vowelModifierLetterToSignConverter
{
  id vowelModifierLetterToSignConverter;

  vowelModifierLetterToSignConverter = self->_vowelModifierLetterToSignConverter;
  if (!vowelModifierLetterToSignConverter)
  {
    self->_vowelModifierLetterToSignConverter = &__block_literal_global_32;
    vowelModifierLetterToSignConverter = &__block_literal_global_32;
  }
  return _Block_copy(vowelModifierLetterToSignConverter);
}

- (id)_letterToSignConverter
{
  void *v3;

  if (-[TIIndicScriptComposer _contextIsStartOfWord](self, "_contextIsStartOfWord"))
    goto LABEL_6;
  if (!-[TIIndicScriptComposer _characterBeforeCursorIsConsonant](self, "_characterBeforeCursorIsConsonant"))
  {
    if (-[TIIndicScriptComposer _characterBeforeCursorIsVowel](self, "_characterBeforeCursorIsVowel"))
    {
      -[TIIndicScriptComposer _vowelModifierLetterToSignConverter](self, "_vowelModifierLetterToSignConverter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
LABEL_6:
    v3 = 0;
    return v3;
  }
  -[TIIndicScriptComposer _vowelLetterToSignConverter](self, "_vowelLetterToSignConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)stringByComposingInput:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  __CFString *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "_lastLongCharacter");
  if (v5 != -[TIIndicScriptComposer _viramaSign](self, "_viramaSign"))
  {
    -[TIIndicScriptComposer _letterToSignConverter](self, "_letterToSignConverter");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[TIIndicScriptComposer context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v10)[2](v10, v4, v11);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {

        goto LABEL_11;
      }
    }

LABEL_9:
    v9 = (__CFString *)v4;
    goto LABEL_11;
  }
  -[TIIndicScriptComposer context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_lastLongCharacter");
  v8 = -[TIIndicScriptComposer _viramaSign](self, "_viramaSign");

  if (v7 != v8)
  {
    if (!-[TIIndicScriptComposer _characterBeforeCursorIsConsonant](self, "_characterBeforeCursorIsConsonant"))
    {
      v9 = &stru_1EA1081D0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v9 = CFSTR("‌");
LABEL_11:

  return v9;
}

- (id)contextualDisplayKeys
{
  TIIndicScriptComposer *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TIIndicScriptComposer *v10;
  uint64_t i;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  char v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  _BOOL4 v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v2 = self;
  v65 = *MEMORY[0x1E0C80C00];
  -[TIIndicScriptComposer languageIdentifier](self, "languageIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIIndicScriptComposer context](v2, "context");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_lastConjunctInLanguage:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIIndicScriptComposer _characterBeforeCursorIsConsonant](v2, "_characterBeforeCursorIsConsonant");
  v47 = -[TIIndicScriptComposer _characterBeforeCursorIsVowel](v2, "_characterBeforeCursorIsVowel");
  v43 = (void *)v3;
  v49 = v5;
  v45 = v49;
  if ((objc_msgSend(v49, "_isSingleGlyphInLanguage:", v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", objc_msgSend(v49, "_lastLongCharacter"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[TIIndicScriptComposer _contextualVowelLetters](v2, "_contextualVowelLetters");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    v10 = v2;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (v6)
        {
          -[TIIndicScriptComposer _vowelLetterToSignConverter](v2, "_vowelLetterToSignConverter");
          v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, id))v13)[2](v13, v12, v49);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            v16 = v45;
LABEL_17:
            objc_msgSend(v16, "stringByAppendingString:", v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v12);

            v2 = v10;
            goto LABEL_22;
          }
          v17 = v14;
          v2 = v10;
        }
        else
        {
          v17 = 0;
        }
        if (v47)
        {
          -[TIIndicScriptComposer _vowelModifierLetterToSignConverter](v2, "_vowelModifierLetterToSignConverter");
          v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, id))v18)[2](v18, v12, v49);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "length"))
          {
            v19 = objc_msgSend(v14, "isEqualToString:", v12);

            if ((v19 & 1) == 0)
            {
              v16 = v49;
              goto LABEL_17;
            }
          }
          else
          {

          }
          v2 = v10;
        }
        else
        {
          v14 = v17;
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("UI-Nothing"), v12);
LABEL_22:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v8);
  }
  if (-[TIIndicScriptComposer composesConsonants](v2, "composesConsonants"))
  {
    -[TIIndicScriptComposer _stringByStrippingTrailingVirama:](v2, "_stringByStrippingTrailingVirama:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v44, "length");
    v22 = objc_msgSend(v42, "length");
    -[TIIndicScriptComposer _consonantLetters](v2, "_consonantLetters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIIndicScriptComposer _consonantLettersSet](v2, "_consonantLettersSet");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v55 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
          objc_msgSend(v49, "stringByAppendingString:", v29);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v21 < v22
            && objc_msgSend(v48, "longCharacterIsMember:", objc_msgSend(v44, "_lastLongCharacter"))
            && -[__CFString _isSingleGlyphInLanguage:](v30, "_isSingleGlyphInLanguage:", v43))
          {
            v31 = v4;
            v32 = v30;
          }
          else
          {
            v31 = v4;
            v32 = CFSTR("UI-Nothing");
          }
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v26);
    }

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v4, "allKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
        objc_msgSend(v4, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_stringByRemovingOffensiveOrVulgarWords");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v39, "isEqualToString:", v40) & 1) == 0)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    }
    while (v35);
  }

  return v4;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageIdentifier, a3);
}

- (id)contextFetcher
{
  return self->_contextFetcher;
}

- (void)setContextFetcher:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextFetcher, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong(&self->_vowelModifierLetterToSignConverter, 0);
  objc_storeStrong(&self->_vowelLetterToSignConverter, 0);
  objc_storeStrong((id *)&self->_contextualVowelLetters, 0);
  objc_storeStrong((id *)&self->_consonantLetters, 0);
  objc_storeStrong((id *)&self->_vowelLettersAndSigns, 0);
  objc_storeStrong((id *)&self->_consonantLettersSet, 0);
}

id __60__TIIndicScriptComposer__vowelModifierLetterToSignConverter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  KB *v5;
  id v6;
  const char *v7;
  const char *v8;
  void *v9;
  _BYTE v11[8];
  void *v12;
  unsigned __int16 v13[3];
  char v14;
  void *v15;
  _WORD v16[3];
  char v17;
  void *v18;
  uint64_t v19;
  _BYTE v20[8];
  void *v21;
  _BYTE v22[8];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a2);
  v5 = a3;
  KB::String::String((KB::String *)v22, (const char *)objc_msgSend(v4, "UTF8String"));
  KB::utf8_string(v5, (uint64_t)v20);

  KB::String::String((KB::String *)v13, (const KB::String *)v22);
  KB::String::String((KB::String *)v11, (const KB::String *)v20);
  TI::IndicUtils::convertModifierLetterToSign(v13, (const KB::String *)v11, (uint64_t)v16);
  if (v12 && v11[6] == 1)
    free(v12);
  if (v15 && v14 == 1)
    free(v15);
  if (KB::String::equal((KB::String *)v22, (const KB::String *)v16, 1))
  {
    v6 = v4;
  }
  else
  {
    v7 = (const char *)v18;
    if (!v18)
      v7 = (const char *)&v19;
    if (v16[0])
      v8 = v7;
    else
      v8 = "";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  if (v18 && v17 == 1)
    free(v18);
  if (v21 && v20[6] == 1)
    free(v21);
  if (v23 && v22[6] == 1)
    free(v23);

  return v9;
}

KB *__52__TIIndicScriptComposer__vowelLetterToSignConverter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  KB *v4;
  KB *v5;
  KB *v6;
  const char *v7;
  const char *v8;
  KB *v9;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;
  void *v14;
  _WORD v15[3];
  char v16;
  void *v17;
  uint64_t v18;
  _BYTE v19[8];
  void *v20;
  _BYTE v21[8];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  KB::utf8_string(v4, (uint64_t)v21);
  KB::utf8_string(v5, (uint64_t)v19);

  KB::String::String((KB::String *)&v13, (const KB::String *)v21);
  KB::String::String((KB::String *)v11, (const KB::String *)v19);
  TI::IndicUtils::convertLetterToSign(&v13, (const KB::String *)v11, (uint64_t)v15);
  if (v12 && v11[6] == 1)
    free(v12);
  if (v14 && BYTE6(v13) == 1)
    free(v14);
  if (KB::String::equal((KB::String *)v21, (const KB::String *)v15, 1))
  {
    v6 = v4;
  }
  else
  {
    v7 = (const char *)v17;
    if (!v17)
      v7 = (const char *)&v18;
    if (v15[0])
      v8 = v7;
    else
      v8 = "";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v6 = (KB *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  if (v17 && v16 == 1)
    free(v17);
  if (v20 && v19[6] == 1)
    free(v20);
  if (v22 && v21[6] == 1)
    free(v22);

  return v9;
}

void __46__TIIndicScriptComposer__contextIsStartOfWord__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[TIIndicScriptComposer _contextIsStartOfWord]::__nonLetterCharacterSet;
  -[TIIndicScriptComposer _contextIsStartOfWord]::__nonLetterCharacterSet = v0;

}

@end
