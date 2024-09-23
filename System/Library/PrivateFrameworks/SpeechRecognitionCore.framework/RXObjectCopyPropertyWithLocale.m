@implementation RXObjectCopyPropertyWithLocale

CFArrayRef __RXObjectCopyPropertyWithLocale_block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeID v3;
  uint64_t TypeID;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFArrayRef result;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = CFGetTypeID(v2);
    TypeID = RXLanguageObjectGetTypeID();
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      v6 = v5 + 16;
    else
      v6 = 0;
    v7 = *(unsigned int *)(a1 + 56);
    if (v3 == TypeID)
      result = (CFArrayRef)(*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v6 + 72))(v6, v7, *(_QWORD *)(a1 + 48));
    else
      result = (CFArrayRef)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 64))(v6, v7);
  }
  else
  {
    result = RXCopyGlobalProperty((RXXPC *)*(unsigned int *)(a1 + 56));
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
