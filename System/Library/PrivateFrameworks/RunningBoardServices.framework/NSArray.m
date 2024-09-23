@implementation NSArray

- (id)elementsToString:(char)a3 debug:
{
  id v3;
  _QWORD v7[5];
  int v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a1;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__0;
    v14 = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__NSArray_RunningBoard__elementsToString_debug___block_invoke;
    v7[3] = &unk_1E2D17368;
    v7[4] = &v10;
    v8 = a2;
    v9 = a3;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
    v3 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v3;
}

void __48__NSArray_RunningBoard__elementsToString_debug___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  char isKindOfClass;
  void *v13;
  int v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = *(_DWORD *)(a1 + 40);
    if (v6 >= 8)
      v6 = 8;
    v7 = &_indentPrefix_tabs[8 - v6];
    v8 = v24;
    objc_msgSend(v5, "appendFormat:", CFSTR("%s%lu:{\n"), v7, a3);
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v8, "entriesToStringWithIndent:debug:", (*(_DWORD *)(a1 + 40) + 1), *(unsigned __int8 *)(a1 + 44));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "appendFormat:", CFSTR("%@"), v10);
    v11 = *(_DWORD *)(a1 + 40);
    if (v11 >= 8)
      v11 = 8;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("%s}\n"), &_indentPrefix_tabs[8 - v11], v21, v23);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v14 = *(_DWORD *)(a1 + 40);
    if (v14 >= 8)
      v14 = 8;
    v15 = &_indentPrefix_tabs[8 - v14];
    if ((isKindOfClass & 1) != 0)
    {
      v16 = v24;
      objc_msgSend(v13, "appendFormat:", CFSTR("%s%lu:[\n"), v15, a3);
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      -[NSArray elementsToString:debug:](v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "appendFormat:", CFSTR("%@"), v18);
      v19 = *(_DWORD *)(a1 + 40);
      if (v19 >= 8)
        v19 = 8;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("%s]\n"), &_indentPrefix_tabs[8 - v19], v22, v23);
    }
    else if (*(_BYTE *)(a1 + 44))
    {
      objc_msgSend(v13, "appendFormat:", CFSTR("%s%lu:\"%@\"\n"), v15, a3, v24);
    }
    else
    {
      objc_msgSend(v24, "debugDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendFormat:", CFSTR("%s%lu:\"%@\"\n"), v15, a3, v20);

    }
  }

}

@end
