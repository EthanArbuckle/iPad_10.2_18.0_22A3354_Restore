@implementation OSASubmissionPolicy

- (OSASubmissionPolicy)init
{
  OSASubmissionPolicy *v2;
  OSASubmissionPolicy *v3;
  uint64_t v4;
  NSMutableDictionary *results;
  uint64_t v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  NSMutableSet *allowOptOutByRouting;
  uint64_t v10;
  NSMutableDictionary *scanOptions;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *default_template;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSMutableSet *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)OSASubmissionPolicy;
  v2 = -[OSASubmissionPolicy init](&v32, sel_init);
  v3 = v2;
  if (v2)
  {
    -[OSASubmissionPolicy _loadPreviousResults](v2, "_loadPreviousResults");
    v4 = objc_claimAutoreleasedReturnValue();
    results = v3->_results;
    v3->_results = (NSMutableDictionary *)v4;

    if (!v3->_results)
    {
      v6 = objc_opt_new();
      v7 = v3->_results;
      v3->_results = (NSMutableDictionary *)v6;

    }
    v8 = objc_opt_new();
    allowOptOutByRouting = v3->_allowOptOutByRouting;
    v3->_allowOptOutByRouting = (NSMutableSet *)v8;

    v10 = objc_opt_new();
    scanOptions = v3->_scanOptions;
    v3->_scanOptions = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submissionParam:", CFSTR("templates"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("default"));
    v14 = objc_claimAutoreleasedReturnValue();
    default_template = v3->_default_template;
    v3->_default_template = (NSArray *)v14;

    objc_storeStrong((id *)&v3->_primary_template, v3->_default_template);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v3->_default_template;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("policy"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("allow-optout"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if (v24)
          {
            v25 = v3->_allowOptOutByRouting;
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("routing"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v25, "addObject:", v26);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v18);
    }

  }
  return v3;
}

- (OSASubmissionPolicy)initWithTemplate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  OSASubmissionPolicy *v8;
  OSASubmissionPolicy *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *primary_template;
  uint64_t v14;
  NSArray *specific_files;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSDictionary *prefaces;

  v6 = a3;
  v7 = a4;
  v8 = -[OSASubmissionPolicy init](self, "init");
  v9 = v8;
  if (v6 && v8)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("default")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "submissionParam:", CFSTR("templates"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      primary_template = v9->_primary_template;
      v9->_primary_template = (NSArray *)v12;

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("logs"));
    v14 = objc_claimAutoreleasedReturnValue();
    specific_files = v9->_specific_files;
    v9->_specific_files = (NSArray *)v14;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("submission_info"));
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v16;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("prefaces"));
    v18 = objc_claimAutoreleasedReturnValue();
    prefaces = v9->_prefaces;
    v9->_prefaces = (NSDictionary *)v18;

  }
  return v9;
}

- (id)_loadPreviousResults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathDiagnostics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.osanalytics.submissionStatus.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  return v7;
}

- (void)persist
{
  OUTLINED_FUNCTION_0(&dword_1D3A90000, MEMORY[0x1E0C81028], a3, "Could not safely open submission results path: %@", a5, a6, a7, a8, 2u);
}

void __30__OSASubmissionPolicy_persist__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  id obj;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", a2, 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  obj = 0;
  objc_msgSend(v3, "writeData:error:", v4, &obj);
  objc_storeStrong(v5, obj);

}

- (NSDictionary)latestResults
{
  return (NSDictionary *)self->_results;
}

- (id)shouldSubmitRouting:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "optInApple") & 1) != 0)
  {

LABEL_4:
    v7 = &stru_1E954D0B0;
    goto LABEL_8;
  }
  v6 = -[NSMutableSet containsObject:](self->_allowOptOutByRouting, "containsObject:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ignoring %{public}@ during Opt-OUT", (uint8_t *)&v11, 0xCu);
  }
  v7 = CFSTR("opt-out");
LABEL_8:
  if (-[__CFString length](v7, "length"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)buildSubmissionTemplateForConfig:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *specific_files;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D64EE8], "getAvailableTaskingRoutings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasTasking = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v4;
  v6 = objc_msgSend(v4, "isProxy");
  v7 = 16;
  if (v6)
    v7 = 8;
  v8 = *(id *)((char *)&self->super.isa + v7);
  v32 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = (NSArray *)v8;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  v31 = v5;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("routing"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "mutableCopy");
        -[OSASubmissionPolicy shouldSubmitRouting:](self, "shouldSubmitRouting:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("<inactive>"));
          v18 = v33;
        }
        else
        {
          if (objc_msgSend(v30, "containsObject:", v15))
            self->_hasTasking = 1;
          if (v9 != self->_default_template)
          {
            if (self->_specific_files)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("extensions"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");

              if (!v20)
              {
                objc_msgSend(v16, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("submission_info"));
                objc_msgSend(v16, "setObject:forKeyedSubscript:", self->_specific_files, CFSTR("logs"));
                specific_files = self->_specific_files;
                self->_specific_files = 0;

              }
            }
          }
          -[NSDictionary objectForKeyedSubscript:](self->_prefaces, "objectForKeyedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v31;
          v18 = v32;
          if (v22)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_prefaces, "objectForKeyedSubscript:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("<preface>"));

            v18 = v32;
          }
        }
        objc_msgSend(v18, "addObject:", v15);
        objc_msgSend(v5, "addObject:", v16);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v11);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend(v29, "isProxy"))
      v24 = CFSTR("proxy");
    else
      v24 = CFSTR("primary");
    if (v9 == self->_default_template)
      v25 = CFSTR("default");
    else
      v25 = CFSTR("custom");
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v24;
    v40 = 2112;
    v41 = v25;
    v42 = 2112;
    v43 = v26;
    v44 = 2112;
    v45 = v27;
    _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "submission template '%@:%@' includes [%@]; excludes [%@]",
      buf,
      0x2Au);

  }
  return v31;
}

- (void)registerRouting:(id)a3 result:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  __CFString *v13;

  v4 = a4;
  v13 = (__CFString *)a3;
  v6 = -[NSMutableSet containsObject:](self->_allowOptOutByRouting, "containsObject:", v13);
  v7 = CFSTR("default");
  if (v6)
    v7 = v13;
  v8 = v7;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_results, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    if (v4)
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("attempt"));
  }
  else
  {
    v10 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_results, "setObject:forKeyedSubscript:", v10, v8);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v12 = CFSTR("success");
  else
    v12 = CFSTR("attempt");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

}

- (BOOL)ignoreProxies
{
  return self->_ignoreProxies;
}

- (void)setIgnoreProxies:(BOOL)a3
{
  self->_ignoreProxies = a3;
}

- (BOOL)hasTasking
{
  return self->_hasTasking;
}

- (NSMutableDictionary)scanOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOptions, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_prefaces, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_specific_files, 0);
  objc_storeStrong((id *)&self->_allowOptOutByRouting, 0);
  objc_storeStrong((id *)&self->_primary_template, 0);
  objc_storeStrong((id *)&self->_default_template, 0);
}

@end
