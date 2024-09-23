@implementation UIUpdateHIDDigitizerInput

void __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke_2(uint64_t a1)
{
  uint64_t IntegerValue;
  char v3;
  int TouchLocus;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  IntegerValue = IOHIDEventGetIntegerValue();
  v3 = IOHIDEventGetIntegerValue();
  TouchLocus = BKSHIDEventDigitizerGetTouchLocus();
  v5 = _UIEventHIDPathIndexForDigitizerEvent();
  if (!IntegerValue || v3 < 0 || TouchLocus == 3)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);
  }

}

uint64_t __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  IOHIDEventGetIntegerValue();
  IOHIDEventGetIntegerValue();
  result = IOHIDEventGetIntegerValue();
  if (result == 65308)
  {
    result = IOHIDEventGetIntegerValue();
    if (result == 32)
    {
      result = IOHIDEventGetDataValue();
      *(_QWORD *)(a1[4] + 144) = *(_QWORD *)(result + 8) - *(_QWORD *)(result + 16);
      *(_QWORD *)(a1[4] + 152) = *(_QWORD *)(result + 16);
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(result + 1);
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
      *a4 = 1;
    }
  }
  return result;
}

@end
