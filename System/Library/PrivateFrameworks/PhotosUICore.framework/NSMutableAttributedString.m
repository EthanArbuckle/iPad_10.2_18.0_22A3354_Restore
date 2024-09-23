@implementation NSMutableAttributedString

void __98__NSMutableAttributedString_PhotosUICore__px_replaceFontWithFontDescriptor_keepingSymbolicTraits___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = v16;
    v10 = v9;
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_5;
    objc_msgSend(v9, "fontDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_DWORD *)(a1 + 48) & objc_msgSend(v11, "symbolicTraits");

    v13 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(*(id *)(a1 + 32), "fontDescriptorWithSymbolicTraits:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontWithDescriptor:size:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v15, a3, a4);

    }
    else
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E0DC1138], a3, a4);
    }

    v8 = v16;
  }

}

@end
