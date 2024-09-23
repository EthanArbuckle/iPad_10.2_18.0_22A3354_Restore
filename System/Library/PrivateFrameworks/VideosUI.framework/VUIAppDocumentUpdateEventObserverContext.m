@implementation VUIAppDocumentUpdateEventObserverContext

void __89___VUIAppDocumentUpdateEventObserverContext__refreshTimerWithRefreshTimeEventDescriptor___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  VUIAppDocumentRefreshEvent *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "refreshTimerByEventDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v6, "refreshTimerFiredBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[VUIAppDocumentRefreshEvent initWithRefreshEventDescriptor:]([VUIAppDocumentRefreshEvent alloc], "initWithRefreshEventDescriptor:", *(_QWORD *)(a1 + 32));
      ((void (**)(_QWORD, VUIAppDocumentRefreshEvent *))v4)[2](v4, v5);

    }
    WeakRetained = v6;
  }

}

@end
