@implementation PXPhotosBarButtonView

uint64_t __57___PXPhotosBarButtonView__resumeChangeDeliveryIfPossible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(a1 + 32));
}

void __46___PXPhotosBarButtonView__pauseChangeDelivery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("PauseChangeDeliveryForContextMenu"), 10.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAction");

}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMenuAction");

}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleWillDisplayMenu");

}

void __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleWillDismissMenu");

}

void __40___PXPhotosBarButtonView_layoutSubviews__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  layoutSubviews_adaptorClass = (uint64_t)NSClassFromString(CFSTR("_UITAMICAdaptorView"));
  if (!layoutSubviews_adaptorClass)
  {
    PXAssertGetLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v1 = 0;
      _os_log_error_impl(&dword_1A6789000, v0, OS_LOG_TYPE_ERROR, "_UITAMICAdaptorView doesn't exist, workaround for <rdar://problem/64616256> might break.", v1, 2u);
    }

  }
}

@end
