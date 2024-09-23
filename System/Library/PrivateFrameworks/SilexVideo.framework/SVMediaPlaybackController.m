@implementation SVMediaPlaybackController

- (SVMediaPlaybackController)init
{
  SVMediaPlaybackController *v2;
  uint64_t v3;
  NSMapTable *timeControlStatusObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVMediaPlaybackController;
  v2 = -[SVMediaPlaybackController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    timeControlStatusObservers = v2->_timeControlStatusObservers;
    v2->_timeControlStatusObservers = (NSMapTable *)v3;

  }
  return v2;
}

- (void)updateCurrentlyPlaying:(id)a3
{
  AVPlayer **p_currentlyPlaying;
  id WeakRetained;
  id v6;

  p_currentlyPlaying = &self->_currentlyPlaying;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_currentlyPlaying);
  objc_msgSend(WeakRetained, "pause");

  -[SVMediaPlaybackController setCurrentlyPlaying:](self, "setCurrentlyPlaying:", v6);
}

- (void)registerPlayer:(id)a3
{
  id v4;
  SVKeyValueObserver *v5;
  SVKeyValueObserver *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [SVKeyValueObserver alloc];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __44__SVMediaPlaybackController_registerPlayer___block_invoke;
  v11 = &unk_24DBC23B8;
  objc_copyWeak(&v12, &location);
  v6 = -[SVKeyValueObserver initWithKeyPath:ofObject:withOptions:change:](v5, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("timeControlStatus"), v4, 1, &v8);
  -[SVMediaPlaybackController timeControlStatusObservers](self, "timeControlStatusObservers", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v4);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __44__SVMediaPlaybackController_registerPlayer___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v10, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "currentlyPlaying");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v4 == (void *)v5)
    {

LABEL_8:
      goto LABEL_9;
    }
    v6 = (void *)v5;
    objc_msgSend(v10, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "timeControlStatus") == 1)
    {

LABEL_7:
      objc_msgSend(v10, "object");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "updateCurrentlyPlaying:", v4);
      goto LABEL_8;
    }
    objc_msgSend(v10, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "timeControlStatus");

    if (v9 == 2)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)unregisterPlayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SVMediaPlaybackController timeControlStatusObservers](self, "timeControlStatusObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (NSMapTable)timeControlStatusObservers
{
  return self->_timeControlStatusObservers;
}

- (AVPlayer)currentlyPlaying
{
  return (AVPlayer *)objc_loadWeakRetained((id *)&self->_currentlyPlaying);
}

- (void)setCurrentlyPlaying:(id)a3
{
  objc_storeWeak((id *)&self->_currentlyPlaying, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentlyPlaying);
  objc_storeStrong((id *)&self->_timeControlStatusObservers, 0);
}

@end
