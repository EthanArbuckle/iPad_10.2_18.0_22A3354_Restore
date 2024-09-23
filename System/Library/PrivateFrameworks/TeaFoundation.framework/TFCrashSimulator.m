@implementation TFCrashSimulator

- (void)triggerSIGBUS
{
  if (+[TFCapabilities isInternalBuild](TFCapabilities, "isInternalBuild"))
    *(_BYTE *)dummyfunc = 0;
}

- (void)triggerSIGILL
{
  if (+[TFCapabilities isInternalBuild](TFCapabilities, "isInternalBuild"))
    __asm { TLBI            ALLE1 }
}

- (void)triggerSIGSEGV
{
  +[TFCapabilities isInternalBuild](TFCapabilities, "isInternalBuild");
}

@end
