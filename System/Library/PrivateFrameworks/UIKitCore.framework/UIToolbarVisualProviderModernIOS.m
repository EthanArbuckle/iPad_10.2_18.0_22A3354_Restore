@implementation UIToolbarVisualProviderModernIOS

BOOL __44___UIToolbarVisualProviderModernIOS_prepare__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!+[_UIBarBackgroundLayoutPrototyping prototypingEnabled](_UIBarBackgroundLayoutPrototyping, "prototypingEnabled"))
    {
      v2 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;

    }
    objc_msgSend(WeakRetained, "updateBarBackground");
  }

  return WeakRetained != 0;
}

void __81___UIToolbarVisualProviderModernIOS_traitCollectionForChild_baseTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "setUserInterfaceStyle:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "setPreferredContentSizeCategory:");
    v3 = v4;
  }

}

@end
