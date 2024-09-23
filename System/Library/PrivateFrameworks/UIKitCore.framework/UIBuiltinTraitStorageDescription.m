@implementation UIBuiltinTraitStorageDescription

unint64_t ___UIBuiltinTraitStorageDescription_block_invoke(uint64_t a1, unint64_t *a2, void *a3, uint64_t a4)
{
  unint64_t result;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  result = *a2;
  if (*a2 != a4)
  {
    v8 = _UIBuiltinTraitStorageDescriptionForIntegerTraitName(result, a3);
    v9 = *(void **)(a1 + 32);
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = _UIDescriptionForTraitName(a3);
    if (v8)
      v12 = objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %@"), v11, v8);
    else
      v12 = objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ = %ld"), v11, *a2);
    return objc_msgSend(v9, "addObject:", v12);
  }
  return result;
}

uint64_t ___UIBuiltinTraitStorageDescription_block_invoke_3(uint64_t result, _QWORD *a2, void *a3, double a4)
{
  if (*(double *)a2 != a4)
    return objc_msgSend(*(id *)(result + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %g"), _UIDescriptionForTraitName(a3), *a2));
  return result;
}

uint64_t ___UIBuiltinTraitStorageDescription_block_invoke_2(uint64_t result, _QWORD *a2, void *a3, uint64_t a4)
{
  if (*a2 != a4)
    return objc_msgSend(*(id *)(result + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %ld"), _UIDescriptionForTraitName(a3), *a2));
  return result;
}

@end
