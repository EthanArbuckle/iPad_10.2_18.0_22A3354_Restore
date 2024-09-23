@implementation ACFHTTPMethod

+ (id)method
{
  return objc_alloc_init((Class)a1);
}

+ (id)methodWithName:(id)a3 headerFields:(id)a4 body:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithName:headerFields:body:", a3, a4, a5);
}

+ (id)methodWithName:(id)a3 headerFields:(id)a4 bodyPropertyList:(id)a5 error:(id *)a6
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a5, 100, 0, a6);
  if (result)
    return (id)objc_msgSend(a1, "methodWithName:headerFields:body:", a3, a4, result);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethod;
  -[ACFHTTPMethod dealloc](&v3, sel_dealloc);
}

- (ACFHTTPMethod)init
{
  ACFHTTPMethod *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACFHTTPMethod;
  v2 = -[ACFHTTPMethod init](&v4, sel_init);
  if (v2)
    v2->_name = (NSString *)CFSTR("POST");
  return v2;
}

- (ACFHTTPMethod)initWithName:(id)a3 headerFields:(id)a4 body:(id)a5
{
  ACFHTTPMethod *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACFHTTPMethod;
  v8 = -[ACFHTTPMethod init](&v10, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)a3;
    v8->_headerFields = (NSDictionary *)a4;
    v8->_body = (NSData *)a5;
  }
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)headerFields
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHeaderFields:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)body
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
