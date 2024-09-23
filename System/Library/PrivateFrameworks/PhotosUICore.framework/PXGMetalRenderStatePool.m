@implementation PXGMetalRenderStatePool

- (PXGMetalRenderStatePool)initWithDevice:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  PXGMetalRenderStatePool *v9;
  PXGMetalRenderStatePool *v10;
  uint64_t v11;
  NSMutableArray *reusableRenderStates;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGMetalRenderStatePool;
  v9 = -[PXGMetalRenderStatePool init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    reusableRenderStates = v10->_reusableRenderStates;
    v10->_reusableRenderStates = (NSMutableArray *)v11;

  }
  return v10;
}

- (id)checkoutRenderState
{
  MTLDevice *v3;
  PXGReusableMetalRenderState *v4;
  PXGMetalRenderStatePoolEntry *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_device;
  if (v3)
  {
    -[NSMutableArray px_popFirst](self->_reusableRenderStates, "px_popFirst");
    v4 = (PXGReusableMetalRenderState *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = -[PXGReusableMetalRenderState initWithDevice:]([PXGReusableMetalRenderState alloc], "initWithDevice:", self->_device);
    v5 = -[PXGMetalRenderStatePoolEntry initWithReusableRenderState:pool:]([PXGMetalRenderStatePoolEntry alloc], "initWithReusableRenderState:pool:", v4, self);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)clearReusePool
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray removeAllObjects](self->_reusableRenderStates, "removeAllObjects");
}

- (void)setDevice:(id)a3
{
  MTLDevice *v5;
  MTLDevice *v6;

  v5 = (MTLDevice *)a3;
  if (self->_device != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_device, a3);
    -[PXGMetalRenderStatePool clearReusePool](self, "clearReusePool");
    v5 = v6;
  }

}

- (void)_checkinRenderState:(id)a3
{
  MTLDevice *v4;
  MTLDevice *device;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "device");
  v4 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;

  if (v4 == device)
    -[NSMutableArray addObject:](self->_reusableRenderStates, "addObject:", v6);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reusableRenderStates, 0);
}

@end
