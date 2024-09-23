@implementation BKSHIDEventDeferringEnvironment(UIKitAdditions_Internal)

+ (id)ui_systemKeyCommandOverlayEnvironment
{
  if (qword_1ECD7DB60 != -1)
    dispatch_once(&qword_1ECD7DB60, &__block_literal_global_4_6);
  return (id)qword_1ECD7DB58;
}

@end
