@implementation WBSBiomeDonationManager

void __129__WBSBiomeDonationManager_SafariSharedUI__donateWindowProxyWithDomain_openedDomain_windowProxyProperty_accessedPropertyDirectly___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_windowProxyStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

    WeakRetained = v5;
  }

}

@end
