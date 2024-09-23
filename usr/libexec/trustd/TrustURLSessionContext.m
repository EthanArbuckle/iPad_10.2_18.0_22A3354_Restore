@implementation TrustURLSessionContext

- (TrustURLSessionContext)initWithContext:(void *)a3 uris:(id)a4
{
  id v6;
  TrustURLSessionContext *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)TrustURLSessionContext;
  v7 = -[TrustURLSessionContext init](&v9, "init");
  if (v7)
  {
    if (a3)
      CFRetain(a3);
    -[TrustURLSessionContext setContext:](v7, "setContext:", a3);
    -[TrustURLSessionContext setURIs:](v7, "setURIs:", v6);
    -[TrustURLSessionContext setURIix:](v7, "setURIix:", 0);
    -[TrustURLSessionContext setNumTasks:](v7, "setNumTasks:", 0);
    -[TrustURLSessionContext setAttribution:](v7, "setAttribution:", 0);
  }

  return v7;
}

- (void)setAttribution:(unint64_t)a3
{
  self->_attribution = a3;
}

- (void)setURIs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setURIix:(unint64_t)a3
{
  self->_URIix = a3;
}

- (void)setNumTasks:(unint64_t)a3
{
  self->_numTasks = a3;
}

- (unint64_t)numTasks
{
  return self->_numTasks;
}

- (void)dealloc
{
  objc_super v3;

  if (-[TrustURLSessionContext context](self, "context"))
  {
    CFRelease(-[TrustURLSessionContext context](self, "context"));
    -[TrustURLSessionContext setContext:](self, "setContext:", 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)TrustURLSessionContext;
  -[TrustURLSessionContext dealloc](&v3, "dealloc");
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (NSArray)URIs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)URIix
{
  return self->_URIix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_URIs, 0);
}

- (unint64_t)attribution
{
  return self->_attribution;
}

- (NSMutableData)response
{
  return (NSMutableData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)maxAge
{
  return self->_maxAge;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

@end
