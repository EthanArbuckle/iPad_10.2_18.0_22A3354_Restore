@implementation WRTaskingFilteredSignposts

void ___WRTaskingFilteredSignposts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  __CFString *v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("diagnostics")))
  {
    _WRTaskingFilteredDiagnostics(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    v10 = CFSTR("diagnostics");
LABEL_6:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v5, "isEqual:", v7) & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v11;
    goto LABEL_6;
  }
LABEL_7:

}

void ___WRTaskingFilteredSignposts_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (const __CFString *)&unk_251BE8BC0;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = &stru_251BE5608;
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (const __CFString *)MEMORY[0x24BDBD1A8];
      goto LABEL_8;
    }
  }
LABEL_9:

}

@end
