@implementation TCFont

- (TCFont)initWithNamesByLanguage:(id)a3 psName:(id)a4 styling:(TCFontStyling)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  id v10;
  TCFont *v11;
  uint64_t v12;
  NSDictionary *namesByLanguage;
  uint64_t v14;
  NSString *psName;
  objc_super v17;

  v5 = *(_QWORD *)&a5.weight;
  v6 = *(_QWORD *)&a5.fontClass;
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TCFont;
  v11 = -[TCFont init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    namesByLanguage = v11->_namesByLanguage;
    v11->_namesByLanguage = (NSDictionary *)v12;

    v14 = objc_msgSend(v10, "copy");
    psName = v11->_psName;
    v11->_psName = (NSString *)v14;

    *(_QWORD *)&v11->_styling.fontClass = v6;
    *(_QWORD *)&v11->_styling.weight = v5;
  }

  return v11;
}

- (id)equivalentDictionary
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  TCFontStyling v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCFont namesByLanguage](self, "namesByLanguage");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        TCFontMacLanguageIDToNSString(objc_msgSend(v8, "unsignedShortValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "equivalentDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  v12 = (void *)MEMORY[0x24BDBCE70];
  -[TCFont psName](self, "psName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v18.fontClass = -[TCFont styling](self, "styling");
  *(_QWORD *)&v18.weight = v14;
  TCFontStyling::equivalentDictionary(&v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v3, CFSTR("font-names"), v13, CFSTR("PostScript-name"), v15, CFSTR("styling"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (TCFont)initWithDictionary:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSString *v8;
  unsigned __int16 v9;
  TCFontName *v10;
  void *v11;
  TCFontName *v12;
  void *v13;
  void *v14;
  TCFontStyling *v15;
  NSDictionary *v16;
  unint64_t v17;
  uint64_t v18;
  TCFont *v19;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("font-names"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(NSString **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v9 = TCFontMacLanguageIDFromNSString(v8);
        v10 = [TCFontName alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[TCFontName initWithDictionary:](v10, "initWithDictionary:", v11);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PostScript-name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("styling"));
  v15 = (TCFontStyling *)objc_claimAutoreleasedReturnValue();
  v17 = TCFontStyling::createWithDictionary(v15, v16);
  v19 = -[TCFont initWithNamesByLanguage:psName:styling:](self, "initWithNamesByLanguage:psName:styling:", v3, v14, v17, v18, 0);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[TCFont equivalentDictionary](self, "equivalentDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

+ (id)fontWithFont:(id)a3
{
  return (id)objc_msgSend(a3, "copy");
}

- (id)englishName
{
  void *v2;
  void *v3;

  -[TCFont namesByLanguage](self, "namesByLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_24F46A480);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[TCFont equivalentDictionary](self, "equivalentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)preferredLanguage
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v2 = -[TCFont styling](self, "styling");
  if (HIDWORD(v2) == 25)
    v3 = 33;
  else
    v3 = 0;
  if (HIDWORD(v2) == 3)
    v4 = 23;
  else
    v4 = v3;
  if (HIDWORD(v2) == 2)
    v5 = 19;
  else
    v5 = 0;
  if (HIDWORD(v2) == 1)
    v6 = 11;
  else
    v6 = v5;
  if (SHIDWORD(v2) <= 2)
    return v6;
  else
    return v4;
}

- (id)localizedFontName
{
  void *v3;
  void *v4;
  void *v5;

  -[TCFont namesByLanguage](self, "namesByLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[TCFont preferredLanguage](self, "preferredLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[TCFont englishName](self, "englishName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSDictionary)namesByLanguage
{
  return self->_namesByLanguage;
}

- (NSString)psName
{
  return self->_psName;
}

- (TCFontStyling)styling
{
  uint64_t v2;
  uint64_t v3;
  TCFontStyling result;

  v2 = *(_QWORD *)&self->_styling.weight;
  v3 = *(_QWORD *)&self->_styling.fontClass;
  result.weight = v2;
  result.italic = BYTE1(v2);
  result.width = HIDWORD(v2);
  result.fontClass = v3;
  result.stringEncoding = HIDWORD(v3);
  return result;
}

- (TCFontFamily)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  self->_family = (TCFontFamily *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psName, 0);
  objc_storeStrong((id *)&self->_namesByLanguage, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 11) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_WORD *)self + 20) = 0;
  return self;
}

@end
