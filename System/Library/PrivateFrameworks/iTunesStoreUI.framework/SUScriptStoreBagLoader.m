@implementation SUScriptStoreBagLoader

- (SUScriptStoreBagLoader)init
{
  SUScriptStoreBagLoader *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUScriptStoreBagLoader;
  v2 = -[SUScriptStoreBagLoader init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUScriptStoreBagLoader", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BEC8C50], "sharedBagLoadingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bagDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptStoreBagLoader _updateWithBagDictionary:allowsPostingBagDidChangeNotification:](v2, "_updateWithBagDictionary:allowsPostingBagDidChangeNotification:", v6, 0);

    objc_msgSend(v5, "addBagObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BEC8C50], "sharedBagLoadingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeBagObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptStoreBagLoader;
  -[SUScriptStoreBagLoader dealloc](&v4, sel_dealloc);
}

- (id)scriptStoreBagDictionary
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SUScriptStoreBagLoader_scriptStoreBagDictionary__block_invoke;
  v5[3] = &unk_24DE7B458;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__SUScriptStoreBagLoader_scriptStoreBagDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  SUScriptDictionary *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    if (*(_QWORD *)(v2 + 16))
    {
      v4 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    else
    {
      v3 = 0;
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)bagDidChange:(id)a3
{
  -[SUScriptStoreBagLoader _updateWithBagDictionary:allowsPostingBagDidChangeNotification:](self, "_updateWithBagDictionary:allowsPostingBagDidChangeNotification:", a3, 1);
}

- (void)_updateWithBagDictionary:(id)a3 allowsPostingBagDidChangeNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSDictionary *bagDictionary;
  BOOL v8;
  NSObject *accessQueue;
  void *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a4;
  v6 = a3;
  bagDictionary = self->_bagDictionary;
  v11 = v6;
  if (!v6 && bagDictionary
    || v6 && !bagDictionary
    || v6
    && bagDictionary
    && (v8 = -[NSDictionary isEqualToDictionary:](bagDictionary, "isEqualToDictionary:", v6), v6 = v11, !v8))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__SUScriptStoreBagLoader__updateWithBagDictionary_allowsPostingBagDidChangeNotification___block_invoke;
    block[3] = &unk_24DE7B0F0;
    block[4] = self;
    v13 = v6;
    dispatch_sync(accessQueue, block);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("SUScriptStoreBagDidChangeNotification"), self);

    }
    v6 = v11;
  }

}

void __89__SUScriptStoreBagLoader__updateWithBagDictionary_allowsPostingBagDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptStoreBagDictionary, 0);
  objc_storeStrong((id *)&self->_bagDictionary, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
