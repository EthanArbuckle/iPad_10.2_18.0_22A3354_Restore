@implementation ZN2QP8U2Parser14isIntentUnsafeEv

const __CFDictionary *___ZN2QP8U2Parser14isIntentUnsafeEv_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFDictionary *result;
  const __CFBoolean *Value;

  result = *(const __CFDictionary **)(*(_QWORD *)a2 + 88);
  if (result)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(result, kQPQUOutputIsUnsafeKey);
    result = (const __CFDictionary *)CFBooleanGetValue(Value);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  return result;
}

@end
