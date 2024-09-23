@implementation WLKURLRequestProperties

void __157__WLKURLRequestProperties_requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion___block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("channels");
  v3[0] = &unk_1E68C96C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__migratedEndpoints;
  requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__migratedEndpoints = v0;

}

- (void)setTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setQueryParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void)setHttpMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setHttpBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setClientProtocolVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setCaller:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setApiVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)options
{
  return self->_options;
}

- (NSNumber)clientProtocolVersion
{
  return self->_clientProtocolVersion;
}

- (id)URLRequestWithConfiguration:(id)a3
{
  id v4;
  NSString *endpoint;
  NSString *routeName;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  unint64_t options;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSNumber *timeout;
  double v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  WLKURLRequestProperties *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  endpoint = self->_endpoint;
  routeName = self->_routeName;
  if (endpoint)
    v7 = routeName == 0;
  else
    v7 = 0;
  if (!v7 && (endpoint || routeName == 0))
    -[WLKURLRequestProperties URLRequestWithConfiguration:].cold.1();
  v9 = (void *)-[NSDictionary mutableCopy](self->_queryParameters, "mutableCopy");
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WLKURLRequestProperties clientProtocolVersion](self, "clientProtocolVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WLKURLRequestProperties clientProtocolVersion](self, "clientProtocolVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("v"));

  }
  if ((self->_options & 0x100000) == 0 && -[NSString length](self->_caller, "length"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_caller, CFSTR("caller"));
  options = self->_options;
  if (!self->_endpoint)
  {
    v18 = self->_routeName;
    if (!v18)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x1E0C99E98], "wlk_URLWithServerConfig:routeName:queryParameters:suppressParameterEncoding:", v4, v18, v9, (options >> 1) & 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_23;
LABEL_21:
    timeout = self->_timeout;
    if (timeout)
      -[NSNumber doubleValue](timeout, "doubleValue");
    else
      v20 = 30.0;
    objc_msgSend(MEMORY[0x1E0C92C80], "wlk_requestWithURL:httpMethod:httpBody:httpHeaders:cachePolicy:timeout:", v17, self->_httpMethod, self->_httpBody, self->_headers, 0, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v13 = (options >> 1) & 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/uts/v%@/"), self->_apiVersion);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = self->_endpoint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wlk_stringByAppendingPathComponents:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "wlk_URLWithServerConfig:endpoint:relativeToBaseURL:queryParameters:suppressParameterEncoding:", v4, v16, 1, v9, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    goto LABEL_21;
LABEL_23:
  WLKNetworkingLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_1B515A000, v21, OS_LOG_TYPE_DEFAULT, "%@: unable to resolve URL", buf, 0xCu);
  }

  v17 = 0;
  v22 = 0;
LABEL_28:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProtocolVersion, 0);
  objc_storeStrong((id *)&self->_apiVersion, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_httpMethod, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 apiVersion:(id)a10 options:(int64_t)a11 clientProtocolVersion:(id)a12
{
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  WLKURLRequestProperties *v25;
  id v26;
  void *v27;
  id v29;
  void *v30;

  v17 = (__CFString *)a5;
  v29 = a10;
  v18 = a12;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(WLKURLRequestProperties);
  -[WLKURLRequestProperties setEndpoint:](v25, "setEndpoint:", v24);

  -[WLKURLRequestProperties setQueryParameters:](v25, "setQueryParameters:", v23);
  if (!-[__CFString length](v17, "length"))
  {

    v17 = CFSTR("GET");
  }
  -[WLKURLRequestProperties setHttpMethod:](v25, "setHttpMethod:", v17, v29);
  -[WLKURLRequestProperties setHttpBody:](v25, "setHttpBody:", v22);

  -[WLKURLRequestProperties setHeaders:](v25, "setHeaders:", v21);
  -[WLKURLRequestProperties setCaller:](v25, "setCaller:", v20);

  -[WLKURLRequestProperties setTimeout:](v25, "setTimeout:", v19);
  -[WLKURLRequestProperties setClientProtocolVersion:](v25, "setClientProtocolVersion:", v18);

  if (requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__once != -1)
  {
    dispatch_once(&requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__once, &__block_literal_global_0);
    if (v30)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", WLKCurrentAPIVersion());
    v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v30)
    goto LABEL_7;
LABEL_5:
  v26 = v30;
LABEL_8:
  v27 = v26;
  -[WLKURLRequestProperties setApiVersion:](v25, "setApiVersion:", v26);
  -[WLKURLRequestProperties setOptions:](v25, "setOptions:", a11);

  return v25;
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 apiVersion:(id)a10 options:(int64_t)a11
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:clientProtocolVersion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithServerRoute:queryParameters:httpMethod:httpBody:headers:caller:timeout:options:", a3, a4, a5, 0, a6, a7, a8, a9);
}

+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 options:(int64_t)a10 clientProtocolVersion:(id)a11
{
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  WLKURLRequestProperties *v24;

  v16 = (__CFString *)a5;
  v17 = a11;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  v24 = objc_alloc_init(WLKURLRequestProperties);
  -[WLKURLRequestProperties setRouteName:](v24, "setRouteName:", v23);

  -[WLKURLRequestProperties setQueryParameters:](v24, "setQueryParameters:", v22);
  if (!-[__CFString length](v16, "length"))
  {

    v16 = CFSTR("GET");
  }
  -[WLKURLRequestProperties setHttpMethod:](v24, "setHttpMethod:", v16);
  -[WLKURLRequestProperties setHttpBody:](v24, "setHttpBody:", v21);

  -[WLKURLRequestProperties setHeaders:](v24, "setHeaders:", v20);
  -[WLKURLRequestProperties setCaller:](v24, "setCaller:", v19);

  -[WLKURLRequestProperties setTimeout:](v24, "setTimeout:", v18);
  -[WLKURLRequestProperties setOptions:](v24, "setOptions:", a10);
  -[WLKURLRequestProperties setClientProtocolVersion:](v24, "setClientProtocolVersion:", v17);

  return v24;
}

+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 options:(int64_t)a10
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithServerRoute:queryParameters:httpMethod:httpBody:headers:caller:timeout:options:clientProtocolVersion:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", a3, 0, 0, 0, 0, 0, 0, 0, 0);
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 caller:(id)a6
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", a3, a4, a5, 0, 0, a6, 0, 0, 0);
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", a3, a4, a5, 0, a6, a7, 0, 0, a9);
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9 clientProtocolVersion:(id)a10
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:clientProtocolVersion:", a3, a4, a5, 0, a6, a7, a8, 0, a9, a10);
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 apiVersion:(id)a9 options:(int64_t)a10
{
  return (WLKURLRequestProperties *)objc_msgSend(a1, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", a3, a4, a5, 0, a6, a7, 0, a9, a10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  WLKURLRequestProperties *v4;
  uint64_t v5;
  NSString *endpoint;
  uint64_t v7;
  NSString *routeName;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  NSString *httpMethod;
  uint64_t v15;
  NSDictionary *queryParameters;
  uint64_t v17;
  NSDictionary *headers;
  uint64_t v19;
  NSString *caller;
  uint64_t v21;
  NSNumber *timeout;
  uint64_t v23;
  NSNumber *apiVersion;

  v4 = objc_alloc_init(WLKURLRequestProperties);
  v5 = -[NSString copy](self->_endpoint, "copy");
  endpoint = v4->_endpoint;
  v4->_endpoint = (NSString *)v5;

  v7 = -[NSString copy](self->_routeName, "copy");
  routeName = v4->_routeName;
  v4->_routeName = (NSString *)v7;

  v9 = v4->_endpoint;
  v10 = v4->_routeName;
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (!v11)
  {
    if (v9)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (v12)
      -[WLKURLRequestProperties copyWithZone:].cold.1();
  }
  v13 = -[NSString copy](self->_httpMethod, "copy");
  httpMethod = v4->_httpMethod;
  v4->_httpMethod = (NSString *)v13;

  v15 = -[NSDictionary copy](self->_queryParameters, "copy");
  queryParameters = v4->_queryParameters;
  v4->_queryParameters = (NSDictionary *)v15;

  v17 = -[NSDictionary copy](self->_headers, "copy");
  headers = v4->_headers;
  v4->_headers = (NSDictionary *)v17;

  v19 = -[NSString copy](self->_caller, "copy");
  caller = v4->_caller;
  v4->_caller = (NSString *)v19;

  v21 = -[NSNumber copy](self->_timeout, "copy");
  timeout = v4->_timeout;
  v4->_timeout = (NSNumber *)v21;

  v23 = -[NSNumber copy](self->_apiVersion, "copy");
  apiVersion = v4->_apiVersion;
  v4->_apiVersion = (NSNumber *)v23;

  v4->_options = self->_options;
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  -[WLKURLRequestProperties endpoint](self, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[WLKURLRequestProperties routeName](self, "routeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[WLKURLRequestProperties httpMethod](self, "httpMethod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[WLKURLRequestProperties httpBody](self, "httpBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[WLKURLRequestProperties queryParameters](self, "queryParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[WLKURLRequestProperties headers](self, "headers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");

  -[WLKURLRequestProperties caller](self, "caller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  -[WLKURLRequestProperties timeout](self, "timeout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  -[WLKURLRequestProperties apiVersion](self, "apiVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");

  return v16 ^ v20 ^ -[WLKURLRequestProperties options](self, "options");
}

- (BOOL)isEqual:(id)a3
{
  WLKURLRequestProperties *v4;
  WLKURLRequestProperties *v5;
  WLKURLRequestProperties *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  char v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  char v47;
  char v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  char v54;
  char v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  char v61;
  char v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  char v68;
  char v69;
  int64_t v70;

  v4 = (WLKURLRequestProperties *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[WLKURLRequestProperties endpoint](self, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties endpoint](v6, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqual:", v10);
    }

    -[WLKURLRequestProperties routeName](self, "routeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties routeName](v6, "routeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    v17 = v15;
    v18 = v17;
    if (v16 == v17)
    {
      v19 = 1;
    }
    else
    {
      v19 = 0;
      if (v16 && v17)
        v19 = objc_msgSend(v16, "isEqual:", v17);
    }

    v20 = v12 & v19;
    -[WLKURLRequestProperties httpMethod](self, "httpMethod");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties httpMethod](v6, "httpMethod");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    v24 = v22;
    v25 = v24;
    if (v23 == v24)
    {
      v26 = 1;
    }
    else
    {
      v26 = 0;
      if (v23 && v24)
        v26 = objc_msgSend(v23, "isEqual:", v24);
    }

    v27 = v20 & v26;
    -[WLKURLRequestProperties httpBody](self, "httpBody");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties httpBody](v6, "httpBody");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v31 = v29;
    v32 = v31;
    if (v30 == v31)
    {
      v33 = 1;
    }
    else
    {
      v33 = 0;
      if (v30 && v31)
        v33 = objc_msgSend(v30, "isEqual:", v31);
    }

    v34 = v27 & v33;
    -[WLKURLRequestProperties queryParameters](self, "queryParameters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties queryParameters](v6, "queryParameters");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v35;
    v38 = v36;
    v39 = v38;
    if (v37 == v38)
    {
      v40 = 1;
    }
    else
    {
      v40 = 0;
      if (v37 && v38)
        v40 = objc_msgSend(v37, "isEqual:", v38);
    }

    v41 = v34 & v40;
    -[WLKURLRequestProperties headers](self, "headers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties headers](v6, "headers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v42;
    v45 = v43;
    v46 = v45;
    if (v44 == v45)
    {
      v47 = 1;
    }
    else
    {
      v47 = 0;
      if (v44 && v45)
        v47 = objc_msgSend(v44, "isEqual:", v45);
    }

    v48 = v41 & v47;
    -[WLKURLRequestProperties caller](self, "caller");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties caller](v6, "caller");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v49;
    v52 = v50;
    v53 = v52;
    if (v51 == v52)
    {
      v54 = 1;
    }
    else
    {
      v54 = 0;
      if (v51 && v52)
        v54 = objc_msgSend(v51, "isEqual:", v52);
    }

    v55 = v48 & v54;
    -[WLKURLRequestProperties timeout](self, "timeout");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties timeout](v6, "timeout");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v56;
    v59 = v57;
    v60 = v59;
    if (v58 == v59)
    {
      v61 = 1;
    }
    else
    {
      v61 = 0;
      if (v58 && v59)
        v61 = objc_msgSend(v58, "isEqual:", v59);
    }

    v62 = v55 & v61;
    -[WLKURLRequestProperties apiVersion](self, "apiVersion");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKURLRequestProperties apiVersion](v6, "apiVersion");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v63;
    v66 = v64;
    v67 = v66;
    if (v65 == v66)
    {
      v68 = 1;
    }
    else
    {
      v68 = 0;
      if (v65 && v66)
        v68 = objc_msgSend(v65, "isEqual:", v66);
    }

    v69 = v62 & v68;
    v70 = -[WLKURLRequestProperties options](self, "options");
    if (v70 == -[WLKURLRequestProperties options](v6, "options"))
      v13 = v69;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
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
  v8.super_class = (Class)WLKURLRequestProperties;
  -[WLKURLRequestProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKURLRequestProperties shortDescription](self, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortDescription
{
  NSString *endpoint;

  endpoint = self->_endpoint;
  if (!endpoint)
    endpoint = self->_routeName;
  return endpoint;
}

- (NSString)endpoint
{
  return self->_endpoint;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)httpMethod
{
  return self->_httpMethod;
}

- (NSDictionary)queryParameters
{
  return self->_queryParameters;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (NSString)caller
{
  return self->_caller;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (NSNumber)apiVersion
{
  return self->_apiVersion;
}

- (void)URLRequestWithConfiguration:.cold.1()
{
  __assert_rtn("-[WLKURLRequestProperties URLRequestWithConfiguration:]", "WLKURLRequestProperties.m", 261, "WLKXor(_endpoint, _routeName)");
}

- (void)copyWithZone:.cold.1()
{
  __assert_rtn("-[WLKURLRequestProperties copyWithZone:]", "WLKURLRequestProperties.m", 328, "WLKXor(copy->_endpoint, copy->_routeName)");
}

@end
