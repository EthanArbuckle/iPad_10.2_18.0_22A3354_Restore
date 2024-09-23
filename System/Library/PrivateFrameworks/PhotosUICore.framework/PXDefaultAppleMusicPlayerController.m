@implementation PXDefaultAppleMusicPlayerController

void __PXDefaultAppleMusicPlayerController_block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_PXAppleMusicPlayerController _init]([_PXAppleMusicPlayerController alloc], "_init");
  v1 = (void *)sharedPlayerController;
  sharedPlayerController = (uint64_t)v0;

}

@end
