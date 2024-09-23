@implementation BKSHIDEventDeferringEnvironment(UIKitAdditions)

+ (id)ui_cameraCaptureButtonEnvironment
{
  if (qword_1ECD7DB50 != -1)
    dispatch_once(&qword_1ECD7DB50, &__block_literal_global_208);
  return (id)_MergedGlobals_1042;
}

+ (id)ui_environmentForUIPhysicalButton:()UIKitAdditions
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 5)
    return 0;
  objc_msgSend(MEMORY[0x1E0D00CA8], "ui_cameraCaptureButtonEnvironment", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
