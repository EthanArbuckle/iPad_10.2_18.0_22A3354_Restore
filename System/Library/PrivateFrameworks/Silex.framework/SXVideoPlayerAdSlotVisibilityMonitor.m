@implementation SXVideoPlayerAdSlotVisibilityMonitor

- (SXVideoPlayerAdSlotVisibilityMonitor)initWithVideoPlayerViewController:(id)a3 videoAdSlotVisiblePercentageProvider:(id)a4
{
  id v6;
  id v7;
  SXVideoPlayerAdSlotVisibilityMonitor *v8;
  id v9;
  uint64_t v10;
  SVKeyValueObserver *observer;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXVideoPlayerAdSlotVisibilityMonitor;
  v8 = -[SXVisibilityMonitor initWithObject:visiblePercentageProvider:](&v16, sel_initWithObject_visiblePercentageProvider_, v6, v7);
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = objc_alloc(MEMORY[0x24BE90750]);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __111__SXVideoPlayerAdSlotVisibilityMonitor_initWithVideoPlayerViewController_videoAdSlotVisiblePercentageProvider___block_invoke;
    v13[3] = &unk_24D68A2F8;
    objc_copyWeak(&v14, &location);
    v10 = objc_msgSend(v9, "initWithKeyPath:ofObject:withOptions:change:", CFSTR("mode"), v6, 1, v13);
    observer = v8->_observer;
    v8->_observer = (SVKeyValueObserver *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __111__SXVideoPlayerAdSlotVisibilityMonitor_initWithVideoPlayerViewController_videoAdSlotVisiblePercentageProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateVisibility");

}

- (SVKeyValueObserver)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
