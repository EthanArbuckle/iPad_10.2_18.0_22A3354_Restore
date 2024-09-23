@implementation NSAttributedString

- (id)_ui_synthesizeAttributedSubstringFromRange:(uint64_t)a3 usingDefaultAttributes:(void *)a4
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  v7 = (objc_class *)MEMORY[0x1E0CB3778];
  v8 = a4;
  v9 = [v7 alloc];
  objc_msgSend(a1, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v8);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __117__NSAttributedString_NSAttributedStringAdditions___ui_synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke;
  v14[3] = &unk_1E16B1620;
  v12 = v11;
  v15 = v12;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a2, a3, 0, v14);

  return v12;
}

void __93__NSAttributedString_UIKitAdditions_Internal___ui_attributedStringAdjustedToTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678F78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13 && (objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    if (v15)
    {
      v16 = v15;
      v17 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v16;
    }
    else
    {
      v18 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678D90, v12, a3, a4);
  }

}

- (id)_ui_fontsInRange:(uint64_t)a3 usingDefaultFont:(void *)a4
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;

  v7 = a4;
  if (a1)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = 0;
    v16 = 0;
    v9 = objc_msgSend(a1, "length");
    if (v9 >= a2 + a3)
      v10 = a2 + a3;
    else
      v10 = v9;
    if (v10)
    {
      v11 = 0;
      v12 = *(_QWORD *)off_1E1678D90;
      do
      {
        objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v12, v11, &v15);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
          v13 = v7;
        objc_msgSend(v8, "addObject:", v13);
        v15 += v16;
        v16 = 0;

        v11 = v15;
      }
      while (v16 + v15 < v10);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __117__NSAttributedString_NSAttributedStringAdditions___ui_synthesizeAttributedSubstringFromRange_usingDefaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v3 = (void *)a1[6];
  v4 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "_objectWithRTFDAtURL:userInfo:error:", a2, MEMORY[0x1E0C9AA70], &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
