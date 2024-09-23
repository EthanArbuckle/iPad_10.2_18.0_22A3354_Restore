@implementation TVZoomableTextView

void __37___TVZoomableTextView_initWithFrame___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[79], "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, WeakRetained, 0);
    v2 = v3;
  }

}

void __37___TVZoomableTextView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[79], "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("play"), 1, 1, 0, WeakRetained, 0);
    v2 = v3;
  }

}

@end
