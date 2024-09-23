@implementation REHTTPResponse

- (REHTTPResponse)initWithRequest:(id)a3 statusCode:(int64_t)a4
{
  id v7;
  REHTTPResponse *v8;
  REHTTPResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REHTTPResponse;
  v8 = -[REHTTPResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_request, a3);
    v9->_statusCode = a4;
    objc_msgSend(v7, "request");
    v9->_message = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
  }

  return v9;
}

- (void)dealloc
{
  __CFHTTPMessage *message;
  objc_super v4;

  message = self->_message;
  if (message)
    CFRelease(message);
  v4.receiver = self;
  v4.super_class = (Class)REHTTPResponse;
  -[REHTTPResponse dealloc](&v4, sel_dealloc);
}

- (NSString)contentType
{
  return (NSString *)-[REHTTPResponse headerValueForKey:](self, "headerValueForKey:", CFSTR("Content-Type"));
}

- (void)setContentType:(id)a3
{
  -[REHTTPResponse setHeaderValue:forKey:](self, "setHeaderValue:forKey:", a3, CFSTR("Content-Type"));
}

- (id)_dateFormatter
{
  if (_dateFormatter_onceToken_0 != -1)
    dispatch_once(&_dateFormatter_onceToken_0, &__block_literal_global_19);
  return (id)_dateFormatter_dateFormatter;
}

void __32__REHTTPResponse__dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_dateFormatter_dateFormatter, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss z"));
  v2 = (void *)_dateFormatter_dateFormatter;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_dateFormatter_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

- (NSDate)date
{
  void *v3;
  void *v4;
  void *v5;

  -[REHTTPResponse _dateFormatter](self, "_dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPResponse headerValueForKey:](self, "headerValueForKey:", CFSTR("Date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REHTTPResponse _dateFormatter](self, "_dateFormatter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REHTTPResponse setHeaderValue:forKey:](self, "setHeaderValue:forKey:", v5, CFSTR("Date"));
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)CFHTTPMessageCopyAllHeaderFields(self->_message);
}

- (NSData)body
{
  return (NSData *)CFHTTPMessageCopyBody(self->_message);
}

- (void)setBody:(id)a3
{
  __CFHTTPMessage *message;
  const __CFData *v5;
  void *v6;
  uint64_t v7;
  id v8;

  message = self->_message;
  v5 = (const __CFData *)a3;
  CFHTTPMessageSetBody(message, v5);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = -[__CFData length](v5, "length");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%lu"), v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[REHTTPResponse setHeaderValue:forKey:](self, "setHeaderValue:forKey:", v8, CFSTR("Content-Length"));

}

- (void)setHeaderValue:(id)a3 forKey:(id)a4
{
  CFHTTPMessageSetHeaderFieldValue(self->_message, (CFStringRef)a4, (CFStringRef)a3);
}

- (id)headerValueForKey:(id)a3
{
  return (id)(id)CFHTTPMessageCopyHeaderFieldValue(self->_message, (CFStringRef)a3);
}

- (_CFHTTPServerResponse)response
{
  _CFHTTPServerResponse *v3;

  -[REHTTPRequest request](self->_request, "request");
  -[REHTTPResponse body](self, "body");
  v3 = (_CFHTTPServerResponse *)_CFHTTPServerResponseCreateWithData();
  _CFHTTPServerResponseSetClient();
  return v3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
