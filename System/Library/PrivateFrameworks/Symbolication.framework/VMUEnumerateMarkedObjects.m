@implementation VMUEnumerateMarkedObjects

uint64_t ___VMUEnumerateMarkedObjects_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = s_currentMarkingContext;
  if (s_currentMarkingContext)
  {
    v2 = result;
    do
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) += *(_DWORD *)(v1 + 28);
      if (*(_QWORD *)(v2 + 32))
      {
        v3 = *(unsigned int *)(v1 + 20);
        if ((_DWORD)v3)
        {
          v4 = 0;
          v5 = *(unsigned int *)(v1 + 12) + v1;
          do
          {
            if (*(_QWORD *)(v5 + 8 * v4))
            {
              result = objc_msgSend(*(id *)(v2 + 32), "addObject:");
              v3 = *(unsigned int *)(v1 + 20);
            }
            ++v4;
          }
          while (v4 < v3);
        }
      }
      v1 = *(_QWORD *)(v1 + 32);
    }
    while (v1);
  }
  return result;
}

@end
