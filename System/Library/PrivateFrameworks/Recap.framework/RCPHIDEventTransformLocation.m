@implementation RCPHIDEventTransformLocation

uint64_t __RCPHIDEventTransformLocation_block_invoke()
{
  int Type;

  Type = IOHIDEventGetType();
  if (Type == 17 || Type == 11)
  {
    IOHIDEventGetFloatValue();
    IOHIDEventGetFloatValue();
    IOHIDEventSetFloatValue();
    IOHIDEventSetFloatValue();
  }
  return 0;
}

@end
