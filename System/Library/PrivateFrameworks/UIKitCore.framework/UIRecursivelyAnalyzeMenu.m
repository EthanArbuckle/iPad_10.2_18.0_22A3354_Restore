@implementation UIRecursivelyAnalyzeMenu

uint64_t ___UIRecursivelyAnalyzeMenu_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = _UIRecursivelyAnalyzeMenu();
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  return v4;
}

uint64_t ___UIRecursivelyAnalyzeMenu_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  unint64_t v19;
  NSObject *v20;
  id v21;
  unint64_t v22;
  NSObject *v23;
  const char *v24;
  unint64_t v25;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "action");
  objc_msgSend(v3, "propertyList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectForAction:propertyList:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v3;
    else
      v11 = 0;
    v12 = v11;
    if (!v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forAction:propertyList:", *(_QWORD *)(a1 + 32), v4, v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forAction:propertyList:", v3, v4, v5);
      v7 = 0;
      v10 = 1;
      goto LABEL_35;
    }
    v13 = v12;
    objc_msgSend(v12, "input");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {

    }
    else
    {
      objc_msgSend(v13, "_keyCodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v21 = v13;
        v25 = qword_1ECD7F900;
        if (!qword_1ECD7F900)
        {
          v25 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v25, (unint64_t *)&qword_1ECD7F900);
        }
        v23 = *(NSObject **)(v25 + 8);
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        v27 = 136315394;
        v24 = "input";
        goto LABEL_31;
      }
    }
    if (objc_msgSend(v13, "action"))
    {
      objc_msgSend(**(id **)(a1 + 40), "member:", v13);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forAction:propertyList:", *(_QWORD *)(a1 + 32), v4, v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forAction:propertyList:", v3, v4, v5);
        objc_msgSend(**(id **)(a1 + 40), "addObject:", v13);
        v10 = 1;
LABEL_34:
        v7 = (char *)v3;
        goto LABEL_35;
      }
      v17 = (void *)v16;
      v18 = v13;
      v19 = _MergedGlobals_1193;
      if (!_MergedGlobals_1193)
      {
        v19 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v19, (unint64_t *)&_MergedGlobals_1193);
      }
      v20 = *(NSObject **)(v19 + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v27 = 138412546;
        v28 = v18;
        v29 = 2112;
        v30 = v17;
        _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Menu has duplicates --\n%@\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v27, 0x16u);
      }

LABEL_33:
      v10 = 0;
      goto LABEL_34;
    }
    v21 = v13;
    v22 = qword_1ECD7F900;
    if (!qword_1ECD7F900)
    {
      v22 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&qword_1ECD7F900);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

      goto LABEL_33;
    }
    v27 = 136315394;
    v24 = "action";
LABEL_31:
    v28 = v24;
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Command %s is nil --\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v27, 0x16u);
    goto LABEL_32;
  }
  v7 = (char *)v3;
  v8 = _MergedGlobals_1193;
  if (!_MergedGlobals_1193)
  {
    v8 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&_MergedGlobals_1193);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v27 = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Menu has duplicates --\n%@\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v27, 0x16u);
  }
  v10 = 0;
LABEL_35:

  return v10;
}

BOOL ___UIRecursivelyAnalyzeMenu_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v3;
    v7 = _MergedGlobals_1193;
    if (!_MergedGlobals_1193)
    {
      v7 = __UILogCategoryGetNode("MenuBuilder", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_MergedGlobals_1193);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Menu has duplicates --\n%@\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v3, v4);
  }

  return v5 == 0;
}

@end
