@implementation MBURLRequest

+ (id)request
{
  return objc_alloc_init(MBURLRequest);
}

+ (MBURLRequest)requestWithURL:(id)a3
{
  MBURLRequest *v4;

  v4 = +[MBURLRequest request](MBURLRequest, "request");
  -[MBURLRequest setURL:](v4, "setURL:", a3);
  return v4;
}

+ (MBURLRequest)requestWithMethod:(id)a3 URL:(id)a4
{
  MBURLRequest *v6;

  v6 = +[MBURLRequest request](MBURLRequest, "request");
  -[MBURLRequest setMethod:](v6, "setMethod:", a3);
  -[MBURLRequest setURL:](v6, "setURL:", a4);
  return v6;
}

- (MBURLRequest)init
{
  MBURLRequest *v2;
  MBURLRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MBURLRequest;
  v2 = -[MBURLRequest init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_method = (NSString *)CFSTR("GET");
    v2->_headers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3->_log = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBURLRequest;
  -[MBURLRequest dealloc](&v3, "dealloc");
}

- (NSDictionary)headers
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_headers, "copy");
}

- (void)setHeaders:(id)a3
{

  self->_headers = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
}

- (void)setValue:(id)a3 forHeader:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_headers, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)NSURLRequest
{
  NSMutableURLRequest *v3;
  NSString *v4;
  NSString *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", self->_URL);
  -[NSMutableURLRequest setCachePolicy:](v3, "setCachePolicy:", 1);
  -[NSMutableURLRequest setTimeoutInterval:](v3, "setTimeoutInterval:", 30.0);
  -[NSMutableURLRequest setHTTPBody:](v3, "setHTTPBody:", self->_data);
  -[NSMutableURLRequest setHTTPMethod:](v3, "setHTTPMethod:", self->_method);
  -[NSMutableURLRequest setHTTPShouldUsePipelining:](v3, "setHTTPShouldUsePipelining:", 1);
  -[NSMutableURLRequest setAllHTTPHeaderFields:](v3, "setAllHTTPHeaderFields:", self->_headers);
  if (self->_MMePreAuth)
    -[NSMutableURLRequest _setProperty:forKey:](v3, "_setProperty:forKey:", &__kCFBooleanTrue, kCFURLRequestPreAuthXMMeAuthToken);
  if (sub_100081D30() && -[NSURL user](self->_URL, "user") && -[NSURL password](self->_URL, "password"))
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Basic %@"), -[NSData base64EncodedStringWithOptions:](-[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), -[NSURL user](self->_URL, "user"), -[NSURL password](self->_URL, "password")), "dataUsingEncoding:", 4), "base64EncodedStringWithOptions:", 0));
    -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v4, CFSTR("Authorization"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_headers, "setObject:forKeyedSubscript:", v4, CFSTR("Authorization"));
  }
  v5 = sub_10000741C();
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v5, CFSTR("User-Agent"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_headers, "setObject:forKeyedSubscript:", v5, CFSTR("User-Agent"));
  v6 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", CFSTR("com.apple.MobileBackup"));
  v7 = objc_msgSend(v6, "appleIDHeadersForRequest:", v3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v13, v12);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_headers, "setObject:forKeyedSubscript:", v13, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v3;
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)useMMePreAuth
{
  return self->_MMePreAuth;
}

- (void)setMMePreAuth:(BOOL)a3
{
  self->_MMePreAuth = a3;
}

- (BOOL)shouldLog
{
  return self->_log;
}

- (void)setLog:(BOOL)a3
{
  self->_log = a3;
}

@end
