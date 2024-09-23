@implementation NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange

uint64_t ____NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateRangeInElement");
}

id ____NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  id result;
  void *v9;
  NSTextRange *v10;
  void *v11;

  v6 = a1[6];
  if (v6 && !(*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, a2))
  {
    result = (id)objc_msgSend(a2, "_updateRangeInElement");
    v9 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    if (v9)
    {
      if (objc_msgSend(v9, "compare:", objc_msgSend(a3, "location")) == -1)
      {
        v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), objc_msgSend(a3, "location"));
        v11 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
        if (!v11)
        {
          *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v11 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
        }
        objc_msgSend(v11, "addObject:", v10);

      }
      if (a1[5] && objc_msgSend((id)objc_msgSend(a3, "endLocation"), "compare:", a1[5]) == -1)
        result = (id)objc_msgSend(a3, "endLocation");
      else
        result = 0;
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = result;
    }
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    if (v7 != objc_msgSend(a2, "textElement"))
    {
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(a2, "textElement");
      objc_msgSend(*(id *)(a1[4] + 88), "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    }
    if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = (id)objc_msgSend(a3, "location");
    return (id)objc_msgSend(a2, "setTextElement:", 0);
  }
  return result;
}

@end
