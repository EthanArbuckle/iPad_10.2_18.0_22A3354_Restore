@implementation SASLogging

+ (id)facility
{
  if (facility_onceToken != -1)
    dispatch_once(&facility_onceToken, &__block_literal_global);
  return (id)facility_facility;
}

void __22__SASLogging_facility__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.purplebuddy", "log");
  v1 = (void *)facility_facility;
  facility_facility = (uint64_t)v0;

}

@end
