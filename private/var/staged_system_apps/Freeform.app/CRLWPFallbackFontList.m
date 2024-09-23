@implementation CRLWPFallbackFontList

+ (id)sharedInstance
{
  if (qword_101414DF0 != -1)
    dispatch_once(&qword_101414DF0, &stru_101237850);
  return (id)qword_101414DE8;
}

- (CRLWPFallbackFontList)init
{
  void *v3;
  void *v4;
  id v5;
  CRLWPFallbackFontList *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("CRLWPFallbackFonts"), CFSTR("plist")));

  v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v4);
  v6 = -[CRLWPFallbackFontList initWithList:](self, "initWithList:", v5);

  return v6;
}

- (CRLWPFallbackFontList)initWithList:(id)a3
{
  id v5;
  CRLWPFallbackFontList *v6;
  CRLWPFallbackFontList *v7;
  id localizedFontFamilyNameResolver;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLWPFallbackFontList;
  v6 = -[CRLWPFallbackFontList init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fallbackFontList, a3);
    localizedFontFamilyNameResolver = v7->_localizedFontFamilyNameResolver;
    v7->_localizedFontFamilyNameResolver = &stru_101237890;

  }
  return v7;
}

- (NSSet)replaceableFontNames
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFallbackFontList fallbackFontList](self, "fallbackFontList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (id)fallbackListForPostscriptFontName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFallbackFontList fallbackFontList](self, "fallbackFontList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "objectForKeyedSubscript:", CFSTR("PostScript-name"), (_QWORD)v15));
        objc_msgSend(v5, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)fallbackFontNameForFontWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFallbackFontList fallbackFontList](self, "fallbackFontList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "objectForKeyedSubscript:", CFSTR("PostScript-name"), (_QWORD)v16));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontVerifier sharedInstance](CRLWPFontVerifier, "sharedInstance"));
      v14 = objc_msgSend(v13, "isFontWithPostscriptNameInstalled:", v12);

      if ((v14 & 1) != 0)
        break;

      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (id)localizedNameForMasqueradingFontName:(id)a3
{
  id v4;
  uint64_t (**v5)(void);
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CRLWPFallbackFontList localizedFontFamilyNameResolver](self, "localizedFontFamilyNameResolver"));
  v6 = v5[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));
  return v8;
}

- (BOOL)isMasqueradingFontName:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPFontVerifier sharedInstance](CRLWPFontVerifier, "sharedInstance"));
  v6 = objc_msgSend(v5, "isFontWithPostscriptNameInstalled:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFallbackFontList fallbackFontNameForFontWithName:](self, "fallbackFontNameForFontWithName:", v4));
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFallbackFontList masqueradingFontNames](self, "masqueradingFontNames"));
      v7 = objc_msgSend(v9, "containsObject:", v8);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (NSSet)masqueradingFontNames
{
  return (NSSet *)+[CRLWPFont masqueradingFontNames](CRLWPFont, "masqueradingFontNames");
}

- (NSDictionary)fallbackFontList
{
  return self->_fallbackFontList;
}

- (void)setFallbackFontList:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackFontList, a3);
}

- (id)localizedFontFamilyNameResolver
{
  return self->_localizedFontFamilyNameResolver;
}

- (void)setLocalizedFontFamilyNameResolver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localizedFontFamilyNameResolver, 0);
  objc_storeStrong((id *)&self->_fallbackFontList, 0);
}

@end
