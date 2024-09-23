@implementation WebNetworkStateObserver

- (void)networkStateChanged:(id)a3
{
  (*((void (**)(void))self->block.m_block + 2))();
}

- (WebNetworkStateObserver)initWithBlock:(id)a3
{
  WebNetworkStateObserver *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WebNetworkStateObserver;
  v4 = -[WebNetworkStateObserver init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver"), "addNetworkReachableObserver:selector:", v4, sel_networkStateChanged_);
    v5 = _Block_copy(a3);
    _Block_release(v4->block.m_block);
    v4->block.m_block = v5;
    _Block_release(0);
  }
  return v4;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  _Block_release(self->block.m_block);
}

@end
