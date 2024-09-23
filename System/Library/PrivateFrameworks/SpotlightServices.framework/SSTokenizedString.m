@implementation SSTokenizedString

- (id)tokenize
{
  NSArray *tokens;
  id v4;
  void *v5;
  NSString *original;
  NSString *locale;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSString *v12;
  NSArray *v13;
  _QWORD v15[4];
  NSArray *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  tokens = self->_tokens;
  if (!tokens)
  {
    if (self->_shouldTokenize)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = (void *)MEMORY[0x1E0CA6AB8];
      locale = self->_locale;
      original = self->_original;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __29__SSTokenizedString_tokenize__block_invoke;
      v15[3] = &unk_1E6E436A0;
      v8 = (NSArray *)v4;
      v16 = v8;
      objc_msgSend(v5, "enumerateTokensForString:locale:options:withHandler:", original, locale, 2, v15);
      v9 = self->_tokens;
      self->_tokens = v8;
      v10 = v8;

      v11 = v16;
    }
    else
    {
      v12 = self->_original;
      if (!v12)
      {
LABEL_7:
        tokens = self->_tokens;
        return tokens;
      }
      v10 = (NSArray *)-[NSString copy](v12, "copy");
      v17[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_tokens;
      self->_tokens = v13;
    }

    goto LABEL_7;
  }
  return tokens;
}

uint64_t __29__SSTokenizedString_tokenize__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (SSTokenizedString)initWithString:(id)a3 locale:(id)a4
{
  id v7;
  id v8;
  NSString *original;
  void *v10;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_original, a3);
  objc_storeStrong((id *)&self->_locale, a4);
  if (-[NSString length](self->_original, "length"))
  {
    original = self->_original;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldTokenize = -[NSString rangeOfCharacterFromSet:](original, "rangeOfCharacterFromSet:", v10) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    self->_shouldTokenize = 0;
  }

  return self;
}

- (id)tokenMatchForMatchInfoToken:(id)a3
{
  id v4;
  id v5;
  SSTokenMatch *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;

  v4 = a3;
  v5 = (id)objc_msgSend(v4, "tokenize");
  v6 = objc_alloc_init(SSTokenMatch);
  -[SSTokenMatch setType:](v6, "setType:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SSTokenMatch setIndexes:](v6, "setIndexes:", v7);

  v8 = -[SSTokenizedString tokenize](self, "tokenize");
  -[SSTokenizedString tokens](self, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    do
    {
      -[SSTokenizedString tokens](self, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tokens");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "tokenMatch:", v15);

      objc_msgSend(v4, "tokens");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 == 1)
      {
        if (v16)
        {
          -[SSTokenMatch indexes](v6, "indexes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);

          if (-[SSTokenMatch type](v6, "type") != 2)
            -[SSTokenMatch setType:](v6, "setType:", v16);
        }
      }
      else if (v16 == 2)
      {
        -[SSTokenizedString tokens](self, "tokens");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count") - v11;
        objc_msgSend(v4, "tokens");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v22 < v24)
          break;
        objc_msgSend(v4, "tokens");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26 >= 2)
        {
          v27 = 1;
          do
          {
            -[SSTokenizedString tokens](self, "tokens");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", v11 + v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "tokens");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectAtIndexedSubscript:", v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v29, "tokenMatch:", v31);

            objc_msgSend(v4, "tokens");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "count") - 1;

            if (v27 == v34)
            {
              -[SSTokenMatch setType:](v6, "setType:", v32);
              if (v32)
              {
                -[SSTokenMatch indexes](v6, "indexes");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v36);

              }
            }
            else if (v32 != 2)
            {
              break;
            }
            ++v27;
            objc_msgSend(v4, "tokens");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

          }
          while (v27 < v38);
        }
      }
      ++v11;
      -[SSTokenizedString tokens](self, "tokens");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");

    }
    while (v11 < v40);
  }

  return v6;
}

- (BOOL)hasPrefixForMatchInfoToken:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SSTokenizedString tokenMatchForMatchInfoToken:](self, "tokenMatchForMatchInfoToken:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type"))
  {
    objc_msgSend(v3, "indexes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v3, "indexes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_1E6E97758);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)original
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOriginal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
