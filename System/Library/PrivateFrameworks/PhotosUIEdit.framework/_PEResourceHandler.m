@implementation _PEResourceHandler

- (id)resultHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
