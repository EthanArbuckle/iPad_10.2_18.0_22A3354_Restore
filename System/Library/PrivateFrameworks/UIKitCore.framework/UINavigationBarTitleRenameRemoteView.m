@implementation UINavigationBarTitleRenameRemoteView

void __54___UINavigationBarTitleRenameRemoteView_updateMetrics__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "portalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v5)
    {
      objc_msgSend(v10, "bounds");
      objc_msgSend(v5, "setFrame:");
      v6 = objc_msgSend(v10, "sourceContextId");
      objc_msgSend(v5, "portalLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSourceContextId:", v6);

      v8 = objc_msgSend(v10, "sourceLayerRenderId");
      objc_msgSend(v5, "portalLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSourceLayerRenderId:", v8);

      objc_msgSend(v10, "intrinsicContentSize");
      objc_msgSend(v4, "setIntrinsicContentSize:");
      objc_msgSend(v10, "horizontalTextInset");
      objc_msgSend(v4, "setHorizontalTextInset:");
    }
    else
    {
      objc_msgSend(v4, "_disconnect");
    }

  }
}

@end
