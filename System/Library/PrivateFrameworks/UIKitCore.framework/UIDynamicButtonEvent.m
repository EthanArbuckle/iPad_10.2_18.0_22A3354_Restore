@implementation UIDynamicButtonEvent

id __61___UIDynamicButtonEvent__appendSimpleDescriptionToFormatter___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("dynamicButtonForDispatch"));
}

uint64_t __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t result;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("dynamicButtonForDispatch"));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "count");
  if (result)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_3;
    v5[3] = &unk_1E16B1B50;
    v4 = *(int8x16_t *)(a1 + 32);
    v6 = vextq_s8(v4, v4, 8uLL);
    return objc_msgSend((id)v4.i64[0], "appendBodySectionWithName:block:", CFSTR("dynamicButtons"), v5);
  }
  return result;
}

void __52___UIDynamicButtonEvent__appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v4);

}

void __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_2(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  int8x16_t v8;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(*(id *)(a1[2].i64[1] + 136), "succinctDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("dynamicButtonForDispatch"));

  if (objc_msgSend(*(id *)(a1[2].i64[1] + 128), "count"))
  {
    v5 = (void *)a1[2].i64[0];
    objc_msgSend(v5, "activeMultilinePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_3;
    v7[3] = &unk_1E16B1B50;
    v8 = vextq_s8(a1[2], a1[2], 8uLL);
    objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("dynamicButtons"), v6, v7);

  }
}

void __53___UIDynamicButtonEvent__appendDescriptionToBuilder___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "succinctDescription", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  int8x16_t v17;
  int8x16_t v18;
  _QWORD v19[4];
  int8x16_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  int8x16_t v25;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(*(id *)(a1[2].i64[1] + 136), "succinctDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("dynamicButtonForDispatch"));

  v5 = objc_msgSend(*(id *)(a1[2].i64[1] + 120), "count");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = (void *)a1[2].i64[0];
    objc_msgSend(v7, "activeMultilinePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v24[3] = &unk_1E16B1B50;
    v17 = a1[2];
    v9 = (id)v17.i64[0];
    v25 = vextq_s8(v17, v17, 8uLL);
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("dynamicButtonsByWindow"), v8, v24);

  }
  if (objc_msgSend(*(id *)(a1[2].i64[1] + 128), "count", *(_OWORD *)&v17))
  {
    v10 = (void *)a1[2].i64[0];
    objc_msgSend(v10, "activeMultilinePrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v21[3] = &unk_1E16B1B50;
    v12 = (id)a1[2].i64[0];
    v13 = a1[2].i64[1];
    v22 = v12;
    v23 = v13;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("dynamicButtons"), v11, v21);

    v14 = (void *)a1[2].i64[0];
    objc_msgSend(v14, "activeMultilinePrefix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_5;
    v19[3] = &unk_1E16B1B50;
    v18 = a1[2];
    v16 = (id)v18.i64[0];
    v20 = vextq_s8(v18, v18, 8uLL);
    objc_msgSend(v14, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("deliveryTables"), v15, v19);

  }
}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  id v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (objc_class *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p; count: %lu>"),
          class_getName(v5),
          v4,
          objc_msgSend(v4, "count"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(a1 + 40);
        if (v3)
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = v3;
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = CFSTR("(nil)");
        }
        v13 = (id)objc_msgSend(v7, "appendObject:withName:", v6, v12);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v16);
  }

}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 128);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __63___UIDynamicButtonEvent_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 40);
        if (v6)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = v6;
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v10);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = CFSTR("(nil)");
        }
        v14 = (id)objc_msgSend(v8, "appendObject:withName:", v7, v13);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

@end
