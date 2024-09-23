@implementation UITextFormattingDeferredFontPickingDelegate

void __84___UITextFormattingDeferredFontPickingDelegate_fontPickerViewControllerDidPickFont___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v2;
  }

}

@end
