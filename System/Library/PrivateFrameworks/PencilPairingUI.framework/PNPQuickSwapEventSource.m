@implementation PNPQuickSwapEventSource

- (id)playlist
{
  PNPSyntheticWaitEvent *v2;
  PNPSyntheticDoubleTapEvent *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[PNPSyntheticWaitEvent initWithDelay:]([PNPSyntheticWaitEvent alloc], "initWithDelay:", 1.0);
  v3 = objc_alloc_init(PNPSyntheticDoubleTapEvent);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
