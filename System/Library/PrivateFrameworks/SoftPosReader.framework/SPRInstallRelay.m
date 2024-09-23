@implementation SPRInstallRelay

- (SPRInstallRelay)initWithBase:(id)a3 queue:(id)a4
{
  SPRInstallDelegate *v6;
  OS_dispatch_queue *v7;
  SPRInstallDelegate *base;
  SPRInstallDelegate *v9;
  OS_dispatch_queue *queue;

  v6 = (SPRInstallDelegate *)a3;
  v7 = (OS_dispatch_queue *)a4;
  base = self->_base;
  self->_base = v6;
  v9 = v6;

  queue = self->_queue;
  self->_queue = v7;

  return self;
}

- (void)onUpdateWithEvent:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2159793B8;
  v4[3] = &unk_24D3CD560;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)onUpdateWithEvent:(int64_t)a3 progress:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215979420;
  block[3] = &unk_24D3CD588;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)onSuccessWithInstallData:(id)a3
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
  v7[2] = sub_2159794B0;
  v7[3] = &unk_24D3CCEA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)onFailureWithError:(id)a3
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
  v7[2] = sub_215979538;
  v7[3] = &unk_24D3CCEA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (SPRInstallDelegate)base
{
  return (SPRInstallDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
