@implementation UIStatusBarStringView

void __51___UIStatusBarStringView__updateAlternateTextTimer__block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "showsAlternateText") ^ 1;
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setShowsAlternateText:", v2);

}

@end
