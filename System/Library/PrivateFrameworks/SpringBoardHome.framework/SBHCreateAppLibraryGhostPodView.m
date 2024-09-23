@implementation SBHCreateAppLibraryGhostPodView

void __SBHCreateAppLibraryGhostPodView_block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    objc_msgSend(WeakRetained, "setFilterForUserInterface:", v5);
  }

}

@end
