@implementation WBSBiomeDonationManager(SafariSharedUI)

- (void)donateWindowProxyWithDomain:()SafariSharedUI openedDomain:windowProxyProperty:accessedPropertyDirectly:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend((id)objc_opt_class(), "isBiomeStreamDonationAvailable"))
  {
    v12 = objc_alloc(MEMORY[0x1E0D02228]);
    WBSTimestampForBiomeEventDonation();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(a1, "_biomeWindowProperty:", a5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v12, "initWithDomain:openedDomain:visited:property:accessedPropertyDirectly:", v10, v11, v13, v14, v15);

    if (v16)
    {
      objc_initWeak(&location, a1);
      v17 = *(NSObject **)&a1[*MEMORY[0x1E0D8A238]];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __129__WBSBiomeDonationManager_SafariSharedUI__donateWindowProxyWithDomain_openedDomain_windowProxyProperty_accessedPropertyDirectly___block_invoke;
      block[3] = &unk_1E5442448;
      objc_copyWeak(&v20, &location);
      v19 = v16;
      dispatch_async(v17, block);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }

  }
}

- (uint64_t)_biomeWindowProperty:()SafariSharedUI
{
  if (a3 > 3)
    return 0;
  else
    return dword_1A84E3460[a3];
}

@end
