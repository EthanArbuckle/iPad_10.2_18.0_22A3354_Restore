@implementation RCPEventHIDDigitizerEventCountOfTouchingContacts

uint64_t ___RCPEventHIDDigitizerEventCountOfTouchingContacts_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = IOHIDEventGetIntegerValue();
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
