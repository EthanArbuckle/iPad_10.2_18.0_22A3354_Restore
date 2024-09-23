@implementation ISAVPlayerLayer

- (void)setReadyForDisplayChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISAVPlayerLayer;
  v4 = a3;
  -[ISAVPlayerLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, v4);
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("readyForDisplay"), v8.receiver, v8.super_class);

  if (v5)
  {
    -[ISAVPlayerLayer readyForDisplayChangeHandler](self, "readyForDisplayChangeHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ISAVPlayerLayer readyForDisplayChangeHandler](self, "readyForDisplayChangeHandler");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ISAVPlayerLayer player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_performDeferredDealloc:", v3);

  v5.receiver = self;
  v5.super_class = (Class)ISAVPlayerLayer;
  -[ISAVPlayerLayer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyForDisplayChangeHandler, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (ISAVPlayerLayer)init
{
  ISAVPlayerLayer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *isolationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISAVPlayerLayer;
  v2 = -[ISAVPlayerLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photosplayer.avplayerlayer.isolation", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ISAVPlayerLayer bounds](self, "bounds");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)ISAVPlayerLayer;
    -[ISAVPlayerLayer setBounds:](&v12, sel_setBounds_, x, y, width, height);
  }
}

- (void)deferredDealloc
{
  id v3;

  +[ISDeferredDealloc sharedInstance](ISDeferredDealloc, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_performDeferredDealloc:", self);

}

- (void)setWrappedPlayer:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISAVPlayerLayer;
  -[ISAVPlayerLayer setPlayer:](&v3, sel_setPlayer_, a3);
}

- (void)setPlayer:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__ISAVPlayerLayer_setPlayer___block_invoke;
  v7[3] = &unk_1E9454130;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (id)readyForDisplayChangeHandler
{
  return self->_readyForDisplayChangeHandler;
}

void __29__ISAVPlayerLayer_setPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;
  _QWORD block[5];
  objc_super v13;

  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)ISAVPlayerLayer;
  objc_msgSendSuper2(&v13, sel_player);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "dispatchQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__ISAVPlayerLayer_setPlayer___block_invoke_2;
    block[3] = &unk_1E9453F48;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v4, block);

    v6 = dispatch_semaphore_create(0);
    objc_msgSend(v3, "dispatchQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __29__ISAVPlayerLayer_setPlayer___block_invoke_3;
    v10[3] = &unk_1E9453F48;
    v11 = v6;
    v8 = v6;
    dispatch_async(v7, v10);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  v9 = *(void **)(a1 + 40);
  if (v9)
    objc_msgSend(v9, "attachToPlayerLayerIfNeeded:", *(_QWORD *)(a1 + 32));

}

id __29__ISAVPlayerLayer_setPlayer___block_invoke_2(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ISAVPlayerLayer;
  return objc_msgSendSuper2(&v2, sel_setPlayer_, 0);
}

intptr_t __29__ISAVPlayerLayer_setPlayer___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
