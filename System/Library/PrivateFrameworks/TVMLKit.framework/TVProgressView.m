@implementation TVProgressView

void __43___TVProgressView__maskImageForProgressBar__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFill");

  v3 = (void *)MEMORY[0x24BDF6870];
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[61];
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fill");

}

@end
