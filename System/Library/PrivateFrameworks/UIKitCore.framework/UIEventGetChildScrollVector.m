@implementation UIEventGetChildScrollVector

uint64_t ___UIEventGetChildScrollVector_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  IOHIDEventGetFloatValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v6;
  result = IOHIDEventGetFloatValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v8;
  *a4 = 1;
  return result;
}

@end
