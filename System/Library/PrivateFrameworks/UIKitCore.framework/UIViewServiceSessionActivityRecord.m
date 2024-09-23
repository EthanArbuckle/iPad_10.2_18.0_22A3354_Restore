@implementation UIViewServiceSessionActivityRecord

void __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6[2] = __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  void *v24;
  __CFString *v25;
  id v26;
  unint64_t v27;
  const __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  int8x16_t v38;
  _QWORD v39[4];
  int8x16_t v40;

  v2 = *(void **)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>"), v6, v3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(nil)");
  }

  v8 = (id)objc_msgSend(v2, "appendObject:withName:", v7, CFSTR("tracker"));
  v9 = *(void **)(a1 + 32);
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("(nil)");
  }

  v15 = (id)objc_msgSend(v9, "appendObject:withName:", v14, CFSTR("primaryHostedWindow"));
  v16 = *(void **)(a1 + 32);
  _NSStringFromUIUserInterfaceIdiom(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v16, "appendObject:withName:", v17, CFSTR("idiom"));

  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("hasInvalidated"));
  v20 = *(void **)(a1 + 32);
  v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v24, v21);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = CFSTR("(nil)");
  }

  v26 = (id)objc_msgSend(v20, "appendObject:withName:", v25, CFSTR("lastActivityProvider"));
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
  if (v27 > 4)
    v28 = &stru_1E16EDF20;
  else
    v28 = off_1E16B48E8[v27];
  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v28, CFSTR("lastActivity"));
  v30 = *(void **)(a1 + 32);
  _NSStringFromUIViewControllerAppearState(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 20));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v30, "appendObject:withName:", v31, CFSTR("lastAppearState"));

  v33 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("lastActivityTimestamp"));
  v34 = *(_QWORD *)(a1 + 40);
  if (v34)
  {
    if (objc_msgSend(*(id *)(v34 + 8), "count"))
    {
      v35 = *(void **)(a1 + 32);
      objc_msgSend(v35, "activeMultilinePrefix");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3;
      v39[3] = &unk_1E16B1B50;
      v38 = *(int8x16_t *)(a1 + 32);
      v37 = (id)v38.i64[0];
      v40 = vextq_s8(v38, v38, 8uLL);
      objc_msgSend(v35, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("allActivityWindows"), v36, v39);

    }
  }
}

void __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        if (v7)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = v7;
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v10, (_QWORD)v15);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = CFSTR("(nil)");
        }
        v14 = (id)objc_msgSend(v8, "appendObject:withName:", v13, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

@end
