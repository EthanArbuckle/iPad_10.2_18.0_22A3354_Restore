@implementation VUIDocumentDataSource

- (NSString)documentRef
{
  return self->_documentRef;
}

- (BOOL)shouldLoadPageImmediately
{
  return self->_shouldLoadPageImmediately;
}

- (VUIDocumentPreFetchedData)prefetchData
{
  return self->_prefetchData;
}

- (NSString)documentType
{
  return self->_documentType;
}

- (VUIDocumentContextData)contextData
{
  return self->_contextData;
}

- (NSArray)childDocumentDataSources
{
  return self->_childDocumentDataSources;
}

- (NSString)controllerRef
{
  return self->_controllerRef;
}

- (VUIDocumentUIConfiguration)uiConfiguration
{
  return self->_uiConfiguration;
}

- (void)setUiConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_uiConfiguration, a3);
}

- (void)setShouldLoadPageImmediately:(BOOL)a3
{
  self->_shouldLoadPageImmediately = a3;
}

- (VUIDocumentDataSource)initWithDocumentRef:(id)a3
{
  id v4;
  VUIDocumentDataSource *v5;
  VUIDocumentDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIDocumentDataSource;
  v5 = -[VUIDocumentDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[VUIDocumentDataSource setDocumentRef:](v5, "setDocumentRef:", v4);

  return v6;
}

- (void)setDocumentRef:(id)a3
{
  objc_storeStrong((id *)&self->_documentRef, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setDocumentType:(id)a3
{
  objc_storeStrong((id *)&self->_documentType, a3);
}

- (void)setControllerRef:(id)a3
{
  objc_storeStrong((id *)&self->_controllerRef, a3);
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDocumentDataSources, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_marketingTabIdentifier, 0);
  objc_storeStrong((id *)&self->_universalLinks, 0);
  objc_storeStrong((id *)&self->_uiConfiguration, 0);
  objc_storeStrong((id *)&self->_prefetchData, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_controllerRef, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
  objc_storeStrong((id *)&self->_documentRef, 0);
}

+ (id)documentDataSourceWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VUIDocumentDataSource *v6;

  v3 = a3;
  objc_msgSend(v3, "vui_stringForKey:", CFSTR("documentRef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_dictionaryForKey:", CFSTR("uiConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v6 = -[VUIDocumentDataSource initWithDataSourceDict:]([VUIDocumentDataSource alloc], "initWithDataSourceDict:", v3);
    -[VUIDocumentDataSource setDocumentRef:](v6, "setDocumentRef:", v4);
  }
  else if (objc_msgSend(v5, "count"))
  {
    v6 = -[VUIDocumentDataSource initWithDataSourceDict:]([VUIDocumentDataSource alloc], "initWithDataSourceDict:", v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isCanonicalDocumentRef:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("TVShowCanonical")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("MovieCanonical")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EpisodeCanonical")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("SportsCanonical"));

  return v4;
}

- (VUIDocumentDataSource)initWithDataSourceDict:(id)a3
{
  id v4;
  VUIDocumentDataSource *v5;
  VUIDocumentDataSource *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIDocumentContextData *v14;
  VUIDocumentContextData *contextData;
  void *v16;
  VUIDocumentPreFetchedData *v17;
  VUIDocumentPreFetchedData *prefetchData;
  void *v19;
  uint64_t v20;
  VUIDocumentUIConfiguration *uiConfiguration;
  void *v22;
  uint64_t v23;
  NSArray *universalLinks;
  uint64_t v25;
  NSString *identifier;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VUIDocumentDataSource;
  v5 = -[VUIDocumentDataSource init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_shouldLoadPageImmediately = 1;
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("documentType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      v8 = v7;
    else
      v8 = 0;
    objc_storeStrong((id *)&v6->_documentType, v8);
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("controllerRef"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      v10 = v9;
    else
      v10 = 0;
    objc_storeStrong((id *)&v6->_controllerRef, v10);
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      v12 = v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&v6->_title, v12);
    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("contextData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = -[VUIDocumentContextData initWithDictionary:]([VUIDocumentContextData alloc], "initWithDictionary:", v13);
      contextData = v6->_contextData;
      v6->_contextData = v14;
    }
    else
    {
      contextData = v6->_contextData;
      v6->_contextData = 0;
    }

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("prefetchedData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v17 = -[VUIDocumentPreFetchedData initWithDictionary:]([VUIDocumentPreFetchedData alloc], "initWithDictionary:", v16);
      prefetchData = v6->_prefetchData;
      v6->_prefetchData = v17;
    }
    else
    {
      prefetchData = v6->_prefetchData;
      v6->_prefetchData = 0;
    }

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("uiConfiguration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIDocumentUIConfiguration uiConfigurationWithDict:](VUIDocumentUIConfiguration, "uiConfigurationWithDict:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    uiConfiguration = v6->_uiConfiguration;
    v6->_uiConfiguration = (VUIDocumentUIConfiguration *)v20;

    objc_msgSend(v4, "vui_arrayForKey:", CFSTR("universalLinks"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "vui_arrayByMappingObjectsUsingBlock:", &__block_literal_global_21);
    v23 = objc_claimAutoreleasedReturnValue();
    universalLinks = v6->_universalLinks;
    v6->_universalLinks = (NSArray *)v23;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("identifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v25;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("marketingIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length"))
      v28 = v27;
    else
      v28 = 0;
    objc_storeStrong((id *)&v6->_marketingTabIdentifier, v28);

  }
  return v6;
}

uint64_t __48__VUIDocumentDataSource_initWithDataSourceDict___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
}

- (id)jsonData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", self->_documentRef, CFSTR("documentRef"));
  -[VUIDocumentContextData jsonData](self->_contextData, "jsonData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("contextData"));

  -[VUIDocumentPreFetchedData jsonData](self->_prefetchData, "jsonData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("prefetchedData"));

  objc_msgSend(v3, "setValue:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v3, "setValue:forKey:", self->_uiConfiguration, CFSTR("uiConfiguration"));
  -[NSArray vui_arrayByMappingObjectsUsingBlock:](self->_universalLinks, "vui_arrayByMappingObjectsUsingBlock:", &__block_literal_global_126);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("universalLinks"));
  objc_msgSend(v3, "setValue:forKey:", self->_marketingTabIdentifier, CFSTR("marketingIdentifier"));
  -[VUIDocumentDataSource childDocumentDataSources](self, "childDocumentDataSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[VUIDocumentDataSource childDocumentDataSources](self, "childDocumentDataSources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[VUIDocumentDataSource childDocumentDataSources](self, "childDocumentDataSources", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "jsonData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("children"));
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __33__VUIDocumentDataSource_jsonData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "absoluteString");
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VUIDocumentDataSource uiConfiguration](self, "uiConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[VUIDocumentDataSource documentRef](self, "documentRef");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("DocumentRef: %@ uiConfiguration %@ action type %ld"), v5, v3, objc_msgSend(v3, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  VUIDocumentDataSource *v4;
  VUIDocumentDataSource *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;

  v4 = (VUIDocumentDataSource *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VUIDocumentDataSource documentType](self, "documentType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDocumentDataSource documentType](v5, "documentType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        -[VUIDocumentDataSource controllerRef](self, "controllerRef");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentDataSource controllerRef](v5, "controllerRef");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          -[VUIDocumentDataSource title](self, "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIDocumentDataSource title](v5, "title");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 == v13)
          {
            -[VUIDocumentDataSource identifier](self, "identifier");
            v14 = objc_claimAutoreleasedReturnValue();
            -[VUIDocumentDataSource identifier](v5, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)v14;
            if ((void *)v14 == v15)
            {
              v38 = v15;
              -[VUIDocumentDataSource universalLinks](self, "universalLinks");
              v16 = objc_claimAutoreleasedReturnValue();
              -[VUIDocumentDataSource universalLinks](v5, "universalLinks");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)v16;
              if ((void *)v16 == v17)
              {
                v36 = v17;
                -[VUIDocumentDataSource marketingTabIdentifier](self, "marketingTabIdentifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIDocumentDataSource marketingTabIdentifier](v5, "marketingTabIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v35 == v18;

                v17 = v36;
              }
              else
              {
                v8 = 0;
              }

              v15 = v38;
            }
            else
            {
              v8 = 0;
            }

          }
          else
          {
            v8 = 0;
          }

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

      -[VUIDocumentDataSource contextData](self, "contextData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = 0;
      else
        v20 = v8;
      if (v19 && v8)
      {
        -[VUIDocumentDataSource contextData](self, "contextData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentDataSource contextData](v5, "contextData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "isEqual:", v22);

      }
      -[VUIDocumentDataSource prefetchData](self, "prefetchData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        v24 = 0;
      else
        v24 = v20;
      if (v23 && v20)
      {
        -[VUIDocumentDataSource prefetchData](self, "prefetchData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentDataSource prefetchData](v5, "prefetchData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v25, "isEqual:", v26);

      }
      -[VUIDocumentDataSource uiConfiguration](self, "uiConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        v28 = 0;
      else
        v28 = v24;
      if (v27 && v24)
      {
        -[VUIDocumentDataSource uiConfiguration](self, "uiConfiguration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentDataSource uiConfiguration](v5, "uiConfiguration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v29, "isEqual:", v30);

      }
      -[VUIDocumentDataSource childDocumentDataSources](self, "childDocumentDataSources");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
        v9 = 0;
      else
        v9 = v28;
      if (v31 && v28)
      {
        -[VUIDocumentDataSource childDocumentDataSources](self, "childDocumentDataSources");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIDocumentDataSource childDocumentDataSources](v5, "childDocumentDataSources");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v32, "isEqual:", v33);

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setPrefetchData:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchData, a3);
}

- (NSArray)universalLinks
{
  return self->_universalLinks;
}

- (void)setUniversalLinks:(id)a3
{
  objc_storeStrong((id *)&self->_universalLinks, a3);
}

- (NSString)marketingTabIdentifier
{
  return self->_marketingTabIdentifier;
}

- (void)setMarketingTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_marketingTabIdentifier, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)shouldUseZoomTransition
{
  return self->_shouldUseZoomTransition;
}

- (void)setShouldUseZoomTransition:(BOOL)a3
{
  self->_shouldUseZoomTransition = a3;
}

- (void)setChildDocumentDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_childDocumentDataSources, a3);
}

@end
