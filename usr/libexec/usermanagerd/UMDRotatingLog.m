@implementation UMDRotatingLog

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  OS_dispatch_queue *queue;
  UMDSideEffects *se;
  objc_super v7;

  if (self->_fd != -1)
  {
    v3 = sub_100007EF0((uint64_t)self->_se);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v4, "closeFileWithDescriptor:", self->_fd);

    close(self->_fd);
    self->_fd = -1;
  }
  queue = self->_queue;
  self->_queue = 0;

  se = self->_se;
  self->_se = 0;

  v7.receiver = self;
  v7.super_class = (Class)UMDRotatingLog;
  -[UMDRotatingLog dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_se, 0);
}

@end
