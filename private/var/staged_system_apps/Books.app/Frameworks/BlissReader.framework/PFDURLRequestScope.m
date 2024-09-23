@implementation PFDURLRequestScope

+ (PFDURLRequestScope)requestScopeWithHosts:(id)a3 bookRootURL:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithHosts:bookRootURL:context:", v10, v9, v8);

  return (PFDURLRequestScope *)v11;
}

- (PFDURLRequestScope)initWithHosts:(id)a3 bookRootURL:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  PFDURLRequestScope *v11;
  NSArray *v12;
  NSArray *hosts;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PFDURLRequestScope;
  v11 = -[PFDURLRequestScope init](&v15, "init");
  if (v11)
  {
    v12 = (NSArray *)objc_msgSend(v8, "copy");
    hosts = v11->_hosts;
    v11->_hosts = v12;

    objc_storeStrong((id *)&v11->_bookRootURL, a4);
    objc_storeStrong((id *)&v11->_context, a5);
  }

  return v11;
}

- (NSArray)hosts
{
  return self->_hosts;
}

- (void)setHosts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)bookRootURL
{
  return self->_bookRootURL;
}

- (void)setBookRootURL:(id)a3
{
  objc_storeStrong((id *)&self->_bookRootURL, a3);
}

- (PFDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bookRootURL, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
}

@end
