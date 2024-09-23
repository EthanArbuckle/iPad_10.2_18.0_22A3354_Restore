@implementation RXLanguageObjectGetCount

uint64_t __RXLanguageObjectGetCount_block_invoke(uint64_t a1)
{
  uint64_t v2;
  RXLanguageObject *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = (RXLanguageObject *)(v2 + 16);
  else
    v3 = 0;
  result = RXLanguageObject::GetCount(v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
