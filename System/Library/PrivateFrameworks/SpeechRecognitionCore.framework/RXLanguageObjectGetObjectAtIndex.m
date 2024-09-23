@implementation RXLanguageObjectGetObjectAtIndex

uint64_t __RXLanguageObjectGetObjectAtIndex_block_invoke(_QWORD *a1)
{
  unint64_t v2;
  uint64_t v3;
  RXLanguageObject *v4;
  uint64_t result;
  RXLanguageObject *v6;

  v2 = a1[5];
  v3 = a1[6];
  if (v2 || (v3 ? (v4 = (RXLanguageObject *)(v3 + 16)) : (v4 = 0), (result = RXLanguageObject::GetCount(v4)) != 0))
  {
    if (v3)
      v6 = (RXLanguageObject *)(v3 + 16);
    else
      v6 = 0;
    result = RXLanguageObject::GetObject(v6, v2);
  }
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
