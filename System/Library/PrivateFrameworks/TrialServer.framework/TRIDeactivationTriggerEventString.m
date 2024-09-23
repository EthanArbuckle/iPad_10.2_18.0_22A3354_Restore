@implementation TRIDeactivationTriggerEventString

+ (id)categoricalValueForTriggerEvent:(unint64_t)a3
{
  if (a3 - 1 > 0x18)
    return CFSTR("legacy-standard");
  else
    return off_1E9331A80[a3 - 1];
}

@end
