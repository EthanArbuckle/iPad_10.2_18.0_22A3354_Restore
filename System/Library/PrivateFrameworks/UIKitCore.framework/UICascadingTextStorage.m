@implementation UICascadingTextStorage

void __48___UICascadingTextStorage_setDefaultAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 312);
  *(_QWORD *)(v3 + 312) = v2;

}

uint64_t __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v9;

  v4 = *(_QWORD *)off_1E1678D98;
  v5 = *(id *)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  if (v5)
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  else
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("_UICascadingTextStorage.m"), 275, CFSTR("color argument was nil and [UIColor blackColor] failed!"));

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "setObject:forKey:");
}

uint64_t __55___UICascadingTextStorage_Accessors__setLineBreakMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v9;

  v4 = *(_QWORD *)off_1E1678F98;
  v5 = *(id *)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  if (v5)
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  else
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("_UICascadingTextStorage.m"), 330, CFSTR("failed to generate newParagraphStyle"));

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "setObject:forKey:");
}

uint64_t __46___UICascadingTextStorage_Accessors__setFont___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v9;

  v4 = *(_QWORD *)off_1E1678D90;
  v5 = *(id *)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  if (v5)
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  else
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("_UICascadingTextStorage.m"), 170, CFSTR("font setting has failed in a bad way"));

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "setObject:forKey:");
}

uint64_t __55___UICascadingTextStorage_Accessors__setTextAlignment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v9;

  v4 = *(_QWORD *)off_1E1678F98;
  v5 = *(id *)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  if (v5)
    objc_msgSend(v6, "addAttribute:value:range:", v4, v5, 0, v7);
  else
    objc_msgSend(v6, "removeAttribute:range:", v4, 0, v7);

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("_UICascadingTextStorage.m"), 308, CFSTR("failed to generate newParagraphStyle"));

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 312), "setObject:forKey:");
}

uint64_t __56___UICascadingTextStorage__restoreOriginalFontAttribute__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_ui_restoreOriginalFontAttributes");
}

uint64_t __49___UICascadingTextStorage_Accessors___setShadow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v8;

  v2 = *(_QWORD *)off_1E1679048;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = objc_msgSend(v5, "length");
  if (v4)
    objc_msgSend(v5, "addAttribute:value:range:", v2, v4, 0, v6);
  else
    objc_msgSend(v5, "removeAttribute:range:", v2, 0, v6);

  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("_UICascadingTextStorage.m"), 202, CFSTR("shadow argument was nil"));

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setObject:forKey:");
}

uint64_t __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)off_1E1678D98);
}

@end
