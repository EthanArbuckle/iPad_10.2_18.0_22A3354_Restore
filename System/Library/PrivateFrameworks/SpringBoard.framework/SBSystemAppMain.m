@implementation SBSystemAppMain

void __SBSystemAppMain_block_invoke_13(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setResetDarkBootState:", 1);
  objc_msgSend(v2, "setSystemSleepInterval:", 3.0);
  objc_msgSend(v2, "setIndependentWatchdogPortName:", CFSTR("com.apple.springboard.oswatchdog"));
  objc_msgSend(v2, "setRegisterAdditionalServicesBlock:", &__block_literal_global_18);

}

uint64_t __SBSystemAppMain_block_invoke_2()
{
  return +[SpringBoard initializeSystemServicesBeforeApplicationDidFinishLaunching](SpringBoard, "initializeSystemServicesBeforeApplicationDidFinishLaunching");
}

@end
