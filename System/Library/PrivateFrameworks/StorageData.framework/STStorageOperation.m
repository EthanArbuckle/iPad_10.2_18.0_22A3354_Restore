@implementation STStorageOperation

- (id)output
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_output, 0);
}

@end
