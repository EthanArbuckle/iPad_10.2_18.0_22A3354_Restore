@implementation NSTextAttributeStorage

uint64_t __59___NSTextAttributeStorage_setAttribute_value_forTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v8[0] = a2;
  v8[1] = a3;
  return objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2));
}

id __59___NSTextAttributeStorage_setAttribute_value_forTextRange___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id result;
  NSTextRange *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  result = (id)objc_msgSend((id)objc_msgSend(a3, "location"), "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
  if (result == (id)-1)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "compare:", objc_msgSend(a3, "location")) == -1
      && *(_QWORD *)(a1 + 40))
    {
      v9 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), objc_msgSend(a3, "location"));
      v10 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 48);
      v19[0] = v11;
      (*(void (**)(uint64_t, NSTextRange *, uint64_t))(v10 + 16))(v10, v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));

    }
    v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:", a3);
    v13 = objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v14 = *(void **)(a1 + 40);
    if (v14 != (void *)v13 && (objc_msgSend(v14, "isEqual:") & 1) == 0)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a2);
      v16 = v15;
      v17 = *(_QWORD *)(a1 + 40);
      if (v17)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *(_QWORD *)(a1 + 48));
      else
        objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    result = (id)objc_msgSend(v12, "endLocation");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

uint64_t __71___NSTextAttributeStorage__attributesInTextRange_areEqualToAttributes___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsRange:", a1[4]);
  if ((_DWORD)result)
    result = objc_msgSend(a2, "isEqualToDictionary:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  *a4 = 1;
  return result;
}

uint64_t __71___NSTextAttributeStorage__attributesInTextRange_areEqualToAttributes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "endLocation"), "compare:", objc_msgSend(a3, "location"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 1;
  *a4 = 1;
  return result;
}

uint64_t __78___NSTextAttributeStorage_enumerateAttributesFromLocation_reverse_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
