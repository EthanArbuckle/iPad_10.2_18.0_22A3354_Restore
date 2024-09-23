@implementation UIEventHIDEventRemoteTimestamp

uint64_t ___UIEventHIDEventRemoteTimestamp_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t IntegerValue;
  uint64_t result;
  BOOL v8;
  _QWORD *DataValue;

  IntegerValue = IOHIDEventGetIntegerValue();
  result = IOHIDEventGetIntegerValue();
  v8 = IntegerValue == 65308 || IntegerValue == 65280;
  if (v8 && result == 258)
  {
    DataValue = (_QWORD *)IOHIDEventGetDataValue();
    result = IOHIDEventGetIntegerValue();
    if (DataValue)
    {
      if (result >= 1)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *DataValue;
    }
    *a4 = 1;
  }
  return result;
}

@end
