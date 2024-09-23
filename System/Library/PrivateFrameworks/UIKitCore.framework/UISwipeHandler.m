@implementation UISwipeHandler

uint64_t __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned int v3;
  uint64_t result;
  char v5;

  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = v2[8];
  if ((v3 & 1) != 0)
    return (v3 >> 1) & 1;
  result = objc_msgSend(v2, "_swipeRecognizerBegan:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) & 0xFD | v5;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) |= 1u;
  return result;
}

uint64_t __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
