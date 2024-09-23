@implementation UILongPressClickInteractionDriver

void __63___UILongPressClickInteractionDriver__handleGestureRecognizer___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  id WeakRetained;

  if (a2 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "cancelInteraction");

  }
  else if (!a2)
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(v2, "_asyncGestureBegan");

  }
}

@end
