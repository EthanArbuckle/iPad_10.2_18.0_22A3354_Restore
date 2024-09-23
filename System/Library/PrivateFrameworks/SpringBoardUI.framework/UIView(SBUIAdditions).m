@implementation UIView(SBUIAdditions)

- (void)sbui_drawEagerly
{
  void *v2;
  __CFRunLoop *Current;
  const void *v4;
  _QWORD block[5];

  objc_getAssociatedObject(a1, "hasDrawn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_setAssociatedObject(a1, "hasDrawn", (id)*MEMORY[0x24BDBD270], 0);
    Current = CFRunLoopGetCurrent();
    v4 = (const void *)*MEMORY[0x24BDBD5A0];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__UIView_SBUIAdditions__sbui_drawEagerly__block_invoke;
    block[3] = &unk_24D4CFFF8;
    block[4] = a1;
    CFRunLoopPerformBlock(Current, v4, block);
  }
}

@end
