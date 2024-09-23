@implementation UIFontPickerFontInfo

uint64_t __45___UIFontPickerFontInfo__sortedFacesByWeight__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v4 = a2;
  v5 = a3;
  v6 = *(_QWORD *)off_1E167DC10;
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)off_1E167DC10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)off_1E167DC80;
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E167DC80);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);
  if (!v12)
  {
    v13 = *(_QWORD *)off_1E167DC28;
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E167DC28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "compare:", v15);
    if (!v12)
    {
      objc_msgSend(v4, "postscriptName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postscriptName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v18, "localizedStandardCompare:", v16);

    }
  }

  return v12;
}

void __45___UIFontPickerFontInfo__sortedFacesByWeight__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _UIFontPickerFontInfo *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[_UIFontPickerFontInfo initWithFontDescriptor:isSystemFont:]([_UIFontPickerFontInfo alloc], "initWithFontDescriptor:isSystemFont:", v4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 152));

  objc_msgSend(v3, "addObject:", v5);
}

uint64_t __45___UIFontPickerFontInfo__createPreviewImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "ascender");
  v4 = v2 + v3;
  objc_msgSend(*(id *)(a1 + 40), "ascender");
  v6 = v4 - v5;
  v7 = v6 + *(double *)(a1 + 80);
  if (v7 > *(double *)(a1 + 96))
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 48) + 96);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), v7, CFSTR("(?s).*\\p{Arabic}.*"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 48), "preferredShortPreviewString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithBool:", objc_msgSend(v9, "evaluateWithObject:", v11));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(void **)(v13 + 96);
      *(_QWORD *)(v13 + 96) = v12;

      v8 = *(void **)(*(_QWORD *)(a1 + 48) + 96);
    }
    if (objc_msgSend(v8, "BOOLValue", v7))
      v6 = (*(double *)(a1 + 96) - *(double *)(a1 + 80)) * 0.5;
  }
  return objc_msgSend(*(id *)(a1 + 56), "drawInRect:", (*(double *)(a1 + 88) - *(double *)(a1 + 72)) * 0.5, v6);
}

void __50___UIFontPickerFontInfo_matchesClientFontContext___block_invoke(uint64_t a1, uint64_t (**a2)(_QWORD, _QWORD), void *a3)
{
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t (**v12)(id, void *);

  v12 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = ((uint64_t (**)(_QWORD, void *))a2)[2](v6, v7);

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "fontName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {

      goto LABEL_8;
    }
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "fontName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12[2](v12, v10);

    if ((v11 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_8:

}

@end
