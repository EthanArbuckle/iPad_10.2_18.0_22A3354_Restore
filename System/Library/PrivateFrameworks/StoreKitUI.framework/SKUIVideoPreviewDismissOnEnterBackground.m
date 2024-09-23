@implementation SKUIVideoPreviewDismissOnEnterBackground

void __SKUIVideoPreviewDismissOnEnterBackground_block_invoke(uint64_t a1)
{
  id WeakRetained;
  id object;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    object = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);
    objc_setAssociatedObject(object, "com.apple.StoreKitUI.MoviePlayer.BackgroundObserver", 0, (void *)1);
    WeakRetained = object;
  }

}

@end
