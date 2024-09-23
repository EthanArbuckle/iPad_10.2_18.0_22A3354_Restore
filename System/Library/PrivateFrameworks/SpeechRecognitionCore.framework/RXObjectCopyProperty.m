@implementation RXObjectCopyProperty

void *__RXObjectCopyProperty_block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeID v3;
  CFTypeID TypeID;
  const __CFString *v5;
  int v6;
  void *result;
  CFTypeID v8;
  CFTypeID v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = CFGetTypeID(v2);
    TypeID = CFStringGetTypeID();
    v5 = *(const __CFString **)(a1 + 40);
    if (v3 == TypeID)
    {
      v6 = *(_DWORD *)(a1 + 48);
LABEL_7:
      result = (void *)RXCopyLocaleProperty(v5, v6);
      goto LABEL_12;
    }
    v8 = CFGetTypeID(v5);
    v9 = CFLocaleGetTypeID();
    v10 = *(_QWORD *)(a1 + 40);
    if (v8 == v9)
    {
      v11 = *(_DWORD *)(a1 + 48);
      v5 = (const __CFString *)MEMORY[0x2207B863C](v10);
      v6 = v11;
      goto LABEL_7;
    }
    if (v10)
      v12 = v10 + 16;
    else
      v12 = 0;
    result = (void *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v12 + 64))(v12, *(unsigned int *)(a1 + 48));
  }
  else
  {
    result = RXCopyGlobalProperty((RXXPC *)*(unsigned int *)(a1 + 48));
  }
LABEL_12:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
