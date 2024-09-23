@implementation TSPIOHandlerWriteChannelAdapter

- (TSPIOHandlerWriteChannelAdapter)initWithQueue:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  TSPIOHandlerWriteChannelAdapter *v9;
  TSPIOHandlerWriteChannelAdapter *v10;
  void *v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSPIOHandlerWriteChannelAdapter;
  v9 = -[TSPIOHandlerWriteChannelAdapter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = _Block_copy(v8);
    handler = v10->_handler;
    v10->_handler = v11;

  }
  return v10;
}

- (void)writeData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__TSPIOHandlerWriteChannelAdapter_writeData___block_invoke;
  v7[3] = &unk_24D829818;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __45__TSPIOHandlerWriteChannelAdapter_writeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__TSPIOHandlerWriteChannelAdapter_close__block_invoke;
  block[3] = &unk_24D829778;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__TSPIOHandlerWriteChannelAdapter_close__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
