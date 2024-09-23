@implementation NSDictionary

void __62__NSDictionary_RunningBoard__entriesToStringWithIndent_debug___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  int v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  char isKindOfClass;
  void *v14;
  int v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = *(_DWORD *)(a1 + 40);
    if (v7 >= 8)
      v7 = 8;
    v8 = &_indentPrefix_tabs[8 - v7];
    v9 = v25;
    objc_msgSend(v6, "appendFormat:", CFSTR("%s%@={\n"), v8, v5);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v9, "entriesToStringWithIndent:debug:", (*(_DWORD *)(a1 + 40) + 1), *(unsigned __int8 *)(a1 + 44));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v11);
    v12 = *(_DWORD *)(a1 + 40);
    if (v12 >= 8)
      v12 = 8;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("%s}\n"), &_indentPrefix_tabs[8 - v12], v22, v24);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v15 = *(_DWORD *)(a1 + 40);
    if (v15 >= 8)
      v15 = 8;
    v16 = &_indentPrefix_tabs[8 - v15];
    if ((isKindOfClass & 1) != 0)
    {
      v17 = v25;
      objc_msgSend(v14, "appendFormat:", CFSTR("%s%@=[\n"), v16, v5);
      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      -[NSArray elementsToString:debug:](v17, *(_DWORD *)(a1 + 40) + 1, *(_BYTE *)(a1 + 44));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "appendFormat:", CFSTR("%@"), v19);
      v20 = *(_DWORD *)(a1 + 40);
      if (v20 >= 8)
        v20 = 8;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("%s]\n"), &_indentPrefix_tabs[8 - v20], v23, v24);
    }
    else if (*(_BYTE *)(a1 + 44))
    {
      objc_msgSend(v14, "appendFormat:", CFSTR("%s%@=\"%@\"\n"), v16, v5, v25);
    }
    else
    {
      objc_msgSend(v25, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendFormat:", CFSTR("%s%@=\"%@\"\n"), v16, v5, v21);

    }
  }

}

@end
