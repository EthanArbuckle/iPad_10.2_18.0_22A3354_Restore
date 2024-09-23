@implementation OperatorTask

- (OperatorTask)initWithQueue:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  OperatorTask *v9;
  OperatorTask *v10;
  uint64_t v11;
  id operatorBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OperatorTask;
  v9 = -[OperatorTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operatorQueue, a3);
    v11 = MEMORY[0x1BCC9EB70](v8);
    operatorBlock = v10->_operatorBlock;
    v10->_operatorBlock = (id)v11;

  }
  return v10;
}

- (OS_dispatch_queue)operatorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperatorQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)operatorBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_operatorQueue, 0);
}

@end
