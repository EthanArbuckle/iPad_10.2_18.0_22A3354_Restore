@implementation UITabElementGroup

BOOL __35___UITabElementGroup__setChildren___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

uint64_t __35___UITabElementGroup__setChildren___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  if (objc_msgSend(v3, "_isElement"))
  {
    objc_msgSend(v3, "_identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      v9 = 1;
    }
    else
    {
      v9 = 0;
      if (v6 && v7)
        v9 = objc_msgSend(v6, "isEqual:", v7);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __54___UITabElementGroup__orderedChildrenForDisplayOrder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __42___UITabElementGroup__defaultChildElement__block_invoke(_QWORD *a1, void *a2, uint64_t a3, char *a4)
{
  void *v7;
  int v8;
  char v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "_identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

  if (v8)
  {
    if (objc_msgSend(v10, "_isElement") && objc_msgSend(v10, "_isVisible"))
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40)
    && objc_msgSend(v10, "_isElement")
    && objc_msgSend(v10, "_isVisible"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
  }
  v9 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v9)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      v9 = 1;
    else
      v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) != 0;
  }
  *a4 = v9;

}

uint64_t __37___UITabElementGroup__isCustomizable__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "_isCustomizable");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __54___UITabElementGroup__filteredDisplayOrderIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
