@implementation UIButtonUpdateStringAttributes

void ___UIButtonUpdateStringAttributes_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = *(_QWORD *)off_1E1678D90;
  v19 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  _UIButtonCombineDictionaries(*(void **)(a1 + 40), v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10 != v11)
  {
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v8);

    v13 = v14;
  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
  {
    v16 = *(void **)(a1 + 40);
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UIButtonCombineDictionaries(v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v18;
  }
  objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v13, a3, a4);

}

void ___UIButtonUpdateStringAttributes_block_invoke_0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  _UIButtonCombineDictionaries(*(void **)(a1 + 32), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    v10 = (id)v3;
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = v5;
  }
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v11 = (id)v3;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIButtonCombineDictionaries(v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = v9;
  }
  v12 = (id)v3;
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:");

}

@end
