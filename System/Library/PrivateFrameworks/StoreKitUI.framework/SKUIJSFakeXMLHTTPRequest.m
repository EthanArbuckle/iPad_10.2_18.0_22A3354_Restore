@implementation SKUIJSFakeXMLHTTPRequest

- (SKUIJSFakeXMLHTTPRequest)initWithAppContext:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKUIJSFakeXMLHTTPRequest *v14;
  SKUIJSFakeXMLHTTPRequest *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSFakeXMLHTTPRequest initWithAppContext:data:URLResponse:performanceMetrics:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIJSFakeXMLHTTPRequest;
  v14 = -[IKJSObject initWithAppContext:](&v17, sel_initWithAppContext_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a4);
    objc_storeStrong((id *)&v15->_performanceMetrics, a6);
    objc_storeStrong((id *)&v15->_response, a5);
  }

  return v15;
}

- (id)getAllResponseHeaders
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHTTPURLResponse allHeaderFields](self->_response, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SKUIJSFakeXMLHTTPRequest_getAllResponseHeaders__block_invoke;
  v7[3] = &unk_1E73A53B0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

uint64_t __49__SKUIJSFakeXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@\r\n"), a2, a3);
}

- (id)getResponseHeader:(id)a3
{
  NSHTTPURLResponse *response;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    response = self->_response;
    v4 = a3;
    -[NSHTTPURLResponse allHeaderFields](response, "allHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)metrics
{
  return self->_performanceMetrics;
}

- (unsigned)readyState
{
  return 4;
}

- (NSString)responseText
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_data, 4);
}

- (IKJSXMLDocument)responseXML
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(NSClassFromString(CFSTR("IKJSXMLDOMImplementation")));
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAppContext:", v4);

  objc_msgSend(v5, "createLSInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByteStream:", self->_data);
  objc_msgSend(v5, "createLSParser::", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parse:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKJSXMLDocument *)v8;
}

- (unsigned)responseType
{
  return 3;
}

- (unsigned)status
{
  return -[NSHTTPURLResponse statusCode](self->_response, "statusCode");
}

- (NSString)statusText
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0C92C18], "localizedStringForStatusCode:", -[NSHTTPURLResponse statusCode](self->_response, "statusCode"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithAppContext:data:URLResponse:performanceMetrics:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSFakeXMLHTTPRequest initWithAppContext:data:URLResponse:performanceMetrics:]";
}

@end
