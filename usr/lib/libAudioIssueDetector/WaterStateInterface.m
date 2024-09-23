@implementation WaterStateInterface

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WaterStateInterface_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WaterStateInterface sharedInstance]::onceToken != -1)
    dispatch_once(&+[WaterStateInterface sharedInstance]::onceToken, block);
  return (id)+[WaterStateInterface sharedInstance]::sharedWaterStateInterface;
}

void __37__WaterStateInterface_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[WaterStateInterface sharedInstance]::sharedWaterStateInterface;
  +[WaterStateInterface sharedInstance]::sharedWaterStateInterface = (uint64_t)v1;

}

- (BOOL)isWaterStateON
{
  return 0;
}

@end
