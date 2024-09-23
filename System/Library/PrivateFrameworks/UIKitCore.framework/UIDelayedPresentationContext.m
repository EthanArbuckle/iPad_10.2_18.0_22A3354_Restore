@implementation UIDelayedPresentationContext

void __57___UIDelayedPresentationContext_beginDelayedPresentation__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delayingController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_cancelDelayedPresentation:", 1);

}

@end
