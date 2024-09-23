@implementation _ICURLRequest

- (_ICURLRequest)initWithURL:(id)a3 scheme:(id)a4 userInterface:(id)a5 successHandler:(id)a6 failureHandler:(id)a7 bundleIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _ICURLRequest *v21;
  uint64_t v22;
  NSUUID *uniqueID;
  uint64_t v24;
  id successHandler;
  uint64_t v26;
  id failureHandler;
  uint64_t v28;
  NSString *bundleIdentifier;
  _ICURLRequest *v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = -[_ICURLRequest init](self, "init");
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = objc_claimAutoreleasedReturnValue();
    uniqueID = v21->_uniqueID;
    v21->_uniqueID = (NSUUID *)v22;

    objc_storeStrong((id *)&v21->_URL, a3);
    objc_storeStrong((id *)&v21->_scheme, a4);
    objc_storeWeak((id *)&v21->_userInterface, v17);
    v24 = objc_msgSend(v18, "copy");
    successHandler = v21->_successHandler;
    v21->_successHandler = (id)v24;

    v26 = objc_msgSend(v19, "copy");
    failureHandler = v21->_failureHandler;
    v21->_failureHandler = (id)v26;

    v28 = objc_msgSend(v20, "copy");
    bundleIdentifier = v21->_bundleIdentifier;
    v21->_bundleIdentifier = (NSString *)v28;

    v21->_callbackRequest = objc_msgSend(v16, "isCallbackScheme");
    v21->_deferCompletionUntilReturn = objc_msgSend(v16, "isCallbackScheme");
    v30 = v21;
  }

  return v21;
}

- (id)opener
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23___ICURLRequest_opener__block_invoke;
  aBlock[3] = &unk_1E7AF08B8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

- (NSString)action
{
  NSString *action;

  action = self->_action;
  if (!action)
  {
    -[_ICURLRequest parseActions](self, "parseActions");
    action = self->_action;
  }
  return action;
}

- (NSString)subAction
{
  NSString *subAction;

  subAction = self->_subAction;
  if (!subAction)
  {
    -[_ICURLRequest parseActions](self, "parseActions");
    subAction = self->_subAction;
  }
  return subAction;
}

- (void)parseActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *action;
  unint64_t v9;
  NSString *v10;
  NSString *v11;
  NSString *subAction;
  NSString **p_subAction;
  uint64_t v14;
  NSString *v15;
  id v16;

  -[_ICURLRequest URL](self, "URL");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v16, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(v5, "removeObject:", CFSTR("/"));
  objc_msgSend(v16, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("http")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("https")))
  {
    objc_msgSend(v5, "firstObject");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    action = self->_action;
    self->_action = v7;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v16, "host");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    action = self->_action;
    self->_action = v10;
  }

  if (objc_msgSend(v5, "count") <= v9)
  {
    p_subAction = &self->_subAction;
    subAction = self->_subAction;
    self->_subAction = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v9);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    p_subAction = &self->_subAction;
    subAction = self->_subAction;
    self->_subAction = v11;
  }

  if (-[NSString isEqualToString:](self->_action, "isEqualToString:", CFSTR("x-callback-url")))
  {
    self->_callbackRequest = 1;
    objc_storeStrong((id *)&self->_action, self->_subAction);
    if (objc_msgSend(v5, "count") <= v9 + 1)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndex:", v9 + 1);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = *p_subAction;
    *p_subAction = (NSString *)v14;

  }
}

- (NSDictionary)parameters
{
  NSDictionary *parameters;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  parameters = self->_parameters;
  if (!parameters)
  {
    -[_ICURLRequest URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dc_queryDictionary");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_parameters;
    self->_parameters = v5;

    parameters = self->_parameters;
  }
  return parameters;
}

- (NSString)sourceName
{
  NSString *sourceName;
  NSString *v3;
  void *v4;

  sourceName = self->_sourceName;
  if (sourceName)
  {
    v3 = sourceName;
  }
  else
  {
    -[_ICURLRequest parameters](self, "parameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("x-source"));
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICURLRequest;
  -[_ICURLRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICURLRequest URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSURL)URL
{
  return self->_URL;
}

- (ICScheme)scheme
{
  return self->_scheme;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (WFUserInterfaceHost)userInterface
{
  return (WFUserInterfaceHost *)objc_loadWeakRetained((id *)&self->_userInterface);
}

- (id)successHandler
{
  return self->_successHandler;
}

- (void)setSuccessHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (void)setFailureHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isCallbackRequest
{
  return self->_callbackRequest;
}

- (void)setCallbackRequest:(BOOL)a3
{
  self->_callbackRequest = a3;
}

- (BOOL)deferCompletionUntilReturn
{
  return self->_deferCompletionUntilReturn;
}

- (void)setDeferCompletionUntilReturn:(BOOL)a3
{
  self->_deferCompletionUntilReturn = a3;
}

- (NSString)successURLQueryString
{
  return self->_successURLQueryString;
}

- (void)setSuccessURLQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)generatedCallbackURL
{
  return self->_generatedCallbackURL;
}

- (void)setGeneratedCallbackURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(int64_t)a3
{
  self->_retries = a3;
}

- (BOOL)isInternalCallbackRequest
{
  return self->_internalCallbackRequest;
}

- (void)setInternalCallbackRequest:(BOOL)a3
{
  self->_internalCallbackRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedCallbackURL, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_successURLQueryString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_successHandler, 0);
  objc_destroyWeak((id *)&self->_userInterface);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_subAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (id)requestWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:scheme:userInterface:successHandler:failureHandler:bundleIdentifier:", v4, 0, 0, 0, 0, 0);

  return v5;
}

+ (id)requestWithURL:(id)a3 fromSourceApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:scheme:userInterface:successHandler:failureHandler:bundleIdentifier:", v7, 0, 0, 0, 0, v6);

  return v8;
}

+ (id)requestWithURL:(id)a3 scheme:(id)a4 userInterface:(id)a5 bundleIdentifier:(id)a6 successHandler:(id)a7 failureHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:scheme:userInterface:successHandler:failureHandler:bundleIdentifier:", v19, v18, v17, v15, v14, v16);

  return v20;
}

@end
