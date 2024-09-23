@implementation TSSDebugStyleRelationshipDescription

uint64_t __TSSDebugStyleRelationshipDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = *(void **)(a1 + 32);
  v9 = (objc_class *)objc_opt_class();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@|%p|%@|"), NSStringFromClass(v9), a2, a3);
  v10 = *(void **)(a1 + 32);
  if (!a4)
    return objc_msgSend(v10, "appendString:", CFSTR("nil$"));
  objc_msgSend(v10, "appendFormat:", CFSTR("%p|"), a4);
  v11 = (void *)objc_msgSend((id)objc_msgSend(a4, "stylesheet"), "rootAncestor");
  v12 = *(void **)(a1 + 32);
  if (v11)
    return objc_msgSend(v12, "appendFormat:", CFSTR("%p|%@|%p|%p$"), objc_msgSend(a4, "stylesheet"), String((void *)objc_msgSend(a4, "stylesheet")), v11, objc_msgSend(v11, "child"));
  else
    return objc_msgSend(v12, "appendFormat:", CFSTR("|None$"));
}

uint64_t __TSSDebugStyleRelationshipDescription_block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD v7[6];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (objc_msgSend(a2, "parent"))
    (*(void (**)(_QWORD, void *, const __CFString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, CFSTR("parent"), objc_msgSend(a2, "parent"));
  v4 = (void *)objc_msgSend(a2, "propertyMap");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __TSSDebugStyleRelationshipDescription_block_invoke_3;
  v7[3] = &unk_24D82AFD0;
  v5 = *(_QWORD *)(a1 + 32);
  v7[4] = a2;
  v7[5] = v5;
  return objc_msgSend(v4, "enumeratePropertiesAndObjectsUsingBlock:", v7);
}

uint64_t __TSSDebugStyleRelationshipDescription_block_invoke_3(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!a3)
  {
    v6 = result;
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      v9 = v6 + 32;
      v7 = *(_QWORD *)(v6 + 32);
      v8 = *(_QWORD *)(v9 + 8);
      v10 = String(a2);
      return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t))(v8 + 16))(v8, v7, v10, a4);
    }
  }
  return result;
}

@end
