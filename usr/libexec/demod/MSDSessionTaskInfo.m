@implementation MSDSessionTaskInfo

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: request=%@>"), v5, v6));

  return v7;
}

- (BOOL)isValid
{
  return 1;
}

- (int64_t)maxRetry
{
  return self->_maxRetry;
}

- (void)setMaxRetry:(int64_t)a3
{
  self->_maxRetry = a3;
}

- (NSString)savePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSavePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)postData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPostData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)postFile
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPostFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)handler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSMutableURLRequest)request
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_postFile, 0);
  objc_storeStrong((id *)&self->_postData, 0);
  objc_storeStrong((id *)&self->_savePath, 0);
}

@end
