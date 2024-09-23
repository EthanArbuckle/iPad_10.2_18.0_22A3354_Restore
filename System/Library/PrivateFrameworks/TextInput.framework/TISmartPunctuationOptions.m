@implementation TISmartPunctuationOptions

+ (id)smartPunctuationOptionsForLocale:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocale:", v4);

  return v5;
}

- (TISmartPunctuationOptions)initWithLocale:(id)a3
{
  id v5;
  TISmartPunctuationOptions *v6;
  TISmartPunctuationOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TISmartPunctuationOptions;
  v6 = -[TISmartPunctuationOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    -[TISmartPunctuationOptions _generateDataFromLocale](v7, "_generateDataFromLocale");
  }

  return v7;
}

- (void)_generateDataFromLocale
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  char *v7;
  char *v8;
  char *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33 = 0x201C201920192018;
  v34 = 8221;
  v31 = 0x201E20182019201ALL;
  v32 = 8220;
  v29 = 0xAB201920192018;
  v30 = 187;
  v27 = 0x201E20192019201ALL;
  v28 = 8221;
  v26 = 8221;
  v25 = 0x201D201920192019;
  v24 = 34;
  v23 = 0x22002700270027;
  v22 = 187;
  v21 = 0xAB20182019201ALL;
  v3 = (void *)MEMORY[0x1E0C99DC8];
  -[NSLocale objectForKey:](self->_locale, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canonicalLanguageIdentifierFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("de")) & 1) != 0)
  {
    v6 = &v31;
LABEL_3:
    v7 = (char *)((unint64_t)v6 | 6);
    v8 = (char *)((unint64_t)v6 | 2);
    v9 = (char *)((unint64_t)v6 | 4);
    goto LABEL_10;
  }
  v7 = (char *)&v29 + 6;
  v8 = (char *)&v29 + 2;
  v9 = (char *)&v29 + 4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("fr")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("nb")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("no")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("ru")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("el")) & 1) != 0)
  {
    v6 = &v29;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("pl")) & 1) != 0)
  {
    v7 = (char *)&v27 + 6;
    v8 = (char *)&v27 + 2;
    v9 = (char *)&v27 + 4;
    v6 = &v27;
  }
  else
  {
    v7 = (char *)&v25 + 6;
    v8 = (char *)&v25 + 2;
    v9 = (char *)&v25 + 4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sv")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("fi")) & 1) != 0)
    {
      v6 = &v25;
    }
    else
    {
      v7 = (char *)&v23 + 6;
      v8 = (char *)&v23 + 2;
      v9 = (char *)&v23 + 4;
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ar")) & 1) == 0
        && (objc_msgSend(v5, "isEqualToString:", CFSTR("ars")) & 1) == 0)
      {
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("uk")))
          v6 = &v21;
        else
          v6 = &v33;
        goto LABEL_3;
      }
      v6 = &v23;
    }
  }
LABEL_10:
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("fr"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions setLeftSingleQuote:](self, "setLeftSingleQuote:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions setRightSingleQuote:](self, "setRightSingleQuote:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions setApostrophe:](self, "setApostrophe:", v13);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C%C"), *((unsigned __int16 *)v6 + 3), 160);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions setLeftDoubleQuote:](self, "setLeftDoubleQuote:", v14);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C%C"), 160, *((unsigned __int16 *)v6 + 4));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v7, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions setLeftDoubleQuote:](self, "setLeftDoubleQuote:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v6 + 1, 1);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions setRightDoubleQuote:](self, "setRightDoubleQuote:", v16);

  -[TISmartPunctuationOptions leftSingleQuote](self, "leftSingleQuote");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions rightSingleQuote](self, "rightSingleQuote");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
  {
    -[TISmartPunctuationOptions leftDoubleQuote](self, "leftDoubleQuote");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions rightDoubleQuote](self, "rightDoubleQuote");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions setUsesDirectionalQuotes:](self, "setUsesDirectionalQuotes:", objc_msgSend(v19, "isEqualToString:", v20) ^ 1);

  }
  else
  {
    -[TISmartPunctuationOptions setUsesDirectionalQuotes:](self, "setUsesDirectionalQuotes:", 1);
  }

}

- (void)setUsesDirectionalQuotes:(BOOL)a3
{
  self->_usesDirectionalQuotes = a3;
}

- (void)setRightSingleQuote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setRightDoubleQuote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setLeftSingleQuote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLeftDoubleQuote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setApostrophe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)rightSingleQuote
{
  return self->_rightSingleQuote;
}

- (NSString)leftSingleQuote
{
  return self->_leftSingleQuote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDoubleQuote, 0);
  objc_storeStrong((id *)&self->_leftDoubleQuote, 0);
  objc_storeStrong((id *)&self->_apostrophe, 0);
  objc_storeStrong((id *)&self->_rightSingleQuote, 0);
  objc_storeStrong((id *)&self->_leftSingleQuote, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (BOOL)isEqual:(id)a3
{
  TISmartPunctuationOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (TISmartPunctuationOptions *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[TISmartPunctuationOptions leftSingleQuote](self, "leftSingleQuote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions leftSingleQuote](v4, "leftSingleQuote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "_string:matchesString:", v6, v7);

    if (!(_DWORD)v5)
      goto LABEL_8;
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[TISmartPunctuationOptions rightSingleQuote](self, "rightSingleQuote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions rightSingleQuote](v4, "rightSingleQuote");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "_string:matchesString:", v9, v10);

    if (!(_DWORD)v8)
      goto LABEL_8;
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[TISmartPunctuationOptions apostrophe](self, "apostrophe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions apostrophe](v4, "apostrophe");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "_string:matchesString:", v12, v13);

    if (!(_DWORD)v11)
      goto LABEL_8;
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[TISmartPunctuationOptions leftDoubleQuote](self, "leftDoubleQuote");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TISmartPunctuationOptions leftDoubleQuote](v4, "leftDoubleQuote");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v14, "_string:matchesString:", v15, v16);

    if ((_DWORD)v14)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      -[TISmartPunctuationOptions rightDoubleQuote](self, "rightDoubleQuote");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TISmartPunctuationOptions rightDoubleQuote](v4, "rightDoubleQuote");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "_string:matchesString:", v18, v19);

    }
    else
    {
LABEL_8:
      v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_leftSingleQuote, "hash");
  v4 = -[NSString hash](self->_rightSingleQuote, "hash") ^ v3;
  v5 = -[NSString hash](self->_apostrophe, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_leftDoubleQuote, "hash");
  return v6 ^ -[NSString hash](self->_rightDoubleQuote, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)TISmartPunctuationOptions;
  -[TISmartPunctuationOptions description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions leftSingleQuote](self, "leftSingleQuote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions rightSingleQuote](self, "rightSingleQuote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions apostrophe](self, "apostrophe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions leftDoubleQuote](self, "leftDoubleQuote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TISmartPunctuationOptions rightDoubleQuote](self, "rightDoubleQuote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{%@xy%@/x%@y/%@xy%@}"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[TISmartPunctuationOptions locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TISmartPunctuationOptions locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("LocaleIdentifier"));

  }
  -[TISmartPunctuationOptions leftSingleQuote](self, "leftSingleQuote");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("LeftSingleQuote"));

  -[TISmartPunctuationOptions rightSingleQuote](self, "rightSingleQuote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("RightSingleQuote"));

  -[TISmartPunctuationOptions apostrophe](self, "apostrophe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("Apostrophe"));

  -[TISmartPunctuationOptions leftDoubleQuote](self, "leftDoubleQuote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("LeftDoubleQuote"));

  -[TISmartPunctuationOptions rightDoubleQuote](self, "rightDoubleQuote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("LeftDoubleQuote"));

}

- (TISmartPunctuationOptions)initWithCoder:(id)a3
{
  id v4;
  TISmartPunctuationOptions *v5;
  void *v6;
  uint64_t v7;
  NSLocale *locale;
  void *v9;
  uint64_t v10;
  NSString *leftSingleQuote;
  void *v12;
  uint64_t v13;
  NSString *rightSingleQuote;
  void *v15;
  uint64_t v16;
  NSString *apostrophe;
  void *v18;
  uint64_t v19;
  NSString *leftDoubleQuote;
  void *v21;
  uint64_t v22;
  NSString *rightDoubleQuote;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TISmartPunctuationOptions;
  v5 = -[TISmartPunctuationOptions init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocaleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      locale = v5->_locale;
      v5->_locale = (NSLocale *)v7;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftSingleQuote"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    leftSingleQuote = v5->_leftSingleQuote;
    v5->_leftSingleQuote = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RightSingleQuote"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    rightSingleQuote = v5->_rightSingleQuote;
    v5->_rightSingleQuote = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Apostrophe"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    apostrophe = v5->_apostrophe;
    v5->_apostrophe = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftDoubleQuote"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    leftDoubleQuote = v5->_leftDoubleQuote;
    v5->_leftDoubleQuote = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftDoubleQuote"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    rightDoubleQuote = v5->_rightDoubleQuote;
    v5->_rightDoubleQuote = (NSString *)v22;

  }
  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)apostrophe
{
  return self->_apostrophe;
}

- (NSString)leftDoubleQuote
{
  return self->_leftDoubleQuote;
}

- (NSString)rightDoubleQuote
{
  return self->_rightDoubleQuote;
}

- (BOOL)usesDirectionalQuotes
{
  return self->_usesDirectionalQuotes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
