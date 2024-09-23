@implementation _PPTState

- (_PPTState)init
{
  _PPTState *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_group_t v5;
  OS_dispatch_group *group;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PPTState;
  v2 = -[_PPTState init](&v8, sel_init);
  v3 = dispatch_queue_create("_PPTState", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  v5 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v5;

  return v2;
}

- (void)enterDispatchGroup
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31___PPTState_enterDispatchGroup__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)leaveDispatchGroup
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31___PPTState_leaveDispatchGroup__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)groupNotifyOnQueue:(id)a3 withBlock:(id)a4
{
  dispatch_group_notify((dispatch_group_t)self->_group, (dispatch_queue_t)a3, a4);
}

- (BOOL)hasRendered
{
  return self->_hasRendered;
}

- (void)setHasRendered:(BOOL)a3
{
  self->_hasRendered = a3;
}

- (NSMutableArray)renderStatistics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRenderStatistics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderStatistics, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
