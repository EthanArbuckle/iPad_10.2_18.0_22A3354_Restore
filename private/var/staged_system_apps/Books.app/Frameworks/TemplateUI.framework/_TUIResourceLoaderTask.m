@implementation _TUIResourceLoaderTask

- (_TUIResourceLoaderTask)initWithSessionDataTask:(id)a3
{
  id v5;
  _TUIResourceLoaderTask *v6;
  _TUIResourceLoaderTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIResourceLoaderTask;
  v6 = -[_TUIResourceLoaderTask init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionDataTask, a3);

  return v7;
}

- (double)priority
{
  float v2;

  -[NSURLSessionDataTask priority](self->_sessionDataTask, "priority");
  return v2;
}

- (void)setPriority:(double)a3
{
  *(float *)&a3 = a3;
  -[NSURLSessionDataTask setPriority:](self->_sessionDataTask, "setPriority:", a3);
}

- (BOOL)isLoaded
{
  return -[NSURLSessionDataTask state](self->_sessionDataTask, "state") == (char *)&dword_0 + 3;
}

- (void)resume
{
  -[NSURLSessionDataTask resume](self->_sessionDataTask, "resume");
}

- (void)cancel
{
  -[NSURLSessionDataTask cancel](self->_sessionDataTask, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionDataTask, 0);
}

@end
