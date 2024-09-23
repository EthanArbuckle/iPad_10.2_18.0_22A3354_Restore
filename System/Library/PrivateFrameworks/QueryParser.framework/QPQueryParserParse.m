@implementation QPQueryParserParse

void __QPQueryParserParse_block_invoke(uint64_t a1, CFDictionaryRef theDict)
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
