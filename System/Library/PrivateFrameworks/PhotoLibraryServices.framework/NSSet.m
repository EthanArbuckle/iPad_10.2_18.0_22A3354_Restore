@implementation NSSet

uint64_t __51__NSSet_PLAdditions__pl_countOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

id __63__NSSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  void *v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLIndentToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("<%@: %p> count=%lu ["), objc_opt_class(), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "count"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__NSSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v13[3] = &unk_1E3671698;
  v16 = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v7;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend(v8, "appendFormat:", CFSTR("\n%@]"), v9);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __63__NSSet_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "_pl_prettyDescriptionWithIndent:", *(_QWORD *)(a1 + 48) + 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n%@%@%@"), *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D74110], v3);

}

id __39__NSSet_PhotoLibraryServices___pl_map___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "_pl_map:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __42__NSSet_PhotoLibraryServices___pl_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
