@implementation WristStateListener

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__WristStateListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WristStateListener sharedInstance]::onceToken != -1)
    dispatch_once(&+[WristStateListener sharedInstance]::onceToken, block);
  return (id)+[WristStateListener sharedInstance]::sharedWristStateListener;
}

void __36__WristStateListener_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[WristStateListener sharedInstance]::sharedWristStateListener;
  +[WristStateListener sharedInstance]::sharedWristStateListener = (uint64_t)v1;

}

- (BOOL)isWristOn
{
  return 0;
}

@end
