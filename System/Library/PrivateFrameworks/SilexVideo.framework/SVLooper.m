@implementation SVLooper

- (SVLooper)initWithPlayer:(id)a3
{
  id v5;
  SVLooper *v6;
  SVLooper *v7;
  SVPlayerItemObserver *v8;
  SVPlayerItemObserver *v9;
  void (**v10)(_QWORD, _QWORD);
  SVVideoDurationObserver *v11;
  SVVideoDurationObserver *durationObserver;
  double v13;
  _QWORD v15[4];
  SVPlayerItemObserver *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SVLooper;
  v6 = -[SVLooper init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v8 = -[SVPlayerItemObserver initWithPlayer:]([SVPlayerItemObserver alloc], "initWithPlayer:", v5);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __27__SVLooper_initWithPlayer___block_invoke;
    v15[3] = &unk_24DBC2630;
    v9 = v8;
    v16 = v9;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207327F0](v15);
    v11 = -[SVVideoDurationObserver initWithPlayerItemObserver:]([SVVideoDurationObserver alloc], "initWithPlayerItemObserver:", v9);
    durationObserver = v7->_durationObserver;
    v7->_durationObserver = v11;

    -[SVVideoDurationObserver onChange:](v7->_durationObserver, "onChange:", v10);
    -[SVVideoDurationObserver duration](v7->_durationObserver, "duration");
    if (v13 > 0.0)
      ((void (**)(_QWORD, SVVideoDurationObserver *))v10)[2](v10, v7->_durationObserver);

  }
  return v7;
}

void __27__SVLooper_initWithPlayer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CMTime v5;
  CMTime duration;
  CMTimeRange v7;

  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "duration");
  else
    memset(&duration, 0, sizeof(duration));
  v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake(&v7, &v5, &duration);
  objc_msgSend(v2, "setLoopTimeRange:", &v7);

}

- (AVPlayer)player
{
  return self->_player;
}

- (SVVideoDurationObserver)durationObserver
{
  return self->_durationObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
