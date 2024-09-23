@implementation WRTaskingFilteredDiagnostics

void ___WRTaskingFilteredDiagnostics_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);

}

void ___WRTaskingFilteredDiagnostics_block_invoke_2(uint64_t a1, void *a2, void *a3)
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
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = &stru_251BE5608;
      goto LABEL_6;
    }
  }
LABEL_7:

}

@end
