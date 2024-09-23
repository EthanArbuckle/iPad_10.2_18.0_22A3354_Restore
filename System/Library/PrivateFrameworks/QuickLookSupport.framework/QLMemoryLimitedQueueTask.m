@implementation QLMemoryLimitedQueueTask

- (QLMemoryLimitedQueueTask)initWithBlock:(id)a3 expectedMemoryConsumption:(unint64_t)a4
{
  id v6;
  QLMemoryLimitedQueueTask *v7;
  uint64_t v8;
  id block;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLMemoryLimitedQueueTask;
  v7 = -[QLMemoryLimitedQueueTask init](&v11, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x212BA28B4](v6);
    block = v7->_block;
    v7->_block = (id)v8;

    v7->_expectedMemoryConsumption = a4;
  }

  return v7;
}

- (unint64_t)expectedMemoryConsumption
{
  return self->_expectedMemoryConsumption;
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
