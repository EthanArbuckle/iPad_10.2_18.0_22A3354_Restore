@implementation TSUOnce

- (TSUOnce)init
{
  TSUOnce *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUOnce;
  v2 = -[TSUOnce init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iwork.TSUOnce", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSUOnce *v4;
  NSObject *queue;
  TSUOnce *v6;
  TSUOnce *v7;
  _QWORD v9[4];
  TSUOnce *v10;
  TSUOnce *v11;

  v4 = objc_alloc_init(TSUOnce);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __24__TSUOnce_copyWithZone___block_invoke;
  v9[3] = &unk_24F39B500;
  v6 = v4;
  v10 = v6;
  v11 = self;
  dispatch_sync(queue, v9);
  v7 = v6;

  return v7;
}

uint64_t __24__TSUOnce_copyWithZone___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(*(_QWORD *)(result + 40) + 16);
  return result;
}

- (void)performBlockOnce:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__TSUOnce_performBlockOnce___block_invoke;
  block[3] = &unk_24F39BDD0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __28__TSUOnce_performBlockOnce___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
