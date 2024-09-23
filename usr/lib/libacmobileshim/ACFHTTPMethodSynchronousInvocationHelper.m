@implementation ACFHTTPMethodSynchronousInvocationHelper

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethodSynchronousInvocationHelper;
  -[ACFHTTPMethodSynchronousInvocationHelper dealloc](&v3, sel_dealloc);
}

- (void)httpMethodInvocation:(id)a3 didFinishWithResult:(id)a4
{
  -[ACFHTTPMethodSynchronousInvocationHelper setResult:](self, "setResult:", a4);
}

- (void)httpMethodInvocation:(id)a3 didFailWithError:(id)a4
{
  -[ACFHTTPMethodSynchronousInvocationHelper setError:](self, "setError:", a4);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)result
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
