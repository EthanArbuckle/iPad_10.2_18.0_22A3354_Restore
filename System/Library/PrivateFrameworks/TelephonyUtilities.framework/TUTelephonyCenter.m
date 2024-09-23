@implementation TUTelephonyCenter

void ___TUTelephonyCenter_block_invoke()
{
  TUDispatchMainIfNecessaryAndWait(&__block_literal_global_65, 1);
}

uint64_t ___TUTelephonyCenter_block_invoke_2()
{
  uint64_t result;

  CFRunLoopGetCurrent();
  CTTelephonyCenterSetDefaultRunloop();
  result = CTTelephonyCenterGetDefault();
  _TUTelephonyCenter_tc = result;
  return result;
}

@end
