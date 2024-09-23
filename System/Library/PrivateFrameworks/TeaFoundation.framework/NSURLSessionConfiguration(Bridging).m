@implementation NSURLSessionConfiguration(Bridging)

- (uint64_t)ts_timingDataEnabled
{
  return objc_msgSend(a1, "_timingDataOptions") & 1;
}

- (uint64_t)setTs_timingDataEnabled:()Bridging
{
  return objc_msgSend(a1, "set_timingDataOptions:", objc_msgSend(a1, "_timingDataOptions") & 0xFFFFFFFFFFFFFFFELL | a3);
}

@end
