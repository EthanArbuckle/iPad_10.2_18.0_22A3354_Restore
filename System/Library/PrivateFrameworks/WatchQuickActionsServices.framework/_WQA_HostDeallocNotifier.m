@implementation _WQA_HostDeallocNotifier

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD block[4];
  id v7;

  -[_WQA_HostDeallocNotifier hostObserver](self, "hostObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35___WQA_HostDeallocNotifier_dealloc__block_invoke;
    block[3] = &unk_24F546E30;
    v7 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  v5.receiver = self;
  v5.super_class = (Class)_WQA_HostDeallocNotifier;
  -[_WQA_HostDeallocNotifier dealloc](&v5, sel_dealloc);
}

- (WatchQuickActionHostObserver)hostObserver
{
  return (WatchQuickActionHostObserver *)objc_loadWeakRetained((id *)&self->_hostObserver);
}

- (void)setHostObserver:(id)a3
{
  objc_storeWeak((id *)&self->_hostObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostObserver);
}

@end
