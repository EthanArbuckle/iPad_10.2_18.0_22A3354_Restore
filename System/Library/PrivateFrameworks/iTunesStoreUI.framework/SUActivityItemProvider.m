@implementation SUActivityItemProvider

- (SUActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  SUActivityItemProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUActivityItemProvider;
  v3 = -[UIActivityItemProvider initWithPlaceholderItem:](&v6, sel_initWithPlaceholderItem_, a3);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUActivityItemProvider.%p"), v3);
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);

  }
  return v3;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SUActivityItemProvider;
  -[SUActivityItemProvider dealloc](&v4, sel_dealloc);
}

- (SUActivityItemProviderDelegate)delegate
{
  NSObject *dispatchQueue;
  SUActivityItemProviderDelegate *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SUActivityItemProvider_delegate__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SUActivityItemProviderDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __34__SUActivityItemProvider_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 280);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__SUActivityItemProvider_setDelegate___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __38__SUActivityItemProvider_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 280) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setSUActivity:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SUActivityItemProvider_setSUActivity___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

_QWORD *__40__SUActivityItemProvider_setSUActivity___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 272);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 272) = result;
  }
  return result;
}

- (void)setSUPreviewImage:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUActivityItemProvider_setSUPreviewImage___block_invoke;
  v4[3] = &unk_24DE7AFB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

_QWORD *__44__SUActivityItemProvider_setSUPreviewImage___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 304);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 304) = result;
  }
  return result;
}

- (UIActivity)suActivity
{
  NSObject *dispatchQueue;
  UIActivity *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SUActivityItemProvider_suActivity__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (UIActivity *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SUActivityItemProvider_suActivity__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 272);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)suLastProvidedItem
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SUActivityItemProvider_suLastProvidedItem__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__SUActivityItemProvider_suLastProvidedItem__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 296);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (UIImage)suPreviewImage
{
  NSObject *dispatchQueue;
  UIImage *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__50;
  v10 = __Block_byref_object_dispose__50;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SUActivityItemProvider_suPreviewImage__block_invoke;
  v5[3] = &unk_24DE7BE30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (UIImage *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __40__SUActivityItemProvider_suPreviewImage__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 304);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)item
{
  SUActivityItemProviderDelegate *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__50;
  v16 = __Block_byref_object_dispose__50;
  v17 = 0;
  v3 = -[SUActivityItemProvider delegate](self, "delegate");
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    v6 = dispatch_semaphore_create(0);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __30__SUActivityItemProvider_item__block_invoke;
    v11[3] = &unk_24DE7E0F0;
    v11[4] = v6;
    v11[5] = &v12;
    -[SUActivityItemProviderDelegate activityItemProvider:provideItemUsingBlock:](v3, "activityItemProvider:provideItemUsingBlock:", self, v11);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v6);
  }
  dispatchQueue = self->_dispatchQueue;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __30__SUActivityItemProvider_item__block_invoke_2;
  v10[3] = &unk_24DE7BE08;
  v10[4] = self;
  v10[5] = &v12;
  dispatch_sync(dispatchQueue, v10);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

intptr_t __30__SUActivityItemProvider_item__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __30__SUActivityItemProvider_item__block_invoke_2(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = result;
  return result;
}

@end
