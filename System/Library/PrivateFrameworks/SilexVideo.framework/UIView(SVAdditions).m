@implementation UIView(SVAdditions)

- (void)setHidden:()SVAdditions withShowDelay:
{
  dispatch_time_t v5;
  _QWORD block[5];

  if (a4)
  {
    objc_msgSend(a1, "setHidden:", 1);
  }
  else
  {
    v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__UIView_SVAdditions__setHidden_withShowDelay___block_invoke;
    block[3] = &unk_24DBC2330;
    block[4] = a1;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
  }
}

@end
