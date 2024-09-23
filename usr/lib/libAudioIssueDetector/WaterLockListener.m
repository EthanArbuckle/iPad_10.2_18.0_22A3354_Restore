@implementation WaterLockListener

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WaterLockListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WaterLockListener sharedInstance]::onceToken != -1)
    dispatch_once(&+[WaterLockListener sharedInstance]::onceToken, block);
  return (id)+[WaterLockListener sharedInstance]::sharedWaterLockListener;
}

void __35__WaterLockListener_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[WaterLockListener sharedInstance]::sharedWaterLockListener;
  +[WaterLockListener sharedInstance]::sharedWaterLockListener = (uint64_t)v1;

}

- (BOOL)isWaterLockedOff
{
  return 0;
}

@end
