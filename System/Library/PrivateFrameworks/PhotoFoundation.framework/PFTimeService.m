@implementation PFTimeService

+ (PFTimeService)defaultTimeService
{
  if (defaultTimeService_onceToken != -1)
    dispatch_once(&defaultTimeService_onceToken, &__block_literal_global_178);
  return (PFTimeService *)(id)defaultTimeService_defaultTimeService;
}

- (unint64_t)clock_gettime_nsec_np:(int)a3
{
  return clock_gettime_nsec_np((clockid_t)a3);
}

void __35__PFTimeService_defaultTimeService__block_invoke()
{
  PFTimeService *v0;
  void *v1;

  v0 = objc_alloc_init(PFTimeService);
  v1 = (void *)defaultTimeService_defaultTimeService;
  defaultTimeService_defaultTimeService = (uint64_t)v0;

}

- (double)timeIntervalSinceReferenceDate
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)sleepForTimeInterval:(double)a3
{
  objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", a3);
}

@end
