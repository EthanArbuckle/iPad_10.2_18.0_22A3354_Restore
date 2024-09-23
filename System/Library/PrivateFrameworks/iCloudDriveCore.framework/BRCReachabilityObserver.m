@implementation BRCReachabilityObserver

- (void)startObservingNetworkReachabilityChanges
{
  id v3;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addReachabilityObserver:", self);

}

- (void)stopObservingNetworkReachabilityChanges
{
  id v3;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeReachabilityObserver:", self);

}

- (void)networkReachabilityChanged:(BOOL)a3
{
  _BOOL8 v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v3 = a3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](self->_networkReachabilityDidChangeHandler, a2);
  if (v4)
  {
    v5 = v4;
    v4[2](v4, v3);
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (id)networkReachabilityDidChangeHandler
{
  return self->_networkReachabilityDidChangeHandler;
}

- (void)setNetworkReachabilityDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkReachabilityDidChangeHandler, 0);
}

@end
