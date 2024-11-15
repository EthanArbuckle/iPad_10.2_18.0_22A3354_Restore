@implementation UISearchActivityManager

void __65___UISearchActivityManager_beginTrackingActiveSearchParticipant___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v2, "_activeAssertions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", WeakRetained);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "_updateClientSettingsIfNecessary");

}

uint64_t __60___UISearchActivityManager__updateClientSettingsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContainsSearchView:", *(unsigned __int8 *)(a1 + 32));
}

@end
