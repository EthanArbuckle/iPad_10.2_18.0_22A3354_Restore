@implementation ICURLResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_bodyDataURL, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong(&self->_parsedBodyResponse, 0);
}

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (id)parsedBodyDictionary
{
  id v3;

  -[ICURLResponse _prepareParsedBodyResponse](self, "_prepareParsedBodyResponse");
  if (self->_parsedBodyResponseType == 2)
    v3 = self->_parsedBodyResponse;
  else
    v3 = 0;
  return v3;
}

- (void)_prepareParsedBodyResponse
{
  NSURLResponse *v3;
  void *v4;
  void *v5;
  id v6;
  NSData *bodyData;
  void *v8;
  void *v9;
  NSData *v10;
  int64_t v11;
  id v12;
  id v13;

  if (!self->_parsedBodyResponseType)
  {
    v3 = self->_urlResponse;
    -[NSURLResponse ic_valueForHTTPHeaderField:](v3, "ic_valueForHTTPHeaderField:", CFSTR("Content-Type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "rangeOfString:options:", CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      bodyData = self->_bodyData;
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", bodyData, 0, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v13;
      if (v8)
        goto LABEL_10;
    }
    v9 = v6;
    v10 = self->_bodyData;
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;

    if (!v8)
    {
      if (objc_msgSend(v5, "rangeOfString:options:", CFSTR("text/html"), 1) == 0x7FFFFFFFFFFFFFFFLL)
        v8 = 0;
      else
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_bodyData, 4);
    }
LABEL_10:
    if ((_NSIsNSDictionary() & 1) != 0)
    {
      v11 = 2;
    }
    else if ((_NSIsNSArray() & 1) != 0)
    {
      v11 = 3;
    }
    else
    {
      if (!_NSIsNSString())
      {
        v11 = 1;
        goto LABEL_17;
      }
      v11 = 4;
    }
    objc_storeStrong(&self->_parsedBodyResponse, v8);
LABEL_17:
    self->_parsedBodyResponseType = v11;

  }
}

- (ICURLPerformanceMetrics)performanceMetrics
{
  void *v2;
  void *v3;

  -[ICURLAggregatedPerformanceMetrics urlMetrics](self->_aggregatedPerformanceMetrics, "urlMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICURLPerformanceMetrics *)v3;
}

- (int64_t)statusCode
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSURLResponse statusCode](self->_urlResponse, "statusCode");
  else
    return 0;
}

- (ICURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyData:(id)a5 performanceMetrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICURLResponse *v15;
  uint64_t v16;
  NSURLRequest *urlRequest;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICURLResponse;
  v15 = -[ICURLResponse init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    urlRequest = v15->_urlRequest;
    v15->_urlRequest = (NSURLRequest *)v16;

    objc_storeStrong((id *)&v15->_urlResponse, a3);
    objc_storeStrong((id *)&v15->_bodyData, a5);
    objc_storeStrong((id *)&v15->_aggregatedPerformanceMetrics, a6);
  }

  return v15;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (id)parsedBodyText
{
  id parsedBodyResponse;
  int64_t parsedBodyResponseType;

  parsedBodyResponseType = self->_parsedBodyResponseType;
  parsedBodyResponse = self->_parsedBodyResponse;
  if (parsedBodyResponseType == 4)
    return parsedBodyResponse;
  objc_msgSend(parsedBodyResponse, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ICURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyDataURL:(id)a5 performanceMetrics:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICURLResponse *v15;
  uint64_t v16;
  NSURLRequest *urlRequest;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICURLResponse;
  v15 = -[ICURLResponse init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    urlRequest = v15->_urlRequest;
    v15->_urlRequest = (NSURLRequest *)v16;

    objc_storeStrong((id *)&v15->_urlResponse, a3);
    objc_storeStrong((id *)&v15->_bodyDataURL, a5);
    objc_storeStrong((id *)&v15->_aggregatedPerformanceMetrics, a6);
  }

  return v15;
}

- (NSDate)expirationDate
{
  double v2;
  void *v3;

  -[NSURLResponse _calculatedExpiration](self->_urlResponse, "_calculatedExpiration");
  if (v2 <= 0.00000011920929)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v3;
}

- (id)parsedBodyArray
{
  id v3;

  -[ICURLResponse _prepareParsedBodyResponse](self, "_prepareParsedBodyResponse");
  if (self->_parsedBodyResponseType == 3)
    v3 = self->_parsedBodyResponse;
  else
    v3 = 0;
  return v3;
}

- (id)parsedBody
{
  -[ICURLResponse _prepareParsedBodyResponse](self, "_prepareParsedBodyResponse");
  return self->_parsedBodyResponse;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (NSURL)bodyDataURL
{
  return self->_bodyDataURL;
}

- (ICURLAggregatedPerformanceMetrics)aggregatedPerformanceMetrics
{
  return self->_aggregatedPerformanceMetrics;
}

@end
