@implementation ICTTFont(UI)

+ (id)convertFont:()UI toBold:toItalic:
{
  id v7;
  void *v8;
  char v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = a3;
  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "symbolicTraits");
  if (a4)
    v10 = 2;
  else
    v10 = 0;
  if (((v9 & 2) == 0) == a4 || ((((v9 & 1) == 0) ^ a5) & 1) == 0)
  {
    v11 = v10 | a5;
    objc_msgSend(v7, "fontDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", v11 | objc_msgSend(v13, "symbolicTraits"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v7, "pointSize");
    objc_msgSend(v15, "fontWithDescriptor:size:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v16;
  }

  return v7;
}

+ (void)font:()UI isBold:isItalic:
{
  id v7;

  objc_msgSend(a3, "fontDescriptor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = (objc_msgSend(v7, "symbolicTraits") & 2) != 0;
  *a5 = objc_msgSend(v7, "symbolicTraits") & 1;

}

- (uint64_t)nativeFontForStyle:()UI
{
  return objc_msgSend(a1, "nativeFontForStyle:contentSizeCategory:isForPrint:", a3, 0, 0);
}

- (id)nativeFontForStyle:()UI contentSizeCategory:isForPrint:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  unsigned int v29;
  char v30;
  void *v31;
  _BOOL4 v32;
  id v33;

  v8 = a4;
  objc_msgSend(a1, "nativeFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pointSize");
  if (!v9)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForStyle:contentSizeCategory:isForPrint:", a3, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 <= 0.0 || (_DWORD)a5 != 0)
    {
      objc_msgSend(v12, "pointSize");
      v11 = v15;
    }
    objc_msgSend(a1, "fontName");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(a1, "fontName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("."));

      if ((v19 & 1) == 0)
      {
        v20 = (void *)MEMORY[0x1E0DC1350];
        objc_msgSend(a1, "fontName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fontWithName:size:", v21, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          goto LABEL_27;
      }
    }
    if ((_DWORD)a3 == 4)
      v23 = 4;
    else
      v23 = 3;
    objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForStyle:contentSizeCategory:isForPrint:", v23, v8, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v24;
    if (v11 > 0.0)
    {
      objc_msgSend(v24, "fontWithSize:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = v25;

        v22 = v27;
      }

    }
    v28 = objc_msgSend(a1, "fontHints");
    v29 = objc_msgSend(a1, "fontHints");
    v30 = v29;
    objc_msgSend(MEMORY[0x1E0D63C68], "convertFont:toBold:toItalic:", v22, v28 & 1, (v29 >> 1) & 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 != 0;
    if ((v28 & 1) == 0)
      v32 = 1;
    if (!v32)
      v31 = 0;
    if (!v32 && (v30 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D63C68], "convertFont:toBold:toItalic:", v22, 1, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0D63C68], "convertFont:toBold:toItalic:", v22, 0, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v31)
    {
LABEL_27:
      objc_msgSend(v22, "ic_fontWithSingleLineA");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "setNativeFont:", v9);
      goto LABEL_28;
    }
LABEL_26:
    v33 = v31;

    v22 = v33;
    goto LABEL_27;
  }
LABEL_28:

  return v9;
}

@end
