@implementation PTPrototypingEventsDescription

uint64_t __PTPrototypingEventsDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __PTPrototypingEventsDescription_block_invoke_2(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t result;
  __CFString *v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
  {
    if (a2 > 3)
      v7 = 0;
    else
      v7 = off_1E7058460[a2];
    objc_msgSend(*(id *)(a1 + 40), "appendString:", v7);
    v8 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v8 >= 2)
    {
      v9 = *(void **)(a1 + 40);
      v10 = CFSTR(", ");
      return objc_msgSend(v9, "appendString:", v10);
    }
    v9 = *(void **)(a1 + 40);
    if (v8 == 1)
    {
      v10 = CFSTR(" and ");
      return objc_msgSend(v9, "appendString:", v10);
    }
    result = objc_msgSend(v9, "appendString:", CFSTR(" events"));
    *a3 = 1;
  }
  return result;
}

@end
