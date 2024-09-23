@implementation PKAttributedStringByParsingEmphasisInString

void __PKAttributedStringByParsingEmphasisInString_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, a2 - v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "appendAttributedString:", v4);

}

void __PKAttributedStringByParsingEmphasisInString_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v3 = *(_QWORD *)(a1 + 64);
  v4 = a2;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v4, "range"));
  v5 = objc_msgSend(v4, "range");
  objc_msgSend(v4, "range");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v6 + v5;
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(v4, "range");
  v10 = v9;

  objc_msgSend(v7, "substringWithRange:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "characterAtIndex:", 1);
  if (v12 == 42 || v12 == 95)
  {
    objc_msgSend(v11, "substringWithRange:", 2, objc_msgSend(v11, "length") - 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v15 = *(void **)(a1 + 48);
  }
  else
  {
    objc_msgSend(v11, "substringWithRange:", 1, objc_msgSend(v11, "length") - 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v15 = *(void **)(a1 + 40);
  }
  v16 = (void *)objc_msgSend(v15, "copy");
  v17 = (id)objc_msgSend(v14, "initWithString:attributes:", v13, v16);

  objc_msgSend(*(id *)(a1 + 56), "appendAttributedString:", v17);
}

@end
