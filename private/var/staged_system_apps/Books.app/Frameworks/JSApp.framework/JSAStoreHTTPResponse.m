@implementation JSAStoreHTTPResponse

- (JSAStoreHTTPResponse)initWithDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  JSAStoreHTTPResponse *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id output;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *error;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSDictionary *headers;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSDictionary *performanceMetrics;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)JSAStoreHTTPResponse;
  v6 = -[JSAStoreHTTPResponse init](&v32, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("statusCode")));
    v9 = BUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6->_statusCode = (int64_t)objc_msgSend(v10, "integerValue");

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("output")));
    output = v6->_output;
    v6->_output = (id)v11;

    v14 = objc_opt_class(NSDictionary, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_error")));
    v16 = BUDynamicCast(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    error = v6->__error;
    v6->__error = (NSDictionary *)v17;

    v20 = objc_opt_class(NSDictionary, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headers")));
    v22 = BUDynamicCast(v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    headers = v6->_headers;
    v6->_headers = (NSDictionary *)v23;

    v26 = objc_opt_class(NSDictionary, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("performance")));
    v28 = BUDynamicCast(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    performanceMetrics = v6->_performanceMetrics;
    v6->_performanceMetrics = (NSDictionary *)v29;

  }
  return v6;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  id output;
  NSDictionary *error;
  NSDictionary *headers;
  NSDictionary *performanceMetrics;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_statusCode));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("statusCode"));

  output = self->_output;
  if (output)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", output, CFSTR("output"));
  error = self->__error;
  if (error)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", error, CFSTR("_error"));
  headers = self->_headers;
  if (headers)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", headers, CFSTR("headers"));
  performanceMetrics = self->_performanceMetrics;
  if (performanceMetrics)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", performanceMetrics, CFSTR("performance"));
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[JSAStoreHTTPResponse statusCode](self, "statusCode")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPResponse headers](self, "headers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("x-apple-jingle-correlation-key")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPResponse headers](self, "headers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("x-apple-request-uuid")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPResponse headers](self, "headers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("x-apple-application-site")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPResponse headers](self, "headers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("x-apple-application-instance")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPResponse _error](self, "_error"));
  if (v10)
  {
    v16 = v4;
    v11 = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPResponse _error](self, "_error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", error=%@"), v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<JSAStoreHTTPResponse code=%@, correlation=%@, uuid=%@, site=%@, instance=%@%@>"), v11, v5, v18, v7, v9, v13));

    v3 = v11;
    v4 = v16;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<JSAStoreHTTPResponse code=%@, correlation=%@, uuid=%@, site=%@, instance=%@%@>"), v3, v5, v18, v7, v9, &stru_A2730));
  }

  return v14;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (id)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong(&self->_output, a3);
}

- (NSDictionary)_error
{
  return self->__error;
}

- (void)set_error:(id)a3
{
  objc_storeStrong((id *)&self->__error, a3);
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (NSDictionary)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_performanceMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->__error, 0);
  objc_storeStrong(&self->_output, 0);
}

@end
