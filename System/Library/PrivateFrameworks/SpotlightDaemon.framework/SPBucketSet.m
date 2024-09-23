@implementation SPBucketSet

const void *__28___SPBucketSet_valueForKey___block_invoke(uint64_t a1)
{
  const void *result;

  result = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

CFIndex __34___SPBucketSet_removeValueForKey___block_invoke(uint64_t a1)
{
  CFIndex result;

  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

CFIndex __32___SPBucketSet_addValue_forKey___block_invoke(uint64_t a1)
{
  char *Value;
  CFIndex result;

  Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40));
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), *(const void **)(a1 + 40), &Value[*(_QWORD *)(a1 + 48)]);
  result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

CFIndex __22___SPBucketSet_decay___block_invoke(uint64_t a1)
{
  CFIndex Count;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  size_t v6;
  const void **v7;
  const void **v8;
  __CFDictionary *v9;
  const void *v10;
  char *v11;
  CFIndex result;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8));
  if (Count)
  {
    v3 = Count;
    v4 = *(_QWORD *)(a1 + 40);
    if (Count >= 3)
      v4 = (uint64_t)v4 / (Count - 1);
    if (v4 <= 1)
      v5 = 1;
    else
      v5 = v4;
    v6 = 8 * Count;
    v7 = (const void **)((char *)v13 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v7, 8 * Count);
    v8 = v7;
    bzero(v7, v6);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8), v7, v7);
    if (v3 >= 1)
    {
      do
      {
        v9 = *(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 8);
        v10 = *v7;
        v11 = (char *)*v8 - v5;
        *v8 = v11;
        if ((uint64_t)v11 < 0)
          CFDictionaryRemoveValue(v9, v10);
        else
          CFDictionarySetValue(v9, v10, v11);
        ++v7;
        ++v8;
        --v3;
      }
      while (v3);
    }
  }
  result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

@end
