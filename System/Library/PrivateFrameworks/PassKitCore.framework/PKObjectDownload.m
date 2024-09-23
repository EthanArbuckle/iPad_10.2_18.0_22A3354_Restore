@implementation PKObjectDownload

- (PKObjectDownload)init
{
  PKObjectDownload *v2;
  NSMutableSet *v3;
  NSMutableSet *completionHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKObjectDownload;
  v2 = -[PKObjectDownload init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

  }
  return v2;
}

- (NSMutableSet)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
