@implementation SXFontIndex

- (SXFontIndex)initWithFontFamilyProviders:(id)a3
{
  id v4;
  SXFontIndex *v5;
  uint64_t v6;
  NSMutableArray *fontFamilyProviders;
  NSCache *v8;
  NSCache *attributeToFontIndex;
  NSCache *v10;
  NSCache *fontToAttributeIndex;
  uint64_t v12;
  NSDictionary *fonts;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SXFontIndex;
  v5 = -[SXFontIndex init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    fontFamilyProviders = v5->_fontFamilyProviders;
    v5->_fontFamilyProviders = (NSMutableArray *)v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    attributeToFontIndex = v5->_attributeToFontIndex;
    v5->_attributeToFontIndex = v8;

    v10 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    fontToAttributeIndex = v5->_fontToAttributeIndex;
    v5->_fontToAttributeIndex = v10;

    -[SXFontIndex fontsForFamilyProviders:](v5, "fontsForFamilyProviders:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    fonts = v5->_fonts;
    v5->_fonts = (NSDictionary *)v12;

  }
  return v5;
}

- (void)addFontFamilyProvider:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *fonts;

  if (a3)
  {
    v4 = a3;
    -[SXFontIndex fontFamilyProviders](self, "fontFamilyProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[SXFontIndex fontsForFamilyProviders:](self, "fontsForFamilyProviders:", self->_fontFamilyProviders);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    fonts = self->_fonts;
    self->_fonts = v6;

    -[NSCache removeAllObjects](self->_attributeToFontIndex, "removeAllObjects");
    -[NSCache removeAllObjects](self->_fontToAttributeIndex, "removeAllObjects");
  }
}

- (id)fontNameForFontAttributes:(id)a3 size:(int64_t)a4
{
  id v6;
  SXFontIndexCacheKey *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  SXFontIndex *v19;
  id v20;
  NSDictionary *v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  SXFontIndexCacheKey *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v7 = -[SXFontIndexCacheKey initWithFontAttributes:fontSize:]([SXFontIndexCacheKey alloc], "initWithFontAttributes:fontSize:", v6, a4);
  -[NSCache objectForKey:](self->_attributeToFontIndex, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v6, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || objc_msgSend(v6, "width") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "weight") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      v11 = objc_msgSend(v6, "style");

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = self->_fonts;
        v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v13)
        {
          v14 = v13;
          v26 = v7;
          v8 = 0;
          v15 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v28 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
              if (-[SXFontIndex fontFamilyName:matchesFontAttributes:](self, "fontFamilyName:matchesFontAttributes:", v17, v6))
              {
                -[NSDictionary objectForKey:](self->_fonts, "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "fontFaceWithAttributes:size:", v6, a4);
                v19 = self;
                v20 = v6;
                v21 = v12;
                v22 = a4;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "fontName");
                v24 = objc_claimAutoreleasedReturnValue();
                v25 = v8;
                v8 = (void *)v24;

                a4 = v22;
                v12 = v21;
                v6 = v20;
                self = v19;

              }
            }
            v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v14);

          v7 = v26;
          if (v8)
            -[NSCache setObject:forKey:](self->_attributeToFontIndex, "setObject:forKey:", v8, v26);
          goto LABEL_8;
        }

      }
    }
    v8 = 0;
  }
LABEL_8:

LABEL_10:
  return v8;
}

- (id)fontFaceForFontAttributes:(id)a3 size:(int64_t)a4
{
  id v6;
  NSDictionary *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "familyName");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v6, "width") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v6, "weight") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = objc_msgSend(v6, "style");

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_5;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_fonts;
    v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v7);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (-[SXFontIndex fontFamilyName:matchesFontAttributes:](self, "fontFamilyName:matchesFontAttributes:", v15, v6, (_QWORD)v17))
          {
            -[NSDictionary objectForKey:](self->_fonts, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "fontFaceWithAttributes:size:", v6, a4);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_6;
          }
        }
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          continue;
        break;
      }
    }
  }

LABEL_5:
  v8 = 0;
LABEL_6:

  return v8;
}

- (id)fontAttributesForFontName:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSDictionary *obj;
  SXFontIndex *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_24;
  -[NSCache objectForKey:](self->_fontToAttributeIndex, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_25;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_fonts;
  v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (!v22)
  {

LABEL_24:
    v5 = 0;
    goto LABEL_25;
  }
  v23 = 0;
  v20 = self;
  v21 = *(_QWORD *)v29;
  obj = v6;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v29 != v21)
        objc_enumerationMutation(obj);
      -[NSDictionary objectForKey:](self->_fonts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v8, "fontFaces");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        while (2)
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
            objc_msgSend(v14, "fontName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v4);

            if (v16)
            {
              objc_msgSend(v14, "fontAttributes");
              v17 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v17;
              goto LABEL_18;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
            continue;
          break;
        }
LABEL_18:
        self = v20;
      }

    }
    v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  }
  while (v22);

  v5 = v23;
  if (v23)
    -[NSCache setObject:forKey:](self->_fontToAttributeIndex, "setObject:forKey:", v23, v4);
LABEL_25:

  return v5;
}

- (id)fontsForFamilyProviders:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v9, "fontFamilies");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(v15, "familyName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKey:", v15, v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)fontFamilyName:(id)a3 matchesFontAttributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v5) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v6, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24D68E0F8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v5);

  }
  return v8;
}

- (NSDictionary)fonts
{
  return self->_fonts;
}

- (NSCache)attributeToFontIndex
{
  return self->_attributeToFontIndex;
}

- (NSCache)fontToAttributeIndex
{
  return self->_fontToAttributeIndex;
}

- (NSMutableArray)fontFamilyProviders
{
  return self->_fontFamilyProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFamilyProviders, 0);
  objc_storeStrong((id *)&self->_fontToAttributeIndex, 0);
  objc_storeStrong((id *)&self->_attributeToFontIndex, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
}

@end
