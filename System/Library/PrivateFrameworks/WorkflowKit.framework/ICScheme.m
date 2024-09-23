@implementation ICScheme

- (ICScheme)initWithDefinition:(id)a3 app:(id)a4
{
  id v7;
  id v8;
  ICScheme *v9;
  ICScheme *v10;
  uint64_t v11;
  NSString *scheme;
  uint64_t v13;
  NSDictionary *definition;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ICScheme *v19;
  id v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  NSArray *capabilities;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  NSString *v40;
  objc_class *v41;
  void *v42;
  uint64_t v43;
  NSArray *actions;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[ICScheme init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_app, v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v7, "copy");
      scheme = v10->_scheme;
      v10->_scheme = (NSString *)v11;

LABEL_42:
      v19 = v10;
      goto LABEL_43;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v7, "copy");
      definition = v10->_definition;
      v10->_definition = (NSDictionary *)v13;

      -[ICScheme definition](v10, "definition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("Scheme"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v17;
          else
            v18 = 0;
        }
        else
        {
          v18 = 0;
        }
        v22 = v18;

        v23 = v10->_scheme;
        v10->_scheme = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_26:
          if (!v10->_scheme)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("ICScheme.m"), 71, CFSTR("ICScheme definitions must include a Scheme key."));

          }
          -[ICScheme definition](v10, "definition");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", CFSTR("Capabilities"));
          v29 = objc_claimAutoreleasedReturnValue();
          capabilities = v10->_capabilities;
          v10->_capabilities = (NSArray *)v29;

          -[ICScheme definition](v10, "definition");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKey:", CFSTR("Actions"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v32, "count"))
          {
            v48 = v16;
            v49 = v8;
            v50 = v7;
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v47 = v32;
            v34 = v32;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v36; ++i)
                {
                  if (*(_QWORD *)v52 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  objc_msgSend(v39, "objectForKey:", CFSTR("ActionClass"), v47);
                  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v41 = NSClassFromString(v40);
                  if (!v41)
                    v41 = (objc_class *)objc_opt_class();
                  v42 = (void *)objc_msgSend([v41 alloc], "initWithDefinition:scheme:", v39, v10);
                  if (v42)
                    objc_msgSend(v33, "addObject:", v42);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
              }
              while (v36);
            }

            v43 = objc_msgSend(v33, "copy");
            actions = v10->_actions;
            v10->_actions = (NSArray *)v43;

            v8 = v49;
            v7 = v50;
            v32 = v47;
            v16 = v48;
          }

          goto LABEL_42;
        }
        v20 = v16;
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v21 = v20;
          else
            v21 = 0;
        }
        else
        {
          v21 = 0;
        }
        v23 = v21;

        -[NSString objectForKey:](v23, "objectForKey:", CFSTR("Phone"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
        }
        else
        {
          v25 = 0;
        }
        v26 = v25;

        v27 = v10->_scheme;
        v10->_scheme = v26;

      }
      goto LABEL_26;
    }
  }
  v19 = 0;
LABEL_43:

  return v19;
}

- (BOOL)isAvailable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  -[ICScheme scheme](self, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "canOpenURL:", v7);

  return v8;
}

- (BOOL)canLaunchApp
{
  void *v2;
  void *v3;
  char v4;

  -[ICScheme definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SchemeCannotLaunchApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v4;
}

- (NSURL)universalLinkBaseURL
{
  void *v2;
  void *v3;
  void *v4;

  -[ICScheme definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UniversalLinkBaseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)matchesURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICScheme scheme](self, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("http")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("https")))
  {
    -[ICScheme universalLinkBaseURL](self, "universalLinkBaseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13))
      {
        objc_msgSend(v4, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v14, "hasPrefix:", v15);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCallbackScheme
{
  void *v3;
  char v4;
  void *v5;

  -[ICScheme capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", CFSTR("x-callback")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICScheme capabilities](self, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", CFSTR("custom-callback"));

  }
  return v4;
}

- (NSString)callbackSourceNameKey
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;

  -[ICScheme capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("x-callback"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("x-source");
  }
  else
  {
    -[ICScheme definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CallbackSourceNameKey"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)callbackSuccessURLKey
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;

  -[ICScheme capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("x-callback"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("x-success");
  }
  else
  {
    -[ICScheme definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CallbackSuccessURLKey"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)callbackCancelURLKey
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;

  -[ICScheme capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("x-callback"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("x-cancel");
  }
  else
  {
    -[ICScheme definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CallbackCancelURLKey"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)callbackErrorURLKey
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;

  -[ICScheme capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("x-callback"));

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("x-error");
  }
  else
  {
    -[ICScheme definition](self, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CallbackErrorURLKey"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  ICScheme *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (ICScheme *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICScheme definition](self, "definition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICScheme definition](v4, "definition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ICScheme definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)ICScheme;
  -[ICScheme description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICScheme scheme](self, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICScheme app](self, "app");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ from %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ICApp)app
{
  return (ICApp *)objc_loadWeakRetained((id *)&self->_app);
}

- (NSString)scheme
{
  return self->_scheme;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_destroyWeak((id *)&self->_app);
}

@end
