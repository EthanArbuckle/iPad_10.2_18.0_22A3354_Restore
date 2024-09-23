@implementation SVPlayerItemObserver

- (SVPlayerItemObserver)initWithPlayer:(id)a3
{
  id v5;
  SVPlayerItemObserver *v6;
  SVPlayerItemObserver *v7;
  SVKeyValueObserver *v8;
  uint64_t v9;
  SVKeyValueObserver *observer;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SVPlayerItemObserver;
  v6 = -[SVPlayerItemObserver init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    objc_initWeak(&location, v7);
    v8 = [SVKeyValueObserver alloc];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __39__SVPlayerItemObserver_initWithPlayer___block_invoke;
    v16 = &unk_24DBC23B8;
    objc_copyWeak(&v17, &location);
    v9 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v8, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("currentItem"), v5, 1, &v13);
    observer = v7->_observer;
    v7->_observer = (SVKeyValueObserver *)v9;

    objc_msgSend(v5, "currentItem", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_item, v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __39__SVPlayerItemObserver_initWithPlayer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDD0E70]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setItem:", v5);

}

- (void)setItem:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_item, obj);
    -[SVPlayerItemObserver changeBlock](self, "changeBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = obj;
    if (v6)
    {
      -[SVPlayerItemObserver changeBlock](self, "changeBlock");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SVPlayerItemObserver *))v7)[2](v7, self);

      v5 = obj;
    }
  }

}

- (id)changeBlock
{
  return self->_changeBlock;
}

- (void)onChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AVPlayerItem)item
{
  return (AVPlayerItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (AVPlayer)player
{
  return self->_player;
}

- (SVKeyValueObserver)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong(&self->_changeBlock, 0);
}

@end
