@implementation UIKitMethodComponents

uint64_t ___UIKitMethodComponents_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  char v6;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "lastObject"), "stringByAppendingString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  result = objc_msgSend(a2, "length");
  if (result)
  {
    v6 = 1;
LABEL_5:
    result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
    return result;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = 0;
    a2 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  return result;
}

@end
