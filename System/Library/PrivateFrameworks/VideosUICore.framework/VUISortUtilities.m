@implementation VUISortUtilities

uint64_t __48__VUISortUtilities_ascendingTitleSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", 0));
      v8 = objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));
      if (v7 && v8)
      {
        v9 = objc_msgSend(v5, "compare:options:", v6, 65);
      }
      else if (v7)
      {
        v9 = -1;
      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)ascendingTitleSortComparator
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__VUISortUtilities_ascendingTitleSortComparator__block_invoke;
  v7[3] = &unk_1E9F2BCC0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x1DF08E588](v7);
  v5 = (void *)MEMORY[0x1DF08E588]();

  return v5;
}

+ (id)ascendingDateSortComparatorWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__VUISortUtilities_ascendingDateSortComparatorWithBlock___block_invoke;
  v8[3] = &unk_1E9F2BC70;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1DF08E588](v8);
  v6 = (void *)MEMORY[0x1DF08E588]();

  return v6;
}

uint64_t __57__VUISortUtilities_ascendingDateSortComparatorWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v9)
      v10 = objc_msgSend(v8, "compare:", v9);
    else
      v10 = -1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (id)descendingDateSortComparatorWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__VUISortUtilities_descendingDateSortComparatorWithBlock___block_invoke;
  v12[3] = &unk_1E9F2BC98;
  v13 = v4;
  v14 = a1;
  v5 = v4;
  v6 = (void *)MEMORY[0x1DF08E588](v12);
  v10 = (void *)MEMORY[0x1DF08E588](v6, v7, v8, v9);

  return v10;
}

uint64_t __58__VUISortUtilities_descendingDateSortComparatorWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "ascendingDateSortComparatorWithBlock:", v6);
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v8, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 1;
  if (v10 == 1)
    v14 = -1;
  else
    v14 = v10;
  if (v10 != -1)
    v13 = v14;
  if (v11)
    v15 = v12 == 0;
  else
    v15 = 1;
  if (v15)
    v16 = v10;
  else
    v16 = v13;

  return v16;
}

+ (id)titleSortComparatorWithAscending:(BOOL)a3
{
  if (a3)
    objc_msgSend(a1, "ascendingTitleSortComparator");
  else
    objc_msgSend(a1, "descendingTitleSortComparator");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)descendingTitleSortComparator
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__VUISortUtilities_descendingTitleSortComparator__block_invoke;
  v5[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
  v5[4] = a1;
  v2 = (void *)MEMORY[0x1DF08E588](v5, a2);
  v3 = (void *)MEMORY[0x1DF08E588]();

  return v3;
}

uint64_t __49__VUISortUtilities_descendingTitleSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "ascendingTitleSortComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id, id))v7)[2](v7, v6, v5);

  if (v8 == 1)
    v9 = -1;
  else
    v9 = v8;
  if (v8 == -1)
    return 1;
  else
    return v9;
}

+ (int64_t)comparisonResultForObject1:(id)a3 object2:(id)a4 withComparators:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v10, "firstObject");
    v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", 1, v12 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = ((uint64_t (**)(_QWORD, id, id))v13)[2](v13, v8, v9);
    if (!v15)
    {
      if (objc_msgSend(v14, "count"))
        v15 = objc_msgSend(a1, "comparisonResultForObject1:object2:withComparators:", v8, v9, v14);
      else
        v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
