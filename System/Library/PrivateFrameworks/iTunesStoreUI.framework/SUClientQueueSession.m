@implementation SUClientQueueSession

- (void)setManagerOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SUClientQueueSession)initWithQueue:(id)a3
{
  SUClientQueueSession *v4;
  SUClientQueueSession *v5;

  v4 = -[SUClientQueueSession init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_count = 1;
    v4->_queue = a3;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUClientQueueSession;
  -[SUClientQueueSession dealloc](&v3, sel_dealloc);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSArray)downloadKinds
{
  return self->_downloadKinds;
}

- (void)setDownloadKinds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SSDownloadManagerOptions)managerOptions
{
  return self->_managerOptions;
}

- (id)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
