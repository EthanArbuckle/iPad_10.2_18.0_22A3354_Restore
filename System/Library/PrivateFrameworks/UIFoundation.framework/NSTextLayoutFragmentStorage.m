@implementation NSTextLayoutFragmentStorage

void __91___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentFromLocation_options_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  if (!*(_BYTE *)(a1 + 40))
  {
    v11 = 0;
    goto LABEL_6;
  }
  v11 = v8;
  if (*(_BYTE *)(a1 + 41))
  {
LABEL_6:
    (*(void (**)(uint64_t, id, id, uint64_t))(v10 + 16))(v10, v9, v11, a4);
    goto LABEL_9;
  }
  objc_msgSend(v9, "textElement", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v14, "rangeInElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, uint64_t))(v10 + 16))(v10, v14, v13, a4);

  }
  else
  {
    (*(void (**)(uint64_t, id, id, uint64_t))(v10 + 16))(v10, v14, v8, a4);
  }

LABEL_9:
}

void __68___NSTextLayoutFragmentStorage_offsetDeltaForLastTextLayoutFragment__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  objc_msgSend(v13, "textElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v13, "rangeInElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "offsetFromLocation:toLocation:", v11, v12);

    *a4 = 1;
  }

}

void __55___NSTextLayoutFragmentStorage_setTextLayoutFragments___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "rangeInElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forRange:", v3, v4);

}

void __73___NSTextLayoutFragmentStorage_revalidateLayoutFragmentRangeForLocation___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a2;
  v9 = a3;
  v11 = v8;
  objc_msgSend(v11, "rangeInElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v10);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  }
  *a4 = 1;

}

id __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v6 = a3 ^ 1u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke_1;
  v11[3] = &unk_1E26039C0;
  v11[4] = &v12;
  v8 = (id)objc_msgSend(WeakRetained, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v5, v6, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __90___NSTextLayoutFragmentStorage_enumerateTextLayoutFragmentInTextRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = v7;
  v15 = v9;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v9, "rangeInElement");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v10, "location");
  else
    objc_msgSend(v10, "endLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);

  v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "compare:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56))
    v14 = -1;
  else
    v14 = 1;
  if (v13 == v14)
    *a4 = 1;
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v8 = a3;
  if ((objc_msgSend(v8, "containsLocation:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || *(_BYTE *)(a1 + 48)
    && (objc_msgSend(v8, "endLocation"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32)),
        v9,
        v10))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  *a4 = 1;

}

void __85___NSTextLayoutFragmentStorage_textLayoutFragmentForTextLocation_allowsTrailingEdge___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "containsLocation:", *(_QWORD *)(a1 + 32)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a4 = 1;

}

void __74___NSTextLayoutFragmentStorage_adjustedTextRangeWithTextRange_adjustment___block_invoke_1(uint64_t a1, int a2, id obj, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  *a4 = 1;
}

@end
