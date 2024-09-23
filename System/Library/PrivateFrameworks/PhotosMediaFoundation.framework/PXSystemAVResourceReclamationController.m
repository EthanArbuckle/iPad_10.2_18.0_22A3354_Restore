@implementation PXSystemAVResourceReclamationController

- (PXSystemAVResourceReclamationController)init
{
  PXSystemAVResourceReclamationController *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  AVResourceReclamationController *systemController;
  uint64_t v8;
  AVResourceReclamationEventObserverToken *observerToken;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXSystemAVResourceReclamationController;
  v2 = -[PXConcreteAVResourceReclamationController init](&v17, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDB1610];
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __47__PXSystemAVResourceReclamationController_init__block_invoke;
    v14 = &unk_2514A2E68;
    objc_copyWeak(&v15, &location);
    v5 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, &v11);

    objc_msgSend(MEMORY[0x24BDB2678], "defaultController", v11, v12, v13, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    systemController = v2->_systemController;
    v2->_systemController = (AVResourceReclamationController *)v6;

    if (PLIsMobileSlideShow())
      -[AVResourceReclamationController permitReclamationWhileSuspended](v2->_systemController, "permitReclamationWhileSuspended");
    -[AVResourceReclamationController addReclamationEventObserver:](v2->_systemController, "addReclamationEventObserver:", v2);
    v8 = objc_claimAutoreleasedReturnValue();
    observerToken = v2->_observerToken;
    v2->_observerToken = (AVResourceReclamationEventObserverToken *)v8;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_handleMediaServicesWereResetNotification:(id)a3
{
  id v4;
  id v5;

  ++_handleMediaServicesWereResetNotification__mediaServicesResetCount;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = (id)objc_msgSend(v4, "initWithFormat:", CFSTR("AVMediaServicesReset-%d"), _handleMediaServicesWereResetNotification__mediaServicesResetCount);
  -[PXConcreteAVResourceReclamationController reclamationEventDidOccur:](self, "reclamationEventDidOccur:", v5);

}

- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSystemAVResourceReclamationController systemController](self, "systemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeAssertionPreventingResourceReclamationWithReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reclamationController:(id)a3 didReclaimObjectsWithEvent:(id)a4
{
  -[PXConcreteAVResourceReclamationController reclamationEventDidOccur:](self, "reclamationEventDidOccur:", a4);
}

- (AVResourceReclamationController)systemController
{
  return self->_systemController;
}

- (AVResourceReclamationEventObserverToken)observerToken
{
  return self->_observerToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_systemController, 0);
}

void __47__PXSystemAVResourceReclamationController_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleMediaServicesWereResetNotification:", v3);

}

@end
