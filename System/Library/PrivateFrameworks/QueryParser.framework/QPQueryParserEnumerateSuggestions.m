@implementation QPQueryParserEnumerateSuggestions

void __QPQueryParserEnumerateSuggestions_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFDictionary *Value;
  const __CFSet *v5;
  __CFSet *v6;
  CFDictionaryRef v7;

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, kQPSuggestionResultDescriptionKey);
  v5 = *(const __CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (Value)
  {
    if (!CFSetContainsValue(v5, Value))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v6 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v7 = Value;
LABEL_7:
      CFSetAddValue(v6, v7);
    }
  }
  else if (!CFSetContainsValue(v5, theDict))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = theDict;
    goto LABEL_7;
  }
}

void __QPQueryParserEnumerateSuggestions_block_invoke_2(uint64_t a1, CFDictionaryRef theDict, _BYTE *a3)
{
  const __CFDictionary *Value;
  const __CFSet *v7;
  __CFSet *v8;
  CFDictionaryRef v9;

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, kQPSuggestionResultDescriptionKey);
  v7 = *(const __CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (Value)
  {
    if (!CFSetContainsValue(v7, Value))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v8 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v9 = Value;
LABEL_6:
      CFSetAddValue(v8, v9);
    }
  }
  else if (!CFSetContainsValue(v7, theDict))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = theDict;
    goto LABEL_6;
  }
  *a3 = 1;
}

void __QPQueryParserEnumerateSuggestions_block_invoke_3(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFDictionary *Value;
  const __CFSet *v5;
  __CFSet *v6;
  CFDictionaryRef v7;

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, kQPParseResultDescriptionKey);
  v5 = *(const __CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (Value)
  {
    if (!CFSetContainsValue(v5, Value))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v6 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v7 = Value;
LABEL_7:
      CFSetAddValue(v6, v7);
    }
  }
  else if (!CFSetContainsValue(v5, theDict))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = theDict;
    goto LABEL_7;
  }
}

@end
