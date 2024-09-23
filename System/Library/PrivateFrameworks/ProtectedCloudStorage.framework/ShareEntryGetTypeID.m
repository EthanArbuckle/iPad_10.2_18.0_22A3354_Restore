@implementation ShareEntryGetTypeID

uint64_t __ShareEntryGetTypeID_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
