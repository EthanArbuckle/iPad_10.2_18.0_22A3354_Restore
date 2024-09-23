@implementation TUAddTelephonyCenterObserver

uint64_t __TUAddTelephonyCenterObserver_block_invoke()
{
  if (_TUTelephonyCenter_onceToken != -1)
    dispatch_once(&_TUTelephonyCenter_onceToken, &__block_literal_global_64);
  return CTTelephonyCenterAddObserver();
}

@end
