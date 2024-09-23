@implementation PBProperty

uint64_t __51___PBProperty_getValidPropertiesForType_withCache___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v9;
  uint64_t v10;

  if (a2)
    v5 = *(void **)(a2 + 8);
  else
    v5 = 0;
  v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("has"));
  if (a3)
    v7 = *(void **)(a3 + 8);
  else
    v7 = 0;
  if (v6 == objc_msgSend(v7, "hasPrefix:", CFSTR("has")))
  {
    if (a2)
    {
      v9 = *(void **)(a2 + 8);
      if (a3)
      {
LABEL_11:
        v10 = *(_QWORD *)(a3 + 8);
        return objc_msgSend(v9, "compare:", v10);
      }
    }
    else
    {
      v9 = 0;
      if (a3)
        goto LABEL_11;
    }
    v10 = 0;
    return objc_msgSend(v9, "compare:", v10);
  }
  if (v6)
    return 1;
  else
    return -1;
}

@end
