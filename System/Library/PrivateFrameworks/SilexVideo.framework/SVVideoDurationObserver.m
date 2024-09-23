@implementation SVVideoDurationObserver

- (SVVideoDurationObserver)initWithPlayerItemObserver:(id)a3
{
  id v5;
  SVVideoDurationObserver *v6;
  SVVideoDurationObserver *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SVVideoDurationObserver;
  v6 = -[SVVideoDurationObserver init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playerItemObserver, a3);
    objc_initWeak(&location, v7);
    v8 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke;
    v16[3] = &unk_24DBC23E0;
    objc_copyWeak(&v17, &location);
    v9 = (void *)MEMORY[0x2207327F0](v16);
    -[SVVideoDurationObserver playerItemObserver](v7, "playerItemObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_3;
    v14[3] = &unk_24DBC2408;
    v11 = v9;
    v15 = v11;
    objc_msgSend(v10, "onChange:", v14);

    objc_msgSend(v5, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  SVKeyValueObserver *v5;
  SVKeyValueObserver *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _BYTE v10[24];

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v3, "duration");
    objc_msgSend(WeakRetained, "updateDuration:", v10);

    v5 = [SVKeyValueObserver alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_2;
    v8[3] = &unk_24DBC23B8;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    v6 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v5, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("duration"), v3, 1, v8);
    objc_destroyWeak(&v9);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "setPlayerItemDurationObserver:", v6);

}

void __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id WeakRetained;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v9 = 0uLL;
  v10 = 0;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDD0E70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "CMTimeValue");
  }
  else
  {
    v9 = 0uLL;
    v10 = 0;
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = v9;
  v8 = v10;
  objc_msgSend(WeakRetained, "updateDuration:", &v7);

}

void __54__SVVideoDurationObserver_initWithPlayerItemObserver___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "item");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)updateDuration:(id *)a3
{
  CMTime v4;

  if ((a3->var2 & 0x1D) == 1 && (a3->var2 & 0x11) != 17)
  {
    v4 = *(CMTime *)a3;
    -[SVVideoDurationObserver setDuration:](self, "setDuration:", fmax(CMTimeGetSeconds(&v4), 0.0));
  }
}

- (void)setDuration:(double)a3
{
  void *v4;
  void (**v5)(id, SVVideoDurationObserver *);

  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[SVVideoDurationObserver changeBlock](self, "changeBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[SVVideoDurationObserver changeBlock](self, "changeBlock");
      v5 = (void (**)(id, SVVideoDurationObserver *))objc_claimAutoreleasedReturnValue();
      v5[2](v5, self);

    }
  }
}

- (id)changeBlock
{
  return self->changeBlock;
}

- (void)onChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SVPlayerItemObserving)playerItemObserver
{
  return self->_playerItemObserver;
}

- (SVKeyValueObserver)playerItemDurationObserver
{
  return self->_playerItemDurationObserver;
}

- (void)setPlayerItemDurationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_playerItemDurationObserver, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItemDurationObserver, 0);
  objc_storeStrong((id *)&self->_playerItemObserver, 0);
  objc_storeStrong(&self->changeBlock, 0);
}

@end
