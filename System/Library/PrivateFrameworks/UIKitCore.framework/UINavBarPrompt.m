@implementation UINavBarPrompt

uint64_t __33___UINavBarPrompt_layoutSubviews__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[52];
  objc_msgSend(v1, "_labelFrame");
  return objc_msgSend(v2, "setFrame:");
}

@end
