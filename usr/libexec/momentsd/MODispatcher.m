@implementation MODispatcher

- (MODispatcher)initWithNotifier:(id)a3
{
  id v5;
  MODispatcher *v6;
  MODispatcher *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *handlerMap;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  MODispatcher *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MODispatcher;
  v6 = -[MODispatcher init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notifier, a3);
    v8 = objc_opt_new(NSMutableDictionary);
    handlerMap = v7->_handlerMap;
    v7->_handlerMap = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("MODispatcher", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v14 = v7;
  }

  return v7;
}

- (void)registerForNotification:(int)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  int v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __52__MODispatcher_registerForNotification_withHandler___block_invoke;
  v9[3] = &unk_1002B4C90;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__MODispatcher_registerForNotification_withHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v3 = (void *)WeakRetained[2];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));
    if (v5)
    {

LABEL_6:
      WeakRetained = v10;
      goto LABEL_7;
    }
    v6 = *(_QWORD *)(a1 + 32);

    WeakRetained = v10;
    if (v6)
    {
      v7 = (void *)*((_QWORD *)v10 + 2);
      v8 = objc_retainBlock(*(id *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
      objc_msgSend(v7, "setObject:forKey:", v8, v9);

      objc_msgSend(*((id *)v10 + 1), "registerDispatcher:forNotification:", v10, *(unsigned int *)(a1 + 48));
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)unregisterForNotification:(int)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7;
  int v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__MODispatcher_unregisterForNotification___block_invoke;
  block[3] = &unk_1002B4CB8;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__MODispatcher_unregisterForNotification___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    v5 = WeakRetained;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 40)));
    objc_msgSend(v3, "removeObjectForKey:", v4);

    objc_msgSend(v5[1], "unregisterDispatcher:", v5);
    WeakRetained = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
}

- (void)onNotification:(int)a3 withPayload:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  int v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MODispatcher_MONotifierUtility__onNotification_withPayload___block_invoke;
  v9[3] = &unk_1002B4CE0;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__MODispatcher_MONotifierUtility__onNotification_withPayload___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = (void *)WeakRetained[2];
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

    if (v5)
      v5[2](v5, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));

    WeakRetained = v6;
  }

}

@end
