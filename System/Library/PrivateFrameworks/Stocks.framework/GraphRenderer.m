@implementation GraphRenderer

+ (id)sharedRenderer
{
  void *v2;
  GraphRenderer *v3;
  void *v4;

  v2 = (void *)__sharedInstance_0;
  if (!__sharedInstance_0)
  {
    v3 = objc_alloc_init(GraphRenderer);
    v4 = (void *)__sharedInstance_0;
    __sharedInstance_0 = (uint64_t)v3;

    v2 = (void *)__sharedInstance_0;
  }
  return v2;
}

+ (void)clearSharedRenderer
{
  void *v2;

  v2 = (void *)__sharedInstance_0;
  __sharedInstance_0 = 0;

}

- (GraphRenderer)init
{
  GraphRenderer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GraphRenderer;
  v2 = -[GraphRenderer init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.stocks.graph_renderer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)performRenderOperation:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__GraphRenderer_performRenderOperation___block_invoke;
  block[3] = &unk_24D74B7C0;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

uint64_t __40__GraphRenderer_performRenderOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "render");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
