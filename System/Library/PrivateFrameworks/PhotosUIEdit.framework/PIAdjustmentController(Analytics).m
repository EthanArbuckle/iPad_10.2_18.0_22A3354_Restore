@implementation PIAdjustmentController(Analytics)

- (uint64_t)analyticsPayload
{
  return MEMORY[0x24BDBD1B8];
}

@end
