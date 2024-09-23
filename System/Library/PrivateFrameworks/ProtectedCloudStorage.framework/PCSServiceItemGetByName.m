@implementation PCSServiceItemGetByName

const void *__PCSServiceItemGetByName_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *result;
  const void *v6;
  BOOL v7;

  result = *(const void **)(a3 + 40);
  v6 = *(const void **)(a1 + 40);
  if (result)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (result != v6)
      return result;
    goto LABEL_9;
  }
  result = (const void *)CFEqual(result, v6);
  if ((_DWORD)result)
LABEL_9:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

@end
