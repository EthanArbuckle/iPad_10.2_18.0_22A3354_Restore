@implementation SAUIPortalView

void __47___SAUIPortalView__configurePortalViewIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v2)
  {
    objc_msgSend(WeakRetained, "portalLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceLayer:", v2);

  }
}

@end
