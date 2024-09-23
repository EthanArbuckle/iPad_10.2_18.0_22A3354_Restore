@implementation UITextFieldEditingProcessor

void __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  __int128 v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke_2;
  v14[3] = &unk_1E16E62B8;
  v15 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  v16 = v5;
  v17 = v6;
  v13 = v5;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, v14);
  v7 = objc_opt_respondsToSelector();
  v8 = v13;
  if ((v7 & 1) != 0)
  {
    v9 = v13;
    objc_msgSend(v9, "defaultAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "overridingEditingAttributesForAttributes:withOverrides:", v10, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      if (v10)
      {
        v12 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v12, "addEntriesFromDictionary:", v11);
        objc_msgSend(v9, "setDefaultAttributes:", v12);

      }
      else
      {
        objc_msgSend(v9, "setDefaultAttributes:", v11);
      }
      objc_msgSend(*(id *)(a1 + 48), "setRestoreDefaultAttributes:", 1);
    }

    v8 = v13;
  }
  if (!objc_msgSend(v8, "length"))
    objc_msgSend(*(id *)(a1 + 48), "setRestoreTextAttributes:", 1);

}

void __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "overridingEditingAttributesForAttributes:withOverrides:", a2, *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v7, a3, a4);
  objc_msgSend(*(id *)(a1 + 56), "setRestoreTextAttributes:", 1);

}

@end
