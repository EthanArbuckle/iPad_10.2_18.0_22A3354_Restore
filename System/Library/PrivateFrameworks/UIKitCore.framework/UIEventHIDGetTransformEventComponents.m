@implementation UIEventHIDGetTransformEventComponents

uint64_t ___UIEventHIDGetTransformEventComponents_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;

  result = IOHIDEventGetType();
  switch((_DWORD)result)
  {
    case 4:
      v8 = a1[6];
      goto LABEL_7;
    case 5:
      v8 = a1[5];
      goto LABEL_7;
    case 7:
      v8 = a1[4];
LABEL_7:
      *(_QWORD *)(*(_QWORD *)(v8 + 8) + 24) = a2;
      break;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) && *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
      *a4 = 1;
  }
  return result;
}

@end
