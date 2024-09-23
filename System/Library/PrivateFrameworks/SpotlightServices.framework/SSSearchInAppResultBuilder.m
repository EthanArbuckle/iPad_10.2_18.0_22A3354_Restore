@implementation SSSearchInAppResultBuilder

+ (id)buildResultWithAppName:(id)a3 appBundleId:(id)a4 searchString:(id)a5 searchInAppType:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  SSSearchInAppResultBuilder *v12;
  void *v13;

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[SSSearchInAppResultBuilder initWithAppName:appBundleId:searchString:searchInAppType:]([SSSearchInAppResultBuilder alloc], "initWithAppName:appBundleId:searchString:searchInAppType:", v11, v10, v9, v6);

  -[SSSearchInAppResultBuilder buildResult](v12, "buildResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (SSSearchInAppResultBuilder)initWithAppName:(id)a3 appBundleId:(id)a4 searchString:(id)a5 searchInAppType:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  SSSearchInAppResultBuilder *v13;
  SSSearchInAppResultBuilder *v14;
  void *v15;
  objc_super v17;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SSSearchInAppResultBuilder;
  v13 = -[SSSearchInAppResultBuilder init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[SSSearchInAppResultBuilder setAppName:](v13, "setAppName:", v10);
    -[SSSearchInAppResultBuilder setAppBundleId:](v14, "setAppBundleId:", v11);
    -[SSSearchInAppResultBuilder setSearchString:](v14, "setSearchString:", v12);
    v15 = (void *)objc_opt_new();
    -[SSResultBuilder setResult:](v14, "setResult:", v15);

    -[SSSearchInAppResultBuilder setSearchInAppType:](v14, "setSearchInAppType:", v6);
  }

  return v14;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  -[SSSearchInAppResultBuilder appBundleId](self, "appBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("com.apple.other:search_"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D8C6B0]);
  -[SSSearchInAppResultBuilder searchString](self, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSSearchInAppResultBuilder searchString](self, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithSuggestion:query:score:type:", v8, v9, 13, 0.0);

  -[SSSearchInAppResultBuilder appBundleId](self, "appBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBundleIdentifier:", v11);

  v15.receiver = self;
  v15.super_class = (Class)SSSearchInAppResultBuilder;
  -[SSResultBuilder buildResult](&v15, sel_buildResult);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResultBundleId:", v6);
  objc_msgSend(v12, "setIdentifier:", v6);
  objc_msgSend(v12, "setType:", 16);
  objc_msgSend(v12, "setSuggestion:", v10);
  -[SSSearchInAppResultBuilder appBundleId](self, "appBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setApplicationBundleIdentifier:", v13);

  return v12;
}

- (id)buildInlineCardSections
{
  void *v3;
  int v4;
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
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[SSSearchInAppResultBuilder appBundleId](self, "appBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("com.apple.AppStore"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH_APP_STORE"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH_IN_APP"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSSearchInAppResultBuilder appName](self, "appName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsEmphasized:", 1);
  v11 = (void *)objc_opt_new();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFormattedTextPieces:", v12);

  v13 = (void *)objc_opt_new();
  -[SSSearchInAppResultBuilder appBundleId](self, "appBundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBundleIdentifier:", v14);

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setSuggestionText:", v11);
  objc_msgSend(v15, "setSuggestionType:", 2);
  objc_msgSend(v15, "setThumbnail:", v13);
  -[SSSearchInAppResultBuilder buildCommand](self, "buildCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCommand:", v16);

  v19 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[SSSearchInAppResultBuilder searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchString:", v4);

  -[SSSearchInAppResultBuilder appBundleId](self, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationBundleIdentifier:", v5);

  objc_msgSend(v3, "setSearchInAppType:", -[SSSearchInAppResultBuilder searchInAppType](self, "searchInAppType"));
  return v3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (int)searchInAppType
{
  return self->_searchInAppType;
}

- (void)setSearchInAppType:(int)a3
{
  self->_searchInAppType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
