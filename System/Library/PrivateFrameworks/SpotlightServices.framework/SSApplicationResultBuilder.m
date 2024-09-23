@implementation SSApplicationResultBuilder

+ (id)formattedAlternateNamesForBundleId:(id)a3 withAlternateNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (formattedAlternateNamesForBundleId_withAlternateNames__onceToken != -1)
    dispatch_once(&formattedAlternateNamesForBundleId_withAlternateNames__onceToken, &__block_literal_global_43);
  objc_msgSend((id)formattedAlternateNamesForBundleId_withAlternateNames__cache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "length", (_QWORD)v19))
          {
            objc_msgSend(v13, "localizedLowercaseString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v13);

            if ((v15 & 1) != 0)
            {
              objc_msgSend(v13, "localizedCapitalizedString");
              v16 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = v13;
            }
            v17 = v16;
            objc_msgSend(v7, "addObject:", v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend((id)formattedAlternateNamesForBundleId_withAlternateNames__cache, "setObject:forKey:", v7, v5);
  }

  return v7;
}

void __84__SSApplicationResultBuilder_formattedAlternateNamesForBundleId_withAlternateNames___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)formattedAlternateNamesForBundleId_withAlternateNames__cache;
  formattedAlternateNamesForBundleId_withAlternateNames__cache = v0;

}

+ (id)bundleId
{
  return CFSTR("com.apple.application");
}

- (SSApplicationResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSApplicationResultBuilder *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
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
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SSApplicationResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v23, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "url");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v4, "url"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isFileURL"),
          v8,
          v7,
          v9))
    {
      v10 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v4, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleWithPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSApplicationResultBuilder setBundleId:](v5, "setBundleId:", v14);

    }
    else
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSApplicationResultBuilder setBundleId:](v5, "setBundleId:", v13);
    }

    v15 = (void *)objc_opt_class();
    -[SSApplicationResultBuilder bundleId](v5, "bundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5F90], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "formattedAlternateNamesForBundleId:withAlternateNames:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSApplicationResultBuilder setAlternateNames:](v5, "setAlternateNames:", v18);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[SSApplicationResultBuilder setName:](v5, "setName:", v19);
    }
    else
    {
      objc_msgSend(v4, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSApplicationResultBuilder setName:](v5, "setName:", v21);

    }
  }

  return v5;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v4;
  if (objc_msgSend(v4, "length"))
  {
    -[SSApplicationResultBuilder name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "localizedStandardContainsString:", v4);

    if ((v6 & 1) == 0)
    {
      -[SSResultBuilder queryContext](self, "queryContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "evaluator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[SSApplicationResultBuilder alternateNames](self, "alternateNames");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "localizedStandardContainsString:", v29);
            -[SSApplicationResultBuilder name](self, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            getHighlightedRichText(v13, v8, v15, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "formattedTextPieces");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            -[SSApplicationResultBuilder matchedAlternateName](self, "matchedAlternateName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v14 & 1) != 0)
            {
              -[SSApplicationResultBuilder setHighlightedAlternateName:](self, "setHighlightedAlternateName:", v16);
              -[SSApplicationResultBuilder setMatchedAlternateName:](self, "setMatchedAlternateName:", v13);

              goto LABEL_19;
            }
            if (v18 >= 2 && v19 == 0)
            {
              -[SSApplicationResultBuilder setHighlightedAlternateName:](self, "setHighlightedAlternateName:", v16);
              -[SSApplicationResultBuilder setMatchedAlternateName:](self, "setMatchedAlternateName:", v13);
            }

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_19:

    }
  }
  -[SSApplicationResultBuilder matchedAlternateName](self, "matchedAlternateName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SSApplicationResultBuilder matchedAlternateName](self, "matchedAlternateName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder result](self, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCompletion:", v22);

  }
  if (!-[SSResultBuilder isTopHit](self, "isTopHit"))
  {
    -[SSResultBuilder buildInlineCard](self, "buildInlineCard");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder result](self, "result");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setInlineCard:", v24);

  }
  -[SSResultBuilder result](self, "result");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)buildTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D8C660];
  -[SSApplicationResultBuilder name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildThumbnail
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  -[SSApplicationResultBuilder appURL](self, "appURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SSApplicationResultBuilder appURL](self, "appURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

    if (v7)
    {
      v8 = realpath_DARWIN_EXTSN(v7, 0);
      if (v8)
      {
        v9 = v8;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v8, 0, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (void *)v10;
        else
          v12 = v4;
        v13 = v12;

        free(v9);
        v4 = v13;
      }
    }
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setFilePath:", v4);
  }
  else
  {
    -[SSApplicationResultBuilder bundleId](self, "bundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v14 = (void *)objc_opt_new();
      -[SSApplicationResultBuilder bundleId](self, "bundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBundleIdentifier:", v15);

      v4 = 0;
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)matchedAlternateName
{
  return self->_matchedAlternateName;
}

- (void)setMatchedAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_matchedAlternateName, a3);
}

- (NSArray)alternateNames
{
  return self->_alternateNames;
}

- (void)setAlternateNames:(id)a3
{
  objc_storeStrong((id *)&self->_alternateNames, a3);
}

- (SFRichText)highlightedAlternateName
{
  return self->_highlightedAlternateName;
}

- (void)setHighlightedAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedAlternateName, a3);
}

- (NSURL)appURL
{
  return self->_appURL;
}

- (void)setAppURL:(id)a3
{
  objc_storeStrong((id *)&self->_appURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appURL, 0);
  objc_storeStrong((id *)&self->_highlightedAlternateName, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_matchedAlternateName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
