@implementation NSTextRunStorage

NSCountableTextLocation *__69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSCountableTextRange *v10;
  uint64_t v11;
  BOOL v12;
  NSCountableTextLocation *result;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v4 = -[_NSTextRunStorage _indexFromTextLocation:](a2, *(void **)(a1 + 32));
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  v6 = v5;
  v14 = 0;
  if (*(_BYTE *)(a1 + 64))
  {
    if (v4 >= v5)
      v7 = v5;
    else
      v7 = v4;
    if (*(_QWORD *)(a1 + 32))
      v8 = v7;
    else
      v8 = v5;
    v4 = v8 - 1;
  }
  v15 = 0;
  v16 = 0;
  if (v4 < v5)
  {
    do
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectAtIndex:effectiveRange:", v4, &v15);
      if (v9 && v9 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
      {
        if (*(_BYTE *)(a1 + 65))
          v10 = 0;
        else
          v10 = -[_NSTextRunStorage _createTextRangeFromRange:](a2, v15, v16);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      }
      if (*(_BYTE *)(a1 + 64))
        v11 = -1;
      else
        v11 = v16;
      v4 = v11 + v15;
      if (v14)
        v12 = 1;
      else
        v12 = v4 >= v6;
    }
    while (!v12);
  }
  if (v4 >= v6)
    result = 0;
  else
    result = -[_NSTextRunStorage _createLocationFromOffset:](a2, v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

NSUInteger __40___NSTextRunStorage_setObject_forRange___block_invoke(uint64_t a1, uint64_t a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger result;
  NSRange v8;
  NSRange v9;
  NSRange v10;

  v3 = -[_NSTextRunStorage _rangeFromTextRange:](a2, *(void **)(a1 + 32));
  v5 = v4;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  v9.location = v3;
  v9.length = v5;
  v10.location = 0;
  v10.length = v6;
  v8 = NSIntersectionRange(v9, v10);
  result = v8.location;
  if (v8.length)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "replaceObjectsInRange:withObject:length:", v8.location, v8.length, *(_QWORD *)(a1 + 48), v8.length);
  if (v3 + v5 > v6)
  {
    if (v3 <= v6)
    {
      v5 = v3 + v5 - v6;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertObject:range:", 0, v6, v3 - v6);
      v6 = v3;
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertObject:range:", *(_QWORD *)(a1 + 48), v6, v5);
  }
  return result;
}

NSUInteger __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger result;
  NSRange v9;
  uint64_t v10;
  NSRange v11;
  NSRange v12;

  v3 = -[_NSTextRunStorage _rangeFromTextRange:](a2, *(void **)(a1 + 32));
  v5 = v4;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  v7 = *(_QWORD *)(a1 + 48);
  v11.location = v3;
  v11.length = v5;
  v12.location = 0;
  v12.length = v6;
  v9 = NSIntersectionRange(v11, v12);
  result = v9.location;
  if (v3 + v5 >= v6)
    v10 = v7 & (v7 >> 63);
  else
    v10 = v7;
  if (v9.length)
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "deleteObjectsInRange:", v9.location, v9.length);
  if ((int64_t)(v9.length + v10) >= 1)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertObject:range:", 0, v9.location);
  return result;
}

NSCountableTextRange *__33___NSTextRunStorage_contentRange__block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSCountableTextRange *result;
  NSCountableTextRange *v5;
  unint64_t v6;
  NSCountableTextRange *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  result = (NSCountableTextRange *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  if (result)
  {
    v5 = result;
    v6 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      result = (NSCountableTextRange *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:effectiveRange:", v6, &v12);
      if (result)
      {
        v7 = result;
        result = (NSCountableTextRange *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
        if (v7 != result)
          break;
      }
      v6 = v13 + v12;
      if (v13 + v12 >= (unint64_t)v5)
        return result;
    }
    v8 = v13;
    if (v13)
    {
      v9 = v12;
      v10 = v13 + v12;
      if (v13 + v12 < (unint64_t)v5)
      {
        v12 = (unint64_t)v5;
        v13 = 0;
        while (1)
        {
          v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:effectiveRange:", (char *)&v5[-1]._range.length + 7, &v12);
          if (v11)
          {
            if (v11 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
              break;
          }
          v5 = (NSCountableTextRange *)v12;
          if (v10 >= v12)
            goto LABEL_15;
        }
        v8 = v12 - v9 + v13;
      }
LABEL_15:
      result = -[_NSTextRunStorage _createTextRangeFromRange:](a2, v9, v8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __28___NSTextRunStorage_isEmpty__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  *a4 = 1;
  return result;
}

uint64_t __32___NSTextRunStorage_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ => %@,\n"), objc_msgSend(a3, "description"), a2);
}

id __33___NSTextRunStorage_contentRange__block_invoke(uint64_t a1, id *a2)
{
  id result;

  result = *a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __33___NSTextRunStorage_contentRange__block_invoke_2(uint64_t a1, id *a2)
{
  NSTextRange *v3;

  if (*a2)
  {
    v3 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "location"), objc_msgSend(*a2, "endLocation"));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = v3;
  }
}

id __69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke(uint64_t a1, id *a2)
{
  id result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  result = (id)objc_msgSend(*a2, "endLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSCountableTextRange *v8;
  NSCountableTextLocation *v9;
  NSCountableTextRange *v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *a2;
  if (*(_BYTE *)(v4 + 56))
  {
    v6 = objc_msgSend(v5, "range");
    v8 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", *(_QWORD *)(a1 + 40) + v6, v7);
  }
  else
  {
    v9 = -[_NSTextRunStorage _locationFromLocation:withOffset:]((NSCountableTextLocation *)v4, (void *)objc_msgSend(v5, "location"), *(_QWORD *)(a1 + 40));
    v8 = -[NSCountableTextRange initWithLocation:endLocation:]([NSCountableTextRange alloc], "initWithLocation:endLocation:", v9, -[_NSTextRunStorage _locationFromLocation:withOffset:](*(NSCountableTextLocation **)(a1 + 32), (void *)objc_msgSend(*a2, "endLocation"), *(_QWORD *)(a1 + 40)));
  }
  v10 = v8;

  *a2 = v10;
}

@end
