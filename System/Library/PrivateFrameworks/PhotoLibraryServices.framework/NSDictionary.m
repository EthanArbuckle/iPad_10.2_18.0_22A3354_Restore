@implementation NSDictionary

id __70__NSDictionary_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "allKeys");
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
  objc_msgSend(v6, "appendFormat:", CFSTR("<%@: %p> count=%lu {"), objc_opt_class(), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NSDictionary_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v14[3] = &unk_1E36683E8;
  v8 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v14[4] = v8;
  v9 = v6;
  v15 = v9;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(v9, "appendFormat:", CFSTR("\n%@}"), v10);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __70__NSDictionary_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 56) + 1;
  v4 = a2;
  objc_msgSend(v4, "_pl_prettyDescriptionWithIndent:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_pl_prettyDescriptionWithIndent:", *(_QWORD *)(a1 + 56) + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\n%@%@%@: %@"), *(_QWORD *)(a1 + 48), *MEMORY[0x1E0D74110], v7, v6);

}

@end
